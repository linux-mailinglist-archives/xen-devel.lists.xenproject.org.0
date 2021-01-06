Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A405F2EBD6B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 13:03:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62471.110666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx7X2-0007g6-G6; Wed, 06 Jan 2021 12:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62471.110666; Wed, 06 Jan 2021 12:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kx7X2-0007fh-D0; Wed, 06 Jan 2021 12:03:16 +0000
Received: by outflank-mailman (input) for mailman id 62471;
 Wed, 06 Jan 2021 12:03:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eU9S=GJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kx7X0-0007fc-Bc
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 12:03:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9a6db908-07a5-4f77-9583-28c86c418c23;
 Wed, 06 Jan 2021 12:03:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 42E70AA35;
 Wed,  6 Jan 2021 12:03:08 +0000 (UTC)
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
X-Inumbo-ID: 9a6db908-07a5-4f77-9583-28c86c418c23
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609934588; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JffbXLULEhKmSQ44bRfkFGw6Eqr61jvrM8wmiwCfGSo=;
	b=L0IG2kGyGekKOaHkIet48C3ZEMamYlruJ1kcaxoD0jymcxADlwsvpm7Il9sSLEV2lUxOvB
	bVkIbcQaS/I/d0lpVWsOTkpJjTVVn/GCJVWZWbG9laPnIunAi5aE0UU1mUYSf8zP8n8tD5
	ZeGrdvDmnSchghAZsXwE91eE942vLnQ=
Subject: Re: [PATCH 2/2] x86/hap: Resolve mm-lock order violations when
 forking VMs with nested p2m
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <6d5ca8a57a2745e933f00706bff306844611f64d.1609781242.git.tamas.lengyel@intel.com>
 <19aab6220bf191a31902488ed38c51d239572269.1609781242.git.tamas.lengyel@intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <158cf7ca-17cf-c886-20e8-b53519bec1b5@suse.com>
Date: Wed, 6 Jan 2021 13:03:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <19aab6220bf191a31902488ed38c51d239572269.1609781242.git.tamas.lengyel@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04.01.2021 18:41, Tamas K Lengyel wrote:
> @@ -893,13 +894,11 @@ static int nominate_page(struct domain *d, gfn_t gfn,
>          goto out;
>  
>      /*
> -     * Now that the page is validated, we can lock it. There is no
> -     * race because we're holding the p2m entry, so no one else
> -     * could be nominating this gfn.
> +     * Now that the page is validated, we can make it shared. There is no race
> +     * because we're holding the p2m entry, so no one else could be nominating
> +     * this gfn & and it is evidently not yet shared with any other VM, thus we
> +     * don't need to take the mem_sharing_page_lock here.
>       */
> -    ret = -ENOENT;
> -    if ( !mem_sharing_page_lock(page) )
> -        goto out;

Isn't it too limited to mention just nomination in the comment?
Unsharing, for example, also needs to be prevented (or else
the tail of sharing could race with the beginning of unsharing).
The other paths looks to similarly hold the GFN, so the
reasoning is fine for them as well. Except maybe audit() - what
about races with that one?

> @@ -1214,7 +1212,7 @@ int __mem_sharing_unshare_page(struct domain *d,
>      p2m_type_t p2mt;
>      mfn_t mfn;
>      struct page_info *page, *old_page;
> -    int last_gfn;
> +    int last_gfn, rc = 0;

I consider this unhelpful: last_gfn really wants to be bool, and
hence wants to not share a declaration with rc. But you're the
maintainer ...

> @@ -1226,6 +1224,15 @@ int __mem_sharing_unshare_page(struct domain *d,
>          return 0;
>      }
>  
> +    /* lock nested p2ms to avoid lock-order violation */

Would you mind mentioning here the other side of the possible
violation, to aid the reader?

> +    if ( unlikely(nestedhvm_enabled(d)) )
> +    {
> +        int i;

unsigned int please (also further down), no matter that there may
be other similar examples of (bad) use of plain int.

> +        for ( i = 0; i < MAX_NESTEDP2M; i++ )
> +            p2m_lock(d->arch.nested_p2m[i]);

From a brief scan, this is the first instance of acquiring all
nested p2m locks in one go. Ordering these by index is perhaps
fine, but I think this wants spelling out in e.g. mm-locks.h. Of
course the question is if you really need to go this far, i.e.
whether really all of the locks need holding. This is even more
so with p2m_flush_table_locked() not really looking to be a
quick operation, when there have many pages accumulated for it.
I.e. the overall lock holding time may turn out even more
excessive this way than it apparently already is.

> --- a/xen/arch/x86/mm/p2m.c
> +++ b/xen/arch/x86/mm/p2m.c
> @@ -1598,8 +1598,17 @@ void
>  p2m_flush_nestedp2m(struct domain *d)
>  {
>      int i;
> +    struct p2m_domain *p2m;
> +
>      for ( i = 0; i < MAX_NESTEDP2M; i++ )
> -        p2m_flush_table(d->arch.nested_p2m[i]);
> +    {
> +        p2m = d->arch.nested_p2m[i];

Please move the declaration here, making this the variable's
initializer (unless line length constraints make the latter
undesirable).

Jan

