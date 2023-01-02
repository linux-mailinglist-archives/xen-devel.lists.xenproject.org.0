Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A26EE65ACCF
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 02:58:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470226.729683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCA5y-00075K-3x; Mon, 02 Jan 2023 01:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470226.729683; Mon, 02 Jan 2023 01:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCA5y-00071w-1B; Mon, 02 Jan 2023 01:58:34 +0000
Received: by outflank-mailman (input) for mailman id 470226;
 Mon, 02 Jan 2023 01:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJmt=47=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pCA5w-00071q-KT
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 01:58:32 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f1810f9c-8a40-11ed-8fd4-01056ac49cbb;
 Mon, 02 Jan 2023 02:58:26 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 7573B5C016C;
 Sun,  1 Jan 2023 20:58:28 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sun, 01 Jan 2023 20:58:28 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Jan 2023 20:58:26 -0500 (EST)
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
X-Inumbo-ID: f1810f9c-8a40-11ed-8fd4-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1672624708; x=
	1672711108; bh=SkyBYYpMMvL3uEm5eSua/6wIi9ndNHC5rn4cANOE338=; b=R
	vee3pGnzlD3J8m018uX/+iSyU3O/8VMJvJU/pm2BLIlXNDO/81yA9k48+b1k8HzG
	ndmCGnLQkhBWQgeif0jeuKqG0aJf1PiefKC8BwRNlgdYqw/gKh70DX3JK2A+pRF9
	YcDOJ3ZQipjC4X5bKdRe2bVlUYlZFdSAKmTI+0n76vTkccDeLjT7Ok6AKaRm22/h
	7BLLyPoh17o23UOLS5cz8GzA6DbL74+ofSuVXsEdTdRMbxMikKet76Z3HZdmwcqz
	sRSQUFnAxqqVVQiTnw/2As5Ath4GxE0oKxSPJMPEoF4Ve0UW1mxuaXMD/NvuGy2H
	7tWthK1zAnilsL/93Mxbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672624708; x=1672711108; bh=SkyBYYpMMvL3uEm5eSua/6wIi9nd
	NHC5rn4cANOE338=; b=N+BkGOOEgKU/A5Fcz3XDri2ZgFHi3ZwmcdzBvbvIf+mx
	0OlZSPHqz8NfymsIbkBnBZPPGpcQI2ev9w1YvPSG7LqxQJpeBG0pylDtJbrK1V9n
	bW5wEWm5yN+vfQzuMavxtOjyRMm/Xt1YssPMeEdpDERJrBZ8R7/Lm9GkSydGpTns
	ZTfGtl7h2JkzpV3S+ciENBSJKw4uj2GubaSeCycbKCoabvRRZrKjxU/EzeNi1iE9
	7jApf0ro+d8ukNKaP4b2865DcyVwUoSw9BdOwr6VtfFgUMOLo95eWz1kbTHIMlf0
	OsiCyob8GsMxP+CaK4FqdZE/Vlv1mY6uZNT9I7UCvQ==
X-ME-Sender: <xms:RDqyYwHZiRS36eGqh9LvV1s9S2wmL9vJSTnFR-DtoLCVbd-sGLgZ4g>
    <xme:RDqyY5VnisoXRqr9S-k7Ifpp8KhMkQ4CqoodG9xeh_4fOBe5ZkjzxexOH8IsiYdYG
    FW2zKJOVgoESA>
X-ME-Received: <xmr:RDqyY6JQukBRi1KXNuk4ANc_mZNLOTCgov5g_0Kfz8h5-QlctgSdWIsFlSafvR2UqsDdpMcNG4dBwJFMkoYTqujSK6U3uKnJdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedugdeflecutefuodetggdotefrodftvf
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
X-ME-Proxy: <xmx:RDqyYyFNAQpzUg9TrVgyZzunMW0DFC6UijTg5rduddItO8AM__eJBA>
    <xmx:RDqyY2VBiWKzyRBt1hQfCjdEgAF8VigArkh4haYinzPnWiIGa-pN4g>
    <xmx:RDqyY1MyNKXP5aPmkMVQM3eeI_X46cCfqTs56HyLdSQOHL0lz5_pVA>
    <xmx:RDqyY4KAk6rs8vrQyTjEwq_b5_s8FIeDgo7YXVpYmxkdF49OSgRamg>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 2 Jan 2023 02:58:23 +0100
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
Subject: Re: [Intel-gfx] [cache coherency bug] [hw bug?] i915 and PAT
 attributes
Message-ID: <Y7I6P2peo5j/vymz@mail-itl>
References: <Y5Hst0bCxQDTN7lK@mail-itl>
 <1c326e0c-5812-083a-0739-aa20fab3efc4@citrix.com>
 <Y6QVhRP+voSLi9xm@intel.com>
 <Y7IWWFaU54VWn266@mail-itl>
 <Y7IfS91fHQ/8fwXt@itl-email>
 <Y7Isw0VxkV91+rP0@mail-itl>
 <Y7Iwx14scvdamsSj@itl-email>
 <Y7I3486sAGEVby1U@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FiKZDM0ecfbmwtbS"
