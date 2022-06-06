Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDFF53E4E9
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 15:57:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342591.567642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyDDl-0005Nj-Oi; Mon, 06 Jun 2022 13:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342591.567642; Mon, 06 Jun 2022 13:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyDDl-0005Kg-LH; Mon, 06 Jun 2022 13:56:41 +0000
Received: by outflank-mailman (input) for mailman id 342591;
 Mon, 06 Jun 2022 13:56:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyDDk-0005Ka-CC
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 13:56:40 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 799f0847-e5a0-11ec-bd2c-47488cf2e6aa;
 Mon, 06 Jun 2022 15:56:37 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9F80E5C0070;
 Mon,  6 Jun 2022 09:56:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 06 Jun 2022 09:56:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jun 2022 09:56:31 -0400 (EDT)
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
X-Inumbo-ID: 799f0847-e5a0-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1654523793; x=
	1654610193; bh=6sp/vIfi6IytLKC10gbRtaMkV91cBJR7QUf35+rMI8k=; b=p
	BxFVg3piBfhZRZKfUJqcfnOMHhPwOgGy7jgv9hcE+gcdGYmpzycb8+XlcpN7hdnt
	rpss8wy5LuGO8uaIIhy7TcREQmmcOu/0M65d/9QcGhcnHc3nS6mgECaCXHzPcGEg
	AJLtFRfxlhqik8sM4g1Kqx6LD5AAHwX9ssj7nYR8MrS+n/Pp3pIEZ6j+NRctXfNs
	3Wc/Xntzd616sEfOb0G/b0OA7R0KfmUXKOtCo+n1OWTi041a+/hvOwhHQRaVL3Bk
	NJsoraNpy5BtP90Rlz50CHPYjd0Z48HcEMnB+uaXt4+318IT1LKuwfQ89utLSvDU
	NTfuBaQGJQF6q6ZUVL5tA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1654523793; x=1654610193; bh=6sp/vIfi6IytLKC10gbRtaMkV91c
	BJR7QUf35+rMI8k=; b=fssM1tlWVGPrqBZGkCv0iDHH9QPvETdZPscNAbKGOfY6
	5dx2chPHM3WPw6OP2MSdt6IfK2hnShTEHqXmk0O0cfyODEj+Ptnav2oZUpgvBlQg
	YCQzIOFUWj3BKoQbVTloPY3oE7Tmsq7cOrhtlOewAUvFwJZkl5cagrN1yUPPXE5D
	VRFIckzMhs+eu0J3pTEhE1/lM0dD181P+5mgawpZg5cDsq3nUPTIlDtaZz48tsm+
	HougewD9pmrmMAKrnIZlqtN9qBEKVJJRHkNv09H0+jFLEGvNhqW36YVwyVf+sfTD
	i+BDo/eAg8NrKLkcq/qCdGnDp0nARONbAEryfpyjfg==
X-ME-Sender: <xms:kQeeYr_Hq8tDZ-UMfeK81Tv5w9_1MwowOKMUr-Axqz-3lrwWDzfffg>
    <xme:kQeeYnvCoxtFq6yvylMLMGa0djqioim4VzUIeCjBNaNs4Sw-tytQOPeOX5BKrFpnf
    KpW3UY2S9f3cQ>
X-ME-Received: <xmr:kQeeYpCoONC_eqE2SbijOTa79AzdnhEIwSWoM8bfsScMsBwfbvGgVYnIbKHL56PVIWmMZbeIvFYRfBq-HsgMnZHhNvq1Hq4G3g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtvddgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:kQeeYneRNBlzXdn9qcZRCd1vUTMkTP__bKPVXPnqbFlDZjYoKXiz7w>
    <xmx:kQeeYgOeCn6hCktLztGy1fitoH77ieeVAokSw9l8-l2ga6oA0UFAdw>
    <xmx:kQeeYpmVJvrxMOwS5kTbwRtpXrfx2brg5jajRuEHCP1SdZSHWbL89A>
    <xmx:kQeeYhjVougu4sRXJlKhgA-sLUFR5s-65S1snz2fH5ziqKtxzH2OCg>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 6 Jun 2022 15:56:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [RFC PATCH 00/12] Add Xue - console over USB 3 Debug Capability
Message-ID: <Yp4HjHHh5pT8CIOS@mail-itl>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
 <d1de82b2-333d-9c7f-0b82-4bf18b4ec469@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SdtKxU3nuHsHTiiT"
Content-Disposition: inline
In-Reply-To: <d1de82b2-333d-9c7f-0b82-4bf18b4ec469@citrix.com>


--SdtKxU3nuHsHTiiT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 6 Jun 2022 15:56:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau Monne <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
	Kevin Tian <kevin.tian@intel.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: Re: [RFC PATCH 00/12] Add Xue - console over USB 3 Debug Capability

On Mon, Jun 06, 2022 at 01:18:45PM +0000, Andrew Cooper wrote:
> On 06/06/2022 04:40, Marek Marczykowski-G=C3=B3recki wrote:
> > This is integration of https://github.com/connojd/xue into mainline Xen.
> > This patch series includes several patches that I made in the process, =
some are
> > very loosely related.
>=20
> Thanks for looking into this.=C2=A0 CC'ing Connor just so he's aware.
>=20
> >
> > The RFC status is to collect feedback on the shape of this series, spec=
ifically:
> >
> > 1. The actual Xue driver is a header-only library. Most of the code is =
in a
> > series of inline functions in xue.h. I kept it this way, to ease integr=
ating
> > Xue updates. That's also why I preserved its original code style. Is it=
 okay,
