Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52811A01240
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:28:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865311.1276612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvm3-00076r-3M; Sat, 04 Jan 2025 04:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865311.1276612; Sat, 04 Jan 2025 04:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvm3-00075P-0T; Sat, 04 Jan 2025 04:28:31 +0000
Received: by outflank-mailman (input) for mailman id 865311;
 Sat, 04 Jan 2025 04:28:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvm1-00075J-50
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:28:29 +0000
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57bd2422-ca54-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 05:28:27 +0100 (CET)
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
X-Inumbo-ID: 57bd2422-ca54-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735964906; x=1736224106;
	bh=1u3pc9FA23xPVpS/7KMUlXEQM05gM/Fe3CmWxYn9coU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Tvc+mMLxaVUdrn2NGCDaj6GMcvIxG+XfjgkfPkzuswtFo/fx+y9OXJEinRURGgGa1
	 ICiE0GbVnUxAArjCjozK65Y3dk5/pTkgH6sclDe6p8inPcKN7CTw4SvN7lmNa0sUBI
	 RTS2uU21SKuzNN7iEggqLIutc359rvebHGkQ3j08a9nMMP5HZNH6nQyJvmKU7w0zub
	 O4Ulv0Fv92sCKZEGYdmjM0sPuTLTrh4MsfFTM/mv+LuabRJz/OUvgtsFODOEi/L5LD
	 whzMO7GTKvXIXZp5B0IsNPC8iP6nYHjmVoAVXZob1aPAXnBxaXQUFcxucuk2/f5GSK
	 x8axijAudTADQ==
Date: Sat, 04 Jan 2025 04:28:23 +0000
To: =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Denis Mukhin <dmkhn@proton.me>
Cc: =?utf-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH v2 00/35] Introduce NS8250 UART emulator
Message-ID: <YluBQMXfj1n5smogSyHCXGrYZlIpVVBGlPj-76ExLx1A31fxYjumHRuhYgxdKoZnIw8Qf6SoENCSHBx_SCnpmrdUWwZhw-kNl5XyTpmaJEA=@proton.me>
In-Reply-To: <Z1_tNLSg2vla6kY6@macbook.local>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <Z13I2xEJpkMouslw@mail-itl> <Z1_tNLSg2vla6kY6@macbook.local>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b43fadfb1da0a084f9554482c54c172664e2eb69
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Monday, December 16th, 2024 at 1:04 AM, Roger Pau Monn=C3=A9 <roger.pau@=
citrix.com> wrote:

>
>
> On Sat, Dec 14, 2024 at 07:05:15PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
>
> > On Thu, Dec 05, 2024 at 08:41:30PM -0800, Denis Mukhin via B4 Relay wro=
te:
> >
> > > The patch series introduces initial in-hypervisor emulator for
> > > NS8250/NS16x50-compatible UARTs under CONFIG_HAS_VUART_NS8250.
> > >
> > > In parallel domain creation scenario (hyperlaunch), NS8520 emulator h=
elps
> > > early guest OS bringup debugging, because it eliminates dependency on=
 the
> > > external emulator being operational by the time domains are created. =
Also,
> > > there's no early console facility similar to vpl011 to support x86 gu=
est OS
> > > bring up.
> > >
> > > The NS8250 emulator is disabled by default.
> >
> > On a high level, why the mechanism used by earlyprintk=3Dxen (IIUC i/o
> > port 0xe9) isn't enough?
> > Hyperlaunch can't start full (Xen-unaware) HVM domains anyway, so
> > a requirement to use a Xen-specific interface for the console shouldn't=
 be
> > an issue, no?
>
>
> I assume the point is to provide a minimal set of non-Xen specific
> interfaces so that a guest could work if made to use only those
> interfaces. The 0xE9 hack is quite common for emergency printing, but
> it doesn't allow for input, which the ns8250 does.

Yes, my major objective was providing a simpler debugging facility under Xe=
n
w/o modifying guest OS software.

>
> Thanks, Roger.



