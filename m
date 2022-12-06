Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13339644AB0
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 18:56:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455412.712874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cAk-0000dS-4Z; Tue, 06 Dec 2022 17:56:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455412.712874; Tue, 06 Dec 2022 17:56:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cAk-0000a1-1N; Tue, 06 Dec 2022 17:56:02 +0000
Received: by outflank-mailman (input) for mailman id 455412;
 Tue, 06 Dec 2022 17:56:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2cAj-0000Zt-4g
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 17:56:01 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3d0dc415-758f-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 18:55:59 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 7F72432002FB;
 Tue,  6 Dec 2022 12:55:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 06 Dec 2022 12:55:57 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Dec 2022 12:55:55 -0500 (EST)
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
X-Inumbo-ID: 3d0dc415-758f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670349356; x=
	1670435756; bh=QkFZdBpSGmdlZka3qInHdD0LIUYcTy1vUs1QtcW3bOc=; b=H
	RiilUDKU9XDuC9GehxHUbo0eU1kHVEBW/KpAGWHQmYpuq4Cc6d+dj8sFoNEa3ws3
	HaN0JHjCkr0NskYtOb+79U8NbVUrraPnFv+ot7YZuAH/2xRgl7s8T6c6t/bsEvmB
	nmHp4qtANmd7bqVTBTWXgJE7bw/O2M9yqgNEyMUnmix7IcJtjIGYW+3TyPuZxoH6
	lzIW/mUVzVqeq2U3J+3IDautriqvyiuXFTMHZZ1dS4KSpalV3yueKU4G81c2EAtr
	fh7z/8qcPDsW3FpEyrYJiMVeFhPx5ill4cBUJneg/RlStzf/AqW2JNoAyYdkRxKK
	yjXLrIvAFgSjK7clX+20g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670349356; x=1670435756; bh=QkFZdBpSGmdlZka3qInHdD0LIUYc
	Ty1vUs1QtcW3bOc=; b=xWhdKCEkFlPCFh7xkkfEmnah8vtG9qt1dHzD1EnQoCJo
	fKew7GjvV86f8zRmQsfC1K1HwS+yCJuIe4XXdPh1Lcp1miTuooQA/6g/V+9hrLl8
	XONiw6Tac7qT3rasuQD/OGWvfqFd9GkvHjMh6fc60a6qK6X3l/wkIPoWZzWe1L6b
	EviKmr46O7cxlOEUQjcoRGZZ22cbQrZD1ocYJnGEZRs5dMXXbO1TGaQ7krjkaTdd
	syWEAm7neyA+wvRNNIstjurYCmQTtUvmXf1v8VwpkPYIEhCbBHJVHCWj5iGoefAg
	eQpFl016NH4C7FrDMNSowq53yrJrUdubHYO7Wddo4w==
X-ME-Sender: <xms:K4KPY8xKZ43yI7tfq6zerzQ5t9qmaswKyzMgUJxzMm6k7SIhLKQyxQ>
    <xme:K4KPYwQ9NCYs3t5UKjr4VdrO8S6-ImJKox3pXQr6U25VuRTYjAeGrjsIx9nOF1ygo
    knhRd5QrpyvWkA>
X-ME-Received: <xmr:K4KPY-XqH-IKGwoCfrooJWhVGjdpwxPEmiuihGovvMZ_Qz3EL3tueRCf1EKT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeigddutdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:K4KPY6gtoFqpYgCSxVlSomecyOmj2-1FFJqSVUfUy_W_0bJBW6akzQ>
    <xmx:K4KPY-AkXIIlhj_7v5kBNxmOgONT2MrbsTM6n-7zHbTu5oSAx__6jQ>
    <xmx:K4KPY7KPwwmgo3ghaJeyrbUbo9nbAcbrXQblgNttDR4ILGQs_uDYkA>
    <xmx:LIKPY16uGDSC7NxGQ9XK4L8CrBp9gub71EiXny93gP_3YP0aspt3PQ>
Feedback-ID: iac594737:Fastmail
Date: Tue, 6 Dec 2022 12:55:49 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 7/8] x86/mm: make code robust to future PAT changes
Message-ID: <Y4+CKb0slxo9hJW3@itl-email>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <33f3896ba4cdf50ceb0377f071682ac5d3f576c4.1670300446.git.demi@invisiblethingslab.com>
 <9bb20bca-34af-bff6-b9f0-0c2ce38d2a46@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EsYAO/NB8XBy4tV/"
Content-Disposition: inline
In-Reply-To: <9bb20bca-34af-bff6-b9f0-0c2ce38d2a46@citrix.com>


