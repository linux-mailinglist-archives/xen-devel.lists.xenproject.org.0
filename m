Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B40D372C85A
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 16:26:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.547178.854468 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iUo-0001wd-OJ; Mon, 12 Jun 2023 14:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 547178.854468; Mon, 12 Jun 2023 14:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8iUo-0001lT-GP; Mon, 12 Jun 2023 14:26:14 +0000
Received: by outflank-mailman (input) for mailman id 547178;
 Mon, 12 Jun 2023 14:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AcHT=CA=bombadil.srs.infradead.org=BATV+33f57c12507318cbaa86+7232+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1q8iUm-0001S1-Rb
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 14:26:12 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1130dc07-092d-11ee-8611-37d641c3527e;
 Mon, 12 Jun 2023 16:26:07 +0200 (CEST)
Received: from
 2a02-8389-2341-5b80-8c8c-28f8-1274-e038.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:8c8c:28f8:1274:e038] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q8iUV-004I92-0g; Mon, 12 Jun 2023 14:25:55 +0000
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
X-Inumbo-ID: 1130dc07-092d-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-Type:Content-ID:Content-Description;
	bh=7+xegEsHtqdZfD90PqdQG2V9qml0A9VagIuPc+XndpY=; b=nOfGMv5BDRQxDfnrKd8bzmQWqr
	goBsBKB7Iw1m2LxzLRFbWVRVGrjRdpF9rFhCZElyGUexeqx5Gd9/KXOz8Z/0AvV6Y2V4vqzAHsT6M
	7gsR0fVXxD0Ee2qf1VyGvSE4UDuPsMTrlK1/DNRnlXS6AY76SN3HBTrdKLf3sdFvc7RaNofiW/9Mp
	cq5fhS41yZ0jYIePZfhZ1xV0fXI0Ev3LIRDrz5qE4H3oed9BmraNqp8ahrJhZN2yibbAhjChO5VYJ
	z3KK6ayWVF4A0AKXxPff8zQPHaAPIfph3bQmUV3jONDK18rW/BiLpeLYl4TfbalzVkNQyDg9yP4ZQ
	7jqvZpVQ==;
From: Christoph Hellwig <hch@lst.de>
To: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: xen-devel@lists.xenproject.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] swiotlb: unexport is_swiotlb_active
Date: Mon, 12 Jun 2023 16:25:42 +0200
Message-Id: <20230612142542.111581-4-hch@lst.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230612142542.111581-1-hch@lst.de>
References: <20230612142542.111581-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Drivers have no business looking at dma-mapping or swiotlb internals.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 kernel/dma/swiotlb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 775f7bb10ab184..1891faa3a6952e 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -932,7 +932,6 @@ bool is_swiotlb_active(struct device *dev)
 
 	return mem && mem->nslabs;
 }
-EXPORT_SYMBOL_GPL(is_swiotlb_active);
 
 #ifdef CONFIG_DEBUG_FS
 
-- 
2.39.2


