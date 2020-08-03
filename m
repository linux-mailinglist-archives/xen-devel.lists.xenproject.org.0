Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF10823AC42
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 20:22:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2f5x-0008Fz-Au; Mon, 03 Aug 2020 18:21:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XyPB=BN=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1k2f5w-0008F4-6W
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 18:21:56 +0000
X-Inumbo-ID: 3188cb0d-d5b6-11ea-90c4-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3188cb0d-d5b6-11ea-90c4-bc764e2007e4;
 Mon, 03 Aug 2020 18:21:48 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id b11so20987266lfe.10
 for <xen-devel@lists.xenproject.org>; Mon, 03 Aug 2020 11:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oslIVtwtHBl5F3ZhQAPxrDGKrXRg4UKsfSDdvc5ciUQ=;
 b=XjS6U4v4PSxa1s3IfmNtC3cWuXvF7nIUasRVK2guc6ntXJJAHaL0mrU8joAIIvYweP
 5THry527m+O7psZ3j7XNum5igWNb7Bik4NYBcmwLcCeHzrbOA948vb2hLndQ+QRQ5M/9
 reN+IcpKVZaQlgxIXKL4XPnXEYNM+Rbz7xguH3dWq3++rLoQ5qsulqsDGbpU/WClvzrw
 v5Bvw3RV0xj+qh+5ooSIpQVZsUDGuVmG/zZdlWdTWTzTHVFKhnvKmDlnanVA+MHQkcyA
 nuZlQ+Nsx9tUO9qy0gGabRQZScyHIKApfOj8UHxkBtyK+C4jgQXQfEOdQp/61KXD20Zh
 hD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oslIVtwtHBl5F3ZhQAPxrDGKrXRg4UKsfSDdvc5ciUQ=;
 b=dH5TERHIS5J4t7mAvwYWbeMaKLtdUn13HGsitaVP1A5Ke9XnZEf83j2cbJVikD/W9E
 Ye8is4a3eZS4rzv6y7nNb1ubrtYmj+5hN3lL34gD6f/FPMAAhQ+1Cjdu2VPtxpSBo065
 Kz2AQhXJ1CnG9/ZRmTYBXv0cnQ+o6GhudJ2pzmrKa2BVXsn8vFFCZ9kUxGNQ4pq0PK72
 PYq1wpd4fvUtS18I3QKTJ+2JvrTAfto7eQ/+36dO5qjZPxqimUsGCP0+3f/4xEUxU5C5
 Gc8NpRaKU2yPq6Y3ScqPB4E/mnybEsZftdBvJit2cPZMkhqy7nL8U4iuU04TsLLP/QCC
 C14w==
X-Gm-Message-State: AOAM533KYj4iQv7XB4900AyXFVtFRt4HY/FAjcuOtmL7Ch7G//QaT1+P
 epEIiIArnEvKoIVJBefJzIo3zS5zm20=
X-Google-Smtp-Source: ABdhPJxOLAttpeuy9/RgN7qjnqDLVPrgno1Gy+KRXHv9MzMDEQy+mv7bT2weMP+GR17sWoTcH/sXyg==
X-Received: by 2002:ac2:46d0:: with SMTP id p16mr9369899lfo.142.1596478907282; 
 Mon, 03 Aug 2020 11:21:47 -0700 (PDT)
Received: from otyshchenko.www.tendawifi.com ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h18sm4486730ljk.7.2020.08.03.11.21.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Aug 2020 11:21:46 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [RFC PATCH V1 03/12] xen/mm: Make x86's XENMEM_resource_ioreq_server
 handling common
Date: Mon,  3 Aug 2020 21:21:19 +0300
Message-Id: <1596478888-23030-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
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
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

As x86 implementation of XENMEM_resource_ioreq_server can be
re-used on Arm later on, this patch makes it common and removes
arch_acquire_resource as unneeded.

This support is going to be used on Arm to be able run device
emulator outside of Xen hypervisor.

Please note, this is a split/cleanup of Julien's PoC:
"Add support for Guest IO forwarding to a device emulator"

Signed-off-by: Julien Grall <julien.grall@arm.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
 xen/arch/x86/mm.c        | 45 ---------------------------------------------
 xen/common/memory.c      | 45 +++++++++++++++++++++++++++++++++++++++++++--
 xen/include/asm-arm/mm.h |  8 --------
 xen/include/asm-x86/mm.h |  4 ----
 4 files changed, 43 insertions(+), 59 deletions(-)

diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 2b06e15..33238d0 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -99,7 +99,6 @@
  * doing the final put_page(), and remove it from the iommu if so.
  */
 
-#include <xen/hvm/ioreq.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/lib.h>
@@ -4600,50 +4599,6 @@ int xenmem_add_to_physmap_one(
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
index 714077c..9283e5e 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -30,6 +30,10 @@
 #include <public/memory.h>
 #include <xsm/xsm.h>
 
+#ifdef CONFIG_IOREQ_SERVER
+#include <xen/hvm/ioreq.h>
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


