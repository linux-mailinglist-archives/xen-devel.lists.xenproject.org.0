Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A954D5CB
	for <lists+xen-devel@lfdr.de>; Thu, 16 Jun 2022 02:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.350351.576658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1d4R-0003QY-LM; Thu, 16 Jun 2022 00:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 350351.576658; Thu, 16 Jun 2022 00:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o1d4R-0003OB-I3; Thu, 16 Jun 2022 00:09:11 +0000
Received: by outflank-mailman (input) for mailman id 350351;
 Thu, 16 Jun 2022 00:09:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hdZ4=WX=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o1d4Q-0003O5-0w
 for xen-devel@lists.xenproject.org; Thu, 16 Jun 2022 00:09:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8aca1a37-ed08-11ec-ab14-113154c10af9;
 Thu, 16 Jun 2022 02:09:08 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCE6DB821FC;
 Thu, 16 Jun 2022 00:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551FAC3411F;
 Thu, 16 Jun 2022 00:09:05 +0000 (UTC)
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
X-Inumbo-ID: 8aca1a37-ed08-11ec-ab14-113154c10af9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655338145;
	bh=jJISYR6NRFQwSY8+RR9lGNRnt7g65v9vRC0lxptbg0c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YIQB3ko9rNTn4jxLzmpHRcocUWHPMbAv8y5LTEMWW0pwzfRAmylxQexP8CU+CD7UR
	 FZJbIYfStAF9QG9PprZVTVS8gqC4L12WHVo2S2PXfC2l73S7XdZvQDEPlf6LTSpZei
	 mU9ujRJzSSq+sE4e1z38CZhmbK9WMPOILzdr+yT2XrLEULyQ7Ve2ostd+3yKX0T0nv
	 Bl0vFma/V0PVKSRc2NLJlkw9TcoH3maE67bBn9FhpncVqFfqT3LCeWW2/xi0MC6Ccd
	 8diAnK/7og7g5GLe3VJHT0Igjf7mRznKdYxZbneRq2jvpu25YsRfU0d97N33c1NNJR
	 wG24CNMMXxzGA==
Date: Wed, 15 Jun 2022 17:09:04 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Jens Wiklander <jens.wiklander@linaro.org>, xen-devel@lists.xenproject.org, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] xen/arm: smccc: add support for SMCCCv1.2 extended
 input/output registers
In-Reply-To: <9c39d8dc-4a74-297c-45fd-4e261fe9ef90@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206151355000.2430546@ubuntu-linux-20-04-desktop>
References: <20220609061812.422130-1-jens.wiklander@linaro.org> <20220609061812.422130-2-jens.wiklander@linaro.org> <alpine.DEB.2.22.394.2206101733020.756493@ubuntu-linux-20-04-desktop> <9c39d8dc-4a74-297c-45fd-4e261fe9ef90@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 15 Jun 2022, Julien Grall wrote:
> On 11/06/2022 01:41, Stefano Stabellini wrote:
> > >   #endif /* __ASSEMBLY__ */
> > >     /*
> > > diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> > > index 676740ef1520..6f90c08a6304 100644
> > > --- a/xen/arch/arm/vsmc.c
> > > +++ b/xen/arch/arm/vsmc.c
> > > @@ -93,7 +93,7 @@ static bool handle_arch(struct cpu_user_regs *regs)
> > >       switch ( fid )
> > >       {
> > >       case ARM_SMCCC_VERSION_FID:
> > > -        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_1);
> > > +        set_user_reg(regs, 0, ARM_SMCCC_VERSION_1_2);
> > >           return true;
> >    This is going to be a problem for ARM32 given that ARM_SMCCC_VERSION_1_2
> > is unimplemented on ARM32. If there is an ARM32 implementation in Linux
> > for ARM_SMCCC_VERSION_1_2 you might as well import it too.
> > 
> > Otherwise we'll have to abstract it away, e.g.:
> > 
> > #ifdef CONFIG_ARM_64
> > #define ARM_VSMCCC_VERSION ARM_SMCCC_VERSION_1_2
> > #else
> > #define ARM_VSMCCC_VERSION ARM_SMCCC_VERSION_1_1
> > #endif
> 
> I don't understand why you want to tie the virtual and host SMCCC version.
> 
> In theory, it would be possible for us to implement a subsystem to fully
> emulate, lets say, FFA. We would to tell the VM that we are v1.2 compliant but
> we would not need the helper as no calls would be forwarded.
> 
> When a 32-bit guest is running on Xen Arm64, we are going to say that SMCCC
> v1.2 will be available. This is not much different from running a 32-bit guest
> on 32-bit hardware.

In a few places (especially platform specific code, such as Xilinx EEMI)
the guest SMC call traps in Xen, then Xen repeats the same SMC call to
the firmware.

I realize this is not a good reason to keep virtual SMCCC 1.1 because
the firmware could support SMCCC 1.0 or older. Some argument conversions
are to be expected.  In reality I have been working with SMCCC 1.1
virtual and SMCCC 1.1 firmware for a long time so the problem didn't
exist, and I didn't really think it through :-)


> So I think we should expose 1.2 unless we think there is a
> problem in the Xen 32-bit specific code.

Yeah, I am OK with that.

