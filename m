Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E5CACFC63
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 08:08:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007858.1387033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQEX-0005nV-M0; Fri, 06 Jun 2025 06:07:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007858.1387033; Fri, 06 Jun 2025 06:07:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNQEX-0005lF-J0; Fri, 06 Jun 2025 06:07:17 +0000
Received: by outflank-mailman (input) for mailman id 1007858;
 Fri, 06 Jun 2025 06:07:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fxa/=YV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uNQEU-0005l7-TD
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 06:07:16 +0000
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch
 [109.224.244.16]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d423395-429c-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 08:07:13 +0200 (CEST)
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
X-Inumbo-ID: 7d423395-429c-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749190032; x=1749449232;
	bh=N8xZEme2Mh/YhfBG/P9ruymjFMKE8qF7nI9WILeO5WA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QbzS0SEsZXhf/y7UZK+ksd0rUz9azPN0hlkl5AtjbvMj1FVfWwJSGtuTwe+7HOprb
	 Nplj/jLPjjYS1k7LC6mbeNUu8+uDaFTTc5OCuFmKK7ztayBJSsr+ev0y5yD/aflFNL
	 MbvlqHgpGaT2fsQTR693Uj55ePlW6aUIDE0BFxCFDFK5N3hgxU0GNylV1ejpHpOc3Q
	 4bnBuiQMb8JRTIAAWcsU0H5Hmkd0G2lJj67XeWDJUORbzy/4NjisYxAoDe48dnQ5eW
	 o1RvkC5o5njjGHchG/ShkSFv2vlL/2+jZrm02iHuyvZ166sG7Rh935Ja4irq9sJTCq
	 JkrHBL8Y1ygpw==
Date: Fri, 06 Jun 2025 06:07:06 +0000
To: Julien Grall <julien@xen.org>
From: dmkhn@proton.me
Cc: Jan Beulich <jbeulich@suse.com>, andrew.cooper3@citrix.com, anthony.perard@vates.tech, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 3/4] xen/console: remove max_init_domid dependency
Message-ID: <aEKFgz11p5PoG0Qt@kraken>
In-Reply-To: <d421b800-d5fe-4b47-9c3e-da0d1df68ab6@xen.org>
References: <20250530231841.73386-1-dmukhin@ford.com> <20250530231841.73386-4-dmukhin@ford.com> <efbd8839-7556-498e-963b-8a04c1ec42bf@suse.com> <d421b800-d5fe-4b47-9c3e-da0d1df68ab6@xen.org>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 877e604a28035a8d8076cc6aba3c0a1639f3d8f3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 05, 2025 at 11:20:32PM +0100, Julien Grall wrote:
> Hi Jan,
>=20
> On 04/06/2025 13:55, Jan Beulich wrote:
> > On 31.05.2025 01:19, dmkhn@proton.me wrote:
> >> --- a/xen/common/domain.c
> >> +++ b/xen/common/domain.c
> >> @@ -2461,6 +2461,39 @@ void domid_free(domid_t domid)
> >>       spin_unlock(&domid_lock);
> >>   }
> >>
> >> +/*
> >> + * Find the ID of the next possible console owner domain.
> >> + *
> >> + * @return Domain ID: DOMID_XEN or non-system domain IDs within
> >> + * the range of [0..DOMID_FIRST_RESERVED-1].
> >> + */
> >> +domid_t domid_find_with_input_allowed(domid_t hint)
> >> +{
> >> +    domid_t domid =3D DOMID_XEN;
> >> +
> >> +    if ( hint < DOMID_FIRST_RESERVED )
> >> +    {
> >> +        struct domain *d;
> >> +
> >> +        rcu_read_lock(&domlist_read_lock);
> >> +
> >> +        for ( d =3D domid_to_domain(hint);
> >
> > If the domain with ID "hint" went away, what is being switched to chang=
es
> > compared to behavior prior to this patch, if I'm not mistaken. While th=
is
> > _may_ be acceptable, not saying so in the description is imo a no-go.
> >
> >> +              d && get_domain(d) && d->domain_id < DOMID_FIRST_RESERV=
ED;
> >
> > What's the DOMID_FIRST_RESERVED check for? And where's the put_domain()
> > for the get_domain() here?
> >
> >> +              d =3D rcu_dereference(d->next_in_list) )
> >> +        {
> >> +            if ( d->console.input_allowed )
> >> +            {
> >> +                domid =3D d->domain_id;
> >> +                break;
> >> +            }
> >> +        }
> >> +
> >> +        rcu_read_unlock(&domlist_read_lock);
> >> +    }
> >> +
> >> +    return domid;
> >> +}
> >
> > My concern remains: With many domains, the loop here may take quite a f=
ew
> > iterations. That's even more concerning because it regresses right away=
 in
> > environments where along with boot-time created domains (eligible for
> > console focus) later further domains are created (non of which are elig=
ible
> > for console focus). That is, the step from last boot-time created back =
to
> > DOMID_XEN may now take excessively long.
>=20
> +1. I vaguely recall making the same concern earlier in the review. One
> possibility would be to have a list of domains where the console is
> supported. I don't think it would be necessary to have the list sorted
> as I view the console switching a debug facility.

Jan, Julien,

Thanks for the feedback!
Will rework.

>=20
> Cheers,
>=20
> --
> Julien Grall
>=20
>=20


