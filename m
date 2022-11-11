Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCC06262AB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 21:16:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442698.697121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otaQi-0002Ya-4J; Fri, 11 Nov 2022 20:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442698.697121; Fri, 11 Nov 2022 20:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otaQi-0002VY-0Q; Fri, 11 Nov 2022 20:15:12 +0000
Received: by outflank-mailman (input) for mailman id 442698;
 Fri, 11 Nov 2022 20:15:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JraP=3L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1otaQg-0002VS-Av
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 20:15:10 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 899172d0-61fd-11ed-91b6-6bf2151ebd3b;
 Fri, 11 Nov 2022 21:15:08 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 582CFB8260C;
 Fri, 11 Nov 2022 20:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09FFEC433D6;
 Fri, 11 Nov 2022 20:15:04 +0000 (UTC)
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
X-Inumbo-ID: 899172d0-61fd-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668197706;
	bh=bR2dMVzmjdvM7WFCh+o1y8snkL418ulaASAYMDx2CdA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Y4cpybX5zBOQRwHfLN610OFoJKDhmt7V4YpdsSMuWNf2812mqsBtACyBACI0LMU+E
	 efvhu/ZARAGxiyQ9saQhMKwX1IMdhTa3SB+EO3OV1ss9m8u7QK7rfgvBvrK2u9YSU3
	 lfXzRQJ0VOodswRYCWAmzYDYRjTd1iZONYM0YLxFrH6eMfV5sM+PHwT+34UgaJ7Hjj
	 EqM/AuDpHa/QApckfhEufeN5fytTKuLLN8n9ZLLoRJaPagZKVYbc5muH6f6xArFSz9
	 6iQu69ZlU/KzjrLlXwBqtkPmoAzyVd3Y77pMngarUvYe5kp+umkl0ZuPeiGVSoDW2S
	 vLsjJ7kpNO7jw==
Date: Fri, 11 Nov 2022 12:15:03 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <Wei.Chen@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    nd <nd@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jiamei Xie <Jiamei.Xie@arm.com>
Subject: RE: [PATCH v6 05/11] xen/arm: define Xen start address for FVP BaseR
 platform
