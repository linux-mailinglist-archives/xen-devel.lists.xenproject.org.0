Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 637632CBCC7
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 13:18:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42675.76771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkR4j-0004lr-3Y; Wed, 02 Dec 2020 12:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42675.76771; Wed, 02 Dec 2020 12:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkR4i-0004lS-W6; Wed, 02 Dec 2020 12:17:36 +0000
Received: by outflank-mailman (input) for mailman id 42675;
 Wed, 02 Dec 2020 12:17:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>) id 1kkR4i-0004lN-0k
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 12:17:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kkR4f-00007M-4Y; Wed, 02 Dec 2020 12:17:33 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=u1bbd043a57dd5a.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <hx242@xen.org>)
 id 1kkR4e-0000jH-Oi; Wed, 02 Dec 2020 12:17:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Mime-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID;
	bh=rq8aNccWaCFgls25NMK4LR2Ct9UOag4RrkVGOyHGqu8=; b=igaiE1Ht56MQRjcfruRkbbDLhL
	JBIbDDUhCskRGo/i/1bKKlMkqx8BrbVdV1Aa1LetW2XP6iYTpokDSRCcusz/ej2eOpgILShxHcmk2
	PGnpkyHZWUaVmOwUxvWBwZr5gKQCc44WlEpPkGg1FG4fvC/E1l5i8Hl1VeTUXY+iVgEg=;
Message-ID: <6409ea31aa21fa54ef2697b0ce959bbf7b5e2a23.camel@xen.org>
Subject: Re: [PATCH] x86/vmap: handle superpages in vmap_to_mfn()
From: Hongyan Xia <hx242@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: jgrall@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>, Roger Pau
 =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Date: Wed, 02 Dec 2020 12:17:30 +0000
In-Reply-To: <ef127c6f-2d8a-1ddf-f8e7-7e747518c5a8@suse.com>
References: 
	<34de4c4326673c60d3e2cbd3bbcbcca481906524.1606755042.git.hongyxia@amazon.com>
	 <ef127c6f-2d8a-1ddf-f8e7-7e747518c5a8@suse.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2020-12-02 at 11:04 +0100, Jan Beulich wrote:
> On 30.11.2020 17:50, Hongyan Xia wrote:
> > From: Hongyan Xia <hongyxia@amazon.com>
> > 
> > There is simply no guarantee that vmap won't return superpages to
> > the
> > caller. It can happen if the list of MFNs are contiguous, or we
> > simply
> > have a large granularity. Although rare, if such things do happen,
> > we
> > will simply hit BUG_ON() and crash. Properly handle such cases in a
> > new
> > implementation.
> > 
> > Note that vmap is now too large to be a macro, so implement it as a
> > normal function and move the declaration to mm.h (page.h cannot
> > handle
> > mfn_t).
> 
> I'm not happy about this movement, and it's also not really clear to
> me what problem page.h would have in principle. Yes, it can't
> include xen/mm.h, but I think it is long overdue that we disentangle
> this at least some. Let me see what I can do as a prereq for this
> change, but see also below.
> 
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -5194,6 +5194,49 @@ l1_pgentry_t *virt_to_xen_l1e(unsigned long
> > v)
> >          }                                          \
> >      } while ( false )
> >  
> > +mfn_t vmap_to_mfn(const void *v)
> > +{
> > +    bool locking = system_state > SYS_STATE_boot;
> > +    unsigned int l2_offset = l2_table_offset((unsigned long)v);
> > +    unsigned int l1_offset = l1_table_offset((unsigned long)v);
> > +    l3_pgentry_t *pl3e = virt_to_xen_l3e((unsigned long)v);
> > +    l2_pgentry_t *pl2e;
> > +    l1_pgentry_t *pl1e;
> 
> Can't all three of them be pointer-to-const?

They can (and yes they should).

> > +    struct page_info *l3page;
> > +    mfn_t ret;
> > +
> > +    ASSERT(pl3e);
> 
>     if ( !pl3e )
>     {
>         ASSERT_UNREACHABLE();
>         return INVALID_MFN;
>     }
> 
> as per the bottom of ./CODING_STYLE? (Similarly further down
> then.)

Will revise.

> > +    l3page = virt_to_page(pl3e);
> > +    L3T_LOCK(l3page);
> > +
> > +    ASSERT(l3e_get_flags(*pl3e) & _PAGE_PRESENT);
> > +    if ( l3e_get_flags(*pl3e) & _PAGE_PSE )
> > +    {
> > +        ret = mfn_add(l3e_get_mfn(*pl3e),
> > +                      (l2_offset << PAGETABLE_ORDER) + l1_offset);
> > +        L3T_UNLOCK(l3page);
> > +        return ret;
> 
> To keep the locked region as narrow as possible
> 
>         mfn = l3e_get_mfn(*pl3e);
>         L3T_UNLOCK(l3page);
>         return mfn_add(mfn, (l2_offset << PAGETABLE_ORDER) +
> l1_offset);
> 
> ? However, in particular because of the recurring unlocks on
> the exit paths I wonder whether it wouldn't be better to
> restructure the whole function such that there'll be one unlock
> and one return. Otoh I'm afraid what I'm asking for here is
> going to yield a measurable set of goto-s ...

I can do that.

But what about the lock narrowing? Will be slightly more tricky when
there is goto. Naturally:

    ret = full return mfn;
    goto out;

out:
    UNLOCK();
    return ret;

but with narrowing, my first reaction is:

    ret = high bits of mfn;
    l2_offset = 0;
    l1_offset = 0;
    goto out;

out:
    UNLOCK();
    return mfn + l2_offset << TABLE_ORDER + l1_offset;

To be honest, I doubt it is really worth it and I prefer the first one.

> 
> > +    }
> > +
> > +    pl2e = map_l2t_from_l3e(*pl3e) + l2_offset;
> > +    ASSERT(l2e_get_flags(*pl2e) & _PAGE_PRESENT);
> > +    if ( l2e_get_flags(*pl2e) & _PAGE_PSE )
> > +    {
> > +        ret = mfn_add(l2e_get_mfn(*pl2e), l1_offset);
> > +        L3T_UNLOCK(l3page);
> > +        return ret;
> > +    }
> > +
> > +    pl1e = map_l1t_from_l2e(*pl2e) + l1_offset;
> > +    UNMAP_DOMAIN_PAGE(pl2e);
> > +    ASSERT(l1e_get_flags(*pl1e) & _PAGE_PRESENT);
> > +    ret = l1e_get_mfn(*pl1e);
> > +    L3T_UNLOCK(l3page);
> > +    UNMAP_DOMAIN_PAGE(pl1e);
> > +
> > +    return ret;
> > +}
> 
> Now for the name of the function: The only aspect tying it
> somewhat to vmap() is that it assumes (asserts) it'll find a
> valid mapping. I think it wants renaming, and vmap_to_mfn()
> then would become a #define of it (perhaps even retaining
> its property of getting unsigned long passed in), at which
> point it also doesn't need moving out of page.h. As to the
> actual name, xen_map_to_mfn() to somewhat match up with
> map_pages_to_xen()?

I actually really like this idea. I will come up with something in the
next rev. But if we want to make it generic, shouldn't we not ASSERT on
pl*e and the PRESENT flag and just return INVALID_MFN? Then this
function works on both mapped address (assumption of vmap_to_mfn()) and
other use cases.

Hongyan


