Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 786BCAA58F8
	for <lists+xen-devel@lfdr.de>; Thu,  1 May 2025 02:19:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973973.1361976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAHe1-0006Wi-Eb; Thu, 01 May 2025 00:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973973.1361976; Thu, 01 May 2025 00:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAHe1-0006UD-Bg; Thu, 01 May 2025 00:19:17 +0000
Received: by outflank-mailman (input) for mailman id 973973;
 Thu, 01 May 2025 00:19:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iHxF=XR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uAHe0-0006U7-Hi
 for xen-devel@lists.xenproject.org; Thu, 01 May 2025 00:19:16 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e909f96e-2621-11f0-9ffb-bf95429c2676;
 Thu, 01 May 2025 02:19:14 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 34BE2435AA;
 Thu,  1 May 2025 00:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A0BC4CEE7;
 Thu,  1 May 2025 00:19:11 +0000 (UTC)
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
X-Inumbo-ID: e909f96e-2621-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746058752;
	bh=yWmu8O5Zf51smc8pIPQ+qfFl6Ivec1iyV2WZf/mQ8KY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=DTFATBY7irq4BT1STNIsVHIqXGx2Z7vIhAKegOgxrDpaPrR89xBFnQ40XftnWfu+J
	 hc2/EZRkMORem6ldQ/oxKu02xBB8srzU8wvQzsEoF1Da/Odwow8ADWMegHv1vcOROq
	 ucHwUtVlw11Wx6Pf9c6LsiM/UFcZ7vZOhRGI5rIdqlG83EZlUPbTh+EMrCF2o9ESy8
	 NfTQNymUC9RnMt8qJjSbR418Tq5nwlcDfit7tif7klh8TWbP93X6O0lD19zn5XXPff
	 GAF6lv4ZaSKB7WmpGFUiGug+JTjmTA6G9KSnJpAf+Xi5gtBsm3gq31D6H48adqnhDs
	 9zJD3l/9y+n2A==
Date: Wed, 30 Apr 2025 17:19:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, jason.andryuk@amd.com, 
    agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
In-Reply-To: <aBHUJjQk248aLi68@macbook.lan>
Message-ID: <alpine.DEB.2.22.394.2504301715300.3879245@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop> <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com> <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop> <06b66971-d8db-456f-8e83-a20ff7df8f5e@suse.com>
 <alpine.DEB.2.22.394.2504291425320.3879245@ubuntu-linux-20-04-desktop> <59bfc389-66c8-4d0f-92e3-c0079a807374@suse.com> <aBHUJjQk248aLi68@macbook.lan>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1953259969-1746058752=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1953259969-1746058752=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 30 Apr 2025, Roger Pau Monné wrote:
