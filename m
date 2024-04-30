Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 987998B7DF2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 18:59:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715129.1116667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qoq-000697-5f; Tue, 30 Apr 2024 16:59:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715129.1116667; Tue, 30 Apr 2024 16:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1qoq-000667-2a; Tue, 30 Apr 2024 16:59:04 +0000
Received: by outflank-mailman (input) for mailman id 715129;
 Tue, 30 Apr 2024 16:59:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ve62=MD=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s1qoo-0005Xj-Mf
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 16:59:02 +0000
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [2607:f8b0:4864:20::f2f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0d61980-0712-11ef-b4bb-af5377834399;
 Tue, 30 Apr 2024 18:59:01 +0200 (CEST)
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-6a0c8fb3540so108646d6.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 09:59:01 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 t7-20020a056214154700b006a0d2a52017sm507692qvw.146.2024.04.30.09.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 09:58:59 -0700 (PDT)
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
X-Inumbo-ID: f0d61980-0712-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714496339; x=1715101139; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlkGJPlOCvm5A8j9uk3pxOJP2pbiQ5Ni0MtAwWQpoKg=;
        b=vQtC+lh78nZXSoKxoYu7t4brPeVaK7cOeUEZvMi6SlDrIX5CX7Z0hvTSJBpKUq9ClK
         QeyJSHRwmkegRH4FQAQdAh34ZerasCu9JWJQ85BtQyqNUrJTnG/Bk3oHmOOFShC/MDWL
         2Up5i+trtSc+vzdz18yu9/LOH1JyhjEq1U57U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714496339; x=1715101139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlkGJPlOCvm5A8j9uk3pxOJP2pbiQ5Ni0MtAwWQpoKg=;
        b=GRXoTC+8sMrpl6gn6pfhFMkUx/r9A1k3jMrgvJ0KEsOawwkZwgANFaMFFerh4Y5mr4
         UP+vdKezo0ZzJYJ852WAWc5YlQzhFRWwbmcSaagDN0Zu3Mp0tKqMf/YjcCMCURPXmVFU
         1VfXN65/gqbSwefRrRXd6hwMsE075/5fZUNv9ME1YzB1CU9QTXtun0QGmQapXSFYtr0g
         lDSyiooTOOJOg999NR77Nc+NzEOT7PYcdvNbQiqnK8Qfx1anSijEz1scxTWpRdVnGfeo
         iybwa11d/+VtSeN7x8fuMzVFTcCRZJ8z2uGMKgajw35y102YHY1Yrxm2Wg8ncGUCPeCl
         rnPw==
X-Gm-Message-State: AOJu0YyhXekXEumzqiMzcMq7zFyPeKR/fggsQ/KIpvS+Y5FzJBkvJofQ
	alWqEgG2bwLkc7qOTYESt4w7YqzvOceH6+R4QLct9H4yZ7FeN7QZsyeWDh4IskZJVJrwZ2+wyKL
	L
X-Google-Smtp-Source: AGHT+IE7KqGFBYUX9ZPYWYnzz4myXyFu+S8SzOCPr4mHPh92LYx3apQjDVu3vBuW8d7AByh6AJLKsA==
X-Received: by 2002:a05:6214:202c:b0:6a0:a8f2:5f8e with SMTP id 12-20020a056214202c00b006a0a8f25f8emr706140qvf.1.1714496339437;
        Tue, 30 Apr 2024 09:58:59 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH for-4.19? 2/2] xen/x86: remove foreign mappings from the p2m on teardown
Date: Tue, 30 Apr 2024 18:58:45 +0200
Message-ID: <20240430165845.81696-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240430165845.81696-1-roger.pau@citrix.com>
References: <20240430165845.81696-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Iterate over the p2m based on the maximum recorded gfn and remove any foreign
mappings, in order to drop the underlying page references and thus don't keep
extra page references if a domain is destroyed while still having foreign
mappings on it's p2m.

The logic is similar to the one used on Arm.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I still have to test with destroying a guest that does have foreign mappings on
it's p2m.
---
 CHANGELOG.md                   |  1 +
 xen/arch/x86/domain.c          |  6 +++
 xen/arch/x86/include/asm/p2m.h | 17 +++++----
 xen/arch/x86/mm/p2m.c          | 68 ++++++++++++++++++++++++++++++++--
 4 files changed, 81 insertions(+), 11 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 8041cfb7d243..09bdb9b97578 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -14,6 +14,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - HVM PIRQs are disabled by default.
    - Reduce IOMMU setup time for hardware domain.
  - xl/libxl configures vkb=[] for HVM domains with priority over vkb_device.
