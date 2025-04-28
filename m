Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F10AA9FA1E
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 22:03:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971087.1359584 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Ugl-0002VB-4r; Mon, 28 Apr 2025 20:02:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971087.1359584; Mon, 28 Apr 2025 20:02:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Ugl-0002St-28; Mon, 28 Apr 2025 20:02:51 +0000
Received: by outflank-mailman (input) for mailman id 971087;
 Mon, 28 Apr 2025 20:02:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u4d+=XO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u9Ugk-0002Sn-G6
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 20:02:50 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1710d48-246b-11f0-9ffb-bf95429c2676;
 Mon, 28 Apr 2025 22:02:48 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2E54A5C5799;
 Mon, 28 Apr 2025 20:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E174DC4CEE4;
 Mon, 28 Apr 2025 20:02:44 +0000 (UTC)
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
X-Inumbo-ID: c1710d48-246b-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745870566;
	bh=ituXsXj7h50AOQZhQuN/SH6ienDPrbu4eLUM75uBstw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=TuGCCz2YlsVbZqX9xn0om3ueaI9WfCvtMqC3Gt9+z/6PmMyov22ggB7uRKhK0wNfH
	 7hNaEkaB8lZpQ9qt1KhTduNqctkkPAhRSaO+aFQPgRXuDtqDu6nGkl6sEfiRd6uRYw
	 zYVhTgbii+/BzeqhMm2jaK8+9Kco7TGhCsaL/HDyOCawqtD1X16rOw3U+/PQWDE26e
	 +mtTPquro1yH4mWNCbERSsWx7DwKEMENQgBFi3JhVD3n95zitkTKQOpjBfOgUS5Efw
	 tDVUBvtYoSwE5U/8+0YbaYgSIGBiedbfRtb+Qrg4+s35OSzw8IfiuMN1TgBxoS0nuJ
	 eqTH6eXVCzh/A==
Date: Mon, 28 Apr 2025 13:02:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Teddy Astie <teddy.astie@vates.tech>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>, jason.andryuk@amd.com, 
    agarciav@amd.com
Subject: Re: [PATCH] xen/x86: allow Dom0 PVH to call XENMEM_exchange
In-Reply-To: <f315a128-ce68-42be-9f0c-044ad0c5320c@vates.tech>
Message-ID: <alpine.DEB.2.22.394.2504281300340.785180@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2504251314050.785180@ubuntu-linux-20-04-desktop> <f315a128-ce68-42be-9f0c-044ad0c5320c@vates.tech>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1131418842-1745870495=:785180"
Content-ID: <alpine.DEB.2.22.394.2504281301430.785180@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1131418842-1745870495=:785180
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2504281301431.785180@ubuntu-linux-20-04-desktop>

On Mon, 28 Apr 2025, Teddy Astie wrote:
> Hello Stefano,
> 
> Le 25/04/2025 à 22:21, Stefano Stabellini a écrit :
> > From: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> >
> > Dom0 PVH might need XENMEM_exchange when passing contiguous memory
> > addresses to firmware or co-processors not behind an IOMMU.
> >
> > XENMEM_exchange was blocked for HVM/PVH DomUs, and accidentally it
> > impacted Dom0 PVH as well.
> >
> > Permit Dom0 PVH to call XENMEM_exchange while leaving it blocked for
> > HVM/PVH DomUs.
> >
> 
> In addition to Jan's remarks, I think it wants some additional
> clarifications on the hypercall interface. public/memory.h indicates
> "only PV guests can use this operation", so the interface is actually
> unspecified about HVM guests (e.g what are MFN/GMFN in this case ?).

That is a new addition from c08a11ab98c. If you see fae7d5be8bb, there
is a statement that "we permitted this operation".


> > Signed-off-by: Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> >
> > diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> > index 1cf2365167..e995944333 100644
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -4401,7 +4401,7 @@ int steal_page(
> >       const struct domain *owner;
> >       int rc;
> >
> > -    if ( paging_mode_external(d) )
> > +    if ( paging_mode_external(d) && !is_hardware_domain(d) )
> >           return -EOPNOTSUPP;
> >
> >       /* Grab a reference to make sure the page doesn't change under our feet */
> > diff --git a/xen/common/memory.c b/xen/common/memory.c
> > index 8ca4e1a842..796eec081b 100644
> > --- a/xen/common/memory.c
> > +++ b/xen/common/memory.c
> > @@ -794,7 +794,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
> >               rc = guest_physmap_add_page(d, _gfn(gpfn), mfn,
> >                                           exch.out.extent_order) ?: rc;
> >
> > -            if ( !paging_mode_translate(d) &&
> > +            if ( (!paging_mode_translate(d) || is_hardware_domain(d)) &&
> >                    __copy_mfn_to_guest_offset(exch.out.extent_start,
> >                                               (i << out_chunk_order) + j,
> >                                               mfn) )
--8323329-1131418842-1745870495=:785180--

