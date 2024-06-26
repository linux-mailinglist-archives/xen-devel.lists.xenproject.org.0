Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6E39178C4
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 08:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748374.1156074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMLyt-0006nH-Hx; Wed, 26 Jun 2024 06:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748374.1156074; Wed, 26 Jun 2024 06:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMLyt-0006kp-ES; Wed, 26 Jun 2024 06:18:11 +0000
Received: by outflank-mailman (input) for mailman id 748374;
 Wed, 26 Jun 2024 06:18:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3wgj=N4=lst.de=hch@srs-se1.protection.inumbo.net>)
 id 1sMLyr-0006kj-5p
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 06:18:09 +0000
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da9d11b6-3383-11ef-90a3-e314d9c70b13;
 Wed, 26 Jun 2024 08:18:07 +0200 (CEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 85E4B68BEB; Wed, 26 Jun 2024 08:18:04 +0200 (CEST)
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
X-Inumbo-ID: da9d11b6-3383-11ef-90a3-e314d9c70b13
Date: Wed, 26 Jun 2024 08:18:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Oliver Sang <oliver.sang@intel.com>
Cc: Christoph Hellwig <hch@lst.de>, oe-lkp@lists.linux.dev, lkp@intel.com,
	Jens Axboe <axboe@kernel.dk>, Damien Le Moal <dlemoal@kernel.org>,
	Hannes Reinecke <hare@suse.de>, linux-m68k@lists.linux-m68k.org,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, drbd-dev@lists.linbit.com,
	nbd@other.debian.org, linuxppc-dev@lists.ozlabs.org,
	ceph-devel@vger.kernel.org, virtualization@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	nvdimm@lists.linux.dev, linux-nvme@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	ying.huang@intel.com, feng.tang@intel.com, fengwei.yin@intel.com
Subject: Re: [axboe-block:for-next] [block]  bd4a633b6f:
 fsmark.files_per_sec -64.5% regression
Message-ID: <20240626061804.GA23481@lst.de>
References: <202406241546.6bbd44a7-oliver.sang@intel.com> <20240624083537.GA19941@lst.de> <Znuw/4zMD4w5Oq2a@xsang-OptiPlex-9020>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Znuw/4zMD4w5Oq2a@xsang-OptiPlex-9020>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Jun 26, 2024 at 02:11:11PM +0800, Oliver Sang wrote:
> hi, Christoph Hellwig,
> 
> On Mon, Jun 24, 2024 at 10:35:37AM +0200, Christoph Hellwig wrote:
> > This is odd to say at least.  Any chance you can check the value
> > of /sys/block/$DEVICE/queue/rotational for the relevant device before
> > and after this commit?  And is this an ATA or NVMe SSD?
> > 
> 
> yeah, as Niklas mentioned, it's an ATA SSD.
> 
> I checked the /sys/block/$DEVICE/queue/rotational before and after this commit,
> both show '0'. not sure if this is expected.
> 
> anyway, I noticed you send a patch [1]
> 
> so I applied this patch upon bd4a633b6f, and found the performance restored.

Thanks for testing!


