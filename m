Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B7919E6E
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 06:55:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749687.1157919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMh9I-0008QV-OW; Thu, 27 Jun 2024 04:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749687.1157919; Thu, 27 Jun 2024 04:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMh9I-0008OV-LN; Thu, 27 Jun 2024 04:54:20 +0000
Received: by outflank-mailman (input) for mailman id 749687;
 Thu, 27 Jun 2024 04:54:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gTBj=N5=bombadil.srs.infradead.org=BATV+b68173646e9cfe1398de+7613+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sMh9F-0008OP-TN
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 04:54:19 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4da31c2e-3441-11ef-90a3-e314d9c70b13;
 Thu, 27 Jun 2024 06:54:16 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sMh93-00000009D8d-4Br2;
 Thu, 27 Jun 2024 04:54:06 +0000
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
X-Inumbo-ID: 4da31c2e-3441-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/fzE2yWElnzU7XRficmyE9tfka6WnF3hLS24PJakxl4=; b=uzcGPgconVlUhJahqA4o0y4rP2
	YDkQfdW0m0w2u8N8BRaxbwBTF1twTy53aPn4xBPj/AfBrb0WxTzWJH8wD6oR43WzK3V70db4qXtWY
	0IIZI+2mDcUbXHX9Anl5SaO8PZqQtBzUCFGUjAdJ7ExnkxJgGk1kclJpDyt1NPlhJH6k1SD2KJv1r
	Y/aWT38dOOUqqw6WO2aC6zoYnYWj+859j2ETzBrnZoTEbtU0f3blIKoRcb5DyUh8Hm74KMCv5zkZg
	gzrN7RVyue7JLzZcBns6ISX0k4yPom7ZauQBJlbkxj+mZ51Z3qG2KMut3g2uFWJoxlvZFyPWvc2cp
	37dKQmlg==;
Date: Wed, 26 Jun 2024 21:54:05 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Damien Le Moal <dlemoal@kernel.org>, Hannes Reinecke <hare@suse.de>,
	linux-block@vger.kernel.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org, ying.huang@intel.com,
	feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [axboe-block:for-next] [block]  1122c0c1cc:  aim7.jobs-per-min
 22.6% improvement
Message-ID: <ZnzwbYSaIlT0SIEy@infradead.org>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
 <ZnqGf49cvy6W-xWf@infradead.org>
 <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
 <ZnuNhkH26nZi8fz6@infradead.org>
 <ZnzP+nUrk8+9bANK@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnzP+nUrk8+9bANK@xsang-OptiPlex-9020>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Thu, Jun 27, 2024 at 10:35:38AM +0800, Oliver Sang wrote:
> 
> I failed to apply patch in your previous reply to 1122c0c1cc or current tip
> of axboe-block/for-next:
> c1440ed442a58 (axboe-block/for-next) Merge branch 'for-6.11/block' into for-next

That already includes it.

> 
> but it's ok to apply upon next:
> * 0fc4bfab2cd45 (tag: next-20240625) Add linux-next specific files for 20240625
> 
> I've already started the test based on this applyment.
> is the expectation that patch should not introduce performance change comparing
> to 0fc4bfab2cd45?
> 
> or if this applyment is not ok, please just give me guidance. Thanks!

The expectation is that the latest block branch (and thus linux-next)
doesn't see this performance change.


