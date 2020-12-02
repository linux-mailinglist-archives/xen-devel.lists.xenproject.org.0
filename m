Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E95202CBA0C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 11:05:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42595.76640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkP0D-00008L-0y; Wed, 02 Dec 2020 10:04:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42595.76640; Wed, 02 Dec 2020 10:04:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkP0C-00007v-Tt; Wed, 02 Dec 2020 10:04:48 +0000
Received: by outflank-mailman (input) for mailman id 42595;
 Wed, 02 Dec 2020 10:04:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQyH=FG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kkP0C-00007q-2F
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 10:04:48 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77aaf235-b3c5-4699-a850-8a789c67164d;
 Wed, 02 Dec 2020 10:04:46 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1B7CCACC2;
 Wed,  2 Dec 2020 10:04:46 +0000 (UTC)
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
X-Inumbo-ID: 77aaf235-b3c5-4699-a850-8a789c67164d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606903486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U7d1fXBw9ABU8UoyWVSUVygnntd9mPXLb/277kW8Z00=;
	b=d8G4iiWnNyBK9VIv/2d3DEwZifxWQcn5bC02xOMzUlhFQ79zAAAkPAkpaNgXto9v8tdoYL
	55H4Ht0YLECJ15RJw6gHEe/egDw2Xu/l+ObG2fCpC7CthHL5te5CHH1rS+bfwZM1PQEG7M
	KdW6chjHVRz6/bzJrax3B/qIGZlhMAs=
Subject: Re: [PATCH] x86/vmap: handle superpages in vmap_to_mfn()
To: Hongyan Xia <hx242@xen.org>
Cc: jgrall@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <34de4c4326673c60d3e2cbd3bbcbcca481906524.1606755042.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ef127c6f-2d8a-1ddf-f8e7-7e747518c5a8@suse.com>
Date: Wed, 2 Dec 2020 11:04:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <34de4c4326673c60d3e2cbd3bbcbcca481906524.1606755042.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.11.2020 17:50, Hongyan Xia wrote:
> From: Hongyan Xia <hongyxia@amazon.com>
> 
> There is simply no guarantee that vmap won't return superpages to the
> caller. It can happen if the list of MFNs are contiguous, or we simply
> have a large granularity. Although rare, if such things do happen, we
> will simply hit BUG_ON() and crash. Properly handle such cases in a new
> implementation.
> 
> Note that vmap is now too large to be a macro, so implement it as a
> normal function and move the declaration to mm.h (page.h cannot handle
> mfn_t).

I'm not happy about this movement, and it's also not really clear to
me what problem page.h would have in principle. Yes, it can't
include xen/mm.h, but I think it is long overdue that we disentangle
this at least some. Let me see what I can do as a prereq for this
change, but see also below.

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5194,6 +5194,49 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long v)
>          }                                          \
>      } while ( false )
>  
> +mfn_t vmap_to_mfn(const void *v)
> +{
> +    bool locking = system_state > SYS_STATE_boot;
> +    unsigned int l2_offset = l2_table_offset((unsigned long)v);
> +    unsigned int l1_offset = l1_table_offset((unsigned long)v);
> +    l3_pgentry_t *pl3e = virt_to_xen_l3e((unsigned long)v);
> +    l2_pgentry_t *pl2e;
> +    l1_pgentry_t *pl1e;

Can't all three of them be pointer-to-const?

> +    struct page_info *l3page;
> +    mfn_t ret;
> +
> +    ASSERT(pl3e);

    if ( !pl3e )
    {
        ASSERT_UNREACHABLE();
        return INVALID_MFN;
    }

as per the bottom of ./CODING_STYLE? (Similarly further down
then.)

> +    l3page = virt_to_page(pl3e);
> +    L3T_LOCK(l3page);
> +
> +    ASSERT(l3e_get_flags(*pl3e) & _PAGE_PRESENT);
> +    if ( l3e_get_flags(*pl3e) & _PAGE_PSE )
> +    {
> +        ret = mfn_add(l3e_get_mfn(*pl3e),
> +                      (l2_offset << PAGETABLE_ORDER) + l1_offset);
> +        L3T_UNLOCK(l3page);
> +        return ret;

To keep the locked region as narrow as possible

        mfn = l3e_get_mfn(*pl3e);
        L3T_UNLOCK(l3page);
        return mfn_add(mfn, (l2_offset << PAGETABLE_ORDER) + l1_offset);

? However, in particular because of the recurring unlocks on
the exit paths I wonder whether it wouldn't be better to
restructure the whole function such that there'll be one unlock
and one return. Otoh I'm afraid what I'm asking for here is
going to yield a measurable set of goto-s ...

> +    }
> +
> +    pl2e = map_l2t_from_l3e(*pl3e) + l2_offset;
> +    ASSERT(l2e_get_flags(*pl2e) & _PAGE_PRESENT);
> +    if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
> +    {
> +        ret = mfn_add(l2e_get_mfn(*pl2e), l1_offset);
> +        L3T_UNLOCK(l3page);
> +        return ret;
> +    }
> +
> +    pl1e = map_l1t_from_l2e(*pl2e) + l1_offset;
> +    UNMAP_DOMAIN_PAGE(pl2e);
> +    ASSERT(l1e_get_flags(*pl1e) & _PAGE_PRESENT);
> +    ret = l1e_get_mfn(*pl1e);
> +    L3T_UNLOCK(l3page);
> +    UNMAP_DOMAIN_PAGE(pl1e);
> +
> +    return ret;
> +}

Now for the name of the function: The only aspect tying it
somewhat to vmap() is that it assumes (asserts) it'll find a
valid mapping. I think it wants renaming, and vmap_to_mfn()
then would become a #define of it (perhaps even retaining
its property of getting unsigned long passed in), at which
point it also doesn't need moving out of page.h. As to the
actual name, xen_map_to_mfn() to somewhat match up with
map_pages_to_xen()?

Jan

