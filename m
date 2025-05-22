Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDBCAC102F
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 17:44:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.994299.1377359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI85i-0000cy-1R; Thu, 22 May 2025 15:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 994299.1377359; Thu, 22 May 2025 15:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uI85h-0000bG-Ul; Thu, 22 May 2025 15:44:17 +0000
Received: by outflank-mailman (input) for mailman id 994299;
 Thu, 22 May 2025 15:44:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GrK8=YG=bounce.vates.tech=bounce-md_30504962.682f464c.v1-38279da09137419b8047aef6d5d12fd8@srs-se1.protection.inumbo.net>)
 id 1uI85g-0000b3-Hi
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 15:44:16 +0000
Received: from mail133-21.atl131.mandrillapp.com
 (mail133-21.atl131.mandrillapp.com [198.2.133.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c83f8b0-3723-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 17:44:14 +0200 (CEST)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4b3CJX6qRzz1XdCyw
 for <xen-devel@lists.xenproject.org>; Thu, 22 May 2025 15:44:12 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 38279da09137419b8047aef6d5d12fd8; Thu, 22 May 2025 15:44:12 +0000
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
X-Inumbo-ID: 9c83f8b0-3723-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747928653; x=1748198653;
	bh=lcpqq7hcTnh6r+A62ErUkxcMa+qXDJULjg3m1WtVDKM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=0iPymMPIzqRJsa71/OuRtBaHy1DN3sNKT+IdUlxzvqOl50fqlbr6QgYVQCai0Gx7u
	 uAYTdKdn4WFFSvOcjSEkK01p3hqxkkP1HWv4kLuIpxZ6pqkQVq+cwmJZo2sC8wI6P3
	 LfTHSIR4bMRf1guw6yGIGT5/Li1xhe1tPLluq8M600qjI8xDTv/HgyTxhyjoCLKQWV
	 NDRLWnSPcAl7AZCm+RvTIBLJHZPZ9zJ+apYAIxNzcQl8LAIVNqaL0qZmlp43v7+vSk
	 th+fw+Oi4r+qItTXM32fobFjzS0737J66McCikD0Zv9hVN5zWrnkO7ccdzRmcg30fw
	 BiBp6EJ5ewczw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747928652; x=1748189152; i=teddy.astie@vates.tech;
	bh=lcpqq7hcTnh6r+A62ErUkxcMa+qXDJULjg3m1WtVDKM=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=MdqrghRHvWqcWqM5FoQyPUocKdfxirgj/Z9T8u9hQyaBhfOoh3FJhKhfFUZbwKGqS
	 zqaq7FIH8+Qdwc60hyVa4Emv7+liMqBjpNoOMcsWlXcdQVqq8SNWfYK45wUF6lIIbO
	 49IaR/Iw+Te1MIsc1zJTqi8PSFsUGN25p1ufJARV9c7+uVWVJztA3aOm2oN1A+wiGC
	 KrC1lSkebfBvodiYS4t6m+452zro2LT/1fyNIZ9vSImNVNeivwljx6bE0HSUqrgamv
	 XkAtLPiUdaS2fmu7RL+FgPohGFnSyv4mTZE7920OUuM7qq9w11Ab4TRi6qObeBMk6L
	 qJiKykmzfyz+Q==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20iommu/amd:=20Remove=20dead=20non-atomic=20update=20checking?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747928651689
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <761f464ae56a449291e38724a1f823606f3ba9d0.1747924653.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.38279da09137419b8047aef6d5d12fd8?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250522:md
Date: Thu, 22 May 2025 15:44:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

When updating a DTE, amd_iommu_setup_domain_device checks if the update had been
non-atomic (i.e rc > 0) and eventually throws a warning but since [1], rc can
no longer be positive, making this check never taken.

[1] x86/iommu: remove non-CX16 logic from DMA remapping
    https://gitlab.com/xen-project/xen/-/commit/3fc44151d83d3d63320036bcf06634dfbebe1ff3

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/amd/iommu_map.c     |  4 +---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 18 ------------------
 2 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index dde393645a..07f405ed63 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -157,9 +157,7 @@ static void set_iommu_ptes_present(unsigned long pt_mfn,
 /*
  * This function returns
  * - -errno for errors,
- * - 0 for a successful update, atomic when necessary
- * - 1 for a successful but non-atomic update, which may need to be warned
- *   about by the caller.
+ * - 0 for a successful update
  */
 int amd_iommu_set_root_page_table(struct amd_iommu_dte *dte,
                                   uint64_t root_ptr, uint16_t domain_id,
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index d00697edb3..409752ffc8 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -225,24 +225,6 @@ static int __must_check amd_iommu_setup_domain_device(
             spin_unlock_irqrestore(&iommu->lock, flags);
             return rc;
         }
-        if ( rc &&
-             domain != pdev->domain &&
-             /*
-              * By non-atomically updating the DTE's domain ID field last,
-              * during a short window in time TLB entries with the old domain
-              * ID but the new page tables may have been inserted.  This could
-              * affect I/O of other devices using this same (old) domain ID.
-              * Such updating therefore is not a problem if this was the only
-              * device associated with the old domain ID.  Diverting I/O of any
-              * of a dying domain's devices to the quarantine page tables is
-              * intended anyway.
-              */
-             !pdev->domain->is_dying &&
-             pdev->domain != dom_io &&
-             (any_pdev_behind_iommu(pdev->domain, pdev, iommu) ||
-              pdev->phantom_stride) )
-            AMD_IOMMU_WARN(" %pp: reassignment may cause %pd data corruption\n",
-                           &PCI_SBDF(pdev->seg, bus, devfn), pdev->domain);
 
         /*
          * Check remaining settings are still in place from an earlier call
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


