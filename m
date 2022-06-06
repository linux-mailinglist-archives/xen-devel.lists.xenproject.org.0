Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B3D53E4F0
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jun 2022 16:03:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.342609.567663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyDKR-0007c4-RE; Mon, 06 Jun 2022 14:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 342609.567663; Mon, 06 Jun 2022 14:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nyDKR-0007Zk-OR; Mon, 06 Jun 2022 14:03:35 +0000
Received: by outflank-mailman (input) for mailman id 342609;
 Mon, 06 Jun 2022 14:03:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PxEH=WN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nyDKQ-0007Ze-7L
 for xen-devel@lists.xenproject.org; Mon, 06 Jun 2022 14:03:34 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 722b6449-e5a1-11ec-b605-df0040e90b76;
 Mon, 06 Jun 2022 16:03:33 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id A739D5C0110;
 Mon,  6 Jun 2022 10:03:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 06 Jun 2022 10:03:30 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jun 2022 10:03:28 -0400 (EDT)
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
X-Inumbo-ID: 722b6449-e5a1-11ec-b605-df0040e90b76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1654524210; x=
	1654610610; bh=0LW+vEZ1opUnoAkqaBAnedNH5NgRMTuq2RBhTx9Lf8I=; b=u
	MxW7oIIN6AdeD61I2uDx8IW5BTCbisyK7E4E4Rzg2dWgrpsd0uoUg31VAjjd06c7
	hvet437LE4JX7jIOkhG7ehy0kUbhcyFXNSDth9rOzW6QnvN9qU6Ek9AFL1CTvgkP
	5Du7UIZkvf2aJB0KDWP17TB15BB0H2lIm9GueHUlNLIFbGcKhme2AAU4dHfzYOAt
	DDENN/zNrZvDmDYozCKyphSaMSDtvryBw6+wVP5FMa3QidA4Fv0haT7pPTtPeFLE
	vFq3eevuqftmr9HhSpVCV+aNCix+5b2izFL1PeeE4S39KyF46yRB1UiHODLIlKQo
	XX+duAnPFBg74H+1G2wlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1654524210; x=1654610610; bh=0LW+vEZ1opUnoAkqaBAnedNH5NgR
	MTuq2RBhTx9Lf8I=; b=YaEICWL/7Z87vdgoPTXqyLLKVBkEnRCZEqpYijwdgr90
	/acuXvpVqDnhmiR6I6AbAnCG1UyU4mE5qZAbuVXAUXby2l969mNoOuSHVtJQl12m
	mt2LmMG7qvmRbR42qHc+dRC5K9hcZHan/P+g4L1LZJ1u5rOVRXU7qWDGjH6JehQq
	DxhVTa6ekSzEnWijCW1YjwclOP3Q5bFl0k2cM1fcmyivsOitBxkzjnIwLJeXYa4U
	WTW/SZ2WEaPsB+cZ1YNLfBuodMW/I5CW8dGCkTNNnUBFnXd0IQCuh8AR+sy/8zHY
	lvJjIadLvX0JhQH3H/wJ9dyMXwFzUnAZ1mSgqSVzRA==
X-ME-Sender: <xms:MgmeYh4leBjjcVeQ4AfvygF1Wae8ZaxPxMHtPx7e96QU80aqhZ3Ffw>
    <xme:MgmeYu7dHuAqZqicIlq-5bGOGdiOFtdDq8-udVeMUvHIbqoDlP6Blh-FB4i-TJYKv
    um9QikfU7fIwA>
X-ME-Received: <xmr:MgmeYoeqUBtS7Q7vaRQlZOdzOwyNZd0h42Yd5-nJqrRpE_TMZcVTV7UGXA-9dSv6jtyS2mn9kV9Yq-Gs_V7C3upaVGZlLnwQMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtvddgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:MgmeYqJR5aVkkonxzs-dTuSWlLUbbunN0wr4BFWmWJyNSn7GXnTkew>
    <xmx:MgmeYlISl6MkuNt1P-iYyzADAtldeMJpsClHHOIcxbKB3bc6H8gg8w>
    <xmx:MgmeYjwVR-IE2TrssEY6214xA3eQzJ1UNDbLj_0YeHxGH4Tl_NTmaA>
    <xmx:MgmeYt8N0ePWQ_GNlK9wlFaDJEH2Mbx5l9hpgqMuHGSdWdsIXNnZ6Q>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 6 Jun 2022 16:03:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 01/12] drivers/char: Add support for Xue USB3 debugger
