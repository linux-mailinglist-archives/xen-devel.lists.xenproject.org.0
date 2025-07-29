Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE2B15625
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 01:54:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063248.1429036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugu9g-0000YH-2I; Tue, 29 Jul 2025 23:54:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063248.1429036; Tue, 29 Jul 2025 23:54:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugu9f-0000WM-VW; Tue, 29 Jul 2025 23:54:47 +0000
Received: by outflank-mailman (input) for mailman id 1063248;
 Tue, 29 Jul 2025 23:54:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TdY=2K=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1ugu9e-0000V7-Rw
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 23:54:46 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64bc5422-6cd7-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 01:54:41 +0200 (CEST)
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
X-Inumbo-ID: 64bc5422-6cd7-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ijraq2ebmvbk5aj64lgqwnlrmu.protonmail; t=1753833280; x=1754092480;
	bh=Jmn/N2jN4v/bzmZbQujHVL5JNroLGBW2dnq0lTYJhJk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mFj9ySjtWob5MiYjfOFRQ9g2Oytme2hzgZr0IvGIE9iRkBkz+sSILxN9FSeUBiA/r
	 UqpB5Znknl/ApUniNZT1fA4T6sbiT3aL4KAu4S7evzf557kSYmf4IHwtG4BjYopIB8
	 oHoW1xPNXQgevs9NAVaPO9zxAnFx3QfAF1Iuim/kyq8r1QFVBecR8qhCFh2I9MTj7F
	 tO12ON5988u/r3fsnfvLiDPnwOgnOO0iSP9qIEiUOwk5Vn0QCPITIt4RenzgHNsOFo
	 OkHnoV2m7fsPmEy8zEP7G5LSRwgmLjeqDEKXX6A2pUAEQIc1TcuawK4drIuBd+Hk8Q
	 knVepFLg0+dpA==
Date: Tue, 29 Jul 2025 23:54:36 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: alejandro.garciavallejo@amd.com, andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v11 3/3] xen/domain: update create_dom0() messages
Message-ID: <aIlfOPUaPcmYKu2G@kraken>
In-Reply-To: <7fadf942-39ff-42b7-ba32-c37ad65fa5cc@suse.com>
References: <20250728183427.1013975-1-dmukhin@ford.com> <20250728183427.1013975-4-dmukhin@ford.com> <7fadf942-39ff-42b7-ba32-c37ad65fa5cc@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 8d3f93574144642f18743205c232426073ab63ca
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 29, 2025 at 10:11:31AM +0200, Jan Beulich wrote:
> On 28.07.2025 20:34, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Use %pd for domain identification in error/panic messages in create_dom=
0().
>=20
> Except that ...
>=20
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -2081,17 +2081,17 @@ void __init create_dom0(void)
> >
> >      dom0 =3D domain_create(domid, &dom0_cfg, flags);
> >      if ( IS_ERR(dom0) )
> > -        panic("Error creating domain 0 (rc =3D %ld)\n", PTR_ERR(dom0))=
;
> > +        panic("Error creating d%d (rc =3D %ld)\n", domid, PTR_ERR(dom0=
));
>=20
> ... here you don't (and can't). To avoid people wondering when they later

Thanks for catching this! Will update.

> come across a commit, I think descriptions would better be accurate. It'l=
l
> be Arm maintainers to judge whether they let you get away with this; as i=
t
> covers x86 only anyway:
> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks!

>=20
> Jan


