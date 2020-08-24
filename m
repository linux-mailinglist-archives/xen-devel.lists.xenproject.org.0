Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF8B24FD1C
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 13:59:49 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAB8X-0000RI-RX; Mon, 24 Aug 2020 11:59:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kAB8W-0000R9-MU
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 11:59:40 +0000
X-Inumbo-ID: 8db4018b-e2b6-4b74-be8c-f27c4c30b4c3
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8db4018b-e2b6-4b74-be8c-f27c4c30b4c3;
 Mon, 24 Aug 2020 11:59:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AFBC7B62D;
 Mon, 24 Aug 2020 12:00:08 +0000 (UTC)
Subject: [PATCH v3 3/4] bitmap: move to/from xenctl_bitmap conversion helpers
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <ian.jackson@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <088c088d-d463-05c6-1d17-d682a878e149@suse.com>
Message-ID: <421b2b86-6314-406c-893a-39a4e7d14111@suse.com>
Date: Mon, 24 Aug 2020 13:59:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <088c088d-d463-05c6-1d17-d682a878e149@suse.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

A subsequent change will exclude domctl.c from getting built for a
particular configuration, yet the two functions get used from elsewhere.

While moving the code
- drop unmotivated uses of min_t(),
- fix style violations in the moved code,
- xfree() as early as possible.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v3: Drop unmotivated uses of min_t(). Fix style violations in the moved
    code. xfree() as early as possible.
v2: Move function decls to xen/bitmap.h.

--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -9,6 +9,8 @@
 #include <xen/errno.h>
 #include <xen/bitmap.h>
 #include <xen/bitops.h>
+#include <xen/cpumask.h>
+#include <xen/guest_access.h>
 #include <asm/byteorder.h>
 
 /*
@@ -384,3 +386,88 @@ void bitmap_byte_to_long(unsigned long *
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
+    copy_bytes  = min(guest_bytes, (nbits + 7) / 8);
+
+    bitmap_long_to_byte(bytemap, bitmap, nbits);
+
+    if ( copy_bytes &&
+         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
+        err = -EFAULT;
+
+    xfree(bytemap);
+
+    for ( i = copy_bytes; !err && i < guest_bytes; i++ )
+        if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )
+            err = -EFAULT;
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
+    copy_bytes  = min(guest_bytes, (nbits + 7) / 8);
+
+    if ( copy_bytes )
+    {
+        if ( copy_from_guest(bytemap, xenctl_bitmap->bitmap, copy_bytes) )
+            err = -EFAULT;
+        if ( (xenctl_bitmap->nr_bits & 7) && (guest_bytes == copy_bytes) )
+            bytemap[guest_bytes - 1] &= ~(0xff << (xenctl_bitmap->nr_bits & 7));
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
+    if ( alloc_cpumask_var(cpumask) )
+    {
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
--- a/xen/include/xen/bitmap.h
+++ b/xen/include/xen/bitmap.h
@@ -273,6 +273,13 @@ static inline void bitmap_clear(unsigned
 void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp, int nbits);
 void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp, int nbits);
 
+struct xenctl_bitmap;
+int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
+                            const struct xenctl_bitmap *xenctl_bitmap,
+                            unsigned int nbits);
+int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
+                            const unsigned long *bitmap, unsigned int nbits);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __XEN_BITMAP_H */
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -27,9 +27,6 @@ struct xen_domctl_getdomaininfo;
 void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info);
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info);
-int xenctl_bitmap_to_bitmap(unsigned long *bitmap,
-                            const struct xenctl_bitmap *xenctl_bitmap,
-                            unsigned int nbits);
 
 /*
  * Arch-specifics.

