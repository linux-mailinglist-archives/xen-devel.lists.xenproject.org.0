Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 832376112B6
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 15:28:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432076.684780 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooPPN-0002ZX-Cd; Fri, 28 Oct 2022 13:28:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432076.684780; Fri, 28 Oct 2022 13:28:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooPPN-0002Wr-9m; Fri, 28 Oct 2022 13:28:25 +0000
Received: by outflank-mailman (input) for mailman id 432076;
 Fri, 28 Oct 2022 13:28:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IcqW=25=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ooPPL-0002U5-E7
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 13:28:23 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63939aed-56c4-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 15:28:21 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E3ADB3200954;
 Fri, 28 Oct 2022 09:28:18 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 28 Oct 2022 09:28:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 28 Oct 2022 09:28:16 -0400 (EDT)
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
X-Inumbo-ID: 63939aed-56c4-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1666963698; x=
	1667050098; bh=ceMsi2j89XVIw2/Off3vX06mukvQ4YVYqKcLixrJIVs=; b=k
	Fxe0kx7eyKmkbAw56PoB8cCvJBBY8E5bxF7Mk8sUvFWrjzsougDXBPKU5cy6mNai
	/ny5MdCXXhyso9LAwcpK4O7lhvgA6d0jrapKCZdkhWaiZEnQfz/kfiX7xJu7zscZ
	wviAGglSS+kXNGWvlE+FuQ+jEwTyiWzwdjMXbDxo/El+Byriin0wn8uL9L6Gb5FO
	tnjeDHPG28fK01iSgdXTPnfxltMougFmUI+xNEovKKbPmnpDlR1McENV5Xr/QrJC
	NvlYYUExuh1BzCXGxCEVSpNTbkjzIjuIs/0HAwqPCJlnHdAhztXrxrH9o/gTwaUy
	9TlqXo+K6f3brZ68l10hg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666963698; x=1667050098; bh=ceMsi2j89XVIw2/Off3vX06mukvQ
	4YVYqKcLixrJIVs=; b=bIFsTgj6paL7m07GfLrvNsFeC8ByNbtHzkQfHyzkkSMk
	ojyLUzKABjshOHDApjYhNRu9BFtiGgPwLPzhQ9tDno9d3uz4vZha7dg5gbeBrpDw
	ZSMU8T1+FaZsLUHwvvl8B04nrtguQA+zRKapL0tiUSq8pJr43rTKMW7YZyoRvQu2
	FFfnRyL+E7Tv6ttdCF222k/TbP4Z8eaOE7NMG9zD/4PMVo32MahiooLRAr2CW17U
	6oR4g6lyNAb9OMg/FlxyQvHRS69h3qanMWWRSihAEdawfmCMbFZ/ARObdZfMVwm7
	4xX5tHUEMtwc03mNLGP7HqiTI4EcMmMLMjkcR8pZ7A==
X-ME-Sender: <xms:8dhbYzr8qsxyhDrp4ISUhGCdssG59KtqfqryQq1KPJHLlrCqdJmzOQ>
    <xme:8dhbY9qc19xwAVjhgftMXaClVO5ajs0DSTVTbQ8tnCCx2D9pZIguvWkx60GL9ULnA
    g47zUvfI4LRpw>
X-ME-Received: <xmr:8dhbYwP9EVuc9FPiLsJhkvYfsdtkftShkpZAkuARATnjERVVOvSTW_3phIETWWxhe_eCa0zAvOH8as4ESRup3-pvdqJ0wUxWKV-f>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrtdeigdeifecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:8dhbY27YoA1i4KqOjEqKP7awQ1CxnSp2rUeILft4otcVioJZy1RBXA>
    <xmx:8dhbYy6_mnU4cbPmQdz7SnVlUBfKFxsfe7xnmjmdcI_CzLQtxjLVQQ>
    <xmx:8dhbY-hW9b2LQ6g_O39jl6ucgf68g5hSBwz7rTOqsfXH8zR_4Xcmdw>
    <xmx:8thbY4mxympksvOQLs5VNn_oK9Ys0q5v7gA3RJh1KD8tloSkhZ_kng>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 28 Oct 2022 15:28:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH-for-4.17 v2] xen/sched: migrate timers to correct cpus
 after suspend
Message-ID: <Y1vY7GmHCAmJj6hq@mail-itl>
References: <20221028111231.31355-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FK5hyYDgtHHSKWjp"
Content-Disposition: inline
In-Reply-To: <20221028111231.31355-1-jgross@suse.com>


--FK5hyYDgtHHSKWjp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Oct 2022 15:28:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org,
	George Dunlap <george.dunlap@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>, Meng Xu <mengxu@cis.upenn.edu>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH-for-4.17 v2] xen/sched: migrate timers to correct cpus
 after suspend

On Fri, Oct 28, 2022 at 01:12:31PM +0200, Juergen Gross wrote:
> Today all timers are migrated to cpu 0 when the system is being
> suspended. They are not migrated back after resuming the system again.
>=20
> This results (at least) to problems with the credit scheduler, as the
> timer isn't handled on the cpu it was expected to occur.
>=20
> Add migrating the scheduling related timers of a specific cpu from cpu
> 0 back to its original cpu when that cpu has gone up when resuming the
> system.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>

This time it works, thanks!

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FK5hyYDgtHHSKWjp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNb2O0ACgkQ24/THMrX
1ywkrAf+KHdjckeNgNVoJTCPUnFSIYR7OwKaZOoiUr6U1Mqkg9YNbVhtdRD8EmVP
XsxA+puCQII7Zpg4Mtf2x6CEUL73eJMOdBfiPBvZkMJVQmnv099a+xh8xQqLQ35X
pG5TzKWACzdjpo/nsBdOliHiLCmUZf2jRxerluOlwir1QPPUIkOrUdrfmgtd4Dlb
kr3kY5ISJxEvsdarLUQeTO8GoNUFOQ8KX49kdVgp4S6OWlhO9EOGWIb7tx0DwX0g
cCj9GB5IzYiK81Fxr2tSu5174pXWxgliCFw7GLjSNRSk1q62Gv+6R+prZ6PNI+DQ
t7YiW+eK9h3Fh6KDr1+xPYx8krhXmw==
=TEcY
-----END PGP SIGNATURE-----

--FK5hyYDgtHHSKWjp--

