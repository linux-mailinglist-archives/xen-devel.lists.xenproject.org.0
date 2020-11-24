Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B742C28C3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:53:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36389.68287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYl5-0000qN-4N; Tue, 24 Nov 2020 13:53:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36389.68287; Tue, 24 Nov 2020 13:53:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYl5-0000py-11; Tue, 24 Nov 2020 13:53:27 +0000
Received: by outflank-mailman (input) for mailman id 36389;
 Tue, 24 Nov 2020 13:53:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IyBN=E6=suse.de=colyli@srs-us1.protection.inumbo.net>)
 id 1khYak-000505-2s
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:42:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70400235-bde5-4dc3-8c2b-19a99aafe489;
 Tue, 24 Nov 2020 13:41:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EE837AC2D;
 Tue, 24 Nov 2020 13:41:53 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=IyBN=E6=suse.de=colyli@srs-us1.protection.inumbo.net>)
	id 1khYak-000505-2s
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:42:46 +0000
X-Inumbo-ID: 70400235-bde5-4dc3-8c2b-19a99aafe489
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 70400235-bde5-4dc3-8c2b-19a99aafe489;
	Tue, 24 Nov 2020 13:41:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EE837AC2D;
	Tue, 24 Nov 2020 13:41:53 +0000 (UTC)
Subject: Re: [PATCH 13/45] block: add a bdev_kobj helper
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Tejun Heo <tj@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Mike Snitzer <snitzer@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.cz>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, dm-devel@redhat.com,
 Richard Weinberger <richard@nod.at>, Jan Kara <jack@suse.com>,
 linux-block@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-14-hch@lst.de>
From: Coly Li <colyli@suse.de>
Message-ID: <cb689e01-60dc-9df8-3a94-006bc3c39367@suse.de>
Date: Tue, 24 Nov 2020 21:41:47 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201124132751.3747337-14-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/24/20 9:27 PM, Christoph Hellwig wrote:
> Add a little helper to find the kobject for a struct block_device.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

For the bcache part, Acked-by: Coly Li <colyli@suse.de>

Thanks.

Coly Li

> ---
>  drivers/md/bcache/super.c |  7 ++-----
>  drivers/md/md.c           |  4 +---
>  fs/block_dev.c            |  6 +++---
>  fs/btrfs/sysfs.c          | 15 +++------------
>  include/linux/blk_types.h |  3 +++
>  5 files changed, 12 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index 46a00134a36ae1..a6a5e21e4fd136 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -1447,8 +1447,7 @@ static int register_bdev(struct cache_sb *sb, struct cache_sb_disk *sb_disk,
>  		goto err;
>  
>  	err = "error creating kobject";
> -	if (kobject_add(&dc->disk.kobj, &part_to_dev(bdev->bd_part)->kobj,
> -			"bcache"))
> +	if (kobject_add(&dc->disk.kobj, bdev_kobj(bdev), "bcache"))
>  		goto err;
>  	if (bch_cache_accounting_add_kobjs(&dc->accounting, &dc->disk.kobj))
>  		goto err;
> @@ -2342,9 +2341,7 @@ static int register_cache(struct cache_sb *sb, struct cache_sb_disk *sb_disk,
>  		goto err;
>  	}
>  
> -	if (kobject_add(&ca->kobj,
> -			&part_to_dev(bdev->bd_part)->kobj,
> -			"bcache")) {
> +	if (kobject_add(&ca->kobj, bdev_kobj(bdev), "bcache")) {
>  		err = "error calling kobject_add";
>  		ret = -ENOMEM;
>  		goto out;

[snipped]

