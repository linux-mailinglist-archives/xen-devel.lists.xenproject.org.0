Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8203AA77AF
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 18:49:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974916.1362637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAtZx-0005n0-9I; Fri, 02 May 2025 16:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974916.1362637; Fri, 02 May 2025 16:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAtZx-0005l4-6n; Fri, 02 May 2025 16:49:37 +0000
Received: by outflank-mailman (input) for mailman id 974916;
 Fri, 02 May 2025 16:49:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mfxJ=XS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uAtZw-0005ky-6k
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 16:49:36 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cb7235f-2775-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 18:49:34 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 754C4A4BDF0;
 Fri,  2 May 2025 16:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC4FBC4CEE4;
 Fri,  2 May 2025 16:49:31 +0000 (UTC)
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
X-Inumbo-ID: 6cb7235f-2775-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746204572;
	bh=WpuArh3K37LWZSj0UEq6/EWnz+FJnfy9DuvaKoNMZkM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LRREwy8BAOgR0ndNk5hIbWQ9Kbtzlwd9pbLFBX41WxYkSaKonXWD7AFpBql2W3+mL
	 7mZpxLcK4uMy73UgG4mS4/JooQa+hTB+4LcKNlLGFWiRAJUQhIyopkqYo9JK6JWBCC
	 dF+HFgYrBQyOiOy74ibYsM4doKevuud4n3h0Ufm95hJ2Apye0egKNeBPHePPuChsZ1
	 E+nrbtoD7kCAX3YKwm8hJ5QJjB/4otR3Y7I9AzWFwC2bjkix/mC1UScwOXNcZgRRRu
	 g9UfTgq6D2G2m6e5E5JiMf1uun11jRVpijdJQ3MzaCqOVnRc757oPnfdmZDotd7n5O
	 0fbhIu6a7mPqQ==
Date: Fri, 2 May 2025 09:49:30 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Jason Andryuk <jason.andryuk@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, agarciav@amd.com, 
    xen-devel@lists.xenproject.org, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
