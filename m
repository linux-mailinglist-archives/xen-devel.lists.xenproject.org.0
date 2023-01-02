Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A0365ACCC
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 02:49:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470218.729671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC9wF-0005Za-A1; Mon, 02 Jan 2023 01:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470218.729671; Mon, 02 Jan 2023 01:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pC9wF-0005Xs-69; Mon, 02 Jan 2023 01:48:31 +0000
Received: by outflank-mailman (input) for mailman id 470218;
 Mon, 02 Jan 2023 01:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JwIb=47=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pC9wD-0005Xm-OI
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 01:48:29 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89498e70-8a3f-11ed-8fd4-01056ac49cbb;
 Mon, 02 Jan 2023 02:48:22 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B0AB532003CE;
 Sun,  1 Jan 2023 20:48:22 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 01 Jan 2023 20:48:23 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Jan 2023 20:48:20 -0500 (EST)
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
X-Inumbo-ID: 89498e70-8a3f-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1672624102; x=
	1672710502; bh=cIx24x0KYrdmbF9rhXPF+ueoJK5CbFbBsixsjiFIyTA=; b=y
	quWpo9NWEUD6eKxRWXmnIVtM4n1mdref6I1rw1vi3SaylcPkrtFECZq8N8Z5LoHo
	jpX17cTglH0HN3XiI86ffSzb5GhzpeQUAJnN+Vvx9bo2lD0WDSInB1GUXaRf0vwb
	MhRHuhb4mXrKBAOlXlEKN9yf9/jotECUSw0WeWDDNA1PngumefSC1yU6VTW+NTZh
	2AXd3vVH2f8FU2PbNEcv1qygf++Pvl5vE/6U7wGNGQBU69KFwpmI5QjQXGKFvzZm
	7RiUXmnJQ0aPUIl8lBX9MkhwG7WjGtvkKPk79yL0aylQnW+CNMgbFQtCof9FYFV3
	Em1OC3HV5XDLgweSVWteQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672624102; x=1672710502; bh=cIx24x0KYrdmbF9rhXPF+ueoJK5C
	bFbBsixsjiFIyTA=; b=rmzK1e6jYgwQ5/iS+ionKPE3u/6AWuKeL+rpsvlNuv4O
	j9kEUf6/NSR/m0ci7xJ+s6fkpJv4mryQ+ENDXkJXVV1+QK30Y8dnoBEyOI4a2fSZ
	0r3KtmXyTm01Meo+bZjPEAgMWFdNXOaxOkDfXu6G7BDMgXdP6XjYdmINBo76B4Qc
	U7cii1udF4zGU/Edz0cQq2WMQtOKJoCyjyp9vVOK0zfXNOxIsa4X0wHkBbivvTPE
	p+70JoKth6owmn2GxHarEPYSUxylTb5B71DePVF0H7sskOYYDpQG+6Vuotc+nEpe
	WOdFVyCOzH0QRMEwG0x3pNeJ6COIJi3zXCMD19AYIg==
X-ME-Sender: <xms:5TeyY_mOsUy6p8rf2R1HSm6bV332KDM9m0aRA_jU6cGmWoiyMkMVTA>
    <xme:5TeyYy2yjzFL04xOGU4jE4GfEWbu-fM0dEZptwyJPGqOl0n-jP2OVAJ2WcHoDkj_d
    lMjHnpDWuj58Mw>
X-ME-Received: <xmr:5TeyY1qjH3M5l76VPn1P69vuuqKiyCYRPoBqzEVURyuQmFCr8NCxdsFv-VZ2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedugdefjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetleffvdehleeffeffudffvedutdev
    geffvdffkeevfeevkefhjeegleduteffjeenucffohhmrghinhepqhhusggvshdqohhsrd
    horhhgpdhgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgpdhithhlrdhsphgrtggv
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmh
    hisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:5TeyY3nVFlnThrUqDtfkBvk-RVhwxMyi5rFcoq2_YvlY3vM7KqkWzQ>
    <xmx:5TeyY91eU2iPESjl_hDqB7DLtYbIlE4cvTzk8Q4sKPPOxBFqDz_AzQ>
    <xmx:5TeyY2uOXO0-GxokHwRH_bKEmNFgmgEa9IMOVOXotCbWOn96Qr80uw>
    <xmx:5jeyY3qkdLAMM2XDPDBOmYfRHHMeMxd-YVK1BF86eLMITNULTELRPA>
Feedback-ID: iac594737:Fastmail
Date: Sun, 1 Jan 2023 20:48:13 -0500
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
Message-ID: <Y7I3486sAGEVby1U@itl-email>
References: <Y5Hst0bCxQDTN7lK@mail-itl>
 <1c326e0c-5812-083a-0739-aa20fab3efc4@citrix.com>
 <Y6QVhRP+voSLi9xm@intel.com>
 <Y7IWWFaU54VWn266@mail-itl>
 <Y7IfS91fHQ/8fwXt@itl-email>
 <Y7Isw0VxkV91+rP0@mail-itl>
 <Y7Iwx14scvdamsSj@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hSJ/g7c8/Ke3ldGo"
