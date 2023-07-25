Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F00761E11
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 18:08:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569824.890958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKaU-0001vE-LO; Tue, 25 Jul 2023 16:08:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569824.890958; Tue, 25 Jul 2023 16:08:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOKaU-0001t9-Hu; Tue, 25 Jul 2023 16:08:38 +0000
Received: by outflank-mailman (input) for mailman id 569824;
 Tue, 25 Jul 2023 16:08:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qOKaT-0001t3-VI
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 16:08:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOKaT-0006eo-4X; Tue, 25 Jul 2023 16:08:37 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.17.43]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qOKaS-00032e-Tn; Tue, 25 Jul 2023 16:08:37 +0000
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
	bh=xvT4aVE3l6GM7DyCOcRsWXGZgCEPSpgYyDbRKwCk3rc=; b=LdEU0jHj92AusFlrWGJy5Fa7ex
	5JZSohwGUtIKDDNy9Q6S1Zja8CQ4Ceji7OLLZmQJic3HUMYTpp+BHx/O9QolEkh94HW0kEXL/Xx1t
	um/jnr5JdFUQPZywM/JG/SebzWJkfvaLFeb1OejClki5W3VuMOpKU+sGSH+6uZFbWGWg=;
Message-ID: <2c981a1a-b020-3908-8b9b-8821daec9457@xen.org>
Date: Tue, 25 Jul 2023 17:08:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 08/25] tools/xenstore: make hashtable key and value
 parameters const
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-9-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230724110247.10520-9-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/07/2023 12:02, Juergen Gross wrote:
> The key and value are never modified by hashtable code, so they should
> be marked as const.

You wrote this but...

> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - make value const, too.
> ---
>   tools/xenstore/hashtable.c | 7 ++++---
>   tools/xenstore/hashtable.h | 4 ++--
>   2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
> index 11f6bf8f15..670dc01003 100644
> --- a/tools/xenstore/hashtable.c
> +++ b/tools/xenstore/hashtable.c
> @@ -11,7 +11,8 @@
>   
>   struct entry
>   {
> -    void *k, *v;
> +    const void *k;
> +    void *v;


... this is not const and ...

>       unsigned int h;
>       struct entry *next;
>   };
> @@ -140,7 +141,7 @@ static int hashtable_expand(struct hashtable *h)
>       return 0;
>   }
>   
> -int hashtable_add(struct hashtable *h, void *k, void *v)
> +int hashtable_add(struct hashtable *h, const void *k, const void *v)
>   {
>       /* This method allows duplicate keys - but they shouldn't be used */
>       unsigned int index;
> @@ -164,7 +165,7 @@ int hashtable_add(struct hashtable *h, void *k, void *v)
>       e->k = k;
>       if (h->flags & HASHTABLE_FREE_KEY)
>           talloc_steal(e, k);
> -    e->v = v;
> +    e->v = (void *)v;

... you cast-away the const here. I think this is a pretty bad idea.

Can you clarify why you are doing like that?

Cheers,

-- 
Julien Grall

