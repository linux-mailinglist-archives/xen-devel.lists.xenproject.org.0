Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84584A3A8D9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 21:27:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892208.1301198 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkUBg-0006Xl-17; Tue, 18 Feb 2025 20:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892208.1301198; Tue, 18 Feb 2025 20:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkUBf-0006W9-Uo; Tue, 18 Feb 2025 20:27:23 +0000
Received: by outflank-mailman (input) for mailman id 892208;
 Tue, 18 Feb 2025 20:27:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j/lP=VJ=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1tkUBe-0006Vx-6x
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 20:27:22 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0358c1e-ee36-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 21:27:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D4C33A41B38;
 Tue, 18 Feb 2025 20:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACA1C4CEE2;
 Tue, 18 Feb 2025 20:27:17 +0000 (UTC)
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
X-Inumbo-ID: c0358c1e-ee36-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910438;
	bh=M0IrEwfhk3Ww4fkOJEqrwcuhSN2tamd0Xb8zp06AIgo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=odgzPJA4hOn4TeEDrEys2logFdXZGa0Y2cgk11TPkdsFzYboiVlJPHaqRXvkMZ/ia
	 wdTixwikhXfGxxineqcjJrOCG7/TDyfuf8E2vITdZyWqwJeveGs4xXBvilr7q8Q2bx
	 owcVRcI542xo2Ql4e0UEelcCgXZBJPzZK5Ucu3PGmADI/zcoAp6oZNwb4ngNm03/MF
	 SORyR1Z1X6Zi+Q2X4ZFUcni61aTqCbglZkGVVlbeHj5j2fNAjLcoDIUIWt3GN78Czd
	 H77+tsBzDVw8n9EL1GEVIIgR4r6gLTcTLMuYySDEmAohdhA3YAd0h6BD7Xe/POJ6+p
	 nRMZcJg4jQKHQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev
Subject: [PATCH AUTOSEL 6.12 27/31] Xen/swiotlb: mark xen_swiotlb_fixup() __init
Date: Tue, 18 Feb 2025 15:26:13 -0500
Message-Id: <20250218202619.3592630-27-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202619.3592630-1-sashal@kernel.org>
References: <20250218202619.3592630-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.15
Content-Transfer-Encoding: 8bit

From: Jan Beulich <jbeulich@suse.com>

[ Upstream commit 75ad02318af2e4ae669e26a79f001bd5e1f97472 ]

It's sole user (pci_xen_swiotlb_init()) is __init, too.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Message-ID: <e1198286-99ec-41c1-b5ad-e04e285836c9@suse.com>
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/swiotlb-xen.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index a337edcf8faf7..5efc53475f039 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -111,7 +111,7 @@ static struct io_tlb_pool *xen_swiotlb_find_pool(struct device *dev,
 }
 
 #ifdef CONFIG_X86
-int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
+int __init xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 {
 	int rc;
 	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
-- 
2.39.5


