Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A837B65AC8C
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 01:04:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470191.729639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC8Ij-0007CF-Ii; Mon, 02 Jan 2023 00:03:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470191.729639; Mon, 02 Jan 2023 00:03:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC8Ij-0007AI-Fn; Mon, 02 Jan 2023 00:03:37 +0000
Received: by outflank-mailman (input) for mailman id 470191;
 Mon, 02 Jan 2023 00:03:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JwIb=47=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pC8Ih-0007A8-0L
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 00:03:35 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e33489e9-8a30-11ed-91b6-6bf2151ebd3b;
 Mon, 02 Jan 2023 01:03:31 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 5C91D32002E2;
 Sun,  1 Jan 2023 19:03:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 01 Jan 2023 19:03:28 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Jan 2023 19:03:25 -0500 (EST)
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
X-Inumbo-ID: e33489e9-8a30-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1672617806; x=
	1672704206; bh=QWrm808uO4klYg+6e3E8cUIIB4tFpjr8qW51PGfU32Y=; b=e
	bxkn2aTRgu0l59e/6Oqdv6szPiRBO/78w1Dd4UOM6PIZweGRHIQxl4jxuAEh4G6q
	h6WKeYhEXx87JPUVPW70MDZ6MwXxkpK+cuxYVvN3ErWXuGdRht8aF685LcKKPPBO
	WtDrSlUn4NsjCl9UEVbnzK0ZKaAY5uItq8Cdir1wNZHYOK/tksh3Z49iWoi7kcCQ
	srPNIJwKhcIkabtF9ru1pOXZFefD4udHeEzUR7XX582gDCYYtilPY/enYOq3ggv7
	o+HRBvoaMmj5/r9aPSre1itLobIx45f+lbvYduihtnHb4btv9PmKJ6S34Qdn1RW7
	NHVHx/ijWKZwAMtvmh1yA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672617806; x=1672704206; bh=QWrm808uO4klYg+6e3E8cUIIB4tF
	pjr8qW51PGfU32Y=; b=GrJqyVNBo1kfGOBnftWq0Fy4NW/bcBSZWe32fh0zB0Ld
	+5mj0k1EGOF19qyj8UPEY1Rt3JJADs6bsVlxdSK9EbmuoI2F19fLtg85bbmld1nV
	ifXciu1X8CJzp4XhovimjUUvRIktBAHyZ0UzYGvp/Ev6vNjT2MvXIFVhwHZwv/+d
	GAo06YHHudENWVehkLtBIBzInPdWVN5CO0nrEQWuKFQjKsmF3/3kWNi83/USi1LN
	5nfldfLSwVpbRVk+6fRZVfdKINXxVh6xWz8Ln5HT8ONiyyx0mxv+3AwJ27UZpmQ4
	Ll5LGd83t3GNvd26+2pbr8q33VyCWkq7D/H6Yx9F1g==
X-ME-Sender: <xms:Th-yY-JYANqI5Br2v7M0dMA_VrNmA9FGkU8WpaHOgSv_JXg5P6NPPw>
    <xme:Th-yY2IAT1b3HE9ld9zZXA5iRlauzHpR24vA5t_19EbdtoAE3D-b8lh9Y4H5Y_NTD
    xcFBiP6NJAEkNs>
X-ME-Received: <xmr:Th-yY-uNswf0ElLgnxnkrruOXpeardYK8e49Tg4MFtQMdtQfDvYpMjnQiBKl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedugdduhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetleffvdehleeffeffudffvedutdev
    geffvdffkeevfeevkefhjeegleduteffjeenucffohhmrghinhepqhhusggvshdqohhsrd
    horhhgpdhgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpdhithhlrdhsphgrtggv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmh
    hisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Th-yYzb7e3xkX7s4ZTG6pUKl-Dz7lS616SqSntfkyN43uek1LHI0bA>
    <xmx:Th-yY1Y-iAr_Gs8NX7Nl25GRo3RgapwRr83qmmTPlvZqkOenG53BmQ>
    <xmx:Th-yY_BqMnBhjuRUsPnRSrDeLkIIaFRWLPRRjXRPIIVW-8kSanBRVA>
    <xmx:Th-yY6O6nQyxRPLFMEnb8wdMvfvqy3gJinap4wAg8KxCcG1sr4IgOA>
