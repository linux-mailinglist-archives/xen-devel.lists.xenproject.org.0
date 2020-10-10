Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA04289EFE
	for <lists+xen-devel@lfdr.de>; Sat, 10 Oct 2020 09:46:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.5326.13950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kR9Zx-0007dl-Oa; Sat, 10 Oct 2020 07:46:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 5326.13950; Sat, 10 Oct 2020 07:46:09 +0000
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
	id 1kR9Zx-0007dQ-LO; Sat, 10 Oct 2020 07:46:09 +0000
Received: by outflank-mailman (input) for mailman id 5326;
 Sat, 10 Oct 2020 07:46:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7bc=DR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kR9Zw-0007dL-H5
 for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 07:46:08 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8016231a-0505-4f81-99e4-e19300d88777;
 Sat, 10 Oct 2020 07:46:01 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=M7bc=DR=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kR9Zw-0007dL-H5
	for xen-devel@lists.xenproject.org; Sat, 10 Oct 2020 07:46:08 +0000
X-Inumbo-ID: 8016231a-0505-4f81-99e4-e19300d88777
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8016231a-0505-4f81-99e4-e19300d88777;
	Sat, 10 Oct 2020 07:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1602315961;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9rgp/WPws0Jq25znxcrpUTPnAVAtTUiAVNt+qnsvDDI=;
  b=BWTJ0mi7cCufiBHhYcRyqrRGHq4oNQKrhHrSNQ/yjepGUfzAtmLSzMAE
   1PLWY0WWQf4ZSeWPKSRIa/wvo9li5PSSZrDJVd6Gj3JJdP5XysVBlmETM
   c6V60hGBoGcHGvPee/Ce4ReIsshpPdgVhPWLYiEHsn5NPOfCq5WE7l516
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 4dotsxQFiu5/9b0VnskP7iYC+UOVNAw6EckU/ATIiGp7mkSDuwy5KdxGSvRnmoYdZEOPJZ4pGx
 9c+Fg1viDFdoGxkR5DXdpt7a7wvtFujryffA9gm2XXNBjWoOeMJmGgRt+DpK9NtTbx1JNuMFMs
 41Q9Pas5J9Ca98gFwS0l6seEmfoIK6Le49b8HZt+klcLw5UoBSrQ3INonzsD/q5RzCw/an4OZm
 gIYzeKPu5YmcfH4tyaausSJp3+v+8KbIKOzEEE0jBZ/Xc+kDCm2faWCsP1FjQADKqRFpmn8lW5
 n0Q=
X-SBRS: 2.5
X-MesageID: 29051009
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,358,1596513600"; 
   d="scan'208";a="29051009"
Date: Sat, 10 Oct 2020 09:45:25 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v2 4/4] x86/shadow: refactor shadow_vram_{get,put}_l1e()
Message-ID: <20201010074525.GO19254@Air-de-Roger>
References: <c6b9c903-02eb-d473-86e3-ccb67aff6cd7@suse.com>
 <51515581-19f3-5b7c-a2f9-1a0b11f8283a@suse.com>
 <20201008151556.GL19254@Air-de-Roger>
 <e769e1ae-fd2f-881e-4dcc-3cbf40d6b732@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e769e1ae-fd2f-881e-4dcc-3cbf40d6b732@citrix.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 FTLPEX02CL06.citrite.net (10.13.108.179)

