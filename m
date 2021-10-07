Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B377F425DB2
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 22:38:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204000.359192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYa9G-00021o-0e; Thu, 07 Oct 2021 20:37:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204000.359192; Thu, 07 Oct 2021 20:37:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYa9F-0001zy-Tc; Thu, 07 Oct 2021 20:37:49 +0000
Received: by outflank-mailman (input) for mailman id 204000;
 Thu, 07 Oct 2021 20:37:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYa9E-0001zs-Gg
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 20:37:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a90b1bd-0add-4bb7-8393-b59f181f01cd;
 Thu, 07 Oct 2021 20:37:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 975386101A;
 Thu,  7 Oct 2021 20:37:46 +0000 (UTC)
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
X-Inumbo-ID: 1a90b1bd-0add-4bb7-8393-b59f181f01cd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633639066;
	bh=EzxjQmub+Cy2Zb/325VconhPfMxBJBKClTF6dAA5Xe4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NcmZCYGrI9pOb29SWhQEQ5CnL854rD59vX3erffRoJqkIaB81HDrwd8f9kjx/g2Qe
	 QvY6LzMcH9XcMq0LGn8jZsoAVKJn597W3VaM2VjnWpJcXTcHcBudUi/9apYlJTT1t7
	 SA/MEuQViuntpIuSy51jaAshRyOpMmCuC4qG5NQDGUJBqT6FN4kAvWLx3VfhoQnrrK
	 UbSHx8jXiOOUhbwUDJCwpGngBWnXIo3u/dMGM38Eu/0rvydEsBtcmcH0KWCgaIWmVR
	 V9iSVj3OP6KQ+orJ/F5Zu/xW/QdmmU2kyESfNLk1RZGyift/MBlbD4Cl90q6lBumeg
	 LnQCqZ0sjJBUA==
Date: Thu, 7 Oct 2021 13:37:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Ian Jackson <iwj@xenproject.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V5 2/3] libxl/arm: Add handling of extended regions for
 DomU
In-Reply-To: <24926.53922.628049.481827@mariner.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2110071329380.414@sstabellini-ThinkPad-T480s>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com> <1633519346-3686-3-git-send-email-olekstysh@gmail.com> <24925.35278.762786.539238@mariner.uk.xensource.com> <224ed316-aac0-3ad4-22a1-efc592e717e2@gmail.com> <alpine.DEB.2.21.2110061658450.3209@sstabellini-ThinkPad-T480s>
 <24926.53922.628049.481827@mariner.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 7 Oct 2021, Ian Jackson wrote:
> Stefano Stabellini writes ("Re: [PATCH V5 2/3] libxl/arm: Add handling of extended regions for DomU"):
> > On Wed, 6 Oct 2021, Oleksandr wrote:
> > > On 06.10.21 14:34, Ian Jackson wrote:
> > > > Oleksandr Tyshchenko writes ("[PATCH V5 2/3] libxl/arm: Add handling of
> > > > extended regions for DomU"):
> > > > > The extended region (safe range) is a region of guest physical
> > > > > address space which is unused and could be safely used to create
> > > > > grant/foreign mappings instead of wasting real RAM pages from
> > > > > the domain memory for establishing these mappings.
> > > > Please forgive me for asking this question now, but: why is this
> > > > ARM-specific ?
> > > 
> > > 
> > > Sorry, I can't say for sure which x86 mode also suffers from
> > > that. I might be wrong, but as I understand that x86 in PVH (and
> > > HVM?) mode uses unpopulated memory ranges (which are unused from
> > > Linux PoV, actually everything not yet allocated or reserved from
> > > "iomem_resource") to create foreign/grant mappings.  So the real
> > > RAM pages are not ballooned out to get an physical address space
> > > to create these mappings. The problem is that we cannot follow
> > > Linux advise which memory ranges are unused on Arm for several
> > > reasons, this is why this patch series makes the hypervisor to
> > > start allocating and exposing these ranges.
> 
> So it sounds like you are saying this is an ARM-specific problem ?
> The key being the "several reasons" which you mention.  Are they
> ARM-specifc problems.
> 
> > Two more things about this being ARM-specific.
> > 
> > Even if x86 was affected exactly by the same problem, the code to expose
> > the safe memory ranges to DomU is arch-specific (currently device tree.)
> > 
> > Also the code to calculate the safe memory ranges is arch-specific as it
> > depends on the DomU memory layout which is arch-specific.
> 
> This demonstrates that the implementation is arch-specific.  But one
> of libxl's functions is to abstract away implementation details and
> provide an interface that can be used to "do the right thing".

That's fair enough, I understand your question a bit better now.

I am not certain whether x86 has the same issue. But if it does, I am
pretty sure both the strategy to address the problem and the code would
be very different. At the moment, I cannot imagine how we could share
anything in this patch with x86, especially given the difference in
firmware interfaces (ACPI vs DT).

But I could see a theoretical third architecture (RISC-V?) with device
tree support potentially making use of make_hypervisor_node. But then at
the libxl API I don't imagine the API would look different or would need
to change.