Message-ID: <Yp4JLd8UGS3jjD5Z@mail-itl>
References: <cover.07846d9c1900bd8c905a05e7afb214b4cf4ab881.1654486751.git-series.marmarek@invisiblethingslab.com>
 <8d45d05dae0b5a2aa62120c7ff62295319a74478.1654486751.git-series.marmarek@invisiblethingslab.com>
 <CABfawhn7XGoMRb9LsSwNyaCb92KD5jC4juM+NwOMyOntOgo5pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="F9xz0k6yD4ufAAN4"
Content-Disposition: inline
In-Reply-To: <CABfawhn7XGoMRb9LsSwNyaCb92KD5jC4juM+NwOMyOntOgo5pg@mail.gmail.com>


--F9xz0k6yD4ufAAN4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 6 Jun 2022 16:03:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [RFC PATCH 01/12] drivers/char: Add support for Xue USB3 debugger

On Mon, Jun 06, 2022 at 09:32:52AM -0400, Tamas K Lengyel wrote:
> > +/* Supported xHC PCI configurations */
> > +#define XUE_XHC_CLASSC 0xC0330ULL
> > +#define XUE_XHC_VEN_INTEL 0x8086ULL
> > +#define XUE_XHC_DEV_Z370 0xA2AFULL
> > +#define XUE_XHC_DEV_Z390 0xA36DULL
> > +#define XUE_XHC_DEV_WILDCAT_POINT 0x9CB1ULL
> > +#define XUE_XHC_DEV_SUNRISE_POINT 0x9D2FULL
> > +#define XUE_XHC_DEV_CANNON_POINT 0x9DEDULL
>=20
> I had to add an extra device ID here to get it working on my NUC,
> would be nice if we could add that to the list of supported configs so
> I don't need to custom patch:
>=20
> #define XUE_XHC_DEV_COMET_LAKE 0x02EDULL
>=20
> The patch is here:
> https://github.com/tklengyel/xen/commit/dd0423aba6caa4ef41dff65470598a1c0=
c1105ae

Interesting, I think known_xhc() is used only in the EFI variant of Xue.
Xen one just looks for any XHC based on the device class. And indeed, I
works for me on Tiger Lake that is not included here.

I did need to select specific controller, since I have 3 of them:
00:0d.0 USB controller: Intel Corporation Tiger Lake-LP Thunderbolt 4 USB C=
ontroller (rev 01)
00:0d.2 USB controller: Intel Corporation Tiger Lake-LP Thunderbolt 4 NHI #=
0 (rev 01)
00:14.0 USB controller: Intel Corporation Tiger Lake-LP USB 3.2 Gen 2x1 xHC=
I Host Controller (rev 20)

So, I need dbgp=3Dxue2 or dbgp=3Dxue@pci00:14.0.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--F9xz0k6yD4ufAAN4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmKeCS4ACgkQ24/THMrX
1yzzPgf/UVvhxRdvX8W06oSi6RZr466w+x/jNB09lxPjujceegvIKJrvLS3esone
GEBOePDS5NcLlwP1Rj1RGHEfu+0NPg5wXh+NwmxQS5RLU2GqjQB2a8BGt0iTzD9b
cK4pbMzP7EcdJNttjlfciGQu5T0IoSQyot62sYwcttXfPZLPqFZPucZ8UQD0oLuq
QfEjB4nypO2e/l+0tYqVUiWMf0EuhmA96mQ0s9l9HucfvPjMkU1EQ+HWhDcSmnYY
mLBQftYZk1TRyev7/H9ZzJ9hqXRBeQm95PDyYDcHtUt1/RCts3Hwwyb5QTOMvTPr
M0rVE0jLJjPu+UWuAl7x/cQCXbHpkg==
=zxEu
-----END PGP SIGNATURE-----

--F9xz0k6yD4ufAAN4--