+ - Allow HVM/PVH domains to map foreign pages.
 
 ### Added
  - On x86:
diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 20e83cf38bbd..5aa2d3744e6b 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -2364,6 +2364,7 @@ int domain_relinquish_resources(struct domain *d)
         enum {
             PROG_iommu_pagetables = 1,
             PROG_shared,
+            PROG_mappings,
             PROG_paging,
             PROG_vcpu_pagetables,
             PROG_xen,
@@ -2412,6 +2413,11 @@ int domain_relinquish_resources(struct domain *d)
         }
 #endif
 
+    PROGRESS(mappings):
+        ret = relinquish_p2m_mapping(d);
+        if ( ret )
+            return ret;
+
     PROGRESS(paging):
 
         /* Tear down paging-assistance stuff. */
diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index d95341ef4242..8b3e6a473a0c 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -402,13 +402,7 @@ struct p2m_domain {
 
 static inline bool arch_acquire_resource_check(struct domain *d)
 {
-    /*
-     * FIXME: Until foreign pages inserted into the P2M are properly
-     * reference counted, it is unsafe to allow mapping of
-     * resource pages unless the caller is the hardware domain
-     * (see set_foreign_p2m_entry()).
-     */
-    return !paging_mode_translate(d) || is_hardware_domain(d);
+    return true;
 }
 
 /*
@@ -725,6 +719,10 @@ p2m_pod_offline_or_broken_hit(struct page_info *p);
 void
 p2m_pod_offline_or_broken_replace(struct page_info *p);
 
+/* Perform cleanup of p2m mappings ahead of teardown. */
+int
+relinquish_p2m_mapping(struct domain *d);
+
 #else
 
 static inline bool
@@ -753,6 +751,11 @@ static inline void p2m_pod_offline_or_broken_replace(struct page_info *p)
     ASSERT_UNREACHABLE();
 }
 
+static inline int relinquish_p2m_mapping(struct domain *d)
+{
+    return 0;
+}
+
 #endif
 
 
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index 05d8536adcd7..fac41e5ec808 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2335,10 +2335,6 @@ static int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
     int rc;
     struct domain *fdom;
 
-    /*
-     * hvm fixme: until support is added to p2m teardown code to cleanup any
-     * foreign entries, limit this to hardware domain only.
-     */
     if ( !arch_acquire_resource_check(tdom) )
         return -EPERM;
 
@@ -2695,6 +2691,70 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
     return rc;
 }
 
+/*
+ * Remove foreign mappings from the p2m, as that drops the page reference taken
+ * when mapped.
+ */
+int relinquish_p2m_mapping(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    unsigned long gfn = gfn_x(p2m->max_gfn);
+    int rc = 0;
+
+    if ( !paging_mode_translate(d) )
+        return 0;
+
+    BUG_ON(!d->is_dying);
+
+    p2m_lock(p2m);
+
+    /* Iterate over the whole p2m on debug builds to ensure correctness. */
+    while ( gfn && (IS_ENABLED(CONFIG_DEBUG) || p2m->nr_foreign) )
+    {
+        unsigned int order;
+        p2m_type_t t;
+        p2m_access_t a;
+
+        _get_gfn_type_access(p2m, _gfn(gfn - 1), &t, &a, 0, &order, 0);
+        ASSERT(IS_ALIGNED(gfn, 1u << order));
+        gfn -= 1 << order;
+
+        if ( t == p2m_map_foreign )
+        {
+            ASSERT(p2m->nr_foreign);
+            ASSERT(order == 0);
+            /*
+             * Foreign mappings can only be of order 0, hence there's no need
+             * to align the gfn to the entry order.  Otherwise we would need to
+             * adjust gfn to point to the start of the page if order > 0.
+             */
+            rc = p2m_set_entry(p2m, _gfn(gfn), INVALID_MFN, order, p2m_invalid,
+                               p2m->default_access);
+            if ( rc )
+            {
+                printk(XENLOG_ERR
+                       "%pd: failed to unmap foreign page %" PRI_gfn " order %u error %d\n",
+                       d, gfn, order, rc);
+                ASSERT_UNREACHABLE();
+                break;
+            }
+        }
+
+        if ( !(gfn & 0xfff) && hypercall_preempt_check() )
+        {
+            rc = -ERESTART;
+            break;
+        }
+    }
+
+    ASSERT(gfn || !p2m->nr_foreign);
+    p2m->max_gfn = _gfn(gfn);
+
+    p2m_unlock(p2m);
+
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.44.0


