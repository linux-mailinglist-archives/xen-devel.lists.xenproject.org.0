Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3D58BFBF2
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 13:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718735.1121235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4fRu-0004sj-9z; Wed, 08 May 2024 11:27:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718735.1121235; Wed, 08 May 2024 11:27:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4fRu-0004pS-67; Wed, 08 May 2024 11:27:02 +0000
Received: by outflank-mailman (input) for mailman id 718735;
 Wed, 08 May 2024 11:27:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0je0=ML=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1s4fRs-0004Lt-Oi
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 11:27:00 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2b2ec57-0d2d-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 13:27:00 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a59b178b75bso779042666b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 04:27:00 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 b3-20020a170906d10300b00a59edf10304sm1858562ejz.76.2024.05.08.04.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 04:26:58 -0700 (PDT)
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
X-Inumbo-ID: e2b2ec57-0d2d-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1715167619; x=1715772419; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfaLi13cq6Jp00njiG3Oj5QQBnM03VocbDPA5xG0o9g=;
        b=WRPzU5RgQkevL0cFdnFNTcngzUsBZ3tfNratpyaKdpvZQdc2cgedCRyVrOknXcnG/M
         gejuU+NDIsNexFfo9CqEA+9LoanVKPtXFDEEDHGYUpNlsPaMpK6iW5ZiQ43cfWl2mt5O
         DjxxzZvmkIrzo7S5a0jv3tZPSDmpZxn3UHVcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715167619; x=1715772419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PfaLi13cq6Jp00njiG3Oj5QQBnM03VocbDPA5xG0o9g=;
        b=UjbAB6WfJwEh+xuHjlLmw6Iy83jouPLGn1v3sKFTLVKf7TSigFObgkL3+OQJWE2Dpa
         atH/yQdAaxKxTRSiDeqXCQVPytB6aLwD7bTJjwInxWzcjcdhlJJkkNb7JPwXslGNmott
         b3V8s6+HlZTu7qXIKge1h3j6FrIV1qUAaJCwKeG7cx61qS4vFVsqm+eBkOEoqHr3rRQk
         XZ7jv0oCwq4Ee3mUywNgxNNpoTfnqMWuW+2VjFnZ1icMdSVL1LNnk5SYSXAunXlBy1FB
         iriw5E9vLVwHnk6J2xT3CX+beomMH6EFlV3I74vAny7qJruIW8prXroPQSuNs9EvNPps
         EfWA==
X-Gm-Message-State: AOJu0Yw7DH1iXprdKVcfAFXAuBS3lqDXjY14pXk4ajuTjhp7xedKda7X
	KK0GzeVmtz5ot2GGAPzo/NXYn/p7gKKxErp/tblFToixc1JUbXX3JtE+v6aBqHEE8u60fTmcM6F
	d
X-Google-Smtp-Source: AGHT+IFu7vidAerhk41EYCSsbv5K0vQLhkaZwr+s2zbmNY5pScb1HCc3PxhVMj0gScVnH3E6/JOiGA==
X-Received: by 2002:a17:906:fb85:b0:a59:c577:c5cb with SMTP id a640c23a62f3a-a59fb94a413mr171281266b.10.1715167619317;
        Wed, 08 May 2024 04:26:59 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH for-4.19 v2 3/3] xen/x86: remove foreign mappings from the p2m on teardown
Date: Wed,  8 May 2024 13:23:23 +0200
Message-ID: <20240508112323.38946-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240508112323.38946-1-roger.pau@citrix.com>
References: <20240508112323.38946-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Iterate over the p2m up to the maximum recorded gfn and remove any foreign
mappings, in order to drop the underlying page references and thus don't keep
extra page references if a domain is destroyed while still having foreign
mappings on it's p2m.

The logic is similar to the one used on Arm.

Note that foreign mappings cannot be created by guests that have altp2m or
nested HVM enabled, as p2ms different than the host one are not currently
scrubbed when destroyed in order to drop references to any foreign maps.

It's unclear whether the right solution is to take an extra reference when
foreign maps are added to p2ms different than the host one, or just rely on the
host p2m already having a reference.  The mapping being removed from the host
p2m should cause it to be dropped on all domain p2ms.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Use existing p2m max_mapped_pfn field.
 - Prevent creating foreign mappings by guests that have altp2m or nestedhvm
   enabled.
---
 CHANGELOG.md                   |  1 +
 xen/arch/x86/domain.c          |  8 +++-
 xen/arch/x86/include/asm/p2m.h | 26 +++++++------
 xen/arch/x86/mm/p2m-basic.c    | 17 +++++++++
 xen/arch/x86/mm/p2m.c          | 68 ++++++++++++++++++++++++++++++++--
 5 files changed, 103 insertions(+), 17 deletions(-)

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
index dff790060605..1cb3ccddab00 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -718,7 +718,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
         return -EINVAL;
     }
 
