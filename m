Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34048382E1A
	for <lists+xen-devel@lfdr.de>; Mon, 17 May 2021 16:01:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128292.240886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidnt-0002ed-Ft; Mon, 17 May 2021 14:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128292.240886; Mon, 17 May 2021 14:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lidnt-0002co-Cy; Mon, 17 May 2021 14:01:05 +0000
Received: by outflank-mailman (input) for mailman id 128292;
 Mon, 17 May 2021 14:01:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FIJu=KM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lidnr-0002ci-TQ
 for xen-devel@lists.xenproject.org; Mon, 17 May 2021 14:01:03 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2c4332d7-69a9-4752-9c54-e65bff54d52b;
 Mon, 17 May 2021 14:01:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 67309AC8F;
 Mon, 17 May 2021 14:01:01 +0000 (UTC)
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
X-Inumbo-ID: 2c4332d7-69a9-4752-9c54-e65bff54d52b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621260061; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+NdK/avQ8FBevNdzVt7abclY7ENC4Xp3kwu3bH3BXGU=;
	b=hYPsv114snNpTzRdG0F8FjOixxA+SuYB69/5PExQu2q6jetyOORhTmI33XUIRFQoSsuumH
	wm8zR2YajUMDfNKrOTJZip22sEn+XReUuQtivi9aVHWVXxe3Q/Ne8zCb43HBKhQol9uRzg
	SbZcgBXtsfJDlrDU97x5cATUj+CAjT4=
Subject: Re: [PATCH 3/8] xen/blkfront: don't take local copy of a request from
 the ring page
To: Juergen Gross <jgross@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
References: <20210513100302.22027-1-jgross@suse.com>
 <20210513100302.22027-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4cbf7b7f-5f00-4aba-4d54-06aa73d1bc32@suse.com>
Date: Mon, 17 May 2021 16:01:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210513100302.22027-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.05.2021 12:02, Juergen Gross wrote:
> In order to avoid a malicious backend being able to influence the local
> copy of a request build the request locally first and then copy it to
> the ring page instead of doing it the other way round as today.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remark/question:

> @@ -703,6 +704,7 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
>  {
>  	struct blkfront_info *info = rinfo->dev_info;
>  	struct blkif_request *ring_req, *extra_ring_req = NULL;
> +	struct blkif_request *final_ring_req, *final_extra_ring_req;

Without setting final_extra_ring_req to NULL just like is done for
extra_ring_req, ...

> @@ -840,10 +845,10 @@ static int blkif_queue_rw_req(struct request *req, struct blkfront_ring_info *ri
>  	if (setup.segments)
>  		kunmap_atomic(setup.segments);
>  
> -	/* Keep a private copy so we can reissue requests when recovering. */
> -	rinfo->shadow[id].req = *ring_req;
> +	/* Copy request(s) to the ring page. */
> +	*final_ring_req = *ring_req;
>  	if (unlikely(require_extra_req))
> -		rinfo->shadow[extra_id].req = *extra_ring_req;
> +		*final_extra_ring_req = *extra_ring_req;

... are you sure all supported compilers will recognize the
conditional use and not warn about use of a possibly uninitialized
variable?

Jan

