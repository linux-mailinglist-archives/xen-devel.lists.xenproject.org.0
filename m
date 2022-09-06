Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B905AE0E7
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 09:22:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399494.640681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSuX-0002u7-Nr; Tue, 06 Sep 2022 07:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399494.640681; Tue, 06 Sep 2022 07:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVSuX-0002rS-Kf; Tue, 06 Sep 2022 07:22:17 +0000
Received: by outflank-mailman (input) for mailman id 399494;
 Tue, 06 Sep 2022 07:22:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LBF+=ZJ=kernel.org=ardb@srs-se1.protection.inumbo.net>)
 id 1oVSuX-0002rM-5R
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 07:22:17 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0f48a7d-2db4-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 09:22:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 31AD0B815CB
 for <xen-devel@lists.xenproject.org>; Tue,  6 Sep 2022 07:22:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03544C433B5
 for <xen-devel@lists.xenproject.org>; Tue,  6 Sep 2022 07:22:13 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id k10so1405483lfm.4
 for <xen-devel@lists.xenproject.org>; Tue, 06 Sep 2022 00:22:13 -0700 (PDT)
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
X-Inumbo-ID: a0f48a7d-2db4-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662448934;
	bh=ygOQGBtlFCqHqPt/P+/9h0MUZOQeKdGeco5BlIVAnpA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SmgQzSwjdq2BLIb+qtbFPNvFWpxxYp8Ea7hyxaHK/jAtegjgTVPi/2U/YQ7VStDet
	 7QjxEYBuIQ4J2baYe27ZKAZhqQ0OBbOZk4aRhWC4q/FoLoegQlD4HdkSBF6bURnb1U
	 s7DO8TmmhyrlsdNeTSuK/E+qhTlrC+bj3I+lBB0oi8Bh1bDIFhix3raJvl8/rf9O7m
	 gSicIOR1oSD9XFKGK+S0rBE2aVFbc/OQeOw3oINlKBBN1K0avlxM2cp7j0jcQB5p5s
	 USR7hjc2qZ28DIdJfueavTi/PfxtDQdZyzJt7M4s65cXGUaFYAM6u+S36D/WAMMJwe
	 DISpPFqi4N+2g==
X-Gm-Message-State: ACgBeo1VDQpEILJRaPXKvjCNX1Pdw1QYfdRytlLnbBt/QG1BpIvsaov1
	CpPlpYfQSDadKwtqDGIwx0lzs9ZF4pDkCBYkAjw=
X-Google-Smtp-Source: AA6agR7cDgv/uHpVBjdw468KjkaT3EcxbQ+S7TkYr+OVzhmCESoGFKZdbR03xDPw0e4K7chcQG4tXJ+Gat6BxIr/yhg=
X-Received: by 2002:a05:6512:13a1:b0:48d:f14:9059 with SMTP id
 p33-20020a05651213a100b0048d0f149059mr19693452lfa.110.1662448931991; Tue, 06
 Sep 2022 00:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <Yv5fii2GvIeHEHZX@leoy-yangtze.lan> <CAMj1kXGZ0ThmPT2FU4M07waB=Q9tXxs81TGTysV5dG5fm0D0Gw@mail.gmail.com>
 <871qtcsacd.wl-maz@kernel.org> <Ywcr1849LiEHezd3@leoy-huanghe>
 <12a8c169-55aa-5e9f-19f8-acd77ea2a8fe@xen.org> <YwdiDr2uLXGEl2TC@leoy-huanghe>
 <52f24132-ba2b-d4ab-ebd0-613f673b5658@xen.org> <YweJ6ZpRhMkT5bab@leoy-yangtze.lan>
 <CALZQ+UN8cQ4avggxqgjed=DsitfEteQpuhEqb+p747vmeFCyUA@mail.gmail.com>
 <87r10puiey.wl-maz@kernel.org> <Yxbz+pOs5+1RkEkx@leoy-huanghe.lan>
