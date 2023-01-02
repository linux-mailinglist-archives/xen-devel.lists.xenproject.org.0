Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DAF65ACAD
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 02:01:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470200.729650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC9CG-0001pU-Fv; Mon, 02 Jan 2023 01:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470200.729650; Mon, 02 Jan 2023 01:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC9CG-0001lr-Bg; Mon, 02 Jan 2023 01:01:00 +0000
Received: by outflank-mailman (input) for mailman id 470200;
 Mon, 02 Jan 2023 01:00:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJmt=47=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pC9CF-0001Kp-J6
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 01:00:59 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea054943-8a38-11ed-91b6-6bf2151ebd3b;
 Mon, 02 Jan 2023 02:00:57 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 5AEBF5C009C;
 Sun,  1 Jan 2023 20:00:56 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 01 Jan 2023 20:00:56 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Jan 2023 20:00:53 -0500 (EST)
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
X-Inumbo-ID: ea054943-8a38-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1672621256; x=
	1672707656; bh=Vkd82xk0hwXjNxZx3kuGm8JTwE53wz2kGurdp3zIabA=; b=N
	bWv9dVghzrn5CzYjEZ2XHjk0LiN0KaMCPktk5F+y/BdYX+CedrW8476kTChm1VRU
	Bb+9pQ1RwPuBT0PJiRBLpheheynP9VT059+SRlEnG7qTk7vKmBv5HdKcm8wNfZK9
	puwYeGPARBbm4T1Eq+MAyXniln5vFBArd+B58ZYhpdL/nzC1RbWBlGA2VUFekdFh
	Iogn4XHThGCF6DjYNKCbhe/Z5rE8M9/h213Zy7rUiVihpkO/zf0qehbu+BfBRnGw
	MflvQTrnMc6XAaEpGp9bNw53EqbV+A2+GIO4o7nj4+Xfc/uBW16Rm2xAVsjAcWKg
	csaWTC/jLdRnUtQBi63Rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672621256; x=1672707656; bh=Vkd82xk0hwXjNxZx3kuGm8JTwE53
	wz2kGurdp3zIabA=; b=JIN4Paay5P/9fIVjA2E0OUWwcjj6sD5INPL8kYNmTuND
	bbADh1ig1kYqiQFeUS1ovTYHryEatSx4lxOEaMFl+ZvTrG0vcha8LmtoNsYrxI9Y
	BbKxCEi28nS1aIik/hXqu3hc/JHgLqO9V7993fQGWAXbDqz0EKgqWG9NIsY+HUIR
	yraTCVbyVq1TdW1C32ACl+hetr4MEJe1fj0BE419rCgujN7naaDdIi/4SF87EMRI
	yTTmskVhlg1ziO22ElBcLrC7RhtJV51miwr/tlYoKvkNmo7KjhhKHbrtwOpn6NzQ
	BaL6SjoYnlpVkigFkdQ8YCv8wy7oSldEGXggmAC01A==
X-ME-Sender: <xms:xyyyY7semQvE55h1Wk2brbt1lNEVWB_49iZIgaFUVcaaFobVNqriiw>
    <xme:xyyyY8czKEh2X7h4CklooemG1lJf2wYAmygMALmZr8CcMdwj5VgEzTfmPn-F-PEeB
    yrt-fhg5R4DkQ>
X-ME-Received: <xmr:xyyyY-wtdxzExXOkAchlxP2QOTXwhS6dk8qDokMvLX0yXnBVSGi0pwawfQ65FMyPXO0GYQuv1TQma-OnIaMCnK5ii9DcOxw-BA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedugddvkecutefuodetggdotefrodftvf
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
X-ME-Proxy: <xmx:xyyyY6MBdHQ01EjhjMtjFlnjkvkX9XD_0Pklv1BAvHaZxjuvLrljew>
    <xmx:xyyyY7_oZOdJJN8YbfygrhLj2MRVtgk80MlFlmSKlCxraaEmm9rU2Q>
    <xmx:xyyyY6VPDeLzQtYbGhlDEIn7IyhTXEu8DHAjzm1xbboVuY3_C2qHFw>
    <xmx:yCyyY7yoR9xjh2_JaOtFh0xF-iqF9xL4xUhPKjZGFOt4opLzhImfgw>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 2 Jan 2023 02:00:51 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Intel-gfx] [cache coherency bug] i915 and PAT attributes
