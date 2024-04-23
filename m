Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057408ADB73
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 03:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710264.1109413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz4mg-00039a-61; Tue, 23 Apr 2024 01:17:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710264.1109413; Tue, 23 Apr 2024 01:17:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rz4mg-000378-3F; Tue, 23 Apr 2024 01:17:22 +0000
Received: by outflank-mailman (input) for mailman id 710264;
 Tue, 23 Apr 2024 01:17:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MUs1=L4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rz4me-000372-Ej
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 01:17:20 +0000
Received: from fhigh7-smtp.messagingengine.com
 (fhigh7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 38c37ce0-010f-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 03:17:17 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 9187F114014B;
 Mon, 22 Apr 2024 21:17:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 22 Apr 2024 21:17:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Apr 2024 21:17:14 -0400 (EDT)
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
X-Inumbo-ID: 38c37ce0-010f-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1713835035;
	 x=1713921435; bh=W0ZY079u6HH+9Omu5NtiySIZX1BIy+9zugkbBSXJGZk=; b=
	Bwg7uD0MwH/ToLKtMnZFN0UOd2y4XgQjpvvb5Ls12JPHGh4bmGaw8WN+t1IypGBA
	XQDNyzQRxIv+ThMP04yQAEUDPjPqfwRrUSNweryfgQmJMFYwwGqKrK1qO6Ob34U4
	5Nlijb2PwyOIuDBh9HpE37v+780aQxJdtynD8nGQTsXdd3H+oPuFuWaYdZasBUML
	C0hVKQfelzdRQIMmXbB4m90KJdLB7e67E2SVUmRHbu89u1xahHl2CHvtBf/iR5v8
	RBJenXQTN5wSTVtXGDA0UnmjfJNLv9BgnesmpyeRYoW/OhO9jxNxfYjZWXKDJvFN
	B/Oy9FHZ6W89N0g+3uQxVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1713835035; x=1713921435; bh=W0ZY079u6HH+9Omu5NtiySIZX1BI
	y+9zugkbBSXJGZk=; b=cHoHN8ai+zc+2ZGvfmRtdXgV7zYQurn31OfORGzrto3D
	DVrpumavB0CsKFQHwMcG6sb7izH1QlffKSaZG4sLNeSXwztIPfAG7Y7LjVzXnYns
	SmNc8q12LrASYR0//pLCfDOdkiwA0hHgMC5vZhm2Xeca0GEwQUhKNaICNEgyQ/tx
	TPtPAUfYNKLV2KnTluz+TBgGv/gGF5Do2AJZ7wpCZ9/Y/P6PxxLqNF6H/EdZKBLl
	a9dWLlb5ONxGV2mwg/bHVjflEdn/V7vYjISZxi9h95hMH+N0amMzxCs1/f5NXD/j
	E8oSg1GWAuuiDeca1RLFT5Ppp40UcvzI4bfjomQlIw==
X-ME-Sender: <xms:GwwnZpQ7rIu0BbQWdBfW0tHS1Fi8t6JMlQP0qOKoXHsbFEg7uvsMzA>
    <xme:GwwnZixyQsLPQhKstMZ9B1kt7qt9Usk1kDWpVUUydrEHN_badnc0Ii4xj9QaXXphS
    GKMuwTaG2YqxA>
X-ME-Received: <xmr:GwwnZu18zsgeH-A7uoFjnY9ZY3rHFBmYhDGJoo1rOvTs47O3-5F1aJgZebjy87uGA4y9Il9Z3rDytcuUDSgEDnxmmuz7jOO3Sw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeltddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:GwwnZhCLh_nbpPgH83c54CE9nrPGV310uXevtHdupIWMs_IHhoyPrQ>
    <xmx:GwwnZihaqlTs2TQkts8Z1pihJ-bCOaGWY3Z6LC1-3t9HXMmbWGTmSQ>
    <xmx:GwwnZlrvTmdHx6WXdzuPIaRV7k3zUKBh1GnZo8IrpsF3zOkvVWRGrw>
    <xmx:GwwnZthWPA1pdLe5wTkVAVfkI6ib306HxW_MqWufUHHrzSsfN-IrIA>
    <xmx:GwwnZqfo4Djf73B1RDih4UVlf18U2HZ9gHtBY5_LShYOK01AqLXc6BVh>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 23 Apr 2024 03:17:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/MTRR: avoid several indirect calls
Message-ID: <ZicMFtKob2e-ECxX@mail-itl>
References: <f5c8e38c-66cb-4f21-b66b-056061e37383@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vbd4/xjCM7SKK6Jc"
Content-Disposition: inline
In-Reply-To: <f5c8e38c-66cb-4f21-b66b-056061e37383@suse.com>


--vbd4/xjCM7SKK6Jc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Apr 2024 03:17:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] x86/MTRR: avoid several indirect calls

On Wed, Jan 17, 2024 at 10:32:53AM +0100, Jan Beulich wrote:
> --- a/xen/arch/x86/cpu/mtrr/main.c
> +++ b/xen/arch/x86/cpu/mtrr/main.c
> @@ -328,7 +316,7 @@ int mtrr_add_page(unsigned long base, un
>  	}
> =20
>  	/*  If the type is WC, check that this processor supports it  */
> -	if ((type =3D=3D X86_MT_WC) && !have_wrcomb()) {
> +	if ((type =3D=3D X86_MT_WC) && mtrr_have_wrcomb()) {

Is reversing the condition intentional here?=20

>  		printk(KERN_WARNING
>  		       "mtrr: your processor doesn't support write-combining\n");
>  		return -EOPNOTSUPP;

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--vbd4/xjCM7SKK6Jc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYnDBYACgkQ24/THMrX
1yywKAf/WYn0vaDq3uZv+KYD7AVA/fkK58mZ+/DutPFK2BJuyrGN7OymNdqsztKE
O1a7qn+SQF40sK1yCTnfgqoTsAAMrgby05s4T0fMAKRdjTgy8DZSdgAJuG3LkOIE
OCWOXsXxr+TWKZBydYTHgdQ+TmXj1lJFUnL5MaaOCdR48QE0QXxRUXpTXp1Ml0Dr
qNy+opJ1zWy1HmHcBNUcyTeioELwfgwzVFuX9V08RfoEVtgGHR9u3sYiLzi3LZgu
Z4ulk1e4kdK1NVsgWs1ZOP0GLLPZEUhLBXHDW5SR29cEsFSeqeTsb40twGbQ6l/1
K5h2pI575SwNEsxlFWV2XrE7906CBw==
=vR3s
-----END PGP SIGNATURE-----

--vbd4/xjCM7SKK6Jc--

