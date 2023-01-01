Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC28365AC79
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 00:26:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470161.729606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC7hk-0003Wj-4e; Sun, 01 Jan 2023 23:25:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470161.729606; Sun, 01 Jan 2023 23:25:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC7hk-0003TO-1G; Sun, 01 Jan 2023 23:25:24 +0000
Received: by outflank-mailman (input) for mailman id 470161;
 Sun, 01 Jan 2023 23:25:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11tG=46=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pC7hi-0003TI-LJ
 for xen-devel@lists.xenproject.org; Sun, 01 Jan 2023 23:25:23 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d485b44-8a2b-11ed-8fd4-01056ac49cbb;
 Mon, 02 Jan 2023 00:25:19 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5B4EA5C00C0;
 Sun,  1 Jan 2023 18:25:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 01 Jan 2023 18:25:17 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Jan 2023 18:25:15 -0500 (EST)
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
X-Inumbo-ID: 8d485b44-8a2b-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1672615517; x=
	1672701917; bh=/ixdKicwJ/iycAG6e0GinH8Mqtqh91IJTxQYyBrr4/w=; b=H
	1pgl1lOn+0MlZV8pXl1MhvIWeD5BWbonVS7e+UQCx1ERgtgx4ZiKvJN41YZ9b0bE
	0zrYBiFHHRc3KCyaHBwK9s5PeUxQLexwIM7acb2aYUmLQDSvCwmxZVAP/lxXnAoN
	mO5xSSZCSFiDlcLXmnFt8tdnl/oSiDINKyUwkCcR3K61Nr0d+0et3Z40UcDAzsQc
	UzDOfwEjhVC8QtUov0eWS5Od8TzsMwHDh8UtLzpBb2Bt+1lXu/FiQD9mScCPQf44
	lQ8FVD5ja2QFhZMDE9oWW1TykTyK1YqdOyPexUYgTWT2I2pD4+xSOYPeUon+fmzg
	YmhOUH8Hi9Wc4mttjvIpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672615517; x=1672701917; bh=/ixdKicwJ/iycAG6e0GinH8Mqtqh
	91IJTxQYyBrr4/w=; b=LSXapZ0UHiFYgZKAfSw5WsYsso5FM0DBX3rzu/tgHD2S
	q9dyt5+dzJLH3p8aWw5z74Ku8XGQF8x2i1Pbb0cy7+58D/M/U+Z2WK/RlMsb0sfI
	y3MtpBZvcLwiomOHVdim2RRRrwlu8dd0hT+9LyNAZwQq6duza1VhPQyZEzMOQ0Fa
	C0wZE/JAwsxE8JbNi8tzbjZylApBE03N8GyGCHb0OHCBUYFwd0s8VJ6cmN1InZzg
	14y3AhVPkLlp354HtuF+tcLvDqV3KuX+zMO8KXFpbagG+CN/jV1Yj8tpM2tdgwY6
	zPpeob7jjOJ6oPk4FuVnQc0wPo+2agGyQXnHeShFfQ==
X-ME-Sender: <xms:XBayYxrh135QIcykO2qzZPXmNASgpenDhQcF2VsQZislBPTA8eCWPA>
    <xme:XBayYzpQFk6OhMG9eCLu1qeI_Y67xCTpsuIFiT0Cu8zTqPGaa9MKHru6X9TyGKG3q
    VYTGYBUwRZ1Ew>
X-ME-Received: <xmr:XBayY-OcbIREEfomdkuvtXHYbOCauGUysuNAX3mTvxH2g1mQrbf9lN4qkEBz8PJTKHdCHkJGI6SaWoQZkaRo55YDMlDbBY-uWQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedugddtkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeliedu
    tdfggfekuefhhedtfeevhfetgfdtvdeujeeuteevtdeutdegffeguedufeenucffohhmrg
    hinhepqhhusggvshdqohhsrdhorhhgpdhgihhthhhusgdrtghomhdpkhgvrhhnvghlrdho
    rhhgpdhithhlrdhsphgrtggvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:XBayY84qWrcvSI3V5jpnCzAkTgwHRcSlN90AkYsXRABU3Cf5_YMlcQ>
    <xmx:XBayYw4SBWqm7g61m2N3T4mT4DQxjKEpQMYUaJpZXUlmCtqbQfWj2w>
    <xmx:XBayY0jgL_zqlkUttBiYNkUwGBmEskEohqEJB9b0ZUi_Nuc90fwYrw>
    <xmx:XRayY9vAx0_FK4IK-YP1I9F6ssNP5-T_BWCfRH_m7DnYFdub8JZFXg>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 2 Jan 2023 00:24:54 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	"Demi M. Obenour" <demi@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Intel-gfx] [cache coherency bug] i915 and PAT attributes
Message-ID: <Y7IWWFaU54VWn266@mail-itl>
References: <Y5Hst0bCxQDTN7lK@mail-itl>
 <1c326e0c-5812-083a-0739-aa20fab3efc4@citrix.com>
 <Y6QVhRP+voSLi9xm@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mv1JohAN8Ksm/tl+"
Content-Disposition: inline
In-Reply-To: <Y6QVhRP+voSLi9xm@intel.com>


--mv1JohAN8Ksm/tl+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 Jan 2023 00:24:54 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	"Demi M. Obenour" <demi@invisiblethingslab.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Intel-gfx] [cache coherency bug] i915 and PAT attributes

On Thu, Dec 22, 2022 at 10:29:57AM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Fri, Dec 16, 2022 at 03:30:13PM +0000, Andrew Cooper wrote:
> > On 08/12/2022 1:55 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > > Hi,
> > >
> > > There is an issue with i915 on Xen PV (dom0). The end result is a lot=
 of