> > or should I move the code to a .c file?
>=20
> It doesn't matter much if it's a .h or .c file.=C2=A0 It could perfectly
> easily live as xen/drivers/char/xue.h and included only by xue.c.=C2=A0 (=
More
> specifically, it doesn't want to live as xen/include/xue.h)
>=20
> That said, as soon as you get to patch 2, it's no longer unmodified from
> upstream, and with patch 3, we're gaining concrete functionality that
> upstream doesn't have.
>=20
> >
> > 2. The xue.h file includes bindings for several other environments too =
(EFI,
> > Linux, ...). This is unused code, behind #ifdef. Again, I kept it to ea=
se
> > updating. Should I remove it?
>=20
> Drop please.=C2=A0 Xen is an embedded environment, and support other
> environments is a waste of space and time.
>=20
> I'm slowly ripping out other examples.

With both the above answers, I'll see how much work will be refactoring it
into Xen-only driver. Dropping other environments should make
xue_ops abstraction unnecessary, which should simplify the code quite a
bit.

> > 3. The adding of IOMMU reserverd memory is necessary even if "hiding" d=
evice
> > from dom0. Otherwise, VT-d will deny DMA. That's probably not the most =
elegant
> > solution, but Xen doesn't have seem to have provisions for devices doin=
g DMA
> > into Xen's memory.
>=20
> I think that's to be expected, as the device should end up in quarantine.
>=20
> That said, the model is broken for devices that Xen exclusively uses,
> which includes IOMMU devices.=C2=A0 IOMMUs don't have any kind of applica=
ble
> IOMMU context, and things used exclusively by Xen don't want to be in
> the general quarantine pool, because then all malicious devices can
> interfere with the ringbuffer.

That's yet another reason for assigning it to dom0... this way, only
dom0(-assigned devices) can interfere with the ringbuffer. That's still
sub-optimal, but the current granularity of IOMMU configuration in Xen
doesn't allow to do any better.
I'll drop patch 11.

> > 4. To preserve authorship, I included unmodified "drivers/char: Add sup=
port for
> > Xue USB3 debugger" commit from Connor, and only added my changes on top=
=2E This
> > means, with that this commit, the driver doesn't work yet (but it does
> > compile). Is it okay, or should I combine fixes into that commit and so=
mehow
> > mark authorship in the commit message?
>=20
> That depends on how much changes.=C2=A0 Other options are a dual SoB with
> Connor still as the author (I typically do this for substantial code
> movement, programmatic changes, etc), or for a major rewrite, changing
> authorship and being very clear in the commit message where the code
> originated.

If I'll go with the refactor to get rid of xue_ops, then indeed it makes
more sense to create new commit and reference code origin in the commit
message.

> > 5. The last patch(es) enable using the controller by dom0, even when Xen
> > uses DbC part. That's possible, because the capability was designed
> > specifically to allow separate driver handle it, in parallel to unmodif=
ied xhci
> > driver (separate set of registers, pretending the port is "disconnected=
" for
> > the main xhci driver etc). It works with Linux dom0, although requires =
an awful
> > hack - re-enabling bus mastering behind dom0's backs. Is it okay to lea=
ve this
> > functionality as is, or guard it behind some cmdline option, or maybe r=
emove
> > completely?
>=20
> "Xen is configured to use USB3 debugging" is the only relevant signal.=C2=
=A0
> We do not want anything else.=C2=A0 If this triggers hacks for dom0, then=
 fine.

I'm worried here about depending on specific dom0 behavior. With the
current Linux driver, I needed just the bus mastering hack, but since in
this case dom0 has more or less full control over the controller, there
could be other ways it could disrupt DbC in the future.

> OOI, how does the dual driver stack work in Linux?=C2=A0 At a minimum the=
y've
> surely got to coordinate device resets.

Kind of. The DbC driver (both Linux and Xue) checks if nothing hasn't
disabled DbC in the meantime (for example via device reset). When it
happens, it re-enables it back.
I haven't tried what happens if I try to enable DbC both in Xen and
Linux at the same time, but one of the possibilities is spectacular
explosion. (In theory Xen should win, since I make DbC related MMIO area
read-only.)

> In an ideal world, dom0 would be fully unaware.=C2=A0 We hide the DbC
> controls (so dom0 doesn't get any clever ideas), but we do need to keep
> the device active when dom0 wants to reset (which will probably require
> a fair chunk of emulation).

Yeah, I don't want to go the "emulate almost-reset" way...

> Connor did upstream code into Linux to cause it to ignore an
> already-active DbC session.=C2=A0 I hope this will cause Linux to be duly
> careful with resets, and is probably the easiest way forward.

Not really, see above.

At least it doesn't try to explicitly disable it.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--SdtKxU3nuHsHTiiT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmKeB40ACgkQ24/THMrX
1yyZjwf+N3iAac2nv7N9DfvqAZASLHkuJJVR7l/x4YMJbh+o7EN+kKARg5NGajQ8
8enaEHprHJHgZqA6LCOE++Hd3Q3xMGWSrspMTbdXM6fsqVOwrGQ/LEIxKmGv3VMH
DxeCgtdI261bi/X5TAWCEZkOsh/oobF/j+Ax9iry3Kq+Fxvt0TPKoJQDlZCWm/hy
TdHqug6MW7piVkScUXT7v1ZqNM0rtSlmvLmqZslp9mlSK0cWzc2izwpt1uv/reJ9
zrPaQdtEGdvuxBfeXPdjq/tvkf7wmbgj93hPPOKBFFsLAKTAoK+aY0g9Xuca4suE
S2V6913sFdnd5E5kvYqDfy4srgAODQ==
=Chk+
-----END PGP SIGNATURE-----

--SdtKxU3nuHsHTiiT--