Message-ID: <Y7Isw0VxkV91+rP0@mail-itl>
References: <Y5Hst0bCxQDTN7lK@mail-itl>
 <1c326e0c-5812-083a-0739-aa20fab3efc4@citrix.com>
 <Y6QVhRP+voSLi9xm@intel.com>
 <Y7IWWFaU54VWn266@mail-itl>
 <Y7IfS91fHQ/8fwXt@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZRMbSRxQJ79m73FE"
Content-Disposition: inline
In-Reply-To: <Y7IfS91fHQ/8fwXt@itl-email>


--ZRMbSRxQJ79m73FE
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 Jan 2023 02:00:51 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
	the arch/x86 maintainers <x86@kernel.org>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [Intel-gfx] [cache coherency bug] i915 and PAT attributes

On Sun, Jan 01, 2023 at 07:03:18PM -0500, Demi Marie Obenour wrote:
> On Mon, Jan 02, 2023 at 12:24:54AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Dec 22, 2022 at 10:29:57AM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
> > > On Fri, Dec 16, 2022 at 03:30:13PM +0000, Andrew Cooper wrote:
> > > > On 08/12/2022 1:55 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > Hi,
> > > > >
> > > > > There is an issue with i915 on Xen PV (dom0). The end result is a=
 lot of
