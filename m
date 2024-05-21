Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65AA8CB16D
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 17:34:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726984.1131376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9RV3-0000s6-Py; Tue, 21 May 2024 15:34:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726984.1131376; Tue, 21 May 2024 15:34:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9RV3-0000pk-ND; Tue, 21 May 2024 15:34:01 +0000
Received: by outflank-mailman (input) for mailman id 726984;
 Tue, 21 May 2024 15:33:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TC+7=MY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s9RV1-0000pe-Du
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 15:33:59 +0000
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com
 [103.168.172.146]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 897633fa-1787-11ef-909f-e314d9c70b13;
 Tue, 21 May 2024 17:33:57 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfout.nyi.internal (Postfix) with ESMTP id 09C0F138151B;
 Tue, 21 May 2024 11:33:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 21 May 2024 11:33:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 May 2024 11:33:54 -0400 (EDT)
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
X-Inumbo-ID: 897633fa-1787-11ef-909f-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1716305636;
	 x=1716392036; bh=vFl4+lxzr6JyOt+gEQtfeTNSYfxkYgu2WIZ0W6tKu7c=; b=
	Av1VKWxmXnSg/WET12THzERdDEappmOO+kKJKEftWV3uR9yNMle/LvaA9/ulTWL1
	/j96WeG/Zo2Fy8xurTuMFv5v70ntxC/ahGJ9HLnKZj39forRiubtK2kq94e32mnz
	Xvgb6qJyWtskRNWUnKoZX1Wp1dg5Y3bkSGJFwoqq9JzZUQUOxK/oHmT0G+gFQw2r
	76GvHGyFhHG+s1l6rV0nmtHtDb9JPcVIqgD+fN7oARrcKHQeOCNCGHjcSnsEK5wI
	53CuMyGsPbKf8I8knUn6UltBptQhNfFTaqKDYOkDUgYKC3Uh2hI+5ym0Da/DYHWs
	ykVQCRHVwn0wvszTVAMr3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716305636; x=1716392036; bh=vFl4+lxzr6JyOt+gEQtfeTNSYfxk
	Ygu2WIZ0W6tKu7c=; b=U1UAUMIjB+nXpeM8KKjqa+DmkihEoM2c0D2NXXVKoLFF
	THFSmEsyzRbkAGRe8/87icL1Szpxc7Zg95VV9leRZDB+VDo3Yca+/bX7HpxYhmZy
	43ueOLxNLQvvJ3McLJqsr+OJ6YdAxA+TRiOoH/TbDN7cHVkMiu8LO4R6hT1ulYQ4
	UO3i1BaAjWbBrW527VzKVPrMJky6J53CUZoi0CRUrAGmofF7Ijq8d49e5VR7V3nl
	G0AtNhoS4iY6iQb02Keb8f4wdy8iVHmuyF4t4yuJTeqNLyQyoqFiH0sxaL8RbbLC
	OB73C6xMMRJ+rSXJqINWQ5IH8V9NVYdzCdqEJQr2WQ==
X-ME-Sender: <xms:475MZt4B1NqAv7sJ5Q28mVuPtQapSdIEIGwHob1nj-kMr7P0LdHaUw>
    <xme:475MZq5bkCrS31ZjdFwyyVGIYq1h-Bkp71AQBO0MgAGQ2XMxMDufMuN8b6WNFShM7
    Q-n6iPRcsuUHg>
X-ME-Received: <xmr:475MZke1nTG757zOjtr0RsMotyp7vQmFVYb6zZMZEvTFluppfq1n_wM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeivddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:475MZmJlW8XG51eIo-1s_b_yxSbZ3qTtEeTBbXpX59G6bmNvMm5yeA>
    <xmx:475MZhL7m9MWKu7itdXo3ZLausi-QWm7M2PqjQBLbHGGpXNsfx7vDg>
    <xmx:475MZvyues5bMS1GzJvjzSoDMvgQMNcVv7GkX0lciHV998Oemlrz5w>
    <xmx:475MZtJ6YG7NJfXUll5uU9fn_hZCvAcAlPI6s5M8QJxuazfWRTZCJQ>
    <xmx:475MZh14k4RHIxZvw4v75FwRNQuBhGRabCNeRJvEQ1kbGDSOFkuu-a33>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 21 May 2024 17:33:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <Zky-4C2WOTboJFLb@mail-itl>
References: <cover.1b2f25e20efaa1fe1e6a2da565731becd27e7ead.1716260066.git-series.marmarek@invisiblethingslab.com>
 <2596964a55f710a300143aa5ae195566bacb4e00.1716260066.git-series.marmarek@invisiblethingslab.com>
 <245e535a-5b23-4d3e-83e5-dc797068652c@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zkEtAoOBRXaQqDHo"
Content-Disposition: inline
In-Reply-To: <245e535a-5b23-4d3e-83e5-dc797068652c@suse.com>


--zkEtAoOBRXaQqDHo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 May 2024 17:33:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/2] x86/mm: add API for marking only part of a MMIO
 page read only

