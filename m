Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B4F65F95F
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 03:01:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472268.732435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDc1u-0004nH-G6; Fri, 06 Jan 2023 02:00:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472268.732435; Fri, 06 Jan 2023 02:00:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDc1u-0004kT-Cy; Fri, 06 Jan 2023 02:00:22 +0000
Received: by outflank-mailman (input) for mailman id 472268;
 Fri, 06 Jan 2023 02:00:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Ci4=5D=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pDc1s-0004kN-VL
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 02:00:21 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dc1f9371-8d65-11ed-b8d0-410ff93cb8f0;
 Fri, 06 Jan 2023 03:00:16 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id E534F5C00E8;
 Thu,  5 Jan 2023 21:00:13 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 05 Jan 2023 21:00:13 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jan 2023 21:00:12 -0500 (EST)
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
X-Inumbo-ID: dc1f9371-8d65-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1672970413; x=
	1673056813; bh=n4HZkBJhhcWVGPn6wmsxBFb/A7GL3M2SBbnddi32WiQ=; b=e
	psyyWjBsG+IJnTVB10cKN9EOWHjm70L+SWVTbqnQOguVu8FS3C6CEcVIdbJ9xMBd
	sliMpNKPhus6U84NPW10VK3y15ak+tVar98JKuBa4pxxm07usQS6VKwyKJdtUFjo
	30o/d0VinMjUBiJMHhE5q/enUPJKUoLN0AC/7tM49M3mrXQLdB4xcq513cYO/r0A
	ZBTmDxmLbhjdmCDPN9wu/n2Kq1p1Mm2JMpGYu42dnCS5PSBuvAcgGsY+nNFxIa2T
	AzO7CbHQPCBYum4c3CE0f+9cygoK4Q+VywY3o5VJnSk4400JYaDRtHdgFxnYWSG1
	KoIuXbHnpDetF4IvJat1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672970413; x=1673056813; bh=n4HZkBJhhcWVGPn6wmsxBFb/A7GL
	3M2SBbnddi32WiQ=; b=PoyysGK8WDMzfpzDbwxKUd7IPk+//sYnUN3974pl44j5
	nSce2chh1XAlZB16Hyy1MCfwE2mFGVYWkhKl+fQ5b1gMxQL4sB5+2rM5pT/Lw1RC
	K5vSOe/LXtw+Iud9rGE/sSkpqd/ktaPoi8+esbVyuuAJ2TMKVbcPxkZPJerB6jGo
	gxk6Qkg1seIhd0AFBF7EwcCyUNuT36PTCQp4XetY1R+3LS6Lw1+2O4Q1Ipx9mmWo
	q7S10TREYgr6S6/xoJBvRQd4rCpcRKEsMXiIpnNE7dI38ZV5sAXQFRarw8VY2ps1
	4NqT0wMSA4+CTBVqvlp1z9NfOQj7shSHNfzvQaN9Yg==
X-ME-Sender: <xms:rYC3YxIk-Ze6QFIRfx9x1z-Yy3A9vQ-0U8303sDIaOpySvMVLc8Ovg>
    <xme:rYC3Y9KjCrDMxfz5Bkz0dXYzB9ceW7tCmBnc-Qk5tAR3ZsaoST4aYHyESLEsfyM8S
    6u7Ru1pdWsh9Fo>
X-ME-Received: <xmr:rYC3Y5vErpxCevJPn9O_6212xBESe2v_QbTIs_K8ZX2bQofC8DrIjK7VfiF0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeelgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:rYC3YyZk1Kj2aNBLftcuLto_NwBd7cFm8bL5ylc8vAIhr0tgM_wzFA>
    <xmx:rYC3Y4aMtDf39RA4vrHrwd6ewXslTMbEYWTIJg83NJsPDKlkj5PD7g>
    <xmx:rYC3Y2DVji5xQNj-YULi3dzoBY398W3uXOYPamO86oN7WSSbFgLXGQ>
    <xmx:rYC3Y3x87RNoum8ZMGKrY3J3k0JKOtB6cZir3443ORQJaqiTcUUFvg>