Feedback-ID: iac594737:Fastmail
Date: Sun, 1 Jan 2023 19:03:18 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Intel-gfx] [cache coherency bug] i915 and PAT attributes
Message-ID: <Y7IfS91fHQ/8fwXt@itl-email>
References: <Y5Hst0bCxQDTN7lK@mail-itl>
 <1c326e0c-5812-083a-0739-aa20fab3efc4@citrix.com>
 <Y6QVhRP+voSLi9xm@intel.com>
 <Y7IWWFaU54VWn266@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sna7pTQbM0Qkvz+e"
Content-Disposition: inline
In-Reply-To: <Y7IWWFaU54VWn266@mail-itl>


--sna7pTQbM0Qkvz+e
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 1 Jan 2023 19:03:18 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Intel-gfx] [cache coherency bug] i915 and PAT attributes

On Mon, Jan 02, 2023 at 12:24:54AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Dec 22, 2022 at 10:29:57AM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > On Fri, Dec 16, 2022 at 03:30:13PM +0000, Andrew Cooper wrote:
> > > On 08/12/2022 1:55 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Hi,
> > > >
> > > > There is an issue with i915 on Xen PV (dom0). The end result is a l=
ot of
> > > > glitches, like here: https://openqa.qubes-os.org/tests/54748#step/s=
tartup/8
> > > > (this one is on ADL, Linux 6.1-rc7 as a Xen PV dom0). It's using Xo=
rg
> > > > with "modesetting" driver.
> > > >
> > > > After some iterations of debugging, we narrowed it down to i915 han=
dling
> > > > caching. The main difference is that PAT is setup differently on Xe=
n PV
> > > > than on native Linux. Normally, Linux does have appropriate abstrac=
tion
> > > > for that, but apparently something related to i915 doesn't play well
> > > > with it. The specific difference is:
> > > > native linux:
> > > > x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
> > > > xen pv:
> > > > x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC
> > > >                                   ~~          ~~      ~~  ~~
> > > >
> > > > The specific impact depends on kernel version and the hardware. The=
 most
> > > > severe issues I see on >=3DADL, but some older hardware is affected=
 too -