In-Reply-To: <773170d1-d8ba-4ba7-90b0-df0d160d8ba8@suse.com>
Message-ID: <alpine.DEB.2.22.394.2505020948380.3879245@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop> <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com> <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop> <06b66971-d8db-456f-8e83-a20ff7df8f5e@suse.com>
 <alpine.DEB.2.22.394.2504291425320.3879245@ubuntu-linux-20-04-desktop> <59bfc389-66c8-4d0f-92e3-c0079a807374@suse.com> <aBHUJjQk248aLi68@macbook.lan> <alpine.DEB.2.22.394.2504301715300.3879245@ubuntu-linux-20-04-desktop> <3e7b4b20-0127-4db2-806d-f142547f275a@amd.com>
 <773170d1-d8ba-4ba7-90b0-df0d160d8ba8@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1940203065-1746204572=:3879245"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1940203065-1746204572=:3879245
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 2 May 2025, Jan Beulich wrote:
> On 01.05.2025 15:44, Jason Andryuk wrote:
> > On 2025-04-30 20:19, Stefano Stabellini wrote:
> >> On Wed, 30 Apr 2025, Roger Pau Monné wrote:
> >>> On Wed, Apr 30, 2025 at 08:27:55AM +0200, Jan Beulich wrote:
> >>>> On 29.04.2025 23:52, Stefano Stabellini wrote:
> >>>>> On Tue, 29 Apr 2025, Jan Beulich wrote:
> >>>>>> On 28.04.2025 22:00, Stefano Stabellini wrote:
> >>>>>>> On Mon, 28 Apr 2025, Jan Beulich wrote:
> >>>>>>>> On 25.04.2025 22:19, Stefano Stabellini wrote:
> > 
> >>>>>>>>> --- a/xen/common/memory.c
> >>>>>>>>> +++ b/xen/common/memory.c
> >>>>>>>>> @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
> >>>>>>>>>               rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
> >>>>>>>>>                                           exch.out.extent_order) ?: rc;
> >>>>>>>>>   
> >>>>>>>>> -            if ( !paging_mode_translate(d) &&
> >>>>>>>>> +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
> >>>>>>>>>                    __copy_mfn_to_guest_offset(exch.out.extent_start,
> >>>>>>>>>                                               (i << out_chunk_order) + j,
> >>>>>>>>>                                               mfn) )
> >>>>>>>>
> >>>>>>>> Wait, no: A PVH domain (Dom0 or not) can't very well make use of MFNs, can
> >>>>>>>> it?
> >>>>>>>
> >>>>>>> One way or another Dom0 PVH needs to know the MFN to pass it to the
> >>>>>>> co-processor.
> >>>>>>
> >>>>>> I see. That's pretty odd, though. I'm then further concerned of the order of
> >>>>>> the chunks. At present we're rather lax, in permitting PVH and PV Dom0 the
> >>>>>> same upper bound. With both CPU and I/O side translation there is, in
> >>>>>> principle, no reason to permit any kind of contiguity. Of course there's a
> >>>>>> performance aspect, but that hardly matters in the specific case here. Yet at
> >>>>>> the same time, once we expose MFNs, contiguity will start mattering as soon
> >>>>>> as any piece of memory needs to be larger than PAGE_SIZE. Which means it will
> >>>>>> make tightening of the presently lax handling prone to regressions in this
> >>>>>> new behavior you're introducing. What chunk size does the PSP driver require?
> >>>>>
> >>>>> I don't know. The memory returned by XENMEM_exchange is contiguous,
> >>>>> right? Are you worried that Xen cannot allocate the requested amount of
> >>>>> memory contiguously?
> > 
> > In the case I looked at, it is 8 pages.  The driver defines a ring of 32 
> > * 1k entries.  I'm not sure if there are other paths or device versions 
> > where it might differ.
> 
> As per this ...
> 
> >>>> That would be Dom0's problem then. But really for a translated guest the
> >>>> exchanged chunks being contiguous shouldn't matter, correctness-wise. That is,
> >>>> within Xen, rather than failing a request, we could choose to retry using
> >>>> discontiguous chunks (contiguous only in GFN space). Such an (afaict)
> >>>> otherwise correct change would break your use case, as it would invalidate the
> >>>> MFN information passed back. (This fallback approach would similarly apply to
> >>>> other related mem-ops. It's just that during domain creation the tool stack
> >>>> has its own fallback, so it may not be of much use right now.)
> >>>
> >>> I think the description in the public header needs to be expanded to
> >>> specify what the XENMEM_exchange does for translated guests, and
> >>> clearly write down that the underlying MFNs for the exchanged region
> >>> will be contiguous.  Possibly a new XENMEMF_ flag needs to be added to
> >>> request contiguous physical memory for the new range.
> >>>
> >>> Sadly this also has the side effect of quite likely shattering
> >>> superpages for dom0 EPT/NPT, which will result in decreased dom0
> >>> performance.
> > 
> > Yes, this appears to happen as memory_exchange seems to always replace 
> > the pages.  I tested returning the existing MFNs if they are already 
> > contiguous since that was sufficient for this driver.  It worked, but it 
> > was messy.  A big loop to copy in the GFN array and check contiguity 
> > which duplicated much of the real loop.
> 
> ... there may not be a need for the output range to be contiguous? In which
> case - wouldn't a simple "give me the MFN for this GFN" hypercall do? I seem
> to vaguely recall that we even had one, long ago; it was purged because of
> it violating the "no MFNs exposed" principle (and because it not having had
> any use [anymore]). XENMEM_translate_gpfn_list looks like is what I mean;
> see commit 2d2f7977a052.

Unfortunately I don't think that would work because I am pretty sure
that the PSP needs a consecutive range. In other words, I think the
output needs to be contiguous.
--8323329-1940203065-1746204572=:3879245--