In-Reply-To: <PAXPR08MB7420EFE8FD44EAD0DC4321E19E009@PAXPR08MB7420.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2211111214430.50442@ubuntu-linux-20-04-desktop>
References: <20221104100741.2176307-1-wei.chen@arm.com> <20221104100741.2176307-6-wei.chen@arm.com> <0ffe8a4d-7caf-89af-d189-a872b6b4f0fa@xen.org> <PAXPR08MB7420A3A20199F477622EB7099E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com> <e2a1233c-c001-9553-7abe-de97e96a650e@xen.org>
 <alpine.DEB.2.22.394.2211101358090.50442@ubuntu-linux-20-04-desktop> <PAXPR08MB7420EFE8FD44EAD0DC4321E19E009@PAXPR08MB7420.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-44684058-1668197705=:50442"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-44684058-1668197705=:50442
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 11 Nov 2022, Wei Chen wrote:
> Hi Stefano, Julien,
> 
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> > Stefano Stabellini
> > Sent: 2022年11月11日 6:13
> > To: Julien Grall <julien@xen.org>
> > Cc: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org; nd
> > <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Bertrand
> > Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> > <Volodymyr_Babchuk@epam.com>; Jiamei Xie <Jiamei.Xie@arm.com>
> > Subject: Re: [PATCH v6 05/11] xen/arm: define Xen start address for FVP
> > BaseR platform
> > 
> > On Wed, 9 Nov 2022, Julien Grall wrote:
> > > > > -----Original Message-----
> > > > > From: Julien Grall <julien@xen.org>
> > > > > Sent: 2022年11月7日 3:20
> > > > > To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org
> > > > > Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>;
> > Bertrand
> > > > > Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
> > > > > <Volodymyr_Babchuk@epam.com>; Jiamei Xie <Jiamei.Xie@arm.com>
> > > > > Subject: Re: [PATCH v6 05/11] xen/arm: define Xen start address for
> > FVP
> > > > > BaseR platform
> > > > >
> > > > >
> > > > >
> > > > > On 04/11/2022 10:07, Wei Chen wrote:
> > > > > > On Armv8-A, Xen has a fixed virtual start address (link address
> > > > > > too) for all Armv8-A platforms. In an MMU based system, Xen can
> > > > > > map its loaded address to this virtual start address. So, on
> > > > > > Armv8-A platforms, the Xen start address does not need to be
> > > > > > configurable. But on Armv8-R platforms, there is no MMU to map
> > > > > > loaded address to a fixed virtual address and different platforms
> > > > > > will have very different address space layout. So Xen cannot use
> > > > > > a fixed physical address on MPU based system and need to have it
> > > > > > configurable.
> > > > > >
> > > > > > So in this patch, we reuse the existing arm/platforms to store
> > > > > > Armv8-R platforms' parameters. And `XEN_START_ADDRESS` is one
> > > > > > kind of FVP BaseR platform's parameters. So we define default
> > > > > > `XEN_START_ADDRESS` for FVP BaseR in its platform file.
> > > > > >
> > > > > > We also introduce one Kconfig option for users to override the
> > > > > > default Xen start address of selected platform, if they think
> > > > > > the default address doesn't suit their scenarios. For this
> > > > > > Kconfig option, we use an unaligned address "0xffffffff" as the
> > > > > > default value to indicate that users haven't used a customized
> > > > > > Xen start address.
> > > > > >
> > > > > > And as we introduced Armv8-R platforms to Xen, that means the
> > > > > > existed Arm64 platforms should not be listed in Armv8-R platform
> > > > > > list, so we add !ARM_V8R dependency for these platforms.
> > > > > >
> > > > > > Signed-off-by: Wei Chen <wei.chen@arm.com>
> > > > > > Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
> > > > > > ---
> > > > > >    xen/arch/arm/Kconfig                           | 11 +++++++++++
> > > > > >    xen/arch/arm/include/asm/platforms/fvp_baser.h | 14
> > ++++++++++++++
> > > > >
> > > > > I looked at the content of fvp_baser.h after this series is applied.
> > > > > There are a bit of boiler plate that I expect to be part for other
> > > > > platforms. In particular...
> > > > >
> > > > > >    xen/arch/arm/platforms/Kconfig                 | 16
> > +++++++++++++---
> > > > > >    3 files changed, 38 insertions(+), 3 deletions(-)
> > > > > >    create mode 100644
> > xen/arch/arm/include/asm/platforms/fvp_baser.h
> > > > > >
> > > > > > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > > > > > index ad592367bd..ac276307d6 100644
> > > > > > --- a/xen/arch/arm/Kconfig
> > > > > > +++ b/xen/arch/arm/Kconfig
> > > > > > @@ -138,6 +138,17 @@ config TEE
> > > > > >    	  This option enables generic TEE mediators support. It allows
> > > > > guests
> > > > > >    	  to access real TEE via one of TEE mediators implemented in
> > > > > > XEN.
> > > > > >
> > > > > > +config XEN_START_ADDRESS
> > > > > > +	hex "Xen start address: keep default to use platform defined
> > > > > address"
> > > > > > +	default 0xFFFFFFFF
> > > > >
> > > > > ... this default value will need to be tested everywhere. At least
> > for
> > > > > now, I think you can avoid the per platform header by using the
> > Kconfig
> > > > > to select the proper address (see the config for selecting early
> > printk
> > > > > address).
> > > > >
> > > > > This will also avoids to use an invalid value here.
> > > > >
> > > >
> > > > We had considered to use Kconfig to define the start addresses of
> > v8R64
> > > > platforms (prompt users to input the address). But we also want to
> > provide
> > > > a default start address for each platform (Discussed in [1], header
> > for
> > > > default value, Kconfig option for customized address).
> > > Why do you want to provide a default value? And how it is guaranteed
> > that it
> > > will work for most of the users?
> > >
> > > >
> > > > We also had thought to use Kconfig to define a default start address
> > > > for each platform like what we had done for early printk in RFC[2].
> > > > But this method has been deprecated.
> > >
> > > Most of the current Xen is board agnostic except the UART. We push back
> > the
> > > addition of new one because the address can be found in the firmware
> > table and
> > > I wanted to avoid increase the number of option (there are dozens of
> > platform
> > > out...).
> > >
> > > >
> > > > So if we don’t use header files, just use the Kconfig, we can't
> > > > provide a default start address for platforms, and have to force users
> > > > to enter the start address.
> > >
> > > I am not sure I see the problem to force the user to enter the start
> > address.
> > > My worry with per-platform default value is we end up to force each
> > vendor to
> > > provide an header in order to boot Xen.
> > >
> > > I think it would be better to provide a config tailored for that
> > platform
> > > (whether it is part of Xen can be debatable). This would allow a user to
> > try a
> > > release Xen on their platform with zero changes in the code.
> > 
> > I agree with Julien, especially on this last point.
> > 
> > Of course we need a default configuration for a given platform, we don't
> > want every user of the same platform to have to go and look at the
> > manual to find the right address to use.
> > 
> > The question is where to put the per-platform default value. The kconfig
> > "default" keyword is not great for that and it is not realistic to have
> > a single address that works everywhere.
> > 
> > Instead, we could have a prepopulated kconfig under
> > xen/arch/arm/configs, or something under ImageBuilder, or maybe expand
> 
> Do you mean we can keep a config like armv8r_fvp_baser_config in
> xen/arch/arm/configs for users to generate a default config?

Yes


> If yes I think this method might be better for now. And about ImageBuilder
> solution we can do it after MPU support be merged?

That's fine
--8323329-44684058-1668197705=:50442--

