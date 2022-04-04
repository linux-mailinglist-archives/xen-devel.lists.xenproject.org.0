Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 836544F0E9D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Apr 2022 07:07:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.298125.507811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbEvU-0004y0-4o; Mon, 04 Apr 2022 05:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 298125.507811; Mon, 04 Apr 2022 05:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbEvT-0004t0-TO; Mon, 04 Apr 2022 05:06:51 +0000
Received: by outflank-mailman (input) for mailman id 298125;
 Mon, 04 Apr 2022 05:06:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yBc+=UO=bombadil.srs.infradead.org=BATV+8f3f264ef3f87e17849e+6798+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1nbEvS-00021C-RI
 for xen-devel@lists.xenproject.org; Mon, 04 Apr 2022 05:06:50 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:e::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0865435b-b3d5-11ec-8fbc-03012f2f19d4;
 Mon, 04 Apr 2022 07:06:50 +0200 (CEST)
Received: from 089144211060.atnat0020.highway.a1.net ([89.144.211.60]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbEvG-00D95w-SQ; Mon, 04 Apr 2022 05:06:39 +0000
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
X-Inumbo-ID: 0865435b-b3d5-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=VlHGJyMm9vzjIewl+QL3o4DmXNPqBE0xLUE3ejLiJgA=; b=VvTajNYxlVH8VM8PJFY0XdrnDE
	PYMemX1VnGoK/6lMerwGvFWsXR63qtldaV9JNnljEtSNzVgnoja0hj0U4yTVPJciulZJmTsOI3InN
	9hUlVc62KvnpHo9FcY7S2qTjaXiVY8On07Etkgs7y+Zf1tacU/1T/jDeLWMfoNw99mUlitJW6j7sp
	sR3bgvz3cSLVxwfkpBzV25UYIr9nlpUkxvMpGAkcr7rxsGfZ9bUZedEDez4l3//tIzUMxcmnj07eu
	vbRPdl2Gx79fwX5yqj6ntMFxO89PZnRv3tx/aIDni2kH+augWjt6yLz05Y4QJbSg/3+OhHwoek82/
	unMzf8FA==;
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Cc: x86@kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Joerg Roedel <joro@8bytes.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	linux-ia64@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	tboot-devel@lists.sourceforge.net,
	linux-pci@vger.kernel.org
Subject: [PATCH 08/15] x86: centralize setting SWIOTLB_FORCE when guest memory encryption is enabled
Date: Mon,  4 Apr 2022 07:05:52 +0200
Message-Id: <20220404050559.132378-9-hch@lst.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404050559.132378-1-hch@lst.de>
References: <20220404050559.132378-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move enabling SWIOTLB_FORCE for guest memory encryption into common code.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/kernel/cpu/mshyperv.c | 8 --------
 arch/x86/kernel/pci-dma.c      | 8 ++++++++
 arch/x86/mm/mem_encrypt_amd.c  | 3 ---
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kernel/cpu/mshyperv.c b/arch/x86/kernel/cpu/mshyperv.c
index 4b67094215bba..5b8f2c3571601 100644
--- a/arch/x86/kernel/cpu/mshyperv.c
+++ b/arch/x86/kernel/cpu/mshyperv.c
@@ -337,14 +337,6 @@ static void __init ms_hyperv_init_platform(void)
 			swiotlb_unencrypted_base = ms_hyperv.shared_gpa_boundary;
 #endif
 		}
-
-#ifdef CONFIG_SWIOTLB
-		/*
-		 * Enable swiotlb force mode in Isolation VM to
-		 * use swiotlb bounce buffer for dma transaction.
-		 */
-		swiotlb_force = SWIOTLB_FORCE;
-#endif
 		/* Isolation VMs are unenlightened SEV-based VMs, thus this check: */
 		if (IS_ENABLED(CONFIG_AMD_MEM_ENCRYPT)) {
 			if (hv_get_isolation_type() != HV_ISOLATION_TYPE_NONE)
diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index df96926421be0..04140e20ef1a3 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -53,6 +53,14 @@ static void __init pci_swiotlb_detect(void)
 	if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT))
 		x86_swiotlb_enable = true;
 
+	/*
+	 * Guest with guest memory encryption currently perform all DMA through
+	 * bounce buffers as the hypervisor can't access arbitrary VM memory
+	 * that is not explicitly shared with it.
+	 */
+	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
+		swiotlb_force = SWIOTLB_FORCE;
+
 	if (swiotlb_force == SWIOTLB_FORCE)
 		x86_swiotlb_enable = true;
 }
diff --git a/arch/x86/mm/mem_encrypt_amd.c b/arch/x86/mm/mem_encrypt_amd.c
index 6169053c28541..d732d727d3dee 100644
--- a/arch/x86/mm/mem_encrypt_amd.c
+++ b/arch/x86/mm/mem_encrypt_amd.c
@@ -432,9 +432,6 @@ void __init sme_early_init(void)
 	for (i = 0; i < ARRAY_SIZE(protection_map); i++)
 		protection_map[i] = pgprot_encrypted(protection_map[i]);
 
-	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT))
-		swiotlb_force = SWIOTLB_FORCE;
-
 	x86_platform.guest.enc_status_change_prepare = amd_enc_status_change_prepare;
 	x86_platform.guest.enc_status_change_finish  = amd_enc_status_change_finish;
 	x86_platform.guest.enc_tlb_flush_required    = amd_enc_tlb_flush_required;
-- 
2.30.2


