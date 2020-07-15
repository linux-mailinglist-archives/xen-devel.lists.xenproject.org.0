Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F26220A4D
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:40:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvepu-0001yt-Lo; Wed, 15 Jul 2020 10:40:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveps-0001yn-OI
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:40:24 +0000
X-Inumbo-ID: 95feb65c-c687-11ea-93b5-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95feb65c-c687-11ea-93b5-12813bfff9fa;
 Wed, 15 Jul 2020 10:40:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97A66B1F7;
 Wed, 15 Jul 2020 10:40:25 +0000 (UTC)
Subject: [PATCH 5/8] bitmap: move to/from xenctl_bitmap conversion helpers
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
Message-ID: <5835147f-8428-1d74-7d6e-bbb5522289c7@suse.com>
Date: Wed, 15 Jul 2020 12:40:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3375cacd-d3b7-9f06-44a7-4b684b6a77d6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

A subsequent change will exclude domctl.c from getting built for a
particular configuration, yet the two functions get used from elsewhere.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -9,6 +9,9 @@
 #include <xen/errno.h>
 #include <xen/bitmap.h>
 #include <xen/bitops.h>
+#include <xen/cpumask.h>
+#include <xen/domain.h>
+#include <xen/guest_access.h>
 #include <asm/byteorder.h>
 
 /*
@@ -384,3 +387,87 @@ void bitmap_byte_to_long(unsigned long *
 }
 
 #endif
+
+int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
+                            const unsigned long *bitmap, unsigned int nbits)
+{
+    unsigned int guest_bytes, copy_bytes, i;
+    uint8_t zero = 0;
+    int err = 0;
+    uint8_t *bytemap = xmalloc_array(uint8_t, (nbits + 7) / 8);
+
+    if ( !bytemap )
+        return -ENOMEM;
+
+    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
+    copy_bytes  = min_t(unsigned int, guest_bytes, (nbits + 7) / 8);
+
+    bitmap_long_to_byte(bytemap, bitmap, nbits);
+
+    if ( copy_bytes != 0 )
+        if ( copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
+            err = -EFAULT;
+
+    for ( i = copy_bytes; !err && i < guest_bytes; i++ )
+        if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )
+            err = -EFAULT;
+
+    xfree(bytemap);
+
+    return err;
+}
+
+int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
+                            const struct xenctl_bitmap *xenctl_bitmap,
+                            unsigned int nbits)
+{
+    unsigned int guest_bytes, copy_bytes;
+    int err = 0;
+    uint8_t *bytemap = xzalloc_array(uint8_t, (nbits + 7) / 8);
+
+    if ( !bytemap )
+        return -ENOMEM;
+
+    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
+    copy_bytes  = min_t(unsigned int, guest_bytes, (nbits + 7) / 8);
+
+    if ( copy_bytes != 0 )
+    {
+        if ( copy_from_guest(bytemap, xenctl_bitmap->bitmap, copy_bytes) )
+            err = -EFAULT;
+        if ( (xenctl_bitmap->nr_bits & 7) && (guest_bytes == copy_bytes) )
+            bytemap[guest_bytes-1] &= ~(0xff << (xenctl_bitmap->nr_bits & 7));
+    }
+
+    if ( !err )
+        bitmap_byte_to_long(bitmap, bytemap, nbits);
+
+    xfree(bytemap);
+
+    return err;
+}
+
+int cpumask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_cpumap,
+                             const cpumask_t *cpumask)
+{
+    return bitmap_to_xenctl_bitmap(xenctl_cpumap, cpumask_bits(cpumask),
+                                   nr_cpu_ids);
+}
+
+int xenctl_bitmap_to_cpumask(cpumask_var_t *cpumask,
+                             const struct xenctl_bitmap *xenctl_cpumap)
+{
+    int err = 0;
+
+    if ( alloc_cpumask_var(cpumask) ) {
+        err = xenctl_bitmap_to_bitmap(cpumask_bits(*cpumask), xenctl_cpumap,
+                                      nr_cpu_ids);
+        /* In case of error, cleanup is up to us, as the caller won't care! */
+        if ( err )
+            free_cpumask_var(*cpumask);
+    }
+    else
+        err = -ENOMEM;
+
+    return err;
+}
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -34,91 +34,6 @@
 
 static DEFINE_SPINLOCK(domctl_lock);
 
-static int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
-                                   const unsigned long *bitmap,
-                                   unsigned int nbits)
-{
-    unsigned int guest_bytes, copy_bytes, i;
-    uint8_t zero = 0;
-    int err = 0;
-    uint8_t *bytemap = xmalloc_array(uint8_t, (nbits + 7) / 8);
-
-    if ( !bytemap )
-        return -ENOMEM;
-
-    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
-    copy_bytes  = min_t(unsigned int, guest_bytes, (nbits + 7) / 8);
-
-    bitmap_long_to_byte(bytemap, bitmap, nbits);
-
-    if ( copy_bytes != 0 )
-        if ( copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
-            err = -EFAULT;
-
-    for ( i = copy_bytes; !err && i < guest_bytes; i++ )
-        if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )
-            err = -EFAULT;
-
-    xfree(bytemap);
-
-    return err;
-}
-
-int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
-                            const struct xenctl_bitmap *xenctl_bitmap,
-                            unsigned int nbits)
-{
-    unsigned int guest_bytes, copy_bytes;
-    int err = 0;
-    uint8_t *bytemap = xzalloc_array(uint8_t, (nbits + 7) / 8);
-
-    if ( !bytemap )
-        return -ENOMEM;
-
-    guest_bytes = (xenctl_bitmap->nr_bits + 7) / 8;
-    copy_bytes  = min_t(unsigned int, guest_bytes, (nbits + 7) / 8);
-
-    if ( copy_bytes != 0 )
-    {
-        if ( copy_from_guest(bytemap, xenctl_bitmap->bitmap, copy_bytes) )
-            err = -EFAULT;
-        if ( (xenctl_bitmap->nr_bits & 7) && (guest_bytes == copy_bytes) )
-            bytemap[guest_bytes-1] &= ~(0xff << (xenctl_bitmap->nr_bits & 7));
-    }
-
-    if ( !err )
-        bitmap_byte_to_long(bitmap, bytemap, nbits);
-
-    xfree(bytemap);
-
-    return err;
-}
-
-int cpumask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_cpumap,
-                             const cpumask_t *cpumask)
-{
-    return bitmap_to_xenctl_bitmap(xenctl_cpumap, cpumask_bits(cpumask),
-                                   nr_cpu_ids);
-}
-
-int xenctl_bitmap_to_cpumask(cpumask_var_t *cpumask,
-                             const struct xenctl_bitmap *xenctl_cpumap)
-{
-    int err = 0;
-
-    if ( alloc_cpumask_var(cpumask) ) {
-        err = xenctl_bitmap_to_bitmap(cpumask_bits(*cpumask), xenctl_cpumap,
-                                      nr_cpu_ids);
-        /* In case of error, cleanup is up to us, as the caller won't care! */
-        if ( err )
-            free_cpumask_var(*cpumask);
-    }
-    else
-        err = -ENOMEM;
-
-    return err;
-}
-
 static int nodemask_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_nodemap,
                                      const nodemask_t *nodemask)
 {
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -30,6 +30,8 @@ void arch_get_domain_info(const struct d
 int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
                             const struct xenctl_bitmap *xenctl_bitmap,
                             unsigned int nbits);
+int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
+                            const unsigned long *bitmap, unsigned int nbits);
 
 /*
  * Arch-specifics.

