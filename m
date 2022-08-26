Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1A65A2E19
	for <lists+xen-devel@lfdr.de>; Fri, 26 Aug 2022 20:16:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394013.633263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRdsP-0000a1-83; Fri, 26 Aug 2022 18:16:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394013.633263; Fri, 26 Aug 2022 18:16:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oRdsP-0000Wz-5M; Fri, 26 Aug 2022 18:16:17 +0000
Received: by outflank-mailman (input) for mailman id 394013;
 Fri, 26 Aug 2022 18:16:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kmTq=Y6=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oRdsN-0000Wt-SH
 for xen-devel@lists.xenproject.org; Fri, 26 Aug 2022 18:16:15 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c41081c-256b-11ed-bd2e-47488cf2e6aa;
 Fri, 26 Aug 2022 20:15:22 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 4B1CF5C04C2;
 Fri, 26 Aug 2022 14:15:21 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 26 Aug 2022 14:15:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Aug 2022 14:15:20 -0400 (EDT)
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
X-Inumbo-ID: 0c41081c-256b-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661537721; x=
	1661624121; bh=L1ltJ2hOmX5IYfZVtSYNVObad6mBdP3ftS5EqeH6HsM=; b=s
	5mYwyctMqZFI1drS2qYXkrf4FvW6MikYWwEZTGKxx3rd9EsF6eUDM7BSdXPG/cv+
	BNBB/sTCMmBZMdpUB2rs3CHP6N3CfqRXC/VAhWQ87gxPEIs4K0aFdsW8sqMxxSqY
	1D76ODepsbOirsf3tREG8W+KX3+ZD3CW0gXFudRXyx6NaWbhh/DBi9Jq4cy/b3Zj
	XK2qJsX7xglCkx9e69IUkgfebtLjnRSK89VH9wKdu+OQL12YEghDN2vesUbgZOoV
	0Om8up/OhF1a3Ul2AZ6yfU/W8T65h0p0eCNqli+UlRtdt/b0svt/xGm9JHLPGYBh
	RvErjLRRcqNII2aJZLkaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661537721; x=1661624121; bh=L1ltJ2hOmX5IYfZVtSYNVObad6mB
	dP3ftS5EqeH6HsM=; b=WZCa8vg93LC8nwZZ9C64/oAWUMz6qqvo/xJC5ymRirQB
	eWZmFtgAdVLEdrnXuj1ge+qzVtvUJAg9tYnujgb+E1qAV1XWegV8z9/1xMuMHZfS
	vqaE1jzI8c/GmZFl240h+GSond7djkwsDsa5Am9o03DhuCcfaAJ6PfiR334YGmWY
	azyQ8S0NnBv0zXRDP1zmH5lKmxO2MC3DvMQqU0DZvcgl5MAd499B1UkBCycmhspU
	mNghjq7l+gnMUQ0WJhOpd86gxh8D0EkSODNo2UycRuEfQpW1FtCoYuIyoZeFX6J7
	X5q8/MeBvJM4YnXXd8ejP1mFmJx35998f/cq30gaCg==
X-ME-Sender: <xms:uQ0JY87g7FuCfT6g4yqQizVQmFoc0rilkObLFyZUWbYtfcuu7zyZ8g>
    <xme:uQ0JY97nsh_2QdszWOiY0P8DtXH-Vv-oEuxkqpobvKJBWG2Ewf1d9hAl6EhprPYTi
    jGbRlLkPJYgmJg>
X-ME-Received: <xmr:uQ0JY7eFhnc1RttVI4GuA5kznqzlNjVDmLKUAO2Xg53nLBafnCR_gOhtpDC1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejhedguddvudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghm
    ihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinh
    hgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffej
    geejgeffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhm
X-ME-Proxy: <xmx:uQ0JYxLFAPxWgvMdWmGhmSWX3gnNKPd--ME2IDp4U5QB0Ura7yGfEg>
    <xmx:uQ0JYwLZPYKnCXzI1pxf7JU4iShLc8-hQyemKX6eacaZtgQFYQmlAw>
    <xmx:uQ0JYyzOC1C2lj7IEzgG2hJNVbUKY0KcnCgnrAB-YFWEryDuGDHRjQ>
    <xmx:uQ0JY6wCJBpbcOV9Fr3pediq9NpWcV_sVPLOch3EpCEaxFRYaENYDQ>
