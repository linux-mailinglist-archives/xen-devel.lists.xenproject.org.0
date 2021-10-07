Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E1D424AD3
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 02:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203213.358287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYGq2-0003Z4-Dt; Thu, 07 Oct 2021 00:00:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203213.358287; Thu, 07 Oct 2021 00:00:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYGq2-0003WA-Av; Thu, 07 Oct 2021 00:00:42 +0000
Received: by outflank-mailman (input) for mailman id 203213;
 Thu, 07 Oct 2021 00:00:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ti8Z=O3=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mYGq0-0003W4-A1
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 00:00:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9b0efb76-2701-11ec-bfb3-12813bfff9fa;
 Thu, 07 Oct 2021 00:00:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7801760F4F;
 Thu,  7 Oct 2021 00:00:38 +0000 (UTC)
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
X-Inumbo-ID: 9b0efb76-2701-11ec-bfb3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633564838;
	bh=yVGEzD0QnY/sQb3XYij716BX+NvfF0pRX14TBpkDD9Y=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HzYV6O8hbB0PP5yABf02BveurvH6T8n4FpoTgz+tYqznYjkFa4Dz0vftONKPl/R3M
	 N8gNrYHC/OvVNuVrACRUD7si00d1KoApWPeMMRPTiDso8uZGIMHb/wwx9MFQGBvELr
	 fWl6HtjqHCZZ7jGyZ+mSmycmqmOM6zb9Qv1hHbxsTeO3hMoDtDFlo/rp/JPYGknBO5
	 bWhmO7FJc/+cNvxZJ1yzUDVOWNUZpw2ZBBoPblLclFpajCgv9leIvg9bkEEQzKPtq4
	 /NuAzfeAjsb+OrS5M2wGmB05aUr8QwgOBG2MEEd1dz50q6L5s9rdZyiZuoQVb3vyHj
	 VRU9lopQ/a1zQ==
Date: Wed, 6 Oct 2021 17:00:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr <olekstysh@gmail.com>
cc: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Wei Liu <wl@xen.org>, 
    Anthony PERARD <anthony.perard@citrix.com>, 
    Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V5 2/3] libxl/arm: Add handling of extended regions for
 DomU
In-Reply-To: <224ed316-aac0-3ad4-22a1-efc592e717e2@gmail.com>
Message-ID: <alpine.DEB.2.21.2110061658450.3209@sstabellini-ThinkPad-T480s>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com> <1633519346-3686-3-git-send-email-olekstysh@gmail.com> <24925.35278.762786.539238@mariner.uk.xensource.com> <224ed316-aac0-3ad4-22a1-efc592e717e2@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 6 Oct 2021, Oleksandr wrote:
> On 06.10.21 14:34, Ian Jackson wrote:
> 
> Hi Ian
> 
> > Oleksandr Tyshchenko writes ("[PATCH V5 2/3] libxl/arm: Add handling of
> > extended regions for DomU"):
> > > The extended region (safe range) is a region of guest physical
> > > address space which is unused and could be safely used to create
> > > grant/foreign mappings instead of wasting real RAM pages from
> > > the domain memory for establishing these mappings.
> > Please forgive me for asking this question now, but: why is this
> > ARM-specific ?
> 
> 
> Sorry, I can't say for sure which x86 mode also suffers from that. I might be
> wrong, but as I understand that x86 in PVH (and HVM?) mode uses unpopulated
> memory ranges (which are unused from Linux PoV, actually everything not yet
> allocated or reserved from "iomem_resource") to create foreign/grant mappings.
> So the real RAM pages are not ballooned out to get an physical address space
> to create these mappings. The problem is that we cannot follow Linux advise
> which memory ranges are unused on Arm for several reasons, this is why this
> patch series makes the hypervisor to start allocating and exposing these
> ranges.

Two more things about this being ARM-specific.

Even if x86 was affected exactly by the same problem, the code to expose
the safe memory ranges to DomU is arch-specific (currently device tree.)

Also the code to calculate the safe memory ranges is arch-specific as it
depends on the DomU memory layout which is arch-specific.

