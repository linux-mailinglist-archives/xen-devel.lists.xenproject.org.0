Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8952F28F715
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 18:45:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7584.20012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6Np-0005jv-Op; Thu, 15 Oct 2020 16:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7584.20012; Thu, 15 Oct 2020 16:45:41 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT6Np-0005iv-L9; Thu, 15 Oct 2020 16:45:41 +0000
Received: by outflank-mailman (input) for mailman id 7584;
 Thu, 15 Oct 2020 16:45:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kT6No-0004yr-6f
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:40 +0000
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ac59395-8402-4d7a-9ad9-0bb685af26e4;
 Thu, 15 Oct 2020 16:45:04 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a5so3799292ljj.11
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:04 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 15 Oct 2020 09:45:02 -0700 (PDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=YEeM=DW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
	id 1kT6No-0004yr-6f
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 16:45:40 +0000
X-Inumbo-ID: 6ac59395-8402-4d7a-9ad9-0bb685af26e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 6ac59395-8402-4d7a-9ad9-0bb685af26e4;
	Thu, 15 Oct 2020 16:45:04 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a5so3799292ljj.11
        for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2020 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6/1vRBOVhlXpqAFPJrg7onrJHeVZj9qNd2N7AdSm6+I=;
        b=NxUSlgwYMHInywlP9Vh/osxO+AX5/V1EMzEvRhEhDylOsNg3f8tznfM4IQ5gWoDWVf
         jDmIUKloygpCypaDkOIuFJm4xP5IDSECifyOO1/hMPSL3xWcvYUk5Lnp7qDdGuCuW2cT
         KorqU6bNJv3f89ex2T7QTmS0Q1hcAmoFFGZEFlCKovQQpefZd8qogldHxp8KBMK0qjvY
         PpNL2vNDyzn8VGManvXoUV1jtjzWjsvd/8+2tnT/3zA8xapUUIc6mZyM5kEjy7VcIRwz
         9MsxvpzMkhSKMqwi9Iku60llBgDVmFVipfxHQMCeU9THU5JLZmtIC0l3pSNw/TwFAxFt
         orMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6/1vRBOVhlXpqAFPJrg7onrJHeVZj9qNd2N7AdSm6+I=;
        b=PAa6WKBV1UQJvqAq+OiPKmyOTVB3tXkaB1q3GUEwFOY5kvx6of1wQf9HwxkJ2eGV2X
         N2Z1PL3wexRGHc0D/zz4AitaasXYmRnqU7gqrGSXOJnfMnfgZ2B3CNGIuYP7Xvm8quXr
         uD9HRtJBgdTDki+8iIqVfULK7GX6CQ1OsNGOPH/JeNjfkUIQfrEX2ompOoFdMzSGURu3
         PDb7cGGtGSmG9q4gk7RT1IPshdIfyD27GUvqbfMGtz7rVFkaZptFAiURNJ/KdR2lwulr
         dxm6FmyDgFKZppFIGSp/FgFw8ZImkyBf5qPUXTYilFUTzyqmvQ43fi1NmWJZc9omcGZ6
         1CyA==
X-Gm-Message-State: AOAM530FmC5idStLL4Rahs7VwqKvuN2z1e0f3pd1bcpfbVrL3r+ZmY0C
	wMa/DB/Ng7CG9w8/S23hBBjAt7K1jYpumA==
X-Google-Smtp-Source: ABdhPJwtiagApOtfBMwcSILR3Uh9/7kqM7ZaVQuLTRR1ZqApXjgAWKgMdmZDz7fH0K3DqG2SmRW69A==
X-Received: by 2002:a2e:8645:: with SMTP id i5mr1798706ljj.458.1602780302936;
        Thu, 15 Oct 2020 09:45:02 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
        by smtp.gmail.com with ESMTPSA id v13sm1482495ljh.66.2020.10.15.09.45.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 15 Oct 2020 09:45:02 -0700 (PDT)
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
Subject: [PATCH V2 10/23] xen/mm: Make x86's XENMEM_resource_ioreq_server handling common
Date: Thu, 15 Oct 2020 19:44:21 +0300
Message-Id: <1602780274-29141-11-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>
References: <1602780274-29141-1-git-send-email-olekstysh@gmail.com>

From: Julien Grall <julien.grall@arm.com>

As x86 implementation of XENMEM_resource_ioreq_server can be
re-used on Arm later on, this patch makes it common and removes
arch_acquire_resource as unneeded.

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
---
 xen/arch/x86/mm.c        | 44 --------------------------------------------
 xen/common/memory.c      | 45 +++++++++++++++++++++++++++++++++++++++++++--
 xen/include/asm-arm/mm.h |  8 --------
 xen/include/asm-x86/mm.h |  4 ----
 4 files changed, 43 insertions(+), 58 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index b5865ae..df7619d 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4591,50 +4591,6 @@ int xenmem_add_to_physmap_one(
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
index 1bab0e8..83d800f 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -30,6 +30,10 @@
 #include <public/memory.h>
 #include <xsm/xsm.h>
 
+#ifdef CONFIG_IOREQ_SERVER
+#include <xen/ioreq.h>
+#endif
+
 #ifdef CONFIG_X86
 #include <asm/guest.h>
 #endif
@@ -1045,6 +1049,38 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
     return 0;
 }
 
+#ifdef CONFIG_IOREQ_SERVER
+static int acquire_ioreq_server(struct domain *d,
+                                unsigned int id,
+                                unsigned long frame,
+                                unsigned int nr_frames,
+                                xen_pfn_t mfn_list[])
+{
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
+}
+#endif
+
 static int acquire_resource(
     XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
 {
@@ -1103,9 +1139,14 @@ static int acquire_resource(
                                  mfn_list);
         break;
 
+#ifdef CONFIG_IOREQ_SERVER
+    case XENMEM_resource_ioreq_server:
+        rc = acquire_ioreq_server(d, xmar.id, xmar.frame, xmar.nr_frames,
+                                  mfn_list);
+        break;
+#endif
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


