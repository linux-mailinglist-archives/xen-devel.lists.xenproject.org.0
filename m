Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD6756B07A
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jul 2022 04:12:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.363184.593613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9dSb-0001XW-Sg; Fri, 08 Jul 2022 02:11:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 363184.593613; Fri, 08 Jul 2022 02:11:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o9dSb-0001Vl-OS; Fri, 08 Jul 2022 02:11:13 +0000
Received: by outflank-mailman (input) for mailman id 363184;
 Fri, 08 Jul 2022 02:11:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZra=XN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1o9dSZ-0001U4-W5
 for xen-devel@lists.xenproject.org; Fri, 08 Jul 2022 02:11:12 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39750b96-fe63-11ec-bd2d-47488cf2e6aa;
 Fri, 08 Jul 2022 04:11:08 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C4ED45C003F;
 Thu,  7 Jul 2022 22:11:05 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 07 Jul 2022 22:11:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 7 Jul 2022 22:11:03 -0400 (EDT)
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
X-Inumbo-ID: 39750b96-fe63-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1657246265; x=
	1657332665; bh=CeQunBe4w1VGTt4GuoiqTtPLvP2BEXgJ6msZnCmtVzQ=; b=N
	4zHrz6BZgjd5kJ7+1I+5srCpYpWn0fphaJ4miA0he6HJj7GO7YK2fvO9087WcJdt
	bMJW8GzGD5K09PNAXWRH81REeDMDLPh6thOsWWP8PA/ixLvV1znZ7VE0HVq9al41
	obEg1DlKPSCuqUSj6m6xqx3RdXkWzU1ml0+pffiJE/CwjWoCnggLjHCBVd7E9rwc
	RijqhTl0JpZh7PRfyW01BYhNySrjkKOZRsMQAwZJzrsfuQqwCfqTix/AVg+AAXtl
	iMXXDoCC+eUIx6kNxOvzurLGIy5shztj0fA+2n3aAKTOIXIbkMIF8w4VF7YH6nzN
	/hu/66s1vdybO98p7BTXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657246265; x=1657332665; bh=CeQunBe4w1VGTt4GuoiqTtPLvP2B
	EXgJ6msZnCmtVzQ=; b=ZckhRdQIo5RACvC6c7bRPs5/d8fX7dqQZxqERy3BhPMg
	Wk8qZigTrmSFSZ4lo0ZrwUQtyN777uxyahn9Bb9TRASYEtw4yg93wUFkOHJKf0nH
	DcrCepW6IwJMMoWdITlMAo91jvYmsTMH7OwiYi5W8t9GRBidsh3nfvocyJbxeQpw
	CepQjbYDv3UjCuf7bjBNVaU45OuB3cj0XEM9CN8JbGFhbftqTbO6IgRTY3I3fIcs
	6a7QGA+HfrGsSSfSVMSVwdz+v16jmVNV7wGBGJXAHEpyzIxYQ7jxPRNXmtr1h4Ur
	/ZFMHGcvmuQfFT76/YBb8AetztajnoeqWmkLonpe0A==
X-ME-Sender: <xms:OZLHYg1t68jOaRj12Ly5C4NEnv30zzonJdmyzO-GEbfD6TYJXhZ0vA>
    <xme:OZLHYrE4KSaAigIJ9KUh3axlVVQ869ZzdFG8LDgcfNaQHX2DwMhDBmfUg5m-gM9cM
    HmX_QJj-zHmjw>
X-ME-Received: <xmr:OZLHYo6BCAHMTycQc90_BSanD41QINk5SjLQsnOj-ksgBzkzjuAl1ZEh9ynirJuFTR1sIc7ufz8jfemT8Qg3P99wO3nPlDpSkg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeiiedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdet
    vdfhkedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:OZLHYp0p0OwgRXcGqCl-jJJ3NVTEYILgDy3EAPYE9rba4Mo5Wz21kQ>
    <xmx:OZLHYjGKBJnpiioTq-1PtK-q2Yw_uQai0t-y6AwflvJ2T1UMtoQ4DA>
    <xmx:OZLHYi95KZ_DndxeQm27u-HEyblTdwhboevdu4NpASeRKr9-K5mdXw>
    <xmx:OZLHYo4v8s9UJvMZBoGWWPxYuSszTmsWrt_oRVvrC2umSvORM32C4w>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 8 Jul 2022 04:11:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Connor Davis <davisc@ainfosec.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/9] drivers/char: Add support for Xue USB3 debugger
Message-ID: <YseSNVXVXyLdwEVK@mail-itl>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="en7IelQQO5RTp+SB"
Content-Disposition: inline
In-Reply-To: <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>


--en7IelQQO5RTp+SB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 8 Jul 2022 04:11:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Cc: Connor Davis <davisc@ainfosec.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 1/9] drivers/char: Add support for Xue USB3 debugger

On Wed, Jul 06, 2022 at 05:32:06PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
> index e5f7b1d8eb8a..d12b2205dafc 100644
> --- a/xen/drivers/char/Kconfig
> +++ b/xen/drivers/char/Kconfig
> @@ -74,3 +74,12 @@ config HAS_EHCI
>  	help
>  	  This selects the USB based EHCI debug port to be used as a UART. If
>  	  you have an x86 based system with USB, say Y.
> +
> +config HAS_XHCI
> +	bool "XHCI DbC UART driver"
> +	depends on X86
> +	help
> +	  This selects the USB based XHCI debug capability to be used as a UART.
> +	  Enabling this option makes Xen use extra ~2MB memory, even if XHCI UA=
RT

My math sucks here... 58 pages is 232KiB.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--en7IelQQO5RTp+SB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLHkjUACgkQ24/THMrX
1yzhGwf9HiTmRjBJ4SHproDDDg+2QMARzDTcqfXes1yTylDUxoTeBi9R1nJdSYIn
ZV9ZBbt2xU+oW0xkEwewbeBE+Z1xpGGAy0N7z9Eof+mxrC2oX4sIrodSw7lCXioi
JXifBKe2WMPKDC8IaOsVaIacR4/O+KMChfLj3RisNxPdIvWPSXJ2Gqx35kXWVvjV
m18bkGtg9JJtnFCekfIVd0NRWv/vP+/j9z1SoDnWisUp5/nz1G7ZE4bN+mWkW/Nm
3YxBbNmPZK6Pk6ikc0iLrj3vcHSCMe8W/MFLcclC0FJ9Xw4F+gX5GOiTdMCKtiCx
43gbuVLwGfIE9tdX81p1R4dzU2Z2wA==
=rlMM
-----END PGP SIGNATURE-----

--en7IelQQO5RTp+SB--

