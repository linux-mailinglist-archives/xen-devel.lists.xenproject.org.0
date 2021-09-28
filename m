Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 196DB41A788
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 07:56:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197515.350607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV66U-0003fl-SW; Tue, 28 Sep 2021 05:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197515.350607; Tue, 28 Sep 2021 05:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV66U-0003ZA-Je; Tue, 28 Sep 2021 05:56:34 +0000
Received: by outflank-mailman (input) for mailman id 197515;
 Tue, 28 Sep 2021 05:56:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqPr=OS=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1mV66T-0003X0-4u
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 05:56:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fbe3536b-f3d9-4dbd-bada-680816328013;
 Tue, 28 Sep 2021 05:56:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CD9F46124B;
 Tue, 28 Sep 2021 05:56:31 +0000 (UTC)
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
X-Inumbo-ID: fbe3536b-f3d9-4dbd-bada-680816328013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632808591;
	bh=yF8soBrMZR/O7Es8zvvSXK1ACmyYAeIPeI9GI8SIN4E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BR9Mz7tNJIpOMx5qLmLL20V6J+CCbJqnzz19y6p25N+bWH6doUl3rEufMzt3szdUr
	 MMpPdsax7GWcFfEBdnMBV4XDW877gtglxayrFvk3zQ0Znp0y7jjIMIbg1zqCrb3iPG
	 JTI0rh8X7/Ape0kSmKx0fT6brfXHpwiQ/hx8wHHcMa+yC4aabMKJLJRtWZ8fkwtE2X
	 spJM3WqZzgsGzNF1F2W5g2pR6rMj0pPPhnsolXYKtitgWQaSyEfnfgP9BkdEGM5UGl
	 l65tTf6tnqeBbJau43qA+ewWkEEv5+uXGFfuTrQxqipWlRFuDfkmQ8V7LxgIFUq9e8
	 jLfUbw/orNoEw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Sasha Levin <sashal@kernel.org>,
	boris.ostrovsky@oracle.com,
	xen-devel@lists.xenproject.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH AUTOSEL 5.14 29/40] swiotlb-xen: ensure to issue well-formed XENMEM_exchange requests
Date: Tue, 28 Sep 2021 01:55:13 -0400
Message-Id: <20210928055524.172051-29-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210928055524.172051-1-sashal@kernel.org>
References: <20210928055524.172051-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Jan Beulich <jbeulich@suse.com>

[ Upstream commit 9074c79b62b6e0d91d7f716c6e4e9968eaf9e043 ]

While the hypervisor hasn't been enforcing this, we would still better
avoid issuing requests with GFNs not aligned to the requested order.
Instead of altering the value also in the call to panic(), drop it
there for being static and hence easy to determine without being part
of the panic message.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Link: https://lore.kernel.org/r/7b3998e3-1233-4e5a-89ec-d740e77eb166@suse.com
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/xen/swiotlb-xen.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index dbb18dc956f3..de4f55154d49 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -232,10 +232,11 @@ void __init xen_swiotlb_init_early(void)
 	/*
 	 * Get IO TLB memory from any location.
 	 */
-	start = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
+	start = memblock_alloc(PAGE_ALIGN(bytes),
+			       IO_TLB_SEGSIZE << IO_TLB_SHIFT);
 	if (!start)
-		panic("%s: Failed to allocate %lu bytes align=0x%lx\n",
-		      __func__, PAGE_ALIGN(bytes), PAGE_SIZE);
+		panic("%s: Failed to allocate %lu bytes\n",
+		      __func__, PAGE_ALIGN(bytes));
 
 	/*
 	 * And replace that memory with pages under 4GB.
-- 
2.33.0


