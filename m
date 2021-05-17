Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFF8383441
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 17:08:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128351.240975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lieqw-0004cj-KA; Mon, 17 May 2021 15:08:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128351.240975; Mon, 17 May 2021 15:08:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lieqw-0004Zl-G5; Mon, 17 May 2021 15:08:18 +0000
Received: by outflank-mailman (input) for mailman id 128351;
 Mon, 17 May 2021 15:08:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1liequ-0004Zf-T9
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 15:08:16 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b4cd7299-4a29-4c85-9c88-4a6e90d2183e;
 Mon, 17 May 2021 15:08:15 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A90C7AF2C;
 Mon, 17 May 2021 15:08:14 +0000 (UTC)
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
X-Inumbo-ID: b4cd7299-4a29-4c85-9c88-4a6e90d2183e
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621264094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PTgCAclxCK80C0ynDaeVVPOUMYjSdOogYauiOm/CJrI=;
	b=MArlY3MJXa+52P1t/iSJJeD/qNAhCuTAN0iZOJJ2q9uaYg9bu/wWt0bE9R1mPPeG64q4pu
	h0EqiSrA+2ZJmPbzFGcOWPfk6kIk5ibIXP/l5JbxO8ojYUQfP8wSDwQaVeWVO/GpFVPaug
	h+LDH9s3QLePU+fKgk4qMW3/659oFww=
Subject: Re: [PATCH 6/8] xen/netfront: don't read data from request on the
 ring page
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-7-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <72cb5265-aca2-8717-6860-19b66ccf9191@suse.com>
Date: Mon, 17 May 2021 17:08:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513100302.22027-7-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.05.2021 12:03, Juergen Gross wrote:
> In order to avoid a malicious backend being able to influence the local
> processing of a request build the request locally first and then copy
> it to the ring page. Any reading from the request needs to be done on
> the local instance.

"Any reading" isn't really true - you don't change xennet_make_one_txreq(),
yet that has a read-modify-write operation. Without that I would have
been inclined to ask whether ...

> --- a/drivers/net/xen-netfront.c
> +++ b/drivers/net/xen-netfront.c
> @@ -435,7 +435,8 @@ struct xennet_gnttab_make_txreq {
>  	struct netfront_queue *queue;
>  	struct sk_buff *skb;
>  	struct page *page;
> -	struct xen_netif_tx_request *tx; /* Last request */
> +	struct xen_netif_tx_request *tx;      /* Last request on ring page */
> +	struct xen_netif_tx_request tx_local; /* Last request local copy*/

... retaining the tx field here is a good idea.

> @@ -463,30 +464,27 @@ static void xennet_tx_setup_grant(unsigned long gfn, unsigned int offset,
>  	queue->grant_tx_page[id] = page;
>  	queue->grant_tx_ref[id] = ref;
>  
> -	tx->id = id;
> -	tx->gref = ref;
> -	tx->offset = offset;
> -	tx->size = len;
> -	tx->flags = 0;
> +	info->tx_local.id = id;
> +	info->tx_local.gref = ref;
> +	info->tx_local.offset = offset;
> +	info->tx_local.size = len;
> +	info->tx_local.flags = 0;
> +
> +	*tx = info->tx_local;
>  
>  	info->tx = tx;
> -	info->size += tx->size;
> +	info->size += info->tx_local.size;
>  }
>  
>  static struct xen_netif_tx_request *xennet_make_first_txreq(
> -	struct netfront_queue *queue, struct sk_buff *skb,
> -	struct page *page, unsigned int offset, unsigned int len)
> +	struct xennet_gnttab_make_txreq *info,
> +	unsigned int offset, unsigned int len)
>  {
> -	struct xennet_gnttab_make_txreq info = {
> -		.queue = queue,
> -		.skb = skb,
> -		.page = page,
> -		.size = 0,
> -	};
> +	info->size = 0;
>  
> -	gnttab_for_one_grant(page, offset, len, xennet_tx_setup_grant, &info);
> +	gnttab_for_one_grant(info->page, offset, len, xennet_tx_setup_grant, info);
>  
> -	return info.tx;
> +	return info->tx;
>  }

Similarly this returning of a pointer into the ring looks at least
risky to me. At the very least it looks as if ...

> @@ -704,14 +699,16 @@ static netdev_tx_t xennet_start_xmit(struct sk_buff *skb, struct net_device *dev
>  	}
>  
>  	/* First request for the linear area. */
> -	first_tx = tx = xennet_make_first_txreq(queue, skb,
> -						page, offset, len);
> +	info.queue = queue;
> +	info.skb = skb;
> +	info.page = page;
> +	first_tx = tx = xennet_make_first_txreq(&info, offset, len);

... you could avoid setting tx here; perhaps the local variable
could go away altogether, showing it's really just first_rx that
is still needed. It's odd that ...

>  	offset += tx->size;

... you don't change this one, when ...

>  	if (offset == PAGE_SIZE) {
>  		page++;
>  		offset = 0;
>  	}
> -	len -= tx->size;
> +	len -= info.tx_local.size;

... you do so here. Likely just an oversight.

Jan

