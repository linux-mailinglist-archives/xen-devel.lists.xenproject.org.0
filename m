Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40244ACC4A0
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 12:47:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004207.1383868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMPAM-0003cv-56; Tue, 03 Jun 2025 10:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004207.1383868; Tue, 03 Jun 2025 10:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMPAM-0003aZ-0e; Tue, 03 Jun 2025 10:46:46 +0000
Received: by outflank-mailman (input) for mailman id 1004207;
 Tue, 03 Jun 2025 10:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zlp/=YS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uMPAK-0003aT-Nm
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 10:46:44 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0855fc02-4068-11f0-b894-0df219b8e170;
 Tue, 03 Jun 2025 12:46:41 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id 6A2EE138011B;
 Tue,  3 Jun 2025 06:46:40 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 03 Jun 2025 06:46:40 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jun 2025 06:46:39 -0400 (EDT)
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
X-Inumbo-ID: 0855fc02-4068-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1748947600;
	 x=1749034000; bh=vzcA9HWTWIUMZB9oPmUpNB6+WB4ekEb8Hk9INiG/UfU=; b=
	N69I8BVxr+V8NS4TAQss4jYyaDDwhC74i93UsKz6r8uaPROUu/R1WW/Er4H+KgFh
	xf6vWETGeUuskcQ24X5HDqq5jBceV8Q7puqNFp2b7fAtMsz/I0cVcd2viCgMkwha
	GD6ZnPkQcsRHpcXTTQAvTCDnEgI6awx159XfqfHPcP3mRKYwsEWp+W+hY9Jo2hnO
	J2HbiMBMOuwjYSN8vFFEDUYFz7m/GkX3vHYWECh8yPLAa45ebouAcv6MQ2xnWN1O
	920H7IuSdn+07V+BA3h8oE90C8zgAIHgv8R+o/1/X7d/t45lK7qj41Pe+zwG1D03
	TzUN6ktnKz3X95ypmfwKfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748947600; x=1749034000; bh=vzcA9HWTWIUMZB9oPmUpNB6+WB4ekEb8Hk9
	INiG/UfU=; b=ONj4NdSMLbp7TPMdYFAeL4/wNs+YcWPZDNjSLm8PDoPXABEdBbh
	QMc+1zTpv0ZMqcW3Bp/8j35SdiDxLbWcDIgYaHgifwHxSzNA+QzDt1n2BbgzwSpx
	+VKiO9Z26ObsHcuJtuss5mOk98He7syvPvW8AnNTZMlRtxcr2J72QJQInOXt8fzW
	bdOpR+WBT4PW9YbOlnvTYB6/z6rcmkJxp+jMtpFIO0JkWtmS/ejh9xW/XDRQJbZz
	NO5MzxWrFvWHZxKpcKfFi1cST+e9sq1Kkyy2htOM5LO+eCGQ9oEBG+TRzgOzyUGw
	htq9LwrmoH2asbXzQB7oXMQnW2C7osj7zSw==
X-ME-Sender: <xms:j9I-aLPG7wKcubpJHTAXkSnF1SDXOQCvADrpQyfJgzLdRD3kuSzlgA>
    <xme:j9I-aF-IllsqTzKWGiLAu2krjnPm0mEhsmz0nA9-Ba9_dR6KbcyZGVLPCnpU90l2e
    NZSN1mWtZsNoA>
X-ME-Received: <xmr:j9I-aKTCkU6mUpT1oRxs10nDXn4pAADbYTUTjIN8MrU09VEl2_WdYoazx4gy_Gxo1eTsk8-ws67PFTEiBMsqUquw76Ea_1BO95o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecu
    hfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffr
    rghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegue
    etfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    pehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsg
    gprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurhgv
    fidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvh
    gvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnthhh
    ohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehjghhrohhssh
    esshhushgvrdgtohhm
X-ME-Proxy: <xmx:j9I-aPujAlXNlkTyi3PIJOiQ7q-BG09i5BynPkqI-FkqvvRcTiawWg>
    <xmx:j9I-aDcYG6PWtIjCXRJHN0AESwnMM_9V5bYsHaHJB5RDg5MOx4SMOQ>
    <xmx:j9I-aL1V5U9sZHzRb7QL2cChfRIHqtn1GiB0OCwzipWFQ-Sb5yHBmQ>
    <xmx:j9I-aP_ghnIor2xbF91c4IIZarV77Gj_x4GM-4FzsU54c7dxXpMLgA>
    <xmx:kNI-aIDbLuc2TcDAJO5ZOpm1exSQ8PEKCD2xJXCqUde9CSDixAsfcSw_>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 3 Jun 2025 12:46:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] Revert tools/python part of "tools: remove support for
 running a guest with qemu-traditional"
Message-ID: <aD7SjAXPrDDPaCAu@mail-itl>
References: <20250602112253.2628571-1-andrew.cooper3@citrix.com>
 <aD2KpLtC257hlUj8@mail-itl>
 <ae5a5de4-22ce-443b-a88d-16b89b28ac11@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="RPDInwLMpp7r77WP"
Content-Disposition: inline
In-Reply-To: <ae5a5de4-22ce-443b-a88d-16b89b28ac11@citrix.com>


--RPDInwLMpp7r77WP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 3 Jun 2025 12:46:36 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] Revert tools/python part of "tools: remove support for
 running a guest with qemu-traditional"

On Mon, Jun 02, 2025 at 12:31:59PM +0100, Andrew Cooper wrote:
> On 02/06/2025 12:27 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Jun 02, 2025 at 12:22:53PM +0100, Andrew Cooper wrote:
> >> The migration stream is a stable ABI.  What this does is break the abi=
lity to
> >> inspection and operate on pre-Xen-4.21 streams.
> > Do you mean Xen 4.21 should be able to accept migration of a domU with
> > qemu trad? I don't think it's a desirable feature...
>=20
> xl is free to reject a qemu-trad stream if it wants.
>=20
> What's not ok is verify-stream-v2 exploding with "unknown emulator 1"
> when I ask it to tell me what the bytes in this stream mean.

I see, in that case:

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--RPDInwLMpp7r77WP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg+0owACgkQ24/THMrX
1yydpwf+KXqUOqyAfR2SazoUISvmNHq2abr7Fb96AngaDfMSqmXKoBnDVC5nhIPk
z7WJ2ZlwNxub2eYWdkq3u9GICuIuwr1OmBJYfFsbpDlskm/I2/+XM9KHvEZqaa5G
+l1ojkbMFiGQbqJ0jMCfYZ5DMMMOkR1k3StoweluFW696FbyDwlZUapsukwkQEnI
lXpQaj5g8qVszLdHk4mKBgeUZBO2fXRo/VU+bEbLAiOwdXMvvnuTzcPVnv5mYIFe
D5jFYed0Lvdbf+O05XGd4srcDS2puWCxSRePUwSLf2M4um6is7Mud+AOKFOzghpu
1onLoECMElWLBOGvPoyoz4U+Z7m/bA==
=hdj1
-----END PGP SIGNATURE-----

--RPDInwLMpp7r77WP--