Feedback-ID: iac594737:Fastmail
Date: Thu, 5 Jan 2023 21:00:03 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"Tim (Xen.org)" <tim@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v6 4/5] x86/mm: Reject invalid cacheability in PV guests
 by default
Message-ID: <Y7eAqgcEENVcn+bl@itl-email>
References: <cover.1671744225.git.demi@invisiblethingslab.com>
 <2236399f561d348937f2ff7777fe47ad4236dbda.1671744225.git.demi@invisiblethingslab.com>
 <c6223295-c4f9-8fa8-7635-80d48094190f@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FR8Kja2I10q88hmI"
Content-Disposition: inline
In-Reply-To: <c6223295-c4f9-8fa8-7635-80d48094190f@citrix.com>


--FR8Kja2I10q88hmI
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 5 Jan 2023 21:00:03 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	"Tim (Xen.org)" <tim@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>
Subject: Re: [PATCH v6 4/5] x86/mm: Reject invalid cacheability in PV guests
 by default

On Thu, Jan 05, 2023 at 08:28:26PM +0000, Andrew Cooper wrote:
> On 22/12/2022 10:31 pm, Demi Marie Obenour wrote:
> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-=
line.pandoc
> > index 424b12cfb27d6ade2ec63eacb8afe5df82465451..0230a7bc17cbd4362a42ea6=
4cea695f31f5e0f86 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -1417,6 +1417,17 @@ detection of systems known to misbehave upon acc=
esses to that port.
> >  ### idle_latency_factor (x86)
> >  > `=3D <integer>`
> > =20
> > +### invalid-cacheability (x86)
> > +> `=3D allow | deny | trap`
> > +
> > +> Default: `deny` in release builds, otherwise `trap`
> > +
> > +Specify what happens when a PV guest tries to use one of the reserved =
entries in
> > +the PAT.  `deny` causes the attempt to be rejected with -EINVAL, `allo=
w` allows
> > +the attempt, and `trap` causes a general protection fault to be raised.
> > +Currently, the reserved entries are marked as uncacheable in Xen's PAT=
, but this
> > +will change if new memory types are added, so guests must not rely on =
it.
> > +
>=20
> This wants to be scoped under "pv", and not a top-level option.=C2=A0 Cur=
rent
> parsing is at the top of xen/arch/x86/pv/domain.c
>=20
> How about `pv=3D{no-}oob-pat`, and parse it into the opt_pv_oob_pat boole=
an ?

Works for me, though I will use =E2=80=98invalid=E2=80=99 instead of =E2=80=
=98oob=E2=80=99 as valid PAT
entries might not be contiguous.

> There really is no need to distinguish between deny and trap.=C2=A0 IMO,
> injecting #GP unilaterally is fine (to a guest expecting the hypercall
> to succeed, -EINVAL vs #GP makes no difference, but #GP is far more
> useful to a human trying to debug issues here), but I could be talked
> into putting that behind a CONFIG_DEBUG if other feel strongly.

Marek, thoughts?

