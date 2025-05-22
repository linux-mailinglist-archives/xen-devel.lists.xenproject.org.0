Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FC4AC011E
	for <lists+xen-devel@lfdr.de>; Thu, 22 May 2025 02:11:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.992686.1376313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHtVc-00065m-Fs; Thu, 22 May 2025 00:10:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 992686.1376313; Thu, 22 May 2025 00:10:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHtVc-00063C-CI; Thu, 22 May 2025 00:10:04 +0000
Received: by outflank-mailman (input) for mailman id 992686;
 Thu, 22 May 2025 00:10:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=45pF=YG=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uHtVZ-0005Te-Cq
 for xen-devel@lists.xenproject.org; Thu, 22 May 2025 00:10:02 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18f2aaea-36a1-11f0-b892-0df219b8e170;
 Thu, 22 May 2025 02:09:58 +0200 (CEST)
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
X-Inumbo-ID: 18f2aaea-36a1-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747872596; x=1748131796;
	bh=8SGp7iqkXDG1CAs0VeJxvwQn3LebWCkVpH6lLj3zYmM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=S39zSfRr0VHR3ES902M1mHiw85KlyXLcTe5iIeXD6DzrOGg00dGKroE575QNkavp2
	 d/hFGT726vAsEyR05h6L37a0ie+DQRSVGFS/bazga00CcJhVEnXLQktisOOGG2JJZ5
	 FOwfhxXjWMzE5f79wDkszGwbc0pypnWk5VvGBXUUtmugMjj8YvsTL8xwTTgH4g6+VU
	 ktAUwYHaMFiBXYCiG9n/TunrMJq2ng1/s4obFdNsVf28Ut3LV2ChcCNM3hCM1JsGgF
	 MXgkxMVXzMB+MPpNVDZTpCx2IOWHJwZbp4Wrp51zVfn9/4dGHc1nXzYBn6481rbOUL
	 j5R7+Y4Cg9rDQ==
Date: Thu, 22 May 2025 00:09:49 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, teddy.astie@vates.tech, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v8 3/3] xen/domain: introduce CONFIG_MAX_DOMID
Message-ID: <aC5rRwyN51pdRRCM@kraken>
In-Reply-To: <54945bd5-333e-4ffd-8ff1-bb89d22c7ef4@suse.com>
References: <20250521000024.2944685-1-dmukhin@ford.com> <20250521000024.2944685-4-dmukhin@ford.com> <54945bd5-333e-4ffd-8ff1-bb89d22c7ef4@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: def13c5d2fef9ab1ee42ce23559f2b90b90c2703
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 09:31:34AM +0200, Jan Beulich wrote:
> On 21.05.2025 02:00, dmkhn@proton.me wrote:
> > --- a/xen/arch/arm/tee/ffa.c
> > +++ b/xen/arch/arm/tee/ffa.c
> > @@ -331,10 +331,9 @@ static int ffa_domain_init(struct domain *d)
> >       * reserved for the hypervisor and we only support secure endpoint=
s using
> >       * FF-A IDs with BIT 15 set to 1 so make sure those are not used b=
y Xen.
> >       */
> > -    BUILD_BUG_ON(DOMID_FIRST_RESERVED >=3D UINT16_MAX);
>=20
> Why's this being moved to common code? It certainly may have a purpose he=
re
> (which I'm simply unaware of); I don't see what purpose it has in common
> code.

My understanding having DOMID_FIRST_RESERVED compile-time checks in one pla=
ce
is good for testability: the check in question also applies to x86.

I will drop that hunk.

>=20
> > --- a/xen/common/Kconfig
> > +++ b/xen/common/Kconfig
> > @@ -576,4 +576,11 @@ config BUDDY_ALLOCATOR_SIZE
> >  =09  Amount of memory reserved for the buddy allocator to serve Xen he=
ap,
> >  =09  working alongside the colored one.
> >
> > +config MAX_DOMID
> > +=09int "Maximum number of user domains"
> > +=09range 1 32752
> > +=09default 32752
> > +=09help
> > +=09  Specifies the maximum number of domains a user can create.
>=20
> My prior comment remains: The description and help needs to be accurate, =
in
> order to not cause any confusion. In a true dom0less environment I'm not
> sure the "user" can create any domains (post boot, that is). And when the=
re
> is Dom0 (or late hwdom), the number specified already isn't the number of
> domains one can create (again, post boot, which is how I understand "user
> domains"). If someone picked 1 as the value here, it's unclear to me how
> late hwdom or dom0less would work in the first place.

Do you think something like the following will be more accurate?

    config MAX_DOMID
       int "Maximum number of domains"
       range 1 32752
       default 32752
       help
         Specifies the maximum number of domains: dom0 or late hwdom,
         predefined domains, post-boot domains, excluding Xen system domain=
s
         (domid >=3D DOMID_FIRST_RESERVED).

>=20
> > --- a/xen/include/public/domctl.h
> > +++ b/xen/include/public/domctl.h
> > @@ -36,7 +36,7 @@
> >
> >  /*
> >   * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> > - * If it is specified as an invalid value (0 or >=3D DOMID_FIRST_RESER=
VED),
> > + * If it is specified as an invalid value (0 or >=3D CONFIG_MAX_DOMID)=
,
>=20
> In the public interface I question the relevance of any implementation
> details of the hypervisor.

Ack, will revert.

>=20
> Jan
>=20


