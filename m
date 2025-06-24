Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05116AE68EB
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 16:35:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023795.1399861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4kM-0000zp-AN; Tue, 24 Jun 2025 14:35:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023795.1399861; Tue, 24 Jun 2025 14:35:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4kM-0000ws-7N; Tue, 24 Jun 2025 14:35:38 +0000
Received: by outflank-mailman (input) for mailman id 1023795;
 Tue, 24 Jun 2025 14:35:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fpib=ZH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uU4kK-0000wk-F1
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 14:35:36 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c5c4bcb-5108-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 16:35:34 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 262FF7A01B1;
 Tue, 24 Jun 2025 10:35:33 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Tue, 24 Jun 2025 10:35:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 10:35:31 -0400 (EDT)
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
X-Inumbo-ID: 7c5c4bcb-5108-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750775733;
	 x=1750862133; bh=1o5WLUPC3/xWp3VpukBP3ELtP/YYgjUGaXyyigzAvT4=; b=
	SUBlFZQRi+yj7t7+jhRcQEu1eUUnkm8zWZtY9bCwZ/HvJkuWu1OFZp+uI3ojTGpQ
	+Q3V3unEX0StNZtk5cDgJI9+MUmwEUEF+OUzJ/n8OBP8dbNvO3WIz6twSKfhanOM
	vhjBsaAT9vb0YB87QXspSstvjTev3vpR6FJD5xiQMEYAtjggbVrkur/uq92Zg1SU
	JD26Di5lNBYfRzlQwZC7FCM9wRaWg71jtmMUusGpQxEQNIBTPjukvfXXT9OoKKgx
	3OBAn8oj0/5DrVyYVqwYUSWBFYtgn7Nf+GWJ4yZs4OOZS2sF7d4XEYsWrYPlhub5
	6JoGgEizoiVPJQaVVJ+kZw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750775733; x=1750862133; bh=1o5WLUPC3/xWp3VpukBP3ELtP/YYgjUGaXy
	yigzAvT4=; b=FcnNIE72P7bk8abj8OvGrhFvErc98NYBgLiNMZyUXScMTjfo5Lt
	Dy0/+JbXyRpsaXPKoNjAB83/5kQLKK8NY3PktrMDFWcA/ggKh0uYgQHO/DE/MCPJ
	SfKDkM6ghdqLJg+VJe7/25gGiRm980u/AzHmloNoklPvGRL7Y9M+Dyzq+Wem7d6M
	g8EvZUI8SbGR63o6S6cYrG9/ZKXU61cyIvKEkvieCTZyu7qoqhFJ0IyX9q2HnqNl
	EQtMpbdOgyAmVPLkSwLOGc4I92Xqf0prdZtDkW5vtbq5NMIoaerWGmvx6i3UnG66
	7ukD6CHdfID4ogvH+j7WIVAALEkmqr1uGDg==
X-ME-Sender: <xms:tLdaaFfgDZmkM1n3_lHpMFOE7SV3DXc2LcQCCR4s_LAgQ_yHSGL2FA>
    <xme:tLdaaDPLoCxUoGG_Cyo5foPEy6yOnsSYZmf5wAHnpHKN8iCIR9BQhUocLIA_cd2lD
    dm1KITXEo6klw>
X-ME-Received: <xmr:tLdaaOiuavtr-FYLt_VWZ8KL2f-24qnnR75fCkUWtYfhnGi61rgz3Gb82Ha_AiDOrlGjnqPWg9HJgydaIZAMg2kA3-8uPB4j5Jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvtddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegt
    lhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhs
    ohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homh
X-ME-Proxy: <xmx:tLdaaO9UVJg3bs_bMqfUm8e0_cw_ECNtFVvFv-ytZz_kdSJ4nnoKTQ>
    <xmx:tLdaaBuozmqDCBOCGVsA0TtxbD4IpHW-t8-0qj96_4IQtDCXNQjBTg>
    <xmx:tLdaaNFx0AjnOpa0cTspUcLM9u6lcVx3LCrcFfXePQW_ivyC5quhTw>
    <xmx:tLdaaIPNS6T4O7bz4LAeUs3kO8iqiNJshWymTveW4Msh_-AlGXcbyA>
    <xmx:tLdaaA7cFQN2Mhk48IEaXK_Z6FdnXLSEiRhplSiO-PKt-1GF86lBY7uh>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Jun 2025 16:35:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] xen/efi: Handle cases where file didn't come from ESP
Message-ID: <aFq3sYCAglRrMb8I@mail-itl>
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <20250624083157.9334-2-frediano.ziglio@cloud.com>
 <aFqcQe5quyjhu24P@mail-itl>
 <CACHz=ZjcZRtjHnUPFRRYd4d-ESv4j2_ssjSTne=6NGCf0s2vBw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NsN83TDdGENhcKex"
Content-Disposition: inline
In-Reply-To: <CACHz=ZjcZRtjHnUPFRRYd4d-ESv4j2_ssjSTne=6NGCf0s2vBw@mail.gmail.com>


--NsN83TDdGENhcKex
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Jun 2025 16:35:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] xen/efi: Handle cases where file didn't come from ESP

On Tue, Jun 24, 2025 at 03:05:25PM +0100, Frediano Ziglio wrote:
> OT: the flow of read_file (specifically "what" handling) looks
> weird... can I change it?

It tries to avoid duplication of PrintErr calls, while including what
failed in the error message. Looks like somebody really wanted to avoid
using goto here... Sure, if you want to clean it up go ahead.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--NsN83TDdGENhcKex
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhat7EACgkQ24/THMrX
1yyKagf/T4PHyxHMgK22dMs0mphUEBQAF4V0+GhogN9r+coPIbAcK3q76HzWvfNK
B2ipZkOjLI3Tb4QM8xHr4oLybpQkxGK2X8N+jy8wXR6sf3PdccNgeW62rzUcQr2S
NMX2McS3Lfyrp2sZMBs+OsT85m6ZEjcFrrbA/7BVRKlVvtcmCxw24ih7iDhN25AQ
ODFuiB9+jK9tZpjv2jLxRZyorTWwXruLjt3sLOMgwqcwgSPpgmcrBfDioC4eLs2h
uyyOIOP+pRbsiqjJhlJLEhiG7WJVhEGUvEQ0iIM8OsVbEeXS6MVk3+VY4sA9u6zO
+PMpkT9DM3A8qrNpL0DR86hLFklqHA==
=8XvQ
-----END PGP SIGNATURE-----

--NsN83TDdGENhcKex--

