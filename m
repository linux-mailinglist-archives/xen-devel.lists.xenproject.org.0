Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30017B25BD8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 08:34:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1080718.1440932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umRWO-00025h-Al; Thu, 14 Aug 2025 06:33:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1080718.1440932; Thu, 14 Aug 2025 06:33:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umRWO-00022i-7P; Thu, 14 Aug 2025 06:33:08 +0000
Received: by outflank-mailman (input) for mailman id 1080718;
 Thu, 14 Aug 2025 06:33:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1msc=22=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1umRWL-00022Z-KK
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 06:33:06 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8771b8ae-78d8-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 08:33:03 +0200 (CEST)
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
X-Inumbo-ID: 8771b8ae-78d8-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1755153181; x=1755412381;
	bh=42Q4wWHkPQsKv2eVkuMATo/QL081Jbv4U8U87Ml4IUk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=I96pv50Y+Ehj5j7jTUkOAMt3XBaVv8PNc9QFQDl7STZ6LCuanb4EViKJL2D1dPiT8
	 vqtaokrZE7yMHlYLtz43q9y5sYTHw20VGgSBAqq0eJslUUm3E1HyUZiQcl87vONm6m
	 VBfhDxx3akvMOoVG8nrMel/VP6uqGrGwAMWQd4nKIeEshsnu2xdh9QMFANYd7T0nwj
	 ma+KcZhPNVzl7hfK3uTMk/5/1LwJ8tOQ0II7qkgvTtMQ8obM9JkmMitxuHdHAN7Sgc
	 6RLrMirTSJ3JMzUJ4EOu6o7iSi5xT6hEKnndPX8r9eLlLW1KOx1rniojQ8WChYb9zN
	 0DJgY5ilXgVHQ==
Date: Thu, 14 Aug 2025 06:32:55 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/8] emul/vuart: introduce framework for UART emulators
Message-ID: <aJ2DExG5Y8AsH78/@kraken>
In-Reply-To: <61aeb2a2-dc53-4f52-ab65-a9a8143a3307@suse.com>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-3-dmukhin@ford.com> <a416cc08-5970-433a-8015-5d2aa961a000@suse.com> <aJeZpiM35gOtB+4Z@starscream> <6953603b-8c3f-4f12-9f5e-45cb553fe8cc@suse.com> <aJqDCJp19/iMIfDq@kraken> <61aeb2a2-dc53-4f52-ab65-a9a8143a3307@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ff31f4155bde6d96a4f17611156867a4cde65118
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 08:52:18AM +0200, Jan Beulich wrote:
> On 12.08.2025 01:55, dmkhn@proton.me wrote:
> > On Mon, Aug 11, 2025 at 09:34:58AM +0200, Jan Beulich wrote:
> >> On 09.08.2025 20:55, dmkhn@proton.me wrote:
> >>> On Mon, Aug 04, 2025 at 12:11:03PM +0200, Jan Beulich wrote:
> >>>> On 31.07.2025 21:21, dmkhn@proton.me wrote:
> >>>>> @@ -354,6 +355,8 @@ static void cf_check dump_domains(unsigned char=
 key)
> >>>>>                             v->periodic_period / 1000000);
> >>>>>              }
> >>>>>          }
> >>>>> +
> >>>>> +        vuart_dump_state(d);
> >>>>
> >>>> How verbose is this going to get?
> >>>
> >>> Looks something like this:
> >>> ```
> >>> (XEN) [   88.334893] 'q' pressed -> dumping domain info (now =3D 8833=
4828303)
> >>> [..]
> >>> (XEN) [   88.335673] Virtual ns16550 (COM2) I/O port 0x02f8 IRQ#3 own=
er d0
> >>> (XEN) [   88.335681]   RX FIFO size 1024 in_prod 258 in_cons 258 used=
 0
> >>> (XEN) [   88.335689]   TX FIFO size 2048 out_prod 15 out_cons 0 used =
15
> >>> (XEN) [   88.335696]   00 RBR 02 THR 6f DLL 01 DLM 00
> >>> (XEN) [   88.335703]   01 IER 05
> >>> (XEN) [   88.335709]   02 FCR 81 IIR c1
> >>> (XEN) [   88.335715]   03 LCR 13
> >>> (XEN) [   88.335720]   04 MCR 0b
> >>> (XEN) [   88.335726]   05 LSR 60
> >>> (XEN) [   88.335731]   06 MSR b0
> >>> (XEN) [   88.335736]   07 SCR 00
> >>>
> >>> ```
> >>
> >> Definitely too much (for my taste) to put under 'q'.
> >
> > I'll try to limit the number of printed lines; register dump can be mad=
e
> > compact for sure.
>=20
> Yet even then I'm inclined to say that device specific data simply doesn'=
t
> belong here.

Ability to produce such traces was helpful during debug, TBH.

I will hide per-vuart dump_state behind CONFIG_VUART_DUMP_STATE (or alike)
so default config does not enable it.


