Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94822A7855C
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 01:51:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934979.1336517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzlNo-0000V0-0T; Tue, 01 Apr 2025 23:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934979.1336517; Tue, 01 Apr 2025 23:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzlNn-0000T5-U5; Tue, 01 Apr 2025 23:51:03 +0000
Received: by outflank-mailman (input) for mailman id 934979;
 Tue, 01 Apr 2025 23:51:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p4cc=WT=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tzlNm-0000QM-Cs
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 23:51:02 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2992d128-0f54-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 01:51:00 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 74B87A41712;
 Tue,  1 Apr 2025 23:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B8FC4CEE4;
 Tue,  1 Apr 2025 23:50:57 +0000 (UTC)
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
X-Inumbo-ID: 2992d128-0f54-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743551459;
	bh=MyoYIGMJ4pQJ4sDHjS7J1+l6z+LyNDtoYmiWxCj1zac=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=SD/rmbGdSArZlsrwYPEFe+gAbJvLX0Ht2Zzn+P+mLF3zI3xt1JLaFfEiRYUto8pDd
	 jeicG10QeeT9+GOO2kUpLukJPPSFwTh/gZbj3fvWdRmDANLrHBl66qLQ+8hYfLPJoB
	 uu9dTwyjHiAzQ7NGiFTxSI8W2NAqPQTwSH8xHwub4qChOwIPDTXnDf+LgFC7j+Jm3I
	 DFWqkUANWu8/RtQ6ZCq9pGNiezt9iSSSROfl7cmgT792CiJV1uDO8hD4qptFA7G17c
	 TnogyGjJ54W05Au1nTa5L8p1PyYExBwfFYAFqr/qw3LbGyjhvdezsMYtmd3RmMPdFG
	 z6QfWY6rJBPTQ==
Date: Tue, 1 Apr 2025 16:50:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 4/6] xen/arm: dom0less seed xenstore grant table
 entry
In-Reply-To: <3d800459-7762-427e-8765-044adbb6459e@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504011648360.3098208@ubuntu-linux-20-04-desktop>
References: <20250331214321.205331-1-jason.andryuk@amd.com> <20250331214321.205331-5-jason.andryuk@amd.com> <6765d129-66dc-48d9-aaac-2b973edfda80@suse.com> <3d800459-7762-427e-8765-044adbb6459e@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 1 Apr 2025, Jason Andryuk wrote:
> On 2025-04-01 08:16, Jan Beulich wrote:
> > On 31.03.2025 23:43, Jason Andryuk wrote:
> 
> > > --- a/xen/arch/arm/dom0less-build.c
> > > +++ b/xen/arch/arm/dom0less-build.c
> > > @@ -865,6 +865,10 @@ static void __init initialize_domU_xenstore(void)
> > >           rc = alloc_xenstore_evtchn(d);
> > >           if ( rc < 0 )
> > >               panic("%pd: Failed to allocate xenstore_evtchn\n", d);
> > > +
> > > +        if ( gfn != ~0ULL )
> > 
> > Is this an odd open-coding of INVALID_GFN? And even if not - why ULL when
> > "gfn" is unsigned long? The way you have it the condition will always be
> > false on Arm32, if I'm not mistaken.
> 
> The gfn is pulled out of the HVM_PARAMS, which is a uint64_t.  It is set like:
> 
> d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
> 
> But pulled out by:
> 
> unsigned long gfn = d->arch.hvm.params[HVM_PARAM_STORE_PFN];
> 
> So your comment highlights that unsigned long is incorrect for ARM32.
> 
> While I realize fixed types are discouraged, I'd prefer to use uint64_t for
> the replacement.  That is the type of HVM_PARAMS, and uint64_t is used on the
> init-dom0less side as well.  Using unsigned long long to get a 64bit value on
> ARM32 seems less clear to me.

The types that correspond to hypercall struct field types should match
the hypercall struct field types.

I think gfn should be uint64_t to match the definition of params.

Similarly among the arguments of gnttab_seed_entry, flags should be
uint16_t and I think frame should be uint32_t. This last one I am
confused why you defined it as uint64_t, maybe I am missing something.

