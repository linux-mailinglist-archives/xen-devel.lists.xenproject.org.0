Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 651CD66DFB1
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 14:57:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479461.743328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmSG-0004F9-6e; Tue, 17 Jan 2023 13:56:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479461.743328; Tue, 17 Jan 2023 13:56:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHmSG-0004Ck-3u; Tue, 17 Jan 2023 13:56:48 +0000
Received: by outflank-mailman (input) for mailman id 479461;
 Tue, 17 Jan 2023 13:56:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHmSE-0004CK-0U
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 13:56:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmSD-00016w-Ib; Tue, 17 Jan 2023 13:56:45 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHmSD-0007bv-DU; Tue, 17 Jan 2023 13:56:45 +0000
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
	bh=K2Q2SWmwEwQtkuC/lM/GUj/xb6gxQ/qAW28lwp5CeuQ=; b=NZL8Ix6TZCe0AQApJc4gikKtTR
	ApWcaP3rM1+jjfQmvg5kmMNKIFJywiFoRk7e+P8nFDsrCItFdAClga0L/rLm8c6849zq45gj+3SIh
	/BF7lVVhjV7KSQo1lofQfNXq7jwoZJ4v8RZYBNpMvpl/pRP+nMnzd6UlsATBdd2ejcM0=;
Message-ID: <ca989bac-b710-c8d3-0bc1-67e22dc6ba41@xen.org>
Date: Tue, 17 Jan 2023 13:56:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 01/17] tools/xenstore: let talloc_free() preserve errno
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230117091124.22170-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 17/01/2023 09:11, Juergen Gross wrote:
> Today talloc_free() is not guaranteed to preserve errno, especially in
> case a custom destructor is being used.
> 
> So preserve errno in talloc_free().
> 
> This allows to remove some errno saving outside of talloc.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> V2:
> - drop wrapper (Julien Grall)
> ---
>   tools/xenstore/talloc.c         | 21 +++++++++++++--------
>   tools/xenstore/xenstored_core.c |  2 --
>   2 files changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/xenstore/talloc.c b/tools/xenstore/talloc.c
> index d7edcf3a93..23c3a23b19 100644
> --- a/tools/xenstore/talloc.c
> +++ b/tools/xenstore/talloc.c
> @@ -541,38 +541,39 @@ static void talloc_free_children(void *ptr)
>   */
>   int talloc_free(void *ptr)
>   {
> +	int saved_errno = errno;
>   	struct talloc_chunk *tc;
>   
>   	if (ptr == NULL) {
> -		return -1;
> +		goto err;
>   	}
>   
>   	tc = talloc_chunk_from_ptr(ptr);
>   
>   	if (tc->null_refs) {
>   		tc->null_refs--;
> -		return -1;
> +		goto err;
>   	}
>   
>   	if (tc->refs) {
>   		talloc_reference_destructor(tc->refs);
> -		return -1;
> +		goto err;
>   	}
>   
>   	if (tc->flags & TALLOC_FLAG_LOOP) {
>   		/* we have a free loop - stop looping */
> -		return 0;
> +		goto success;
>   	}
>   
>   	if (tc->destructor) {
>   		talloc_destructor_t d = tc->destructor;
>   		if (d == (talloc_destructor_t)-1) {
> -			return -1;
> +			goto err;
>   		}
>   		tc->destructor = (talloc_destructor_t)-1;
>   		if (d(ptr) == -1) {
>   			tc->destructor = d;
> -			return -1;
> +			goto err;
>   		}
>   		tc->destructor = NULL;
>   	}
> @@ -594,10 +595,14 @@ int talloc_free(void *ptr)
>   	tc->flags |= TALLOC_FLAG_FREE;
>   
>   	free(tc);
> + success:
> +	errno = saved_errno;
>   	return 0;
> -}
> -
>   
> + err:
> +	errno = saved_errno;
> +	return -1;
> +}
>   
>   /*
>     A talloc version of realloc. The context argument is only used if
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 78a3edaa4e..1650821922 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -771,9 +771,7 @@ struct node *read_node(struct connection *conn, const void *ctx,
>   	return node;
>   
>    error:
> -	err = errno;
>   	talloc_free(node);
> -	errno = err;
>   	return NULL;
>   }
>   

-- 
Julien Grall

