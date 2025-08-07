Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FBCB1DD40
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 20:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073648.1436526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5pk-00012i-Qx; Thu, 07 Aug 2025 18:59:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073648.1436526; Thu, 07 Aug 2025 18:59:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk5pk-000113-O5; Thu, 07 Aug 2025 18:59:24 +0000
Received: by outflank-mailman (input) for mailman id 1073648;
 Thu, 07 Aug 2025 18:59:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ybbA=2T=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uk5pj-00010B-H1
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 18:59:23 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0946138-73c0-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 20:59:21 +0200 (CEST)
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
X-Inumbo-ID: a0946138-73c0-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1754593160; x=1754852360;
	bh=DCrlIMUi9fecDJincYq57PU4LJ4nmeQwJeAkX/k33qw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ArL7EWbozKO09O4aCyJ1i24LklEjTk68/M4jJsJV2hXBGRmZ5Gm2V9Kif0UG+RPxV
	 bHw1G8Lhlc60pKDws1JHuoOlgmstdGPsZoVH2nEyytfQrv+jCq6lG/HsiAV2GkqNcI
	 7A64c13w/EU7VSPesKjEKhCjfC5/ZXkrx/o7AiyY1vTMwWbfTk6zmuIgN+JM8qDZvd
	 OViPEuHb53i6ZONN59zKd0XN3B8Q+7iKKhJNY+0+yO3XOY6clyc7M8Kj9kHN5Xi9Kn
	 eC5TIssuRm/mxaMzNgiSi0rFqfrl7kyTt7kmLNd+cmcLSziiHvQfywYazexrdF3Nlo
	 a281Ap108W9TQ==
Date: Thu, 07 Aug 2025 18:59:17 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 3/8] x86/domain: allocate d->{iomem,irq}_caps before arch-specific initialization
Message-ID: <aJT3gDRsynTqUlx6@kraken>
In-Reply-To: <032daad1-29a0-48ca-9f50-5234d42a3ea1@suse.com>
References: <20250731192130.3948419-1-dmukhin@ford.com> <20250731192130.3948419-4-dmukhin@ford.com> <032daad1-29a0-48ca-9f50-5234d42a3ea1@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: ecd36905f95ede267fee9578c34aa46fa07ebfe9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 04, 2025 at 12:20:11PM +0200, Jan Beulich wrote:
> On 31.07.2025 21:21, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Move IRQ/IOMEM rangesets allocation before arch_domain_create().
> >
> > That guarantees that arch-specific code could access those rangesets to
> > register traps for emulation.
> >
> > It is necessary for those emulators registering trap handlers and ensur=
ing
> > that emulated IRQs are not shared with the physical IRQs.
> >
> > Move dom0_setup_permissions() call right after I/O rangesets are alloca=
ted.
> >
> > Move pvh_setup_mmcfg() inside dom0_setup_permissions() close to the pla=
ce
> > where MMCFG ranges are initialized.
>=20
> And this is just because you like doing so? I ask because first and forem=
ost
> I can't make the connection between this and the purpose of this patch.

No, that is a bad leftover from the MMIO-based emulator.

>=20
> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -471,6 +471,24 @@ static void __init process_dom0_ioports_disable(st=
ruct domain *dom0)
> >      }
> >  }
> >
> > +static void __hwdom_init setup_mmcfg(struct domain *d)
>=20
> Why __hwdom_init when ...
>=20
> > @@ -480,6 +498,14 @@ int __init dom0_setup_permissions(struct domain *d=
)
> >      if ( pv_shim )
> >          return 0;
> >
> > +    /*
> > +     * MMCFG initialization must be performed before setting domain
> > +     * permissions, as the MCFG areas must not be part of the domain I=
OMEM
> > +     * accessible regions.
> > +     */
> > +    if ( is_hvm_domain(d) )
> > +        setup_mmcfg(d);
>=20
> ... the sole caller is __init?
>=20
> Jan


