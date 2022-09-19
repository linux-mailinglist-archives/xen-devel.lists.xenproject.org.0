Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B72E5BCDA3
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 15:50:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408742.651580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaH9y-0004XE-7e; Mon, 19 Sep 2022 13:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408742.651580; Mon, 19 Sep 2022 13:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaH9y-0004Ul-4s; Mon, 19 Sep 2022 13:50:06 +0000
Received: by outflank-mailman (input) for mailman id 408742;
 Mon, 19 Sep 2022 13:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Da22=ZW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oaH9w-000481-B8
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 13:50:04 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4376770-3821-11ed-9647-05401a9f4f97;
 Mon, 19 Sep 2022 15:50:01 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BE9D45C03BB;
 Mon, 19 Sep 2022 09:49:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 19 Sep 2022 09:49:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Sep 2022 09:49:57 -0400 (EDT)
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
X-Inumbo-ID: f4376770-3821-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1663595399; x=
	1663681799; bh=jdhxF0O7zXn/CcIP+xNswbx4VrKnAba3DX6vvzfwYLY=; b=B
	L9qnTZLOmbBzxh9FJC0wF2xajeARDxsNu96xNNdS7qk1MmR4zHO/BsLDTW8lqH0P
	RJpRJt868OAee+MvFewgjOY2Wglc61OmoHe6Uet5ISj1tRtrVuaTp9MaPsHiSGT8
	TKbJVjdlg2hyfl8mvWc2OV+ScOs5EUH95XMAeiP6OHR3DwyGEq3Vd5NT0zctCiDT
	7rIFfIqt7D4VLEqmNIcNK3V3+/iZnvGZK9F7eVsGQOK7YsklTbeNULCYJihGtHtT
	6s+L68wnFHXzbRWGfhIMMReeYRLQBAUDcmQWAZbGFobyJuuwV/y4lzCK5j2NIazP
	d0xTYR5WjjRoJfwgGB6xA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663595399; x=1663681799; bh=jdhxF0O7zXn/CcIP+xNswbx4VrKn
	Aba3DX6vvzfwYLY=; b=FeRVOQqBJXaYZmeHeTrjPfweJIFnQQ7a2kU8z3zre/Sv
	AEEKD2nXczeqBvjA4niPT9eogmEw6FuBpkqWExejrDU/hQpaos3+HNxV8n7AG7cb
	PssJ63fjLbcgcuBCXKB+rOQEMKyLD3yovuHdySVUNMC4QFp3M51rQmrkie9B5FgD
	pmfDhoD/e1ZmLdtDrEw40ZHdRG+t5DkG5cP1OR2NudHwXlByyHgWpyHtGXwnHy+T
	izydlelukR5J8Ra60kTwoOrMyP5xrOZlo+31ibK2CzhDjJcvgFj9vOysVTX8XLZT
	x56UKFpxDA6bS8vUlftwsp7CwsfGpljTWWtU4JpJDw==
X-ME-Sender: <xms:h3MoY4r7g6NA79eu97njl_vCm_TbYgjzpUERNv8Tg7EPTui770zOYg>
    <xme:h3MoY-oxXgrzCza6-z61bhE1T4qQiQTFIcMPSk-cU4H5tD2I1x2VJrlFpdPwiNT0b
    jYkK4fE_dLIKw>
X-ME-Received: <xmr:h3MoY9PUC_ISblvfDorFKZJe-0lJbAv5qg9L6onwqWDY0G8VepnnROpWCTfi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvjedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:h3MoY_6bpiF1htBsty_spmbiC9uNkXOWVEGETVh1z0snR-bzmw6ymg>
    <xmx:h3MoY35jglJ7mlZgU8JStFuDra9s84guzFUfI-mux7t79cPZ4ea7gA>
    <xmx:h3MoY_gs9sPJOmNgbI_fJqdF9hQVWpVq2zzpE746em6m82jwcb5C-Q>
    <xmx:h3MoY0G4suTsuEe9CDLViTQ-ZMcU5dbic78PXT5zPmBBzoRojTekCw>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 19 Sep 2022 15:49:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 00/11] Add Xue - console over USB 3 Debug Capability
