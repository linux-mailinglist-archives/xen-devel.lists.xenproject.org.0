Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61B3A945BF
	for <lists+xen-devel@lfdr.de>; Sun, 20 Apr 2025 00:21:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.960237.1352316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYp-0003Wq-Ho; Sat, 19 Apr 2025 22:21:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 960237.1352316; Sat, 19 Apr 2025 22:21:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u6GYp-0003Lz-8s; Sat, 19 Apr 2025 22:21:19 +0000
Received: by outflank-mailman (input) for mailman id 960237;
 Sat, 19 Apr 2025 22:21:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqik=XF=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1u6GQa-0004yY-Es
 for xen-devel@lists.xenproject.org; Sat, 19 Apr 2025 22:12:48 +0000
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com
 [136.143.188.50]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c1f3d9a-1d6b-11f0-9eb0-5ba50f476ded;
 Sun, 20 Apr 2025 00:12:47 +0200 (CEST)
Received: by mx.zohomail.com with SMTPS id 1745100552055701.4359410353334;
 Sat, 19 Apr 2025 15:09:12 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 6c1f3d9a-1d6b-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; t=1745100554; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pi5BETfqw22ls3M0dj/Fc9zbpkxZYOYO0Ys+U9C99s/UY5NuARj9msv0te8TZvdQ4YQEJepkp0Lh5caBXjSTgD+8cssYjNn818Ra5fzOvsuQ3L1PFSS2Lrnuk7LQrwkaFvvAT2gkZTptsZcfrKqc3E0tUxZRCy0+900I9/NtJ8E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745100554; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ErU8vuQ7J87fC+REu5nsdOrzqMN/uQj7jaoh0kca6jQ=; 
	b=TVW4abfNNk+4TTncybXwfIH8nIcwpmgRDmsMVmdLaZcQFpdP7kSlnDjJQbPVjfiMr9gCOL+7XRy7h3j0DNHHaEpd+e8V8OiuRF3+ACQcBc6fiLCVpBJvJH4Z9Bg0kPrJGTKjEz3T0XxFzNU11TIko3GoMeGmqNDBiteMFaPsBCo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745100554;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=ErU8vuQ7J87fC+REu5nsdOrzqMN/uQj7jaoh0kca6jQ=;
	b=vezoF10khKIC1HNu4QNYl20h7IXUDCZJLJPS1LWcA1pre8zEF6vDZoLf2at6n15B
	h6vSOc6nY/7USaAhlG3e6B06KeGfkosDYtmtwL3unr8TH/Ubp/ZtcQtz3myTkvJNEJk
	ISZrDmDb0CDDiT8VL0N4kbhWrSmEujQDETsBaHaM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	jason.andryuk@amd.com,
	stefano.stabellini@amd.com,
	agarciav@amd.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC 27/38] x86/hyperlaunch: introduce domain builder general dom creation
Date: Sat, 19 Apr 2025 18:08:09 -0400
Message-Id: <20250419220820.4234-28-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250419220820.4234-1-dpsmith@apertussolutions.com>
References: <20250419220820.4234-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Introduce the builder_create_domains() function that provides the domain
construciton abstraction for the hyperlaunch domain builder.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
---
 xen/arch/x86/domain-builder/core.c        | 17 +++++++++++++++
 xen/arch/x86/include/asm/bootinfo.h       | 26 +++++++++++++++++++++++
 xen/arch/x86/include/asm/domain-builder.h |  1 +
 xen/arch/x86/setup.c                      | 23 +++++++++++++++++---
 4 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index 8d137ecaaf84..2f0b8bd82c3a 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -9,6 +9,7 @@
 
 #include <asm/bootinfo.h>
 #include <asm/setup.h>
+#include <asm/domain-builder.h>
 
 #include "fdt.h"
 
@@ -102,6 +103,22 @@ void __init builder_init(struct boot_info *bi)
     }
 }
 
+unsigned int __init builder_create_domains(struct boot_info *bi)
+{
+    unsigned int build_count = 0;
+    struct boot_domain *bd = &bi->domains[0];
+
+    if ( bd->kernel == NULL && bd->capabilities & BUILD_CAPS_CONTROL )
+        panic("%s: control domain missing kernel\n", __func__);
+
+
+    arch_create_dom(bi, bd);
+    if ( bd->d )
+        build_count++;
+
+    return build_count;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 5b2c93b1ef9e..430ae08cf5ef 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -132,6 +132,32 @@ static inline unsigned int __init next_boot_module_index(
           (i) <= (b)->nr_modules;                       \
           (i) = next_boot_module_index(b, t, i + 1) )
 
+/*
+ * next_boot_domain_index:
+ *     Finds the next boot domain with capability cap, starting at array index
+ *     start.
+ *
+ * Returns:
+ *      Success - index in boot_domains array
+ *      Failure - a value greater than MAX_NR_BOOTDOMS
+ */
+static inline unsigned int __init next_boot_domain_index(
+    const struct boot_info *bi, uint32_t cap, unsigned int start)
+{
+    int i;
+
+    for ( i = start; i < bi->nr_domains; i++ )
+    {
+        if ( bi->domains[i].capabilities & cap )
+            return i;
+    }
+
+    return MAX_NR_BOOTDOMS + 1;
+}
+
+#define first_boot_domain_index(bi, cap)              \
+    next_boot_domain_index(bi, cap, 0)
+
 #endif /* X86_BOOTINFO_H */
 
 /*
diff --git a/xen/arch/x86/include/asm/domain-builder.h b/xen/arch/x86/include/asm/domain-builder.h
index ccab02c3a1fd..5dc5661bec07 100644
--- a/xen/arch/x86/include/asm/domain-builder.h
+++ b/xen/arch/x86/include/asm/domain-builder.h
@@ -8,6 +8,7 @@ int __init builder_get_cmdline(
     struct boot_info *bi, int offset, char *cmdline, size_t size);
 
 void builder_init(struct boot_info *bi);
+unsigned int builder_create_domains(struct boot_info *bi);
 
 struct domain *arch_create_dom(
     struct boot_info *bi, struct boot_domain *bd);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 8f956b6eca4f..da5a8e8d8ed3 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2015,9 +2015,26 @@ void asmlinkage __init noreturn __start_xen(void)
      * We're going to setup domain0 using the module(s) that we stashed safely
      * above our heap. The second module, if present, is an initrd ramdisk.
      */
-    dom0 = arch_create_dom(bi, &bi->domains[0]);
-    if ( !dom0 )
-        panic("Could not set up DOM0 guest OS\n");
+    ret = builder_create_domains(bi);
+    if ( ret <= 0 )
+        panic("Could not set up boot-time domains\n");
+    else
+        printk(XENLOG_INFO "Constructed %d boot-time domains\n", ret);
+
+    /* Selection order: hardware domain, control domain, first domain */
+    i = first_boot_domain_index(bi, BUILD_CAPS_HARDWARE);
+    if ( i >= MAX_NR_BOOTDOMS )
+    {
+        i = first_boot_domain_index(bi, BUILD_CAPS_CONTROL);
+        if ( i >= MAX_NR_BOOTDOMS )
+        {
+            printk(XENLOG_WARNING
+                   "A hwdom/ctrldom not detected, using 0th domain\n");
+            i = 0;
+        }
+    }
+
+    dom0 = bi->domains[i].d;
 
     heap_init_late();
 
-- 
2.30.2


