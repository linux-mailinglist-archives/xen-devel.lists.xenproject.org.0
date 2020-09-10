Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC002650A1
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 22:23:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGT64-0004ai-I2; Thu, 10 Sep 2020 20:23:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQLO=CT=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kGT63-0004JK-TS
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 20:23:07 +0000
X-Inumbo-ID: 665f8bca-6a63-4b95-9739-3d38d92b83c7
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 665f8bca-6a63-4b95-9739-3d38d92b83c7;
 Thu, 10 Sep 2020 20:22:39 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id a22so9836931ljp.13
 for <xen-devel@lists.xenproject.org>; Thu, 10 Sep 2020 13:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=x2TvnkSHZ6vsjE4G3HR67k0zN5hdZf0KT4MdD6dTRn4=;
 b=d7c0+ECti+KZNjYH5yLtCpMrSFmsaQQcmQwqcNjPTjCVB7SbdeLBJKfwJUiSdnV7Px
 cKN6utAnZDobb9G703G6qNUG7fc/uZL77NtV8TRMz6ybhQlWZcWYZphDChDuJ/Nbuw/w
 FhiQSVf79omn+imxS8xbs+01yAYUgm5Xg5wCWDGuDLa46TaSxDtsiMjznBYi8u5wBE4Y
 RJAln6b9uSNfXft7q1oQJ3vm+VK5Y5aMO7Bpj6C4lKA3ewV1+Hp6CWqXFVj3IT4S+7jx
 Fy/9Lhv/LvDhyMLB+ly7w5Eu3vGi14AmTzW/6tAeUVlqk/sdE+cvHBaRwpiVxSYJWCOA
 fzBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=x2TvnkSHZ6vsjE4G3HR67k0zN5hdZf0KT4MdD6dTRn4=;
 b=mDEbSbdjkJXF2uun43SxuO2LIeG/nfrl0kQEiTeBlgclf2y/+0dL0F7BJBvBLvEMJn
 l529453TtUMS6K0OyUPNICm1UBFiB60+oSKJ3VB/FZh6EGzcUcoMeuXL4U/8noO+7ws5
 yLgYvSAYTnqNrTn8vpKxtJS8pmvxlGfO8n35DT8209q1YTFaK7TjEdwZ5ZlAHY7I+Bt8
 45Ua9Mhhxpech0FIrwTklyrcrI31P3TgppSpVRBCMnIfG9FM5RUKxsM3U/yejbwGKL9+
 yt8J9ItoM+RkJxHQf3m+ZXy0eZCo//rEd9rMMxxNUoJ5f6tmx2ZeHIQtGa0snrzSnYFA
 nYbQ==
X-Gm-Message-State: AOAM530ZwNUSI1L3P7RzWeRjjaUvCtAiVCNdiDgrn8ly8cMXUk57wfPf
 f2OezEyJ3hkQ3hj//Uo17XC1rug16Z5Fiw==
X-Google-Smtp-Source: ABdhPJxiCtwpmQ8E6CVwNVMH8pPcmbXi82Q8uLR+4j6pmLOijaXJM9EpcRxnzEtvWOkBTSIjNHIJCQ==
X-Received: by 2002:a2e:8182:: with SMTP id e2mr5356957ljg.142.1599769357523; 
 Thu, 10 Sep 2020 13:22:37 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id u5sm1584375lfq.17.2020.09.10.13.22.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Sep 2020 13:22:36 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
Subject: [PATCH V1 08/16] xen/mm: Make x86's XENMEM_resource_ioreq_server
 handling common
Date: Thu, 10 Sep 2020 23:22:02 +0300
Message-Id: <1599769330-17656-9-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
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

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

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
---
---
 xen/arch/x86/mm.c        | 44 --------------------------------------------
 xen/common/memory.c      | 45 +++++++++++++++++++++++++++++++++++++++++++--
 xen/include/asm-arm/mm.h |  8 --------
 xen/include/asm-x86/mm.h |  4 ----
 4 files changed, 43 insertions(+), 58 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 776d2b6..a5f6f12 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -4594,50 +4594,6 @@ int xenmem_add_to_physmap_one(
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
index 714077c..e551fa6 100644
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
@@ -1095,9 +1131,14 @@ static int acquire_resource(
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
index 7e74996..2e111ad 100644
--- a/xen/include/asm-x86/mm.h
+++ b/xen/include/asm-x86/mm.h
@@ -649,8 +649,4 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
     return mfn <= (virt_to_mfn(eva - 1) + 1);
 }
 
-int arch_acquire_resource(struct domain *d, unsigned int type,
-                          unsigned int id, unsigned long frame,
-                          unsigned int nr_frames, xen_pfn_t mfn_list[]);
-
 #endif /* __ASM_X86_MM_H__ */
-- 
2.7.4


