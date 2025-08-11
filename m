Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CC6B21998
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 01:56:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078177.1439179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulcN2-00075z-Q0; Mon, 11 Aug 2025 23:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078177.1439179; Mon, 11 Aug 2025 23:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulcN2-00073R-N8; Mon, 11 Aug 2025 23:56:04 +0000
Received: by outflank-mailman (input) for mailman id 1078177;
 Mon, 11 Aug 2025 23:56:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EhVm=2X=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ulcN0-00073L-LD
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 23:56:02 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb36d570-770e-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 01:56:00 +0200 (CEST)
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
X-Inumbo-ID: bb36d570-770e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ouyldh5kwjgbbi2rm5rx676g54.protonmail; t=1754956558; x=1755215758;
	bh=zpWgVSUcTcvyRiGRQo6eO1MrRRuVPnSzofmDDrQ4DrY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=koUfvdq//4JeqvoL0sAkFux6gCMRlpH190aBQ1ywwoPrggJx+Ib/7vCbZR5dAJWTk
	 lsxOZO0b0a3+OA+kQ9VRC2Ah8yrOpJPm92RUKc3p2Vo4c8qUqmfTF57a+TRE6TJ3rp
	 TPyyM/faVYZx20hAowQlrWfiY9yXa14UFfWOM/LaLuTeHRcTdloPWj935JPP6YQHXU
	 433s6s9h/HaT2JBCjFG60udNPoGpb8m0dVhs8RvoBK5jCg3lqlTO+ZnKvOe4BIubzu
	 DOJsLsEpDpU52YxX/nTlF13Mvyy8x/psq+m4SBSFYUJev3tGxnvhhhy9J3oiALpCWu
	 lPG3DCp0U7N/g==
Date: Mon, 11 Aug 2025 23:55:56 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/8] emul/vuart: introduce framework for UART emulators
Message-ID: <aJqDCJp19/iMIfDq@kraken>
In-Reply-To: <6953603b-8c3f-4f12-9f5e-45cb553fe8cc@suse.com>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-3-dmukhin@ford.com> <a416cc08-5970-433a-8015-5d2aa961a000@suse.com> <aJeZpiM35gOtB+4Z@starscream> <6953603b-8c3f-4f12-9f5e-45cb553fe8cc@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 501f85c1289b4568045b4d5c07f4aebd5d308911
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 09:34:58AM +0200, Jan Beulich wrote:
> On 09.08.2025 20:55, dmkhn@proton.me wrote:
> > On Mon, Aug 04, 2025 at 12:11:03PM +0200, Jan Beulich wrote:
> >> On 31.07.2025 21:21, dmkhn@proton.me wrote:
> >>> --- a/xen/common/Kconfig
> >>> +++ b/xen/common/Kconfig
> >>> @@ -1,6 +1,8 @@
> >>>
> >>>  menu "Common Features"
> >>>
> >>> +source "common/emul/Kconfig"
> >>> +
> >>>  config COMPAT
> >>
> >> Why at the very top?
> >
> > I did not find a better place, since the settings are not sorted and to=
 me it
> > makes sense to list emulation capabilities first...
> >
> > Where would be the best location for that submenu?
> > Close to another submenu `source "common/sched/Kconfig"`?
>=20
> At least below there. Possibly yet further down.
>=20
> >>> +int vuart_init(struct domain *d, struct vuart_params *params)
> >>> +{
> >>> +    const struct vuart_ops *vdev;
> >>> +    int rc;
> >>> +
> >>> +    if ( !domain_has_vuart(d) )
> >>> +        return 0;
> >>> +
> >>> +    for_each_vuart(vdev)
> >>> +    {
> >>> +        rc =3D vdev->init(d, params);
> >>> +        if ( rc )
> >>> +            return rc;
> >>> +    }
> >>> +
> >>> +    d->console.input_allowed =3D true;
> >>
> >> Unconditionally?
> >
> > Thanks.
> > That should be a least under rc =3D=3D 0.
>=20
> You only ever make it there with rc =3D=3D 0, though. (In fact that varia=
ble's
> scope would better be just the loop body.)
>=20
> >>> +/*
> >>> + * Put character to the first suitable emulated UART's FIFO.
> >>> + */
> >>
> >> What's "suitable"? Along the lines of the earlier remark, what if the =
domain
> >> has vUART kind A configured, ...
> >
> > "suitable" is meant to be the first emulator with put_rx !=3D NULL.
> > I will update that.
>=20
> Except that, as iirc Roger also pointed out, "first emulator with put_rx =
!=3D NULL"
> is a questionable condition.
>=20
> >>> --- a/xen/common/keyhandler.c
> >>> +++ b/xen/common/keyhandler.c
> >>> @@ -22,6 +22,7 @@
> >>>  #include <xen/mm.h>
> >>>  #include <xen/watchdog.h>
> >>>  #include <xen/init.h>
> >>> +#include <xen/vuart.h>
> >>>  #include <asm/div64.h>
> >>>
> >>>  static unsigned char keypress_key;
> >>> @@ -354,6 +355,8 @@ static void cf_check dump_domains(unsigned char k=
ey)
> >>>                             v->periodic_period / 1000000);
> >>>              }
> >>>          }
> >>> +
> >>> +        vuart_dump_state(d);
> >>
> >> How verbose is this going to get?
> >
> > Looks something like this:
> > ```
> > (XEN) [   88.334893] 'q' pressed -> dumping domain info (now =3D 883348=
28303)
> > [..]
> > (XEN) [   88.335673] Virtual ns16550 (COM2) I/O port 0x02f8 IRQ#3 owner=
 d0
> > (XEN) [   88.335681]   RX FIFO size 1024 in_prod 258 in_cons 258 used 0
> > (XEN) [   88.335689]   TX FIFO size 2048 out_prod 15 out_cons 0 used 15
> > (XEN) [   88.335696]   00 RBR 02 THR 6f DLL 01 DLM 00
> > (XEN) [   88.335703]   01 IER 05
> > (XEN) [   88.335709]   02 FCR 81 IIR c1
> > (XEN) [   88.335715]   03 LCR 13
> > (XEN) [   88.335720]   04 MCR 0b
> > (XEN) [   88.335726]   05 LSR 60
> > (XEN) [   88.335731]   06 MSR b0
> > (XEN) [   88.335736]   07 SCR 00
> >
> > ```
>=20
> Definitely too much (for my taste) to put under 'q'.

I'll try to limit the number of printed lines; register dump can be made
compact for sure.

>=20
> Jan


