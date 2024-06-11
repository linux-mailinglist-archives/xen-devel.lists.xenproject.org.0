Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0F49031F1
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 07:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737838.1144321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGuXH-0004jQ-Nq; Tue, 11 Jun 2024 05:59:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737838.1144321; Tue, 11 Jun 2024 05:59:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGuXH-0004hk-L4; Tue, 11 Jun 2024 05:59:11 +0000
Received: by outflank-mailman (input) for mailman id 737838;
 Tue, 11 Jun 2024 05:59:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7xGt=NN=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sGuXG-0004hc-9u
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 05:59:10 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5bbe1b2-27b7-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 07:59:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 591E8CE19AB;
 Tue, 11 Jun 2024 05:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39B0C2BD10;
 Tue, 11 Jun 2024 05:58:57 +0000 (UTC)
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
X-Inumbo-ID: b5bbe1b2-27b7-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718085543;
	bh=ytNiiCLVFE28gHr4h5G30TNqYehF/KogG4pSKSbNQ2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=juelLKuku0LFbgtXG9OzRzRWb3ooPaRYkdEGYbxCY/l/EREHcpsd6y+kWaUp4iBKj
	 Cs53RLnIaSbrZccm/GN9QVCVAOcAI/+By8TM/0/LFmq4RPTUmj+axscKmxzzB5coCx
	 TPpMXPmrdbBJt790n7mZ2SG7cnazZrwM4LN+e2wDErlp27GY0Q5cW5+prp1xuTs+nr
	 t3wCoIWjpcxWO+rGzFp9IqhsxvwTy7jx2vG3FMgsOx4qNL4tLOJuL4SBWR9Le8e1Gu
	 FbIAW9jk7NKo8gZzoXSm3zjx5aS60f2RIO1ZIKWZDZVw79ebRnV6Cm+DP9ptNCmDsn
	 briDJeVws9DJA==
Message-ID: <27e76310-1831-473e-803a-e0294b91463c@kernel.org>
Date: Tue, 11 Jun 2024 14:58:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/26] loop: also use the default block size from an
 underlying block device
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-7-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-7-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Fix the code in loop_reconfigure_limits to pick a default block size for
> O_DIRECT file descriptors to also work when the loop device sits on top
> of a block device and not just on a regular file on a block device based
> file system.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/loop.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 4f6d8514d19bd6..d7cf6bbbfb1b86 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -988,10 +988,16 @@ static int loop_reconfigure_limits(struct loop_device *lo, unsigned short bsize)
>  {
>  	struct file *file = lo->lo_backing_file;
>  	struct inode *inode = file->f_mapping->host;
> +	struct block_device *backing_bdev = NULL;
>  	struct queue_limits lim;
>  
> +	if (S_ISBLK(inode->i_mode))
> +		backing_bdev = I_BDEV(inode);
> +	else if (inode->i_sb->s_bdev)
> +		backing_bdev = inode->i_sb->s_bdev;
> +

Why not move this hunk inside the below "if" ? (backing_dev declaration can go
there too).

>  	if (!bsize)
> -		bsize = loop_default_blocksize(lo, inode->i_sb->s_bdev);
> +		bsize = loop_default_blocksize(lo, backing_bdev);
>  
>  	lim = queue_limits_start_update(lo->lo_queue);
>  	lim.logical_block_size = bsize;

-- 
Damien Le Moal
Western Digital Research


