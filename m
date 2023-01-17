Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BE7670B1D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 23:04:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479855.743944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHu3a-0007pI-7E; Tue, 17 Jan 2023 22:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479855.743944; Tue, 17 Jan 2023 22:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHu3a-0007nJ-3D; Tue, 17 Jan 2023 22:03:50 +0000
Received: by outflank-mailman (input) for mailman id 479855;
 Tue, 17 Jan 2023 22:03:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHu3Y-0007nB-LN
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 22:03:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHu3W-0004nT-Am; Tue, 17 Jan 2023 22:03:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHu3W-0008V9-5z; Tue, 17 Jan 2023 22:03:46 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=Tr0Mvs1nz7nw/iWg1OqAOwcbB4DZU8RC0rcQMqMT5SM=; b=T1NrI8RGiAKZv8jLoFvw3ILhjb
	ZqyRptTZxm6tkbSdllq5VjYsAs8dizt134ydG3wXtD4DFd5MS6jf/c4L5YYy9fYUEQvAbaRDUcC1h
	nFODSSt+I8ee9m3ta3XDW7Ecle2rG7/U21ZOISi7GRGGlJIZBfgTXTyWRDqrjoeG8Vi0=;
Message-ID: <19a0c39c-31b3-ce9c-6f03-466b6109b88f@xen.org>
Date: Tue, 17 Jan 2023 22:03:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-13-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v3 12/17] tools/xenstore: don't let hashtable_remove()
 return the removed value
In-Reply-To: <20230117091124.22170-13-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 17/01/2023 09:11, Juergen Gross wrote:
> Letting hashtable_remove() return the value of the removed element is
> not used anywhere in Xenstore, and it conflicts with a hashtable
> created specifying the HASHTABLE_FREE_VALUE flag.
> 
> So just drop returning the value.

Any reason this can't be void? If there are, then I would consider to 
return a bool as the return can only be 2 values.

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - new patch
> ---
>   tools/xenstore/hashtable.c | 10 +++++-----
>   tools/xenstore/hashtable.h |  4 ++--
>   2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
> index 299549c51e..6738719e47 100644
> --- a/tools/xenstore/hashtable.c
> +++ b/tools/xenstore/hashtable.c
> @@ -214,7 +214,7 @@ hashtable_search(struct hashtable *h, void *k)
>   }
>   
>   /*****************************************************************************/
> -void * /* returns value associated with key */
> +int
>   hashtable_remove(struct hashtable *h, void *k)
>   {
>       /* TODO: consider compacting the table when the load factor drops enough,
> @@ -222,7 +222,6 @@ hashtable_remove(struct hashtable *h, void *k)
>   
>       struct entry *e;
>       struct entry **pE;
> -    void *v;
>       unsigned int hashvalue, index;
>   
>       hashvalue = hash(h,k);
> @@ -236,16 +235,17 @@ hashtable_remove(struct hashtable *h, void *k)
>           {
>               *pE = e->next;
>               h->entrycount--;
> -            v = e->v;
>               if (h->flags & HASHTABLE_FREE_KEY)
>                   free(e->k);
> +            if (h->flags & HASHTABLE_FREE_VALUE)
> +                free(e->v);

I don't quite understand how this change is related to this patch.

>               free(e);
> -            return v;
> +            return 1;
>           }
>           pE = &(e->next);
>           e = e->next;
>       }
> -    return NULL;
> +    return 0;
>   }
>   
>   /*****************************************************************************/
> diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
> index 6d65431f96..d6feb1b038 100644
> --- a/tools/xenstore/hashtable.h
> +++ b/tools/xenstore/hashtable.h
> @@ -68,10 +68,10 @@ hashtable_search(struct hashtable *h, void *k);
>    * @name        hashtable_remove
>    * @param   h   the hashtable to remove the item from
>    * @param   k   the key to search for  - does not claim ownership
> - * @return      the value associated with the key, or NULL if none found
> + * @return      0 if element not found
>    */
>   
> -void * /* returns value */
> +int
>   hashtable_remove(struct hashtable *h, void *k);
>   
>   /*****************************************************************************

Cheers,

-- 
Julien Grall

