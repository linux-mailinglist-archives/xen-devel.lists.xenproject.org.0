Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0811662D1BB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 04:35:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444496.699783 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovVfX-0000l2-K2; Thu, 17 Nov 2022 03:34:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444496.699783; Thu, 17 Nov 2022 03:34:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovVfX-0000iO-GG; Thu, 17 Nov 2022 03:34:27 +0000
Received: by outflank-mailman (input) for mailman id 444496;
 Thu, 17 Nov 2022 03:34:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p9yL=3R=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ovVfV-0000iI-JW
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 03:34:25 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b917021e-6628-11ed-8fd2-01056ac49cbb;
 Thu, 17 Nov 2022 04:34:22 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 8D6325C06F9;
 Wed, 16 Nov 2022 22:34:20 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 16 Nov 2022 22:34:20 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Nov 2022 22:34:19 -0500 (EST)
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
X-Inumbo-ID: b917021e-6628-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1668656060; x=
	1668742460; bh=TH05ILBPwe8tBTdP7Cj/QBp3IowitpnIIDPyVRIDFWM=; b=d
	IA5s2AMgk/x1gBRF1o7xKjeg6E0CQHG2f750FdKuYpjVR8tr9q9nI7PsjdowuJbG
	yGqetQLKNuTrfnKKzZJriF5j+BEWXcqkZST1gTVJEUBoF2RTv2j4MFWxTve2LTkZ
	0udtmwtF2QnSgfoU0Mjs2RYDQgTS/whJyCq3y+3hgTtd2Y/ZLjBC/OUt8cVTZWYx
	WqLPOfkRrm3GczFHe1CBs20NRfUZpnVsB4X76s8WetGaJoQcI8D+Sswp+cQmqDFR
	hF7RPJT34Apwf7iuG7zZdMbkqQ3ucRP+mWPBPgZnHjC8ytlKj82tiFygiZIoBNMp
	JbZV4Qa8SnqU0a4lVswbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668656060; x=1668742460; bh=TH05ILBPwe8tBTdP7Cj/QBp3Iowi
	tpnIIDPyVRIDFWM=; b=KOAYLja97UdP7gV2M9Aes6D2uqSCfFk3U+tA6LGo4OyW
	xs6YHn0aaJBHbafO3qyUfbZSARM7ZyqA3eVoWdodihlYkcukezz/Q0/o845eoRhg
	o2tTinWkSiyhOHopRx4iIXi/r8GPlGICXbOw4PMFCBUTmIsYQNjL0ZWdO72PhKud
	B5kLvu+9sT6x+866yUDAXhq28vv8BzFkq1GYRsYE+1MaC0YnGF2Dk/mp2HyP+S82
	+CPwOCaFCZowJU6he9i5SzC1vVecRlddYD9PJVJ2tuj57wYqMOgomnAZRVRZwlYK
	sbLCwx3lPh+e7Q1iso2Y/o+46SJ2idJJe+hgxJmJBg==
X-ME-Sender: <xms:vKt1Y6ZN2l9DrZEv-h6cxEUYPHG-DIVnanYK_aiW3JB6A7zPSPysww>
    <xme:vKt1Y9ZPtMK_4gdmr4g45oOruWPbrykPIsLf7EfvfFChDoc-6YYiOIiBL72N8waAS
    DcOACvMe7o7hQ>
X-ME-Received: <xmr:vKt1Y0-aKAviwIkTmtrR45o4FPDV826h3JLV8t27-Uewy9wFR1hvyBvtB7cBo84b6Q5CL2zwZnW91PBppOV_CRyrUtKDu8psIA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeejgdeiudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeukeet
    teeggffgkeduheetgeeileejjeeiiefhjeegvefhtefggfetueetteeuteenucffohhmrg
    hinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:vKt1Y8oZpEJleYyS8-OVtn6mNCghB4kDCEMoEgv7fsQEwcyMyIe6Aw>
    <xmx:vKt1Y1o7hv3gkmsvZCNFR9YPTKlXjJx8me172AYbLBErZcxAnLELYg>
    <xmx:vKt1Y6S9WM9YvaIlaNKrAAsn_bAbnzYZdZg4LFBI6HqyaOAG4Q7a2Q>
    <xmx:vKt1Y2kocAFp5ZXtraVz4QjDfIXb4xa7lP0tHRsxLtc2B3xdfdkd7w>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 17 Nov 2022 04:34:16 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen
Message-ID: <Y3WruE/VOBZFfHfi@mail-itl>
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
 <CAKf6xpvpsJuMZx98vLJ7CAmUWG-vW91Am0L8817eD8nmAN4NUw@mail.gmail.com>
 <Y3VYs/sS4VddrBCK@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qOI1HV1LMdZNtJDX"
Content-Disposition: inline
In-Reply-To: <Y3VYs/sS4VddrBCK@mail-itl>


