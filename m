Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4694965ACBE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 02:19:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470208.729660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC9St-0002Et-Qi; Mon, 02 Jan 2023 01:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470208.729660; Mon, 02 Jan 2023 01:18:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC9St-0002C6-Nb; Mon, 02 Jan 2023 01:18:11 +0000
Received: by outflank-mailman (input) for mailman id 470208;
 Mon, 02 Jan 2023 01:18:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JwIb=47=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pC9Ss-0002C0-At
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 01:18:10 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4ee087d1-8a3b-11ed-91b6-6bf2151ebd3b;
 Mon, 02 Jan 2023 02:18:06 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 23C7832006F5;
 Sun,  1 Jan 2023 20:18:03 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 01 Jan 2023 20:18:03 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Jan 2023 20:18:01 -0500 (EST)
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
X-Inumbo-ID: 4ee087d1-8a3b-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1672622282; x=
	1672708682; bh=yVoTWhV9NOKPo4v/n3sT/VMH9GHO2ZdiZBvPkH9zdC8=; b=B
	vMoYz9Mhi9YgxkkD3IIl5q0kG4dW8IaCqWvko7S1VMASUN7f88iKJRsEvT/bFxJ/
	m26ip5/42bqXaNAtxLqWebGyk+qWgv6BjAeJWMxd6viebeIdSLT5pAIgN3wWiRyW
	XywzNeCGT6D2BXAJ8TXz5jXrH6v3UeRi1RxgcEpOfaz8QryIo9lsoqC+Pv1CfskK
	RVyCZkZrt0qoq0q+Dq77ZmDQImvafYJzFBZb4oszMVZ5cHLMekMUa892VVZ1M6mH
	210ErWh7zE5Hlzl5w2m7/2d9rKPCTYlTp4AlA38pqJYDQTA4tSpdxbG0i+EFBm9J
	Rgo9biNVcWIvomPQTPC/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672622282; x=1672708682; bh=yVoTWhV9NOKPo4v/n3sT/VMH9GHO
	2ZdiZBvPkH9zdC8=; b=laMRUKP7nV5k4DmVETxqR13hJI8RB0akL2mRwZWmzr47
	bpqo/s/VgAhLqew5gfWIZL5j/09kJT2k2sY0/uThi6YqBXl5R93Q5mjy3tpam9iP
	hRFFCKe5o7HJNnL2b3D9XLlsez1o6NNFxtuSCPhP/SZTcxJ9r5iNMyWFsX5fEb3y
	RQ3gC1P8Z+qyeVPq07pm0cpfXw2z20ycksnF5Ul08czz6+b8M0H381KyqhEOOfNC
	w5J/KUYP7A6BdOSNd2eP6uP7/r6Je4lFmfcVE8INpfIrqxWb/HxcrDNmaB97+cUX
	uriLyiscHnjVs9GaDQ8V+RlbpJ2WVro13xGJfivOEg==
X-ME-Sender: <xms:yTCyY10JoPGbSMuds6Mw9TshHYhyNK2o8cOgsMi3GAB0EbOMcGjZIQ>
    <xme:yTCyY8GmPzk5_rvjPYA8_nIeNiQuQ_ElPLZktNobYCZiZfydMAscpT7W6g_juh67y
    vEl2rlgyGKO1gA>
X-ME-Received: <xmr:yTCyY16-N58FwS5jdpsq5bo7u61__MfsTxSX3ZGE3mx7QW_Rg3PNGlf6NGj5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedugdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetleffvdehleeffeffudffvedutdev
    geffvdffkeevfeevkefhjeegleduteffjeenucffohhmrghinhepqhhusggvshdqohhsrd
    horhhgpdhgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpdhithhlrdhsphgrtggv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmh
    hisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:yTCyYy3uTycFw6oU8EB1CMFpEo5U0ur6EjSyhZhjWpp9vk9-cRYdZQ>
    <xmx:yTCyY4GbxGBqpk4rlmZVguAGNzHSMTgGSuhIaNWUfgi2l-kH7d82yw>
    <xmx:yTCyYz-4PpHqjCC9i2Cfu7JmirvBfym-EMAa_s7b-b3PP7Pk-I0rlQ>
    <xmx:yjCyY95_RmMtWKFJsQb89_a6LLAEMjsX9PpL8QaoqAPK4W61DuGSng>
Feedback-ID: iac594737:Fastmail
Date: Sun, 1 Jan 2023 20:17:52 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Intel-gfx] [cache coherency bug] i915 and PAT attributes
Message-ID: <Y7Iwx14scvdamsSj@itl-email>
References: <Y5Hst0bCxQDTN7lK@mail-itl>
 <1c326e0c-5812-083a-0739-aa20fab3efc4@citrix.com>
 <Y6QVhRP+voSLi9xm@intel.com>
 <Y7IWWFaU54VWn266@mail-itl>
 <Y7IfS91fHQ/8fwXt@itl-email>
 <Y7Isw0VxkV91+rP0@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2tpZ6p+tZudaMPXj"
