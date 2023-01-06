Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A2665FAEA
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 06:25:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472299.732479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDfDA-0001H2-0p; Fri, 06 Jan 2023 05:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472299.732479; Fri, 06 Jan 2023 05:24:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDfD9-0001Ea-U3; Fri, 06 Jan 2023 05:24:11 +0000
Received: by outflank-mailman (input) for mailman id 472299;
 Fri, 06 Jan 2023 05:24:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ci4=5D=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pDfD8-0001EU-3G
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 05:24:10 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 55b8809d-8d82-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 06:24:05 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 423E05C012E;
 Fri,  6 Jan 2023 00:24:04 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 06 Jan 2023 00:24:04 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 6 Jan 2023 00:24:03 -0500 (EST)
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
X-Inumbo-ID: 55b8809d-8d82-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1672982644; x=
	1673069044; bh=T6QxApLPZtDk4+Nt1PDDcWCHZVNoE6nWso9ONeSi5PA=; b=i
	pRpRT9szWvhq/kVRiSz3DjByOdrKFTa31g7Eb9gtZ1EKeB4OaNVJYUcU2oB4A2Rn
	pp7rqMqQIYYfWTb2evUM8LeC4eFZNSRukQaFXR6WKiM9eMcrYeXskLxLuDWPzZqI
	ePHTznNYHUPAGlfd5aj/urlBYp/Csbc4YYC81A9gb2qyHqlqRYykGdN4jr3EKQWo
	6pbKlp/NA1UUmN7EauiLbKJ5Xgxn/p1acPlFSQXueSfTf5n1ojP3rLEu1NxQvr5Q
	PHRe5JXoaqVN9w4N5No32O4aMC5ApSX/n3mlIzFJ9vDV7zW4Y14ex/d2D0wKmDyO
	tpV/GYXhcekFbzDFRnMBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672982644; x=1673069044; bh=T6QxApLPZtDk4+Nt1PDDcWCHZVNo
	E6nWso9ONeSi5PA=; b=SKNpQ4cNhxrQ2jwwwU4+oUk8/OtbFhtqD1z4zvOUOoMz
	Ue7/ak5HzaQbsn8iRQUh9CfUL9TDLKdk+AQil/ABbhQweIlE2AmXAj9FDhqvQs/5
	K58KhLbKtENsERT4ciGqO5LZbudoXaDTpab5ocia7J1fWlvVwS55cORwBfr1pQj1
	z2ahHk/MA6iniKSj8XTtgyFKQreSWRgW8ECEBminv8tGoRuQtdpVKwz66xftfFTN
	zjOWCv5bcVRksI6K4yM/4vcSOl5JvevVoBuvEQvrO0xtdWFT87xcq0ABELsrZYZa
	pDwV8PsX5wr2al3T+AosADUaPaclz1HUGLHcegUKfQ==
X-ME-Sender: <xms:c7C3Y4l37EtISfRAilH_biBA-WhqARDGPy2U0ZFzXYXovG0IpNyBOw>
    <xme:c7C3Y30XVg8fBn3xWJU9Ylc78Mz5FsMv6QpVV9OS-PGoDgrO_94MBxBhMvXiAJ3FP
    j3MTFn2arKIq-Y>
X-ME-Received: <xmr:c7C3Y2qmXuUCBs25zk9nMHV01mcb8WRfb2yJreAjFMuuuA4kUHQNLt5Z6YT9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeelgdekgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:c7C3Y0mDa02vhsNzQF-lntmAnR_LzzwCkPo5-lhJ7KyMUErWxPfC-g>
    <xmx:c7C3Y21ASiA7cAV4GoVffjQZ0cQlC3uxcyS7LmqYyrdMpH74JYuUmQ>
    <xmx:c7C3Y7v44eAw5AacZCHczPKdwmq2o15hdgyLj0PzqqLFQeD6bkS7kg>
    <xmx:dLC3Yy_iztWrWAdKWgZt9Mbazkr7YIDIQsOmpXU8_lnIDcldHvZLxQ>
Feedback-ID: iac594737:Fastmail
Date: Fri, 6 Jan 2023 00:23:13 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"Tim (Xen.org)" <tim@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v6 4/5] x86/mm: Reject invalid cacheability in PV guests
 by default
Message-ID: <Y7ewcXxuEL92rI4v@itl-email>
References: <cover.1671744225.git.demi@invisiblethingslab.com>
 <2236399f561d348937f2ff7777fe47ad4236dbda.1671744225.git.demi@invisiblethingslab.com>
 <c6223295-c4f9-8fa8-7635-80d48094190f@citrix.com>
 <Y7eAqgcEENVcn+bl@itl-email>
 <Y7eHqmeNgFmf3NqH@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ivFJOV8FZBUMgnec"
