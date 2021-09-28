Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CD941A472
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 03:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197324.350348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV1TN-0003Lb-PO; Tue, 28 Sep 2021 00:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197324.350348; Tue, 28 Sep 2021 00:59:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV1TN-0003Jo-MN; Tue, 28 Sep 2021 00:59:53 +0000
Received: by outflank-mailman (input) for mailman id 197324;
 Tue, 28 Sep 2021 00:59:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2A=OS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mV1TL-0003Ji-GU
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 00:59:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cf0f8921-a776-409c-bf65-30d0aa8943a9;
 Tue, 28 Sep 2021 00:59:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5978060F11;
 Tue, 28 Sep 2021 00:59:49 +0000 (UTC)
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
X-Inumbo-ID: cf0f8921-a776-409c-bf65-30d0aa8943a9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632790789;
	bh=o/9PrZaRyZAV7aKtqEdAGwyUZ3FkDjT+co7mytr5ZtI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=P2ofTRpjyJfmXzVs6JvQ3oDOHzA4eDcEzsJxfxU3HjU14HdsuGoPvmzqw8/FLMyiT
	 c2PTNoz7LMdoP0IFi+CkB1sMWX8LdKzKneOEWuqZckWOVVm895Z6bXMJPQ9yt9zYcD
	 GXdz3voj1pgoOz3dSLEhDAYUFaVNnzkEQB+c/ThvyTKJ4to7ddAReMb8/pvoUO6gfz
	 NrfNvYXNQHLdTF6PSlmHlehfk6EoVFdvH+FZjgkIOfd/Lrs1AZ6sxwmkM3sFllNRft
	 kdVO+qGtgqU5i79NuRIp+uFVLDDEu4NKjvHluzVtO3t1mTDT51m4AgO+7iCnCK6kdS
	 egPD8GIwRd/5A==
Date: Mon, 27 Sep 2021 17:59:48 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <Wei.Chen@arm.com>
cc: Jan Beulich <jbeulich@suse.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    "julien@xen.org" <julien@xen.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI
 architecture
In-Reply-To: <DB9PR08MB6857AB9DBB66A4E02140987B9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.21.2109271420560.5022@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-21-wei.chen@arm.com> <alpine.DEB.2.21.2109231811420.17979@sstabellini-ThinkPad-T480s> <PAXPR08MB68640027443F267495804A529EA49@PAXPR08MB6864.eurprd08.prod.outlook.com>
 <b4433faf-bb70-d083-126c-0224da3d9a82@suse.com> <DB9PR08MB685742B691E39FD3161BFE289EA49@DB9PR08MB6857.eurprd08.prod.outlook.com> <a295cc34-9cc0-468b-c85a-2e5d1238d9a3@suse.com> <DB9PR08MB6857EE6294A1062EE0FAF0289EA69@DB9PR08MB6857.eurprd08.prod.outlook.com>
 <DB9PR08MB6857AB9DBB66A4E02140987B9EA79@DB9PR08MB6857.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1428592914-1632777812=:5022"
Content-ID: <alpine.DEB.2.21.2109271424150.5022@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1428592914-1632777812=:5022
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2109271424151.5022@sstabellini-ThinkPad-T480s>