> > > > > glitches, like here: https://openqa.qubes-os.org/tests/54748#step=
/startup/8
> > > > > (this one is on ADL, Linux 6.1-rc7 as a Xen PV dom0). It's using =
Xorg
> > > > > with "modesetting" driver.
> > > > >
> > > > > After some iterations of debugging, we narrowed it down to i915 h=
andling
> > > > > caching. The main difference is that PAT is setup differently on =
Xen PV
> > > > > than on native Linux. Normally, Linux does have appropriate abstr=
action
> > > > > for that, but apparently something related to i915 doesn't play w=
ell
> > > > > with it. The specific difference is:
> > > > > native linux:
> > > > > x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
> > > > > xen pv:
> > > > > x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC
> > > > >                                   ~~          ~~      ~~  ~~
> > > > >
> > > > > The specific impact depends on kernel version and the hardware. T=
he most
> > > > > severe issues I see on >=3DADL, but some older hardware is affect=
ed too -
> > > > > sometimes only if composition is disabled in the window manager.
> > > > > Some more information is collected at
> > > > > https://github.com/QubesOS/qubes-issues/issues/4782 (and few link=
ed
> > > > > duplicates...).
> > > > >
> > > > > Kind-of related commit is here:
> > > > > https://github.com/torvalds/linux/commit/bdd8b6c98239cad ("drm/i9=
15:
> > > > > replace X86_FEATURE_PAT with pat_enabled()") - it is the place wh=
ere
> > > > > i915 explicitly checks for PAT support, so I'm cc-ing people ment=
ioned
> > > > > there too.
> > > > >
> > > > > Any ideas?
> > > > >
> > > > > The issue can be easily reproduced without Xen too, by adjusting =
PAT in
> > > > > Linux:
> > > > > -----8<-----
> > > > > diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memtype.c
> > > > > index 66a209f7eb86..319ab60c8d8c 100644
> > > > > --- a/arch/x86/mm/pat/memtype.c
> > > > > +++ b/arch/x86/mm/pat/memtype.c
> > > > > @@ -400,8 +400,8 @@ void pat_init(void)
> > > > >  		 * The reserved slots are unused, but mapped to their
> > > > >  		 * corresponding types in the presence of PAT errata.
> > > > >  		 */
> > > > > -		pat =3D PAT(0, WB) | PAT(1, WC) | PAT(2, UC_MINUS) | PAT(3, UC=
) |
> > > > > -		      PAT(4, WB) | PAT(5, WP) | PAT(6, UC_MINUS) | PAT(7, WT);
> > > > > +		pat =3D PAT(0, WB) | PAT(1, WT) | PAT(2, UC_MINUS) | PAT(3, UC=
) |
> > > > > +		      PAT(4, WC) | PAT(5, WP) | PAT(6, UC)       | PAT(7, UC);
> > > > >  	}
> > > > > =20
> > > > >  	if (!pat_bp_initialized) {
> > > > > -----8<-----
> > > > >
> > > >=20
> > > > Hello, can anyone help please?
> > > >=20
> > > > Intel's CI has taken this reproducer of the bug, and confirmed the
> > > > regression.=C2=A0
> > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/T/#m448=
0c15a0d117dce6210562eb542875e757647fb
> > > >=20
> > > > We're reasonably confident that it is an i915 bug (given the repro =
with
> > > > no Xen in the mix), but we're out of any further ideas.
> > >=20
> > > I don't think we have any code that assumes anything about the PAT,
> > > apart from WC being available (which seems like it should still be
> > > the case with your modified PAT). I suppose you'll just have to=20
> > > start digging from pgprot_writecombine()/noncached() and make sure
> > > everything ends up using the correct PAT entry.
> >=20
> > I tried several approach to this, without success. Here is an update on
> > debugging (reported also on #intel-gfx live):
> >=20
> > I did several tests with different PAT configuration (by modifying Xen
> > that sets the MSR). Full table is at https://pad.itl.space/sheet/#/2/sh=
eet/view/HD1qT2Zf44Ha36TJ3wj2YL+PchsTidyNTFepW5++ZKM/
> > Some highlights:
> > - 1=3DWC, 4=3DWT - good
> > - 1=3DWT, 4=3DWC - bad
> > - 1=3DWT, 3=3DWC (4=3DWC too) - good
> > - 1=3DWT, 5=3DWC - good
> >=20
> > So, for me it seems WC at index 4 is problematic for some reason.
> >=20
> > Next, I tried to trap all the places in arch/x86/xen/mmu_pv.c that
> > write PTEs and verify requested cache attributes. There, it seems all
> > the requested WC are properly translated (using either index 1, 3, 4, or
> > 5 according to PAT settings). And then after reading PTE back, it indeed
> > seems to be correctly set. I didn't added reading back after
> > HYPERVISOR_update_va_mapping, but verified it isn't used for setting WC.
> >=20
> > Using the same method, I also checked that indexes that aren't supposed
> > to be used (for example index 4 when both 3 and 4 are WC) indeed are not
> > used. So, the hypothesis that specific indexes are hardcoded somewhere
> > is unlikely.
> >=20
> > This all looks very weird to me. Any ideas?
>=20
> Old CPUs have had hardware errata that caused the top bit of the PAT
> entry to be ignored in certain cases.  Could modern CPUs be ignoring
> this bit when accessing iGPU memory or registers?  With WC at position
> 4, this would cause WC to be treated as WB, which is consistent with the
> observed behavior.  WC at position 3 would not be impacted, and WC at
> position 5 would be treated as WT which I expect to be safe.  One way to
> test this is to test 1=3DWB, 5=3DWC.  If my hypothesis is correct, this
> should trigger the bug, even if entry 1 in the PAT is unused because
> entry 0 is also WB.

This looks like a very probable situation, indeed 1=3DWB, 5=3DWC does
trigger the bug! Specifically this layout:

    WB	WB	UC-	UC	WP	WC	WT	UC

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ZRMbSRxQJ79m73FE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOyLMMACgkQ24/THMrX
1yzksAf+LbWU8vxaEkf4STfhncM6CbXghzbFswKWaKDltJdvfXQ20ZmeXTb3nWLe
Mi2+HcNdl2niQVEgZB+qXyp5AJIhnTIhsF5X+zvh3a1MQsOtILZx2wwCDqbXezTv
9OQ55kx2z3ujhAgIme/pxQOQRZWum9+luspCL7lNJFRwwBdhSE1eQAHGqaHsBdtr
ytPO6ZODN5Fb7q5aCZ4WNzsKFQ2wsROzmVO14opSpyE2YgaKFjQfTpevhin/gnYz
pGkuDWRFGURry8WJcwhpI6e009Gf8Kz7rt7+oW0z+IxxT3zS1q2x+xZ2vY6+S8uQ
qQdv9UjlUOkFXqK79ZNfy1WOmSkF3Q==
=K+CU
-----END PGP SIGNATURE-----

--ZRMbSRxQJ79m73FE--