On Tue, May 21, 2024 at 05:16:58PM +0200, Jan Beulich wrote:
> On 21.05.2024 04:54, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/xen/arch/x86/include/asm/mm.h
> > +++ b/xen/arch/x86/include/asm/mm.h
> > @@ -522,9 +522,27 @@ extern struct rangeset *mmio_ro_ranges;
> >  void memguard_guard_stack(void *p);
> >  void memguard_unguard_stack(void *p);
> > =20
> > +/*
> > + * Add more precise r/o marking for a MMIO page. Range specified here
> > + * will still be R/O, but the rest of the page (not marked as R/O via =
another
> > + * call) will have writes passed through.
> > + * The start address and the size must be aligned to SUBPAGE_MMIO_RO_A=
LIGN.
> > + *
> > + * This API cannot be used for overlapping ranges, nor for pages alrea=
dy added
> > + * to mmio_ro_ranges separately.
> > + *
> > + * Return values:
> > + *  - negative: error
> > + *  - 0: success
> > + */
> > +#define SUBPAGE_MMIO_RO_ALIGN 8
>=20
> This isn't just alignment, but also (and perhaps more importantly) granul=
arity.
> I think the name wants to express this.

SUBPAGE_MMIO_RO_GRANULARITY? Sounds a bit long...

>=20
> > @@ -4910,6 +4921,260 @@ long arch_memory_op(unsigned long cmd, XEN_GUES=
T_HANDLE_PARAM(void) arg)
> >      return rc;
> >  }
> > =20
> > +/*
> > + * Mark part of the page as R/O.
> > + * Returns:
> > + * - 0 on success - first range in the page
> > + * - 1 on success - subsequent range in the page
> > + * - <0 on error
> > + *
> > + * This needs subpage_ro_lock already taken */
>=20
> Nit: Comment style (full stop and */ on its own line).
>=20
> > +static int __init subpage_mmio_ro_add_page(
> > +    mfn_t mfn, unsigned int offset_s, unsigned int offset_e)
> > +{
> > +    struct subpage_ro_range *entry =3D NULL, *iter;
> > +    unsigned int i;
> > +
> > +    list_for_each_entry(iter, &subpage_ro_ranges, list)
> > +    {
> > +        if ( mfn_eq(iter->mfn, mfn) )
> > +        {
> > +            entry =3D iter;
> > +            break;
> > +        }
> > +    }
> > +    if ( !entry )
> > +    {
> > +        /* iter =3D=3D NULL marks it was a newly allocated entry */
> > +        iter =3D NULL;
> > +        entry =3D xzalloc(struct subpage_ro_range);
> > +        if ( !entry )
> > +            return -ENOMEM;
> > +        entry->mfn =3D mfn;
> > +    }
> > +
> > +    for ( i =3D offset_s; i <=3D offset_e; i +=3D SUBPAGE_MMIO_RO_ALIG=
N )
> > +    {
> > +        int oldbit =3D __test_and_set_bit(i / SUBPAGE_MMIO_RO_ALIGN,
> > +                                        entry->ro_qwords);
>=20
> Why int, not bool?

Because __test_and_set_bit returns int. But I can change to bool if you
prefer.

> > +        ASSERT(!oldbit);
> > +    }
> > +
> > +    if ( !iter )
> > +        list_add(&entry->list, &subpage_ro_ranges);
> > +
> > +    return iter ? 1 : 0;
> > +}
> > +
> > +/* This needs subpage_ro_lock already taken */
> > +static void __init subpage_mmio_ro_remove_page(
> > +    mfn_t mfn,
> > +    int offset_s,
> > +    int offset_e)
>=20
> Can either of these be negative? The more that ...

Right, I can change them to unsigned. They are unsigned already in
subpage_mmio_ro_add_page.

