Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4D8C53159
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:38:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160078.1488312 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCv4-0008B7-Tc; Wed, 12 Nov 2025 15:38:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160078.1488312; Wed, 12 Nov 2025 15:38:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCv4-00089X-Qy; Wed, 12 Nov 2025 15:38:02 +0000
Received: by outflank-mailman (input) for mailman id 1160078;
 Wed, 12 Nov 2025 15:38:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OM5g=5U=bounce.vates.tech=bounce-md_30504962.6914a9d4.v1-98f689ac8ef6429eba55bb534baecc65@srs-se1.protection.inumbo.net>)
 id 1vJCv2-0007vC-HH
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:38:00 +0000
Received: from mail136-17.atl41.mandrillapp.com
 (mail136-17.atl41.mandrillapp.com [198.2.136.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 912f6e0e-bfdd-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 16:38:00 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4d66x00cdYzPm0Zms
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 15:37:56 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 98f689ac8ef6429eba55bb534baecc65; Wed, 12 Nov 2025 15:37:56 +0000
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
X-Inumbo-ID: 912f6e0e-bfdd-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762961876; x=1763231876;
	bh=kCjQ/w4mi64pHFYbQXYYAj4/n0muw09kfLASyhbwR3Y=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=J0hi8lk5FCgyJsaDLkkVsDEOmpJGDK7vPr06fWvfA2+bO7hhLghFQ+lPH163R+25m
	 3gJw1Ru3vVU5ZoKgyStzHbuf+Js+IJS+3QOBY66ccblc+S9RwTdUtn/OHs0t6r1IwD
	 MnclgqeawIFwfgInb6DBTNFMtwPAYE9Mfm2XUHKOvJCrsxyIaI6DkypTmCAkJdzjXi
	 5RkQCUFwRX4/IK7BGbI8ovOcDEBp47WGb9xRSOzGDMxb6E1IovPvXxnPP80gE0P+wr
	 Aep/USDeXGxSPKKX9v6/t9ErEzaFBQD94VUWqKbujnKN69IVQfqP4hacQVlSmKgIuT
	 MyalPI2MgJZQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762961876; x=1763222376; i=teddy.astie@vates.tech;
	bh=kCjQ/w4mi64pHFYbQXYYAj4/n0muw09kfLASyhbwR3Y=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=vgaj0LtADCuCvad7mQ7zgjGaGFNrB9WaMwLciqRruKy7vqv61JGa2eSZ7jspe8rdj
	 qF5PlAmFpMICfzH8SHu+dY+D7Z6XdhIWPhd++wJH9n5ORxrE0yrAruneXAQBdoGB1b
	 NBTPR+u44I+rk33Hm9mM9Ks+KWBy7nBPAQ+iLs6ask57Mh8vU/rmHpu0n/krm/9duZ
	 Yhz6etH5dsBMNonBO2fxPDwOKs9mFfMdpKvUHeBtemBsRpFyLXomUw1hv+7uAWzk8m
	 zShoZql9b/d13CoMMp4WFb81LfUIno/EiMgNBYap5XHHgd4q9RS3Q3DHUZsiBUyPxf
	 O02sYDc7HPxxg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=202/2]=20amd/iommu:=20Remove=20dead=20non-atomic=20update=20checking?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762961874950
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
Message-Id: <b0e81bd67c3f135a4102d12ed95a52ce56482992.1762961527.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1762961527.git.teddy.astie@vates.tech>
References: <cover.1762961527.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.98f689ac8ef6429eba55bb534baecc65?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251112:md
Date: Wed, 12 Nov 2025 15:37:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

When updating a DTE, amd_iommu_setup_domain_device() would check if
the update had been non-atomic (i.e rc > 0) and throw a warning if
such non-atomic update could be dangerous.  However since commit
3fc44151d83d, rc can no longer be positive, making this branch
unreachable code.

No functional change intended.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 3a14770855..02eee4e658 100644
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
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


