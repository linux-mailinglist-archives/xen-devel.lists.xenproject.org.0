Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2DBA01236
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 05:12:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.865262.1276562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvWA-0002qr-SQ; Sat, 04 Jan 2025 04:12:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 865262.1276562; Sat, 04 Jan 2025 04:12:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTvWA-0002ov-Oo; Sat, 04 Jan 2025 04:12:06 +0000
Received: by outflank-mailman (input) for mailman id 865262;
 Sat, 04 Jan 2025 04:12:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EL/b=T4=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tTvW9-0002c5-JX
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 04:12:05 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e56f030-ca52-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 05:12:05 +0100 (CET)
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
X-Inumbo-ID: 0e56f030-ca52-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735963924; x=1736223124;
	bh=wpzqJ1gQpT4llUTwdbiCzzk5W799nCBrenThzsDWhe0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Iib4yioTpjklgIj0REC/et5vzchO9ru+nl4iVDfiK6bNmyj5EJSYse0sBPPJlbKkM
	 4IugCzKkJ8E7PcLsmUCIsETXkQ0Q7v/8s2YG/ujD8gVzCkKSlEWEsWXjud/mrtldIw
	 ZHpMDw1MyMSsZT+SHeGdagH4AiRM3Upl7a7hG2f2HYgAZGbeSm2vkOi9RGbaC73aDb
	 irH9VsG7zF/JeulHZ45qs2WZyFpRAhnirUrS4AUtecOrV4c9TtiGOaTen9sa2Q29Sp
	 bVWgWOEniJDf0VkLCctZA+yNldYwQOEO4FCj0DGWB8aSxTLiFX9hM1cfr44fwmawGt
	 4WQKYLBuPUQUQ==
Date: Sat, 04 Jan 2025 04:11:59 +0000
To: Stefano Stabellini <sstabellini@kernel.org>
From: Denis Mukhin <dmkhn@proton.me>
Cc: Jan Beulich <jbeulich@suse.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, dmukhin@ford.com, xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 16/35] xen/console: introduce printk_common()
Message-ID: <lAo-0zG42GARrpwwdvnIdtEbA4w5dT6-CV4DAZIwVn5Psvau0FhgY5Q4Zp4FgbD6SX2O6zL5Arkn-4voo7uRWZuiwIY4LLuAYrfaeracpr8=@proton.me>
In-Reply-To: <alpine.DEB.2.22.394.2412121655360.463523@ubuntu-linux-20-04-desktop>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com> <20241205-vuart-ns8250-v1-16-e9aa923127eb@ford.com> <Z1qpk55qKBywx26R@macbook.local> <8e5ce2dd-f888-42a3-937f-98ed1269c66c@suse.com> <Z1rT3lsr9B0dy-Jr@macbook.local> <9dad24ea-178f-48c8-a93b-5823c44b56ee@suse.com> <alpine.DEB.2.22.394.2412121655360.463523@ubuntu-linux-20-04-desktop>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 744c4105966ce7cb2ffc083108948da70e8f37dc
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


On Thursday, December 12th, 2024 at 5:03 PM, Stefano Stabellini <sstabellin=
i@kernel.org> wrote:

>
>
> On Thu, 12 Dec 2024, Jan Beulich wrote:
>
> > On 12.12.2024 13:15, Roger Pau Monn=C3=A9 wrote:
> >
> > > On Thu, Dec 12, 2024 at 12:57:25PM +0100, Jan Beulich wrote:
> > >
> > > > On 12.12.2024 10:14, Roger Pau Monn=C3=A9 wrote:
> > > >
> > > > > On Thu, Dec 05, 2024 at 08:41:46PM -0800, Denis Mukhin via B4 Rel=
ay wrote:
> > > > >
> > > > > > From: Denis Mukhin dmukhin@ford.com
> > > > > >
> > > > > > Introduce new printk() variant for convenient printouts which s=
kip '(XEN)'
> > > > > > prefix on xen console. This is needed for the case when physica=
l console is
> > > > > > owned by a domain w/ in-hypervisor UART emulation enabled.
> > > > >
> > > > > IIRC the ns8250 can only send or receive one byte (character) at =
a
> > > > > time, so you should likely put that on the console as soon as it'=
s
> > > > > received?
> > > > >
> > > > > For the hardware domain we explicitly don't buffer writes to the
> > > > > console (see guest_console_write() hardware domain special handli=
ng).
> > > > >
> > > > > I wonder however how you deal with domains that don't have the co=
nsole
> > > > > focus (ie: !=3D console_rx), as for those I think you still want =
to use
> > > > > the (d<domid>) prefix?
> > > >
> > > > Imo no matter what domain has the focus, the (d<domid>) prefix shou=
ld
> > > > always be logged. Just to avoid possible confusion.
> > >
> > > WE don't do that currently for the hardware domain, because we avoid
> > > doing any kind of line processing, as characters from the hardware
> > > domain are send straight to the console without waiting for the
> > > newline terminator (like we do for other domains).
> >
> > Right, and that's kind of special, and aiui intentionally so. These are
> > the only un-prefixed lines logged.
>
>
> I think we should provide a consistent behavior across architectures.
> The current behavior with vpl011 and dom0less on ARM is the following:
>
> - no prefix for Dom0 output
> - DOM$NUM for DomUs when not in focus, otherwise no prefix
>
> It is OK to change this behavior, but in that case I would ask that we
> change it consistently also for ARM.

Addressed in v3.

>
> > > Are you suggesting that in case of the console input being shared
> > > between multiple domains they should all be treated as plain domUs an=
d
> > > thus lines should be buffered?
> >
> > No, I'm actually not suggesting anything here beyond perhaps reducing
> > the scope of this series to just what the equivalent of vpl011 would be
> > for the 8250 / 16550 case.
>
>
> I agree with this