--EsYAO/NB8XBy4tV/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Dec 2022 12:55:49 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>
Subject: Re: [PATCH 7/8] x86/mm: make code robust to future PAT changes

On Tue, Dec 06, 2022 at 12:06:24PM +0000, Andrew Cooper wrote:
> On 06/12/2022 04:33, Demi Marie Obenour wrote:
> > It may be desirable to change Xen's PAT for various reasons.  This
> > requires changes to several _PAGE_* macros as well.  Add static
> > assertions to check that XEN_MSR_PAT is consistent with the _PAGE_*
> > macros.
> >
> > Additionally, Xen has two unused entries in the PAT.  Currently these
> > are UC, but this will change if the hardware ever supports additional
> > memory types.  To avoid future problems, this adds a check in debug
> > builds that injects #GP into a guest that tries to use one of these
> > entries, along with returning -EINVAL from the hypercall.  Future
> > versions of Xen will refuse to use these entries even in release builds.
> >
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > ---
> >  xen/arch/x86/mm.c | 58 +++++++++++++++++++++++++++++++++++++++++++----
> >  1 file changed, 54 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> > index 5d05399c3a841bf03991a3bed63df9a815c1e891..517fccee699b2a673ba537e=
47933aefc80017aa5 100644
> > --- a/xen/arch/x86/mm.c
> > +++ b/xen/arch/x86/mm.c
> > @@ -849,6 +849,45 @@ static int cf_check print_mmio_emul_range(
> >  }
> >  #endif
> > =20
> > +static void __init __maybe_unused build_assertions(void)
>=20
> This wants to be at the very bottom of the file.=C2=A0 (And also in the
> previous patch to remove the _Static_assert())
>=20
> > +{
> > +    /* A bunch of static assertions to check that the XEN_MSR_PAT is v=
alid
> > +     * and consistent with the _PAGE_* macros */
> > +#define PAT_VALUE(v) (0xFF & (XEN_MSR_PAT >> (8 * (v))))
> > +#define BAD_VALUE(v) ((v) < 0 || (v) > 7 ||                           =
         \
> > +                      (v) =3D=3D MSR_PAT_RESERVED_1 || (v) =3D=3D MSR_=
PAT_RESERVED_2)
> > +#define BAD_PAT_VALUE(v) BUILD_BUG_ON(BAD_VALUE(PAT_VALUE(v)))
> > +    BAD_PAT_VALUE(0);
> > +    BAD_PAT_VALUE(1);
> > +    BAD_PAT_VALUE(2);
> > +    BAD_PAT_VALUE(3);
> > +    BAD_PAT_VALUE(4);
> > +    BAD_PAT_VALUE(5);
> > +    BAD_PAT_VALUE(6);
> > +    BAD_PAT_VALUE(7);
> > +#undef BAD_PAT_VALUE
> > +#undef BAD_VALUE
>=20
> Given that you've reworked the PAT declaration to be of the form (MT <<
> shift), I'm not sure how much value this check is.

One of my goals with this patch set is that it should be possible to
choose *any* value for XEN_MSR_PAT and for the PAT-related _PAGE_*, with
all bad values caught at compile-time.  This would allow making it a
Kconfig option.

> > +#define PAT_SHIFT(page_value) (((page_value) & _PAGE_PAT) >> 5 |      =
         \
> > +                               ((page_value) & (_PAGE_PCD | _PAGE_PWT)=
) >> 3)
>=20
> pte_flags_to_cacheattr()

That=E2=80=99s a function, not a macro (and for good reason), so it can=E2=
=80=99t be
used in BUILD_BUG_ON().

> > +#define CHECK_PAGE_VALUE(page_value) do {                             =
         \
