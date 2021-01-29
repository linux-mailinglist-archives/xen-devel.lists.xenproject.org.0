Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5194030837D
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 02:59:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77627.140755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J42-00070E-0U; Fri, 29 Jan 2021 01:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77627.140755; Fri, 29 Jan 2021 01:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5J41-0006yt-Rc; Fri, 29 Jan 2021 01:59:09 +0000
Received: by outflank-mailman (input) for mailman id 77627;
 Fri, 29 Jan 2021 01:59:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AjHm=HA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l5Iv7-0004da-Ky
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 01:49:57 +0000
Received: from mail-lf1-x12b.google.com (unknown [2a00:1450:4864:20::12b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6959da08-c442-4655-bd02-cac1cadc4785;
 Fri, 29 Jan 2021 01:49:18 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id i187so10306523lfd.4
 for <xen-devel@lists.xenproject.org>; Thu, 28 Jan 2021 17:49:18 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z128sm1840238lfa.72.2021.01.28.17.49.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Jan 2021 17:49:16 -0800 (PST)
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
X-Inumbo-ID: 6959da08-c442-4655-bd02-cac1cadc4785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=wO92iTlgb3DNVOezolo/XVlMnVKwV7Y/rHIBCUd9Cu8=;
        b=SY9UcgHzjsclm7gI+VSLSdbMx7Y+JLur1TDQbTOD8jLvHId5WwCm5B9hFwbmCHPxfg
         W+j+LRzOFGjbWtPrgvlV+bWRC9aFV/rFqLFGumSp0rtwXUsjl87scUDJ5w/uP15UyPgN
         sNosYkbC4YWVwbBx202bVI42SidEY8tPHvm/OCS/o8jXV2k2GQfqxPyAJXY9QJXd6ILi
         wnuIv+zPBqmN1+GJ+zlErH8Z8DJ+Bv+x1530nTrDIdGYo8vQugHDzO9t7smnxYf10nYS
         zUDXhdGU8KfdKZbO6Ya1zRFHqvlUq4EPWb8rXY3ft6zxFECybFHRpvaHnan2jPEe17rx
         db/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=wO92iTlgb3DNVOezolo/XVlMnVKwV7Y/rHIBCUd9Cu8=;
        b=JC2ZHD8xpfUnZ3w6yZfEMqsgBz2sOaX+FKFb1Kit9+3ZMSqUCSnSAJKFw7hXlMsUmt
         pt5uu8nqr4w8Cs+GZ0+Ulu0gTg/AGfB4oYgSwN2oCo5jLN//qGVvmSO9+3OIT2tM5HVb
         1XDxcGsAq5hZCANLAXDjPcqbJx2yTXN2Zw4mHX8UppNyaS8f1hEu7ozp7rU4iviNmp/q
         Qx3WlIt0uosL5pDkVvHHvKp5Dz4JMwem3B0PQ0cbyjSJ8rpb7gJOBsLgxBlhCEcV02MS
         x7ssmVOqx21A+njVQiPayAfYoHktWjkkAFbQgQu6Uutm479iUhhS1QCdLNbrs1E8MQ85
         OcQg==
X-Gm-Message-State: AOAM531LNV5ziTaiMbfQX94S05YNcHugztcXFJ/atQmrmJh4hxeKrmZD
	iphsCGmO24q6Ato/h3VIEr/11SZxHoMBTg==
X-Google-Smtp-Source: ABdhPJzPm/FEOVU7qPNjQYoLRgww8CaY20+14YvdxhpQqKI3lLPXxYbZWQ6BDet5953TClQxpDebsA==
X-Received: by 2002:a19:c356:: with SMTP id t83mr875368lff.484.1611884957102;
        Thu, 28 Jan 2021 17:49:17 -0800 (PST)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien.grall@arm.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V6 11/24] xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
Date: Fri, 29 Jan 2021 03:48:39 +0200
Message-Id: <1611884932-1851-12-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>

From: Julien Grall <julien.grall@arm.com>

As x86 implementation of XENMEM_resource_ioreq_server can be
re-used on Arm later on, this patch makes it common and removes
arch_acquire_resource (and the corresponding option) as unneeded.

Also re-order #include-s alphabetically.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Paul Durrant <paul@xen.org>
[On Arm only]
Tested-by: Wei Chen <Wei.Chen@arm.com>

---
Please note, this is a split/cleanup/hardening of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Changes RFC -> V1:
   - no changes

Changes V1 -> V2:
   - update the author of a patch

Changes V2 -> V3:
   - don't wrap #include <xen/ioreq.h>
   - limit the number of #ifdef-s
   - re-order #include-s alphabetically

Changes V3 -> V4:
   - rebase
   - Add Jan's R-b

Changes V4 -> V5:
   - add Paul's R-b
   - update patch description
   - remove ARCH_ACQUIRE_RESOURCE option, etc

Changes V5 -> V6:
   - no changes

---
---
 xen/arch/x86/Kconfig     |  1 -
 xen/arch/x86/mm.c        | 44 ---------------------------------
 xen/common/Kconfig       |  3 ---
 xen/common/memory.c      | 63 +++++++++++++++++++++++++++++++++++++++---------
 xen/include/asm-x86/mm.h |  4 ---
 xen/include/xen/mm.h     |  9 -------
 6 files changed, 51 insertions(+), 73 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index ea9a9ea..abe0fce 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -6,7 +6,6 @@ config X86
 	select ACPI
 	select ACPI_LEGACY_TABLES_LOOKUP
 	select ARCH_SUPPORTS_INT128
-	select ARCH_ACQUIRE_RESOURCE
 	select COMPAT
 	select CORE_PARKING
 	select HAS_ALTERNATIVE
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 59eb5c8..4366ea3 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4587,50 +4587,6 @@ static int handle_iomem_range(unsigned long s, unsigned long e, void *p)
     return err || s > e ? err : _handle_iomem_range(s, e, p);
 }
 
