Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3937B3FAA07
	for <lists+xen-devel@lfdr.de>; Sun, 29 Aug 2021 09:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174573.318325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKFam-0003Um-V7; Sun, 29 Aug 2021 07:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174573.318325; Sun, 29 Aug 2021 07:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKFam-0003Sz-S6; Sun, 29 Aug 2021 07:51:00 +0000
Received: by outflank-mailman (input) for mailman id 174573;
 Sun, 29 Aug 2021 07:50:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Chlj=NU=suse.de=colyli@srs-us1.protection.inumbo.net>)
 id 1mKFak-0003St-Mo
 for xen-devel@lists.xenproject.org; Sun, 29 Aug 2021 07:50:58 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id adbab187-e2c7-44e3-a6d6-2a93e0af5a16;
 Sun, 29 Aug 2021 07:50:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 30EC12001C;
 Sun, 29 Aug 2021 07:50:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D2FD0139F6;
 Sun, 29 Aug 2021 07:50:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gOd5KVs8K2GGHQAAMHmgww
 (envelope-from <colyli@suse.de>); Sun, 29 Aug 2021 07:50:51 +0000
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
X-Inumbo-ID: adbab187-e2c7-44e3-a6d6-2a93e0af5a16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1630223456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73J2UE8Czy++p+oC2c1YQ/nI6lCZX18/T7xzfmn1GQM=;
	b=U/JTwI4r3UueWPSbL2BXG0B/1O//PhaHiI20X1CFPhvqcKVCPcipBO2UjcWjYYOYezDHsc
	jz+dY5JD+n47H2SRr9A44KhZB4Wor9uJqqtN7Qc6hIlEktbVPMVYm6O6BTv5kEv6tb9Crr
	SZLxy6G82g8to2hSA7W15AVvHpWWETo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1630223456;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73J2UE8Czy++p+oC2c1YQ/nI6lCZX18/T7xzfmn1GQM=;
	b=MpYnVtu9WN8URWUoLPwSo92l76vQxZyq4UzwCv00Idt0AlLalqJbPnZZrNzWkIueaKk2T9
	6+2V/KTFaZfEzEBg==
Subject: Re: [PATCH 02/10] bcache: add error handling support for add_disk()
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: xen-devel@lists.xenproject.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-bcache@vger.kernel.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, axboe@kernel.dk,
 kent.overstreet@gmail.com, kbusch@kernel.org, sagi@grimberg.me,
 vishal.l.verma@intel.com, dan.j.williams@intel.com, dave.jiang@intel.com,
 ira.weiny@intel.com, konrad.wilk@oracle.com, roger.pau@citrix.com,
 boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
 minchan@kernel.org, ngupta@vflare.org, senozhatsky@chromium.org
References: <20210827191809.3118103-1-mcgrof@kernel.org>
 <20210827191809.3118103-3-mcgrof@kernel.org>
From: Coly Li <colyli@suse.de>
Message-ID: <59a4ce06-22ee-7047-487e-621da3f7c507@suse.de>
Date: Sun, 29 Aug 2021 15:50:49 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210827191809.3118103-3-mcgrof@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 8/28/21 3:18 AM, Luis Chamberlain wrote:
> We never checked for errors on add_disk() as this function
> returned void. Now that this is fixed, use the shiny new
> error handling.
>
> This driver doesn't do any unwinding with blk_cleanup_disk()
> even on errors after add_disk() and so we follow that
> tradition.
>
> Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>

Acked-by: Coly Li <colyli@suse.de>

Thanks.

> ---
>   drivers/md/bcache/super.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/md/bcache/super.c b/drivers/md/bcache/super.c
> index f2874c77ff79..f0c32cdd6594 100644
> --- a/drivers/md/bcache/super.c
> +++ b/drivers/md/bcache/super.c
> @@ -1082,7 +1082,9 @@ int bch_cached_dev_run(struct cached_dev *dc)
>   		closure_sync(&cl);
>   	}
>   
> -	add_disk(d->disk);
> +	ret = add_disk(d->disk);
> +	if (ret)
> +		goto out;
>   	bd_link_disk_holder(dc->bdev, dc->disk.disk);
>   	/*
>   	 * won't show up in the uevent file, use udevadm monitor -e instead
> @@ -1534,10 +1536,11 @@ static void flash_dev_flush(struct closure *cl)
>   
>   static int flash_dev_run(struct cache_set *c, struct uuid_entry *u)
>   {
> +	int err = -ENOMEM;
>   	struct bcache_device *d = kzalloc(sizeof(struct bcache_device),
>   					  GFP_KERNEL);
>   	if (!d)
> -		return -ENOMEM;
> +		goto err_ret;
>   
>   	closure_init(&d->cl, NULL);
>   	set_closure_fn(&d->cl, flash_dev_flush, system_wq);
> @@ -1551,9 +1554,12 @@ static int flash_dev_run(struct cache_set *c, struct uuid_entry *u)
>   	bcache_device_attach(d, c, u - c->uuids);
>   	bch_sectors_dirty_init(d);
>   	bch_flash_dev_request_init(d);
> -	add_disk(d->disk);
> +	err = add_disk(d->disk);
> +	if (err)
> +		goto err;
>   
> -	if (kobject_add(&d->kobj, &disk_to_dev(d->disk)->kobj, "bcache"))
> +	err = kobject_add(&d->kobj, &disk_to_dev(d->disk)->kobj, "bcache");
> +	if (err)
>   		goto err;
>   
>   	bcache_device_link(d, c, "volume");
> @@ -1567,7 +1573,8 @@ static int flash_dev_run(struct cache_set *c, struct uuid_entry *u)
>   	return 0;
>   err:
>   	kobject_put(&d->kobj);
> -	return -ENOMEM;
> +err_ret:
> +	return err;
>   }
>   
>   static int flash_devs_run(struct cache_set *c)


