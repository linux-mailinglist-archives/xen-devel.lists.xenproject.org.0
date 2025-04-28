Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CC8A9FA11
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 22:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971065.1359565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Ue9-00019n-Im; Mon, 28 Apr 2025 20:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971065.1359565; Mon, 28 Apr 2025 20:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Ue9-00017z-Fe; Mon, 28 Apr 2025 20:00:09 +0000
Received: by outflank-mailman (input) for mailman id 971065;
 Mon, 28 Apr 2025 20:00:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4d+=XO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9Ue8-00012R-5q
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 20:00:08 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 609bd679-246b-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 22:00:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0B24A614AE;
 Mon, 28 Apr 2025 19:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C49C4CEE4;
 Mon, 28 Apr 2025 20:00:02 +0000 (UTC)
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
X-Inumbo-ID: 609bd679-246b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745870403;
	bh=Wa5tKhRRN1izRUWp1i89VyOnRgoGFkrfdNOAHRCPg7s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=F0O945RvgKukt99zLEtvYdRW97mDBH+opgH2FGXu0XE+ze7JyDqFF0ygxkBfg51Ou
	 YiMIcXgUA4cwaEa19N2YkOBoEDcx2AMOyrO7zKPvBys0qvfbX0YngVgCrtgggteQwW
	 1drdumIYWw861+Q31okVInGlfEKOqQS0UIz/Wz2nyDvbSHr0CK1uUQOsIDcBJ+rX1B
	 9apcD+V+z86wGB+GBAoi190TRu9rkoE8gt/j4bZii/g4elgQQR2IaOAg8tVjgSFgeq
	 deyKbE0c+jiRsVFENHwh0vJaoAHm39VfGuoYfiLa3mobu287p161BfmQn7L1TladLJ
	 sfR6+xrbu4D/Q==
Date: Mon, 28 Apr 2025 13:00:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jan Beulich <jbeulich@suse.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    jason.andryuk@amd.com, agarciav@amd.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
In-Reply-To: <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
Message-ID: <alpine.DEB.2.22.394.2504281242240.785180@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop> <19d9aec4-c21a-47a9-9c58-6bfcadbd22e0@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 28 Apr 2025, Jan Beulich wrote:
> On 25.04.2025 22:19, Stefano Stabellini wrote:
> > From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> > 
> > Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> > addresses to firmware or co-processors not behind an IOMMU.
> 
> I definitely don't understand the firmware part: It's subject to the
> same transparent P2M translations as the rest of the VM; it's just
> another piece of software running there.
> 
> "Co-processors not behind an IOMMU" is also interesting; a more
> concrete scenario might be nice, yet I realize you may be limited in
> what you're allowed to say.

Sure. On AMD x86 platforms there is a co-processor called PSP running
TEE firmware. The PSP is not behind an IOMMU. Dom0 needs occasionally to
pass addresses to it.  See drivers/tee/amdtee/ and
include/linux/psp-tee.h in Linux.

This is not a new problem. On ARM we have been dealing with this kind of
issues for more than a decade and it is the reason why originally the
decision was to run Dom0 1:1 mapped on ARM. I am not suggesting to map
Dom0 PVH 1:1; I am only providing context and highlighting that we
have been lucky on x86 :-)


> > XENMEM_exchange was blocked for HVM/PVH DomUs, and accidentally it
> > impacted Dom0 PVH as well.
> 
> This wasn't accidental at all, I don't think.

You as the original author of the patch (fae7d5be8bb) in question would
surely know better. But the way the commit message was written was
pointing toward a Dom0/DeviceModel problem:

"The operation's success can't be controlled by the guest, as the device
model may have an active mapping of the page."


> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -4401,7 +4401,7 @@ int steal_page(
> >      const struct domain *owner;
> >      int rc;
> >  
> > -    if ( paging_mode_external(d) )
> > +    if ( paging_mode_external(d) && !is_hardware_domain(d) )
> >          return -EOPNOTSUPP;
> >  
> >      /* Grab a reference to make sure the page doesn't change under our feet */
> 
> Is this (in particular the code following below here) a safe thing to do
> when we don't properly refcount page references from the P2M, yet? It's
> Dom0, yes, but even there I might see potential security implications (as
> top violating privacy of a guest).

I don't think I am following, could you please elaborate more? The
change I am proposing is to allow Dom0 to share its own pages to the
co-processor. DomUs are not in the picture. I would be happy to add
further restriction to that effect. Is there something else you have in
mind?


> Furthermore cleanup_page_mappings() (called later in the function) has a
> PV-only aspect which would apparently need widening to PVH Dom0 then,
> too.

You are referring to:

        if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
            rc = iommu_legacy_unmap(d, _dfn(mfn), 1u << PAGE_ORDER_4K);

is that correct?


> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
> >              rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
> >                                          exch.out.extent_order) ?: rc;
> >  
> > -            if ( !paging_mode_translate(d) &&
> > +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
> >                   __copy_mfn_to_guest_offset(exch.out.extent_start,
> >                                              (i << out_chunk_order) + j,
> >                                              mfn) )
> 
> Wait, no: A PVH domain (Dom0 or not) can't very well make use of MFNs, can
> it?

One way or another Dom0 PVH needs to know the MFN to pass it to the
co-processor.

