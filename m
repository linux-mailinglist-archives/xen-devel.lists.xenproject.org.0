Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3CC41A204
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 00:01:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197207.350244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygh-0003ZB-B9; Mon, 27 Sep 2021 22:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197207.350244; Mon, 27 Sep 2021 22:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUygh-0003VY-5Q; Mon, 27 Sep 2021 22:01:27 +0000
Received: by outflank-mailman (input) for mailman id 197207;
 Mon, 27 Sep 2021 22:01:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0LRd=OR=infradead.org=mcgrof@srs-us1.protection.inumbo.net>)
 id 1mUygg-0000mS-Em
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 22:01:26 +0000
Received: from bombadil.infradead.org (unknown [2607:7c80:54:e::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c60016d9-c785-4540-8a33-235a217df72c;
 Mon, 27 Sep 2021 22:00:50 +0000 (UTC)
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1mUyfw-004SuN-7t; Mon, 27 Sep 2021 22:00:40 +0000
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
X-Inumbo-ID: c60016d9-c785-4540-8a33-235a217df72c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=f1z5HgkOwmjFBk4lUYxpkBwDgNqINDcFoZThfyywwx8=; b=eQhJDUwgI2a4kvwwC1LW4Grcbe
	Afldl7Y/5P+CtLt6Bf7Y9ytxFLTlAL7DQ1mrwOtj6+6Pnddn8Wp4NkxVuxqvoNw0Tyz5tv3XvMzt/
	95ad2a+T3zdPfY1HqSNzUwK9FALGPXQfHChw080YZLrustezGq9sWxl4CDGODiD+GUg6c3Ya2VpOL
	Lz+0XMYtVA7Q3XN0iSeVnjb/6bCKu9f0aIxF7V2Oxq68qH0zcltU5tGD/tQ+xGADbb+jbit4yqFIv
	EQ6Wyv4G24Wl6sIzPggmISuK4WSugRZrguNrS2KSbhhqFI7oFTnyVJEEiHe4GjAGQLWYlZNDx3Kcq
	wpi9PwkQ==;
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
Subject: [PATCH v2 00/10] block: second batch of add_disk() error handling conversions
Date: Mon, 27 Sep 2021 15:00:29 -0700
Message-Id: <20210927220039.1064193-1-mcgrof@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Luis Chamberlain <mcgrof@infradead.org>

This is the second series of driver conversions for add_disk()
error handling. You can find this set and the rest of the 7th set of
driver conversions on my 20210927-for-axboe-add-disk-error-handling
branch [0].

Changes on this v2 since the last first version of this
patch series:

  - rebased onto linux-next tag 20210927
  - nvme-multipath: used test_and_set_bit() as suggested by Keith Busch,         
    and justified this in the code with a comment as this race was not
    obvious
  - Added reviewed-by / Acked-by tags where one was provided 

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git/log/?h=20210927-for-axboe-add-disk-error-handling

Luis Chamberlain (10):
  block/brd: add error handling support for add_disk()
  bcache: add error handling support for add_disk()
  nvme-multipath: add error handling support for add_disk()
  nvdimm/btt: do not call del_gendisk() if not needed
  nvdimm/btt: use goto error labels on btt_blk_init()
  nvdimm/btt: add error handling support for add_disk()
  nvdimm/blk: avoid calling del_gendisk() on early failures
  nvdimm/blk: add error handling support for add_disk()
  xen-blkfront: add error handling support for add_disk()
  zram: add error handling support for add_disk()

 drivers/block/brd.c           | 10 ++++++++--
 drivers/block/xen-blkfront.c  |  8 +++++++-
 drivers/block/zram/zram_drv.c |  6 +++++-
 drivers/md/bcache/super.c     | 17 ++++++++++++-----
 drivers/nvdimm/blk.c          | 21 +++++++++++++++------
 drivers/nvdimm/btt.c          | 24 +++++++++++++++---------
 drivers/nvme/host/multipath.c | 13 +++++++++++--
 7 files changed, 73 insertions(+), 26 deletions(-)

-- 
2.30.2


