Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBWqFL1xwmmncwQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:13:01 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BE3307169
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 12:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260346.1553695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zgh-0000JS-Ih; Tue, 24 Mar 2026 11:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260346.1553695; Tue, 24 Mar 2026 11:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w4zgh-0000GI-Fj; Tue, 24 Mar 2026 11:12:43 +0000
Received: by outflank-mailman (input) for mailman id 1260346;
 Tue, 24 Mar 2026 11:12:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1JW+=BY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1w4zgg-0000GC-Fe
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 11:12:42 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e485baf-2772-11f1-9ccf-f158ae23cfc8;
 Tue, 24 Mar 2026 12:12:39 +0100 (CET)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id CB1F9EC010A;
 Tue, 24 Mar 2026 07:12:37 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Tue, 24 Mar 2026 07:12:37 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Mar 2026 07:12:36 -0400 (EDT)
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
X-Inumbo-ID: 5e485baf-2772-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1774350757;
	 x=1774437157; bh=/ckWOhAwOTP30+Ax9lTc6ysN39NU7+4bq8AsZwAGCmQ=; b=
	u0u8SsaV8kA2J1FxJoeTE1FyRsKKGX3Bgcqagfrdy25GiGaVSy9P29r1FmwUZuj9
	2GpCJGnnZi52tuFaYnPbFuREdHb3CkBfEs+VoX0rdcqVXD68aEUD2xvVYB7cCOHa
	b5AP0kHSxbHP2CLkg4OKZRDvqwzZ11+YmQQL9m+bsBcIdPzMcN3NIa8cEqQKR/FG
	YnChM5EUodoq+LTEh1GScQs2DfUUjBKphx/h2uo0lhE4zZN7t7286TIyYch3n5Rh
	bJysKEYj3aaW9ZcFYzxkz4B0GxC4vNn7dMAadIySTYRJS6SItHR28VML0PeUyfvF
	X+/0bahT51W5b/c8CyD2Jg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1774350757; x=1774437157; bh=/ckWOhAwOTP30+Ax9lTc6ysN39NU7+4bq8A
	sZwAGCmQ=; b=STpJrx9tYNc2TXJ54p5WieMYdEb+qYv7ehAffNBz8lPE5Cz6epS
	VnxGTCGfh6uGqxRc+/L/scwHy0GdSx+5aeYymuaxJ32wbc9PF5wyyfhweJ7L5YYh
	IwiTFLlG/Nn188j3LMFyVP5rYG+y4sefUwYSyVUf5A8d2Grpz0UKb/OMs9gHozzu
	Fdzs53OodXaQblYlU7nd3A5NFhmkiHdq/gdSjg5jlCB9H5/vykP529Cuh1luE/sA
	3+OAPGCHpAE8T2Jfg/bLQpBW3qLMojLxt0jBJDp5CIxyvPeaT5kyXMixQ7hDjZBZ
	cIui5qv084dCYeqptf4Qx7uVJrLtJFtoGzA==
X-ME-Sender: <xms:pXHCaT12zJkldzUSrkWrpdBzEj3yVqJCcLg4Jo8uQAGEX4sHAyLclw>
    <xme:pXHCaUUqUxOBZxOAaEPK9CDM8yE396lZCcepeL7o16O1xf1dO5iuBS3C0f98uMtIW
    xfVeDxyDOrRkKPvQOg0rgtrgsNbpQN-Ixl6b3HFM5lvBmBQIw>
X-ME-Received: <xmr:pXHCaWLZQqub0-U3tE7Zdv-8WG4lKbQFymUUs7uEbQd_eYuE8_YezFHRBHWYs8lGtpX_m61NX_DWGGpGmAM81WIRpcEfbCgKQio>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdefvddugeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveeujeet
    geelleetudeuvefhtefgffejvedtvdfgieevheetheelgeeuledvjeevnecuffhomhgrih
    hnpehgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehsohhumhihrghjhihothhishgrrhhkrghrvdefsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
    pdhrtghpthhtohepshgrrhhkrghrshhouhhmhigrjhihohhtihdvfeesghhmrghilhdrtg
    homhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphht
    thhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoh
    epjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopeguphhsmhhithhhsegr
    phgvrhhtuhhsshholhhuthhiohhnshdrtghomh