> > @@ -1343,7 +1374,34 @@ static int promote_l1_table(struct page_info *pa=
ge)
> >          }
> >          else
> >          {
> > -            switch ( ret =3D get_page_from_l1e(pl1e[i], d, d) )
> > +            l1_pgentry_t l1e =3D pl1e[i];
> > +
> > +            if ( invalid_cacheability !=3D INVALID_CACHEABILITY_ALLOW )
> > +            {
> > +                switch ( l1e.l1 & PAGE_CACHE_ATTRS )
> > +                {
> > +                case _PAGE_WB:
> > +                case _PAGE_UC:
> > +                case _PAGE_UCM:
> > +                case _PAGE_WC:
> > +                case _PAGE_WT:
> > +                case _PAGE_WP:
> > +                    break;
> > +                default:
> > +                    /*
> > +                     * If we get here, a PV guest tried to use one of =
the
> > +                     * reserved values in Xen's PAT.  This indicates a=
 bug
> > +                     * in the guest.  If requested by the user, inject=
 #GP
> > +                     * to cause the guest to log a stack trace.
> > +                     */
> > +                    if ( invalid_cacheability =3D=3D INVALID_CACHEABIL=
ITY_TRAP )
> > +                        pv_inject_hw_exception(TRAP_gp_fault, 0);
> > +                    ret =3D -EINVAL;
> > +                    goto fail;
> > +                }
> > +            }
>=20
> This will catch cases where the guest writes a full pagetable, then
> promotes it, but won't catch cases where the guest modifies an
> individual entry with mmu_update/etc.
>=20
> The logic needs to be in get_page_from_l1e() to get applied uniformly to
> all PTE modifications.

I will move it there, and also update Qubes OS=E2=80=99s patchset.

> Right now, the l1_disallow_mask() check near the start hides the "can
> you use a nonzero cacheattr" check.=C2=A0 If I ever get around to cleanin=
g up
> my post-XSA-402 series, I have a load of modifications to this.

I came up with some major cleanups too.

> But this could be something like this:
>=20
> if ( opt_pv_oob_pat && (l1f & PAGE_CACHE_ATTRS) > _PAGE_WP )
> {
> =C2=A0=C2=A0=C2=A0 // #GP
> =C2=A0=C2=A0=C2=A0 return -EINVAL;
> }
>=20
> fairly early on.
>=20
> It occurs to me that this check is only applicable when we're using the
> Xen ABI APT, and seeing as we've talked about possibly making patch 5 a
> Kconfig option, that may want accounting here.=C2=A0 (Perhaps simply maki=
ng
> opt_pb_oob_pat be false in a !XEN_PAT build.)

It=E2=80=99s actually applicable even with other PATs.  While Marek and I w=
ere
tracking down an Intel iGPU cache coherency problem, Marek used it to
verify that PAT entries that we thought were not being used were in fact
unused.  This allowed proving that the behavior of the GPU was impacted
by changes to PAT entries the hardware should not even be looking at,
and therefore that the hardware itself must be buggy.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--FR8Kja2I10q88hmI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmO3gKsACgkQsoi1X/+c
IsEGthAAj11euyGtkuY086E9VeDW2EyrMeCxS3CWqScUund/rBgQsR2J3oYVaZun
sjaNxZwPNnrB1qgd38evjCQF0Jq+MCC8Ng24wF1yYYtPqTUXUc63mowbPpoVBUBi
OJD1CIlU4joGsnLfQboKwgzV573KUWazeIQU30kasE4sXplyFIX62VlD9tsfPJwB
zzm+pzvj1OHDCNja1xtW77krS+2AbPbdTuArktXBduq8U8LirqzDr1ITYh1ypUBT
ridc/wxpmc1SBiGmjqs2Ae1xunbVHwzYLU3Kw0a/bChHv/kyb6yNIn0Q/uGBnw10
l3xuyF+QSaNdeeGyzYYzMGffESAv1c23gXU5bTRkAyo8TxgWyMvO8Wz8bzzLkUmR
yulAnsLO4oVVI356TpYeceOmVJbz/A6ZUJbD++cn/iEvzrAi+eAheCTSYTHDwC3j
MKhDX2XkVtAIOtU8phuSuF72i8zax8HAVhPTFSYeb/YKzrakPowR8+kSMU0d/b0D
egNyBqRTIPl6AAqOME/r0asoO7n/Icd89Zjp70whg4wF4lnx5Ky5HH3TYjdZa58q
fNyU7BMLxlSC78ekC3Qwj2feWx5VIYEca03RAZedWmnRY4Flr3tXeiQEK72POpF4
RNT9738xnN6oZQUBJnb6lczqI1Tiumi/3xmCkS12H0dYmPx2hXE=
=/Bzv
-----END PGP SIGNATURE-----

--FR8Kja2I10q88hmI--

