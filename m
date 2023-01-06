Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2146365F995
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 03:30:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472291.732469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDcUo-000118-GB; Fri, 06 Jan 2023 02:30:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472291.732469; Fri, 06 Jan 2023 02:30:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDcUo-0000xh-Cu; Fri, 06 Jan 2023 02:30:14 +0000
Received: by outflank-mailman (input) for mailman id 472291;
 Fri, 06 Jan 2023 02:30:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9IjP=5D=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pDcUm-0000xb-6F
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 02:30:12 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0978b90c-8d6a-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 03:30:10 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 9AD8632009B3;
 Thu,  5 Jan 2023 21:30:06 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 05 Jan 2023 21:30:07 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jan 2023 21:30:04 -0500 (EST)
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
X-Inumbo-ID: 0978b90c-8d6a-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1672972206; x=
	1673058606; bh=68Gw4tH2z0Hvyc9UriftpU1Mlh3pagHOU2hiJGFdXPk=; b=i
	W4f5zzV1SWMlQpBjgBVF575l0EhACjoGMMNeSp2Afl4RsW3auT/hHPYHAs4Qfl3p
	jIyYA+iysxtMzq8h5ngwECGg+vU56kcZis1w6Rmx2JMbLCUOBJGf7bz3r5wCPlgY
	AyqzmZSPLC8OGrEM46Ce1xaWGpgtSrImNIyXCX0Vqi40lXioCQ1pLVOlsGYGjKP0
	FhU2LJSZjH/XRms3LD27FBVplKl1pYaLc04bOOTzispT4LvcGSfNbB2gi59Q8diX
	mEuBbuV8KtKffd5NP/hMS11vChbxteDNhTqsQE+6lokdWdrGrrkkV4oMLVQW2BWz
	TzFLUnV9DmW0Kadh+0RbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672972206; x=1673058606; bh=68Gw4tH2z0Hvyc9UriftpU1Mlh3p
	agHOU2hiJGFdXPk=; b=ocj4/K24DPbrGGn2EIgJAchu3RIDPC9CmOmgnMziWQ0z
	zBl9jTuhCy9j2riO49ut2Bxj6sWcD1msVhnayV1VUmsDTNKtMISaq3F9uT04alkr
	EW7XVuLjDoypBCF8NuXWKpF/ioRXxs2P3ZUlSdXcqn7uyHRXZQEAlMJ3qP2LULjP
	lBlzNPn/ab1e0b6JWvzDH+9kuWvjrA2+/TAmTzDTSgYQKcpSyWqaMGoROIKlz74f
	t/VwO3W8hEG8AS2E7o2t/793VpDPe/ZFBsCDFac4Usaossc5XQsv8pjS/plEEwsY
	ulyhtLQt7CyDXlu3DZB7ry5DnzFN07AzQcu6UYvXPQ==
X-ME-Sender: <xms:roe3Y3UonzmnxHgsjE7QjbXUpC2T6C52WqK4vBZPYVEz40Dd54jY_A>
    <xme:roe3Y_lz75A8DFd1zlNjb2w4b0A-YOYCpYEU65KgDfKyoqSYXJCB6QJHHE2qj0J5q
    coEcwUdrc7ngw>
X-ME-Received: <xmr:roe3YzZvEqc7LjYxJ_8bVl1Lff4YFeDtbGQ4cIXNSL49FxV3JeyW9UwfOf2f3ZJ8SILB_IAFgzXnzhy3CmrTxhKtHZQOoOvqDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeelgdegjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:roe3YyVKb1FVzroAb7cMMCVdBr0jPtntxgrUdD0mWrkyQSUbkbYaAg>
    <xmx:roe3YxmUX1UFUe5L3McsBYLLteQ_dXjJoM4Z_cU3PMMNO1PmHJVvsA>
    <xmx:roe3Y_cgs-6AIlUb7sSt3Tw0BERSUKgB_VQgFBCFct-qJcPUPD1HcA>
    <xmx:roe3Y0uyOkzCTSjmmb2lQRpAr6U9FkTTvx4-bs5TP1AAmNqREhc60Q>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 6 Jan 2023 03:30:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"Tim (Xen.org)" <tim@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v6 4/5] x86/mm: Reject invalid cacheability in PV guests
 by default
