Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB072B86C8
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 22:35:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30270.60192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfV6R-0000VO-1p; Wed, 18 Nov 2020 21:34:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30270.60192; Wed, 18 Nov 2020 21:34:59 +0000
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
	id 1kfV6Q-0000Ua-TX; Wed, 18 Nov 2020 21:34:58 +0000
Received: by outflank-mailman (input) for mailman id 30270;
 Wed, 18 Nov 2020 21:34:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WhnZ=EY=suse.cz=jack@srs-us1.protection.inumbo.net>)
 id 1kfV6P-0008UU-4N
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 21:34:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 463f5f42-8ca5-494c-ad34-a4fa77ff401f;
 Wed, 18 Nov 2020 21:34:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53C3FB019;
 Wed, 18 Nov 2020 21:34:24 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 716231E1328; Wed, 18 Nov 2020 15:41:05 +0100 (CET)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=WhnZ=EY=suse.cz=jack@srs-us1.protection.inumbo.net>)
	id 1kfV6P-0008UU-4N
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 21:34:57 +0000
X-Inumbo-ID: 463f5f42-8ca5-494c-ad34-a4fa77ff401f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 463f5f42-8ca5-494c-ad34-a4fa77ff401f;
	Wed, 18 Nov 2020 21:34:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 53C3FB019;
	Wed, 18 Nov 2020 21:34:24 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
	id 716231E1328; Wed, 18 Nov 2020 15:41:05 +0100 (CET)
Date: Wed, 18 Nov 2020 15:41:05 +0100
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>,
	Josef Bacik <josef@toxicpanda.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Coly Li <colyli@suse.de>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Richard Weinberger <richard@nod.at>,
	Jan Kara <jack@suse.com>, linux-block@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH 08/20] init: refactor devt_from_partuuid
Message-ID: <20201118144105.GM1981@quack2.suse.cz>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-9-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201118084800.2339180-9-hch@lst.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Wed 18-11-20 09:47:48, Christoph Hellwig wrote:
> The code in devt_from_partuuid is very convoluted.  Refactor a bit by
> sanitizing the goto and variable name usage.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

The patch looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  init/do_mounts.c | 68 ++++++++++++++++++++++--------------------------
>  1 file changed, 31 insertions(+), 37 deletions(-)
> 
> diff --git a/init/do_mounts.c b/init/do_mounts.c
> index aef2f24461c7f1..afa26a4028d25e 100644
> --- a/init/do_mounts.c
> +++ b/init/do_mounts.c
> @@ -105,13 +105,10 @@ static int match_dev_by_uuid(struct device *dev, const void *data)
>   */
>  static dev_t devt_from_partuuid(const char *uuid_str)
>  {
> -	dev_t res = 0;
>  	struct uuidcmp cmp;
>  	struct device *dev = NULL;
> -	struct gendisk *disk;
> -	struct hd_struct *part;
> +	dev_t devt = 0;
>  	int offset = 0;
> -	bool clear_root_wait = false;
>  	char *slash;
>  
>  	cmp.uuid = uuid_str;
> @@ -120,52 +117,49 @@ static dev_t devt_from_partuuid(const char *uuid_str)
>  	/* Check for optional partition number offset attributes. */
>  	if (slash) {
>  		char c = 0;
> +
>  		/* Explicitly fail on poor PARTUUID syntax. */
> -		if (sscanf(slash + 1,
> -			   "PARTNROFF=%d%c", &offset, &c) != 1) {
> -			clear_root_wait = true;
> -			goto done;
> -		}
> +		if (sscanf(slash + 1, "PARTNROFF=%d%c", &offset, &c) != 1)
> +			goto clear_root_wait;
>  		cmp.len = slash - uuid_str;
>  	} else {
>  		cmp.len = strlen(uuid_str);
>  	}
>  
> -	if (!cmp.len) {
> -		clear_root_wait = true;
> -		goto done;
> -	}
> +	if (!cmp.len)
> +		goto clear_root_wait;
>  
> -	dev = class_find_device(&block_class, NULL, &cmp,
> -				&match_dev_by_uuid);
> +	dev = class_find_device(&block_class, NULL, &cmp, &match_dev_by_uuid);
>  	if (!dev)
> -		goto done;
> -
> -	res = dev->devt;
> +		return 0;
>  
> -	/* Attempt to find the partition by offset. */
> -	if (!offset)
> -		goto no_offset;
> +	if (offset) {
> +		/*
> +		 * Attempt to find the requested partition by adding an offset
> +		 * to the partition number found by UUID.
> +		 */
> +		struct hd_struct *part;
>  
> -	res = 0;
> -	disk = part_to_disk(dev_to_part(dev));
> -	part = disk_get_part(disk, dev_to_part(dev)->partno + offset);
> -	if (part) {
> -		res = part_devt(part);
> -		put_device(part_to_dev(part));
> +		part = disk_get_part(dev_to_disk(dev),
> +				     dev_to_part(dev)->partno + offset);
> +		if (part) {
> +			devt = part_devt(part);
> +			put_device(part_to_dev(part));
> +		}
> +	} else {
> +		devt = dev->devt;
>  	}
>  
> -no_offset:
>  	put_device(dev);
> -done:
> -	if (clear_root_wait) {
> -		pr_err("VFS: PARTUUID= is invalid.\n"
> -		       "Expected PARTUUID=<valid-uuid-id>[/PARTNROFF=%%d]\n");
> -		if (root_wait)
> -			pr_err("Disabling rootwait; root= is invalid.\n");
> -		root_wait = 0;
> -	}
> -	return res;
> +	return devt;
> +
> +clear_root_wait:
> +	pr_err("VFS: PARTUUID= is invalid.\n"
> +	       "Expected PARTUUID=<valid-uuid-id>[/PARTNROFF=%%d]\n");
> +	if (root_wait)
> +		pr_err("Disabling rootwait; root= is invalid.\n");
> +	root_wait = 0;
> +	return 0;
>  }
>  
>  /**
> -- 
> 2.29.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