Content-Disposition: inline
In-Reply-To: <Y7I3486sAGEVby1U@itl-email>


--FiKZDM0ecfbmwtbS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 Jan 2023 02:58:23 +0100
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
Subject: Re: [Intel-gfx] [cache coherency bug] [hw bug?] i915 and PAT
 attributes

On Sun, Jan 01, 2023 at 08:48:13PM -0500, Demi Marie Obenour wrote:
> On Sun, Jan 01, 2023 at 08:17:52PM -0500, Demi Marie Obenour wrote:
> > On Mon, Jan 02, 2023 at 02:00:51AM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Sun, Jan 01, 2023 at 07:03:18PM -0500, Demi Marie Obenour wrote:
> > > > On Mon, Jan 02, 2023 at 12:24:54AM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > On Thu, Dec 22, 2022 at 10:29:57AM +0200, Ville Syrj=C3=A4l=C3=A4=
 wrote:
> > > > > > On Fri, Dec 16, 2022 at 03:30:13PM +0000, Andrew Cooper wrote:
> > > > > > > On 08/12/2022 1:55 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > There is an issue with i915 on Xen PV (dom0). The end resul=
t is a lot of
> > > > > > > > glitches, like here: https://openqa.qubes-os.org/tests/5474=
8#step/startup/8
> > > > > > > > (this one is on ADL, Linux 6.1-rc7 as a Xen PV dom0). It's =
using Xorg
> > > > > > > > with "modesetting" driver.
> > > > > > > >
> > > > > > > > After some iterations of debugging, we narrowed it down to =
i915 handling
> > > > > > > > caching. The main difference is that PAT is setup different=
ly on Xen PV
> > > > > > > > than on native Linux. Normally, Linux does have appropriate=
 abstraction
