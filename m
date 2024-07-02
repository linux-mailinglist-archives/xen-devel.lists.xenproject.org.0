Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62491F041
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 09:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751992.1160120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOY01-0004dj-6o; Tue, 02 Jul 2024 07:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751992.1160120; Tue, 02 Jul 2024 07:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOY01-0004b3-46; Tue, 02 Jul 2024 07:32:25 +0000
Received: by outflank-mailman (input) for mailman id 751992;
 Tue, 02 Jul 2024 07:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=COXF=OC=bombadil.srs.infradead.org=BATV+a6dac4ac77a4219ad85f+7618+infradead.org+hch@srs-se1.protection.inumbo.net>)
 id 1sOXzx-0004ax-Qy
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 07:32:22 +0000
Received: from bombadil.infradead.org (bombadil.infradead.org
 [2607:7c80:54:3::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 356ea55a-3845-11ef-a59d-41c015c667e1;
 Tue, 02 Jul 2024 09:32:19 +0200 (CEST)
Received: from hch by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1sOXzk-00000005s56-0D5a;
 Tue, 02 Jul 2024 07:32:08 +0000
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
X-Inumbo-ID: 356ea55a-3845-11ef-a59d-41c015c667e1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yRJduJ4b13YGEVnBaImf8MBMoj+rPcyZfPfJ5uybrn0=; b=nxBkkv5533e0ibSUtWu/FWqca9
	T02UNeMXerA742jTnmxcJDpprQYJhN+AB5mjSyF1tkFtaC9NWv/DI0JPbLwQgi37wPeed5cA37c0e
	+2f4q+qCCkqKwjebfWNgYqdh3KcmHS4SeimB2eXIojre3wqBiKfJ74iCTIY0nzAi/62xdvvQQ9QVV
	ggumCBVJg78P9RdScYdX17RSGD42SxwMGXnk/F0Te2sI20BEGRBsqQOtoGA/KEqDDyMxAk9wtOs1O
	z/1WMLlWsZ6latPxKW85ISPYOrT1dPDdYNH/mzAspCJntQyhFPayqTd56frrg1OjYGXYjfO03yN/a
	E+Zh4hIw==;
Date: Tue, 2 Jul 2024 00:32:07 -0700
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
Message-ID: <ZoOs9wdR1yBPB-7J@infradead.org>
References: <202406250948.e0044f1d-oliver.sang@intel.com>
 <ZnqGf49cvy6W-xWf@infradead.org>
 <Znt4qTr/NdeIPyNp@xsang-OptiPlex-9020>
 <ZnuNhkH26nZi8fz6@infradead.org>
 <ZnzP+nUrk8+9bANK@xsang-OptiPlex-9020>
 <ZnzwbYSaIlT0SIEy@infradead.org>
 <ZoJnO09LBj6kApY7@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZoJnO09LBj6kApY7@xsang-OptiPlex-9020>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

On Mon, Jul 01, 2024 at 04:22:19PM +0800, Oliver Sang wrote:
> from below, it seems the patchset doesn't introduce any performance improvement
> but a regression now. is this expected?

Not having the improvement at least alleviate my concerns about data
integrity.  I'm still curious where it comes from as it isn't exactly
expected.


