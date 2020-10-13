Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C732328CED6
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 15:00:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6191.16407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSJuT-0000qh-QD; Tue, 13 Oct 2020 13:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6191.16407; Tue, 13 Oct 2020 13:00:09 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSJuT-0000qA-Mp; Tue, 13 Oct 2020 13:00:09 +0000
Received: by outflank-mailman (input) for mailman id 6191;
 Tue, 13 Oct 2020 13:00:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSJuR-0000KO-Up
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:00:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 47549fd2-a6fe-47e4-bcef-258365917fee;
 Tue, 13 Oct 2020 13:00:03 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C9AEFB083;
 Tue, 13 Oct 2020 13:00:02 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSJuR-0000KO-Up
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 13:00:07 +0000
X-Inumbo-ID: 47549fd2-a6fe-47e4-bcef-258365917fee
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 47549fd2-a6fe-47e4-bcef-258365917fee;
	Tue, 13 Oct 2020 13:00:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602594002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=riUAzU8AzOuq9qgpxdP77IOJBHeQh9wIAEwv5T018dQ=;
	b=EkB/meq1ePDjZeQQq8zGRrPoO4HVoUCTfw1LSIh+DA8WcQhB+fy3uD8nzFwG9LrI9bYEXi
	DFyxoKUMHefM+Kp6rk+OlyD8AGanPaQJnI6vwZFu7Et+nylqISOw/vs9y6tYZLj6fShcQQ
	iJEEL1ww/mleQvYdCAp2f/3aMQGsjSE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C9AEFB083;
	Tue, 13 Oct 2020 13:00:02 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] x86/shadow: refactor shadow_vram_{get,put}_l1e()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, George Dunlap <George.Dunlap@eu.citrix.com>,
 Tim Deegan <tim@xen.org>
References: <c6b9c903-02eb-d473-86e3-ccb67aff6cd7@suse.com>
 <51515581-19f3-5b7c-a2f9-1a0b11f8283a@suse.com>
 <20201008151556.GL19254@Air-de-Roger>
 <e769e1ae-fd2f-881e-4dcc-3cbf40d6b732@citrix.com>
 <20201010074525.GO19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae60e9a4-b5c5-d54d-dfe6-626996ec52bc@suse.com>
Date: Tue, 13 Oct 2020 15:00:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201010074525.GO19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10.10.2020 09:45, Roger Pau Monné wrote:
> On Thu, Oct 08, 2020 at 04:36:47PM +0100, Andrew Cooper wrote:
>> On 08/10/2020 16:15, Roger Pau Monné wrote:
>>> On Wed, Sep 16, 2020 at 03:08:40PM +0200, Jan Beulich wrote:
>>>> +void shadow_vram_put_mfn(mfn_t mfn, unsigned int l1f,
>>>> +                         mfn_t sl1mfn, const void *sl1e,
>>>> +                         const struct domain *d)
>>>> +{
>>>> +    unsigned long gfn;
>>>> +    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
>>>> +
>>>> +    ASSERT(is_hvm_domain(d));
>>>> +
>>>> +    if ( !dirty_vram /* tracking disabled? */ ||
>>>> +         !(l1f & _PAGE_RW) /* read-only mapping? */ ||
>>>> +         !mfn_valid(mfn) /* mfn can be invalid in mmio_direct */)
>>>> +        return;
>>>> +
>>>> +    gfn = gfn_x(mfn_to_gfn(d, mfn));
>>>> +    /* Page sharing not supported on shadow PTs */
>>>> +    BUG_ON(SHARED_M2P(gfn));
>>>> +
>>>> +    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
>>>> +    {
>>>> +        unsigned long i = gfn - dirty_vram->begin_pfn;
>>>> +        const struct page_info *page = mfn_to_page(mfn);
>>>> +        bool dirty = false;
>>>> +        paddr_t sl1ma = mfn_to_maddr(sl1mfn) | PAGE_OFFSET(sl1e);
>>>> +
>>>> +        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
>>>> +        {
>>>> +            /* Last reference */
>>>> +            if ( dirty_vram->sl1ma[i] == INVALID_PADDR )
>>>> +            {
>>>> +                /* We didn't know it was that one, let's say it is dirty */
>>>> +                dirty = true;
>>>> +            }
>>>> +            else
>>>> +            {
>>>> +                ASSERT(dirty_vram->sl1ma[i] == sl1ma);
>>>> +                dirty_vram->sl1ma[i] = INVALID_PADDR;
>>>> +                if ( l1f & _PAGE_DIRTY )
>>>> +                    dirty = true;
>>>> +            }
>>>> +        }
>>>> +        else
>>>> +        {
>>>> +            /* We had more than one reference, just consider the page dirty. */
>>>> +            dirty = true;
>>>> +            /* Check that it's not the one we recorded. */
>>>> +            if ( dirty_vram->sl1ma[i] == sl1ma )
>>>> +            {
>>>> +                /* Too bad, we remembered the wrong one... */
>>>> +                dirty_vram->sl1ma[i] = INVALID_PADDR;
>>>> +            }
>>>> +            else
>>>> +            {
>>>> +                /*
>>>> +                 * Ok, our recorded sl1e is still pointing to this page, let's
>>>> +                 * just hope it will remain.
>>>> +                 */
>>>> +            }
>>>> +        }
>>>> +
>>>> +        if ( dirty )
>>>> +        {
>>>> +            dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
>>> Could you use _set_bit here?
>>
>> __set_bit() uses 4-byte accesses.  This uses 1-byte accesses.
> 
> Right, this is allocated using alloc directly, not the bitmap helper,
> and the size if rounded to byte level, not unsigned int.
> 
>> Last I checked, there is a boundary issue at the end of the dirty_bitmap.
>>
>> Both Julien and I have considered changing our bit infrastructure to use
>> byte accesses, which would make them more generally useful.
> 
> Does indeed seem useful to me, as we could safely expand the usage of
> the bitmap ops without risking introducing bugs.

Aren't there architectures being handicapped when it comes to sub-word
accesses? At least common code may better not make assumptions towards
more fine grained accesses ...

As to x86, couldn't we make the macros evaluate alignof(*(addr)) and
choose byte-based accesses when it's less than 4?

Jan