> > > > > > > > for that, but apparently something related to i915 doesn't =
play well
> > > > > > > > with it. The specific difference is:
> > > > > > > > native linux:
> > > > > > > > x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
> > > > > > > > xen pv:
> > > > > > > > x86/PAT: Configuration [0-7]: WB  WT  UC- UC  WC  WP  UC  UC
> > > > > > > >                                   ~~          ~~      ~~  ~~
> > > > > > > >
> > > > > > > > The specific impact depends on kernel version and the hardw=
are. The most
> > > > > > > > severe issues I see on >=3DADL, but some older hardware is =
affected too -
> > > > > > > > sometimes only if composition is disabled in the window man=
ager.
> > > > > > > > Some more information is collected at
> > > > > > > > https://github.com/QubesOS/qubes-issues/issues/4782 (and fe=
w linked
> > > > > > > > duplicates...).
> > > > > > > >
> > > > > > > > Kind-of related commit is here:
> > > > > > > > https://github.com/torvalds/linux/commit/bdd8b6c98239cad ("=
drm/i915:
> > > > > > > > replace X86_FEATURE_PAT with pat_enabled()") - it is the pl=
ace where
> > > > > > > > i915 explicitly checks for PAT support, so I'm cc-ing peopl=
e mentioned
> > > > > > > > there too.
> > > > > > > >
> > > > > > > > Any ideas?
> > > > > > > >
> > > > > > > > The issue can be easily reproduced without Xen too, by adju=
sting PAT in
> > > > > > > > Linux:
> > > > > > > > -----8<-----
> > > > > > > > diff --git a/arch/x86/mm/pat/memtype.c b/arch/x86/mm/pat/me=
mtype.c
> > > > > > > > index 66a209f7eb86..319ab60c8d8c 100644
> > > > > > > > --- a/arch/x86/mm/pat/memtype.c
> > > > > > > > +++ b/arch/x86/mm/pat/memtype.c
> > > > > > > > @@ -400,8 +400,8 @@ void pat_init(void)
> > > > > > > >  		 * The reserved slots are unused, but mapped to their
> > > > > > > >  		 * corresponding types in the presence of PAT errata.
> > > > > > > >  		 */
> > > > > > > > -		pat =3D PAT(0, WB) | PAT(1, WC) | PAT(2, UC_MINUS) | PAT=
(3, UC) |
> > > > > > > > -		      PAT(4, WB) | PAT(5, WP) | PAT(6, UC_MINUS) | PAT(7=
, WT);
> > > > > > > > +		pat =3D PAT(0, WB) | PAT(1, WT) | PAT(2, UC_MINUS) | PAT=
(3, UC) |
> > > > > > > > +		      PAT(4, WC) | PAT(5, WP) | PAT(6, UC)       | PAT(7=
, UC);
> > > > > > > >  	}
> > > > > > > > =20
> > > > > > > >  	if (!pat_bp_initialized) {
> > > > > > > > -----8<-----
> > > > > > > >
> > > > > > >=20
> > > > > > > Hello, can anyone help please?
> > > > > > >=20
> > > > > > > Intel's CI has taken this reproducer of the bug, and confirme=
d the
> > > > > > > regression.=C2=A0
> > > > > > > https://lore.kernel.org/intel-gfx/Y5Hst0bCxQDTN7lK@mail-itl/T=
/#m4480c15a0d117dce6210562eb542875e757647fb
> > > > > > >=20
> > > > > > > We're reasonably confident that it is an i915 bug (given the =
repro with
> > > > > > > no Xen in the mix), but we're out of any further ideas.
> > > > > >=20
> > > > > > I don't think we have any code that assumes anything about the =
PAT,
> > > > > > apart from WC being available (which seems like it should still=
 be
> > > > > > the case with your modified PAT). I suppose you'll just have to=
=20
> > > > > > start digging from pgprot_writecombine()/noncached() and make s=
ure
> > > > > > everything ends up using the correct PAT entry.
> > > > >=20
> > > > > I tried several approach to this, without success. Here is an upd=
ate on
> > > > > debugging (reported also on #intel-gfx live):
> > > > >=20
> > > > > I did several tests with different PAT configuration (by modifyin=
g Xen
> > > > > that sets the MSR). Full table is at https://pad.itl.space/sheet/=
#/2/sheet/view/HD1qT2Zf44Ha36TJ3wj2YL+PchsTidyNTFepW5++ZKM/
> > > > > Some highlights:
> > > > > - 1=3DWC, 4=3DWT - good
> > > > > - 1=3DWT, 4=3DWC - bad
> > > > > - 1=3DWT, 3=3DWC (4=3DWC too) - good
> > > > > - 1=3DWT, 5=3DWC - good
> > > > >=20
> > > > > So, for me it seems WC at index 4 is problematic for some reason.
> > > > >=20
> > > > > Next, I tried to trap all the places in arch/x86/xen/mmu_pv.c that
> > > > > write PTEs and verify requested cache attributes. There, it seems=
 all
> > > > > the requested WC are properly translated (using either index 1, 3=
, 4, or
> > > > > 5 according to PAT settings). And then after reading PTE back, it=
 indeed
> > > > > seems to be correctly set. I didn't added reading back after
> > > > > HYPERVISOR_update_va_mapping, but verified it isn't used for sett=
ing WC.
> > > > >=20
> > > > > Using the same method, I also checked that indexes that aren't su=
pposed
> > > > > to be used (for example index 4 when both 3 and 4 are WC) indeed =
are not
> > > > > used. So, the hypothesis that specific indexes are hardcoded some=
where
> > > > > is unlikely.
> > > > >=20
> > > > > This all looks very weird to me. Any ideas?
> > > >=20
> > > > Old CPUs have had hardware errata that caused the top bit of the PAT
> > > > entry to be ignored in certain cases.  Could modern CPUs be ignoring
> > > > this bit when accessing iGPU memory or registers?  With WC at posit=
ion
> > > > 4, this would cause WC to be treated as WB, which is consistent wit=
h the
> > > > observed behavior.  WC at position 3 would not be impacted, and WC =
at
> > > > position 5 would be treated as WT which I expect to be safe.  One w=
ay to
> > > > test this is to test 1=3DWB, 5=3DWC.  If my hypothesis is correct, =
this
> > > > should trigger the bug, even if entry 1 in the PAT is unused because
> > > > entry 0 is also WB.
> > >=20
> > > This looks like a very probable situation, indeed 1=3DWB, 5=3DWC does
> > > trigger the bug! Specifically this layout:
> > >=20
> > >     WB	WB	UC-	UC	WP	WC	WT	UC
> >=20
> > What about WB WT WB UC WB WP WC UC- and WB WT WT UC WB WP WC UC-?  Those
> > only differ in entry 2, which will not be used as it duplicates entry 0
> > or 1.  Therefore, architecturally, these should behave identically.  If
> > I am correct, the second will work fine, but the first will trigger the
> > bug.

Bingo! This also behaves as predicted.

So, it indeed looks like the _PAGE_PAT bit is ignored by the hardware,
even though set in relevant PTEs.

> Also worth testing:
>=20
> WB  UC- UC  WB  WB  WP  WT  WC
> WB  UC- UC  UC  WB  WP  WT  WC
>=20
> These differ only in (unused) entry 3.

I'll skip this, as I think it's pretty clear what will be the result.
But if somebody else think it's worth testing anyway, let me know.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FiKZDM0ecfbmwtbS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOyOj8ACgkQ24/THMrX
1yzWTAf+Nm62uwMkKfko7fNV0IB2LOSKLMk8dRIQAOk4ah3LCtiGYJBfYuxsb2EP
luPaltO3LnmfKR+iiRckJXR/7Z+wCfks0yiYEdqa+GxkNlZtZd4XNuUHhKJQBi1j
JKrjweJDftepahzDEFfdNyFfTxegeRHnzPvhYAprZJ1NT83bo4hqvF5ghBoPcRPy
YILB76OXUlO315IqJ9sZUJHeSJTcJHgif/ZMF+lkYRfy0pIGrKCEWyZTUKv0ygB4
L/EU0U4AL2OJNX0Wt77XRW+b1v/quVm1aswCVks4a6Y32E9bCNR6ATCk4Cspz2p+
ZRojW+IfIUYtT+qnW3aJasLmp0NyIA==
=yf4Y
-----END PGP SIGNATURE-----

--FiKZDM0ecfbmwtbS--

