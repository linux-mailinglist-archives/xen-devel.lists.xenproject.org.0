Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F8C61E648
	for <lists+xen-devel@lfdr.de>; Sun,  6 Nov 2022 22:09:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.438984.692892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ormsX-0003No-0v; Sun, 06 Nov 2022 21:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 438984.692892; Sun, 06 Nov 2022 21:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ormsW-0003Ll-UM; Sun, 06 Nov 2022 21:08:28 +0000
Received: by outflank-mailman (input) for mailman id 438984;
 Sun, 06 Nov 2022 21:08:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ormsU-0003Lf-S8
 for xen-devel@lists.xenproject.org; Sun, 06 Nov 2022 21:08:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ormsU-0000s9-7i; Sun, 06 Nov 2022 21:08:26 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ormsU-00076O-26; Sun, 06 Nov 2022 21:08:26 +0000
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
	bh=FsPP+orV3AXD1euv1UytxsnCc1My4/1WAlhd2A++XL0=; b=SHXXb4mlf7C03sBj3dsWzmw/jf
	Y7hPd2R14rhXfiaGKWA6L5fLvWsd4D+vJA5EOZnqj89DX5FfPYS+8oGA+MtN3DmmxZMZhtwC7sHtl
	H0c6hyUnKVHpmWwVw+fx5n1nsmO8gCJCnR+P5YXrMCedlwi+IMCgpnfmO+7+twQXuX3k=;
Message-ID: <f89eb853-5adb-f63b-a587-ebd88a2c2c3d@xen.org>
Date: Sun, 6 Nov 2022 21:08:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH 03/20] tools/xenstore: let talloc_free() preserve errno
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221101152842.4257-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 01/11/2022 15:28, Juergen Gross wrote:
> Today talloc_free() is not guaranteed to preserve errno, especially in
> case a custom destructor is being used.
> 
> Change that by renaming talloc_free() to _talloc_free() in talloc.c and
> adding a wrapper to talloc.c.
> 
> This allows to remove some errno saving outside of talloc.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/talloc.c         | 25 ++++++++++++++++++-------
>   tools/xenstore/xenstored_core.c |  2 --
>   2 files changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/xenstore/talloc.c b/tools/xenstore/talloc.c
> index d7edcf3a93..5fbefdf091 100644
> --- a/tools/xenstore/talloc.c
> +++ b/tools/xenstore/talloc.c
> @@ -103,6 +103,8 @@ struct talloc_chunk {
>   	unsigned flags;
>   };
>   
> +static int _talloc_free(void *ptr);
> +
>   /* 16 byte alignment seems to keep everyone happy */
>   #define TC_HDR_SIZE ((sizeof(struct talloc_chunk)+15)&~15)
>   #define TC_PTR_FROM_CHUNK(tc) ((void *)(TC_HDR_SIZE + (char*)tc))
> @@ -245,7 +247,7 @@ static int talloc_reference_destructor(void *ptr)
>   		tc1->destructor = NULL;
>   	}
>   	_TLIST_REMOVE(tc2->refs, handle);
> -	talloc_free(handle);
> +	_talloc_free(handle);

 From the commit message, it is not clear to me why we are calling the 
underscore version here. Same for the others below.

>   	return 0;
>   }
>   
> @@ -311,7 +313,7 @@ static int talloc_unreference(const void *context, const void *ptr)
>   
>   	talloc_set_destructor(h, NULL);
>   	_TLIST_REMOVE(tc->refs, h);
> -	talloc_free(h);
> +	_talloc_free(h);
>   	return 0;
>   }
>   
> @@ -349,7 +351,7 @@ int talloc_unlink(const void *context, void *ptr)
>   	tc_p = talloc_chunk_from_ptr(ptr);
>   
>   	if (tc_p->refs == NULL) {
> -		return talloc_free(ptr);
> +		return _talloc_free(ptr);
>   	}
>   
>   	new_p = talloc_parent_chunk(tc_p->refs);
> @@ -521,7 +523,7 @@ static void talloc_free_children(void *ptr)
>   			struct talloc_chunk *p = talloc_parent_chunk(tc->child->refs);
>   			if (p) new_parent = TC_PTR_FROM_CHUNK(p);
>   		}
> -		if (talloc_free(child) == -1) {
> +		if (_talloc_free(child) == -1) {
>   			if (new_parent == null_context) {
>   				struct talloc_chunk *p = talloc_parent_chunk(ptr);
>   				if (p) new_parent = TC_PTR_FROM_CHUNK(p);
> @@ -539,7 +541,7 @@ static void talloc_free_children(void *ptr)
>      will not be freed if the ref_count is > 1 or the destructor (if
>      any) returns non-zero

Can you expand this comment to explain the different between 
_talloc_free() and talloc_free()?

I agree the code is probably clear enough, but better to be obvious.

>   */
> -int talloc_free(void *ptr)
> +static int _talloc_free(void *ptr)
>   {
>   	struct talloc_chunk *tc;
>   
> @@ -597,7 +599,16 @@ int talloc_free(void *ptr)
>   	return 0;
>   }
>   
> +int talloc_free(void *ptr)
> +{
> +	int ret;
> +	int saved_errno = errno;
>   
> +	ret = _talloc_free(ptr);
> +	errno = saved_errno;
> +
> +	return ret;
> +}
>   
>   /*
>     A talloc version of realloc. The context argument is only used if
> @@ -610,7 +621,7 @@ void *_talloc_realloc(const void *context, void *ptr, size_t size, const char *n
>   
>   	/* size zero is equivalent to free() */
>   	if (size == 0) {
> -		talloc_free(ptr);
> +		_talloc_free(ptr);
>   		return NULL;
>   	}
>   
> @@ -1243,7 +1254,7 @@ void *talloc_realloc_fn(const void *context, void *ptr, size_t size)
>   
>   static void talloc_autofree(void)
>   {
> -	talloc_free(cleanup_context);
> +	_talloc_free(cleanup_context);
>   	cleanup_context = NULL;
>   }
>   
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 476d5c6d51..5a174b9881 100644
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

Cheers,

-- 
Julien Grall

