Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E744A9176E7
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 05:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748298.1155921 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMJVv-0004KX-9d; Wed, 26 Jun 2024 03:40:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748298.1155921; Wed, 26 Jun 2024 03:40:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMJVv-0004HY-60; Wed, 26 Jun 2024 03:40:07 +0000
Received: by outflank-mailman (input) for mailman id 748298;
 Wed, 26 Jun 2024 03:40:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6czr=N4=bombadil.srs.infradead.org=BATV+6ef32e7df62b9ce2c558+7612+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sMJVt-000433-1Y
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 03:40:05 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c46e903c-336d-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 05:40:02 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sMJVe-00000005Ecx-3HCZ;
 Wed, 26 Jun 2024 03:39:50 +0000
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
X-Inumbo-ID: c46e903c-336d-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=q35hat2STPhlr4DAn4+ABXn/NxJWaK5wgb5DlM6xpCg=; b=v38aUgExch/0roE+EfRJ2Glql8
	NJM5fN+YEIB1TYrzijSpWBKOBPz4ePJWBmxAeIq8Vy0dgCM+B8D7e2Uu/8N8Um6Vr/QojQ2rgIn5c
	kZ0Qn4LEY3fOdOmfyKwMWEDOh9Ymv1GdTyRuFBajkXiPOidtU70du4sEE9xKuUof+3qQcWAWRaj21
	Q277QHf25k5Hs4ZG2a3z7KhsZxdHv16NmcJJI6IIXWv8/dTL6K+es5s2mnReHc51vjem7WfsNQ2Oh
	GFZANqqhPdUBbop3nLGkV+BdHz5dumNmTIDB8b0TUPLkhRAW/U3MN14I64qofM3LTvdEoRKFoAPJn
	ZHT0K0YA==;
Date: Tue, 25 Jun 2024 20:39:50 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@infradead.org>, Christoph Hellwig <hch@lst.de>,
	oe-lkp@lists.linux.dev, lkp@intel.com, Jens Axboe <axboe@kernel.dk>,
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
Message-ID: <ZnuNhkH26nZi8fz6@infradead.org>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
 <ZnqGf49cvy6W-xWf@infradead.org>
 <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Wed, Jun 26, 2024 at 10:10:49AM +0800, Oliver Sang wrote:
> I'm not sure I understand this test request. as in title, we see a good
> improvement of aim7 for 1122c0c1cc, and we didn't observe other issues for
> this commit.

The improvement suggests we are not sending cache flushes when we should
send them, or at least just handle them in md.

> do you mean this improvement is not expected or exposes some problems instead?
> then by below patch, should the performance back to the level of parent of
> 1122c0c1cc?
> 
> sure! it's our great pleasure to test your patches. I noticed there are
> [1]
> https://lore.kernel.org/all/20240625110603.50885-2-hch@lst.de/
> which includes "[PATCH 1/7] md: set md-specific flags for all queue limits"
> [2]
> https://lore.kernel.org/all/20240625145955.115252-2-hch@lst.de/
> which includes "[PATCH 1/8] md: set md-specific flags for all queue limits"
> 
> which one you suggest us to test?
> do we only need to apply the first patch "md: set md-specific flags for all queue limits"
> upon 1122c0c1cc?
> then is the expectation the performance back to parent of 1122c0c1cc?

Either just the patch in reply or the entire [2] series would be fine.

Thanks!


