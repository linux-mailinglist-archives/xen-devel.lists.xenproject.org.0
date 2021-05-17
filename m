Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9FA382FE4
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 16:20:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128323.240931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lie6d-0006vB-0c; Mon, 17 May 2021 14:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128323.240931; Mon, 17 May 2021 14:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lie6c-0006rh-T3; Mon, 17 May 2021 14:20:26 +0000
Received: by outflank-mailman (input) for mailman id 128323;
 Mon, 17 May 2021 14:20:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lie6c-0006rb-5n
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 14:20:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a15a006d-cecd-4b62-b0d8-13c70180635c;
 Mon, 17 May 2021 14:20:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C0BC3B271;
 Mon, 17 May 2021 14:20:23 +0000 (UTC)
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
X-Inumbo-ID: a15a006d-cecd-4b62-b0d8-13c70180635c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621261224; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pBvkavdK2+tEKfPns8/0KtXvMxeeFCb6/eSO70iXjJI=;
	b=KLTOub7TZSUOtkuHjpjekTAeT7wCeVfOQvosdmBXGcqwk4DiC/5/awqVvT7u7JBOfoHIyE
	v7KGYFo5pFFclu6Ss7cK58jfDScXMPZZBsPG4CyN9PmNL1hEk1EfZO+4UK8ttQkgRhH+L2
	e/oEsvaU+rkOSW2y8kZNRwFlPjxMsro=
Subject: Re: [PATCH 5/8] xen/netfront: read response from backend only once
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 xen-devel@lists.xenproject.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-6-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c9f90370-fc02-3f05-0670-35f795c59d95@suse.com>
Date: Mon, 17 May 2021 16:20:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513100302.22027-6-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.05.2021 12:02, Juergen Gross wrote:
> In order to avoid problems in case the backend is modifying a response
> on the ring page while the frontend has already seen it, just read the
> response into a local buffer in one go and then operate on that buffer
> only.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remark:

> @@ -830,24 +830,22 @@ static int xennet_get_extras(struct netfront_queue *queue,
>  			break;
>  		}
>  
> -		extra = (struct xen_netif_extra_info *)
> -			RING_GET_RESPONSE(&queue->rx, ++cons);
> +		RING_COPY_RESPONSE(&queue->rx, ++cons, &extra);
>  
> -		if (unlikely(!extra->type ||
> -			     extra->type >= XEN_NETIF_EXTRA_TYPE_MAX)) {
> +		if (unlikely(!extra.type ||
> +			     extra.type >= XEN_NETIF_EXTRA_TYPE_MAX)) {
>  			if (net_ratelimit())
>  				dev_warn(dev, "Invalid extra type: %d\n",
> -					extra->type);
> +					extra.type);
>  			err = -EINVAL;
>  		} else {
> -			memcpy(&extras[extra->type - 1], extra,
> -			       sizeof(*extra));
> +			memcpy(&extras[extra.type - 1], &extra, sizeof(extra));

Maybe take the opportunity and switch to (type safe) structure
assignment?

Jan