Content-Disposition: inline
In-Reply-To: <Y7Isw0VxkV91+rP0@mail-itl>


--2tpZ6p+tZudaMPXj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 1 Jan 2023 20:17:52 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Intel-gfx] [cache coherency bug] i915 and PAT attributes

On Mon, Jan 02, 2023 at 02:00:51AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Sun, Jan 01, 2023 at 07:03:18PM -0500, Demi Marie Obenour wrote:
> > On Mon, Jan 02, 2023 at 12:24:54AM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Thu, Dec 22, 2022 at 10:29:57AM +0200, Ville Syrj=C3=A4l=C3=A4 wro=
te:
> > > > On Fri, Dec 16, 2022 at 03:30:13PM +0000, Andrew Cooper wrote:
> > > > > On 08/12/2022 1:55 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > Hi,
> > > > > >
> > > > > > There is an issue with i915 on Xen PV (dom0). The end result is=
 a lot of
> > > > > > glitches, like here: https://openqa.qubes-os.org/tests/54748#st=
ep/startup/8
> > > > > > (this one is on ADL, Linux 6.1-rc7 as a Xen PV dom0). It's usin=
g Xorg
> > > > > > with "modesetting" driver.
> > > > > >
> > > > > > After some iterations of debugging, we narrowed it down to i915=
 handling
> > > > > > caching. The main difference is that PAT is setup differently o=
n Xen PV
> > > > > > than on native Linux. Normally, Linux does have appropriate abs=
traction
> > > > > > for that, but apparently something related to i915 doesn't play=
 well
> > > > > > with it. The specific difference is:
> > > > > > native linux:
> > > > > > x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
> > > > > > xen pv:
> > > > > > x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC
> > > > > >                                   ~~          ~~      ~~  ~~
> > > > > >
> > > > > > The specific impact depends on kernel version and the hardware.=
 The most
