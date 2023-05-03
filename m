Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD076F586D
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 15:00:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529192.823310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puC5C-00015y-Pl; Wed, 03 May 2023 12:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529192.823310; Wed, 03 May 2023 12:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puC5C-00013S-N0; Wed, 03 May 2023 12:59:46 +0000
Received: by outflank-mailman (input) for mailman id 529192;
 Wed, 03 May 2023 12:59:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1puC5B-000138-IK
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 12:59:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puC5B-0002QN-0Z; Wed, 03 May 2023 12:59:45 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[192.168.7.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1puC5A-0003Rr-QE; Wed, 03 May 2023 12:59:44 +0000
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
	bh=XjRyBmen38hK+2UHszJvugGdf2RXVGnU3dXLBe5dbg4=; b=EeRHE7ncI8jOofgXmkpWu2d3ay
	gnUPEHirBoc2ozm8dN96kesg5yQSoDfiivFjZYoI9kX68vzg1vrSl3CZBfhIQCwYqX7q1QkLLyk4z
	Qj8Cs2n5rrr0VriQa+ixJBm6tKZhdoDUWtgW+BirORqQZCxO8y2vLiKXAqLzhRSaDz04=;
Message-ID: <1a2a7aed-8947-c5ed-e1ed-8fa80bc75750@xen.org>
Date: Wed, 3 May 2023 13:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 03/13] tools/xenstore: modify interface of
 create_hashtable()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230330085011.9170-1-jgross@suse.com>
 <20230330085011.9170-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230330085011.9170-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/03/2023 09:50, Juergen Gross wrote:
> The minsize parameter of create_hashtable() doesn't have any real use
> case for Xenstore, so drop it.
> 
> For better talloc_report_full() diagnostic output add a name parameter
> to create_hashtable().
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/hashtable.c        | 20 ++++++--------------
>   tools/xenstore/hashtable.h        |  4 ++--
>   tools/xenstore/xenstored_core.c   |  2 +-
>   tools/xenstore/xenstored_domain.c |  4 ++--
>   4 files changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
> index c1b11743bb..ab1e687d0b 100644
> --- a/tools/xenstore/hashtable.c
> +++ b/tools/xenstore/hashtable.c
> @@ -55,36 +55,28 @@ static unsigned int loadlimit(unsigned int pindex)
>       return ((uint64_t)primes[pindex] * MAX_LOAD_PERCENT) / 100;
>   }
>   
> -struct hashtable *create_hashtable(const void *ctx, unsigned int minsize,
> +struct hashtable *create_hashtable(const void *ctx, const char *name,
>                                      unsigned int (*hashf) (const void *),
>                                      int (*eqf) (const void *, const void *),
>                                      unsigned int flags)
>   {
>       struct hashtable *h;
> -    unsigned int pindex, size = primes[0];
> -
> -    /* Check requested hashtable isn't too large */
> -    if (minsize > (1u << 30)) return NULL;
> -
> -    /* Enforce size as prime */
> -    for (pindex=0; pindex < PRIME_TABLE_LEN; pindex++) {
> -        if (primes[pindex] > minsize) { size = primes[pindex]; break; }
> -    }
>   
>       h = talloc_zero(ctx, struct hashtable);
>       if (NULL == h)
>           goto err0;
> -    h->table = talloc_zero_array(h, struct entry *, size);
> +    talloc_set_name_const(h, name);
> +    h->table = talloc_zero_array(h, struct entry *, primes[0]);
>       if (NULL == h->table)
>           goto err1;
>   
> -    h->tablelength  = size;
> +    h->tablelength  = primes[0];

I find the connection between this line, ...

>       h->flags        = flags;
> -    h->primeindex   = pindex;
> +    h->primeindex   = 0;

... this one and ...

>       h->entrycount   = 0;
>       h->hashfn       = hashf;
>       h->eqfn         = eqf;
> -    h->loadlimit    = loadlimit(pindex);
> +    h->loadlimit    = loadlimit(0);

... now more difficult to find. How about setting h->primeindex first 
and then using it in place of 0?

>       return h;
>   
>   err1:
> diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
> index 04310783b6..0e1a6f61c2 100644
> --- a/tools/xenstore/hashtable.h
> +++ b/tools/xenstore/hashtable.h
> @@ -10,7 +10,7 @@ struct hashtable;
>      
>    * @name                    create_hashtable
>    * @param   ctx             talloc context to use for allocations
> - * @param   minsize         minimum initial size of hashtable
> + * @param   name            talloc name of the hashtable
>    * @param   hashfunction    function for hashing keys
>    * @param   key_eq_fn       function for determining key equality
>    * @param   flags           flags HASHTABLE_*
> @@ -23,7 +23,7 @@ struct hashtable;
>   #define HASHTABLE_FREE_KEY   (1U << 1)
>   
>   struct hashtable *
> -create_hashtable(const void *ctx, unsigned int minsize,
> +create_hashtable(const void *ctx, const char *name,
>                    unsigned int (*hashfunction) (const void *),
>                    int (*key_eq_fn) (const void *, const void *),
>                    unsigned int flags
> diff --git a/tools/xenstore/xenstored_core.c b/tools/xenstore/xenstored_core.c
> index 7214b3df03..6ce7be3161 100644
> --- a/tools/xenstore/xenstored_core.c
> +++ b/tools/xenstore/xenstored_core.c
> @@ -2511,7 +2511,7 @@ void check_store(void)
>   	struct check_store_data data;
>   
>   	/* Don't free values (they are all void *1) */
> -	data.reachable = create_hashtable(NULL, 16, hash_from_key_fn,
> +	data.reachable = create_hashtable(NULL, "checkstore", hash_from_key_fn,
>   					  keys_equal_fn, HASHTABLE_FREE_KEY);
>   	if (!data.reachable) {
>   		log("check_store: ENOMEM");
> diff --git a/tools/xenstore/xenstored_domain.c b/tools/xenstore/xenstored_domain.c
> index df64c87efc..6d40aefc63 100644
> --- a/tools/xenstore/xenstored_domain.c
> +++ b/tools/xenstore/xenstored_domain.c
> @@ -1017,7 +1017,7 @@ void domain_init(int evtfd)
>   	int rc;
>   
>   	/* Start with a random rather low domain count for the hashtable. */
> -	domhash = create_hashtable(NULL, 8, domhash_fn, domeq_fn, 0);
> +	domhash = create_hashtable(NULL, "domains", domhash_fn, domeq_fn, 0);
>   	if (!domhash)
>   		barf_perror("Failed to allocate domain hashtable");
>   
> @@ -1804,7 +1804,7 @@ struct hashtable *domain_check_acc_init(void)
>   {
>   	struct hashtable *domains;
>   
> -	domains = create_hashtable(NULL, 8, domhash_fn, domeq_fn,
> +	domains = create_hashtable(NULL, "domain_check", domhash_fn, domeq_fn,
>   				   HASHTABLE_FREE_VALUE);
>   	if (!domains)
>   		return NULL;

Cheers,

-- 
Julien Grall

