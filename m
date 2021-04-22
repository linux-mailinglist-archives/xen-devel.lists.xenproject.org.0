Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7FD3682EC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 17:05:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115596.220579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZatJ-0007rE-BU; Thu, 22 Apr 2021 15:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115596.220579; Thu, 22 Apr 2021 15:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZatJ-0007qr-8G; Thu, 22 Apr 2021 15:05:17 +0000
Received: by outflank-mailman (input) for mailman id 115596;
 Thu, 22 Apr 2021 15:05:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wiI7=JT=xen.org=tim@srs-us1.protection.inumbo.net>)
 id 1lZatH-0007qm-5H
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 15:05:15 +0000
Received: from deinos.phlegethon.org (unknown [2001:41d0:8:b1d7::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5fcaf03d-0caf-4e67-bdfe-fe0f52915640;
 Thu, 22 Apr 2021 15:05:13 +0000 (UTC)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.92.3 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1lZatB-0000HF-66; Thu, 22 Apr 2021 15:05:09 +0000
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
X-Inumbo-ID: 5fcaf03d-0caf-4e67-bdfe-fe0f52915640
Date: Thu, 22 Apr 2021 16:05:09 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jun Nakajima <jun.nakajima@intel.com>
Subject: Re: [PATCH v4] VMX: use a single, global APIC access page
Message-ID: <YIGQpZ+j8ZvWo14f@deinos.phlegethon.org>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <1c489e77-6e65-6121-6c28-3c4bd377223c@suse.com>
 <YHs2AJ6pqrAw7uew@deinos.phlegethon.org>
 <d698a29e-fb4e-a650-9e48-ad209e64c800@suse.com>
 <YIEo3DQojgc0zlzw@deinos.phlegethon.org>
 <9a00493c-319f-58c6-853c-382dd7a95561@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <9a00493c-319f-58c6-853c-382dd7a95561@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 11:38 +0200 on 22 Apr (1619091522), Jan Beulich wrote:
> On 22.04.2021 09:42, Tim Deegan wrote:
> > At 13:25 +0200 on 19 Apr (1618838726), Jan Beulich wrote:
> >> On 17.04.2021 21:24, Tim Deegan wrote:
> >>> At 12:40 +0200 on 12 Apr (1618231248), Jan Beulich wrote:
> >>>> --- a/xen/arch/x86/mm/shadow/set.c
> >>>> +++ b/xen/arch/x86/mm/shadow/set.c
> >>>> @@ -94,6 +94,22 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
> >>>>      ASSERT(!sh_l1e_is_magic(sl1e));
> >>>>      ASSERT(shadow_mode_refcounts(d));
> >>>>  
> >>>> +    /*
> >>>> +     * VMX'es APIC access MFN is just a surrogate page.  It doesn't actually
> >>>> +     * get accessed, and hence there's no need to refcount it (and refcounting
> >>>> +     * would fail, due to the page having no owner).
> >>>> +     */
> >>>> +    if ( mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) )
> >>>
> >>> Would it be better to check specifically for mfn == apic_access_mfn
> >>> (and apic_access_mfn != 0, I guess)?
> >>
> >> Roger did ask about the same - I neither want to expose apic_access_mfn
> >> outside its CU, nor do I want to introduce an accessor function. Both
> >> feel like layering violations to me.
> > 
> > I think that this is even more of a layering violation: what we
> > actually want is to allow un-refcounted mappings of the
> > apic_access_mfn, but to do it we're relying on an internal
> > implementation detail (that it happens to be un-owned and PGC_extra)
> > rather than giving ourselves an API.
> > 
> > And so we're tangled up talking about how to write comments to warn
> > our future selves about the possible side-effects.
> > 
> >>>  If we want this behaviour for
> >>> for all un-owned PGC_extra MFNs it would be good to explain that in the
> >>> comments.
> >>
> >> This is hard to tell without knowing which (or even if) further such
> >> PGC_extra pages will appear. Hence any comment to that effect would be
> >> guesswork at best. Of course I can add e.g. "Other pages with the same
> >> properties would be treated the same", if that's what you're after?
> > 
> > If you want to go this way there should be a comment here saying that
> > we're allowing this for all PGC_extra pages because we need it for
> > apic_access_mfn, and a comment at PGC_extra saying that it has this
> > effect.
> 
> So (along with a comment to this effect) how about I make
> page_suppress_refcounting() and page_refcounting_suppressed() helpers?
> The former would set PGC_extra on the page and assert the page has no
> owner, while the latter would subsume the checks done here.

That sounds good to me.

> The only
> question then is what to do with the ASSERT(type == p2m_mmio_direct):
> That's still a property of the APIC access MFN which may or may not
> hold for future such pages. (It can't be part of the new helper anyway
> as "put" doesn't have the type available.)

I think we might drop that assertion, since the new mehanism would be
more general.

Cheers,

Tim.

