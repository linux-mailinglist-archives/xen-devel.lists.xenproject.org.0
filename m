Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AE6A3A8FD
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 21:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892249.1301239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkUEr-0001Mh-6z; Tue, 18 Feb 2025 20:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892249.1301239; Tue, 18 Feb 2025 20:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkUEr-0001Kh-3X; Tue, 18 Feb 2025 20:30:41 +0000
Received: by outflank-mailman (input) for mailman id 892249;
 Tue, 18 Feb 2025 20:30:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j/lP=VJ=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1tkUD3-0006Vx-LY
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 20:28:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f4a6c4c4-ee36-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 21:28:48 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A4F135C0397;
 Tue, 18 Feb 2025 20:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EA5C4CEE4;
 Tue, 18 Feb 2025 20:28:45 +0000 (UTC)
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
X-Inumbo-ID: f4a6c4c4-ee36-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910526;
	bh=bQdm91Yl1iqCE5K3ojwjgZipgckujmqzZusDskuX2rA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i5AHp70jgOYoxE505706KtLUT7SOzZzDxz4VaRixpXU5TnXmvJb7cWmPPX7kcxAT1
	 nadjVDUJk2RQi3OKbzTGUPUpkQb3U0Kxu7Yzi6r+DRkShL5Typsp+BgQk+v8Hh5X1I
	 tWeAIuDGPp8D7LaS+NKH6+WfW9uxhT1zv4W8Uex3R59asHGJ/KRBZ9OfnrhIUD3g66
	 jZYXCM7R9RrX6RKR73p8mrGevROdpJ6N0KOyO7vp0TKZWNZSo5Ouwl6RO33Ft8Bb76
	 OiFI0ZFbgBdZt5o7gVWofEnDPFCwJRlWB+QUex7JU7cnRpCtsmpeKofvihCEr/L6FG
	 H1w+phMDXjCaw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev
Subject: [PATCH AUTOSEL 6.1 13/13] Xen/swiotlb: mark xen_swiotlb_fixup() __init
Date: Tue, 18 Feb 2025 15:28:17 -0500
Message-Id: <20250218202819.3593598-13-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202819.3593598-1-sashal@kernel.org>
References: <20250218202819.3593598-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.128
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
index 0451e6ebc21a3..71ce0cd9e83de 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -110,7 +110,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 }
 
 #ifdef CONFIG_X86
-int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
+int __init xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 {
 	int rc;
 	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
-- 
2.39.5