In-Reply-To: <Yxbz+pOs5+1RkEkx@leoy-huanghe.lan>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 6 Sep 2022 09:22:00 +0200
X-Gmail-Original-Message-ID: <CAMj1kXFv2AhngPrrE2GWE3fxsL3pd0x8DSzUn-VQL-RrQhXjtw@mail.gmail.com>
Message-ID: <CAMj1kXFv2AhngPrrE2GWE3fxsL3pd0x8DSzUn-VQL-RrQhXjtw@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: acpi: Support memory reserve configuration table
To: Leo Yan <leo.yan@linaro.org>
Cc: Marc Zyngier <maz@kernel.org>, Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, Rahul Singh <Rahul.Singh@arm.com>, 
	Peter Griffin <peter.griffin@linaro.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Julien Grall <jgrall@amazon.com>, Mathieu Poirier <mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Sept 2022 at 09:17, Leo Yan <leo.yan@linaro.org> wrote:
>
> Hi Marc,
>
> On Tue, Sep 06, 2022 at 07:27:17AM +0100, Marc Zyngier wrote:
> > On Tue, 06 Sep 2022 03:52:37 +0100,
> > Leo Yan <leo.yan@linaro.org> wrote:
> > >
> > > On Thu, Aug 25, 2022 at 10:40:41PM +0800, Leo Yan wrote:
> > >
> > > [...]
> > >
> > > > > > But here I still cannot create the concept that how GIC RD tables play
> > > > > > roles to support the para virtualization or passthrough mode.
> > > > >
> > > > > I am not sure what you are actually asking. The pending tables are just
> > > > > memory you give to the GICv3 to record the state of the interrupts.
> > > >
> > > > For more specific, Xen has its own RD pending table, and we can use
> > > > this pending table to set state for SGI/PPI/LPI for a specific CPU
> > > > interface.  Xen works as hypervisor, it saves and restores the pending
> > > > table according to switched in VM context, right?
> > > >
> > > > On the other hand, what's the purpose for Linux kernel's GIC RD
> > > > pending table?  Is it only used for nested virtulisation?  I mean if
> > > > Linux kernel's GIC RD pending table is not used for the drivers in
> > > > Dom0 or DomU, then it's useless to pass it from the primary kernel to
> > > > secondary kernel; as result, we don't need to reserve the persistent
> > > > memory for the pending table in this case.
> > >
> > > I don't receive further confirmation from Marc, anyway, I tried to cook
> > > a kernel patch to mute the kernel oops [1].
> >
> > What sort of confirmation do you expect from me? None of what you
> > write above make much sense in the face of the architecture.
>
> Okay, I think have two questions for you:
>
> - The first question is if we really need to reserve persistent memory
>   for RD pending table and configuration table when Linux kernel runs
>   in Xen domain?
>
> - If the first question's answer is no, so it's not necessary to reserve
>   RD pending table and configuration table for Xen, then what's the good
>   way to dismiss the kernel oops?
>
> IIUC, you consider the general flow from architecture view, so you prefer
> to ask Xen to implement EFI stub to comply the general flow for EFI
> booting sequence, right?
>
> If the conclusion is to change Xen for support EFI stub, then this
> would be fine for me and I will hold on and leave Xen developers to work
> on it.
>

As I mentioned before, proper EFI boot support in Xen would be nice.
*However*, I don't think it makes sense to go through all the trouble
of implementing that just to shut up a warning that doesn't affect Xen
to begin with.


> > > [1] https://lore.kernel.org/lkml/20220906024040.503764-1-leo.yan@linaro.org/T/#u
> >
> > I'm totally baffled by the fact you're trying to add some extra hacks
> > to Linux just to paper over some of the Xen's own issues.
>
> I have a last question for why kernel reserves RD pending table and
> configuration table for kexec.  As we know, the primary kernel and
> the secondary kernel use separate memory regions,

This is only true for kdump, not for kexec in general.

> this means there have
> no race condition that secondary kernel modifies the tables whilist the
> GIC accesses the table if the secondary kernel allocates new pages for
> RD tables.  So only one potential issue I can image is the secondary
> kernel sets new RD pending table and configuration table, which might
> introduce inconsistent issue with rest RDs in the system.
>
> Could you confirm if my understanding is correct or not?
>
> Sorry for noise and many questions.  I understand this is a complex
> and difficult topic for me, and it's very likely that I am absent
> sufficient knowledge for this part, this is just what I want to
> learn from the discussion and from you :-)
>
> Thanks,
> Leo

