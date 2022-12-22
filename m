Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E990653DC1
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 10:51:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468354.727432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IE2-0002l3-H9; Thu, 22 Dec 2022 09:50:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468354.727432; Thu, 22 Dec 2022 09:50:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8IE2-0002i8-Dt; Thu, 22 Dec 2022 09:50:54 +0000
Received: by outflank-mailman (input) for mailman id 468354;
 Thu, 22 Dec 2022 09:50:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8IE0-0002i2-O1
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 09:50:52 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dafd2cc-81de-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 10:50:51 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 22CB8320092F;
 Thu, 22 Dec 2022 04:50:48 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 22 Dec 2022 04:50:48 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 04:50:46 -0500 (EST)
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
X-Inumbo-ID: 1dafd2cc-81de-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671702647; x=
	1671789047; bh=ngdDRXnKaFXjnVTp24diWAqAjMSAS+n6u4dJT1Ftod4=; b=y
	OXGAMMbHy8SyBQa4hfQjXzMPUq9uDIGVDT9GqdQcuiSeIzo9oV41cNLgdBCD4Ij8
	du+FGZmWyrNQDJnfEOzLzdJawEYzVhNoFpKAhzILiz50GT6+9EOmuC/5FWmyMOMm
	OuZD2fBp2xlT+dNptcYmcevVRZ2ehFlNenrPNKxwpjWSLnDDoyAxmhDBz7M0Ly/K
	qlKef7F+S6HulvkeDTPnJr4RmHl7DjZ6la7C8OQmD4MhAEcThvNrJ9FZbUwjfPXg
	+Dn84FjBEmRHvxUCcvWUKRhOK7h1MLV/r6p+0rHmNhYOS16v4GRjy6O+O8pCGxZV
	UOWI3HV4T9X27mGCBJUXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671702647; x=1671789047; bh=ngdDRXnKaFXjnVTp24diWAqAjMSA
	S+n6u4dJT1Ftod4=; b=oMh38cQtF7pMQa96RHqXOBXM95yDySCrBx4+04m+OuHH
	pMsThk6345k3c92/3ZUpJcdnrbv38vFvYqWx/9WX80Ithm+vhXqI2a4uA0c8jB1O
	VpdyVs7VpNuLzPP+jXRtIrmiANzwV3cm76ZUPqkeP+qPX38ZBkmG53MZZotwCLp+
	gMbuGRnr5UALt/cNJF70Mp5tZBvoTYg6IBaQt48ok+9xye5CK0evfQB7DzLYubkU
	PS2Jv31EuV0Y3unxqaYOEPlLtt4V2csCBZ5oWd7+4GDt5/dLfciZluKVZbEQ1l+Y
	bCSngt6rR4fmXFge4IxywvHvE2I2/CxLcCRgkbFyQA==
X-ME-Sender: <xms:dyikY8DcJxeWk07p38gRa84wBf99CNhTQAkUrmV8zEVCB6BjdakWdg>
    <xme:dyikY-iZQ_XyiL6jQI8UYFcxcJ1LtFWbvOlMWxvgaFaQZSQjWE0wWYLyBjYz5bDfO
    6Yo4uqMGLGWd7E>
X-ME-Received: <xmr:dyikY_lPTzOf5eQxWW2Q7pNtjIrae8levSqEqgUJggMLztruY3_uLSFnAuti>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:dyikYywvDgePuRkxvxawiM4LCBKyHB-S9n50egTWL8sZptgaBtI5sQ>
    <xmx:dyikYxRiP6DToeopE07OkeJFz7nmmwntB4qnfLlhLqS8VoKs6agLwA>
    <xmx:dyikY9ZWcXBzk2Ey2aPNoa-qEAAnNDYboYdHSoLQaiO7EMHuaaFrcQ>
    <xmx:dyikYyRu53ysYg8vlWwuKNEhlL_es6fCFZr0kwU1QUKACMMvutGqzQ>
Feedback-ID: iac594737:Fastmail
Date: Thu, 22 Dec 2022 04:50:41 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 08/10] x86/mm: make code robust to future PAT changes
Message-ID: <Y6QodBfEc828o988@itl-email>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <a8920eef3254cbf470a0d35a887dbaf0e4907a6d.1671497984.git.demi@invisiblethingslab.com>
 <06dff83a-b120-a2b4-c61f-7864935d4c3e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nYhzebOp/rqxkOaF"
