Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2180ACFD2A
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 08:59:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1007948.1387133 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNR3I-0000fh-HM; Fri, 06 Jun 2025 06:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1007948.1387133; Fri, 06 Jun 2025 06:59:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNR3I-0000eF-ET; Fri, 06 Jun 2025 06:59:44 +0000
Received: by outflank-mailman (input) for mailman id 1007948;
 Fri, 06 Jun 2025 06:59:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fxa/=YV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uNR3H-0000e9-3S
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 06:59:43 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d13a7422-42a3-11f0-b894-0df219b8e170;
 Fri, 06 Jun 2025 08:59:40 +0200 (CEST)
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
X-Inumbo-ID: d13a7422-42a3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749193179; x=1749452379;
	bh=yrBq7J3abC+2OEi32nZd7QSjmZdO+4cFXKHZuZxtBLc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=a8T6TF588a2ZnhxpEScnjeVD2kuoAYuIzVPC7VxZ7diPn+wIDWNYOsVd7k3SmETwe
	 2KDsZMiLe8C/Ng18Ngq6DnBGGFJvNToemawoY40bNjXjCmnUukkMQs7i0GTmXLQ96H
	 5dUYQlG9jGFkhYRLfM78xLTUZDipsywvxOFX1BXm/bmOV6h0vKvxEydtKfaiZHOlO1
	 OBiVBR5BCa+D/CVMnxtj/fXTKjAMlv33kf4D4EDG9yxTtB3bnUQ5nDphyWLCurLpBN
	 /lYSRCVB+LS84lUaLt3y8sNrEe/8xlbHPBtTgl979kJAvm+CBju2J32ljOwVyEE2rq
	 txhF5HarB2hKA==
Date: Fri, 06 Jun 2025 06:59:34 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 3/4] xen/console: remove max_init_domid dependency
Message-ID: <aEKR0HYon3j3HHxQ@kraken>
In-Reply-To: <efbd8839-7556-498e-963b-8a04c1ec42bf@suse.com>
References: <20250530231841.73386-1-dmukhin@ford.com> <20250530231841.73386-4-dmukhin@ford.com> <efbd8839-7556-498e-963b-8a04c1ec42bf@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 91d1e15326ea1fc77aa2080c4ab4b00bf6c94818
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2025 at 02:55:40PM +0200, Jan Beulich wrote:
> On 31.05.2025 01:19, dmkhn@proton.me wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -2461,6 +2461,39 @@ void domid_free(domid_t domid)
> >      spin_unlock(&domid_lock);
> >  }
> >
> > +/*
> > + * Find the ID of the next possible console owner domain.
> > + *
> > + * @return Domain ID: DOMID_XEN or non-system domain IDs within
> > + * the range of [0..DOMID_FIRST_RESERVED-1].
> > + */
> > +domid_t domid_find_with_input_allowed(domid_t hint)
> > +{
> > +    domid_t domid =3D DOMID_XEN;
> > +
> > +    if ( hint < DOMID_FIRST_RESERVED )
> > +    {
> > +        struct domain *d;
> > +
> > +        rcu_read_lock(&domlist_read_lock);
> > +
> > +        for ( d =3D domid_to_domain(hint);
>=20
> If the domain with ID "hint" went away, what is being switched to changes
> compared to behavior prior to this patch, if I'm not mistaken. While this
> _may_ be acceptable, not saying so in the description is imo a no-go.

Will correct, thanks.

>=20
> > +              d && get_domain(d) && d->domain_id < DOMID_FIRST_RESERVE=
D;
>=20
> What's the DOMID_FIRST_RESERVED check for? And where's the put_domain()
> for the get_domain() here?
>=20
> > +              d =3D rcu_dereference(d->next_in_list) )
> > +        {
> > +            if ( d->console.input_allowed )
> > +            {
> > +                domid =3D d->domain_id;
> > +                break;
> > +            }
> > +        }
> > +
> > +        rcu_read_unlock(&domlist_read_lock);
> > +    }
> > +
> > +    return domid;
> > +}
>=20
> My concern remains: With many domains, the loop here may take quite a few
> iterations. That's even more concerning because it regresses right away i=
n
> environments where along with boot-time created domains (eligible for
> console focus) later further domains are created (non of which are eligib=
le
> for console focus). That is, the step from last boot-time created back to
> DOMID_XEN may now take excessively long.

Julien in the other reply suggested to have a list of domains with console
input permission only. Will rework.

>=20
> Jan