--qOI1HV1LMdZNtJDX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Nov 2022 04:34:16 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>, Jan Beulich <jbeulich@suse.com>
Cc: qemu-devel@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen

On Wed, Nov 16, 2022 at 10:40:02PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Wed, Nov 16, 2022 at 02:15:22PM -0500, Jason Andryuk wrote:
> > On Mon, Nov 14, 2022 at 2:21 PM Marek Marczykowski-G=C3=B3recki
> > <marmarek@invisiblethingslab.com> wrote:
> > >
> > > The /dev/mem is used for two purposes:
> > >  - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
> > >  - reading Pending Bit Array (PBA)
> > >
> > > The first one was originally done because when Xen did not send all
> > > vector ctrl writes to the device model, so QEMU might have outdated o=
ld
> > > register value. This has been changed in Xen, so QEMU can now use its
> > > cached value of the register instead.
> > >
> > > The Pending Bit Array (PBA) handling is for the case where it lives on
> > > the same page as the MSI-X table itself. Xen has been extended to han=
dle
> > > this case too (as well as other registers that may live on those page=
s),
> > > so QEMU handling is not necessary anymore.
> > >
> > > Removing /dev/mem access is useful to work within stubdomain, and
> > > necessary when dom0 kernel runs in lockdown mode.
> > >
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> >=20
> > I put the Xen, QEMU, and xen-pciback patches into OpenXT and gave a
> > little test.  When pci_permissive=3D0, iwlwifi fails to load its
> > firmware.  With pci_permissive=3D1, it looks like MSI-X is enabled. (I
> > previously included your libxl allow_interrupt_control patch - that
> > seemed to get regular MSIs working prior to the MSI-X patches.)  I
> > also removed the OpenXT equivalent of 0005-Disable-MSI-X-caps.patch.
> > I am testing with Linux 5.4.y, so that could be another factor.
>=20
> Can you confirm the allow_interrupt_control is set by libxl? Also,
> vanilla 5.4 doesn't have the allow_interrupt_control patch at all, and you
> may have an earlier version that had "allow_msi_enable" as the sysfs
> file name.

Ok, I found what is wrong. Enabling MSI-X is refused, because INTx isn't
disabled at this point yet. And apparently I was testing this with
permissive=3D1...

Linux does this:
https://github.com/torvalds/linux/blob/master/drivers/pci/msi/msi.c#L611
In short:
1. Enable MSI-X with MASKALL=3D1
2. Setup MSI-X table
3. Disable INTx
4. Set MASKALL=3D0

This patch on top should fix this:
----8<----
diff --git a/drivers/xen/xen-pciback/conf_space_capability.c b/drivers/xen/=
xen-pciback/conf_space_capability.c
index 097316a74126..f4c4381de76e 100644
--- a/drivers/xen/xen-pciback/conf_space_capability.c
+++ b/drivers/xen/xen-pciback/conf_space_capability.c
@@ -235,7 +235,7 @@ static int msi_msix_flags_write(struct pci_dev *dev, in=
t offset, u16 new_value,
 	    (new_value ^ old_value) & ~field_config->allowed_bits)
 		return PCIBIOS_SET_FAILED;
=20
-	if (new_value & field_config->enable_bit) {
+	if ((new_value & field_config->allowed_bits) =3D=3D field_config->enable_=
bit) {
 		/* don't allow enabling together with other interrupt types */
 		int int_type =3D xen_pcibk_get_interrupt_type(dev);
=20
----8<----

Jan, is the above safe? It should prevent clearing MASKALL if INTx isn't
disabled, unless I missed something? But also, it will allow enabling
MSI-X with MASKALL=3D1 together with MSI, which I'm not sure if should be
allowed.
Alternatively to the above patch, I could allow specifically setting
MSIX_FLAGS_ENABLE + MSIX_FLAGS_MASKALL while INTx isn't disabled as a
single exception, but at this point I'm not sure if some other driver or
OS wouldn't approach this in yet another way.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--qOI1HV1LMdZNtJDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmN1q7gACgkQ24/THMrX
1ywCHgf/eFD4v0mHu7zDeEjNqpy7ruZDsO1VURVpIVBsZTWgermGsVQTa0HcGIYI
fRKvp8PaiBIr5SoevJkQTaHAOSSBeaUfxZwgnk1EYxSc5lJE/7hvxCgZr06e9rPj
+In5sInNwcGgHB51qewFcrooQ/hb4R0ZACz8gKgG2Pw2jXPlm8qbYv9LYNd8O6T/
u6pFLUVYHNKNn6kzSBtNcXN68XsLj6ShNWK6cGwMx17WWEUP/xipa89qHp28Rw57
rA26wGE3SP0w/KxW7vIXf5eUpNksO5I60gF39jbwcMrEfUkFKpIJhPlr3G/T3LMJ
vnKO1m4JEyqi40d4PZ80KnPxgSOT4w==
=ffu+
-----END PGP SIGNATURE-----

--qOI1HV1LMdZNtJDX--