> On Wed, Apr 30, 2025 at 08:27:55AM +0200, Jan Beulich wrote:
> > On 29.04.2025 23:52, Stefano Stabellini wrote:
> > > On Tue, 29 Apr 2025, Jan Beulich wrote:
> > >> On 28.04.2025 22:00, Stefano Stabellini wrote:
> > >>> On Mon, 28 Apr 2025, Jan Beulich wrote:
> > >>>> On 25.04.2025 22:19, Stefano Stabellini wrote:
> > >>>>> --- a/xen/arch/x86/mm.c
> > >>>>> +++ b/xen/arch/x86/mm.c
> > >>>>> @@ -4401,7 +4401,7 @@ int steal_page(
> > >>>>>      const struct domain *owner;
> > >>>>>      int rc;
> > >>>>>  
> > >>>>> -    if ( paging_mode_external(d) )
> > >>>>> +    if ( paging_mode_external(d) && !is_hardware_domain(d) )
> > >>>>>          return -EOPNOTSUPP;
> > >>>>>  
> > >>>>>      /* Grab a reference to make sure the page doesn't change under our feet */
> > >>>>
> > >>>> Is this (in particular the code following below here) a safe thing to do
> > >>>> when we don't properly refcount page references from the P2M, yet? It's
> > >>>> Dom0, yes, but even there I might see potential security implications (as
> > >>>> top violating privacy of a guest).
> > >>>
> > >>> I don't think I am following, could you please elaborate more? The
> > >>> change I am proposing is to allow Dom0 to share its own pages to the
> > >>> co-processor. DomUs are not in the picture. I would be happy to add
> > >>> further restriction to that effect. Is there something else you have in
> > >>> mind?
> > >>
> > >> Once "shared" with the PSP, how would Xen know that this sharing has stopped?
> > >> Without knowing, how could it safely give the same page to a DomU later on?
> > >> ("Safely" in both directions: Without compromising privacy of the DomU and
> > >> without compromising host safety / security.)
> > > 
> > > Why would Xen later assign the same page to a DomU? The page comes
> > > from the hardware domain, which, as of today, cannot be destroyed. BTW I
> > > realize it is a bit different, but we have been doing the same thing
> > > with Dom0 1:1 mapped on ARM since the start of the project.
> > 
> > The life cycle of the page within Dom0 may be such that a need arises to
> > move it elsewhere (balloon out, grant-transfer, and what not).
> 
> I think it's up to dom0 to make sure the page is handled
> appropriately, in order for it to keep it's special contiguity
> properties.
> 
> If the PSP is not using the IOMMU page-tables for DMA accesses, and
> the hardware domain can freely interact with it, there's no protection
> from such device accessing any random MFN on the system, and hence no
> refcounts or similar will protect from that.

Yes, exactly!


> The only protection would be Xen owning the device, and the hardware
> domain using an emulated/mediated interface to communicate with it.  I
> have no idea how complicated the PSP interface is, and whether it
> would be feasible to trap and emulate/mediate accesses in Xen.

There will be always the possibility of devices or co-processors or
firmware not behind the IOMMU and we won't be able to handle them all in
Xen.


> > >>>>> --- a/xen/common/memory.c
> > >>>>> +++ b/xen/common/memory.c
> > >>>>> @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
> > >>>>>              rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
> > >>>>>                                          exch.out.extent_order) ?: rc;
> > >>>>>  
> > >>>>> -            if ( !paging_mode_translate(d) &&
> > >>>>> +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
> > >>>>>                   __copy_mfn_to_guest_offset(exch.out.extent_start,
> > >>>>>                                              (i << out_chunk_order) + j,
> > >>>>>                                              mfn) )
> > >>>>
> > >>>> Wait, no: A PVH domain (Dom0 or not) can't very well make use of MFNs, can
> > >>>> it?
> > >>>
> > >>> One way or another Dom0 PVH needs to know the MFN to pass it to the
> > >>> co-processor.
> > >>
> > >> I see. That's pretty odd, though. I'm then further concerned of the order of
> > >> the chunks. At present we're rather lax, in permitting PVH and PV Dom0 the
> > >> same upper bound. With both CPU and I/O side translation there is, in
> > >> principle, no reason to permit any kind of contiguity. Of course there's a
> > >> performance aspect, but that hardly matters in the specific case here. Yet at
> > >> the same time, once we expose MFNs, contiguity will start mattering as soon
> > >> as any piece of memory needs to be larger than PAGE_SIZE. Which means it will
> > >> make tightening of the presently lax handling prone to regressions in this
> > >> new behavior you're introducing. What chunk size does the PSP driver require?
> > > 
> > > I don't know. The memory returned by XENMEM_exchange is contiguous,
> > > right? Are you worried that Xen cannot allocate the requested amount of
> > > memory contiguously?
> > 
> > That would be Dom0's problem then. But really for a translated guest the
> > exchanged chunks being contiguous shouldn't matter, correctness-wise. That is,
> > within Xen, rather than failing a request, we could choose to retry using
> > discontiguous chunks (contiguous only in GFN space). Such an (afaict)
> > otherwise correct change would break your use case, as it would invalidate the
> > MFN information passed back. (This fallback approach would similarly apply to
> > other related mem-ops. It's just that during domain creation the tool stack
> > has its own fallback, so it may not be of much use right now.)
> 
> I think the description in the public header needs to be expanded to
> specify what the XENMEM_exchange does for translated guests, and
> clearly write down that the underlying MFNs for the exchanged region
> will be contiguous.  Possibly a new XENMEMF_ flag needs to be added to
> request contiguous physical memory for the new range.
> 
> Sadly this also has the side effect of quite likely shattering
> superpages for dom0 EPT/NPT, which will result in decreased dom0
> performance.
> 
> We have so far avoided exposing MFNs to HVM/PVH, but I don't see much
> way to avoid this if there's no option to use IOMMU or NPT page-tables
> with the PSP and we don't want to intercept PSP accesses in Xen and
> translate requests on the fly.
 
Yeah, I think the same way too.
--8323329-1953259969-1746058752=:3879245--

