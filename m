Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A88CBA97AAE
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 00:50:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963734.1354682 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7MR6-0006Tv-KS; Tue, 22 Apr 2025 22:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963734.1354682; Tue, 22 Apr 2025 22:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7MR6-0006RW-Ga; Tue, 22 Apr 2025 22:49:52 +0000
Received: by outflank-mailman (input) for mailman id 963734;
 Tue, 22 Apr 2025 22:49:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8D33=XI=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u7MR3-0006RO-Sp
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 22:49:50 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10c05767-1fcc-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 00:49:36 +0200 (CEST)
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
X-Inumbo-ID: 10c05767-1fcc-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745362175; x=1745621375;
	bh=7Tiu9Iu1Vf6mewfEGQrmZmHxsU95Kc/YwPjUiSH05w4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=K5h5/rhOY7C6gRlAj11s/UcRLetoWuY72036pIxzrZBtTkib2bsqUgdwcGi9quU3s
	 1bIkvpFseiPjmExSPGrft09aPX2MEPaTo4O4xwd/ego0QX3Afu84LoF+octPpO7u/Y
	 VF67WR4k96Tg5/RCpgk9m5827idGeT7vTuLCt1i37sZwPvIyG/MIus3XHp4cekJ+FV
	 FFXf4Dh7QXiNiavxEksGqqEK8XmaydVRx0acnhJbSv/KV2LgFBLaKIgXQiTC+/AzDi
	 3GEAzbWKxaib6iXLkS8qm10swQWSPnYsakA+KFeJ692hOvqVnKzG+92tBQYLt0/rt4
	 Gby9+aSTykRFw==
Date: Tue, 22 Apr 2025 22:49:30 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: Re: [PATCH v1 2/3] x86/domain: add helpers to simplify emulation flags management
Message-ID: <aAgc9H6mxOvnZXk9@starscream>
In-Reply-To: <d21969b3-a48c-4d80-a8a9-5d04b67ed90f@suse.com>
References: <20250401005224.461325-1-dmukhin@ford.com> <20250401005224.461325-3-dmukhin@ford.com> <d21969b3-a48c-4d80-a8a9-5d04b67ed90f@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 1f525c738878c15c8e17a810db24e85360b321da
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 08, 2025 at 05:23:17PM +0200, Jan Beulich wrote:
> On 01.04.2025 02:52, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Introduce XEN_X86_EMU_BASELINE and XEN_X86_EMU_OPTIONAL to simplify
> > d->arch.emulation_flags management in the code.
>=20
> If the simplification is limited to ...
>=20
> > --- a/tools/python/xen/lowlevel/xc/xc.c
> > +++ b/tools/python/xen/lowlevel/xc/xc.c
> > @@ -159,9 +159,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
> >
> >  #if defined (__i386) || defined(__x86_64__)
> >      if ( config.flags & XEN_DOMCTL_CDF_hvm )
> > -        config.arch.emulation_flags =3D XEN_X86_EMU_ALL &
> > -                                      ~(XEN_X86_EMU_VPCI |
> > -                                        XEN_X86_EMU_USE_PIRQ);
> > +        config.arch.emulation_flags =3D XEN_X86_EMU_BASELINE;
> >  #elif defined (__arm__) || defined(__aarch64__)
> >      config.arch.gic_version =3D XEN_DOMCTL_CONFIG_GIC_NATIVE;
> >  #else
>=20
> ... just this, I'm not convinced that's worth introducing yet two more it=
ems
> into the namespace.

Sorry, it took me a while to get back to the series.

The X86_EMU_BASELINE mask is used in two places: in the toolstack (xc.c) an=
d
in domain.c, emulation_flags_ok(), so adding a new flag may require updates
in two places.

Perhaps it will be better to merge this patch 2 with patch 3 to highlight t=
hat?=20

>=20
> > --- a/xen/include/public/arch-x86/xen.h
> > +++ b/xen/include/public/arch-x86/xen.h
> > @@ -290,6 +290,13 @@ struct xen_arch_domainconfig {
> >                                       XEN_X86_EMU_VGA | XEN_X86_EMU_IOM=
MU |   \
> >                                       XEN_X86_EMU_PIT | XEN_X86_EMU_USE=
_PIRQ |\
> >                                       XEN_X86_EMU_VPCI)
> > +
> > +#define XEN_X86_EMU_OPTIONAL        (XEN_X86_EMU_VPCI | \
> > +                                     XEN_X86_EMU_USE_PIRQ)
> > +
> > +#define XEN_X86_EMU_BASELINE        (XEN_X86_EMU_ALL & ~XEN_X86_EMU_OP=
TIONAL)
> > +
> > +    /* Hardware emulation flags. */
> >      uint32_t emulation_flags;
>=20
> The comment isn't quite accurate here (and hence perhaps also not in the
> earlier patch): XEN_X86_EMU_USE_PIRQ isn't exactly about emulation of any=
thing
> hardware-ish.
>=20
> Jan


