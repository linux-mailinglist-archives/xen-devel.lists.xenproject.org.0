Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DF9708307
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 15:43:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536353.834591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzduc-0006X3-QF; Thu, 18 May 2023 13:43:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536353.834591; Thu, 18 May 2023 13:43:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzduc-0006Ty-N0; Thu, 18 May 2023 13:43:22 +0000
Received: by outflank-mailman (input) for mailman id 536353;
 Thu, 18 May 2023 13:43:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cezo=BH=bombadil.srs.infradead.org=BATV+e1e315a83c1522261844+7207+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1pzdua-0006Tn-Vs
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 13:43:21 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f233b2ff-f581-11ed-b22c-6b7b168915f2;
 Thu, 18 May 2023 15:43:19 +0200 (CEST)
Received: from [2001:4bb8:188:3dd5:1149:8081:5f51:3e54] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1pzduF-00D6R1-1f; Thu, 18 May 2023 13:42:59 +0000
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
X-Inumbo-ID: f233b2ff-f581-11ed-b22c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=0CEO3HS6DBexWIDg7vdwTQX1D12Af+6zFPesDZ1ytb0=; b=Ku330CY0SmQD9jlWX8wTaNK0/C
	1516RRZd/G2UiIf/EBbsRc5wdlY9u2fCX7tBPcuG2OTVizGl+rva6bo4eli4DgsenII7NFrZqv105
	dhDGWtSuF0RPj2xjLy+4V59LKKwxizXBoCo/OoVAtUtxKcToKHYLzV0dm8QbMPPfkFgD+qCVmRXbX
	Hjc9o0lFiVHBW1oKJ6/xtZ3xqcQAN0Zs6WaNLnJHaXDpn37cYujKNKyJuu5xsSRvCfbI8yWh0Rju6
	Yd3hFEmsiHR1AfMSqKoDZmKnXdy0A9PHbY8v3JkH9q1OKW0q9HNR4zoeJAf01hXfgCCe+T/RgdFcr
	X/NfkhWQ==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>
Cc: xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH 1/4] x86: move a check out of pci_xen_swiotlb_init
Date: Thu, 18 May 2023 15:42:50 +0200
Message-Id: <20230518134253.909623-2-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518134253.909623-1-hch@lst.de>
References: <20230518134253.909623-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Move the exact checks when to initialize the Xen swiotlb code out
of pci_xen_swiotlb_init and into the caller so that is uses readable
positive checks, rather than negative ones that will get even more
confusing with another addition.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/x86/kernel/pci-dma.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
index de6be0a3965ee4..f887b08ac5ffe4 100644
--- a/arch/x86/kernel/pci-dma.c
+++ b/arch/x86/kernel/pci-dma.c
@@ -74,8 +74,6 @@ static inline void __init pci_swiotlb_detect(void)
 #ifdef CONFIG_SWIOTLB_XEN
 static void __init pci_xen_swiotlb_init(void)
 {
-	if (!xen_initial_domain() && !x86_swiotlb_enable)
-		return;
 	x86_swiotlb_enable = true;
 	x86_swiotlb_flags |= SWIOTLB_ANY;
 	swiotlb_init_remap(true, x86_swiotlb_flags, xen_swiotlb_fixup);
@@ -113,7 +111,8 @@ static inline void __init pci_xen_swiotlb_init(void)
 void __init pci_iommu_alloc(void)
 {
 	if (xen_pv_domain()) {
-		pci_xen_swiotlb_init();
+		if (xen_initial_domain() || x86_swiotlb_enable)
+			pci_xen_swiotlb_init();
 		return;
 	}
 	pci_swiotlb_detect();
-- 
2.39.2


