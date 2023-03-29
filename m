Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B95B6CD24D
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 08:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516059.799571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phPcN-0005mV-9G; Wed, 29 Mar 2023 06:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516059.799571; Wed, 29 Mar 2023 06:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phPcN-0005kF-6O; Wed, 29 Mar 2023 06:49:11 +0000
Received: by outflank-mailman (input) for mailman id 516059;
 Wed, 29 Mar 2023 06:49:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5OA=7V=xen.org=tim@srs-se1.protection.inumbo.net>)
 id 1phPcM-0005k9-4K
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 06:49:10 +0000
Received: from deinos.phlegethon.org (deinos.phlegethon.org
 [2001:41d0:8:b1d7::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbe64cfb-cdfd-11ed-b464-930f4c7d94ae;
 Wed, 29 Mar 2023 08:49:06 +0200 (CEST)
Received: from tjd by deinos.phlegethon.org with local (Exim 4.94.2 (FreeBSD))
 (envelope-from <tim@xen.org>)
 id 1phPcC-0004R8-VQ; Wed, 29 Mar 2023 06:49:00 +0000
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
X-Inumbo-ID: cbe64cfb-cdfd-11ed-b464-930f4c7d94ae
Date: Wed, 29 Mar 2023 07:49:00 +0100
From: Tim Deegan <tim@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH 07/16] x86/shadow: call sh_update_cr3() directly from
 sh_page_fault()
Message-ID: <20230329064900.GA17009@deinos.phlegethon.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <69304929-de84-04db-04f2-8faffc12ef0f@suse.com>
 <20230327153922.GA96023@deinos.phlegethon.org>
 <324a10c7-92f6-d636-ee3b-da9858399d34@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <324a10c7-92f6-d636-ee3b-da9858399d34@suse.com>
X-SA-Known-Good: Yes
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: tim@xen.org
X-SA-Exim-Scanned: No (on deinos.phlegethon.org); SAEximRunCond expanded to false

At 12:37 +0200 on 28 Mar (1680007032), Jan Beulich wrote:
> On 27.03.2023 17:39, Tim Deegan wrote:
> > At 10:33 +0100 on 22 Mar (1679481226), Jan Beulich wrote:
> >> There's no need for an indirect call here, as the mode is invariant
> >> throughout the entire paging-locked region. All it takes to avoid it is
> >> to have a forward declaration of sh_update_cr3() in place.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> I find this and the respective Win7 related comment suspicious: If we
> >> really need to "fix up" L3 entries "on demand", wouldn't we better retry
> >> the shadow_get_and_create_l1e() rather than exit? The spurious page
> >> fault that the guest observes can, after all, not be known to be non-
> >> fatal inside the guest. That's purely an OS policy.
> > 
> > I think it has to be non-fatal because it can happen on real hardware,
> > even if the hardware *does* fill the TLB here (which it is not
> > required to).
> 
> But if hardware filled the TLB, it won't raise #PF. If it didn't fill
> the TLB (e.g. because of not even doing a walk when a PDPTE is non-
> present), a #PF would be legitimate, and the handler would then need
> to reload CR3. But such a #PF is what, according to the comment, Win7
> chokes on.

IIRC the Win7 behaviour is to accept and discard the #PF as spurious
(because it sees the PDPTE is present) *without* reloading CR3, so it
gets stuck in a loop taking pagefaults.  Here, we reload CR3 for it,
to unstick it.

I can't think of a mental model of the MMU that would have a problem
here -- either the L3Es are special in which case the pagefault is
correct (and we shouldn't even read the new contents) or they're just
like other PTEs in which case the spurious fault is fine.

> > The assert's not true here because the guest can push us down this
> > path by doing exactly what Win 7 does here - loading CR3 with a
> > missing L3E, then filling the L3E and causing a page fault that uses
> > the now-filled L3E.  (Or maybe that's not true any more; my mental
> > model of the pagetable walker code might be out of date)
> 
> Well, I specifically started the paragraph with 'Beyond the "on demand"
> L3 entry creation'. IOW the assertion would look applicable to me if
> we, as suggested higher up, retried shadow_get_and_create_l1e() and it
> failed again. As the comment there says, "we know the guest entries are
> OK", so the missing L3 entry must have appeared.

Ah, I didn't quite understand you.  Yes, if we changed the handler to
rebuild the SL3E then I think the assertion would be valid again.

Cheers,

Tim.