On Thu, Oct 08, 2020 at 04:36:47PM +0100, Andrew Cooper wrote:
> On 08/10/2020 16:15, Roger Pau Monné wrote:
> > On Wed, Sep 16, 2020 at 03:08:40PM +0200, Jan Beulich wrote:
> >> By passing the functions an MFN and flags, only a single instance of
> >                            ^ a
> 
> 'an' is correct.
> 
> an MFN
> a Machine Frame Number
> 
> because the pronunciation changes.  "an" precedes anything with a vowel
> sound, not just vowels themselves.  (Isn't English great...)

Oh great, I think I've been misspelling this myself for a long time.

> >> each is needed; they were pretty large for being inline functions
> >> anyway.
> >>
> >> While moving the code, also adjust coding style and add const where
> >> sensible / possible.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> v2: New.
> >>
> >> --- a/xen/arch/x86/mm/shadow/hvm.c
> >> +++ b/xen/arch/x86/mm/shadow/hvm.c
> >> @@ -903,6 +903,104 @@ int shadow_track_dirty_vram(struct domai
> >>      return rc;
> >>  }
> >>  
> >> +void shadow_vram_get_mfn(mfn_t mfn, unsigned int l1f,
> >> +                         mfn_t sl1mfn, const void *sl1e,
> >> +                         const struct domain *d)
> >> +{
> >> +    unsigned long gfn;
> >> +    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
> >> +
> >> +    ASSERT(is_hvm_domain(d));
> >> +
> >> +    if ( !dirty_vram /* tracking disabled? */ ||
> >> +         !(l1f & _PAGE_RW) /* read-only mapping? */ ||
> >> +         !mfn_valid(mfn) /* mfn can be invalid in mmio_direct */)
> >> +        return;
> >> +
> >> +    gfn = gfn_x(mfn_to_gfn(d, mfn));
> >> +    /* Page sharing not supported on shadow PTs */
> >> +    BUG_ON(SHARED_M2P(gfn));
> >> +
> >> +    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
> >> +    {
> >> +        unsigned long i = gfn - dirty_vram->begin_pfn;
> >> +        const struct page_info *page = mfn_to_page(mfn);
> >> +
> >> +        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
> >> +            /* Initial guest reference, record it */
> >> +            dirty_vram->sl1ma[i] = mfn_to_maddr(sl1mfn) |
> >> +                                   PAGE_OFFSET(sl1e);
> >> +    }
> >> +}
> >> +
> >> +void shadow_vram_put_mfn(mfn_t mfn, unsigned int l1f,
> >> +                         mfn_t sl1mfn, const void *sl1e,
> >> +                         const struct domain *d)
> >> +{
> >> +    unsigned long gfn;
> >> +    struct sh_dirty_vram *dirty_vram = d->arch.hvm.dirty_vram;
> >> +
> >> +    ASSERT(is_hvm_domain(d));
> >> +
> >> +    if ( !dirty_vram /* tracking disabled? */ ||
> >> +         !(l1f & _PAGE_RW) /* read-only mapping? */ ||
> >> +         !mfn_valid(mfn) /* mfn can be invalid in mmio_direct */)
> >> +        return;
> >> +
> >> +    gfn = gfn_x(mfn_to_gfn(d, mfn));
> >> +    /* Page sharing not supported on shadow PTs */
> >> +    BUG_ON(SHARED_M2P(gfn));
> >> +
> >> +    if ( (gfn >= dirty_vram->begin_pfn) && (gfn < dirty_vram->end_pfn) )
> >> +    {
> >> +        unsigned long i = gfn - dirty_vram->begin_pfn;
> >> +        const struct page_info *page = mfn_to_page(mfn);
> >> +        bool dirty = false;
> >> +        paddr_t sl1ma = mfn_to_maddr(sl1mfn) | PAGE_OFFSET(sl1e);
> >> +
> >> +        if ( (page->u.inuse.type_info & PGT_count_mask) == 1 )
> >> +        {
> >> +            /* Last reference */
> >> +            if ( dirty_vram->sl1ma[i] == INVALID_PADDR )
> >> +            {
> >> +                /* We didn't know it was that one, let's say it is dirty */
> >> +                dirty = true;
> >> +            }
> >> +            else
> >> +            {
> >> +                ASSERT(dirty_vram->sl1ma[i] == sl1ma);
> >> +                dirty_vram->sl1ma[i] = INVALID_PADDR;
> >> +                if ( l1f & _PAGE_DIRTY )
> >> +                    dirty = true;
> >> +            }
> >> +        }
> >> +        else
> >> +        {
> >> +            /* We had more than one reference, just consider the page dirty. */
> >> +            dirty = true;
> >> +            /* Check that it's not the one we recorded. */
> >> +            if ( dirty_vram->sl1ma[i] == sl1ma )
> >> +            {
> >> +                /* Too bad, we remembered the wrong one... */
> >> +                dirty_vram->sl1ma[i] = INVALID_PADDR;
> >> +            }
> >> +            else
> >> +            {
> >> +                /*
> >> +                 * Ok, our recorded sl1e is still pointing to this page, let's
> >> +                 * just hope it will remain.
> >> +                 */
> >> +            }
> >> +        }
> >> +
> >> +        if ( dirty )
> >> +        {
> >> +            dirty_vram->dirty_bitmap[i / 8] |= 1 << (i % 8);
> > Could you use _set_bit here?
> 
> __set_bit() uses 4-byte accesses.  This uses 1-byte accesses.

Right, this is allocated using alloc directly, not the bitmap helper,
and the size if rounded to byte level, not unsigned int.

> Last I checked, there is a boundary issue at the end of the dirty_bitmap.
> 
> Both Julien and I have considered changing our bit infrastructure to use
> byte accesses, which would make them more generally useful.

Does indeed seem useful to me, as we could safely expand the usage of
the bitmap ops without risking introducing bugs.

Thanks, Roger.