Content-Disposition: inline
In-Reply-To: <Y7eHqmeNgFmf3NqH@mail-itl>


--ivFJOV8FZBUMgnec
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 6 Jan 2023 00:23:13 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"Tim (Xen.org)" <tim@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v6 4/5] x86/mm: Reject invalid cacheability in PV guests
 by default

On Fri, Jan 06, 2023 at 03:30:01AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Jan 05, 2023 at 09:00:03PM -0500, Demi Marie Obenour wrote:
> > On Thu, Jan 05, 2023 at 08:28:26PM +0000, Andrew Cooper wrote:
> > > On 22/12/2022 10:31 pm, Demi Marie Obenour wrote:
> > > > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-comm=
and-line.pandoc
> > > > index 424b12cfb27d6ade2ec63eacb8afe5df82465451..0230a7bc17cbd4362a4=
2ea64cea695f31f5e0f86 100644
> > > > --- a/docs/misc/xen-command-line.pandoc
> > > > +++ b/docs/misc/xen-command-line.pandoc
> > > > @@ -1417,6 +1417,17 @@ detection of systems known to misbehave upon=
 accesses to that port.
> > > >  ### idle_latency_factor (x86)
> > > >  > `=3D <integer>`
> > > > =20
> > > > +### invalid-cacheability (x86)
> > > > +> `=3D allow | deny | trap`
> > > > +
> > > > +> Default: `deny` in release builds, otherwise `trap`
> > > > +
> > > > +Specify what happens when a PV guest tries to use one of the reser=
ved entries in
> > > > +the PAT.  `deny` causes the attempt to be rejected with -EINVAL, `=
allow` allows
> > > > +the attempt, and `trap` causes a general protection fault to be ra=
ised.
> > > > +Currently, the reserved entries are marked as uncacheable in Xen's=
 PAT, but this
> > > > +will change if new memory types are added, so guests must not rely=
 on it.
> > > > +
> > >=20
> > > This wants to be scoped under "pv", and not a top-level option.=C2=A0=
 Current
> > > parsing is at the top of xen/arch/x86/pv/domain.c
> > >=20
> > > How about `pv=3D{no-}oob-pat`, and parse it into the opt_pv_oob_pat b=
oolean ?
> >=20
> > Works for me, though I will use =E2=80=98invalid=E2=80=99 instead of =
=E2=80=98oob=E2=80=99 as valid PAT
> > entries might not be contiguous.
>=20
> If we're talking about alternative PAT settings, I'm not sure if they
> can be called "invalid". With the default Xen's choice of PAT, top two
> entries are documented as reserved (in xen.h) and only that makes them
> forbidden to use. But with alternative settings, it's only behavior of
> Linux parsing that prefers using lower options. When breaking contract
> set in xen.h, "reserved" entries stop being reserved too.

That makes sense.

> So, _if_ that option would be applicable alternative PAT choice, it's
> only useful for debugging Linux specifically (assuming Linux won't
> change its approach to choosing entries - which I think it's allowed to
> do).

Point taken.

> > > There really is no need to distinguish between deny and trap.=C2=A0 I=
MO,
> > > injecting #GP unilaterally is fine (to a guest expecting the hypercall
> > > to succeed, -EINVAL vs #GP makes no difference, but #GP is far more
> > > useful to a human trying to debug issues here), but I could be talked
> > > into putting that behind a CONFIG_DEBUG if other feel strongly.
> >=20
> > Marek, thoughts?
>=20
> With Xen's default PAT, #GP may be useful indeed, but it must come with
> a message why it was injected.

In xl dmesg?

> > > > @@ -1343,7 +1374,34 @@ static int promote_l1_table(struct page_info=
 *page)
