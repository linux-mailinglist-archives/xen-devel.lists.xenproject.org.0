Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C83DF765DAA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 23:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571262.894695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP85m-0003Vv-0c; Thu, 27 Jul 2023 21:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571262.894695; Thu, 27 Jul 2023 21:00:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qP85l-0003U6-Td; Thu, 27 Jul 2023 21:00:13 +0000
Received: by outflank-mailman (input) for mailman id 571262;
 Thu, 27 Jul 2023 21:00:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qP85k-0003U0-KT
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 21:00:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP85j-00085a-HU; Thu, 27 Jul 2023 21:00:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qP85j-0000DO-BV; Thu, 27 Jul 2023 21:00:11 +0000
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
	bh=HSDhRqaPsIQySPs6jLqRGkQE44YMxjf86Wusu5y0ios=; b=isM/e/RpKM85ji78FrunxRiajT
	jmwX8nINrGkFaI9uevsdFq4z/kCyisng2vJ7EFyfLLRJIIJ1Nx8MBPB68AV0ocQDlItz5pD0BmdZC
	aegZjasKj666Du8rffhEpcpfIJ0wK/gHsmh2wM+904qZ70PpdVvqJ3kVqINTG67fgPxc=;
Message-ID: <05f067be-f06b-ed1a-844d-15f9e9585500@xen.org>
Date: Thu, 27 Jul 2023 22:00:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH v3 10/25] tools/xenstore: add hashtable_replace() function
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-11-jgross@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230724110247.10520-11-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 24/07/2023 12:02, Juergen Gross wrote:
> For an effective way to replace a hashtable entry add a new function
> hashtable_replace().
> 
> This is in preparation to replace TDB with a more simple data storage.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V3:
> - fix commit message (Julien Grall)
> - move unrelated change to previous patch (Julien Grall)
> - make value parameter const
> ---
>   tools/xenstore/hashtable.c | 19 +++++++++++++++++++
>   tools/xenstore/hashtable.h | 16 ++++++++++++++++
>   2 files changed, 35 insertions(+)
> 
> diff --git a/tools/xenstore/hashtable.c b/tools/xenstore/hashtable.c
> index 0409725060..f85b5a71f1 100644
> --- a/tools/xenstore/hashtable.c
> +++ b/tools/xenstore/hashtable.c
> @@ -205,6 +205,25 @@ void *hashtable_search(const struct hashtable *h, const void *k)
>       return e ? e->v : NULL;
>   }
>   
> +int hashtable_replace(struct hashtable *h, const void *k, const void *v)

With the const dropped for 'v' and ...

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
> +    e->v = (void *)v;

... cast:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