Message-ID: <Y7eHqmeNgFmf3NqH@mail-itl>
References: <cover.1671744225.git.demi@invisiblethingslab.com>
 <2236399f561d348937f2ff7777fe47ad4236dbda.1671744225.git.demi@invisiblethingslab.com>
 <c6223295-c4f9-8fa8-7635-80d48094190f@citrix.com>
 <Y7eAqgcEENVcn+bl@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eeQ5Sw3MESoZAt5D"
Content-Disposition: inline
In-Reply-To: <Y7eAqgcEENVcn+bl@itl-email>


--eeQ5Sw3MESoZAt5D
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 Jan 2023 03:30:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"Tim (Xen.org)" <tim@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v6 4/5] x86/mm: Reject invalid cacheability in PV guests
 by default

On Thu, Jan 05, 2023 at 09:00:03PM -0500, Demi Marie Obenour wrote:
> On Thu, Jan 05, 2023 at 08:28:26PM +0000, Andrew Cooper wrote:
> > On 22/12/2022 10:31 pm, Demi Marie Obenour wrote:
> > > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-comman=
d-line.pandoc
> > > index 424b12cfb27d6ade2ec63eacb8afe5df82465451..0230a7bc17cbd4362a42e=
a64cea695f31f5e0f86 100644
> > > --- a/docs/misc/xen-command-line.pandoc
> > > +++ b/docs/misc/xen-command-line.pandoc
> > > @@ -1417,6 +1417,17 @@ detection of systems known to misbehave upon a=
ccesses to that port.
> > >  ### idle_latency_factor (x86)
> > >  > `=3D <integer>`
> > > =20
> > > +### invalid-cacheability (x86)
> > > +> `=3D allow | deny | trap`
> > > +
> > > +> Default: `deny` in release builds, otherwise `trap`
> > > +
> > > +Specify what happens when a PV guest tries to use one of the reserve=
d entries in
> > > +the PAT.  `deny` causes the attempt to be rejected with -EINVAL, `al=
low` allows
> > > +the attempt, and `trap` causes a general protection fault to be rais=
ed.
> > > +Currently, the reserved entries are marked as uncacheable in Xen's P=
AT, but this
> > > +will change if new memory types are added, so guests must not rely o=
n it.
> > > +
> >=20
> > This wants to be scoped under "pv", and not a top-level option.=C2=A0 C=
urrent
> > parsing is at the top of xen/arch/x86/pv/domain.c
> >=20
> > How about `pv=3D{no-}oob-pat`, and parse it into the opt_pv_oob_pat boo=
lean ?
>=20
> Works for me, though I will use =E2=80=98invalid=E2=80=99 instead of =E2=
=80=98oob=E2=80=99 as valid PAT
> entries might not be contiguous.

If we're talking about alternative PAT settings, I'm not sure if they
can be called "invalid". With the default Xen's choice of PAT, top two
entries are documented as reserved (in xen.h) and only that makes them
forbidden to use. But with alternative settings, it's only behavior of
Linux parsing that prefers using lower options. When breaking contract
set in xen.h, "reserved" entries stop being reserved too.

So, _if_ that option would be applicable alternative PAT choice, it's
only useful for debugging Linux specifically (assuming Linux won't
change its approach to choosing entries - which I think it's allowed to
do).

> > There really is no need to distinguish between deny and trap.=C2=A0 IMO,
> > injecting #GP unilaterally is fine (to a guest expecting the hypercall
> > to succeed, -EINVAL vs #GP makes no difference, but #GP is far more
> > useful to a human trying to debug issues here), but I could be talked
> > into putting that behind a CONFIG_DEBUG if other feel strongly.
>=20
> Marek, thoughts?

With Xen's default PAT, #GP may be useful indeed, but it must come with
a message why it was injected.

