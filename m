Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868DB5782D1
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 14:55:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369768.601261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDQGr-00017p-J7; Mon, 18 Jul 2022 12:54:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369768.601261; Mon, 18 Jul 2022 12:54:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDQGr-00015q-GP; Mon, 18 Jul 2022 12:54:45 +0000
Received: by outflank-mailman (input) for mailman id 369768;
 Mon, 18 Jul 2022 12:54:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Ov/=XX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oDQGp-00015k-Uz
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 12:54:43 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca95ca16-0698-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 14:54:42 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id D4C1B5C0144;
 Mon, 18 Jul 2022 08:54:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 18 Jul 2022 08:54:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 18 Jul 2022 08:54:40 -0400 (EDT)
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
X-Inumbo-ID: ca95ca16-0698-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1658148881; x=
	1658235281; bh=h/tbsO2KjcHtIK4HiOvFAEK0fQNBRX4FiGCbpnn/kw0=; b=B
	pEOUncyHQGkGqWYqIq0f2WWjWY1IiJetS6m3C4TQ9HG8csyhvSVSMn3nfBIF4JSo
	IpxKefD9cXHCrhNfQPDvYirJY37+fBa2wqZPQYtO+EQyLLurQ92roj7h6PYAfQJf
	XxFOhpvjPHAQUX0HeQMJtcNAoO41RIHERTQOn2xKNcXAPYCmUyjKwBl4taICL8Em
	JHUPX+Zj+2r4Pi+N9Sd9ZT1R3ryah5NYHo5nF7+TNe6hZcgmT8fqGcwlUVrMCJSV
	TL1MPl2lFJvLKb4JwousnIybFTXGZpmlm5nJjtI2Rdr+lzebj04gZHLw20PXjiAM
	aE7RSQRcmDjPtJjVzJvew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658148881; x=1658235281; bh=h/tbsO2KjcHtIK4HiOvFAEK0fQNB
	RX4FiGCbpnn/kw0=; b=VOUK0hl5jUaJQpn4AosK1v7N7gADKiX0UWidQWX7tmDz
	tqDEs99iQEmXgzyb1MMGKjheHkjKD6TA5I5esUqXZh8xXojeuklIJbSobXv+I6hr
	nGtDjsgltueZscUqB0ctm7yQt919Rg0XEfC3uBR4b5t6lRxRGF61T4HL+Zqzli0v
	R9mqq8hFFuGQWQtcId++HMt9T5HAY75vn42t/WowHWt37Lfvjds9R6mjrortS56w
	lMY2GQ1aM4JgFaBWzM9eXO444k8MNyQL+OrxT2jX1tHwtWoUfjEC3iVmUvtyR53Z
	hPsXnnZzR4Lk7DerTnekqEyfIbAqzC/5yHL7qkddbw==
X-ME-Sender: <xms:EVjVYsYUeS8j9vgrEsvP3skb9u2z-Hhh8x91rcZ-uB1WHhtOZ6R3Og>
    <xme:EVjVYnbYtSG57avVzue5GI-CJJIYVgpiRPpA7O2xp9UZ08OWrBvOCMX9cbL6Hb29N
    5zAsWwHvSl8EA>
X-ME-Received: <xmr:EVjVYm-GD5NiEZO7Ep858oG8SaDlWwK7VWU_piY3rbi4E0Hmhi8waunPQ0MvjIhgKDaIbL0ierMHteYwjDAj-hn2CzH01MCa7A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekkedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:EVjVYmpjmwW8YoCPa6oEUb1Vce1Lm-XuPEg6gbLUgWXFt69NDSWPGg>
    <xmx:EVjVYnpUdsy_QcMBUUCDx17ZaXjddnuinZ0jtXQ6lwtbnM9wyANr2w>
    <xmx:EVjVYkQwpotHDryFJA2lnBzRB4HVPIOhkLpWvP9qSDLmgFD8X4zX2A>
    <xmx:EVjVYolafUv9cC85x2ivZR5Laz8oGlj2QXnFKBMVM_TT_PoCt0ZGcw>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 18 Jul 2022 14:54:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 9/9] xue: allow driving the rest of XHCI by a domain
 while Xen uses DbC
Message-ID: <YtVYDVThOO9KU0d2@mail-itl>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <a1becf0ed2a19304ce122540e67675c06aee1702.1657121519.git-series.marmarek@invisiblethingslab.com>
 <50867e92-8d35-44d6-e10f-a26f35f53221@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2WdPmEE/1HPJNkQI"
Content-Disposition: inline
In-Reply-To: <50867e92-8d35-44d6-e10f-a26f35f53221@suse.com>


--2WdPmEE/1HPJNkQI
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 Jul 2022 14:54:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 9/9] xue: allow driving the rest of XHCI by a domain
 while Xen uses DbC

On Thu, Jul 14, 2022 at 02:06:07PM +0200, Jan Beulich wrote:
> On 06.07.2022 17:32, Marek Marczykowski-G=C3=B3recki wrote:
> > That's possible, because the capability was designed specifically to
> > allow separate driver handle it, in parallel to unmodified xhci driver
> > (separate set of registers, pretending the port is "disconnected" for
> > the main xhci driver etc). It works with Linux dom0, although requires
> > an awful hack - re-enabling bus mastering behind dom0's backs.
> > Linux driver does similar thing - see
> > drivers/usb/early/xhci-dbc.c:xdbc_handle_events().
>=20
> Isn't there a risk that intermediately data was lost?

Yes, there is such risk (although minimal in practice - it happens just
once during dom0 boot). You can avoid it by instructing dom0 to not use
that USB controller.
Having this capability is really helpful (compared with the alternative
of using the whole USB controller by either Xen or Linux), as many
(most) systems have only a single USB controller.

> > To avoid Linux messing with the DbC, mark this MMIO area as read-only.
>=20
> In principle this would want to happen quite a bit earlier in the
> series. I'm okay with it being kept here as long as it is made
> very obvious to and easily noticeable by committers that this series
> should only be committed all in one go.
>=20
> Also along with this is where I'd see the pci_hide_device() go.

Earlier version of the patch set had pci_ro_device() before this patch.
I can add pci_ro_device() in the initial patch, and drop it in this one.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2WdPmEE/1HPJNkQI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLVWA4ACgkQ24/THMrX
1yyiiggAh+xO28p99BDuixDOn5z+iDPsja5IhLf8vB8zEa5KAvWp5XyJPFfMjFX8
1z8EnVqmeno2EOPn8i4xDuKXR3IqQ/3FpwS3fEBZPP09mIatrKym/J/jKQu0U+RG
xH4R+/zQkh5NF27itmkK2AWvMfL/JtdsTd15Hb5YtMQqFLTvhNl1xZG6w0PtcaiR
i7fFrL2iFSJbBPjty8eTcGB4cgfCC9vMO6QqV2jzAlujRqDmdCPBsEo0MCJorpcI
IfquuYbVlzve0UqgJYDranE7GwR6lXrfdjki9wqfp5X+lUYqTfwuWk2JeZACk3pT
4lXG1aPii8haEnsUuioq9CD7hes+eA==
=+S4N
-----END PGP SIGNATURE-----

--2WdPmEE/1HPJNkQI--

