Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18A65EF3C8
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 12:57:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413619.657381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrEC-0008Fw-1z; Thu, 29 Sep 2022 10:57:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413619.657381; Thu, 29 Sep 2022 10:57:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrEB-0008Dj-Tv; Thu, 29 Sep 2022 10:57:15 +0000
Received: by outflank-mailman (input) for mailman id 413619;
 Thu, 29 Sep 2022 10:57:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OnIM=2A=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1odrEA-0008Dc-5V
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 10:57:14 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 736b67e3-3fe5-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 12:57:05 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id A0DF8320014C;
 Thu, 29 Sep 2022 06:57:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 29 Sep 2022 06:57:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Sep 2022 06:57:06 -0400 (EDT)
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
X-Inumbo-ID: 736b67e3-3fe5-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1664449028; x=
	1664535428; bh=jGPatLXErhfKlARxhbJZGrfudntfdRJfb+3Mv7JEM7Y=; b=M
	N2HmM16tJlaUFxccpa+u+B0QGbB4cnfCe9MRiBk0sEXsEZrJzbh6XRsQxSzLLWvx
	PXXBhbZ8ctwi71muB1IDrbJNTTm5NfORodZYZx+gE3TO6ghlDrifqVSmHJ4APpV3
	lJ/oA2e9a4CPuQ6Cg27nKKTFpd7i41vV6vGJ5hXCzkcY3HCPudmPYhEYGlx5kq9K
	CXxEdHhYK9GdTPhme86NvphdzEWsebK9mX1DYJdV/PpnkKEAWOLdj1EbzmxLAXMS
	EBLgsZSv8Kw7qsL1CSL78L2VQInO0BNd5hZhyoIerpqvdS6i0FEvnFhAAzhtTN2M
	XZl3C6WFffjF6RvnqXhBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664449028; x=1664535428; bh=jGPatLXErhfKlARxhbJZGrfudntf
	dRJfb+3Mv7JEM7Y=; b=GDfVhNBo2bEGTrBHHYMxnuw3PnHYDFoxDTWGcb9xSU2X
	+ieQByQsBxPiYYkPJmG0gSzX1TUlLQ/whVmUsL/OBD0E0ZQWX8q0WizEdpGdEFL/
	sLEuP/W3qOX1542kEl7c4rqZcllT1hMvORPIi6Om0n7XsmXoX02V2EWQKeAOb1u1
	AfA15+5xTjf7o6hWupALoMD8xqxbcXWUT4awcYc65pdiytFaPtjYo01SidUXEwFt
	1rZJB6gidoiAGjp7CTjjVs2qxOqpY/yydfLajziHwq7q7pG8aa+7MSVXN5AqAeVV
	fJQhUsl1qfn6V+/XhWUeALTo6YMEFsr1Xgq+BYy/mg==
X-ME-Sender: <xms:A3o1Y1VUPRdlY2yflsikpxqleL9qcx4mSiRDx25PrZhFecGaWw5h6w>
    <xme:A3o1Y1liM7tyzJU3edIoAcA-NK57_RhLRi6Dawq77sf-FBRucSLufJ200S13M_SRH
    YoYWrPXi6vxCw>
X-ME-Received: <xmr:A3o1YxYuqa4REARljyQT1ACnSL64BuxtMuBk6pSHioCZUMuQcuLrt068cqYHdxQlify4XNGtF5ZW4NOIvrAhs3691C7dbF_LMg8k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehtddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:A3o1Y4XPmzJZIfFsb0ig6kRxHB_YSRJCYUFMSDmuLrZz6vAjRcmvZQ>
    <xmx:A3o1Y_mdqGmcXzMw7nx8iAlQjZ06ry-QI5EKyQxGsPvpD71iZ3mCzg>
    <xmx:A3o1Y1eVK4v1_XobmXQuTFmi886KTvHOkZUtr6ImOTRz6_mxuPLtmQ>
    <xmx:BHo1Y0wRopFIJOL82Jx8HeN1hmp7UGyYT0zPniwstwLZZm2Z9a21fQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 29 Sep 2022 12:57:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: Design session "MSI-X support with Linux stubdomain" notes
Message-ID: <YzV5/0SYbJVQ91YV@mail-itl>
References: <YyyHvp34Wg1kSqFu@perard.uk.xensource.com>
 <f24b9e06-f9ed-aa0f-0d69-abb8f0d7560f@suse.com>
 <YzGeY8L6Op7n8pip@mail-itl>
 <ca19380a-6ccd-453d-4693-ea666152f45f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z8TbrM2K6lu4hpvf"
Content-Disposition: inline
In-Reply-To: <ca19380a-6ccd-453d-4693-ea666152f45f@suse.com>