> > > >          }
> > > >          else
> > > >          {
> > > > -            switch ( ret =3D get_page_from_l1e(pl1e[i], d, d) )
> > > > +            l1_pgentry_t l1e =3D pl1e[i];
> > > > +
> > > > +            if ( invalid_cacheability !=3D INVALID_CACHEABILITY_AL=
LOW )
> > > > +            {
> > > > +                switch ( l1e.l1 & PAGE_CACHE_ATTRS )
> > > > +                {
> > > > +                case _PAGE_WB:
> > > > +                case _PAGE_UC:
> > > > +                case _PAGE_UCM:
> > > > +                case _PAGE_WC:
> > > > +                case _PAGE_WT:
> > > > +                case _PAGE_WP:
> > > > +                    break;
> > > > +                default:
> > > > +                    /*
> > > > +                     * If we get here, a PV guest tried to use one=
 of the
> > > > +                     * reserved values in Xen's PAT.  This indicat=
es a bug
> > > > +                     * in the guest.  If requested by the user, in=
ject #GP
> > > > +                     * to cause the guest to log a stack trace.
> > > > +                     */
> > > > +                    if ( invalid_cacheability =3D=3D INVALID_CACHE=
ABILITY_TRAP )
> > > > +                        pv_inject_hw_exception(TRAP_gp_fault, 0);
> > > > +                    ret =3D -EINVAL;
> > > > +                    goto fail;
> > > > +                }
> > > > +            }
> > >=20
> > > This will catch cases where the guest writes a full pagetable, then
> > > promotes it, but won't catch cases where the guest modifies an
> > > individual entry with mmu_update/etc.
> > >=20
> > > The logic needs to be in get_page_from_l1e() to get applied uniformly=
 to
> > > all PTE modifications.
> >=20
> > I will move it there, and also update Qubes OS=E2=80=99s patchset.
> >=20
> > > Right now, the l1_disallow_mask() check near the start hides the "can
> > > you use a nonzero cacheattr" check.=C2=A0 If I ever get around to cle=
aning up
> > > my post-XSA-402 series, I have a load of modifications to this.
> >=20
> > I came up with some major cleanups too.
> >=20
> > > But this could be something like this:
> > >=20
> > > if ( opt_pv_oob_pat && (l1f & PAGE_CACHE_ATTRS) > _PAGE_WP )
> > > {
> > > =C2=A0=C2=A0=C2=A0 // #GP
> > > =C2=A0=C2=A0=C2=A0 return -EINVAL;
> > > }
> > >=20
> > > fairly early on.
> > >=20
> > > It occurs to me that this check is only applicable when we're using t=
he
> > > Xen ABI APT, and seeing as we've talked about possibly making patch 5=
 a
> > > Kconfig option, that may want accounting here.=C2=A0 (Perhaps simply =
making
> > > opt_pb_oob_pat be false in a !XEN_PAT build.)
> >=20
> > It=E2=80=99s actually applicable even with other PATs.  While Marek and=
 I were
> > tracking down an Intel iGPU cache coherency problem, Marek used it to
> > verify that PAT entries that we thought were not being used were in fact
> > unused.  This allowed proving that the behavior of the GPU was impacted
> > by changes to PAT entries the hardware should not even be looking at,
> > and therefore that the hardware itself must be buggy.
>=20
> In fact, I did that via WARN() on the Linux side, to _not_ have guest
> killed in this case, to potentially collect more info.

Whoops!  I must have misunderstood what you meant by "trap".

> As said above,
> with alternative PAT settings, the contract which entries are "valid"
> isn't there anymore, so punishing guest for using them isn't
> appropriate. It could still be useful feature for debugging Linux (and
> it feels, we'll need this feature for some time...). So, with !XEN_PAT
> it should be at least disabled by default, or maybe even hidden behind
> CONFIG_DEBUG.

Okay, makes sense.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--ivFJOV8FZBUMgnec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmO3sHAACgkQsoi1X/+c
IsHeXg//S1AGIYEzJpckidY72FKng8WRFxrRxiaLYi1x/BaJisp1faR/UiV5qga6
6hcI+GpGYxFwE5KC8+PpJWiTAWkx2GmzGLY4D12f4Qrp/dl97qy2bN1Aqc4vKlfH
DnY4yC0nfVHSYXmzHL/WACu0ffIGkE8+yRNZhc3iikMaY1yqFv04aH48AWVVcnGW
flZGRSjJWY/jgc7Ih787nr+Lc0iu16TkgUMNApVoLIO680r8YMwJrGLLSXafd6tz
aCywzechhBRnsx+tWPDqpDv5iM3Hh+H/gPi66pMRyoEjWkAIeoO2mD52pbJ6Iq8K
97AJZ7C2cTMeSSj+Uv3Q0mPLlrci0GwP7Ej3uMHxvj5ctIkcNW3RDX/Q9+UTZG5z
+XtFqY7FXUiulKLX3FHt83daGd9sgV8rR+i6sTMe9un5YrfW5fPM51U+LDjyWf6S
lhbcT/yYMbf5rziZhv+/2M67UiUrIhWVYXVp6ctqSbvlLvrhPVddIQRo5sDphiRQ
pyMHhQIh9lLvexOgp56DkRCAVvkjaZqWUEt7EHTgmLJSuXPRtLulu5ojImlrsZTl
Bu6OvjfNbv/nTRiOUilta2D8bxnrQ+VDYTFTDl4Xzot1pu0SLLJBYNHun+INDyG2
zgTI0s5l93yh1I4KVjR3cRUv+pg+Un6CoZDBxSSzrCQJ5pKmDyg=
=qcVE
-----END PGP SIGNATURE-----

--ivFJOV8FZBUMgnec--