X-ME-Proxy: <xmx:pXHCae0IzOvqs2oHuvXa9_D_U4Gph07OjgSQw35U5_XHxX0Z7taORA>
    <xmx:pXHCaU6PFb5WGzb-l7UxYq8NvT-mH9vb9uhVj5D-vyTnCq0gWh8V1A>
    <xmx:pXHCaf93I2Btbeie07HPNgPoKGeaVnsaPJOqyt-N_BAhQI7SNe_HZg>
    <xmx:pXHCaTWN1wEKYC8nJSVod4X26-yfrvTtPxxHxM5NNppR6M8OkePkog>
    <xmx:pXHCafg7O-h3KYXJyaI4CdPwZcTmwqlx_996zr9Via5MG_qsV4z5tMMz>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Mar 2026 12:12:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 1/3] x86/efi: Add BGRT image preservation
 infrastructure
Message-ID: <acJxoijDI6vhs5wo@mail-itl>
References: <20260324101726.6929-1-soumyajyotisarkar23@gmail.com>
 <20260324101726.6929-2-soumyajyotisarkar23@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BN9tOkU+Ug1Au2dl"
Content-Disposition: inline
In-Reply-To: <20260324101726.6929-2-soumyajyotisarkar23@gmail.com>
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:soumyajyotisarkar23@gmail.com,m:xen-devel@lists.xenproject.org,m:sarkarsoumyajyoti23@gmail.com,m:roger.pau@citrix.com,m:andrew.cooper3@citrix.com,m:jbeulich@suse.com,m:dpsmith@apertussolutions.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,citrix.com,suse.com,apertussolutions.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B3BE3307169
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--BN9tOkU+Ug1Au2dl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Mar 2026 12:12:34 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Soumyajyotii Ssarkar <soumyajyotisarkar23@gmail.com>
Cc: xen-devel@lists.xenproject.org, sarkarsoumyajyoti23@gmail.com,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v4 1/3] x86/efi: Add BGRT image preservation
 infrastructure

On Tue, Mar 24, 2026 at 03:47:24PM +0530, Soumyajyotii Ssarkar wrote:
> diff --git a/xen/common/efi/common-stub.c b/xen/common/efi/common-stub.c
> index 77f138a6c5..9e595600d7 100644
> --- a/xen/common/efi/common-stub.c
> +++ b/xen/common/efi/common-stub.c
> @@ -20,6 +20,7 @@ unsigned long efi_get_time(void)
>=20
>  void efi_halt_system(void) { }
>  void efi_reset_system(bool warm) { }
> +void __init efi_bgrt_status_info(void) { }

This has a minor conflict with the current staging, but then for __init
you'd need include xen/init.h.
See:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2405049544

Did it built for you without it?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BN9tOkU+Ug1Au2dl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnCcaIACgkQ24/THMrX
1yySZggAki+ZUmNLOcqp25HyLLk7S3eLKzgNRFOgGXfNFxMASTmDB6LsCTy6GUdi
d6A31BIVE2YfiVPBbj3BAZj0xUx+rKUH/5Aoa3GU3T/enKkXYxMgPhFTH0IpC4+s
ddcl2/5bBYeVWuYVMUytKMlYI9cXaYHGDS6zxuJb7a+ZCoEKCTk9K/rh5B8IyY+v
vv1C8W68USIs97So3YRMCP2fLVrn4IHOtTjodtCGh3da08Y+Y6Ghi4nfNMuz4hQx
FMsNONvaEXnyL8qvZ2vjBFVh1AtbX0UZZmuRMnOkfKXSEWwcVrJaA9nAA7ptAlpN
Lp7dpjBw+25dNM7ZWgXK+62BLDOXCA==
=sPL6
-----END PGP SIGNATURE-----

--BN9tOkU+Ug1Au2dl--

