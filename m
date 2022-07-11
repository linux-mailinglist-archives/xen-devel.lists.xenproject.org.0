Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E918556D802
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jul 2022 10:30:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.364939.594924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAoo9-0003wM-AT; Mon, 11 Jul 2022 08:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 364939.594924; Mon, 11 Jul 2022 08:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oAoo9-0003uc-77; Mon, 11 Jul 2022 08:30:21 +0000
Received: by outflank-mailman (input) for mailman id 364939;
 Mon, 11 Jul 2022 08:30:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9mgh=XQ=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oAoo8-0003uW-9s
 for xen-devel@lists.xenproject.org; Mon, 11 Jul 2022 08:30:20 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b18981c8-00f3-11ed-924f-1f966e50362f;
 Mon, 11 Jul 2022 10:30:18 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 126FB5C010D;
 Mon, 11 Jul 2022 04:30:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 11 Jul 2022 04:30:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 04:30:16 -0400 (EDT)
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
X-Inumbo-ID: b18981c8-00f3-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1657528217; x=
	1657614617; bh=2N9aCDj202Z+yCenUvIsiCeBsatd0v7C6b11NQLfi/w=; b=m
	Fb7pLvTWiC0pWxLwQP5iJn1qsDqPRorTtgbyyS5swMm5t/6a/AOY/nzeJbpYGjrF
	T1P2w0DGKVrteFaMnTxkmaMLVg5Qk2+IYtJeHRAPVnSSBOYlm2be/nYPkPoT1Bh7
	QEMMUEY1t1NSQUic8iSzFRmeF9MizqoCnV57RaVUh1ztk4cbjwAAbGobyAQJYC3Z
	nqBE/aHm85EO/24OXzqMUQcIo6y+bQ7W2go8SoFVXS40P/uI4q4QQHSFf3bVKFEc
	Ww97Unwjt2MZblg/OT3nw1Je5iT6L9kMdqvcNcQYwkicB1+tLpvoQy1vuYqxT6wa
	3BTcwTwq0lu12blxHFckQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657528217; x=1657614617; bh=2N9aCDj202Z+yCenUvIsiCeBsatd
	0v7C6b11NQLfi/w=; b=Yz3ljaW/TD5y5Wez75KKBGHMoUf8Vz7fkcxMzGmB3kVK
	yM/8uERWekDwnYeZpJ13pu6iWEOe18qlTdLPqe5C06Y/kDKZQ3pPzzSwmzttkKvt
	VmL3exQ+wkZmt2/b4ErbTUhtng9jlSZj6KYqNbrqxTw9ZG4zvfxW9EY54zt0mxk5
	As6Krq53fYtZs1c/DyUQGSgw4LEEVRMSVx8MJxwj2NoYWiCDCTWnqx5aM9l5YDmT
	tUlHeXPhLpIsspy9t0wO9FwjIM936/ilYTjRi8WACQbD34fbEAZf747k5vRmE9EX
	O1Jy7OJ0Ev/6d8Zbvro0urXEAdIhjWOWFVaRKZMnkQ==
X-ME-Sender: <xms:mN_LYt_BuYIcdRIhOaCMiYRcncQwf8HjuRu-Zo3tQTdUkyk8Pwmx4A>
    <xme:mN_LYhsC0PCJdch9YNM53vOg4cOYc93XUCghqG23e-F3FtUEahh-PLu9K3sVdj4D3
    qnnf0UPDIP2FlI>
X-ME-Received: <xmr:mN_LYrB_ubxYw9u0KFlgXgRBWJYwqrR1dYwYCfctVvisFavZFQoIBhgscO5N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepleefjeeukeehkeegiedtgeekkeel
    tedvhfduudefgfffheffheeuvedvieelfefhnecuffhomhgrihhnpehkvghrnhgvlhdroh
    hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    vghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:mN_LYhfq1p6wrNWhRVXTsTqkt5JArV1BlQ16lM50P8jBAGk0voEz5Q>
    <xmx:mN_LYiMaSrOUbDRSoks0a1RFvgyUVeLDFA52uoc2lb-urdcqVpmASw>
    <xmx:mN_LYjkvM9039IIYzv6ERuRneXG5-gh9EibHd2m1J-MPA_o7zdhggg>
    <xmx:md_LYlY9yr6VPGXIS7VRR1BN8PKNaQpsQ3eu1AzHCFL7_RKZlAz2ww>
Feedback-ID: iac594737:Fastmail
Date: Mon, 11 Jul 2022 04:30:11 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen development discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9] Preserve the EFI System Resource Table for dom0
Message-ID: <YsvflpBJKLJdvYh4@itl-email>
References: <20220708213403.2390-1-demi@invisiblethingslab.com>
 <fb459be1-1f02-ba6c-6ef3-ebfd787fc773@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ue0OKNrOXfLQGMxN"
Content-Disposition: inline
In-Reply-To: <fb459be1-1f02-ba6c-6ef3-ebfd787fc773@suse.com>


--ue0OKNrOXfLQGMxN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 Jul 2022 04:30:11 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen development discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v9] Preserve the EFI System Resource Table for dom0