> > +{
> > +    struct subpage_ro_range *entry =3D NULL, *iter;
> > +    unsigned int i;
>=20
> ... this is used ...
>=20
> > +    list_for_each_entry(iter, &subpage_ro_ranges, list)
> > +    {
> > +        if ( mfn_eq(iter->mfn, mfn) )
> > +        {
> > +            entry =3D iter;
> > +            break;
> > +        }
> > +    }
> > +    if ( !entry )
> > +        return;
> > +
> > +    for ( i =3D offset_s; i <=3D offset_e; i +=3D SUBPAGE_MMIO_RO_ALIG=
N )
>=20
> ... with both of them?
>=20
> > +        __clear_bit(i / SUBPAGE_MMIO_RO_ALIGN, entry->ro_qwords);
> > +
> > +    if ( !bitmap_empty(entry->ro_qwords, PAGE_SIZE / SUBPAGE_MMIO_RO_A=
LIGN) )
> > +        return;
> > +
> > +    list_del(&entry->list);
> > +    if ( entry->mapped )
> > +        iounmap(entry->mapped);
> > +    xfree(entry);
> > +}
> > +
> > +int __init subpage_mmio_ro_add(
> > +    paddr_t start,
> > +    size_t size)
> > +{
> > +    mfn_t mfn_start =3D maddr_to_mfn(start);
> > +    paddr_t end =3D start + size - 1;
> > +    mfn_t mfn_end =3D maddr_to_mfn(end);
> > +    unsigned int offset_end =3D 0;
> > +    int rc;
> > +    bool subpage_start, subpage_end;
> > +
> > +    ASSERT(IS_ALIGNED(start, SUBPAGE_MMIO_RO_ALIGN));
> > +    ASSERT(IS_ALIGNED(size, SUBPAGE_MMIO_RO_ALIGN));
> > +    if ( !IS_ALIGNED(size, SUBPAGE_MMIO_RO_ALIGN) )
> > +        size =3D ROUNDUP(size, SUBPAGE_MMIO_RO_ALIGN);
> > +
> > +    if ( !size )
> > +        return 0;
> > +
> > +    if ( mfn_eq(mfn_start, mfn_end) )
> > +    {
> > +        /* Both starting and ending parts handled at once */
> > +        subpage_start =3D PAGE_OFFSET(start) || PAGE_OFFSET(end) !=3D =
PAGE_SIZE - 1;
> > +        subpage_end =3D false;
> > +    }
> > +    else
> > +    {
> > +        subpage_start =3D PAGE_OFFSET(start);
> > +        subpage_end =3D PAGE_OFFSET(end) !=3D PAGE_SIZE - 1;
> > +    }
> > +
> > +    spin_lock(&subpage_ro_lock);
> > +
> > +    if ( subpage_start )
> > +    {
> > +        offset_end =3D mfn_eq(mfn_start, mfn_end) ?
> > +                     PAGE_OFFSET(end) :
> > +                     (PAGE_SIZE - 1);
> > +        rc =3D subpage_mmio_ro_add_page(mfn_start,
> > +                                      PAGE_OFFSET(start),
> > +                                      offset_end);
> > +        if ( rc < 0 )
> > +            goto err_unlock;
> > +        /* Check if not marking R/W part of a page intended to be full=
y R/O */
> > +        ASSERT(rc || !rangeset_contains_singleton(mmio_ro_ranges,
> > +                                                  mfn_x(mfn_start)));
> > +    }
> > +
> > +    if ( subpage_end )
> > +    {
> > +        rc =3D subpage_mmio_ro_add_page(mfn_end, 0, PAGE_OFFSET(end));
> > +        if ( rc < 0 )
> > +            goto err_unlock_remove;
> > +        /* Check if not marking R/W part of a page intended to be full=
y R/O */
> > +        ASSERT(rc || !rangeset_contains_singleton(mmio_ro_ranges,
> > +                                                  mfn_x(mfn_end)));
> > +    }
> > +
> > +    spin_unlock(&subpage_ro_lock);
> > +
> > +    rc =3D rangeset_add_range(mmio_ro_ranges, mfn_x(mfn_start), mfn_x(=
mfn_end));
> > +    if ( rc )
> > +        goto err_remove;
> > +
> > +    return 0;
> > +
> > + err_remove:
> > +    spin_lock(&subpage_ro_lock);
> > +    if ( subpage_end )
> > +        subpage_mmio_ro_remove_page(mfn_end, 0, PAGE_OFFSET(end));
> > + err_unlock_remove:
> > +    if ( subpage_start )
> > +        subpage_mmio_ro_remove_page(mfn_start, PAGE_OFFSET(start), off=
set_end);
> > + err_unlock:
> > +    spin_unlock(&subpage_ro_lock);
> > +    return rc;
> > +}
> > +
> > +static void __iomem *subpage_mmio_get_page(struct subpage_ro_range *en=
try)
> > +{
> > +    void __iomem *mapped_page;
> > +
> > +    if ( entry->mapped )
> > +        return entry->mapped;
> > +
> > +    mapped_page =3D ioremap(mfn_x(entry->mfn) << PAGE_SHIFT, PAGE_SIZE=
);
>=20
> mfn_to_maddr() or some such?

Makes sense.

> > +    spin_lock(&subpage_ro_lock);
> > +    /* Re-check under the lock */
> > +    if ( entry->mapped )
> > +    {
> > +        spin_unlock(&subpage_ro_lock);
> > +        iounmap(mapped_page);
>=20
> What if ioremap() failed?

Good point.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zkEtAoOBRXaQqDHo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZMvuAACgkQ24/THMrX
1yy3pwf+JOHHFBUzbLrpHdZu4MsujlnqKVQSnQOHAD/W/8GA1z/nwuYb0QQalO7w
Z/08c8t3FfRcRyVdvbPO/X5AkymdHTSdpKQoeyxaGtKn8pONJNlNS8quE5qqaQG/
BVP1E9hSuRzNtDxzaHAZzFyIVB/GB8MdbSa8dYSFiNTUzL1ek+PPKJg1QSF5cX3w
e9hcdKco5ymuVJfBeKF2I+k28IZM3B0v9pkQgwRAiRECG+03t0YrLJqSXj0pJ37S
PR6OCsUMqxD6FBJbDJRec0Vba5F8Ko3u9tPp7bOg9Wv87E4KjA3I1JOj0P1RyuTc
yBfAIYoHPe4+tOKCU+8tR1bX4LO5og==
=uuat
-----END PGP SIGNATURE-----

--zkEtAoOBRXaQqDHo--

