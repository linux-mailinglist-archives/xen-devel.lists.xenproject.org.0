Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC7B358E7
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 11:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094198.1449541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpz9-00006N-3H; Tue, 26 Aug 2025 09:28:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094198.1449541; Tue, 26 Aug 2025 09:28:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqpz8-0008Uw-W4; Tue, 26 Aug 2025 09:28:58 +0000
Received: by outflank-mailman (input) for mailman id 1094198;
 Tue, 26 Aug 2025 09:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vqZn=3G=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uqpz8-0008Uq-4D
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 09:28:58 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 168e56df-825f-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 11:28:56 +0200 (CEST)
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
X-Inumbo-ID: 168e56df-825f-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1756200535; x=1756459735;
	bh=mslmXK9OHNVpn2/Ea4D4mpHnKQGLhDxpdMaHjoTheO8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=SwNQIsFoqwEWlWtpeUyjMHPG+KOW45IQ6LAgEWQIq1o/s43R1G0iFksK1NiYRiIHZ
	 xjAXLH1kLXImwyxP8mSGgKTZjJ3YWWbjCYMR2WxcrfMoau+uX3Jfyg2EnPjRlKekqv
	 X1s/K0Sfk5+zgEpi+whNU5iIDOCBBJftS1ZXG0Q3cKDUE0O4Bp0dfUq36ub0i5JLOy
	 +Eoj7EPuM/1/zsFLbMtYGThXP1swUDZwPPaYKbhT4CebYsRRcqn70J4Mbp8bFERNMw
	 Y8oOe6WhRgehbZX2MWSwrj+AJeLkcQuh6tpMtJLKluEtuGyvtzlW2Ptg4RFs9k5Bqa
	 C/k9IhKfP5i8w==
Date: Tue, 26 Aug 2025 09:28:52 +0000
To: Anthony PERARD <anthony@xenproject.org>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v16 2/4] tools/include: move xc_bitops.h to xen-tools/bitops.h
Message-ID: <aK1+MmANufLb+XeR@kraken>
In-Reply-To: <aKwtLMAslH6v5L82@l14>
References: <20250812223024.2364749-1-dmukhin@ford.com> <20250812223024.2364749-3-dmukhin@ford.com> <aKwtLMAslH6v5L82@l14>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0816d20ab31612ba51f59f95bca9c66246c8e6e8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 25, 2025 at 11:30:20AM +0200, Anthony PERARD wrote:
> On Tue, Aug 12, 2025 at 10:30:45PM +0000, dmkhn@proton.me wrote:
> > diff --git a/tools/libs/guest/xg_dom_elfloader.c b/tools/libs/guest/xg_=
dom_elfloader.c
> > index f17930d98bf7..8531e90f8e21 100644
> > --- a/tools/libs/guest/xg_dom_elfloader.c
> > +++ b/tools/libs/guest/xg_dom_elfloader.c
> > @@ -25,8 +25,9 @@
> >  #include <stdarg.h>
> >  #include <inttypes.h>
> >
> > +#include <xen-tools/bitops.h>
>=20
> It doesn't looks like xg_dom_elfloader.c is using anything from
> bitops.h. The last use of it was probably removed in ed04ca95981f
> ("libelf: rewrite symtab/strtab loading")

Ack.

>=20
> > +
> >  #include "xg_private.h"
> > -#include "xc_bitops.h"
> >
> >  #define XEN_VER "xen-3.0"
> >
> > diff --git a/tools/libs/guest/xg_dom_hvmloader.c b/tools/libs/guest/xg_=
dom_hvmloader.c
> > index 39e1e5f579a7..0f569c20c522 100644
> > --- a/tools/libs/guest/xg_dom_hvmloader.c
> > +++ b/tools/libs/guest/xg_dom_hvmloader.c
> > @@ -24,8 +24,9 @@
> >  #include <inttypes.h>
> >  #include <assert.h>
> >
> > +#include <xen-tools/bitops.h>
> > +
>=20
> I think there's two reason to remove this include:
> - it doesn't looks like xg_dom_hvmloader.c is using any macro from it.
> - bitops.h is already included by xg_private.h.

Will remove.

>=20
>=20
> >  #include "xg_private.h"
> > -#include "xc_bitops.h"
> >
> >  /* -------------------------------------------------------------------=
----- */
> >  /* parse elf binary                                                   =
      */
> > diff --git a/tools/libs/guest/xg_sr_common.h b/tools/libs/guest/xg_sr_c=
ommon.h
> > index 2f058ee3a6ff..2e583f2eac72 100644
> > --- a/tools/libs/guest/xg_sr_common.h
> > +++ b/tools/libs/guest/xg_sr_common.h
> > @@ -2,11 +2,10 @@
> >  #define __COMMON__H
> >
> >  #include <stdbool.h>
> > +#include <xen-tools/bitops.h>
>=20
> It's already included in xg_private.h, so this feels unnecessary.

Ack.

> >
> >  #include "xg_private.h"
> >  #include "xg_save_restore.h"
> > -#include "xc_bitops.h"
> > -
>=20
>=20
> If the extraneous includes could be removed, that would be nice. In
> anycase:
> Acked-by: Anthony PERARD <anthony.perard@vates.tech>

Thanks

>=20
> Thanks,
>=20
> --
> Anthony PERARD
>=20