-int arch_acquire_resource(struct domain *d, unsigned int type,
-                          unsigned int id, unsigned long frame,
-                          unsigned int nr_frames, xen_pfn_t mfn_list[])
-{
-    int rc;
-
-    switch ( type )
-    {
-#ifdef CONFIG_HVM
-    case XENMEM_resource_ioreq_server:
-    {
-        ioservid_t ioservid = id;
-        unsigned int i;
-
-        rc = -EINVAL;
-        if ( !is_hvm_domain(d) )
-            break;
-
-        if ( id != (unsigned int)ioservid )
-            break;
-
-        rc = 0;
-        for ( i = 0; i < nr_frames; i++ )
-        {
-            mfn_t mfn;
-
-            rc = hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
-            if ( rc )
-                break;
-
-            mfn_list[i] = mfn_x(mfn);
-        }
-        break;
-    }
-#endif
-
-    default:
-        rc = -EOPNOTSUPP;
-        break;
-    }
-
-    return rc;
-}
-
 long arch_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
 {
     int rc;
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index cf32a07..fa049a6 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -22,9 +22,6 @@ config GRANT_TABLE
 
 	  If unsure, say Y.
 
-config ARCH_ACQUIRE_RESOURCE
-	bool
-
 config HAS_ALTERNATIVE
 	bool
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index ccb4d49..2f274a6 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -8,22 +8,23 @@
  */
 
 #include <xen/domain_page.h>
-#include <xen/types.h>
+#include <xen/errno.h>
+#include <xen/event.h>
+#include <xen/grant_table.h>
+#include <xen/guest_access.h>
+#include <xen/hypercall.h>
+#include <xen/iocap.h>
+#include <xen/ioreq.h>
 #include <xen/lib.h>
+#include <xen/mem_access.h>
 #include <xen/mm.h>
+#include <xen/numa.h>
+#include <xen/paging.h>
 #include <xen/param.h>
 #include <xen/perfc.h>
 #include <xen/sched.h>
-#include <xen/event.h>
-#include <xen/paging.h>
-#include <xen/iocap.h>
-#include <xen/guest_access.h>
-#include <xen/hypercall.h>
-#include <xen/errno.h>
-#include <xen/numa.h>
-#include <xen/mem_access.h>
 #include <xen/trace.h>
-#include <xen/grant_table.h>
+#include <xen/types.h>
 #include <asm/current.h>
 #include <asm/hardirq.h>
 #include <asm/p2m.h>
@@ -1091,6 +1092,40 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
     return 0;
 }
 
+static int acquire_ioreq_server(struct domain *d,
+                                unsigned int id,
+                                unsigned long frame,
+                                unsigned int nr_frames,
+                                xen_pfn_t mfn_list[])
+{
+#ifdef CONFIG_IOREQ_SERVER
+    ioservid_t ioservid = id;
+    unsigned int i;
+    int rc;
+
+    if ( !is_hvm_domain(d) )
+        return -EINVAL;
+
+    if ( id != (unsigned int)ioservid )
+        return -EINVAL;
+
+    for ( i = 0; i < nr_frames; i++ )
+    {
+        mfn_t mfn;
+
+        rc = hvm_get_ioreq_server_frame(d, id, frame + i, &mfn);
+        if ( rc )
+            return rc;
+
+        mfn_list[i] = mfn_x(mfn);
+    }
+
+    return 0;
+#else
+    return -EOPNOTSUPP;
+#endif
+}
+
 static int acquire_resource(
     XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
 {
@@ -1149,9 +1184,13 @@ static int acquire_resource(
                                  mfn_list);
         break;
 
+    case XENMEM_resource_ioreq_server:
+        rc = acquire_ioreq_server(d, xmar.id, xmar.frame, xmar.nr_frames,
+                                  mfn_list);
+        break;
+
     default:
-        rc = arch_acquire_resource(d, xmar.type, xmar.id, xmar.frame,
-                                   xmar.nr_frames, mfn_list);
+        rc = -EOPNOTSUPP;
         break;
     }
 
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index 1fdb4eb..041c158 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -640,8 +640,4 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
     return mfn <= (virt_to_mfn(eva - 1) + 1);
 }
 
-int arch_acquire_resource(struct domain *d, unsigned int type,
-                          unsigned int id, unsigned long frame,
-                          unsigned int nr_frames, xen_pfn_t mfn_list[]);
-
 #endif /* __ASM_X86_MM_H__ */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 636a125..667f9da 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -612,13 +612,4 @@ static inline void put_page_alloc_ref(struct page_info *page)
     }
 }
 
-#ifndef CONFIG_ARCH_ACQUIRE_RESOURCE
-static inline int arch_acquire_resource(
-    struct domain *d, unsigned int type, unsigned int id, unsigned long frame,
-    unsigned int nr_frames, xen_pfn_t mfn_list[])
-{
-    return -EOPNOTSUPP;
-}
-#endif /* !CONFIG_ARCH_ACQUIRE_RESOURCE */
-
 #endif /* __XEN_MM_H__ */
-- 
2.7.4


