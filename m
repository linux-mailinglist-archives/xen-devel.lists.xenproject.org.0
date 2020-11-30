Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A92C8278
	for <lists+xen-devel@lfdr.de>; Mon, 30 Nov 2020 11:44:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.40934.74032 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgfZ-0003uP-UW; Mon, 30 Nov 2020 10:44:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 40934.74032; Mon, 30 Nov 2020 10:44:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kjgfZ-0003sT-85; Mon, 30 Nov 2020 10:44:33 +0000
Received: by outflank-mailman (input) for mailman id 40934;
 Mon, 30 Nov 2020 10:44:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=avKr=FE=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kjgUE-0000Uu-DG
 for xen-devel@lists.xenproject.org; Mon, 30 Nov 2020 10:32:50 +0000
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a62e5870-ab8e-4ea1-91ea-27ad55cb95e1;
 Mon, 30 Nov 2020 10:32:09 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id l11so20618759lfg.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Nov 2020 02:32:09 -0800 (PST)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 136sm2399393lfb.62.2020.11.30.02.32.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 02:32:08 -0800 (PST)
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
X-Inumbo-ID: a62e5870-ab8e-4ea1-91ea-27ad55cb95e1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BmFrzwS/kmGPL3jpIw+pFO9nB5RgVKn8PxqvE5ux3HE=;
        b=sg92dzWNiK+/Ro+9oqGcTaWQJO27limwAQq3tw95xlyV0n3Cq8uhjCySRcCye5bv8r
         sXa6pPo9nKyspMB27GhibfSj0LhXUZ+CK1bJ1ZWaaoQGvlWfvynoBb9pGQYwrdq9LAFt
         uZad3CAj73YWgfZE6JdyZ5XHdZ4/XCDSZnpkuo4noBeDWx2ErCT9Zpz2ochBGza7DCFJ
         CwDoh5r2ibnfEnBV+geiur72JAsfyoA1+J38wgNZb9zSHbtZa1ms+7NsS0Fs1mFk4uAY
         VJaqlpsdO/O/iRtbH+yQtafO0nhvn3Kybl4vSGfpxi6Q1OEKr35WvIeWeGIg7pRtSs57
         fF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BmFrzwS/kmGPL3jpIw+pFO9nB5RgVKn8PxqvE5ux3HE=;
        b=GhAR1oPzEIpN/sHYVIQGacEyByMgtskvEvwtMSN4aoFLkIqiCyD38FQUMEGnI7Ysgv
         facCt4KBZcpx88uyZ1efNqw+hpis4PYHwVl/3U0IFZ0O+I6uWEAaTbEtqhbP4EM3p0Sy
         VSZKXh6npFFyazbph2HpnJAVM73DAoIqoQ5K/d9TdryyllWfNRo+W+ieQoUFlmkVEkCM
         Qh6Rgyf7gEhXODkxLHval3cItRVL04nFWNZpjXAA0UX+ok9BeRwTE75ew/jpzF9Eb6F9
         1TNHYcdylAfaSBfqyuq9FTdQ6syfau1yKCkqbaHRofMuqwrneaMBEweq0RXISwZT7+Y7
         J1ig==
X-Gm-Message-State: AOAM533z7Gk5dPDdX92JZDAiECjbix0y9DofDXeCLL+PZcInkrDw9UL0
	XiAQdi0pVH5qDHYCrY8OoZ1f1gwQokUbbA==
X-Google-Smtp-Source: ABdhPJywPAlsZY/gRxAwj8tc1Y63uc2g2x+0dSFYJS21YrDzj2f6MLz0fCbuKRgQxwxerAU2m2BN0A==
X-Received: by 2002:a19:418d:: with SMTP id o135mr9066537lfa.329.1606732328561;
        Mon, 30 Nov 2020 02:32:08 -0800 (PST)
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
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V3 10/23] xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
Date: Mon, 30 Nov 2020 12:31:25 +0200
Message-Id: <1606732298-22107-11-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>

From: Julien Grall <julien.grall@arm.com>

As x86 implementation of XENMEM_resource_ioreq_server can be
re-used on Arm later on, this patch makes it common and removes
arch_acquire_resource as unneeded.

Also re-order #include-s alphabetically.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

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
---
---
 xen/arch/x86/mm.c        | 44 ---------------------------------
 xen/common/memory.c      | 63 +++++++++++++++++++++++++++++++++++++++---------
 xen/include/asm-arm/mm.h |  8 ------
 xen/include/asm-x86/mm.h |  4 ---
 4 files changed, 51 insertions(+), 68 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index e4638ef..c0a7124 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4699,50 +4699,6 @@ int xenmem_add_to_physmap_one(
     return rc;
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
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 2c86934..92cf983 100644
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
@@ -1086,6 +1087,40 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
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
@@ -1144,9 +1179,13 @@ static int acquire_resource(
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
 
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index f8ba49b..0b7de31 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -358,14 +358,6 @@ static inline void put_page_and_type(struct page_info *page)
 
 void clear_and_clean_page(struct page_info *page);
 
-static inline
-int arch_acquire_resource(struct domain *d, unsigned int type, unsigned int id,
-                          unsigned long frame, unsigned int nr_frames,
-                          xen_pfn_t mfn_list[])
-{
-    return -EOPNOTSUPP;
-}
-
 unsigned int arch_get_dma_bitsize(void);
 
 #endif /*  __ARCH_ARM_MM__ */
diff --git a/xen/include/asm-x86/mm.h b/xen/include/asm-x86/mm.h
index deeba75..859214e 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -639,8 +639,4 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
     return mfn <= (virt_to_mfn(eva - 1) + 1);
 }
 
-int arch_acquire_resource(struct domain *d, unsigned int type,
-                          unsigned int id, unsigned long frame,
-                          unsigned int nr_frames, xen_pfn_t mfn_list[]);
-
 #endif /* __ASM_X86_MM_H__ */
-- 
2.7.4


