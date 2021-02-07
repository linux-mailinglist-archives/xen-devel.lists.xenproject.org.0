Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A12053125DD
	for <lists+xen-devel@lfdr.de>; Sun,  7 Feb 2021 17:10:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82436.152317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mdn-0005JP-4s; Sun, 07 Feb 2021 16:10:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82436.152317; Sun, 07 Feb 2021 16:10:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l8mdm-0005IW-W3; Sun, 07 Feb 2021 16:10:27 +0000
Received: by outflank-mailman (input) for mailman id 82436;
 Sun, 07 Feb 2021 16:10:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QIBx=HJ=casper.srs.infradead.org=batv+661ee30cee4f8a507613+6377+infradead.org+hch@srs-us1.protection.inumbo.net>)
 id 1l8mdl-00042X-J4
 for xen-devel@lists.xenproject.org; Sun, 07 Feb 2021 16:10:25 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e1dabfde-05d8-42e2-9fcf-dc970d56a089;
 Sun, 07 Feb 2021 16:09:58 +0000 (UTC)
Received: from [2001:4bb8:184:7d04:4590:5583:6cb7:77c7] (helo=localhost)
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1l8mdD-004top-Qm; Sun, 07 Feb 2021 16:09:52 +0000
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
X-Inumbo-ID: e1dabfde-05d8-42e2-9fcf-dc970d56a089
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=II87lVlVi39N4h2hDH/RczH9V+xrUdtPsM3lWkdXNMw=; b=f8tMOfWQPN+aI2qzvJbaH14hPP
	zUj0n8mdP6winTuA7Ld5imaXHoukB6enEo6lpPJY+gbSl/jdcrgT44RWZQn/fvkyEITRM+o9or5eu
	42eQVAHxivLfAwJv+PiXGneSRGScJivDXMw3UpV/vAFaBWvOxesQIxEHKndOLafA+pwX+pN3A8fvZ
	kRU7PMlUyNuF99RbDyJsfWPFAbPrlpVxKVJHEDHbNnO4liTGTjj/Xg8BXtv5tSYchEQJT2//eY8SE
	PUZCpnQwbq8lfxC2xYn6xNbU/fxFrjtoq/ILQmud6M79thxiPQrjFHkq1boJ0lxkXWSaDjtq13XNN
	9tvDIyrQ==;
From: Christoph Hellwig <hch@lst.de>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Dongli Zhang <dongli.zhang@oracle.com>,
	Claire Chang <tientzu@chromium.org>,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux-foundation.org
Subject: [PATCH 8/8] xen-swiotlb: remove the unused size argument from xen_swiotlb_fixup
Date: Sun,  7 Feb 2021 17:09:34 +0100
Message-Id: <20210207160934.2955931-9-hch@lst.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207160934.2955931-1-hch@lst.de>
References: <20210207160934.2955931-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/xen/swiotlb-xen.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index b2d9e77059bf5a..621a20c1143597 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -104,8 +104,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
 	return 0;
 }
 
-static int
-xen_swiotlb_fixup(void *buf, size_t size, unsigned long nslabs)
+static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
 {
 	int i, rc;
 	int dma_bits;
@@ -195,7 +194,7 @@ int __ref xen_swiotlb_init(void)
 	/*
 	 * And replace that memory with pages under 4GB.
 	 */
-	rc = xen_swiotlb_fixup(start, bytes, nslabs);
+	rc = xen_swiotlb_fixup(start, nslabs);
 	if (rc) {
 		free_pages((unsigned long)start, order);
 		m_ret = XEN_SWIOTLB_EFIXUP;
@@ -243,7 +242,7 @@ void __init xen_swiotlb_init_early(void)
 	/*
 	 * And replace that memory with pages under 4GB.
 	 */
-	rc = xen_swiotlb_fixup(start, bytes, nslabs);
+	rc = xen_swiotlb_fixup(start, nslabs);
 	if (rc) {
 		memblock_free(__pa(start), PAGE_ALIGN(bytes));
 		if (repeat--) {
-- 
2.29.2


