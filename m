Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4BDB2CB14
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 19:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086798.1445014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoQKH-0003ny-0n; Tue, 19 Aug 2025 17:40:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086798.1445014; Tue, 19 Aug 2025 17:40:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoQKG-0003kn-Ka; Tue, 19 Aug 2025 17:40:48 +0000
Received: by outflank-mailman (input) for mailman id 1086798;
 Tue, 19 Aug 2025 17:40:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ve3E=27=kernel.org=leon@srs-se1.protection.inumbo.net>)
 id 1uoQIf-0007Pa-2O
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 17:39:09 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68595f13-7d23-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 19:39:08 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B2BD61426;
 Tue, 19 Aug 2025 17:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79912C4CEF1;
 Tue, 19 Aug 2025 17:38:53 +0000 (UTC)
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
X-Inumbo-ID: 68595f13-7d23-11f0-a32a-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755625134;
	bh=VNpaHZYPDKoIVZk7JizQ+fAc7bXMl6IIrMQIwsKC7lg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IyxkIeqET61j6L28Kxhyyfq3v5aCBRMD3pest0PD5Wdrjee2qJOVX3wtGKvoyv4Jf
	 fKb8DM9QeSElkknNC5Yn0qU4ikvLVS6YKQgcTDs4LrxIuG7ahLDDXTNguINLme7bL8
	 R45/81G/h5t5pFX5HgPXSAhQHYQzTElWkUeH+eN1xfrfgs/fdu6WAy3SQecMOmE4la
	 PqwB4Ypx82fCtwySYC38Ou7g6EFId6EEfFxK7AajpjwqYntToNbsCqOWjya3ep9MbZ
	 2xwiFtcEYrAsYFB002LS7F3RqkXxFxSvXOROm6dSDOFh1rkCW2YvNV3Q8WIt1qnxYY
	 2+4jMjfrMc56w==
From: Leon Romanovsky <leon@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>,
	Danilo Krummrich <dakr@kernel.org>,
	iommu@lists.linux.dev,
	Jason Wang <jasowang@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Joerg Roedel <joro@8bytes.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juergen Gross <jgross@suse.com>,
	kasan-dev@googlegroups.com,
	Keith Busch <kbusch@kernel.org>,
	linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-nvme@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org,
	Sagi Grimberg <sagi@grimberg.me>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 15/16] block-dma: properly take MMIO path
Date: Tue, 19 Aug 2025 20:36:59 +0300
Message-ID: <642dbeb7aa94257eaea71ec63c06e3f939270023.1755624249.git.leon@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755624249.git.leon@kernel.org>
References: <cover.1755624249.git.leon@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leon Romanovsky <leonro@nvidia.com>

Make sure that CPU is not synced and IOMMU is configured to take
MMIO path by providing newly introduced DMA_ATTR_MMIO attribute.

Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
---
 block/blk-mq-dma.c         | 13 +++++++++++--
 include/linux/blk-mq-dma.h |  6 +++++-
 include/linux/blk_types.h  |  2 ++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/block/blk-mq-dma.c b/block/blk-mq-dma.c
index 37e2142be4f7..d415088ed9fd 100644
--- a/block/blk-mq-dma.c
+++ b/block/blk-mq-dma.c
@@ -87,8 +87,13 @@ static bool blk_dma_map_bus(struct blk_dma_iter *iter, struct phys_vec *vec)
 static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
 		struct blk_dma_iter *iter, struct phys_vec *vec)
 {
+	unsigned int attrs = 0;
+
+	if (req->cmd_flags & REQ_MMIO)
+		attrs = DMA_ATTR_MMIO;
+
 	iter->addr = dma_map_phys(dma_dev, vec->paddr, vec->len,
-			rq_dma_dir(req), 0);
+			rq_dma_dir(req), attrs);
 	if (dma_mapping_error(dma_dev, iter->addr)) {
 		iter->status = BLK_STS_RESOURCE;
 		return false;
@@ -103,14 +108,17 @@ static bool blk_rq_dma_map_iova(struct request *req, struct device *dma_dev,
 {
 	enum dma_data_direction dir = rq_dma_dir(req);
 	unsigned int mapped = 0;
+	unsigned int attrs = 0;
 	int error;
 
 	iter->addr = state->addr;
 	iter->len = dma_iova_size(state);
+	if (req->cmd_flags & REQ_MMIO)
+		attrs = DMA_ATTR_MMIO;
 
 	do {
 		error = dma_iova_link(dma_dev, state, vec->paddr, mapped,
-				vec->len, dir, 0);
+				vec->len, dir, attrs);
 		if (error)
 			break;
 		mapped += vec->len;
@@ -176,6 +184,7 @@ bool blk_rq_dma_map_iter_start(struct request *req, struct device *dma_dev,
 			 * same as non-P2P transfers below and during unmap.
 			 */
 			req->cmd_flags &= ~REQ_P2PDMA;
+			req->cmd_flags |= REQ_MMIO;
 			break;
 		default:
 			iter->status = BLK_STS_INVAL;
diff --git a/include/linux/blk-mq-dma.h b/include/linux/blk-mq-dma.h
index c26a01aeae00..6c55f5e58511 100644
--- a/include/linux/blk-mq-dma.h
+++ b/include/linux/blk-mq-dma.h
@@ -48,12 +48,16 @@ static inline bool blk_rq_dma_map_coalesce(struct dma_iova_state *state)
 static inline bool blk_rq_dma_unmap(struct request *req, struct device *dma_dev,
 		struct dma_iova_state *state, size_t mapped_len)
 {
+	unsigned int attrs = 0;
+
 	if (req->cmd_flags & REQ_P2PDMA)
 		return true;
 
 	if (dma_use_iova(state)) {
+		if (req->cmd_flags & REQ_MMIO)
+			attrs = DMA_ATTR_MMIO;
 		dma_iova_destroy(dma_dev, state, mapped_len, rq_dma_dir(req),
-				 0);
+				 attrs);
 		return true;
 	}
 
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 09b99d52fd36..283058bcb5b1 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -387,6 +387,7 @@ enum req_flag_bits {
 	__REQ_FS_PRIVATE,	/* for file system (submitter) use */
 	__REQ_ATOMIC,		/* for atomic write operations */
 	__REQ_P2PDMA,		/* contains P2P DMA pages */
+	__REQ_MMIO,		/* contains MMIO memory */
 	/*
 	 * Command specific flags, keep last:
 	 */
@@ -420,6 +421,7 @@ enum req_flag_bits {
 #define REQ_FS_PRIVATE	(__force blk_opf_t)(1ULL << __REQ_FS_PRIVATE)
 #define REQ_ATOMIC	(__force blk_opf_t)(1ULL << __REQ_ATOMIC)
 #define REQ_P2PDMA	(__force blk_opf_t)(1ULL << __REQ_P2PDMA)
+#define REQ_MMIO	(__force blk_opf_t)(1ULL << __REQ_MMIO)
 
 #define REQ_NOUNMAP	(__force blk_opf_t)(1ULL << __REQ_NOUNMAP)
 
-- 
2.50.1


