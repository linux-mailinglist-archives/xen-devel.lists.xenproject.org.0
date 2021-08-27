Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D3D3FA061
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 22:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173951.317387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDE-0000ZA-Ut; Fri, 27 Aug 2021 20:12:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173951.317387; Fri, 27 Aug 2021 20:12:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJiDE-0000KD-8K; Fri, 27 Aug 2021 20:12:28 +0000
Received: by outflank-mailman (input) for mailman id 173951;
 Fri, 27 Aug 2021 19:18:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8NxO=NS=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mJhNT-0001H3-BH
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 19:18:59 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b633878d-f656-4057-81f9-5ad3954df137;
 Fri, 27 Aug 2021 19:18:23 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mJhMh-00D5Ay-6k; Fri, 27 Aug 2021 19:18:11 +0000
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
X-Inumbo-ID: b633878d-f656-4057-81f9-5ad3954df137
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=jzYOtCWATAY/QPQDMVi4thNHaE7QBEtJ34Au5e0E3sY=; b=NGugnaXzgKO6Z0LTp/maSzbHCI
	U1Pv2fbRzAJNKgHx+R1PcMKo8uKSrgNlQix8oa8+K/HTha83E2mjqGnrSagG+ONnMAFMGLYtn2PNe
	44srzTowUzh4ka5s84uHYFW/HOBtfUpMoE0PLBnDtbqqm8TmqnPx5RKDFqaaFTEw0A10vtOcAGog8
	s3kmxVpMLBGvEEyhgCLpkdmj9S06UEdmTMQCo1Nwra6wRObz47JLIzPDf3ciTJiFUmRYdKNCEMx93
	/RmF44E3FegHXxtVo6avCvgPzF7TiKeyMgBT3BlZk/PF5la1GXJhEiw3DATVEgKTEH2u5aQi1PQpl
	Km4814lA==;
From: Luis Chamberlain <mcgrof@kernel.org>
To: axboe@kernel.dk,
	colyli@suse.de,
	kent.overstreet@gmail.com,
	kbusch@kernel.org,
	sagi@grimberg.me,
	vishal.l.verma@intel.com,
	dan.j.williams@intel.com,
	dave.jiang@intel.com,
	ira.weiny@intel.com,
	konrad.wilk@oracle.com,
	roger.pau@citrix.com,
	boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org,
	minchan@kernel.org,
	ngupta@vflare.org,
	senozhatsky@chromium.org
Cc: xen-devel@lists.xenproject.org,
	nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org,
	linux-bcache@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH 04/10] nvdimm/btt: do not call del_gendisk() if not needed
Date: Fri, 27 Aug 2021 12:18:03 -0700
Message-Id: <20210827191809.3118103-5-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827191809.3118103-1-mcgrof@kernel.org>
References: <20210827191809.3118103-1-mcgrof@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

We know we don't need del_gendisk() if we haven't added
the disk, so just skip it. This should fix a bug on older
kernels, as del_gendisk() became able to deal with
disks not added only recently, after the patch titled
"block: add flag for add_disk() completion notation".

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/nvdimm/btt.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/nvdimm/btt.c b/drivers/nvdimm/btt.c
index 92dec4952297..3fd1bdb9fc05 100644
--- a/drivers/nvdimm/btt.c
+++ b/drivers/nvdimm/btt.c
@@ -1538,7 +1538,6 @@ static int btt_blk_init(struct btt *btt)
 		int rc = nd_integrity_init(btt->btt_disk, btt_meta_size(btt));
 
 		if (rc) {
-			del_gendisk(btt->btt_disk);
 			blk_cleanup_disk(btt->btt_disk);
 			return rc;
 		}
-- 
2.30.2


