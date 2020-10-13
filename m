Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C578A28CBA8
	for <lists+xen-devel@lfdr.de>; Tue, 13 Oct 2020 12:30:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.6139.16159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kSHYe-000226-F2; Tue, 13 Oct 2020 10:29:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 6139.16159; Tue, 13 Oct 2020 10:29:28 +0000
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
	id 1kSHYe-00021j-Bj; Tue, 13 Oct 2020 10:29:28 +0000
Received: by outflank-mailman (input) for mailman id 6139;
 Tue, 13 Oct 2020 10:29:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kSHYc-00021e-Pp
 for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 10:29:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a757acf7-33d2-430e-8b07-e6cbb768f4c4;
 Tue, 13 Oct 2020 10:29:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D2852ADA8;
 Tue, 13 Oct 2020 10:29:23 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VY8U=DU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kSHYc-00021e-Pp
	for xen-devel@lists.xenproject.org; Tue, 13 Oct 2020 10:29:26 +0000
X-Inumbo-ID: a757acf7-33d2-430e-8b07-e6cbb768f4c4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a757acf7-33d2-430e-8b07-e6cbb768f4c4;
	Tue, 13 Oct 2020 10:29:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1602584963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KyK3FBPEsgk1cDe7NYdwCSADIfUezZUAE+KS8wpVbEQ=;
	b=obDL5Qh24FeXCwuSarpaVCS2YCKTXhSpnCmC3GVH1B1y++6VzSXfsKRU4FkMoKn/idYLVk
	bDuBxQ45C2KDp60Fz+lrlqdhDS30sM3IkiIZgtA9xDY87VA2/5ZJEXoGYSif775Y4Kp/Zg
	L3/N/xCG1hdpz9jD7P0trq5KkFGgMMI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D2852ADA8;
	Tue, 13 Oct 2020 10:29:23 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] x86/shadow: refactor shadow_vram_{get,put}_l1e()
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
References: <c6b9c903-02eb-d473-86e3-ccb67aff6cd7@suse.com>
 <51515581-19f3-5b7c-a2f9-1a0b11f8283a@suse.com>
 <20201008151556.GL19254@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <070ad2c4-1887-67dc-34eb-7107c9360c01@suse.com>
Date: Tue, 13 Oct 2020 12:29:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201008151556.GL19254@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.10.2020 17:15, Roger Pau Monné wrote:
> On Wed, Sep 16, 2020 at 03:08:40PM +0200, Jan Beulich wrote:
>> +void shadow_vram_put_mfn(mfn_t mfn, unsigned int l1f,
>> +                         mfn_t sl1mfn, const void *sl1e,
>> +                         const struct domain *d)
>> +{
>> +    unsigned long gfn;
>> +    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
>> +
>> +    ASSERT(is_hvm_domain(d));
>> +
>> +    if ( !dirty_vram /* tracking disabled? */ ||
>> +         !(l1f & _PAGE_RW) /* read-only mapping? */ ||
>> +         !mfn_valid(mfn) /* mfn can be invalid in mmio_direct */)
>> +        return;
>> +
>> +    gfn = gfn_x(mfn_to_gfn(d, mfn));
>> +    /* Page sharing not supported on shadow PTs */
>> +    BUG_ON(SHARED_M2P(gfn));
>> +
>> +    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
>> +    {
>> +        unsigned long i = gfn - dirty_vram->begin_pfn;
>> +        const struct page_info *page = mfn_to_page(mfn);
>> +        bool dirty = false;
>> +        paddr_t sl1ma = mfn_to_maddr(sl1mfn) | PAGE_OFFSET(sl1e);
>> +
>> +        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
>> +        {
>> +            /* Last reference */
>> +            if ( dirty_vram->sl1ma[i] == INVALID_PADDR )
>> +            {
>> +                /* We didn't know it was that one, let's say it is dirty */
>> +                dirty = true;
>> +            }
>> +            else
>> +            {
>> +                ASSERT(dirty_vram->sl1ma[i] == sl1ma);
>> +                dirty_vram->sl1ma[i] = INVALID_PADDR;
>> +                if ( l1f & _PAGE_DIRTY )
>> +                    dirty = true;
>> +            }
>> +        }
>> +        else
>> +        {
>> +            /* We had more than one reference, just consider the page dirty. */
>> +            dirty = true;
>> +            /* Check that it's not the one we recorded. */
>> +            if ( dirty_vram->sl1ma[i] == sl1ma )
>> +            {
>> +                /* Too bad, we remembered the wrong one... */
>> +                dirty_vram->sl1ma[i] = INVALID_PADDR;
>> +            }
>> +            else
>> +            {
>> +                /*
>> +                 * Ok, our recorded sl1e is still pointing to this page, let's
>> +                 * just hope it will remain.
>> +                 */
>> +            }
>> +        }
>> +
>> +        if ( dirty )
>> +        {
>> +            dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
> 
> Could you use _set_bit here?

In addition to what Andrew has said - this would be a non cosmetic
change, which I wouldn't want to do in a patch merely moving this
code.

>> @@ -1194,7 +1094,9 @@ static int shadow_set_l1e(struct domain
>>                  new_sl1e = shadow_l1e_flip_flags(new_sl1e, rc);
>>                  /* fall through */
>>              case 0:
>> -                shadow_vram_get_l1e(new_sl1e, sl1e, sl1mfn, d);
>> +                shadow_vram_get_mfn(shadow_l1e_get_mfn(new_sl1e),
>> +                                    shadow_l1e_get_flags(new_sl1e),
>> +                                    sl1mfn, sl1e, d);
> 
> As you have moved this function into a HVM build time file, don't you
> need to guard this call, or alternatively provide a dummy handler for
> !CONFIG_HVM in private.h?
> 
> Same for shadow_vram_put_mfn.

All uses are inside conditionals using shadow_mode_refcounts(), i.e.
the compiler's DCE pass will eliminate the calls. All we need are
declarations to be in scope.

Jan