Message-ID: <YyhzgnPOWLTYYXQ+@mail-itl>
References: <cover.677e6604707b02741b065906ac6f3ea8f3a2f4ca.1663383053.git-series.marmarek@invisiblethingslab.com>
 <6211a296-c4ba-5783-f6b4-8dbed8261a2a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lVLAy8tK65j9UJDb"
Content-Disposition: inline
In-Reply-To: <6211a296-c4ba-5783-f6b4-8dbed8261a2a@suse.com>


--lVLAy8tK65j9UJDb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Sep 2022 15:49:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>, Kevin Tian <kevin.tian@intel.com>,
	Connor Davis <connojdavis@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v7 00/11] Add Xue - console over USB 3 Debug Capability

On Mon, Sep 19, 2022 at 03:33:55PM +0200, Jan Beulich wrote:
> On 17.09.2022 04:51, Marek Marczykowski-G=C3=B3recki wrote:
> > This is integration of https://github.com/connojd/xue into mainline Xen.
> > This patch series includes several patches that I made in the process, =
some are
> > very loosely related.
> >=20
> > The driver developed by Connor supports console via USB3 debug capabili=
ty. The
> > capability is designed to operate mostly independently of normal XHCI d=
river,
> > so this patch series allows dom0 to drive standard USB3 controller part=
, while
> > Xen uses DbC for console output.
> >[...]=20
> > Marek Marczykowski-G=C3=B3recki (11):
> >   drivers/char: allow using both dbgp=3Dxhci and dbgp=3Dehci
> >   IOMMU: add common API for device reserved memory
> >   IOMMU/AMD: wire common device reserved memory API
> >   drivers/char: mark DMA buffers as reserved for the XHCI
> >   drivers/char: add RX support to the XHCI driver
> >   drivers/char: fix handling cable re-plug in XHCI console driver
> >   drivers/char: allow driving the rest of XHCI by a domain while Xen us=
es DbC
> >   IOMMU/VT-d: wire common device reserved memory API
> >   console: support multiple serial console simultaneously
> >   drivers/char: suspend handling in XHCI console driver
> >   drivers/char: add console=3Dehci as an alias for console=3Ddbgp
>=20
> Henry,
>=20
> this series is kind of on the edge between a feature submission and
> corrections to existing code, as the base patch introducing the new
> driver was merged only recently, and at least some of the things here
> aren't clearly "bug" fixes. Additionally it's on the side of larger
> ones considering the point in time.
>=20
> To summarize state: Patches 2-7 are ready to be committed, and Marek
> tells me that they're independent of patch 1 (except for a context
> conflict). Patch 11 probably also falls in this category. Patch 10,
> otoh, is pretty likely to be viewed as a new feature, and hence
> likely wants postponing. In any event - if I was to commit any of
> these, this couldn't happen earlier than next Monday, as the laptop
> I'm currently working with is not (yet) set up to do commits from.

I'd like to add for the risk analysis, that most of this code get
exercised only when explicit dbgp=3Dxhci parameter is given (which is a
new feature introduced with a patch already committed for 4.17). Exception
to this are patches:
- patch 1 touches also dbgp=3Dehci case
- patches 2, 3, and 8 (the last one missing an ack) touch IOMMU code in
  general, but changes are rather not invasive
- patch 9 touches generic console code, but can be safely dropped (is
  completely independent from the others)

> Do you have any particular opinion on the disposition of this series?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--lVLAy8tK65j9UJDb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmMoc4IACgkQ24/THMrX
1yxCaAf/WMU7vwKuqbZEN21t9s1y8OcTZJKVdDBaZImyaI8Fpt8XuTjKu08bn2Ta
WfVxogI+788XHRGCmAFnAC4Aasz1QHDg84l8udVBz707DbtjESv37X6xuT1F6hRQ
4+XoqoLOGFUWB0+/ekji/fpJSDIeyyUBxSUWXsfM4VQqTrCGW1fs9gpOKHwETlv7
zMtXSHOxomNkC8f8uDfm9BKQZRdkrfKLgkbAUZXradmvpXkHizmyw454/N1d3ARj
UAsxkLFBI4xDqBUbAS56HMesXMM87zDr6wicdvOPDJw+cDj2TF7h3zxAleV1kRHs
nT9LQboKFTZBbPJ2fnqdPzAKqsRcjA==
=NIh2
-----END PGP SIGNATURE-----

--lVLAy8tK65j9UJDb--

