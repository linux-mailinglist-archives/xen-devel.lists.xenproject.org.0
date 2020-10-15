Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF03228F4C0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Oct 2020 16:30:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7426.19398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kT4Gj-0005g5-03; Thu, 15 Oct 2020 14:30:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7426.19398; Thu, 15 Oct 2020 14:30:12 +0000
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
	id 1kT4Gi-0005fg-T8; Thu, 15 Oct 2020 14:30:12 +0000
Received: by outflank-mailman (input) for mailman id 7426;
 Thu, 15 Oct 2020 14:30:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sFLp=DW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kT4Gh-0005fb-Ed
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:30:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c420136e-482f-47cc-a5fe-308673b7ab11;
 Thu, 15 Oct 2020 14:30:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D379AC24;
 Thu, 15 Oct 2020 14:30:09 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sFLp=DW=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kT4Gh-0005fb-Ed
	for xen-devel@lists.xenproject.org; Thu, 15 Oct 2020 14:30:11 +0000
X-Inumbo-ID: c420136e-482f-47cc-a5fe-308673b7ab11
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c420136e-482f-47cc-a5fe-308673b7ab11;
	Thu, 15 Oct 2020 14:30:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602772209;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBFlgAaq0O3il+qQFEc0ZaY+TncdaaVKCCP2EAaai30=;
	b=RzMr/0HWeuj8biN+UO6Kh2qtwi3d4LazBCd9n3G2hkvhC/lGbGLt0tK2AF+2ydDY7ZQXdL
	PttM1r+Gx/Ul5tGU2FpVTaYSX8HKee47b3Ofbf6D2Vj/PfHao9RJzAJWSCH2IwwY0hcSzz
	wdYUIRhmCiI74LYYvGo5zsX9LXk51Mo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8D379AC24;
	Thu, 15 Oct 2020 14:30:09 +0000 (UTC)
Subject: Re: [PATCH 1/2] xen/blkback: turn the cache purge LRU interval into a
 parameter
To: Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Jens Axboe <axboe@kernel.dk>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 SeongJae Park <sjpark@amazon.de>, xen-devel@lists.xenproject.org,
 linux-block@vger.kernel.org, "J . Roeleveld" <joost@antarean.org>
References: <20201015142416.70294-1-roger.pau@citrix.com>
 <20201015142416.70294-2-roger.pau@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <3441104d-7234-a0c3-8b15-7d5a1126182b@suse.com>
Date: Thu, 15 Oct 2020 16:30:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201015142416.70294-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 15.10.20 16:24, Roger Pau Monne wrote:
> Assume that reads and writes to the variable will be atomic. The worse
> that could happen is that one of the LRU intervals is not calculated
> properly if a partially written value is read, but that would only be
> a transient issue.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
> Cc: Jens Axboe <axboe@kernel.dk>
> Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
> Cc: SeongJae Park <sjpark@amazon.de>
> Cc: xen-devel@lists.xenproject.org
> Cc: linux-block@vger.kernel.org
> Cc: J. Roeleveld <joost@antarean.org>
> Cc: Jürgen Groß <jgross@suse.com>
> ---
>   Documentation/ABI/testing/sysfs-driver-xen-blkback | 10 ++++++++++
>   drivers/block/xen-blkback/blkback.c                |  9 ++++++---
>   2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-xen-blkback b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> index ecb7942ff146..776f25d335ca 100644
> --- a/Documentation/ABI/testing/sysfs-driver-xen-blkback
> +++ b/Documentation/ABI/testing/sysfs-driver-xen-blkback
> @@ -35,3 +35,13 @@ Description:
>                   controls the duration in milliseconds that blkback will not
>                   cache any page not backed by a grant mapping.
>                   The default is 10ms.
> +
> +What:           /sys/module/xen_blkback/parameters/lru_internval

s/lru_internval/lru_interval/

> +Date:           October 2020
> +KernelVersion:  5.10
> +Contact:        Roger Pau Monné <roger.pau@citrix.com>
> +Description:
> +                The LRU mechanism to clean the lists of persistent grants needs
> +                to be executed periodically. This parameter controls the time
> +                interval between consecutive executions of the purge mechanism
> +                is set in ms.
> diff --git a/drivers/block/xen-blkback/blkback.c b/drivers/block/xen-blkback/blkback.c
> index adfc9352351d..6ad9b76fdb2b 100644
> --- a/drivers/block/xen-blkback/blkback.c
> +++ b/drivers/block/xen-blkback/blkback.c
> @@ -117,7 +117,10 @@ MODULE_PARM_DESC(max_ring_page_order, "Maximum order of pages to be used for the
>    * be executed periodically. The time interval between consecutive executions
>    * of the purge mechanism is set in ms.
>    */
> -#define LRU_INTERVAL 100
> +static unsigned int lru_interval = 100;
> +module_param_named(lru_interval, lru_interval, uint, 0644);
> +MODULE_PARM_DESC(lru_internval,

s/lru_internval/lru_interval/

> +		 "Time interval between consecutive executions of the cache purge mechanism (in ms)");
>   
>   /*
>    * When the persistent grants list is full we will remove unused grants
> @@ -620,7 +623,7 @@ int xen_blkif_schedule(void *arg)
>   		if (unlikely(vbd->size != vbd_sz(vbd)))
>   			xen_vbd_resize(blkif);
>   
> -		timeout = msecs_to_jiffies(LRU_INTERVAL);
> +		timeout = msecs_to_jiffies(lru_interval);
>   
>   		timeout = wait_event_interruptible_timeout(
>   			ring->wq,
> @@ -650,7 +653,7 @@ int xen_blkif_schedule(void *arg)
>   		if (blkif->vbd.feature_gnt_persistent &&
>   		    time_after(jiffies, ring->next_lru)) {
>   			purge_persistent_gnt(ring);
> -			ring->next_lru = jiffies + msecs_to_jiffies(LRU_INTERVAL);
> +			ring->next_lru = jiffies + msecs_to_jiffies(lru_interval);
>   		}
>   
>   		/* Shrink the free pages pool if it is too large. */
> 


Juergen