> > +    /* Check that the _PAGE_* macros only use bits from PAGE_CACHE_ATT=
RS */    \
> > +    BUILD_BUG_ON(((_PAGE_##page_value) & PAGE_CACHE_ATTRS) !=3D       =
           \
> > +                  (_PAGE_##page_value));                              =
         \
> > +    /* Check that the _PAGE_* are consistent with XEN_MSR_PAT */      =
         \
> > +    BUILD_BUG_ON(PAT_VALUE(PAT_SHIFT(_PAGE_##page_value)) !=3D        =
           \
> > +                 (MSR_PAT_##page_value));                             =
         \
> > +} while (0)
> > +    CHECK_PAGE_VALUE(WT);
> > +    CHECK_PAGE_VALUE(WB);
> > +    CHECK_PAGE_VALUE(WC);
> > +    CHECK_PAGE_VALUE(UC);
> > +    CHECK_PAGE_VALUE(UCM);
> > +    CHECK_PAGE_VALUE(WP);
> > +#undef CHECK_PAGE_VALUE
> > +#undef PAT_SHIFT
> > +#undef PAT_VALUE
> > +}
> > +
> >  /*
> >   * get_page_from_l1e returns:
> >   *   0  =3D> success (page not present also counts as such)
> > @@ -961,13 +1000,24 @@ get_page_from_l1e(
> > =20
> >          switch ( l1f & PAGE_CACHE_ATTRS )
> >          {
> > -        case _PAGE_WB:
> > +        default:
> > +#ifndef NDEBUG
> > +            printk(XENLOG_G_WARNING
> > +                   "d%d: Guest tried to use bad cachability attribute =
%u for MFN %lx\n",
> > +                   l1e_owner->domain_id, l1f & PAGE_CACHE_ATTRS, mfn);
>=20
> %pd.=C2=A0 You absolutely want to convert the PTE bits to a PAT value bef=
ore
> priniting (decimal on a PTE value is useless), and %PRI_mfn.

I=E2=80=99ll have to look at the rest of the Xen tree to see how to use thi=
s.

> > +            pv_inject_hw_exception(TRAP_gp_fault, 0);
>=20
> As I said on IRC, we do want this, but I'm not certain if we can get
> away with just enabling it in debug builds.=C2=A0 _PAGE_GNTTAB was ok bec=
ause
> it has always been like that, but there's a non-trivial chance that
> there are existing dom0 kernels which violate this constraint.

I chose this approach because it is very simple to implement.  Anything
more complex ought to be in a separate patch, IMO.

> > +            return -EINVAL;
> > +#endif
> >          case _PAGE_WT:
> >          case _PAGE_WP:
> > -            flip |=3D (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC;
> > +        case _PAGE_WB:
> > +            /* Force this to be uncachable */
> > +            return flip | ( (l1f & PAGE_CACHE_ATTRS) ^ _PAGE_UC );
> > +        case _PAGE_WC:
> > +        case _PAGE_UC:
> > +        case _PAGE_UCM:
> > +            return flip;
> >          }
> > -
> > -        return flip;
>=20
> This wants reworking over Jan's suggestion in patch 1, and modifying to
> reduce churn.=C2=A0 (Keep _PAGE_WB in the same order WRT _PAGE_WT, the
> uncached memory types should simply break, and default should be at the
> end.)

I put the default in the middle to keep the preprocessor conditionals
simple and avoid duplication.  I will have the default be treated as
cachable memory.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--EsYAO/NB8XBy4tV/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOPgikACgkQsoi1X/+c
IsEHmg/+KkfApDQcDu8jO9oRgKA45L/MnbvMRdAp18CEXTB9DjgzpooaAN58C0Pm
W926ML9uIZNYyA58OCf8JBHgQsCE2J5LiTBhiUWbL4SRmiYFqDQZZmINcBv1cVpu
WCVPnjUVMO6KTCbasSlBIuricwiN6W+T89RHvY9Zklzi0lF8keu2xNM/DZAdyE/L
n5xehFitZ/h4nhxRtZwHzR5uercMygSbCEzoaXFLVoMKljvhjm09dcGdc3VwG2Dd
ltc11WWGjXxaI/OqtD6CGyN1h04Rr0DuT/SZ/707nLAkNKz0quXMxgrqmDpm0jbx
O/gHI0s/LYvuDaM/dmv99hzqTueqf1cBpxJuhKfKPVYUXR70x22S4tsYYm0PCVL3
KAf30tYJYThpn/LSqN4klIF0VmG3Y/h0UxQBe2AyPB9wYFb/VHwWBXJUsBOLmMYq
W9OoaMD/3guB6C7P8mQkvgItW9o9z4FgWM8YHqrLPEVidK7FuSxu7yHGwxbjsGDv
jgje6mcZxgpVltHOTMBJ/rtnxAhYfYCRj6svIDSLnmagv+F/NBzQ0sNTinq0DQC9
DGa4xX9nRfbclsWLJgEmAdp8BzM9OsYNoe8dKwsBEXBrNoLfH4yDuWXjydwpDtqi
mdeFeNjHp9SFqvPaHXp9KFJDJ/kkvdTFxOVPfys4nNUmcdVmWi8=
=zx1h
-----END PGP SIGNATURE-----

--EsYAO/NB8XBy4tV/--