> > > > sometimes only if composition is disabled in the window manager.
> > > > Some more information is collected at
> > > > https://github.com/QubesOS/qubes-issues/issues/4782 (and few linked
> > > > duplicates...).
> > > >
> > > > Kind-of related commit is here:
> > > > https://github.com/torvalds/linux/commit/bdd8b6c98239cad ("drm/i915:
> > > > replace X86_FEATURE_PAT with pat_enabled()") - it is the place where
> > > > i915 explicitly checks for PAT support, so I'm cc-ing people mentio=
ned
> > > > there too.
> > > >
> > > > Any ideas?
> > > >
> > > > The issue can be easily reproduced without Xen too, by adjusting PA=
T in
> > > > Linux:
> > > > -----8<-----
> > > > diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> > > > index 66a209f7eb86..319ab60c8d8c 100644
> > > > --- a/arch/x86/mm/pat/memtype.c
> > > > +++ b/arch/x86/mm/pat/memtype.c
> > > > @@ -400,8 +400,8 @@ void pat_init(void)
> > > >  		 * The reserved slots are unused, but mapped to their
> > > >  		 * corresponding types in the presence of PAT errata.
> > > >  		 */
> > > > -		pat =3D PAT(0, WB) | PAT(1, WC) | PAT(2, UC_MINUS) | PAT(3, UC) |
> > > > -		      PAT(4, WB) | PAT(5, WP) | PAT(6, UC_MINUS) | PAT(7, WT);
> > > > +		pat =3D PAT(0, WB) | PAT(1, WT) | PAT(2, UC_MINUS) | PAT(3, UC) |
> > > > +		      PAT(4, WC) | PAT(5, WP) | PAT(6, UC)       | PAT(7, UC);
> > > >  	}
> > > > =20
> > > >  	if (!pat_bp_initialized) {
> > > > -----8<-----
> > > >
> > >=20
> > > Hello, can anyone help please?
> > >=20
> > > Intel's CI has taken this reproducer of the bug, and confirmed the
> > > regression.=C2=A0
> > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/T/#m4480c=
15a0d117dce6210562eb542875e757647fb
> > >=20
> > > We're reasonably confident that it is an i915 bug (given the repro wi=
th
> > > no Xen in the mix), but we're out of any further ideas.
> >=20
> > I don't think we have any code that assumes anything about the PAT,
> > apart from WC being available (which seems like it should still be
> > the case with your modified PAT). I suppose you'll just have to=20
> > start digging from pgprot_writecombine()/noncached() and make sure
> > everything ends up using the correct PAT entry.
>=20
> I tried several approach to this, without success. Here is an update on
> debugging (reported also on #intel-gfx live):
>=20
> I did several tests with different PAT configuration (by modifying Xen
> that sets the MSR). Full table is at https://pad.itl.space/sheet/#/2/shee=
t/view/HD1qT2Zf44Ha36TJ3wj2YL+PchsTidyNTFepW5++ZKM/
> Some highlights:
> - 1=3DWC, 4=3DWT - good
> - 1=3DWT, 4=3DWC - bad
> - 1=3DWT, 3=3DWC (4=3DWC too) - good
> - 1=3DWT, 5=3DWC - good
>=20
> So, for me it seems WC at index 4 is problematic for some reason.
>=20
> Next, I tried to trap all the places in arch/x86/xen/mmu_pv.c that
> write PTEs and verify requested cache attributes. There, it seems all
> the requested WC are properly translated (using either index 1, 3, 4, or
> 5 according to PAT settings). And then after reading PTE back, it indeed
> seems to be correctly set. I didn't added reading back after
> HYPERVISOR_update_va_mapping, but verified it isn't used for setting WC.
>=20
> Using the same method, I also checked that indexes that aren't supposed
> to be used (for example index 4 when both 3 and 4 are WC) indeed are not
> used. So, the hypothesis that specific indexes are hardcoded somewhere
> is unlikely.
>=20
> This all looks very weird to me. Any ideas?

Old CPUs have had hardware errata that caused the top bit of the PAT
entry to be ignored in certain cases.  Could modern CPUs be ignoring
this bit when accessing iGPU memory or registers?  With WC at position
4, this would cause WC to be treated as WB, which is consistent with the
observed behavior.  WC at position 3 would not be impacted, and WC at
position 5 would be treated as WT which I expect to be safe.  One way to
test this is to test 1=3DWB, 5=3DWC.  If my hypothesis is correct, this
should trigger the bug, even if entry 1 in the PAT is unused because
entry 0 is also WB.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--sna7pTQbM0Qkvz+e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOyH0sACgkQsoi1X/+c
IsHkExAAwPBiEG7fU2iXwJT+pGOCsgqm0InTt1WC6YwaJi/6s/0qVqm5KZx/mN2/
x/So26ifOHDD/FMfsBGbfodobx7dvLsQwujMiOWgS03p7rh9C3kyT93rlx47y4U6
QSM5JQzkiM0I/7cQw3HTYTG0bUbIIzRPN856pW/7arGXTtOmFWaqKWxPnB8fqNe1
dmpjK5Zz+MCvayA8gUvvIaQ9aFbC7k40BA/7uCKga7T3acyUAfRCVFd0+0nAnfRP
hEDjlQjejLsuaKT2eLYZdweiHJZtOhYoRg8DFzam+BQaNIslI9HRZ8x3cIi+6UYQ
2oR+hTKCtgUQPd9q2aQUWMeq9BXNzfQyUTWw+Vn7fXc7awe4j7bYAfIVV6nXlk6W
6qFqHUlTcjYmmG17484RL/dHWkJPE+B3beuo8kSvXqHoyXp9z18kLLcCJocN1gkX
n4TjWU7TSuOg68kwVruWsg1uOznzZTIktLw83zPmAFYJiIh83eE+yEwttCD4pogf
A9oE/jMqdhoEuyZBjE3Ru8/YXoEk/h7if9wGvBUU58/jATGDMuOtbk90zptVqtcl
IEeoVqLBBe5zDNW1YBlL6EpP4xfTRXbQ+diRUU2J0UhVLmMF0hGYxAPLgsUFpuE+
CtXH/JDlIUWU3up7t6yedp74exPvS5PWExWh7GJ7bGxn38G3Zk8=
=7ciq
-----END PGP SIGNATURE-----

--sna7pTQbM0Qkvz+e--

