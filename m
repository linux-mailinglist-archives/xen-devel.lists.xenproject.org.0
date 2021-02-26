Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 695C1326908
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 22:01:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90595.171544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFkEh-00055L-GD; Fri, 26 Feb 2021 21:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90595.171544; Fri, 26 Feb 2021 21:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFkEh-00054w-Cq; Fri, 26 Feb 2021 21:01:19 +0000
Received: by outflank-mailman (input) for mailman id 90595;
 Fri, 26 Feb 2021 21:01:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ECYH=H4=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lFkEg-00054r-Gg
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 21:01:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3585c70b-e534-423a-9daf-6c0c7dcd748f;
 Fri, 26 Feb 2021 21:01:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AD00B64F0E;
 Fri, 26 Feb 2021 21:01:16 +0000 (UTC)
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
X-Inumbo-ID: 3585c70b-e534-423a-9daf-6c0c7dcd748f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1614373277;
	bh=mAq4FzubIn94I1dTVuxTmD/bmmz+4fpky/DYOFONgrA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bp65KSvOHRYfDF4P8WRx5jrOJ0mpmIZjSLdwW18FDalWC7ujV9bhijBzK/pILsB00
	 nse0cNXxtK65AMGAMlV9msmDBc2aq2HlGjAM988dP5Z/cROldSZLD0pM9ESLflfH9c
	 KQ5511E9+0rHzTs/BpyQVd6VZ8zp+sMURp5JxQzIFR4L8K1LO6DSbBUZS7raM/C5TL
	 uMCq/S3eJm6TpEBojfs1lN5iWAs5SNIVQlSao68nHPVxz/tbDCsz6I41Ic5Vxrym7A
	 a69CDt9a/QqReEf6fhgHfKcOPVGt9SBuAOuxPun6iwnIA8dPSrKTRE0gUBtF7d/jD+
	 c4LtUxbzYYm5A==
Date: Fri, 26 Feb 2021 13:01:15 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, 
    andrew.cooper3@citrix.com, julien@xen.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen: introduce XENFEAT_direct_mapped and
 XENFEAT_not_direct_mapped
In-Reply-To: <fe4f0f87-0b6a-c37a-7f17-e3cf40f739f1@suse.com>
Message-ID: <alpine.DEB.2.21.2102261246580.3234@sstabellini-ThinkPad-T480s>
References: <20210225012243.28530-1-sstabellini@kernel.org> <96d764b6-a719-711c-31ea-235381bfd0ce@suse.com> <alpine.DEB.2.21.2102250948160.3234@sstabellini-ThinkPad-T480s> <fe4f0f87-0b6a-c37a-7f17-e3cf40f739f1@suse.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 26 Feb 2021, Jan Beulich wrote:
> On 25.02.2021 21:51, Stefano Stabellini wrote:
> > On Thu, 25 Feb 2021, Jan Beulich wrote:
> >> On 25.02.2021 02:22, Stefano Stabellini wrote:
> >>> --- a/xen/include/public/features.h
> >>> +++ b/xen/include/public/features.h
> >>> @@ -114,6 +114,13 @@
> >>>   */
> >>>  #define XENFEAT_linux_rsdp_unrestricted   15
> >>>  
> >>> +/*
> >>> + * A direct-mapped (or 1:1 mapped) domain is a domain for which its
> >>> + * local pages have gfn == mfn.
> >>> + */
> >>> +#define XENFEAT_not_direct_mapped       16
> >>> +#define XENFEAT_direct_mapped           17
> >>
> >> Why two new values? Absence of XENFEAT_direct_mapped requires
> >> implying not-direct-mapped by the consumer anyway, doesn't it?
> > 
> > That's because if we add both flags we can avoid all unpleasant guessing
> > games in the guest kernel.
> > 
> > If one flag or the other flag is set, we can make an informed decision.
> > 
> > But if neither flag is set, it means we are running on an older Xen,
> > and we fall back on the current checks.
> 
> Oh, okay - if there's guesswork to avoid, then I see the point.
> Maybe mention in the description?

Yes, I can do that.


> >> Further, quoting xen/mm.h: "For a non-translated guest which
> >> is aware of Xen, gfn == mfn." This to me implies that PV would
> >> need to get XENFEAT_direct_mapped set; not sure whether this
> >> simply means x86'es is_domain_direct_mapped() is wrong, but if
> >> it is, uses elsewhere in the code would likely need changing.
> > 
> > That's a good point, I didn't think about x86 PV. I think the two flags
> > are needed for autotranslated guests. I don't know for sure what is best
> > for non-autotranslated guests.
> > 
> > Maybe we could say that XENFEAT_not_direct_mapped and
> > XENFEAT_direct_mapped only apply to XENFEAT_auto_translated_physmap
> > guests. And it would match the implementation of
> > is_domain_direct_mapped().
> 
> I'm having trouble understanding this last sentence, and hence I'm
> not sure I understand the rest in the way you may mean it. Neither
> x86'es nor Arm's is_domain_direct_mapped() has any check towards a
> guest being translated (obviously such a check would be redundant
> on Arm).

I meant that we are not explicitely checking for auto_translated in
neither version of is_domain_direct_mapped(), but it is sort of implied.


> > For non XENFEAT_auto_translated_physmap guests we could either do:
> > 
> > - neither flag is set
> > - set XENFEAT_direct_mapped (without changing the implementation of
> >   is_domain_direct_mapped)
> > 
> > What do you think? I am happy either way.
> 
> I'm happy either way as well; suitably described perhaps setting
> XENFEAT_direct_mapped when !paging_mode_translate() would be
> slightly more "natural". But a spelled out and enforced
> dependency upon XENFEAT_auto_translated_physmap would too be fine
> with me.

OK. I'll go with:

            if ( is_domain_direct_mapped(d) || !paging_mode_translate(d) )
                fi.submap |= (1U << XENFEAT_direct_mapped);
            else
                fi.submap |= (1U << XENFEAT_not_direct_mapped);


With an appropriate explanation.