Feedback-ID: iac594737:Fastmail
Date: Fri, 26 Aug 2022 14:15:18 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Make XEN_FW_EFI_MEM_INFO easier to use
Message-ID: <YwkNt9w4T3H38D8K@itl-email>
References: <20220824210452.3089-1-demi@invisiblethingslab.com>
 <df443aab-a2eb-75c2-3a4d-df6d093b5788@suse.com>
 <YwfdpPH9PyPXlMAa@itl-email>
 <ab973fa7-85db-af53-9d4c-cfb8c2099135@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2bklL058a8q/yZrL"
Content-Disposition: inline
In-Reply-To: <ab973fa7-85db-af53-9d4c-cfb8c2099135@suse.com>


--2bklL058a8q/yZrL
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Aug 2022 14:15:18 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] Make XEN_FW_EFI_MEM_INFO easier to use

On Fri, Aug 26, 2022 at 09:18:50AM +0200, Jan Beulich wrote:
> On 25.08.2022 22:36, Demi Marie Obenour wrote:
> > On Thu, Aug 25, 2022 at 09:59:56AM +0200, Jan Beulich wrote:
> >> On 24.08.2022 23:04, Demi Marie Obenour wrote:
> >>> Fix both of these problems by unconditionally setting the memory regi=
on
> >>> size
> >>
> >> If you were to report a larger ending address, why would you not also
> >> report a smaller starting address?
> >>
> >> But before you go that route - I don't think we can change the API
> >> now that it has been in use this way for many years. If a "give me
> >> the full enclosing range" variant is wanted, it will need to be
> >> fully separate.
> >=20
> > Does anyone use this API?
>=20
> The XenoLinux forward port of ours did, and upstream Linux still wrongly
> doesn't. The two functions efi_mem_type() and efi_mem_attributes() still
> wrongly fail there when running on Xen.
>=20
> But how does this matter? Even if we were unaware of any users of the API,
> we can't know there are none.
>=20
> As an aside: Something's odd with your reply. When I opened the window to
> write this reply, Marek and the list were put into To: (instead of Cc:)
> and you were dropped altogether. I can only guess that this is what
> Thunderbird made of the Mail-Followup-To: tag which your mail has.

Probably?  Mutt generated the header because I had (incorrectly)
told it that I am subscribed to xen-devel.  Is it best to leave this
header unset?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--2bklL058a8q/yZrL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMJDbcACgkQsoi1X/+c
IsHiChAAsvOn4zFvCNKwO7CyAHNveQa6jZDW5QdBS+nK95hdoffrGJ7uLz5FRocq
yGzwtSPDfOJKJ62z/5dFZUqPvHbm6mUCFAwWYRW4O2deeNsvK+rnonJQUqFCjzwF
HntNBb+LfsrpmlYqpG/oHxJucb8VzFbx9I+eMtzY+Ao/RbVqZu9xXK0DqdGhA3my
t6FkURZt3NhAJ+1UW7huPPVLItRqGrkem4r72eFCjJ5quweeB+LueuCEqetqcP1s
w6jX4brkMObChcd0tMONpSLoeEWo3i1rZz/2HlqG+4VZGgVy1XqXb8BDlnr7t8Xa
iq7XmtKB1cGSgCO2kBn73EJt1ZeFjCb1ipHF+f/BqXKC0DDLb3PzxwS+sOoLzVeR
K7Yddq2ZKZZOABYy5SVEhbB4v94T/JsVTtP4WIGL6TALIfxhyHByrm6JXQmi2TZI
xu/972ULagC7iB6xVvjIORQuAVFWEkmVDXM96dzrJbvb1Tlw/BDrXqNC2HslyAD7
jbMaRmxatSD3xcyX15gYIvNw78ZrmQEDRajTerWHp7rE8Uff5bRl/h6jnCkYl/dj
+rEhv7lO0x52GKxcP9D6IYYnOlAAmWCP0g8alrtvT39Qemdeai5aG6O6+A0UwNsd
7VlVSE3TL9lls0YxydcUHJ5e7MlsX+2hiEFXmxaVl/Vy3oQqMgs=
=3kbp
-----END PGP SIGNATURE-----

--2bklL058a8q/yZrL--