> > > @@ -1343,7 +1374,34 @@ static int promote_l1_table(struct page_info *=
page)
> > >          }
> > >          else
> > >          {
> > > -            switch ( ret =3D get_page_from_l1e(pl1e[i], d, d) )
> > > +            l1_pgentry_t l1e =3D pl1e[i];
> > > +
> > > +            if ( invalid_cacheability !=3D INVALID_CACHEABILITY_ALLO=
W )
> > > +            {
> > > +                switch ( l1e.l1 & PAGE_CACHE_ATTRS )
> > > +                {
> > > +                case _PAGE_WB:
> > > +                case _PAGE_UC:
> > > +                case _PAGE_UCM:
> > > +                case _PAGE_WC:
> > > +                case _PAGE_WT:
> > > +                case _PAGE_WP:
> > > +                    break;
> > > +                default:
> > > +                    /*
> > > +                     * If we get here, a PV guest tried to use one o=
f the
> > > +                     * reserved values in Xen's PAT.  This indicates=
 a bug
> > > +                     * in the guest.  If requested by the user, inje=
ct #GP
> > > +                     * to cause the guest to log a stack trace.
> > > +                     */
> > > +                    if ( invalid_cacheability =3D=3D INVALID_CACHEAB=
ILITY_TRAP )
> > > +                        pv_inject_hw_exception(TRAP_gp_fault, 0);
> > > +                    ret =3D -EINVAL;
> > > +                    goto fail;
> > > +                }
> > > +            }
> >=20
> > This will catch cases where the guest writes a full pagetable, then
> > promotes it, but won't catch cases where the guest modifies an
> > individual entry with mmu_update/etc.
> >=20
> > The logic needs to be in get_page_from_l1e() to get applied uniformly to
> > all PTE modifications.
>=20
> I will move it there, and also update Qubes OS=E2=80=99s patchset.
>=20
> > Right now, the l1_disallow_mask() check near the start hides the "can
> > you use a nonzero cacheattr" check.=C2=A0 If I ever get around to clean=
ing up
> > my post-XSA-402 series, I have a load of modifications to this.
>=20
> I came up with some major cleanups too.
>=20
> > But this could be something like this:
> >=20
> > if ( opt_pv_oob_pat && (l1f & PAGE_CACHE_ATTRS) > _PAGE_WP )
> > {
> > =C2=A0=C2=A0=C2=A0 // #GP
> > =C2=A0=C2=A0=C2=A0 return -EINVAL;
> > }
> >=20
> > fairly early on.
> >=20
> > It occurs to me that this check is only applicable when we're using the
> > Xen ABI APT, and seeing as we've talked about possibly making patch 5 a
> > Kconfig option, that may want accounting here.=C2=A0 (Perhaps simply ma=
king
> > opt_pb_oob_pat be false in a !XEN_PAT build.)
>=20
> It=E2=80=99s actually applicable even with other PATs.  While Marek and I=
 were
> tracking down an Intel iGPU cache coherency problem, Marek used it to
> verify that PAT entries that we thought were not being used were in fact
> unused.  This allowed proving that the behavior of the GPU was impacted
> by changes to PAT entries the hardware should not even be looking at,
> and therefore that the hardware itself must be buggy.

In fact, I did that via WARN() on the Linux side, to _not_ have guest
killed in this case, to potentially collect more info. As said above,
with alternative PAT settings, the contract which entries are "valid"
isn't there anymore, so punishing guest for using them isn't
appropriate. It could still be useful feature for debugging Linux (and
it feels, we'll need this feature for some time...). So, with !XEN_PAT
it should be at least disabled by default, or maybe even hidden behind
CONFIG_DEBUG.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--eeQ5Sw3MESoZAt5D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmO3h6oACgkQ24/THMrX
1yyQWAf9HO56+c4tEleItkwNk4egtEM7JbnfHfue4DVNGbvYgvqpORvvhtx7wbm8
hjQTIb0bWRBtOmOlPa23conmtzGhJIQgsRJVx+4Y8Uu95BMjAChur9jUo56AmeWA
frRMIrJg1va3KcyRdLiChERtTNXH1E43e5vcH2I/Yswntwvq3+vwl2Vk/y0SYlSw
J7L3X7USBEcvJMe8jUZwHKXlGebRf9axovR8Gp7KH0xHUofLGE0BOgP9RtERu82t
q4LLxrmPRZJyd2rpAnN1vOT1LlqX3lywUluDFGvME94gt0Sl5npQZoGbwmiDBi0U
7Gd2xPjjNTIC3eVlfLV8fztV4Zxiag==
=OXk0
-----END PGP SIGNATURE-----

--eeQ5Sw3MESoZAt5D--