> > > glitches, like here: https://openqa.qubes-os.org/tests/54748#step/sta=
rtup/8
> > > (this one is on ADL, Linux 6.1-rc7 as a Xen PV dom0). It's using Xorg
> > > with "modesetting" driver.
> > >
> > > After some iterations of debugging, we narrowed it down to i915 handl=
ing
> > > caching. The main difference is that PAT is setup differently on Xen =
PV
> > > than on native Linux. Normally, Linux does have appropriate abstracti=
on
> > > for that, but apparently something related to i915 doesn't play well
> > > with it. The specific difference is:
> > > native linux:
> > > x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
> > > xen pv:
> > > x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC
> > >                                   ~~          ~~      ~~  ~~
> > >
> > > The specific impact depends on kernel version and the hardware. The m=
ost
> > > severe issues I see on >=3DADL, but some older hardware is affected t=
oo -
> > > sometimes only if composition is disabled in the window manager.
> > > Some more information is collected at
> > > https://github.com/QubesOS/qubes-issues/issues/4782 (and few linked
> > > duplicates...).
> > >
> > > Kind-of related commit is here:
> > > https://github.com/torvalds/linux/commit/bdd8b6c98239cad ("drm/i915:
> > > replace X86_FEATURE_PAT with pat_enabled()") - it is the place where
> > > i915 explicitly checks for PAT support, so I'm cc-ing people mentioned
> > > there too.
> > >
> > > Any ideas?
> > >
> > > The issue can be easily reproduced without Xen too, by adjusting PAT =
in
> > > Linux:
> > > -----8<-----
> > > diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> > > index 66a209f7eb86..319ab60c8d8c 100644
> > > --- a/arch/x86/mm/pat/memtype.c
> > > +++ b/arch/x86/mm/pat/memtype.c
> > > @@ -400,8 +400,8 @@ void pat_init(void)
> > >  		 * The reserved slots are unused, but mapped to their
> > >  		 * corresponding types in the presence of PAT errata.
> > >  		 */
> > > -		pat =3D PAT(0, WB) | PAT(1, WC) | PAT(2, UC_MINUS) | PAT(3, UC) |
> > > -		      PAT(4, WB) | PAT(5, WP) | PAT(6, UC_MINUS) | PAT(7, WT);
> > > +		pat =3D PAT(0, WB) | PAT(1, WT) | PAT(2, UC_MINUS) | PAT(3, UC) |
> > > +		      PAT(4, WC) | PAT(5, WP) | PAT(6, UC)       | PAT(7, UC);
> > >  	}
> > > =20
> > >  	if (!pat_bp_initialized) {
> > > -----8<-----
> > >
> >=20
> > Hello, can anyone help please?
> >=20
> > Intel's CI has taken this reproducer of the bug, and confirmed the
> > regression.=C2=A0
> > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/T/#m4480c15=
a0d117dce6210562eb542875e757647fb
> >=20
> > We're reasonably confident that it is an i915 bug (given the repro with
> > no Xen in the mix), but we're out of any further ideas.
>=20
> I don't think we have any code that assumes anything about the PAT,
> apart from WC being available (which seems like it should still be
> the case with your modified PAT). I suppose you'll just have to=20
> start digging from pgprot_writecombine()/noncached() and make sure
> everything ends up using the correct PAT entry.

I tried several approach to this, without success. Here is an update on
debugging (reported also on #intel-gfx live):

I did several tests with different PAT configuration (by modifying Xen
that sets the MSR). Full table is at https://pad.itl.space/sheet/#/2/sheet/=
view/HD1qT2Zf44Ha36TJ3wj2YL+PchsTidyNTFepW5++ZKM/
Some highlights:
- 1=3DWC, 4=3DWT - good
- 1=3DWT, 4=3DWC - bad
- 1=3DWT, 3=3DWC (4=3DWC too) - good
- 1=3DWT, 5=3DWC - good

So, for me it seems WC at index 4 is problematic for some reason.

Next, I tried to trap all the places in arch/x86/xen/mmu_pv.c that
write PTEs and verify requested cache attributes. There, it seems all
the requested WC are properly translated (using either index 1, 3, 4, or
5 according to PAT settings). And then after reading PTE back, it indeed
seems to be correctly set. I didn't added reading back after
HYPERVISOR_update_va_mapping, but verified it isn't used for setting WC.

Using the same method, I also checked that indexes that aren't supposed
to be used (for example index 4 when both 3 and 4 are WC) indeed are not
used. So, the hypothesis that specific indexes are hardcoded somewhere
is unlikely.

This all looks very weird to me. Any ideas?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--mv1JohAN8Ksm/tl+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOyFlcACgkQ24/THMrX
1ywfAgf9HICPEpdpOi9mXoYblTrjrO4RH9tA/NauSwf1bRPaDbUtVVvYhCqFJRAA
bV1OFtI5TsP6Nq4jJdqMCQO39+BodGJDIeX0+gsFkhvzftL0tbf4+QNSi6jlh0Sx
k8kUmMEJRy0wo49DrAg8CemdzV7AdlO6faS3OTWvrGE0bweii/Tj9VwOvzh7KGku
lG/5VuTg8pxfx34re6VNKpMMqlviVkfFAkpnBz/clQrlwZJ5hrn6GApc3PmN9BXT
5XbsJOkGPdNbqSHikGIuYcqB6Xaj5adTaMVn3U0hhpLv8EJLv46NRqgk7UP3TOe5
ciqIqp8tvU/ksvdbWObDOVkgzhn8bw==
=Krhb
-----END PGP SIGNATURE-----

--mv1JohAN8Ksm/tl+--

