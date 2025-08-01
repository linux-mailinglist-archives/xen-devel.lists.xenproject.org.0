Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B55B18779
	for <lists+xen-devel@lfdr.de>; Fri,  1 Aug 2025 20:51:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1067458.1432188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhupc-00084E-A4; Fri, 01 Aug 2025 18:50:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1067458.1432188; Fri, 01 Aug 2025 18:50:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhupc-00081p-7B; Fri, 01 Aug 2025 18:50:16 +0000
Received: by outflank-mailman (input) for mailman id 1067458;
 Fri, 01 Aug 2025 18:50:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GtvS=2N=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhupZ-00081j-9f
 for xen-devel@lists.xenproject.org; Fri, 01 Aug 2025 18:50:14 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 57f32641-6f08-11f0-b897-0df219b8e170;
 Fri, 01 Aug 2025 20:50:07 +0200 (CEST)
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
X-Inumbo-ID: 57f32641-6f08-11f0-b897-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754074204; x=1754333404;
	bh=tkU2ubEKzRvgEXI9JXDaJnb41qMKQwm4UGvogAWMJn8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DZNZBVeTNfGGez/CNz+5eEy93SqqSKGM2jLF2xaUPcZjnIsK7AZuhm0jHD87ymZRZ
	 oqXalu8ZEVt2wqzfZEwh1OFF2dPEyQKHsW8QK/wSFJpUazM/ZwKmQSCQtOELY0y/PI
	 laYuC4xMudhm8kAWozgCCItc27GL4DzbD/KjtRM7kIUlNWkjMcqeSjQxXexrz9prKj
	 PcYtRSm4ySR+D/bwuyR4+NUwt5dDQHD7QYYbBtNFMrEIPK+N4AnHy/csdhx/AwX5iw
	 yR0vp/uJR8/pgbMuHDTMLzq8Z8xlMHzaflxFQFCZo3s+uyv7KL3tMlQ16/WPpIQc35
	 3cVD8cmdQw8VA==
Date: Fri, 01 Aug 2025 18:49:59 +0000
To: Frediano Ziglio <frediano.ziglio@cloud.com>
From: dmkhn@proton.me
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Console vs serial
Message-ID: <aI0MUW9xzGZAU3P7@kraken>
In-Reply-To: <CACHz=ZhOnnCAZ9W=j0fTWnpy7BzqjZF7B-X0sxLagKa-7q1ZiQ@mail.gmail.com>
References: <e742cee1-450d-4df0-a3a6-af635a940472@citrix.com> <CACHz=ZhOnnCAZ9W=j0fTWnpy7BzqjZF7B-X0sxLagKa-7q1ZiQ@mail.gmail.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: d8d11fae8628742bb4eb795e17aac2deb94f8a3a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 01, 2025 at 12:44:57PM +0100, Frediano Ziglio wrote:
> On Fri, Aug 1, 2025 at 12:25=E2=80=AFPM Andrew Cooper <andrew.cooper3@cit=
rix.com> wrote:
> >
> > Hello,
> >
> > There's a long-standing irritation in Xen, whereby printk()'s which
> > occur prior to console_init_preirq() get half-lost.
> >
> > They end up in the console ring, and hence are available via `xl dmesg`=
,
> > but they're missing from serial console.
> >
> > e.g. these 4 lines don't escape
> >
> >     (XEN) Enabling lockdown mode because Secure Boot is enabled
> >     (XEN) Lockdown mode is enabled
> >     (XEN) Ignoring cmdline option 'hap_2mb' in lockdown mode
> >     (XEN) Ignoring cmdline option 'hap_1gb' in lockdown mode
> >      __  __            _  _    _  ___   ____
> >      \ \/ /___ _ __   | || |  / |/ _ \ |___ \
> >
> >
> > This is from a testcase failure I've just debugged, but the issue is no=
t
> > specific to secureboot.  More generally, any diagnostic from cmdline
> > parsing ends up in this state.
> >
> > For PVShim, we did a gross hack to assume the PV console is usable righ=
t
> > from the outset, but all other console configurations don't start
> > working until the cmdline has been parsed.
> >
> > Is anything stopping us from feeding the current contents of the consol=
e
> > ring into serial in console_init_preirq()?
> >
> > ~Andrew
> >
>=20
> I don't think there's a problem replaying the console logs into the
> serial once the serial is set up.
> It will slow down the boot maybe but beside that it should be fine.

Replaying console logs into the serial is already a case on staging branch:
console_init_preirq() calls conring_flush(..), which will replay everything
from conring into all available console devices.

--
Denis

>=20
> Frediano
>=20