-    if ( altp2m && (altp2m & (altp2m - 1)) )
+    if ( altp2m & (altp2m - 1) )
     {
         dprintk(XENLOG_INFO, "Multiple altp2m options selected in flags: %#x\n",
                 config->flags);
@@ -2387,6 +2387,7 @@ int domain_relinquish_resources(struct domain *d)
         enum {
             PROG_iommu_pagetables = 1,
             PROG_shared,
+            PROG_mappings,
             PROG_paging,
             PROG_vcpu_pagetables,
             PROG_xen,
@@ -2435,6 +2436,11 @@ int domain_relinquish_resources(struct domain *d)
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
index 107b9f260848..c1478ffc3647 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -383,6 +383,8 @@ struct p2m_domain {
 
     /* Number of foreign mappings. */
     unsigned long      nr_foreign;
+    /* Cursor for iterating over the p2m on teardown. */
+    unsigned long      teardown_gfn;
 #endif /* CONFIG_HVM */
 };
 
@@ -395,16 +397,7 @@ struct p2m_domain {
 #endif
 #include <xen/p2m-common.h>
 
-static inline bool arch_acquire_resource_check(struct domain *d)
-{
-    /*
-     * FIXME: Until foreign pages inserted into the P2M are properly
-     * reference counted, it is unsafe to allow mapping of
-     * resource pages unless the caller is the hardware domain
-     * (see set_foreign_p2m_entry()).
-     */
-    return !paging_mode_translate(d) || is_hardware_domain(d);
-}
+bool arch_acquire_resource_check(const struct domain *d);
 
 /*
  * Updates vCPU's n2pm to match its np2m_base in VMCx12 and returns that np2m.
@@ -720,6 +713,10 @@ p2m_pod_offline_or_broken_hit(struct page_info *p);
 void
 p2m_pod_offline_or_broken_replace(struct page_info *p);
 
+/* Perform cleanup of p2m mappings ahead of teardown. */
+int
+relinquish_p2m_mapping(struct domain *d);
+
 #else
 
 static inline bool
@@ -748,6 +745,11 @@ static inline void p2m_pod_offline_or_broken_replace(struct page_info *p)
     ASSERT_UNREACHABLE();
 }
 
+static inline int relinquish_p2m_mapping(struct domain *d)
+{
+    return 0;
+}
+
 #endif
 
 
@@ -1043,7 +1045,7 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
         break;
 
     case p2m_map_foreign:
-        if ( !mfn_valid(nfn) )
+        if ( !mfn_valid(nfn) || p2m != p2m_get_hostp2m(p2m->domain) )
         {
             ASSERT_UNREACHABLE();
             return -EINVAL;
@@ -1068,7 +1070,7 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
         break;
 
     case p2m_map_foreign:
-        if ( !mfn_valid(ofn) )
+        if ( !mfn_valid(ofn) || p2m != p2m_get_hostp2m(p2m->domain) )
         {
             ASSERT_UNREACHABLE();
             return -EINVAL;
diff --git a/xen/arch/x86/mm/p2m-basic.c b/xen/arch/x86/mm/p2m-basic.c
index 8599bd15c61a..d374e1e824f1 100644
--- a/xen/arch/x86/mm/p2m-basic.c
+++ b/xen/arch/x86/mm/p2m-basic.c
@@ -13,6 +13,8 @@
 
 #include <xen/event.h>
 #include <xen/types.h>
+#include <asm/altp2m.h>
+#include <asm/hvm/nestedhvm.h>
 #include <asm/p2m.h>
 #include "mm-locks.h"
 #include "p2m.h"
@@ -207,6 +209,21 @@ void p2m_final_teardown(struct domain *d)
     p2m_teardown_hostp2m(d);
 }
 
+bool arch_acquire_resource_check(const struct domain *d)
+{
+    /*
+     * altp2m is not supported as we would otherwise also need to walk the
+     * altp2m tables and drop any foreign map entries in order to drop the page
+     * reference.
+     *
+     * The same applies to nestedhvm nested p2m tables, as the type from the L0
+     * p2m is replicated into the L1 p2m, and there's no filtering that
+     * prevents foreign mappings from being created in nestedp2m.
+     */
+    return d->arch.hvm.params[HVM_PARAM_ALTP2M] == XEN_ALTP2M_disabled &&
+           !nestedhvm_enabled(d);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index ce742c12e0de..23c6c42af275 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2333,10 +2333,6 @@ static int p2m_add_foreign(struct domain *tdom, unsigned long fgfn,
     int rc;
     struct domain *fdom;
 
-    /*
-     * hvm fixme: until support is added to p2m teardown code to cleanup any
-     * foreign entries, limit this to hardware domain only.
-     */
     if ( !arch_acquire_resource_check(tdom) )
         return -EPERM;
 
@@ -2693,6 +2689,70 @@ int p2m_set_altp2m_view_visibility(struct domain *d, unsigned int altp2m_idx,
     return rc;
 }
 
+/*
+ * Remove foreign mappings from the p2m, as that drops the page reference taken
+ * when mapped.
+ */
+int relinquish_p2m_mapping(struct domain *d)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    unsigned long gfn, count = 0;
+    int rc = 0;
+
+    if ( !paging_mode_translate(d) )
+        return 0;
+
+    BUG_ON(!d->is_dying);
+
+    p2m_lock(p2m);
+
+    gfn = p2m->teardown_gfn;
+
+    /* Iterate over the whole p2m on debug builds to ensure correctness. */
+    while ( gfn <= p2m->max_mapped_pfn &&
+            (IS_ENABLED(CONFIG_DEBUG) || p2m->nr_foreign) )
+    {
+        unsigned int order;
+        p2m_type_t t;
+        p2m_access_t a;
+
+        _get_gfn_type_access(p2m, _gfn(gfn), &t, &a, 0, &order, 0);
+        ASSERT(IS_ALIGNED(gfn, 1UL << order));
+
+        if ( t == p2m_map_foreign )
+        {
+            ASSERT(p2m->nr_foreign);
+            ASSERT(order == 0);
+
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
+        gfn += 1UL << order;
+
+        if ( !(++count & 0xff) && hypercall_preempt_check() )
+        {
+            rc = -ERESTART;
+            break;
+        }
+    }
+
+    ASSERT(gfn <= p2m->max_mapped_pfn || !p2m->nr_foreign);
+    p2m->teardown_gfn = gfn;
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


