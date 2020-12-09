Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B72D48BA
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 19:16:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48619.85992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn40s-0001F7-FK; Wed, 09 Dec 2020 18:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48619.85992; Wed, 09 Dec 2020 18:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn40s-0001Ei-C6; Wed, 09 Dec 2020 18:16:30 +0000
Received: by outflank-mailman (input) for mailman id 48619;
 Wed, 09 Dec 2020 18:16:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/xMB=FN=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kn40q-0001Ec-Bb
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 18:16:28 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a22cde7-f0db-402b-8b92-3cb1c385b917;
 Wed, 09 Dec 2020 18:16:27 +0000 (UTC)
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
X-Inumbo-ID: 4a22cde7-f0db-402b-8b92-3cb1c385b917
Date: Wed, 9 Dec 2020 10:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607537786;
	bh=Av76fKJ5U2Hr4LGBXl1FsH9tWYcREJgon6dpLFNEaBw=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=Gzbd+ktynE3Oe57Ll+KPmCe9hKQbz782OLThp8nCVuQTbAfB3VLfFsClPYwmgSxCS
	 Ow2b+eNiiX85obVL8up1IWXuT0QNdws+Q9F6OskbFQ96oMeLkRv1akL3ruUTZKo4/W
	 Ri19uE0XHYNWbDGViFNgEBvFjDO6wChsouSIytx/r8GBpcuXqCcW8S3vboLmYoWdgh
	 xZubh4EujkoCVNTKLhEioGJv0tHULIrXGNuvzdXIlUD0Wrq7PXDPw20CqMGgFftamJ
	 0ig29cAMsAgsOakxEPVI6SCf1dgnqAyUymgQCsiBjTqSAs+etQgvjAr6LbREE1Ufew
	 NFVoBjHZYmilg==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Michal Orzel <michal.orzel@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Wei Chen <Wei.Chen@arm.com>
Subject: Re: [PATCH] xen/arm: Add workaround for Cortex-A53 erratum #845719
In-Reply-To: <e974547f-ddf2-a7d1-43a1-cdc81c874823@arm.com>
Message-ID: <alpine.DEB.2.21.2012091015540.20986@sstabellini-ThinkPad-T480s>
References: <20201208072327.11890-1-michal.orzel@arm.com> <d286241c-fd3b-8506-37e5-0ddcdaae97be@xen.org> <5D1B5771-A6B3-4F5E-81A1-864DBC8787B4@arm.com> <bf45e0f4-2de7-d1db-4732-342937bf61e7@xen.org> <alpine.DEB.2.21.2012081730020.20986@sstabellini-ThinkPad-T480s>
 <e974547f-ddf2-a7d1-43a1-cdc81c874823@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Dec 2020, Michal Orzel wrote:
> On 09.12.2020 02:34, Stefano Stabellini wrote:
> > On Tue, 8 Dec 2020, Julien Grall wrote:
> >> On 08/12/2020 14:38, Bertrand Marquis wrote:
> >>> Hi Julien,
> >>>
> >>>> On 8 Dec 2020, at 09:47, Julien Grall <julien@xen.org> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 08/12/2020 07:23, Michal Orzel wrote:
> >>>>> When executing in aarch32 state at EL0, a load at EL0 from a
> >>>>> virtual address that matches the bottom 32 bits of the virtual address
> >>>>> used by a recent load at (aarch64) EL1 might return incorrect data.
> >>>>> The workaround is to insert a write of the contextidr_el1 register
> >>>>> on exception return to an aarch32 guest.
> >>>>
> >>>> I am a bit confused with this comment. In the previous paragraph, you are
> >>>> suggesting that the problem is an interaction between EL1 AArch64 and EL0
> >>>> AArch32. But here you seem to imply the issue only happen when running a
> >>>> AArch32 guest.
> >>>>
> >>>> Can you clarify it?
> >>>
> >>> This can happen when switching from an aarch64 guest to an aarch32 guest so
> >>> not only when there is interaction.
> > 
> > Just to confirm: it cannot happen when switching from aarch64 *EL2* to
> > aarch32 EL0/1, right?  Because that happens all the time in Xen.
> > 
> > 
> No it cannot. It can only happen when switching from aarch64 EL1 to aarch32 EL0.

Excellent, thanks for checking


> >> Right, but the context switch will write to CONTEXTIDR_EL1. So this case
> >> should already be handled.
> >>
> >> Xen will never switch from AArch64 EL1 to AArch32 EL0 without a context switch
> >> (the inverse can happen if we inject an exception to the guest).
> >>
> >> Reading the Cortex-A53 SDEN, it sounds like this is an OS and not Hypervisor
> >> problem. In fact, Linux only seems to workaround it when switching in the OS
> >> side rather than the hypervisor.
> >>
> >> Therefore, I am not sure to understand why we need to workaroud it in Xen.
> > 
> > It looks like Julien is right in regards to the "aarch64 EL1 to aarch32
> > EL0" issue.
> > 
> Yes I agree. I missed the fact that there is a write to CONTEXTIDR_EL1
> in 'ctxt_switch_to'. Let's abandon this.

Job done :-)

