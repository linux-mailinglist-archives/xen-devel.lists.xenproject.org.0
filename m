Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F4E736C23
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 14:43:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551789.861503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBahZ-0004oD-G1; Tue, 20 Jun 2023 12:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551789.861503; Tue, 20 Jun 2023 12:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBahZ-0004kz-CT; Tue, 20 Jun 2023 12:43:17 +0000
Received: by outflank-mailman (input) for mailman id 551789;
 Tue, 20 Jun 2023 12:43:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBahX-0004kr-EE
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 12:43:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBahW-0005rp-LX; Tue, 20 Jun 2023 12:43:14 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239] helo=[192.168.9.99])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBahW-0006zb-Fm; Tue, 20 Jun 2023 12:43:14 +0000
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
	bh=LCu748gyiMmStS63gOhoMA/Tf/JK4zm7MBV1EXih5lk=; b=sNUaDcRpISZWXLMWHdSV1R4cvt
	2pFUOgmKK7V8DyjExN9ynxrLbEMr2HapDM2jycnIT2IpjqlTbTHpQ2iqmngkiz/YXeLh+2VIPYyzB
	lU1xZdw8dG3Ly7hgMeV/RTMt/kJu2biKjyxMQzqDBsuSo4To3c6OUReG2LwANG9QKmMM=;
Message-ID: <95c4f593-a619-b6c3-6268-4db32c514cd5@xen.org>
Date: Tue, 20 Jun 2023 13:43:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 09/11] tools/xenstore: add hashtable_replace() function
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-10-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230530091333.7678-10-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 30/05/2023 10:13, Juergen Gross wrote:
> For an effective way to replace a hashtable entry add a new function
> hashtable_replace().
> 
> While at it let hashtable_add() fail if an entry with the specified
> key does already exist.

Please explain why you want to do it. I also think this change should be 
in its own patch.

> 
> This is in preparation to replace TDB with a more simple data storage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/hashtable.c | 52 ++++++++++++++++++++++++++++++--------
>   tools/xenstore/hashtable.h | 16 ++++++++++++
>   2 files changed, 58 insertions(+), 10 deletions(-)
> 
> diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
> index 9daddd9782..f358bec5ae 100644
> --- a/tools/xenstore/hashtable.c
> +++ b/tools/xenstore/hashtable.c
> @@ -141,11 +141,32 @@ static int hashtable_expand(struct hashtable *h)
>       return 0;
>   }
>   
> +static struct entry *hashtable_search_entry(const struct hashtable *h,
> +					    const void *k)
> +{
> +    struct entry *e;
> +    unsigned int hashvalue, index;
> +
> +    hashvalue = hash(h, k);
> +    index = indexFor(h->tablelength,hashvalue);

Missing space after ','.

> +    e = h->table[index];
> +    while (NULL != e)
> +    {

While you are moving the code. I think you can reduce the code size with:

for ( e = h->table[index]; e != NULL; e = e->next )
    if (....)

> +        /* Check hash value to short circuit heavier comparison */
> +        if ((hashvalue == e->h) && (h->eqfn(k, e->k))) return e;
> +        e = e->next;
> +    }
> +    return NULL;
> +}
> +
>   int hashtable_add(struct hashtable *h, const void *k, void *v)
>   {
> -    /* This method allows duplicate keys - but they shouldn't be used */
>       unsigned int index;
>       struct entry *e;
> +
> +    if (hashtable_search_entry(h, k))
> +        return EEXIST;
> +
>       if (++(h->entrycount) > h->loadlimit)
>       {
>           /* Ignore the return value. If expand fails, we should
> @@ -176,17 +197,28 @@ int hashtable_add(struct hashtable *h, const void *k, void *v)
>   void *hashtable_search(const struct hashtable *h, const void *k)
>   {
>       struct entry *e;
> -    unsigned int hashvalue, index;
> -    hashvalue = hash(h,k);
> -    index = indexFor(h->tablelength,hashvalue);
> -    e = h->table[index];
> -    while (NULL != e)
> +
> +    e = hashtable_search_entry(h, k);
> +    return e ? e->v : NULL;
> +}
> +
> +int hashtable_replace(struct hashtable *h, const void *k, void *v)
> +{
> +    struct entry *e;
> +
> +    e = hashtable_search_entry(h, k);
> +    if (!e)
> +        return ENOENT;
> +
> +    if (h->flags & HASHTABLE_FREE_VALUE)
>       {
> -        /* Check hash value to short circuit heavier comparison */
> -        if ((hashvalue == e->h) && (h->eqfn(k, e->k))) return e->v;
> -        e = e->next;
> +        talloc_free(e->v);
> +        talloc_steal(e, v);
>       }
> -    return NULL;
> +
> +    e->v = v;
> +

Coding style: Above you don't add a newline before return but here you 
do. I don't particularly care which one you want to use in xenstored. 
But can you at least be consistent?

> +    return 0;
>   }
>   
>   void
> diff --git a/tools/xenstore/hashtable.h b/tools/xenstore/hashtable.h
> index 792f6cda7b..214aea1b3d 100644
> --- a/tools/xenstore/hashtable.h
> +++ b/tools/xenstore/hashtable.h
> @@ -51,6 +51,22 @@ create_hashtable(const void *ctx, const char *name,
>   int
>   hashtable_add(struct hashtable *h, const void *k, void *v);
>   
> +/*****************************************************************************
> + * hashtable_replace
> +
> + * @name        hashtable_nsert
> + * @param   h   the hashtable to insert into
> + * @param   k   the key - hashtable claims ownership and will free on removal
> + * @param   v   the value - does not claim ownership
> + * @return      zero for successful insertion
> + *
> + * This function does check for an entry being present before replacing it
> + * with a new value.
> + */
> +
> +int
> +hashtable_replace(struct hashtable *h, const void *k, void *v);
> +
>   /*****************************************************************************
>    * hashtable_search
>      

-- 
Julien Grall

