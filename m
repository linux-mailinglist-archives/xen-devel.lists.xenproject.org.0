Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B599A3A8ED
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 21:28:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892226.1301218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkUCa-0007bt-Iz; Tue, 18 Feb 2025 20:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892226.1301218; Tue, 18 Feb 2025 20:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkUCa-0007Yx-FV; Tue, 18 Feb 2025 20:28:20 +0000
Received: by outflank-mailman (input) for mailman id 892226;
 Tue, 18 Feb 2025 20:28:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j/lP=VJ=kernel.org=sashal@srs-se1.protection.inumbo.net>)
 id 1tkUCZ-0006Vx-21
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 20:28:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e25a4ccd-ee36-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 21:28:17 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EE9B25C05E1;
 Tue, 18 Feb 2025 20:27:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08EFDC4CEE4;
 Tue, 18 Feb 2025 20:28:14 +0000 (UTC)
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
X-Inumbo-ID: e25a4ccd-ee36-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739910495;
	bh=psUnPTN5sn4UjiS1mKpHKJxcp9RPSnp/kvkd2uig5vA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uGrHFzjuaeR8s1zcNEUGwKsLcraqn9OEfD5Iq+jGEpOPJgb9MX0VCrugtGdLKVQID
	 BzRw/AotnOZQSvgU9IDFzkz5QS8TqWxUNX4xnA7YJ2PIujXo7GauKiZaoUpKLog+Xx
	 0YLc7yHEUn6LRmd8OIS+y5wxJfW+3XZEmCEchoiBk52nvri4vTPllvVL63K1SNj/VJ
	 NomOpYvYEyqBLy2HnnwjOv22xPaX8tg1fI8SZGE+9S9p8DpJSRLeB2PLEPDOwHgNwu
	 7+UX/AhxcqgGrt0doaL3R6zuNqUlm4kJhCErasUwRn3ui10NA//XAuw5m87R99YSmK
	 8Lzs40i/ZSOww==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev
Subject: [PATCH AUTOSEL 6.6 16/17] Xen/swiotlb: mark xen_swiotlb_fixup() __init
Date: Tue, 18 Feb 2025 15:27:40 -0500
Message-Id: <20250218202743.3593296-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250218202743.3593296-1-sashal@kernel.org>
References: <20250218202743.3593296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.78
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
index 6d0d1c8a508bf..7f108bef54e64 100644
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


