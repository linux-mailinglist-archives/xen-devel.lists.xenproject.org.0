Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F55587BB2
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 13:40:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379265.612575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIqFT-0004St-Sb; Tue, 02 Aug 2022 11:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379265.612575; Tue, 02 Aug 2022 11:39:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIqFT-0004Qz-Of; Tue, 02 Aug 2022 11:39:43 +0000
Received: by outflank-mailman (input) for mailman id 379265;
 Tue, 02 Aug 2022 11:39:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9V8X=YG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oIqFR-0004Qt-MR
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 11:39:41 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c93962d7-1257-11ed-bd2d-47488cf2e6aa;
 Tue, 02 Aug 2022 13:39:39 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A5095C010B;
 Tue,  2 Aug 2022 07:39:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 02 Aug 2022 07:39:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Aug 2022 07:39:34 -0400 (EDT)
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
X-Inumbo-ID: c93962d7-1257-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1659440376; x=
	1659526776; bh=YWv9qomqIrVSkbEgIJOPxGBO+lGKFBqYCcjNcgu+s6I=; b=K
	oSujEucYoRUcctOOxMPVqzCXG9F9CUPCzHJiIvpeD5G2+D9jRDr7s16npvblht3h
	xgJJGufEiMGeUuPM49sphPupGcgGjiqtGoef95bsLxGXxlTbcJpJwZ/o7hPUTbNy
	q2W6VG2+NK3b4SPdJsb+fIfQlitjtIE01Ms/K5p/NsjY+b5fv4sXlYDRSXQHn44i
	3cxnoNzn1M7phlf6wloiNaNhCPG6rldc7OpZbRDsY3PlIC6GGmW7KG49R60Qzbel
	JaibW2MvMQh9DAGgxfszQ+zhnzSsAqWN71L47z9hY4/gdlMpOnWycAo6tc+9Qf+o
	AqWxWZDBb2ch3b/UNq5JQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659440376; x=1659526776; bh=YWv9qomqIrVSkbEgIJOPxGBO+lGK
	FBqYCcjNcgu+s6I=; b=raxmK9bJhIclE4CdwP53L3qCLTz280Ttx8Iz65IXdwyp
	oxetghgQ2m0D1GvvZEgqwglh0Kx8OKQWQwD8loVO5xvndREBhIR5XibP+alIP5t6
	Qm8EyVjx79it2oDzuKuJ4HfK4sPQr3zlMgpGPZYTfsL0BBUdk/gZi/BxOUz6jbbV
	3BLKRcVxGr2s/EY2a/LIK1bVT9jBPNx+P0wi+saVoMRSHZoy1sQNOWDmcU6iNVO6
	Y0dCJF8OfXxpIsQtei8WcJMMEI+SP7BtW2Ifq9TDrNUdaZc3OlcoXhet0Mk/n/eR
	QmFmiyUPbRGoa6BU3fW+ZiPlBkltNwMq3iemFtzpOQ==
X-ME-Sender: <xms:9wzpYt1idaf5FWd5DSnwymvf0ByBwuC0SJy2865r4qfbxlbplI0CDQ>
    <xme:9wzpYkHCf9UP09gjm5ijVNyjhT0jXNCBl4XCce_xkiFJInJfZ-h0qKYL2o10FVfQj
    UZ0Zm1jEq_lfQ>
X-ME-Received: <xmr:9wzpYt5zOBlEXXsmLMu_8rzVvfBNAna6dAG66ZBcgue0zTU7HwSo7iYG1GWwsXAfMFEMRvX9xbNhF82zfr22BZ5--xzZs-ihAH0B>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvhedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:9wzpYq01rg7XaAJh9n8B1YGi-Ojb5jDQU2wClvTmMdEEmNB5YyJOWw>
    <xmx:9wzpYgENJoLXEoy9MJNKgW9viUQ11QUG4YMDdEQvH6Y-H4THU8SnbQ>
    <xmx:9wzpYr8LtfVLcEmR1l78qy_RJGEswdt96OQ5HtNyEEA1upvi--bqlQ>
    <xmx:-AzpYlNHZOqwRWNwnf_WXdvMJAX47bVG3QGwJUmo6oVIc0r8KEJPFg>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 2 Aug 2022 13:39:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Julien Grall <julien@xen.org>,
	Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	xen-devel@lists.xenproject.org, libvir-list@redhat.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type
Message-ID: <YukM85j+Q+w0YLCu@mail-itl>
References: <20220729155024.3327364-1-olekstysh@gmail.com>
 <d29b2ad1-fa32-4897-a113-c8a0864c6630@redhat.com>
 <7444eeec-5a7c-6a18-ffde-cb32528a0e20@xen.org>
 <Yueeh9w1EiY2sNEK@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="amSIcO9h4A3vNWt5"
Content-Disposition: inline
In-Reply-To: <Yueeh9w1EiY2sNEK@redhat.com>


--amSIcO9h4A3vNWt5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 2 Aug 2022 13:39:31 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Julien Grall <julien@xen.org>,
	Michal =?utf-8?B?UHLDrXZvem7DrWs=?= <mprivozn@redhat.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	xen-devel@lists.xenproject.org, libvir-list@redhat.com,
	Anthony PERARD <anthony.perard@citrix.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: Re: [libvirt PATCH] libxl: Fix build with recent Xen that introduces
 new disk backend type

On Mon, Aug 01, 2022 at 10:36:07AM +0100, Daniel P. Berrang=C3=A9 wrote:
> Generally we want to see errors triggered from new enums arriving,
> as it can be a sign that libvirt code needs a semantic change in
> order to continue operating correctly.  It isn't always correct
> to assume that the 'default' case gives the correct behaviour.

Isn't that the exact purpose of 'default' label? If use of 'default'
means "any of the other 5 specific values, but lets save some characters
to not name them explicitly", then IMHO better to name them
explicitly...

I can see a value of -Werror=3Dswitch-enum when adding new (internal) enum
value, to find all the cases where code needs to be adjusted, but even
then a grep is probably sufficient enough. On the other hand, if there
are cases where indeed all the values of (internal API) enum needs to be
handled explicitly, maybe simply omit 'default' label and use
-Werror=3Dswitch?

Anyway, if tracking all the enums values of all the used 3rd-party APIs
is desirable (like, noticing when libxl adds new disk type), then it
probably should be a separate CI job, not the default devel build.
Otherwise breakages like this will happen from time to time, and will
be annoyed for people on involved in specific code part at all.

As a short term fix, maybe Xen's CI can build libvirt with
-Wno-error=3Dswitch-enum?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--amSIcO9h4A3vNWt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLpDPIACgkQ24/THMrX
1ywoQwf/e7IEk2U+3R7CZUtfnwVyv/QTfT2IKwqkJfSi6U9WrODSXKms9L89pPkN
yR+O9i6J0kacfT/VTrqYr91xF/8NC4cdiidlt2cCrr3Nu1HyAuO32zGBxU9YeUz9
WkU2R02B2A0lhREUjpfPpUMXhHiRXL8r8jOob+mIpE/yp+YX4TfapkG05o04e2i4
7VKDFOZD+XogFxzio2C4TmIpZlPpjSDZXsSO3fhGux9jj7LKyX+Y/z289wEfbUw+
XO/gWFokSzzVNV1p5FYW/nkGuaF7/95jnjdeDXsRKIJQRPmhXx0/P4uK9ZhUFFiK
jfPVr01LhDvXGIP9xiHdvKHWCUWBRg==
=BUwU
-----END PGP SIGNATURE-----

--amSIcO9h4A3vNWt5--

