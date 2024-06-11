Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FD69031A8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 07:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.737813.1144270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGuRn-0001TA-AR; Tue, 11 Jun 2024 05:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 737813.1144270; Tue, 11 Jun 2024 05:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGuRn-0001Re-7n; Tue, 11 Jun 2024 05:53:31 +0000
Received: by outflank-mailman (input) for mailman id 737813;
 Tue, 11 Jun 2024 05:53:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7xGt=NN=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sGuRl-0001KK-Go
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 05:53:29 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ebdbe814-27b6-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 07:53:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5366D60C88;
 Tue, 11 Jun 2024 05:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFA5C2BD10;
 Tue, 11 Jun 2024 05:53:20 +0000 (UTC)
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
X-Inumbo-ID: ebdbe814-27b6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718085206;
	bh=RvinM2CEhnrYy7/V+Hc/2gNsHgLPMfOqlJof5s6pLpY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=acWTCLh69lElyFzhBDitf/FJSPcZHoSKSYkPin9SpKmAkY2E8tt2RX9YMgvNW08VJ
	 pXyQOUrKXLHipujeCeYwwOOV1ng3liGMUrh79LCxXQAnCnsegn/0fa+OxA8G7Re61L
	 fmOHhV3QGFVIYl1a9Zvr8YBZq5o5MC+kVjqKkUi4kq/pw8SNm9WHEEcZBI2M9gnJTB
	 rNM+9TLvbzpYIaLgbWYUi2Bsf66NXsvZZfHsd+k+aOkAbuju2GyIYlvuYfiZ5s0zaB
	 Ghir0etXCncHmfvSSJDhrNjKYgtJ1ghf+Dq41ngHLndOPehGRZnzQ4OTjdqTetZ0XF
	 qcw8t2IN/8aPA==
Message-ID: <ca5a3441-768a-4331-a1c2-a4bdadf2f150@kernel.org>
Date: Tue, 11 Jun 2024 14:53:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/26] loop: stop using loop_reconfigure_limits in
 __loop_clr_fd
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
 <20240611051929.513387-4-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-4-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> __loop_clr_fd wants to clear all settings on the device.  Prepare for
> moving more settings into the block limits by open coding
> loop_reconfigure_limits.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/block/loop.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index 93780f41646b75..93a49c40a31a71 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -1133,6 +1133,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
>  
>  static void __loop_clr_fd(struct loop_device *lo, bool release)
>  {
> +	struct queue_limits lim;
>  	struct file *filp;
>  	gfp_t gfp = lo->old_gfp_mask;
>  
> @@ -1156,7 +1157,14 @@ static void __loop_clr_fd(struct loop_device *lo, bool release)
>  	lo->lo_offset = 0;
>  	lo->lo_sizelimit = 0;
>  	memset(lo->lo_file_name, 0, LO_NAME_SIZE);
> -	loop_reconfigure_limits(lo, 512, false);
> +
> +	/* reset the block size to the default */
> +	lim = queue_limits_start_update(lo->lo_queue);
> +	lim.logical_block_size = 512;

Nit: SECTOR_SIZE ? maybe ?

> +	lim.physical_block_size = 512;
> +	lim.io_min = 512;
> +	queue_limits_commit_update(lo->lo_queue, &lim);
> +
>  	invalidate_disk(lo->lo_disk);
>  	loop_sysfs_exit(lo);
>  	/* let user-space know about this change */

Otherwise, looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


