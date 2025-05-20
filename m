Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B879ABE2AF
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 20:28:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.991010.1374952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHRgi-0002Qr-RR; Tue, 20 May 2025 18:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 991010.1374952; Tue, 20 May 2025 18:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHRgi-0002O1-Of; Tue, 20 May 2025 18:27:40 +0000
Received: by outflank-mailman (input) for mailman id 991010;
 Tue, 20 May 2025 18:27:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UQuu=YE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHRgf-0002Nu-Vn
 for xen-devel@lists.xenproject.org; Tue, 20 May 2025 18:27:38 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1936cdf0-35a8-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 20:27:35 +0200 (CEST)
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
X-Inumbo-ID: 1936cdf0-35a8-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747765653; x=1748024853;
	bh=WC1MszHE5twx3i/Dw9pfsXxHF/3kIN6J1HHv9TON4Ac=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=GV+vGYmoz3F+xx20dXvlyz1rSdESWMIvXsMh2B9VvsHl23FaVeyJMjX0LJTI0XkWP
	 cE0TLt9+OBl7NMVSGjwjwJ1wjqqaleyP8/WyOlkvsZEYydtrLM9o8TQifs0X4eQnMn
	 ON/q0ikN2DHX5IoqRtI1DoGP8r3M0QGSCSQuOeOp9jqcWxQQMxBzvnp6uTZQOmqsZ2
	 7BaFglgjcIzPlEZwdhMpK+SyDFYbP5Of2dnOvKj4ddmRdhEVe3Xprf0s17hX9Bb2uP
	 TLxSfsskjuTnikAuMYMJdb1+LXPtrMnKsFSRsZl6QqQ3bvpfiAGjWwocvppxT0TiJ2
	 HCHrp2uGhD9gQ==
Date: Tue, 20 May 2025 18:27:27 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 3/3] xen/domain: introduce CONFIG_MAX_DOMID
Message-ID: <aCzJiGt9ZUqWPHl4@kraken>
In-Reply-To: <0b7fd522-af98-4ab3-ae6b-ed131ef3bf04@suse.com>
References: <20250519192306.1364471-1-dmukhin@ford.com> <20250519192306.1364471-4-dmukhin@ford.com> <0b7fd522-af98-4ab3-ae6b-ed131ef3bf04@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e2f2d23d42a731d2bcf29b5ee0f144584fd6d6dd
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 08:04:14AM +0200, Jan Beulich wrote:
> On 19.05.2025 21:23, dmkhn@proton.me wrote:
> > From: Denis Mukhin <dmukhin@ford.com>
> >
> > Embedded deployments of Xen do not need to have support for more than d=
ozen of
> > domains.
> >
> > Introduce build-time configuration option to limit the number of domain=
s during
> > run-time.
>=20
> I fear I don't see the (sufficiently meaningful) gain of this. And I must=
 have ...
>=20
> > Suggested-by: Julien Grall <julien@xen.org>
>=20
> ... missed tis earlier suggestion, or else I would have asked the questio=
n already
> there.

The code change is based on the feedback here:

  https://lore.kernel.org/xen-devel/2e5afdf1-3913-4b6f-86ea-21b3ccd0833c@xe=
n.org/

It probably should have been sent as an RFC change.

>=20
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -333,8 +333,9 @@ static int ffa_domain_init(struct domain *d)
> >       */
> >      BUILD_BUG_ON(DOMID_FIRST_RESERVED >=3D UINT16_MAX);
> >      BUILD_BUG_ON((DOMID_MASK & BIT(15, U)) !=3D 0);
> > +    BUILD_BUG_ON(DOMID_FIRST_RESERVED < CONFIG_MAX_DOMID);
>=20
> We want this check, yes, but in common code. It's entirely unrelated to A=
rm's TEE.
>=20
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -576,4 +576,11 @@ config BUDDY_ALLOCATOR_SIZE
> >  =09  Amount of memory reserved for the buddy allocator to serve Xen he=
ap,
> >  =09  working alongside the colored one.
> >
> > +config MAX_DOMID
> > +=09int "Maximum number of non-system domains"
>=20
> Hmm, without clarifying what a system domain is (is hwdom one? is a contr=
ol
> domain one), I fear this may be ambiguous to users.
>=20
> Jan
>=20


