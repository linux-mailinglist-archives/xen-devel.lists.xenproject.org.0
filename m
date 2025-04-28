Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BE1BA9FA12
	for <lists+xen-devel@lfdr.de>; Mon, 28 Apr 2025 22:00:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971074.1359575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Uel-0001rR-QA; Mon, 28 Apr 2025 20:00:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971074.1359575; Mon, 28 Apr 2025 20:00:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9Uel-0001p6-NH; Mon, 28 Apr 2025 20:00:47 +0000
Received: by outflank-mailman (input) for mailman id 971074;
 Mon, 28 Apr 2025 20:00:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N2FI=XO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u9Uek-0001NN-EJ
 for xen-devel@lists.xenproject.org; Mon, 28 Apr 2025 20:00:46 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7896a3f3-246b-11f0-9eb4-5ba50f476ded;
 Mon, 28 Apr 2025 22:00:45 +0200 (CEST)
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
X-Inumbo-ID: 7896a3f3-246b-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745870444; x=1746129644;
	bh=xFEF3v3nqpLnblIDTmNpviGHSKggOJi+9sVUtsOeU+g=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=iaCUf53/mHF+qikLRTALCyXb/SKRjRQ5y9N2GXB+GuT4gcVveGmpjtr8/1ioc1APT
	 H7BWQ1GVW9j2uXT5R/9eKpvbKpijafAjobxDyrpWxBZ4JLnr9+0wCviIMX3pDIBWSl
	 kpzXkwtZi+8Co7M1ZFMINy0+i75FdTznvbSM0d5n50VY2uv3KwlJqpTDwEWfDAOBpL
	 DYgogDmBXmvfVlDiNv52Dicsb+GZMQSF2sFRGikn6T264d3TQ5IWPoCWFh1hdFvAXf
	 ufgeRqBdOhBOi0LEAMPkGdN5aaUhMsC31TQTcChGayF/NhWykDWbP8ZV98T9fgFGS+
	 yMKHuxjX4OQmA==
Date: Mon, 28 Apr 2025 20:00:39 +0000
To: Jan Beulich <jbeulich@suse.com>
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] xen/domain: unify domain ID allocation
Message-ID: <aA/eZCg797KkhuiC@kraken>
In-Reply-To: <f8be084a-e259-456b-b30d-677b128978e3@suse.com>
References: <20250422215322.521464-1-dmukhin@ford.com> <f8be084a-e259-456b-b30d-677b128978e3@suse.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9533e020d63796825240beb92b9349899a1c81bb
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 11:14:25AM +0200, Jan Beulich wrote:
> On 22.04.2025 23:54, dmkhn@proton.me wrote:
> > --- a/xen/common/domain.c
> > +++ b/xen/common/domain.c
> > @@ -66,6 +66,57 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
> >  static struct domain *domain_hash[DOMAIN_HASH_SIZE];
> >  struct domain *domain_list;
> >
> > +/* Domain ID allocator */
> > +static unsigned int domid_last;
> > +
> > +static inline bool is_free_domid(domid_t dom)
> > +{
> > +    struct domain *d =3D rcu_lock_domain_by_id(dom);
> > +
> > +    if ( d )
> > +        rcu_unlock_domain(d);
> > +
> > +    return !d;
> > +}
> > +
> > +/*
> > + * Allocate new domain ID based on the hint.
> > + *
> > + * If hint is outside of valid [0..DOMID_FIRST_RESERVED - 1] range of =
IDs,
> > + * perform an exhaustive search starting from the end of the used doma=
in ID
> > + * range, excluding hardware_domid.
> > + */
> > +domid_t domid_alloc(domid_t hint)
> > +{
> > +    domid_t domid =3D DOMID_INVALID;
> > +
> > +    if ( hint < DOMID_FIRST_RESERVED )
> > +    {
> > +        /* Exact match. */
> > +        if ( is_free_domid(hint) )
> > +            domid =3D hint;
> > +    }
> > +    else
> > +    {
> > +        for ( domid =3D domid_last + 1; domid !=3D domid_last; domid++=
 )
> > +        {
> > +            if ( domid =3D=3D DOMID_FIRST_RESERVED )
> > +                domid =3D 0;
> > +
> > +            if ( domid =3D=3D hardware_domid )
> > +                continue;
> > +
> > +            if ( is_free_domid(domid) )
> > +                break;
> > +        }
> > +
> > +        if ( domid !=3D domid_last )
> > +            domid_last =3D domid;
> > +    }
> > +
> > +    return domid;
> > +}
>=20
> The function name suggests the ID returned is firmly allocated by the tim=
e
> the caller gets to see / use it. Yet that's not the case. Two back-to-bac=
k
> calls here with the same argument will yield the same result, afaict. Thi=
s
> supports my prior statement that I don't think it is a good idea to
> "centralize" things like this.

I agree, back-to-back call requirement is not implemented, I will fix that.

I think a library service for domain ID allocation will be useful since the=
re
are 2 users of it already and there's one more user of similar functionalit=
y is
on review (hyperlauch DT parsing).

>=20
> Jan


