Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D11B75864E
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 22:51:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565486.883648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrei-0005tJ-UD; Tue, 18 Jul 2023 20:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565486.883648; Tue, 18 Jul 2023 20:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLrei-0005rd-Q7; Tue, 18 Jul 2023 20:50:48 +0000
Received: by outflank-mailman (input) for mailman id 565486;
 Tue, 18 Jul 2023 20:50:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qLreh-0005rL-3B
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 20:50:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLreg-00046O-6z; Tue, 18 Jul 2023 20:50:46 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qLreg-00070P-1v; Tue, 18 Jul 2023 20:50:46 +0000
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
	bh=+L7tvdShi+hOjAsd/cbXmvpSP8a2J0cPz40h9//UzTU=; b=wKiNiDf/UZQtCVpp/dsX6aoa1b
	Jlfx5nyXceLcdTJ3kwSyskIUlHUWRaoKOgPpXHO21u3p2Zro2C+TseV8BqncJ9qyGYSZfx2LWuJ+V
	5djrPmTR529I7jbAnstDXxVGQD0kqj/0ahbjYI52nmDUHRAVyjDnx1skzwEXEmxiPnJ8=;
Message-ID: <f7e623a5-adec-fd99-4c42-fab0d04cd12e@xen.org>
Date: Tue, 18 Jul 2023 21:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v2 10/18] tools/xenstore: add hashtable_replace() function
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-11-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230710065947.4201-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 10/07/2023 07:59, Juergen Gross wrote:
> For an effective way to replace a hashtable entry add a new function
> hashtable_replace().
> 
> While at it let hashtable_add() fail if an entry with the specified
> key does already exist.

This seems to be a left-over from the previous version.

> 
> This is in preparation to replace TDB with a more simple data storage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   tools/xenstore/hashtable.c | 20 ++++++++++++++++++++
>   tools/xenstore/hashtable.h | 16 ++++++++++++++++
>   2 files changed, 36 insertions(+)
> 
> diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
> index 29c247f918..0c26a09567 100644
> --- a/tools/xenstore/hashtable.c
> +++ b/tools/xenstore/hashtable.c
> @@ -160,6 +160,7 @@ static struct entry *hashtable_search_entry(const struct hashtable *h,
>   
>       return NULL;
>   }
> +

I think this belong to the previous patch.

>   int hashtable_add(struct hashtable *h, const void *k, void *v)
>   {
>       unsigned int index;
> @@ -204,6 +205,25 @@ void *hashtable_search(const struct hashtable *h, const void *k)
>       return e ? e->v : NULL;
>   }
>   
> +int hashtable_replace(struct hashtable *h, const void *k, void *v)
> +{
> +    struct entry *e;
> +
> +    e = hashtable_search_entry(h, k);
> +    if (!e)
> +        return ENOENT;
> +
> +    if (h->flags & HASHTABLE_FREE_VALUE)
> +    {
> +        talloc_free(e->v);
> +        talloc_steal(e, v);
> +    }
> +
> +    e->v = v;
> +
> +    return 0;
> +}
> +
>   void
>   hashtable_remove(struct hashtable *h, const void *k)
>   {
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

Chees,

-- 
Julien Grall

