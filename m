Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABB16F4A26
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 21:10:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528788.822369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptvNl-0002c8-B0; Tue, 02 May 2023 19:09:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528788.822369; Tue, 02 May 2023 19:09:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptvNl-0002Ym-8B; Tue, 02 May 2023 19:09:49 +0000
Received: by outflank-mailman (input) for mailman id 528788;
 Tue, 02 May 2023 19:09:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ptvNj-0002Yg-V4
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 19:09:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ptvNi-00046d-Un; Tue, 02 May 2023 19:09:46 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.27.23]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ptvNi-0005pv-Oo; Tue, 02 May 2023 19:09:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=PQKNilhygwzDZCPuPcBWG5h80MuAqj51hGz16gI1WKI=; b=DMe6v1X6sejoZtew8uhtaR2Uyv
	sA3qEhyiP0+gDqjWtRj+EZZjr0NlZ7gf+k5Pow/h+tBNdpseczojI1WGOYQzUhY9pDYG74sfj1wVe
	4rsJ4pLvNYPtpvADJVpeW38QRE0+LO7qOmcKhNKxGUPSxUuI0A2zT/PigfRcgvd/qqfc=;
Message-ID: <25027287-441a-304c-f035-0d3da3572d3a@xen.org>
Date: Tue, 2 May 2023 20:09:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 07/13] tools/xenstore: use accounting data array for
 per-domain values
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-8-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230405070349.25293-8-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 05/04/2023 08:03, Juergen Gross wrote:
> diff --git a/tools/xenstore/xenstored_domain.h b/tools/xenstore/xenstored_domain.h
> index 5cfd730cf6..0d61bf4344 100644
> --- a/tools/xenstore/xenstored_domain.h
> +++ b/tools/xenstore/xenstored_domain.h
> @@ -28,7 +28,10 @@ enum accitem {
>   	ACC_NODES,
>   	ACC_REQ_N,		/* Number of elements per request. */
>   	ACC_TR_N = ACC_REQ_N,	/* Number of elements per transaction. */
> -	ACC_N = ACC_TR_N,	/* Number of elements per domain. */
> +	ACC_WATCH = ACC_TR_N,
> +	ACC_OUTST,
> +	ACC_MEM,
> +	ACC_N,			/* Number of elements per domain. */
>   };
>   
>   void handle_event(void);
> @@ -107,9 +110,8 @@ static inline void domain_memory_add_nochk(struct connection *conn,
>   void domain_watch_inc(struct connection *conn);
>   void domain_watch_dec(struct connection *conn);
>   int domain_watch(struct connection *conn);
> -void domain_outstanding_inc(struct connection *conn);
> -void domain_outstanding_dec(struct connection *conn);
> -void domain_outstanding_domid_dec(unsigned int domid);
> +void domain_outstanding_inc(struct connection *conn, unsigned int domid);

AFAICT, all the caller of domain_outstanding_inc() will pass 'conn->id'. 
So it is not entirely clear what's the benefits to add the extra parameter.

I am not against this change (and same for removing *domid_dec()). But I 
think this ought to be explained in the commit message as this feels 
unrelated.

> +void domain_outstanding_dec(struct connection *conn, unsigned int domid);
>   int domain_get_quota(const void *ctx, struct connection *conn,
>   		     unsigned int domid);
>   

Cheers,

-- 
Julien Grall

