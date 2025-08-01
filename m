Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B640AB17B03
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 03:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066685.1431818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhevd-0005nF-7v; Fri, 01 Aug 2025 01:51:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066685.1431818; Fri, 01 Aug 2025 01:51:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhevd-0005l0-3I; Fri, 01 Aug 2025 01:51:25 +0000
Received: by outflank-mailman (input) for mailman id 1066685;
 Fri, 01 Aug 2025 01:51:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GtvS=2N=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uheva-0005ku-Jb
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 01:51:23 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fdd16f3f-6e79-11f0-a320-13f23c93f187;
 Fri, 01 Aug 2025 03:51:08 +0200 (CEST)
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
X-Inumbo-ID: fdd16f3f-6e79-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754013066; x=1754272266;
	bh=0xESLbD1ZJxvO3CUMi0tBcjXxp8/N3CEHGKLWJ5NzCA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dxJMVrjQbaF1QtJFbQrvQW65cBj9tDFKKY13JOAXXNZTUNgQt9rlvZDB4vApvd62/
	 JCb8WBn9lGKXcP/4Anjjv7bLpLgRb65i8qaAjz4xIirgJLOdbniTgAC18Lb2otPsuo
	 5NbWPla+IrA0eU4U4m1OclwI9hJPSECsj/UXuIYeSRZewWMJ05Qf2Pgoc0YSUSzALg
	 8xAHN7euaXNfW+5cHkIYiXpI0Wtwsk0svdW28DtGVD9ZJ8WfLgjlU3Su7EuSPwt/vb
	 kdC0KV57OKnYO/plZX2XXF/3ELiJ8ySd3pbgm5rbJbhNvlzqqlp789laLabnNWiL28
	 BWDfFygmo2xrQ==
Date: Fri, 01 Aug 2025 01:51:00 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, dmukhin@ford.com
Subject: Re: [PATCH v4 8/8] emul/vuart: introduce console forwarding enforcement via vUART
Message-ID: <aIwdfl/d8scL5MBQ@kraken>
In-Reply-To: <alpine.DEB.2.22.394.2507311709221.468590@ubuntu-linux-20-04-desktop>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-9-dmukhin@ford.com> <alpine.DEB.2.22.394.2507311709221.468590@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 4561cb6ae269565d3fa516fbdaefecf25185ec8c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 05:10:12PM -0700, Stefano Stabellini wrote:
> On Thu, 31 Jul 2025, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > It may be useful to enforce console forwarding over the virtual UART. E=
.g.
> > hardware domain uses PV console by default, but it may be necessary to =
have
> > console forwarded to the hardware domain via emulated UART.
> >
> > Add CONFIG_VUART_CONSOLE_FOCUS to enforce such behavior.
> >
> > Signed-off-by: Denis Mukhin <dmukhin@ford.com>
>=20
> I realize that hyperlaunch is not merged yet, but I think this one would
> be best as a hyperlaunch configuration option rather than a kconfig. But
> it is certainly useful for testing until Hyperlaunch is merged!

Yep, I used that to test PVH dom0 w/ emulator.

re: configuration option: I agree and, initially I wanted to hook a flag to=
 xl
/ dom0 command line opton which will say that emulated UART can accept
physical input.

But then decided to hook such capability via Kconfig for simplicity.

>=20
>=20
> > ---
> > Changes since v3:
> > - new patch
> > ---
> >  xen/arch/x86/domain.c         | 6 ++++++
> >  xen/common/emul/vuart/Kconfig | 5 +++++
> >  xen/drivers/char/console.c    | 2 +-
> >  3 files changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 39b0c0b199b9..40ff92ad6c61 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -848,6 +848,12 @@ int arch_domain_create(struct domain *d,
> >      if ( is_hardware_domain(d) && is_pv_domain(d) )
> >          emflags |=3D XEN_X86_EMU_PIT;
> >
> > +    if ( IS_ENABLED(CONFIG_VUART_CONSOLE_FOCUS) &&
> > +         IS_ENABLED(CONFIG_VUART_NS16550) &&
> > +         is_hardware_domain(d) &&
> > +         is_hvm_domain(d) )
> > +        emflags |=3D XEN_X86_EMU_NS16550;
> > +
> >      if ( emflags & ~XEN_X86_EMU_ALL )
> >      {
> >          printk(XENLOG_G_ERR
> > diff --git a/xen/common/emul/vuart/Kconfig b/xen/common/emul/vuart/Kcon=
fig
> > index ebefd90d913e..1069ca95f2db 100644
> > --- a/xen/common/emul/vuart/Kconfig
> > +++ b/xen/common/emul/vuart/Kconfig
> > @@ -51,4 +51,9 @@ config VUART_NS16550_DEBUG
> >  =09help
> >  =09  Enable development debugging.
> >
> > +config VUART_CONSOLE_FOCUS
> > +=09bool "Console input forwarding via UART emulator"
> > +=09help
> > +=09  Enable physical console input forwarding to guest OS via emulated=
 UART.
> > +
> >  endmenu
> > diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
> > index 93254979817b..d142f5511d61 100644
> > --- a/xen/drivers/char/console.c
> > +++ b/xen/drivers/char/console.c
> > @@ -597,7 +597,7 @@ static void __serial_rx(char c)
> >      if ( !d )
> >          return;
> >
> > -    if ( is_hardware_domain(d) )
> > +    if ( !IS_ENABLED(CONFIG_VUART_CONSOLE_FOCUS) && is_hardware_domain=
(d) )
> >      {
> >          /*
> >           * Deliver input to the hardware domain buffer, unless it is
> > --
> > 2.34.1
> >
> >