Content-Disposition: inline
In-Reply-To: <06dff83a-b120-a2b4-c61f-7864935d4c3e@suse.com>


--nYhzebOp/rqxkOaF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Dec 2022 04:50:41 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 08/10] x86/mm: make code robust to future PAT changes

On Thu, Dec 22, 2022 at 10:35:08AM +0100, Jan Beulich wrote:
> On 20.12.2022 02:07, Demi Marie Obenour wrote:
> > It may be desirable to change Xen's PAT for various reasons.  This
> > requires changes to several _PAGE_* macros as well.  Add static
> > assertions to check that XEN_MSR_PAT is consistent with the _PAGE_*
> > macros, and that _PAGE_WB is 0 as required by Linux.
>=20
> In line with the code comment, perhaps add (not just)"?

Will reword in v6.

> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -6352,6 +6352,11 @@ unsigned long get_upper_mfn_bound(void)
> >      return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
> >  }
> > =20
> > +
> > +/*
> > + * A bunch of static assertions to check that the XEN_MSR_PAT is valid
> > + * and consistent with the _PAGE_* macros, and that _PAGE_WB is zero.
> > + */
> >  static void __init __maybe_unused build_assertions(void)
> >  {
> >      /*
> > @@ -6361,6 +6366,72 @@ static void __init __maybe_unused build_assertio=
ns(void)
> >       * using different PATs will not work.
> >       */
> >      BUILD_BUG_ON(XEN_MSR_PAT !=3D 0x050100070406ULL);
> > +
> > +    /*
> > +     * _PAGE_WB must be zero for several reasons, not least because Li=
nux
> > +     * assumes it.
> > +     */
> > +    BUILD_BUG_ON(_PAGE_WB);
>=20
> Strictly speaking this is a requirement only for PV guests. We may not
> want to go as far as putting "#ifdef CONFIG_PV" around it, but at least
> the code comment (and then also the part of the description referring
> to this) will imo want to say so.

Does Xen itself depend on this?

> > +    /* A macro to convert from cache attributes to actual cacheability=
 */
> > +#define PAT_ENTRY(v) (0xFF & (XEN_MSR_PAT >> (8 * (v))))
>=20
> I don't think the comment is appropriate here. All you do is extract a
> slot from the hard-coded PAT value we use.

Will drop in v6.

> > +    /* Validate at compile-time that v is a valid value for a PAT entr=
y */
> > +#define CHECK_PAT_ENTRY_VALUE(v)                                      =
         \
> > +    BUILD_BUG_ON((v) < 0 || (v) > 7 ||                                =
         \
>=20
> PAT_ENTRY() won't produce negative values, so I don't think "(v) < 0" is
> really needed here. And the "(v) > 7" will imo want replacing by
> "(v) >=3D X86_NUM_MT".

Will fix in v6.

> > +                 (v) =3D=3D X86_MT_RSVD_2 || (v) =3D=3D X86_MT_RSVD_3)
> > +
> > +    /* Validate at compile-time that PAT entry v is valid */
> > +#define CHECK_PAT_ENTRY(v) do {                                       =
         \
> > +    BUILD_BUG_ON((v) < 0 || (v) > 7);                                 =
         \
>=20
> I think this would better be part of PAT_ENTRY(), as the validity of the
> shift there depends on it. If this check is needed in the first place,
> seeing that the macro is #undef-ed right after use below, and hence the
> checks only cover the eight invocations of the macro right here.
>=20
> > +    CHECK_PAT_ENTRY_VALUE(PAT_ENTRY(v));                              =
         \
> > +} while (0);
>=20
> Nit (style): Missing blanks around 0 and perhaps better nowadays to use
> "false" in such constructs. (Because of other comments this may go away
> here anyway, but there's another similar instance below).

Will fix in v6.

> > +    /*
> > +     * If one of these trips, the corresponding entry in XEN_MSR_PAT i=
s invalid.
> > +     * This would cause Xen to crash (with #GP) at startup.
> > +     */
> > +    CHECK_PAT_ENTRY(0);
> > +    CHECK_PAT_ENTRY(1);
> > +    CHECK_PAT_ENTRY(2);
> > +    CHECK_PAT_ENTRY(3);
> > +    CHECK_PAT_ENTRY(4);
> > +    CHECK_PAT_ENTRY(5);
> > +    CHECK_PAT_ENTRY(6);
> > +    CHECK_PAT_ENTRY(7);
> > +
> > +#undef CHECK_PAT_ENTRY
> > +#undef CHECK_PAT_ENTRY_VALUE
> > +
> > +    /* Macro version of page_flags_to_cacheattr(), for use in BUILD_BU=
G_ON()s */
>=20
> DYM pte_flags_to_cacheattr()? At which point the macro name wants to
> match and its parameter may also better be named "pte_value"?

Indeed so.

> > +#define PAGE_FLAGS_TO_CACHEATTR(page_value)                           =
         \
> > +    ((((page_value) >> 5) & 4) | (((page_value) >> 3) & 3))
>=20
> Hmm, yet more uses of magic literal numbers.

I wanted to keep the definition as close to that of
pte_flags_to_cacheattr() as possible.

> > +    /* Check that a PAT-related _PAGE_* macro is correct */
> > +#define CHECK_PAGE_VALUE(page_value) do {                             =
         \
> > +    /* Check that the _PAGE_* macros only use bits from PAGE_CACHE_ATT=
RS */    \
> > +    BUILD_BUG_ON(((_PAGE_##page_value) & PAGE_CACHE_ATTRS) !=3D       =
           \
> > +                  (_PAGE_##page_value));                              =
         \
>=20
> Nit (style): One too many blanks used for indentation.

Will fix in v6.

> > +    /* Check that the _PAGE_* are consistent with XEN_MSR_PAT */      =
         \
> > +    BUILD_BUG_ON(PAT_ENTRY(PAGE_FLAGS_TO_CACHEATTR(_PAGE_##page_value)=
) !=3D     \
> > +                 (X86_MT_##page_value));                              =
         \
>=20
> Nit (style): Nowadays we tend to consider ## a binary operator just like
> e.g. +, and hence it wants to be surrounded by blanks.

Will fix in v6.

> > +} while (0)
> > +
> > +    /*
> > +     * If one of these trips, the corresponding _PAGE_* macro is incon=
sistent
> > +     * with XEN_MSR_PAT.  This would cause Xen to use incorrect cachea=
bility
> > +     * flags, with results that are undefined and probably harmful.
>=20
> Why "undefined"? They may be wrong / broken, but the result is still well-
> defined afaict.

=E2=80=9Cundefined=E2=80=9D is meant as =E2=80=9Cone has violated a core as=
sumption that
higher-level stuff depends on, so things can go arbitrarily wrong,
including e.g. corrupting memory or data=E2=80=9D.  Is this accurate?  Shou=
ld I
drop the dependent clause, or do you have a suggestion for something
better?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--nYhzebOp/rqxkOaF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOkKHQACgkQsoi1X/+c
IsHaQw/+LglwgxfQRA2bEf4EMrYuvvZYozVta2wBVKkjvsER7FgYA6LGKL9psK6s
J/JqK8E+OuZT+IQgBCFzcbZUbY1TethyXzC77EAs8bmhHtK8it9xi/UgM0JhegtU
Szd4jZvMN6FZJlML+GVr5tXNsP7h6VoTr4H4eg8mZCQ/OphSUKfxhxOQxHhPcJnQ
a0OzoA5dKHn1UUXtVcjINGaqNRVKsBIeSbY0xWUlAqE0uWy/10t6O4GNPIanY82N
eXWnUzVjbcuWH1lfcn8mJrSA6VbVUbNIS9dGWaX5jJ0VK6szpMHM0y96D71uHseN
Rve+xbeDBgzHV7NHqdInEpFpPQJR5dLYDsYdPuz9UOgJUu//VIMUUwuxVv5buVTJ
tgSEuGTctVC2jHb5NcG4pnJK5I4q6Ivr1gzC3j3ff8luGY96fOhyWpx+TixIUGFo
QT0rMx4fmRg7mRyVZXTauwLyyFlPDUnRSYagg5uLOK5zlrMQ2cDRAUdvhG09eXSI
II5jutiwduHhydITJuSb/+Pe1VXLRRQv3V3F9j4zuqCDo5yn5SwrQjU80b/xueEC
vRTRNk5AMDZ+ZTtGaLCufc8UEd7pF54UzAst0fZ4oMhOWZacBJkIhBjdiixcvhEj
BUG/TGgp4F8BSpODC7nYvS+ImMOMT6lh8iB1F5lG8oy5gxPTnNU=
=KXlY
-----END PGP SIGNATURE-----

--nYhzebOp/rqxkOaF--