Content-Disposition: inline
In-Reply-To: <Y7Iwx14scvdamsSj@itl-email>


--hSJ/g7c8/Ke3ldGo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 1 Jan 2023 20:48:13 -0500
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

On Sun, Jan 01, 2023 at 08:17:52PM -0500, Demi Marie Obenour wrote:
> On Mon, Jan 02, 2023 at 02:00:51AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Sun, Jan 01, 2023 at 07:03:18PM -0500, Demi Marie Obenour wrote:
> > > On Mon, Jan 02, 2023 at 12:24:54AM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Thu, Dec 22, 2022 at 10:29:57AM +0200, Ville Syrj=C3=A4l=C3=A4 w=
rote:
> > > > > On Fri, Dec 16, 2022 at 03:30:13PM +0000, Andrew Cooper wrote:
> > > > > > On 08/12/2022 1:55 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > There is an issue with i915 on Xen PV (dom0). The end result =
is a lot of
> > > > > > > glitches, like here: https://openqa.qubes-os.org/tests/54748#=
step/startup/8
> > > > > > > (this one is on ADL, Linux 6.1-rc7 as a Xen PV dom0). It's us=
ing Xorg
> > > > > > > with "modesetting" driver.
> > > > > > >
> > > > > > > After some iterations of debugging, we narrowed it down to i9=
15 handling
> > > > > > > caching. The main difference is that PAT is setup differently=
 on Xen PV
