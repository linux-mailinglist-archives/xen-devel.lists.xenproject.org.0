Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51327B1551C
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 00:10:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063196.1428997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugsWT-0002Kv-6I; Tue, 29 Jul 2025 22:10:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063196.1428997; Tue, 29 Jul 2025 22:10:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugsWT-0002Hm-3C; Tue, 29 Jul 2025 22:10:13 +0000
Received: by outflank-mailman (input) for mailman id 1063196;
 Tue, 29 Jul 2025 22:10:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TdY=2K=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugsWQ-0000tb-Q0
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 22:10:11 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca0d014e-6cc8-11f0-b895-0df219b8e170;
 Wed, 30 Jul 2025 00:10:09 +0200 (CEST)
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
X-Inumbo-ID: ca0d014e-6cc8-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753827007; x=1754086207;
	bh=KpeawhcIzhNTOwabM6HfpqyvSLAj9mVYFxmAEkEl7TM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=dPKqRcdTo9eMdhS9pT6sBbEgTprYE1YYk58bx1jtqfQAhXe+FnCUYSt3OSdbDxZMP
	 ZFbilvRFD1z5K0nVKAwKcgfiwaEoiifhYEvp86P1Yf995ljiR2Gpn+T3F6Ccmavtny
	 3xo0xzhFDBflLeKQAq+hPZ7wGDNWx/3GX4wuJtuZR55ypV/9Swj9ltMtDjeztR+rc8
	 lesPmhYMwHJSM3v1i0xlrypv7MpYP5yeUbvhPjtlmOmhe6FbTqn1nG3wg3svId4PSk
	 ssJYkakgrbjnHu2bQ+CeFhC1cJ2YTesxziBi3AkKfmX0O193eniPJvI2tK5ezgq+03
	 x6Et6OTTooQYw==
Date: Tue, 29 Jul 2025 22:10:02 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, =?utf-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>, Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Subject: Re: [PATCH v2] xen/arm, xen/common: Add Kconfig option to control Dom0 boot
Message-ID: <aIlGtLz4ZxNwE/gO@kraken>
In-Reply-To: <182d2b92-ba93-4916-a277-d7996b784fa2@suse.com>
References: <90e79e175b5f703f33944415df3c7a73d6abc385.1753722403.git.oleksii_moisieiev@epam.com> <aIfrhfoaEBx2tyM3@kraken> <182d2b92-ba93-4916-a277-d7996b784fa2@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 563b818cef7941a368460e08b2c073c503190411
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 10:20:54AM +0200, Jan Beulich wrote:
> On 28.07.2025 23:28, dmkhn@proton.me wrote:
> > On Mon, Jul 28, 2025 at 05:07:30PM +0000, Oleksii Moisieiev wrote:
> >> This commit introduces a new Kconfig option, `CONFIG_DOM0_BOOT`, to
> >> allow for building Xen without support for booting a regular domain (D=
om0).
> >> This functionality is primarily intended for the ARM architecture.
> >>
> >> A new Kconfig symbol, `HAS_DOM0`, has been added and is selected by
> >> default for ARM and X86 architecture. This symbol signifies that an
> >> architecture has the capability to support a Dom0.
> >>
> >> The `DOM0_BOOT` option depends on `HAS_DOM0` and defaults to 'y'. For
> >> expert users, this option can be disabled (`CONFIG_EXPERT=3Dy` and no
> >> `CONFIG_DOM0_BOOT` in the config), which will compile out the Dom0
> >> creation code on ARM. This is useful for embedded or dom0less-only
> >> scenarios to reduce binary size and complexity.
> >>
> >> The ARM boot path has been updated to panic if it detects a non-dom0le=
ss
> >> configuration while `CONFIG_DOM0_BOOT` is disabled, preventing an inva=
lid
> >> boot.
> >>
> >> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> >>
> >> ---
> >>
> >> ---
> >>  xen/arch/arm/Kconfig        |  1 +
> >>  xen/arch/arm/domain_build.c |  8 ++++++++
> >>  xen/arch/arm/setup.c        | 14 ++++++++++----
> >>  xen/arch/x86/Kconfig        |  1 +
> >>  xen/common/Kconfig          | 11 +++++++++++
> >>  5 files changed, 31 insertions(+), 4 deletions(-)
> >
> > I think there should be changes in
> >   include/xen/domain.h
> > and
> >   arch/arm/include/asm/setup.h
> > to compile out declarations of dom0_max_vcpus() and create_dom0() under=
 new
> > CONFIG_DOM0_BOOT.
>=20
> Adding #ifdef-ary just to hide declarations is often merely adding clutte=
r,
> without providing a clear benefit. I didn't check in this case, but I thi=
nk
> when making such a request you want to clarify what the gains would be of
> adding more #ifdef.

re: clutter: fully agree.

I was thinking about this following code where ifdef-ery may be needed:

+    if ( IS_ENABLED(CONFIG_DOM0_BOOT) && !is_dom0less_mode() )
+    {
+        /* Create initial domain 0. */
         create_dom0();
+    }

But looks like compiler is correctly throwing away create_dom0() call.

>=20
> Jan


