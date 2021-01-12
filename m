Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6732F3BB3
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 22:05:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66027.117086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzQqf-0006Fg-TT; Tue, 12 Jan 2021 21:05:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66027.117086; Tue, 12 Jan 2021 21:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzQqf-0006FG-QD; Tue, 12 Jan 2021 21:05:05 +0000
Received: by outflank-mailman (input) for mailman id 66027;
 Tue, 12 Jan 2021 21:05:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmZ/=GP=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kzQqd-0006FB-Tt
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 21:05:03 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1536a24-7d6f-42bf-b59d-bd707f85e2dc;
 Tue, 12 Jan 2021 21:05:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9AB123123;
 Tue, 12 Jan 2021 21:05:01 +0000 (UTC)
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
X-Inumbo-ID: a1536a24-7d6f-42bf-b59d-bd707f85e2dc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610485502;
	bh=pUU8IdWxHSRD+fGNC/vN0cu6nbDl4KbNhhQB0y/kF5s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CFAWKnTBhE/X/Cb0boZpl6RQ0pr6x1wLHQ6aBu/W9wrf3bzs22n7lGqa45IrToASp
	 +eEdkIQ9hCQbsRfQ9T7DR1As3Oi6aeS3STcGUBFSSWkgaaEczulMuTca1yzVyeQ/l+
	 p569qJtbpWoY1fdVkRHDuSXrTkdrmB+pEWgPbj3p7dma/bKAOVIIogtczrtM+Trozn
	 oRWwNkY6zKmwtYaK3MlIGhAoSxCkHS9hvOE7dlCqtdtCMMBydiozDUKgcxMlqor0rM
	 tclSFcwdDeJnm98sV9Vq5LxfEQe3itAR9fou1zjqlnERZUpBm2CYTOyIsMIwGtxLgm
	 hnN7ZRYOYgZpA==
Date: Tue, 12 Jan 2021 13:05:01 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien.grall.oss@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH] xen/arm: don't read aarch32 regs when aarch32 isn't
 available
In-Reply-To: <CAJ=z9a208m_NvxgjP=9Eyr6PsJZm3DPy6BKvM1x1oZP=Ftg-ZQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.2101121252490.2495@sstabellini-ThinkPad-T480s>
References: <20210112001623.28421-1-sstabellini@kernel.org> <db6949f1-6b19-b1bb-9bec-8b56a2ad83a1@xen.org> <alpine.DEB.2.21.2101121015100.2495@sstabellini-ThinkPad-T480s> <CAJ=z9a208m_NvxgjP=9Eyr6PsJZm3DPy6BKvM1x1oZP=Ftg-ZQ@mail.gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 12 Jan 2021, Julien Grall wrote:
> On Tue, 12 Jan 2021 at 19:09, Stefano Stabellini <sstabellini@kernel.org> wrote:
> >
> > On Tue, 12 Jan 2021, Julien Grall wrote:
> > > > +    aarch32 = c->pfr64.el1 == 2;
> > >
> > > This is checking that AArch32 is available in EL1. However, it may not be the
> > > case yet it would be available in EL0.
> > >
> > > As a consequence, 32-bit userspace wouldn't work properly after this patch.
> > >
> > > The Arm Arm mandates that if AArch32 is available at EL(n), then it must be
> > > available at EL(n - 1).
> > >
> > > So we should check that AArch32 is available at EL0 because this would
> > > cover the case where AArch32 is enabled at EL1.
> >
> > OK
> >
> >
> > > Furthermore, I would also like to avoid hardcoding value in the code as it is
> > > less readable. We already define cpu_has_el0_32 which use the boot CPU
> > > feature. Maybe we want to expand the macro or split it?
> >
> > I agree
> >
> > Technically, cpu_has_el0_32 works as is, because it is called after
> > boot_cpu_data has been updated. So we could just use it. What do you
> > think?
> 
> I thought about that when I wrote the first e-mail. However, this
> would not work properly for heterogeneous platforms.
> There is still a risk to read garbage (or UNDEF) if the boot CPU
> supports AArch32 but the others.

Yeah, but that is not the kind of thing that can be actually different
in a heterogeneous platform, as far as I am aware?

In any case, a check that takes that into consideraion would be:

    aarch32_el0 = cpu_has_el0_32 &&
                  (boot_cpu_feature64(el0) == cpu_feature64(c, el0));

If you have something better in mind please feel free to suggest it and
I'll add it to the patch. Otherwise, I'll send it with this later today
with a note that if you want to make a change on commit you have my
blessing :-)

