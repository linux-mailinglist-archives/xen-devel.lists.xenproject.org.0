Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D8EAE72A3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 00:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1024175.1400190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUCXY-0002v7-Lc; Tue, 24 Jun 2025 22:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1024175.1400190; Tue, 24 Jun 2025 22:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUCXY-0002sf-Ij; Tue, 24 Jun 2025 22:54:56 +0000
Received: by outflank-mailman (input) for mailman id 1024175;
 Tue, 24 Jun 2025 22:54:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uUCXV-0002sD-NY
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 22:54:54 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cc0a5fd-514e-11f0-a30f-13f23c93f187;
 Wed, 25 Jun 2025 00:54:52 +0200 (CEST)
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
X-Inumbo-ID: 3cc0a5fd-514e-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750805691; x=1751064891;
	bh=SKwtyaV8cOlnunCeb+0okvgr6dv0f3K+ukAufcNG6Pw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Fs26RKQ1YTleb7bzdAaoQroH8MLr6l59J+6la4HXsKUy3VizS/Bnpetb17t7nx+3b
	 9P0qVgD70kCfJ2UNpLEhBD2QqCfdy6aJR2s7RZgtEpKaKnBIjFm5/qFRMPgNSLoVRj
	 XeFW9Lj0aK0gh7bNAlhVL9Vrt9plXqL8CksXWLE1HalpbMGIJMVTQeaXuh+buSqyNi
	 3RMk3uMS+97+kEDCC3/aiYVOccO29Mt3USG25py9iXRG/VYnwrVin7xCVYVZcE3nUE
	 8EnifkxExLOg6ScWmYK91flB+McfLJ6qi/QpBVOQXm8TB1TpAHqxQUIc3G6W9KTf2n
	 iTuY8vUtmnM+w==
Date: Tue, 24 Jun 2025 22:54:45 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v1 14/16] drivers/vuart: move simple MMIO-based UART emulator
Message-ID: <aFsssYQu1GcuvjPv@kraken>
In-Reply-To: <6d33355c-477f-4ef3-8f17-b7f1dd1164ce@suse.com>
References: <20250624035443.344099-1-dmukhin@ford.com> <20250624035443.344099-15-dmukhin@ford.com> <6e6c8664-2ff6-484d-bd47-7ee12c449f9e@suse.com> <aFpViicgGigZPFNv@kraken> <6d33355c-477f-4ef3-8f17-b7f1dd1164ce@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 66105701014664e1d1feb02ae7cca8b61ac1c785
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 09:40:02AM +0200, Jan Beulich wrote:
> On 24.06.2025 09:36, dmkhn@proton.me wrote:
> > On Tue, Jun 24, 2025 at 07:53:04AM +0200, Jan Beulich wrote:
> >> On 24.06.2025 05:57, dmkhn@proton.me wrote:
> >>> --- a/xen/drivers/vuart/Kconfig
> >>> +++ b/xen/drivers/vuart/Kconfig
> >>> @@ -3,6 +3,15 @@ config HAS_VUART
> >>>
> >>>  if (ARM_32 || ARM_64)
> >>>
> >>> +config HAS_VUART_MMIO
> >>> +=09bool "Simple MMIO-based emulated UART support"
> >>
> >> Perhaps in a separate change this should be renamed. HAS_* should neve=
r
> >> have prompts.
> >
> > Oh, so HAS_ flags are non-interactive selectors by design?
>=20
> Well "has" simply by the word means "this is available". Any user-selecta=
ble item
> deriving from the mere availability would then have a "depends on HAS_...=
", thus
> hiding the option in situation where the functionality isn't available (b=
e it per
> arch or for other reasons).

I see there's a lot of drivers (UARTs) which are selectable by the user via
HAS_ symbols (drivers/char/Kconfig), e.g:

CONFIG_HAS_NS16550:                                                        =
                                                                           =
                                                     =E2=94=82 =20
  =E2=94=82                                                                =
                                                                           =
                                                                 =E2=94=
=82 =20
  =E2=94=82 This selects the 16550-series UART support. For most systems, s=
ay Y.                                                                      =
                                                                 =E2=94=
=82 =20
  =E2=94=82                                                                =
                                                                           =
                                                                 =E2=94=
=82 =20
  =E2=94=82 Symbol: HAS_NS16550 [=3Dy]                                     =
                                                                           =
                                                                   =
=E2=94=82 =20
  =E2=94=82 Type  : bool                                                   =
                                                                           =
                                                                 =E2=94=
=82 =20
  =E2=94=82 Prompt: NS16550 UART driver                                    =
                                                                           =
                                                                 =E2=94=
=82 =20
  =E2=94=82   Location:                                                    =
                                                                           =
                                                                 =E2=94=
=82 =20
  =E2=94=82     -> Device Drivers                                          =
                                                                           =
                                                                 =E2=94=
=82 =20
  =E2=94=82   Defined at drivers/char/Kconfig:4=20

>=20
> Jan