> > > > > > severe issues I see on >=3DADL, but some older hardware is affe=
cted too -
> > > > > > sometimes only if composition is disabled in the window manager.
> > > > > > Some more information is collected at
> > > > > > https://github.com/QubesOS/qubes-issues/issues/4782 (and few li=
nked
> > > > > > duplicates...).
> > > > > >
> > > > > > Kind-of related commit is here:
> > > > > > https://github.com/torvalds/linux/commit/bdd8b6c98239cad ("drm/=
i915:
> > > > > > replace X86_FEATURE_PAT with pat_enabled()") - it is the place =
where
> > > > > > i915 explicitly checks for PAT support, so I'm cc-ing people me=
ntioned
> > > > > > there too.
> > > > > >
> > > > > > Any ideas?
> > > > > >
> > > > > > The issue can be easily reproduced without Xen too, by adjustin=
g PAT in
> > > > > > Linux:
> > > > > > -----8<-----
> > > > > > diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtyp=
e.c
> > > > > > index 66a209f7eb86..319ab60c8d8c 100644
> > > > > > --- a/arch/x86/mm/pat/memtype.c
> > > > > > +++ b/arch/x86/mm/pat/memtype.c
> > > > > > @@ -400,8 +400,8 @@ void pat_init(void)
> > > > > >  		 * The reserved slots are unused, but mapped to their
> > > > > >  		 * corresponding types in the presence of PAT errata.
> > > > > >  		 */
> > > > > > -		pat =3D PAT(0, WB) | PAT(1, WC) | PAT(2, UC_MINUS) | PAT(3, =
UC) |
> > > > > > -		      PAT(4, WB) | PAT(5, WP) | PAT(6, UC_MINUS) | PAT(7, WT=
);
> > > > > > +		pat =3D PAT(0, WB) | PAT(1, WT) | PAT(2, UC_MINUS) | PAT(3, =
UC) |
> > > > > > +		      PAT(4, WC) | PAT(5, WP) | PAT(6, UC)       | PAT(7, UC=
);
> > > > > >  	}
> > > > > > =20
> > > > > >  	if (!pat_bp_initialized) {
> > > > > > -----8<-----
> > > > > >
> > > > >=20
> > > > > Hello, can anyone help please?
> > > > >=20
> > > > > Intel's CI has taken this reproducer of the bug, and confirmed the
> > > > > regression.=C2=A0
> > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/T/#m4=
480c15a0d117dce6210562eb542875e757647fb
> > > > >=20
> > > > > We're reasonably confident that it is an i915 bug (given the repr=
o with
> > > > > no Xen in the mix), but we're out of any further ideas.
> > > >=20
> > > > I don't think we have any code that assumes anything about the PAT,
> > > > apart from WC being available (which seems like it should still be
> > > > the case with your modified PAT). I suppose you'll just have to=20
> > > > start digging from pgprot_writecombine()/noncached() and make sure
> > > > everything ends up using the correct PAT entry.
> > >=20
> > > I tried several approach to this, without success. Here is an update =
on
> > > debugging (reported also on #intel-gfx live):
> > >=20
> > > I did several tests with different PAT configuration (by modifying Xen
> > > that sets the MSR). Full table is at https://pad.itl.space/sheet/#/2/=
sheet/view/HD1qT2Zf44Ha36TJ3wj2YL+PchsTidyNTFepW5++ZKM/
> > > Some highlights:
> > > - 1=3DWC, 4=3DWT - good
> > > - 1=3DWT, 4=3DWC - bad
> > > - 1=3DWT, 3=3DWC (4=3DWC too) - good
> > > - 1=3DWT, 5=3DWC - good
> > >=20
> > > So, for me it seems WC at index 4 is problematic for some reason.
> > >=20
> > > Next, I tried to trap all the places in arch/x86/xen/mmu_pv.c that
> > > write PTEs and verify requested cache attributes. There, it seems all
> > > the requested WC are properly translated (using either index 1, 3, 4,=
 or
> > > 5 according to PAT settings). And then after reading PTE back, it ind=
eed
> > > seems to be correctly set. I didn't added reading back after
> > > HYPERVISOR_update_va_mapping, but verified it isn't used for setting =
WC.
> > >=20
> > > Using the same method, I also checked that indexes that aren't suppos=
ed
> > > to be used (for example index 4 when both 3 and 4 are WC) indeed are =
not
> > > used. So, the hypothesis that specific indexes are hardcoded somewhere
> > > is unlikely.
> > >=20
> > > This all looks very weird to me. Any ideas?
> >=20
> > Old CPUs have had hardware errata that caused the top bit of the PAT
> > entry to be ignored in certain cases.  Could modern CPUs be ignoring
> > this bit when accessing iGPU memory or registers?  With WC at position
> > 4, this would cause WC to be treated as WB, which is consistent with the
> > observed behavior.  WC at position 3 would not be impacted, and WC at
> > position 5 would be treated as WT which I expect to be safe.  One way to
> > test this is to test 1=3DWB, 5=3DWC.  If my hypothesis is correct, this
> > should trigger the bug, even if entry 1 in the PAT is unused because
> > entry 0 is also WB.
>=20
> This looks like a very probable situation, indeed 1=3DWB, 5=3DWC does
> trigger the bug! Specifically this layout:
>=20
>     WB	WB	UC-	UC	WP	WC	WT	UC

What about WB WT WB UC WB WP WC UC- and WB WT WT UC WB WP WC UC-?  Those
only differ in entry 2, which will not be used as it duplicates entry 0
or 1.  Therefore, architecturally, these should behave identically.  If
I am correct, the second will work fine, but the first will trigger the
bug.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--2tpZ6p+tZudaMPXj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOyMMcACgkQsoi1X/+c
IsFgvA/9FmiZPls9UyctSYLzjz5C03aRvLIN/oFqAo/laqzBcDPHVJeCLWr39qy6
hUoXgzqIGISsDyAmzAgX3+fdd7WkNRjqworEjRdtYRFu7hGkzbPkFd7oa7Ty+CCk
QUy7oZo8u/UEjiBfTctO5P/YZaKFIqZyLFeVRRZp3kZUS+pk35IJ4EE7n7bm7duH
HHGvrptmL8u2KpPNlPLKQamQYHDVemsf6q5MJQ7HdL6ouD3+bv/DFqxxeYECNhiP
XiJ3lyZdbgrzoRGFGTM7MzxHZkG3agWcE4tz6s4owEYUxdkUb4YX4Kr8Nd9SK00F
hy3l266Auwi1s6NZfXx3IA4zLwlII+7UmBhUai42dKSNVX0+8lIDt7wYArVoW2f+
wXlZk8fDxr/tqx/wzCj1thWIdcue10TB/xPFXmSdcW0zDz82rU6xg0aLg8OWlKR7
ssGUl28ApVPgD95u+xONhGvWegD7N1TjUGVTTPMwHh12308h8T9sze//53ws5Jjy
yv6si59zBe2qN2RroSBtcAM9qX+yrTovpY38V8sde+sIPIXLOrLdRNekpQK9AbsE
Gbxg+02/9Exq0KKgS/6KmbUUD/NRpK+Q/gHAWPAS5uU9QmOhIs6OGiQ3Ni1Z4uvy
e0lpaiLd3TTfrY1U0Z/4dmBsqbZHCHw+L6B75y8ZsTcN4EIS2vE=
=rum4
-----END PGP SIGNATURE-----

--2tpZ6p+tZudaMPXj--

