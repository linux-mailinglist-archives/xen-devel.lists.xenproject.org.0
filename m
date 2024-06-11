Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F259390355D
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 10:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738068.1144665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwgR-0007XN-J3; Tue, 11 Jun 2024 08:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738068.1144665; Tue, 11 Jun 2024 08:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sGwgR-0007Uf-Fb; Tue, 11 Jun 2024 08:16:47 +0000
Received: by outflank-mailman (input) for mailman id 738068;
 Tue, 11 Jun 2024 08:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7xGt=NN=kernel.org=dlemoal@srs-se1.protection.inumbo.net>)
 id 1sGwgQ-0006yV-3S
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 08:16:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eff57d90-27ca-11ef-b4bb-af5377834399;
 Tue, 11 Jun 2024 10:16:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E04C060C3E;
 Tue, 11 Jun 2024 08:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A204C2BD10;
 Tue, 11 Jun 2024 08:16:38 +0000 (UTC)
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
X-Inumbo-ID: eff57d90-27ca-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718093802;
	bh=0xCsZy2WAGO31vOt2jMux3XsQG5JzkwMLoCsgqbDM7s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BshMQEOFKHQCAeU7Uq7D/QqRf+yvZZUvvFAljFVHRMbxOyzti+TjMe0D1IJKi9gMV
	 zyUA+05eoWqeEmhuLL8uoXj2uFvoj39+EiUXirtXWtXQFdTuvV4hWDH4qLaMCjLfy+
	 AnqgnZ0xCGWpIVHNkCHGqby5QcQzPelY2FXqqGrtk4KASWZEpNZldaxiF+wB3Rw9dc
	 xbMnzOX/e3WR+yoGOTEoauLs/X9V3dTUosPnw+YpOF05bIeErHzOz8DqMDnd798OeG
	 g23Oj4HG5YREgeqkRw2UIxm1G6V2rlg7SUCDzzjKvw7jq8xou/AYaSDtybrj1/IgEi
	 S8SrLRUjTG4qQ==
Message-ID: <4845aae8-ad03-407e-bf31-f164b8f684d4@kernel.org>
Date: Tue, 11 Jun 2024 17:16:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/26] block: move the nowait flag to queue_limits
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
 <20240611051929.513387-20-hch@lst.de>
Content-Language: en-US
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20240611051929.513387-20-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/11/24 2:19 PM, Christoph Hellwig wrote:
> Move the nowait flag into the queue_limits feature field so that it
> can be set atomically and all I/O is frozen when changing the flag.
> 
> Stacking drivers are simplified in that they now can simply set the
> flag, and blk_stack_limits will clear it when the features is not
> supported by any of the underlying devices.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>


> @@ -1825,9 +1815,7 @@ int dm_table_set_restrictions(struct dm_table *t, struct request_queue *q,
>  	int r;
>  
>  	if (dm_table_supports_nowait(t))
> -		blk_queue_flag_set(QUEUE_FLAG_NOWAIT, q);
> -	else
> -		blk_queue_flag_clear(QUEUE_FLAG_NOWAIT, q);
> +		limits->features &= ~BLK_FEAT_NOWAIT;

Shouldn't you set the flag here instead of clearing it ?

-- 
Damien Le Moal
Western Digital Research