> > > > > > > than on native Linux. Normally, Linux does have appropriate a=
bstraction
> > > > > > > for that, but apparently something related to i915 doesn't pl=
ay well
> > > > > > > with it. The specific difference is:
> > > > > > > native linux:
> > > > > > > x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
> > > > > > > xen pv:
> > > > > > > x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC
> > > > > > >                                   ~~          ~~      ~~  ~~
> > > > > > >
> > > > > > > The specific impact depends on kernel version and the hardwar=
e. The most
> > > > > > > severe issues I see on >=3DADL, but some older hardware is af=
fected too -
> > > > > > > sometimes only if composition is disabled in the window manag=
er.
> > > > > > > Some more information is collected at
> > > > > > > https://github.com/QubesOS/qubes-issues/issues/4782 (and few =
linked
> > > > > > > duplicates...).
> > > > > > >
> > > > > > > Kind-of related commit is here:
> > > > > > > https://github.com/torvalds/linux/commit/bdd8b6c98239cad ("dr=
m/i915:
> > > > > > > replace X86_FEATURE_PAT with pat_enabled()") - it is the plac=
e where
> > > > > > > i915 explicitly checks for PAT support, so I'm cc-ing people =
mentioned
> > > > > > > there too.
> > > > > > >
> > > > > > > Any ideas?
> > > > > > >
> > > > > > > The issue can be easily reproduced without Xen too, by adjust=
ing PAT in
> > > > > > > Linux:
> > > > > > > -----8<-----
> > > > > > > diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/memt=
ype.c
> > > > > > > index 66a209f7eb86..319ab60c8d8c 100644
> > > > > > > --- a/arch/x86/mm/pat/memtype.c
> > > > > > > +++ b/arch/x86/mm/pat/memtype.c
> > > > > > > @@ -400,8 +400,8 @@ void pat_init(void)
> > > > > > >  		 * The reserved slots are unused, but mapped to their
> > > > > > >  		 * corresponding types in the presence of PAT errata.
> > > > > > >  		 */
> > > > > > > -		pat =3D PAT(0, WB) | PAT(1, WC) | PAT(2, UC_MINUS) | PAT(3=
, UC) |
> > > > > > > -		      PAT(4, WB) | PAT(5, WP) | PAT(6, UC_MINUS) | PAT(7, =
WT);
> > > > > > > +		pat =3D PAT(0, WB) | PAT(1, WT) | PAT(2, UC_MINUS) | PAT(3=
, UC) |
> > > > > > > +		      PAT(4, WC) | PAT(5, WP) | PAT(6, UC)       | PAT(7, =
UC);
> > > > > > >  	}
> > > > > > > =20
> > > > > > >  	if (!pat_bp_initialized) {
> > > > > > > -----8<-----
> > > > > > >
> > > > > >=20
> > > > > > Hello, can anyone help please?
> > > > > >=20
> > > > > > Intel's CI has taken this reproducer of the bug, and confirmed =
the
> > > > > > regression.=C2=A0
> > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/T/#=
m4480c15a0d117dce6210562eb542875e757647fb
> > > > > >=20
> > > > > > We're reasonably confident that it is an i915 bug (given the re=
pro with
> > > > > > no Xen in the mix), but we're out of any further ideas.
> > > > >=20
> > > > > I don't think we have any code that assumes anything about the PA=
T,
> > > > > apart from WC being available (which seems like it should still be
> > > > > the case with your modified PAT). I suppose you'll just have to=
=20
> > > > > start digging from pgprot_writecombine()/noncached() and make sure
> > > > > everything ends up using the correct PAT entry.
> > > >=20
> > > > I tried several approach to this, without success. Here is an updat=
e on
> > > > debugging (reported also on #intel-gfx live):
> > > >=20
> > > > I did several tests with different PAT configuration (by modifying =
Xen
> > > > that sets the MSR). Full table is at https://pad.itl.space/sheet/#/=
2/sheet/view/HD1qT2Zf44Ha36TJ3wj2YL+PchsTidyNTFepW5++ZKM/
> > > > Some highlights:
> > > > - 1=3DWC, 4=3DWT - good
> > > > - 1=3DWT, 4=3DWC - bad
> > > > - 1=3DWT, 3=3DWC (4=3DWC too) - good
> > > > - 1=3DWT, 5=3DWC - good
> > > >=20
> > > > So, for me it seems WC at index 4 is problematic for some reason.
> > > >=20
> > > > Next, I tried to trap all the places in arch/x86/xen/mmu_pv.c that
> > > > write PTEs and verify requested cache attributes. There, it seems a=
ll
> > > > the requested WC are properly translated (using either index 1, 3, =
4, or
> > > > 5 according to PAT settings). And then after reading PTE back, it i=
ndeed
> > > > seems to be correctly set. I didn't added reading back after
> > > > HYPERVISOR_update_va_mapping, but verified it isn't used for settin=
g WC.
> > > >=20
> > > > Using the same method, I also checked that indexes that aren't supp=
osed
> > > > to be used (for example index 4 when both 3 and 4 are WC) indeed ar=
e not
> > > > used. So, the hypothesis that specific indexes are hardcoded somewh=
ere
> > > > is unlikely.
> > > >=20
> > > > This all looks very weird to me. Any ideas?
> > >=20
> > > Old CPUs have had hardware errata that caused the top bit of the PAT
> > > entry to be ignored in certain cases.  Could modern CPUs be ignoring
> > > this bit when accessing iGPU memory or registers?  With WC at position
> > > 4, this would cause WC to be treated as WB, which is consistent with =
the
> > > observed behavior.  WC at position 3 would not be impacted, and WC at
> > > position 5 would be treated as WT which I expect to be safe.  One way=
 to
> > > test this is to test 1=3DWB, 5=3DWC.  If my hypothesis is correct, th=
is
> > > should trigger the bug, even if entry 1 in the PAT is unused because
> > > entry 0 is also WB.
> >=20
> > This looks like a very probable situation, indeed 1=3DWB, 5=3DWC does
> > trigger the bug! Specifically this layout:
> >=20
> >     WB	WB	UC-	UC	WP	WC	WT	UC
>=20
> What about WB WT WB UC WB WP WC UC- and WB WT WT UC WB WP WC UC-?  Those
> only differ in entry 2, which will not be used as it duplicates entry 0
> or 1.  Therefore, architecturally, these should behave identically.  If
> I am correct, the second will work fine, but the first will trigger the
> bug.

Also worth testing:

WB  UC- UC  WB  WB  WP  WT  WC
WB  UC- UC  UC  WB  WP  WT  WC

These differ only in (unused) entry 3.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--hSJ/g7c8/Ke3ldGo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOyN+MACgkQsoi1X/+c
IsF4eBAAm/8NuQ6F7sPJh36pPa13o66PgJLeu7Ncoe34u5rWemIwVj5vZ9dei7SP
hbcl8frTWIs3ay7mvpg4FJFn7foLzk9LbTQJyimBUqGU2Q9B2nIqiSgZN8VEZyHR
STe6XMIFnREbln6YT8eg4DJesTE4yVXeDJgojpQm1WaaTof3mmtyLpsPNEZ2BBl5
lZRwIHtgcHNmQyJxG1pNU5lGwrvXrOMJVneuMYUabr/2xpcYGWMXpwrvBdPHoGtD
tMwKIqvF69R2GmYspp3omVURtBhMYwfzrcHKyhouNTy/y8hCI25Ov0DHqUWGzQYP
0KUOhyqAVKw0TGGRfkdcBhd40DDlGShNx2MxFySDzcfAz+C3T9Xtup9oYVj0t9pH
btU8+6zF7Ko2McdFFeZiNPZFq8j2SntnDwqDemqIgp3OM5gEw2fa+nTRlYgtOGoS
v3p/iixJi3tlgW3Chs9AB8tim+zWt8cJjKQifpvUWw9Zi05Ca7myzAXi9NRXHiqg
0BuhLLN08079RdkLKWOqj0aTkyrbjTy2bKH8+/sxFCggdVCZSiJzv91uyGTleK7m
SeH2Kwi0fPVX2Jik5SVHyLCyyJ2ICgqSbE4Ya9/3OBa3nCeKm97t/DDaZjMsY8MO
OTe4QlRyZKge/3rNkFK39y7TQ6gZd3MAakQIKuYfkherQqpPC2E=
=cznL
-----END PGP SIGNATURE-----

--hSJ/g7c8/Ke3ldGo--

