Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011068A992F
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 13:57:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708258.1106978 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQON-0003pV-FL; Thu, 18 Apr 2024 11:57:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708258.1106978; Thu, 18 Apr 2024 11:57:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQON-0003iJ-9g; Thu, 18 Apr 2024 11:57:27 +0000
Received: by outflank-mailman (input) for mailman id 708258;
 Thu, 18 Apr 2024 11:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glIF=LX=bounce.vates.tech=bounce-md_30504962.66210aa0.v1-849d46ce67cc49bda7395dc97d134692@srs-se1.protection.inumbo.net>)
 id 1rxQOM-0003Zj-5T
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 11:57:26 +0000
Received: from mail145-32.atl61.mandrillapp.com
 (mail145-32.atl61.mandrillapp.com [198.2.145.32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d05c4e8a-fd7a-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 13:57:22 +0200 (CEST)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-32.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4VKx8x049VzP0JyST
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 11:57:21 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 849d46ce67cc49bda7395dc97d134692; Thu, 18 Apr 2024 11:57:20 +0000
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
X-Inumbo-ID: d05c4e8a-fd7a-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1713441441; x=1713701941;
	bh=IMCKkvZ/LwChBkz9aTUisa2lVAiO0Qw2N3JNoUZBFGA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=reaQQn1zhnYEB4jFabYbItV3ovKhWSkulYfcbkBtin29ecuz8KK5AGquIC79vyZCw
	 Dc18QYk+Y9bOCpK8PrrgGwW/0zeHylkwrnZCGvsy16cn5dfEMPb8/qtAecnh0pUTwD
	 EgAkbE+Kjbv0RF3sUzInAzGokxL7Log3o1G1m2fA2UAXqtWhEOAcibujxLFmquzemu
	 FTGraF5lmNefTkAj4B0JyuxDrQhC6Bh/aPZ41oNkA6av9zVv3vLsxX7cbN3yxz1x3w
	 gAGzkp3GLc9+Aa09MFGb6vTSltTqrcfQ04dgZiTMII/x0WKRZWCe1sCigdLhAgMDd4
	 Z/znqeLY79SEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1713441441; x=1713701941; i=teddy.astie@vates.tech;
	bh=IMCKkvZ/LwChBkz9aTUisa2lVAiO0Qw2N3JNoUZBFGA=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=y+BPT+HC/AqS2fxMuvgmeNsc+vxoJXbly5EOEgef52KPyUwvZ9RKZghxAdTEylt9l
	 vqZiKqK4ex4kuVMfuzdXJT/Tz1IDuI7aVSuFBKlR9QRWBaJV7gucUPENlknwAxHl5M
	 irMelW9CBU8x8c3FW/mT84y/AK1L9zp9mt134g6dAmp9ajCtaMkdY1FiUEgtFT84k2
	 aV7k9V7dxQZVrKuBEormL6Gn/iHnZzaV/siwyQNAgVz9DxVCyYMcIQpHhWAkk2F+RJ
	 bPg+6VNHvb1qQ3fUXiwLYcuDhz6Sbwwlb29oZOF4WEQw4CS4yhXUIvNvoj9n8V1M9x
	 jEIhFvUCZFk5w==
From: Teddy Astie <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20PATCH=20v5=201/3]=20x86/iommu:=20Disable=20IOMMU=20if=20cx16=20isn't=20supported?=
X-Mailer: git-send-email 2.44.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1713441439912
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Message-Id: <4656eab84f7b4b807fc61f54b9ba5c0fc4fae64d.1713433029.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1713433029.git.teddy.astie@vates.tech>
References: <cover.1713433029.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.849d46ce67cc49bda7395dc97d134692?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240418:md
Date: Thu, 18 Apr 2024 11:57:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

All hardware with VT-d/AMD-Vi has CMPXCHG16B support. Check this at
initialisation time, and remove the effectively-dead logic for the
non-cx16 case.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/amd/iommu_map.c     | 42 ++++--------
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  6 ++
 xen/drivers/passthrough/vtd/iommu.c         | 73 +++++++--------------
 3 files changed, 45 insertions(+), 76 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index e0f4fe736a..f67975e700 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -167,15 +167,14 @@ int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
 {
     bool valid = flags & SET_ROOT_VALID;
 
-    if ( dte->v && dte->tv &&
-         (cpu_has_cx16 || (flags & SET_ROOT_WITH_UNITY_MAP)) )
+    if ( dte->v && dte->tv )
     {
         union {
             struct amd_iommu_dte dte;
             uint64_t raw64[4];
             __uint128_t raw128[2];
         } ldte = { .dte = *dte };
-        __uint128_t old = ldte.raw128[0];
+        __uint128_t res, old = ldte.raw128[0];
         int ret = 0;
 
         ldte.dte.domain_id = domain_id;
@@ -185,33 +184,20 @@ int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
         ldte.dte.paging_mode = paging_mode;
         ldte.dte.v = valid;
 
-        if ( cpu_has_cx16 )
-        {
-            __uint128_t res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
+        res = cmpxchg16b(dte, &old, &ldte.raw128[0]);
 
-            /*
-             * Hardware does not update the DTE behind our backs, so the
-             * return value should match "old".
-             */
-            if ( res != old )
-            {
-                printk(XENLOG_ERR
-                       "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%016lx)\n",
-                       domain_id,
-                       (uint64_t)(res >> 64), (uint64_t)res,
-                       (uint64_t)(old >> 64), (uint64_t)old);
-                ret = -EILSEQ;
-            }
-        }
-        else /* Best effort, updating domain_id last. */
+        /*
+         * Hardware does not update the DTE behind our backs, so the
+         * return value should match "old".
+         */
+        if ( res != old )
         {
-            uint64_t *ptr = (void *)dte;
-
-            write_atomic(ptr + 0, ldte.raw64[0]);
-            /* No barrier should be needed between these two. */
-            write_atomic(ptr + 1, ldte.raw64[1]);
-
-            ret = 1;
+            printk(XENLOG_ERR
+                   "Dom%d: unexpected DTE %016lx_%016lx (expected %016lx_%016lx)\n",
+                   domain_id,
+                   (uint64_t)(res >> 64), (uint64_t)res,
+                   (uint64_t)(old >> 64), (uint64_t)old);
+            ret = -EILSEQ;
         }
 
         return ret;
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index f6efd88e36..3a6a23f706 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -305,6 +305,12 @@ static int __init cf_check iov_detect(void)
     if ( !iommu_enable && !iommu_intremap )
         return 0;
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        printk("AMD-Vi: CPU doesn't support CMPXCHG16B, disabling\n");
+        return -ENODEV;
+    }
+
     if ( (init_done ? amd_iommu_init_late()
                     : amd_iommu_init(false)) != 0 )
     {
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index c7110af7c9..9c787ba9eb 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1482,7 +1482,7 @@ int domain_context_mapping_one(
 {
     struct domain_iommu *hd = dom_iommu(domain);
     struct context_entry *context, *context_entries, lctxt;
-    __uint128_t old;
+    __uint128_t res, old;
     uint64_t maddr;
     uint16_t seg = iommu->drhd->segment, prev_did = 0;
     struct domain *prev_dom = NULL;
@@ -1580,55 +1580,23 @@ int domain_context_mapping_one(
         ASSERT(!context_fault_disable(lctxt));
     }
 
-    if ( cpu_has_cx16 )
-    {
-        __uint128_t res = cmpxchg16b(context, &old, &lctxt.full);
-
-        /*
-         * Hardware does not update the context entry behind our backs,
-         * so the return value should match "old".
-         */
-        if ( res != old )
-        {
-            if ( pdev )
-                check_cleanup_domid_map(domain, pdev, iommu);
-            printk(XENLOG_ERR
-                   "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
-                   &PCI_SBDF(seg, bus, devfn),
-                   (uint64_t)(res >> 64), (uint64_t)res,
-                   (uint64_t)(old >> 64), (uint64_t)old);
-            rc = -EILSEQ;
-            goto unlock;
-        }
-    }
-    else if ( !prev_dom || !(mode & MAP_WITH_RMRR) )
-    {
-        context_clear_present(*context);
-        iommu_sync_cache(context, sizeof(*context));
+    res = cmpxchg16b(context, &old, &lctxt.full);
 
-        write_atomic(&context->hi, lctxt.hi);
-        /* No barrier should be needed between these two. */
-        write_atomic(&context->lo, lctxt.lo);
-    }
-    else /* Best effort, updating DID last. */
+    /*
+     * Hardware does not update the context entry behind our backs,
+     * so the return value should match "old".
+     */
+    if ( res != old )
     {
-         /*
-          * By non-atomically updating the context entry's DID field last,
-          * during a short window in time TLB entries with the old domain ID
-          * but the new page tables may be inserted.  This could affect I/O
-          * of other devices using this same (old) domain ID.  Such updating
-          * therefore is not a problem if this was the only device associated
-          * with the old domain ID.  Diverting I/O of any of a dying domain's
-          * devices to the quarantine page tables is intended anyway.
-          */
-        if ( !(mode & (MAP_OWNER_DYING | MAP_SINGLE_DEVICE)) )
-            printk(XENLOG_WARNING VTDPREFIX
-                   " %pp: reassignment may cause %pd data corruption\n",
-                   &PCI_SBDF(seg, bus, devfn), prev_dom);
-
-        write_atomic(&context->lo, lctxt.lo);
-        /* No barrier should be needed between these two. */
-        write_atomic(&context->hi, lctxt.hi);
+        if ( pdev )
+            check_cleanup_domid_map(domain, pdev, iommu);
+        printk(XENLOG_ERR
+                "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
+                &PCI_SBDF(seg, bus, devfn),
+                (uint64_t)(res >> 64), (uint64_t)res,
+                (uint64_t)(old >> 64), (uint64_t)old);
+        rc = -EILSEQ;
+        goto unlock;
     }
 
     iommu_sync_cache(context, sizeof(struct context_entry));
@@ -2630,6 +2598,15 @@ static int __init cf_check vtd_setup(void)
     int ret;
     bool reg_inval_supported = true;
 
+    if ( unlikely(!cpu_has_cx16) )
+    {
+        printk(XENLOG_ERR VTDPREFIX
+               "IOMMU: CPU doesn't support CMPXCHG16B, disabling\n");
+
+        ret = -ENODEV;
+        goto error;
+    }
+
     if ( list_empty(&acpi_drhd_units) )
     {
         ret = -ENODEV;
-- 
2.44.0



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