On Mon, Jul 11, 2022 at 08:41:59AM +0200, Jan Beulich wrote:
> On 08.07.2022 23:34, Demi Marie Obenour wrote:
> > The EFI System Resource Table (ESRT) is necessary for fwupd to identify
> > firmware updates to install.  According to the UEFI specification =C2=
=A723.4,
> > the ESRT shall be stored in memory of type EfiBootServicesData.  Howeve=
r,
> > memory of type EfiBootServicesData is considered general-purpose memory
> > by Xen, so the ESRT needs to be moved somewhere where Xen will not
> > overwrite it.  Copy the ESRT to memory of type EfiRuntimeServicesData,
> > which Xen will not reuse.  dom0 can use the ESRT if (and only if) it is
> > in memory of type EfiRuntimeServicesData.
> >=20
> > Earlier versions of this patch reserved the memory in which the ESRT was
> > located.  This created awkward alignment problems, and required either
> > splitting the E820 table or wasting memory.  It also would have required
> > a new platform op for dom0 to use to indicate if the ESRT is reserved.
> > By copying the ESRT into EfiRuntimeServicesData memory, the E820 table
> > does not need to be modified, and dom0 can just check the type of the
> > memory region containing the ESRT.  The copy is only done if the ESRT is
> > not already in EfiRuntimeServicesData memory, avoiding memory leaks on
> > repeated kexec.
> >=20
> > See https://lore.kernel.org/xen-devel/20200818184018.GN1679@mail-itl/T/
> > for details.  Tested using qemu-system-x86_64 and xen.efi.
> >=20
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > ---
> >  xen/common/efi/boot.c | 134 ++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 134 insertions(+)
> >=20
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index a25e1d29f1..d2f66a430d 100644
>=20
> As asked for before - please have a brief log of changes between
> versions (at least for the delta from the previous version) somewhere
> above from here.

Sorry about that, will fix in v10.

> The patch looks almost okay to me (see below), but I'd like to ask
> for explicit confirmation that this time round you actually did
> test the change at least on one architecture (presumably x86). Iirc
> one of the Arm folks offered to test it on Arm64 - would have been
> nice if you had included whoever it was in Cc.

I did, though it was in emulated QEMU (in full instruction emulation
mode, no hardware virt).  I had to disable EFI Runtime Services to avoid
a fatal page fault (seemingly in the OVMF firmware), but this is
unrelated as the same problem happens on master.  Also, I killed the VM
after systemd started and seemed to be running normally, on the ground
that any problem caused by this patch would have triggered earlier.

That said, this seems to cause another problem on a rebased patch.  I
will fix it after some sleep.

> > @@ -1051,6 +1110,70 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS=
_OUTPUT_PROTOCOL *gop, UINTN gop
> >  #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
> >                                   (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
> > =20
> > +static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
> > +{
> > +    EFI_STATUS status;
> > +    UINTN info_size =3D 0, map_key, mdesc_size;
> > +    void *memory_map =3D NULL;
> > +    UINT32 ver;
> > +    unsigned int i;
> > +
> > +    for ( ; ; ) {
>=20
> I'm sorry, but I'm now going to be picky and _not_ offer correcting
> this style violation for you anymore.

No apology needed.  Is the problem that the brace should be on a
separate line, that the spaces around the semicolons should be removed,
or both?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--ue0OKNrOXfLQGMxN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmLL35YACgkQsoi1X/+c
IsEBiRAAtT3KY8QFZYbNLMlZ11KZ+dGGGc4EFXkoyBo0hozugTH2kbegHvgKBgVX
kqSbiOLvBUVCQHnfPpDceMzP7ES3wYAImLIF0E0pOgPOiVTT+bFH1Kl9pZ5rOykE
oqTHXikNOJ1GbQOCm+PWmQuaWuNnfUA9nUjYAZOvpT5MJ/5iEQGYYIBxATaggk7x
40/xXsV5oIkGwhXg6rNMF4wLu9mpoQHeQKhe0TR2fRGWpg1tFsF1OEbl15whtMPy
tdqLoqpz+l4Yjaf836Z866gMZArDvBfSz23VSQPS8tmlwg+Cb2B0UK7bL5u2rSHk
XNL93VHgqJKwiT4CylcBxuItDqx+hGbumcs0J1b/2Jkef5Chgmcd5Y2hGDAXEdSW
uxlwGGS6Gdr200ymiM4OpM8zOqPifkQEd7+0MhqRA/6uLkiRnwDPpLX8CYQWryZs
5gxcOMVZ7w5diiqA8i2GFWL/2VGzR7aA2NgEouqtpJWiuOTluXx2XHDmEs0qSxq7
jLoenKddzCASSkn7q0DgFolKT2TOBQkXT6SHhJ5OqddR/HZjDlucfRmZdIM+B2sz
zeBj10gblvGmQ3uCzS1OWQj3cxgQbtARoyedQjcSygJsVxjqibKzjDMA8jrxvA4X
URc04OLvb89Bi90jCSTN0dING2ENjhOEqd+BFuvN6yT4ePdNZoo=
=BhUw
-----END PGP SIGNATURE-----

--ue0OKNrOXfLQGMxN--

