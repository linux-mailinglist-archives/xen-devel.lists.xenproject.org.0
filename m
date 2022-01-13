Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB1D48D041
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jan 2022 02:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256965.441297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7pIU-0004Mr-At; Thu, 13 Jan 2022 01:53:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256965.441297; Thu, 13 Jan 2022 01:53:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7pIU-0004KB-6p; Thu, 13 Jan 2022 01:53:02 +0000
Received: by outflank-mailman (input) for mailman id 256965;
 Thu, 13 Jan 2022 01:53:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4cYr=R5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1n7pIS-0004K5-43
 for xen-devel@lists.xenproject.org; Thu, 13 Jan 2022 01:53:00 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 878f0a32-7413-11ec-a563-1748fde96b53;
 Thu, 13 Jan 2022 02:52:57 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 684ABB81FF9;
 Thu, 13 Jan 2022 01:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD981C36AE5;
 Thu, 13 Jan 2022 01:52:54 +0000 (UTC)
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
X-Inumbo-ID: 878f0a32-7413-11ec-a563-1748fde96b53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642038775;
	bh=kn1zbGivYHhh8dgQKwwVcT2hRmeVrV16bpF736/m86s=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lgKSfLCmyK3eQg9F4252pMtzOhqQxPllxae3+3Qwaask00nAKgN3nudsOF8+9PKla
	 Rdsft2UYVbTaIPjPKKJNBcFLsRPSMWjYXr/FkAyxTUmigXBcTeguVXEsuLSDK781gp
	 +Yl6L/h3JhjUMbiYHC5nWqVAfeXmxYn7j+9I74kM6PYkV5Z/ml/7OEUw/idFD1C1hU
	 vh2u7Ws4l64MguQxzTENpXqwZkICaTsILDzbbgR+FEk2d99xmyA6GLjci7a/vK2ZWi
	 AgHU1ha+jf31yL0oPIZtaSLgZuIJwltMgL6JaNfQ9K0oo/Z0Y8+oCfAA9tCpB7HNW1
	 ITkGza6FwIGFw==
Date: Wed, 12 Jan 2022 17:52:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dongjiu Geng <gengdongjiu1@gmail.com>
cc: Julien Grall <julien.grall.oss@gmail.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3] xen/arm: Allow QEMU platform to be built with GICv2
In-Reply-To: <CABSBigRyDr4GstZjwJVrM64f57PZKL_Dmq0N+BiKYW3fuXxWYg@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2201121054570.19362@ubuntu-linux-20-04-desktop>
References: <20211228041423.2231598-1-gengdongjiu1@gmail.com> <CAJ=z9a2ww3OptqQn+KDdOMrRB_sSAicnVFQJ2UAySq5xZZjhTQ@mail.gmail.com> <CABSBigRyDr4GstZjwJVrM64f57PZKL_Dmq0N+BiKYW3fuXxWYg@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 12 Jan 2022, Dongjiu Geng wrote:
> > > diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> > > index c93a6b2756..925f6ef8da 100644
> > > --- a/xen/arch/arm/platforms/Kconfig
> > > +++ b/xen/arch/arm/platforms/Kconfig
> > > @@ -15,7 +15,7 @@ config ALL_PLAT
> > >  config QEMU
> > >         bool "QEMU aarch virt machine support"
> > >         depends on ARM_64
> > > -       select GICV3
> > > +       select GICv3 if !NEW_VGIC
> >
> > There was an open question in v2. In general, it is better to wait
> > until the discussion is closed or you mention it after ---. This
> > avoids being lost.
> 
> Sorry for the noise, Stefano,  do you have any suggestion for this
> patch?  thanks a lot.

Looking back at v2, the original open question I think was:


> While writing a proposal for the commit message, I remembered that the 
> goal of CONFIG_QEMU was to select all the required drivers to be able to 
> boot Xen on QEMU.
> 
> AFAICT, if you start from tiny64_defconfig, you would not have GICv3 
> selected. So we would technically break users of QEMU with GICv3.
> 
> I am not entirely sure how to approach it. I can think of 2 options:
> 
>   1) Use 'select GICv3 if !NEW_VGIC'
>   2) Add a specific platform for QEMU new vGIC
> 
> I have the feeling that 1) will result to same unmet dependency issue. 
> Stefano any opinions?

I think it would be better to avoid introducing one more QEMU platform
if we can. The current patch as a bug, it should be:

select GICV3 if !NEW_VGIC

note "GICV3" instead of "GICv3".


But unfortunately it doesn't work:

arch/arm/Kconfig:52:error: recursive dependency detected!
arch/arm/Kconfig:52:    symbol NEW_VGIC depends on GICV3
arch/arm/Kconfig:36:    symbol GICV3 is selected by NEW_VGIC
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"


If QEMU supports GICv2 virtualization since v3.1.0, which is from 2018,
then maybe the easiest way to solve the problem is simply to remove
"select GICV3" from QEMU as it is not an hard requirement any longer.
However, it is true that existing users of tiny64_defconfig and QEMU
would get a different behavior.

I don't think it is a problem but if you guys think it is, then the only
option is to introduce a new QEMU platform like "QEMU_GREATER_3.1.0"
which doesn't select GICV3 (it only selects HAS_PL011) because it is not
a requirement anymore.

Or we could have:

QEMU
    bool "QEMU aarch virt machine support >= v3.1.0"
    depends on ARM_64
    select HAS_PL011

QEMU_LEGACY
    bool "QEMU aarch virt machine support < v3.1.0"
    depends on ARM_64
    select GICV3
	select HAS_PL011