--z8TbrM2K6lu4hpvf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Sep 2022 12:57:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: Design session "MSI-X support with Linux stubdomain" notes

On Mon, Sep 26, 2022 at 02:47:55PM +0200, Jan Beulich wrote:
> On 26.09.2022 14:43, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Sep 22, 2022 at 08:00:00PM +0200, Jan Beulich wrote:
> >> On 22.09.2022 18:05, Anthony PERARD wrote:
> >>> WARNING: Notes missing at the beginning of the meeting.
> >>>
> >>> session description:
> >>>> Currently a HVM with PCI passthrough and Qemu Linux stubdomain doesn=
=E2=80=99t
> >>>> support MSI-X. For the device to (partially) work, Qemu needs a patc=
h masking
> >>>> MSI-X from the PCI config space. Some drivers are not happy about th=
at, which
> >>>> is understandable (device natively supports MSI-X, so fallback path =
are
> >>>> rarely tested).
> >>>>
> >>>> This is mostly (?) about qemu accessing /dev/mem directly (here:
> >>>> https://github.com/qemu/qemu/blob/master/hw/xen/xen_pt_msi.c#L579) -=
 lets
> >>>> discuss alternative interface that stubdomain could use.
> >>>
> >>>
> >>>
> >>> when qemu forward interrupt,
> >>>     for correct mask bit, it read physical mask bit.
> >>>     an hypercall would make sense.
> >>>     -> benefit, mask bit in hardware will be what hypervisor desire, =
and device model desire.
> >>>     from guest point of view, interrupt should be unmask.
> >>>
> >>> interrupt request are first forwarded to qemu, so xen have to do some=
 post processing once request comes back from qemu.
> >>>     it's weird..
> >>>
> >>> someone should have a look, and rationalize this weird path.
> >>>
> >>> Xen tries to not forward everything to qemu.
> >>>
> >>> why don't we do that in xen.
> >>>     there's already code in xen for that.
> >>
> >> So what I didn't pay enough attention to when talking was that the
> >> completion logic in Xen is for writes only. Maybe something similar
> >> can be had for reads as well, but that's to be checked ...
> >=20
> > I spent some time trying to follow that part of qemu, and I think it
> > reads vector control only on the write path, to keep some bits
> > unchanged, and also detect whether Xen masked it behind qemu's back.
> > My understanding is, since 484d7c852e "x86/MSI-X: track host and guest
> > mask-all requests separately" it is unnecessary, because Xen will
> > remember guest's intention, so qemu can simply use its own internal
> > state and act on that (guest writes will go through qemu, so it should
> > have up to date view from guest's point of view).
> >=20
> > As for PBA access, it is read by qemu only to pass it to the guest. I'm
> > not sure whether qemu should use hypercall to retrieve it, or maybe
> > Xen should fixup value itself on the read path.
>=20
> Forwarding the access to qemu just for qemu to use a hypercall to obtain
> the value needed seems backwards to me. If we need new code in Xen, we
> can as well handle the read directly I think, without involving qemu.

I'm not sure if I fully follow what qemu does here, but I think the
reason for such handling is that PBA can (and often do) live on the same
page as the actual MSI-X table. I'm trying to adjust qemu to not
intercept this read, but at this point I'm not yet sure of that's even
possible on sub-page granularity.

But, to go forward with PoC/debugging, I hardwired PBA read to
0xFFFFFFFF, and it seems it doesn't work. My observation is that the
handler in the Linux driver isn't called. There are several moving
part (it could very well be bug in the driver, or some other part in the
VM). Is there some place in Xen I can see if an interrupt gets delivered
to the guest (some function I can add debug print to), or is it
delivered directly to the guest?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--z8TbrM2K6lu4hpvf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmM1egAACgkQ24/THMrX
1yxQKgf/Qh0hPYMpmvE3TeHRDj54VKnKLM3LoqCPSaDJQDGoFWXOw5brfeJ7ftnq
AcNNfVSyZSuJoUmH89CO/ktZoE3telNIQhakM6JCTXRfwI7GUhbZuGao7KVaNlqe
YdVstc2vBX9N3xLs1IUaZrkrJLlHle7y/2pZSyvrsGY25qujagE4EmVyH0j8kxM0
z65IJTPpuw+heemP7TFyLEuWeIpOijo+OhPLNqTTUcxhotrPqHbindz+4QyUwYRj
6yTBvthXqWXKFB0I/VVRJ32jInkBJEvmrDqtXtAvKqy0lWaIKXdEQnnjF/NUiCZt
+dGcw+cvZ1bAY+NNFrUxhBCK5gwDLA==
=SjgZ
-----END PGP SIGNATURE-----

--z8TbrM2K6lu4hpvf--

