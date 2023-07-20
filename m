Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368D275BAC2
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 00:44:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566780.886089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMcNY-0007M9-1P; Thu, 20 Jul 2023 22:44:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566780.886089; Thu, 20 Jul 2023 22:44:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMcNX-0007J2-UC; Thu, 20 Jul 2023 22:44:11 +0000
Received: by outflank-mailman (input) for mailman id 566780;
 Thu, 20 Jul 2023 22:44:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GtTE=DG=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qMcNV-0007Iw-QO
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 22:44:10 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecaa09d2-274e-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 00:44:06 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id EA5493202ABC;
 Thu, 20 Jul 2023 18:44:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 Jul 2023 18:44:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jul 2023 18:43:59 -0400 (EDT)
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
X-Inumbo-ID: ecaa09d2-274e-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1689893040; x=1689979440; bh=uvJ2lRUpS0RozvK7oxH/DvhKOg1op0VChlq
	O8mVoUl0=; b=JPW0juiEg/KuUQEaQP4nwCk/saF2qqSu1vkaYhmzifnda9R+7vU
	WVSkzQpX84WHGuUNrRRWkejjoE/qZV2G8pItK6w4XzAF3lB/7Bj5WEsHrzvgKctg
	1sr+1DM3tyWox7VzGhKiy8FC+W1lKs2xsGuqKnP4wcIvKbtzmECKspdJvN6UNyS0
	gw5VUtyFgE2kEhsYAlyeoV4wsYaf5GDJO3R30UfkARt6m6onrlfJgMW4PBidFQO1
	Rx/6N6X3ngCPlWKYKVPtIoCnzCPHVt33w6IbawSBdwbyBNopDC3cvOKAOS1M8ek3
	CvcMJJZGwwauHWaFhCFkoGQ8Al5YX/zcbPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1689893040; x=1689979440; bh=uvJ2lRUpS0Roz
	vK7oxH/DvhKOg1op0VChlqO8mVoUl0=; b=r+P6Xt/NzsxzCRj071C1hlJwQkj1h
	oDN33E0nVgDEkgUBzR27qxtR7/3LEY778LW6RnvIZqi+wM2mOY18O4ymENxarPbt
	A3CDgkKHqQ8Ycx0UsPjfb6G6jrZ4CwaBUPIbb3N/zpxieq0mAEQlrm88Ict1PUzA
	u50J+HrqmARZgrU1MlbAbghBqqztHAJC50/+bVDIOiSlgY/sT0r+Tll+y2s1r9if
	5Tr4Lrke/xYZhP7QVdnajpxEeCNCUDneO/ABdJkyijxVZ+H08plfPPRPuOj68gs9
	ktMumA/i5UqzSxokCHvvnGI4O8fvUw/eLHSWY5TVJl4laxp46f3uCiPDw==
X-ME-Sender: <xms:sLi5ZB-5MuP_8XDnPP9UiAmQ8bu7sKiFt7DN3K683Z__ALMbrdJwDw>
    <xme:sLi5ZFvIdCG3oBDc7GWux0Ms-i2VpAyQDOr_TXguByXRqv2LpUci90OVZ9yJox0zw
    DELSr3gUzYIyw>
X-ME-Received: <xmr:sLi5ZPBo_7_YjY09o4u5k4L4nPgHEKOTPs_iMRWXDJTJ2G1uLt86dbJbsjdwFOsBQQ-2WILphjgi-2-_A0YvtKUW8g919enJRcY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrhedugdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:sLi5ZFe6KlodGlx9skqmxW_1lST3CaUzpP6rrgfpz9dfxZVE03_2Fw>
    <xmx:sLi5ZGNFEz4zFw9N0ZzpzrVG9zri-ZvygFEfVQ_8BR-INVbjTxNdOw>
    <xmx:sLi5ZHkZthDFFTJnIy7JqNkqVE-6xEojL3kddYgEvK21-XZwOk8VOQ>
    <xmx:sLi5ZPZ7rjnOOnukeiy3Lh28PUi7Zk0f2UeJH8yz2lppytJQtJ3INQ>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 21 Jul 2023 00:43:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation: add ECLAIR pipeline
Message-ID: <ZLm4q/zhvATqMI55@mail-itl>
References: <eb5fa852f306790160b967787592553d2fdf3de6.1689887842.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Za4u7niYLOziw1dA"
Content-Disposition: inline
In-Reply-To: <eb5fa852f306790160b967787592553d2fdf3de6.1689887842.git.simone.ballarin@bugseng.com>


--Za4u7niYLOziw1dA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Jul 2023 00:43:55 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH] automation: add ECLAIR pipeline

On Thu, Jul 20, 2023 at 11:20:29PM +0200, Simone Ballarin wrote:
> +# ECLAIR configuration files are maintened by BUGSENG
> +export GIT_SSH_COMMAND=3D"ssh -o StrictHostKeyChecking=3Dno"
> +[ -d ECLAIR_scripts ] || git clone ssh://git@git.bugseng.com/eclair/scri=
pts/XEN ECLAIR_scripts
> +(cd ECLAIR_scripts; git pull --rebase)

I'd suggest to print here commit id of the scripts repo, so the
logs will keep that information.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Za4u7niYLOziw1dA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmS5uKwACgkQ24/THMrX
1yyrKgf/cRyNsw7Ny4eVJ24X723ieyERbWx7ABwssZZLpdzo8zw0MJ+Cg5DXHexV
0aflj3Ts1pXh7iFTVH+i6N+tASklQwi9v+kWUY6VEZty2hermih/G7MdsxydLS0Z
7KN8YpIVb6uFsIe0tfzSAvG4HuregwmNGxQMLDLzERnLh93mftM86la5eRAvetIm
LQDSkKvT9yP2Y/5F7XvKB3zPq9FxHSpDfNKP6eRw12wWo7FrVSPJ8Hs1+r7ukg6X
i8nyYQYo03Y3xFUywOOYG9zGCe9MqKVym7U73eoAWT+CvnFfkTADV7p7IodgPrQ6
l9oK1j0dO2nMoB+zewYyFYFpFcmfXQ==
=UlR1
-----END PGP SIGNATURE-----

--Za4u7niYLOziw1dA--

