Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C12393C17F
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 14:13:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764940.1175496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWxKv-0000F4-Fe; Thu, 25 Jul 2024 12:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764940.1175496; Thu, 25 Jul 2024 12:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWxKv-0000Co-D0; Thu, 25 Jul 2024 12:12:45 +0000
Received: by outflank-mailman (input) for mailman id 764940;
 Thu, 25 Jul 2024 11:36:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a07w=OZ=uter.be=w@srs-se1.protection.inumbo.net>)
 id 1sWwmF-0004DG-JU
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 11:36:56 +0000
Received: from lounge.grep.be (lounge.grep.be [2a01:4f8:200:91e8::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30691926-4a7a-11ef-8776-851b0ebba9a2;
 Thu, 25 Jul 2024 13:36:53 +0200 (CEST)
Received: from [102.39.153.168] (helo=pc220518)
 by lounge.grep.be with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <w@uter.be>) id 1sWwlF-001dJr-31;
 Thu, 25 Jul 2024 13:35:53 +0200
Received: from wouter by pc220518 with local (Exim 4.98)
 (envelope-from <w@uter.be>) id 1sWwl8-00000002sGZ-0mps;
 Thu, 25 Jul 2024 13:35:46 +0200
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
X-Inumbo-ID: 30691926-4a7a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=uter.be;
	s=2021.lounge; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=A2VuDAKeSGGGRwdNEgASvdRePK2jE6LTgdknFzfGiVg=; b=HRSnzfY+SxqUo9lzjJBHswdyNO
	izEqhcP/7tFCFgJJGzzhTZHV+hkIJ95lvet5keDsrZB2SVJh4LM2TT0rY+nfGtvBDiOATcCiQ/ZZp
	NX14nRCfBdImELKCJsEds0YwtB87PNneYsFwhe69klvX8hKaVd3bPAdUOO5oKLpwqsdI1TpEV3xHA
	zPeruYumASMydrGBh8+RD0p+DiFqZyJ0vUaImcbHlwd7Aik2LDO+RgK3xJUkwPiJj9pwJIeGrrPKF
	y3yZwQEUsA40VBWzlQvQ+rZPVwPFNOT65DR9yRxPQziuObFSyUbJuGiw7PBH1R7FTtIfgagxi0sHi
	wC/6XZ8A==;
Date: Thu, 25 Jul 2024 13:35:46 +0200
From: Wouter Verhelst <w@uter.be>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
	Damien Le Moal <dlemoal@kernel.org>
Subject: Re: [PATCH 14/26] block: move the nonrot flag to queue_limits
Message-ID: <ZqI4kosy20WkLC2P@pc220518.home.grep.be>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-15-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240617060532.127975-15-hch@lst.de>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
Organization: none

On Mon, Jun 17, 2024 at 08:04:41AM +0200, Christoph Hellwig wrote:
> Use the chance to switch to defaulting to non-rotational and require
> the driver to opt into rotational, which matches the polarity of the
> sysfs interface.
[...]
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index cb1c86a6a3fb9d..6cddf5baffe02a 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -1867,11 +1867,6 @@ static struct nbd_device *nbd_dev_add(int index, unsigned int refs)
>  		goto out_err_disk;
>  	}
>  
> -	/*
> -	 * Tell the block layer that we are not a rotational device
> -	 */
> -	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
> -
>  	mutex_init(&nbd->config_lock);
>  	refcount_set(&nbd->config_refs, 0);
>  	/*

NBD actually exports a flag for rotational devices; it's defined in
nbd.h in the NBD userland source as

#define NBD_FLAG_ROTATIONAL     (1 << 4)        /* Use elevator algorithm - rotational media */

which is passed in the same flags field which also contains the
NBD_FLAG_SEND_FLUSH and NBD_FLAG_SEND_FUA flags.

Perhaps we might want to look at that flag and set the device to
rotational if it is specified?

-- 
     w@uter.{be,co.za}
wouter@{grep.be,fosdem.org,debian.org}

I will have a Tin-Actinium-Potassium mixture, thanks.

