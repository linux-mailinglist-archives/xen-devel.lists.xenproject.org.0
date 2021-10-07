Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E920425197
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 12:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203476.358608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYR5t-00021V-I9; Thu, 07 Oct 2021 10:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203476.358608; Thu, 07 Oct 2021 10:57:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYR5t-0001z6-FB; Thu, 07 Oct 2021 10:57:45 +0000
Received: by outflank-mailman (input) for mailman id 203476;
 Thu, 07 Oct 2021 10:57:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mYR5s-0001z0-A0
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 10:57:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mYR5s-00018k-5s
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 10:57:44 +0000
Received: from iwj (helo=mariner.uk.xensource.com)
 by xenbits.xenproject.org with local-bsmtp (Exim 4.92)
 (envelope-from <iwj@xenproject.org>) id 1mYR5s-00041B-4s
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 10:57:44 +0000
Received: from iwj by mariner.uk.xensource.com with local (Exim 4.89)
 (envelope-from <iwj@xenproject.org>)
 id 1mYR5m-0006CA-Vc; Thu, 07 Oct 2021 11:57:38 +0100
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=xenproject.org; s=20200302mail; h=References:In-Reply-To:Subject:Cc:To:Date
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:From;
	bh=prGYN0ziHtbQ/xbBVY+4Jucrl7ufzTOwijogI2BxJ2E=; b=4iQv3PE4c9S2NUrKaUkDLFXQ7s
	SebsS3SSFMTHTs3dWTbOkum5DBvrG9Qh2c83mfILIVyqCjJVamW3H1TqDRLvcQzB41eek2Qn0bVys
	p+pRXQmXo+X52UokBbsHXRG7p/gCN/pL6TDEljtKX2L9KqpbKI20IHiqhtznV1sJ5r9k=;
From: Ian Jackson <iwj@xenproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <24926.53922.628049.481827@mariner.uk.xensource.com>
Date: Thu, 7 Oct 2021 11:57:38 +0100
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr <olekstysh@gmail.com>,
    xen-devel@lists.xenproject.org,
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
    Wei Liu <wl@xen.org>,
    Anthony PERARD <anthony.perard@citrix.com>,
    Juergen Gross <jgross@suse.com>,
    Julien Grall <julien@xen.org>,
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH V5 2/3] libxl/arm: Add handling of extended regions for
 DomU
In-Reply-To: <alpine.DEB.2.21.2110061658450.3209@sstabellini-ThinkPad-T480s>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
	<1633519346-3686-3-git-send-email-olekstysh@gmail.com>
	<24925.35278.762786.539238@mariner.uk.xensource.com>
	<224ed316-aac0-3ad4-22a1-efc592e717e2@gmail.com>
	<alpine.DEB.2.21.2110061658450.3209@sstabellini-ThinkPad-T480s>
X-Mailer: VM 8.2.0b under 24.5.1 (i686-pc-linux-gnu)

Stefano Stabellini writes ("Re: [PATCH V5 2/3] libxl/arm: Add handling of extended regions for DomU"):
> On Wed, 6 Oct 2021, Oleksandr wrote:
> > On 06.10.21 14:34, Ian Jackson wrote:
> > > Oleksandr Tyshchenko writes ("[PATCH V5 2/3] libxl/arm: Add handling of
> > > extended regions for DomU"):
> > > > The extended region (safe range) is a region of guest physical
> > > > address space which is unused and could be safely used to create
> > > > grant/foreign mappings instead of wasting real RAM pages from
> > > > the domain memory for establishing these mappings.
> > > Please forgive me for asking this question now, but: why is this
> > > ARM-specific ?
> > 
> > 
> > Sorry, I can't say for sure which x86 mode also suffers from
> > that. I might be wrong, but as I understand that x86 in PVH (and
> > HVM?) mode uses unpopulated memory ranges (which are unused from
> > Linux PoV, actually everything not yet allocated or reserved from
> > "iomem_resource") to create foreign/grant mappings.  So the real
> > RAM pages are not ballooned out to get an physical address space
> > to create these mappings. The problem is that we cannot follow
> > Linux advise which memory ranges are unused on Arm for several
> > reasons, this is why this patch series makes the hypervisor to
> > start allocating and exposing these ranges.

So it sounds like you are saying this is an ARM-specific problem ?
The key being the "several reasons" which you mention.  Are they
ARM-specifc problems.

> Two more things about this being ARM-specific.
> 
> Even if x86 was affected exactly by the same problem, the code to expose
> the safe memory ranges to DomU is arch-specific (currently device tree.)
> 
> Also the code to calculate the safe memory ranges is arch-specific as it
> depends on the DomU memory layout which is arch-specific.

This demonstrates that the implementation is arch-specific.  But one
of libxl's functions is to abstract away implementation details and
provide an interface that can be used to "do the right thing".

Ian.