On Mon, 27 Sep 2021, Wei Chen wrote:
> > -----Original Message-----
> > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of Wei
> > Chen
> > Sent: 2021年9月26日 18:25
> > To: Jan Beulich <jbeulich@suse.com>
> > Cc: xen-devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
> > <Bertrand.Marquis@arm.com>; Stefano Stabellini <sstabellini@kernel.org>
> > Subject: RE: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-
> > EFI architecture
> > 
> > Hi Jan,
> > 
> > > -----Original Message-----
> > > From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
> > Jan
> > > Beulich
> > > Sent: 2021年9月24日 18:49
> > > To: Wei Chen <Wei.Chen@arm.com>
> > > Cc: xen-devel@lists.xenproject.org; julien@xen.org; Bertrand Marquis
> > > <Bertrand.Marquis@arm.com>; Stefano Stabellini <sstabellini@kernel.org>
> > > Subject: Re: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for
> > non-
> > > EFI architecture
> > >
> > > On 24.09.2021 12:31, Wei Chen wrote:
> > > >> From: Jan Beulich <jbeulich@suse.com>
> > > >> Sent: 2021年9月24日 15:59
> > > >>
> > > >> On 24.09.2021 06:34, Wei Chen wrote:
> > > >>>> From: Stefano Stabellini <sstabellini@kernel.org>
> > > >>>> Sent: 2021年9月24日 9:15
> > > >>>>
> > > >>>> On Thu, 23 Sep 2021, Wei Chen wrote:
> > > >>>>> --- a/xen/common/Kconfig
> > > >>>>> +++ b/xen/common/Kconfig
> > > >>>>> @@ -11,6 +11,16 @@ config COMPAT
> > > >>>>>  config CORE_PARKING
> > > >>>>>  	bool
> > > >>>>>
> > > >>>>> +config EFI
> > > >>>>> +	bool
> > > >>>>
> > > >>>> Without the title the option is not user-selectable (or de-
> > > selectable).
> > > >>>> So the help message below can never be seen.
> > > >>>>
> > > >>>> Either add a title, e.g.:
> > > >>>>
> > > >>>> bool "EFI support"
> > > >>>>
> > > >>>> Or fully make the option a silent option by removing the help text.
> > > >>>
> > > >>> OK, in current Xen code, EFI is unconditionally compiled. Before
> > > >>> we change related code, I prefer to remove the help text.
> > > >>
> > > >> But that's not true: At least on x86 EFI gets compiled depending on
> > > >> tool chain capabilities. Ultimately we may indeed want a user
> > > >> selectable option here, but until then I'm afraid having this option
> > > >> at all may be misleading on x86.
> > > >>
> > > >
> > > > I check the build scripts, yes, you're right. For x86, EFI is not a
> > > > selectable option in Kconfig. I agree with you, we can't use Kconfig
> > > > system to decide to enable EFI build for x86 or not.
> > > >
> > > > So how about we just use this EFI option for Arm only? Because on Arm,
> > > > we do not have such toolchain dependency.
> > >
> > > To be honest - don't know. That's because I don't know what you want
> > > to use the option for subsequently.
> > >
> > 
> > In last version, I had introduced an arch-helper to stub EFI_BOOT
> > in Arm's common code for Arm32. Because Arm32 doesn't support EFI.
> > So Julien suggested me to introduce a CONFIG_EFI option for non-EFI
> > supported architectures to stub in EFI layer.
> > 
> > [1] https://lists.xenproject.org/archives/html/xen-devel/2021-
> > 08/msg00808.html
> > 
> 
> As Jan' reminded, x86 doesn't depend on Kconfig to build EFI code.
> So, if we CONFIG_EFI to stub EFI API's for x86, we will encounter
> that toolchains enable EFI, but Kconfig disable EFI. Or Kconfig
> enable EFI but toolchain doesn't provide EFI build supports. And
> then x86 could not work well.
> 
> If we use CONFIG_EFI for Arm only, that means CONFIG_EFI for x86
> is off, this will also cause problem.
> 
> So, can we still use previous arch_helpers to stub for Arm32?
> until x86 can use this selectable option?

EFI doesn't have to be necessarily a user-visible option in Kconfig at
this point. I think Julien was just asking to make the #ifdef based on
a EFI-related config rather than just based CONFIG_ARM64.

On x86 EFI is detected based on compiler support, setting XEN_BUILD_EFI
in xen/arch/x86/Makefile. Let's say that we keep using the same name
"XEN_BUILD_EFI" on ARM as well.

On ARM32, XEN_BUILD_EFI should be always unset.

On ARM64 XEN_BUILD_EFI should be always set.

That's it, right? I'd argue that CONFIG_EFI or HAS_EFI are better names
than XEN_BUILD_EFI, but that's OK anyway. So for instance you can make
XEN_BUILD_EFI an invisible symbol in xen/arch/arm/Kconfig and select it
only on ARM64.
--8323329-1428592914-1632777812=:5022--

