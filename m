Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26F2AE8F7C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 22:27:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025551.1401069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUWhz-00073r-LR; Wed, 25 Jun 2025 20:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025551.1401069; Wed, 25 Jun 2025 20:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uUWhz-00072P-Ip; Wed, 25 Jun 2025 20:27:03 +0000
Received: by outflank-mailman (input) for mailman id 1025551;
 Wed, 25 Jun 2025 20:27:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=inei=ZI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uUWhy-00072J-Cn
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 20:27:02 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc5580da-5202-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 22:26:56 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 7292D1D00171;
 Wed, 25 Jun 2025 16:26:54 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Wed, 25 Jun 2025 16:26:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jun 2025 16:26:52 -0400 (EDT)
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
X-Inumbo-ID: bc5580da-5202-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750883214;
	 x=1750969614; bh=iTuvUqK6UxntR0DvtXRfTwo23JZ9mVGUGcVstB8NmzM=; b=
	bfYXhIyxt+0O7/5so+589CTD1cbcpIb9tQni8K2DFyGcY45OwIGIlSAR9yca0Iie
	k3/8fDmEPmwRLEnqSb/BDxtSCM8Jv9lvMY1IvTsjyvJ17AZ8V1/Xusi9aPvSM7JB
	vD0u+i8aLUAV2rD5pW/yI1rkQNxHsa04zGtCUQPcHuUIciy2tpHKYYC3HjrFgft9
	HGqz0d8vEseI46ktfw88RrfZHG1KMmNwKg2qfmRKgGX/jiidKa/GN0bmh/JY9yoy
	SZEDbpGnKePYA6UjZsT7rY9sDtdmj2oaYssLzxMMrnircX5PU8/G8UxIsaZ/kzP+
	0s7BEolg2O5p6P0GpCC/MQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1750883214; x=1750969614; bh=iTuvUqK6UxntR0DvtXRfTwo23JZ9mVGUGcV
	stB8NmzM=; b=DJzkfrHzZKWIRWOTmLR7b+ii8dQb9x2sMqOTwzpnDUHR5D4oo4e
	db0SrKp8Gq71Mu3SQWprBnRO/twS2tqthOw1fyh4gipxyTdlXJCd6lp7QnlshAch
	o0fRnJsMSTwU+Hnk5yJJI2sO2O8vOJIcUDcN0NEOZLLk/cGL+kK0cPBgS1auC3Fn
	cWgzQEgHdc9mwPT/MMpzzT2sGTA4woukFgjgUztUAOoOiZoOswqUJ2FvdLK5QPEI
	0Wh/j/KVqsh/dP91ieyJMyLGEBb+HJFlm1XmcDyu0GVWdsYfNoXSWKRczsLaeeEl
	dD9+2aWHNQbBPH3MwKbeu8/1CInh82BuKRA==
X-ME-Sender: <xms:jVtcaEcu_USINsgUYzQBVBWk6gEPzpYTJRqEBk315cigBkFL_0zAkg>
    <xme:jVtcaGOayloOR--COB6knwQjZeb6dmUKlEzJkEo8i2TgzU6aMFN8uA4vtGNQPZLsm
    osJaHzUXWzBbw>
X-ME-Received: <xmr:jVtcaFgGndNZ4RNsX50yPEiVCKzvVQkZP1G99aFo4EQjpE3zBTl6Zsz2vwOIO0WgNZ5wGKrgPtW_rWwNrqazJ48w-XMmCM5WabQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvfeejfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeigeeukeev
    tedugfehgfeiveffleeiieeukefftdegjeekleegffduhfffhfejfeenucffohhmrghinh
    epghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehf
    rhgvughirghnohdriihighhlihhosegtlhhouhgurdgtohhmpdhrtghpthhtohepgigvnh
    dquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohep
    ughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtoh
    epjhgsvghulhhitghhsehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:jVtcaJ8vkpumMFxgdHM3wIOVg4chzuT7bNkL1b9Nl5mXxDJTHFc9YA>
    <xmx:jVtcaAvl3pi7XPO4yy77XVnK2r81Nvj4Xzc3lVwr1HTKd02dHJjNcg>
    <xmx:jVtcaAEEuomL_1s5Qq25HoulgMFTq5I3ZwxyUAY7pVFJoJRovK5cfA>
    <xmx:jVtcaPMrVsUnt3y1kE2fGd_7ijlxnkzHaVT0mbnRGpMnNJnR0WeAgg>
    <xmx:jltcaH6bLZYu61nFav9dh4kWxIhB462yotD9Siq25R9aPr95eKjFtCeb>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 25 Jun 2025 22:26:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with
 GRUB2
Message-ID: <aFxbi6dnKjydzyNk@mail-itl>
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <CACHz=Zj_YibxBOQytCQAmTAG=yyBXUx2s1Jr+fXqHgxHQmSDOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yTvFbj8bQLmgNqm8"
Content-Disposition: inline
In-Reply-To: <CACHz=Zj_YibxBOQytCQAmTAG=yyBXUx2s1Jr+fXqHgxHQmSDOQ@mail.gmail.com>


--yTvFbj8bQLmgNqm8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Jun 2025 22:26:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 0/2] xen/efi: Make boot more flexible, especially with
 GRUB2

On Tue, Jun 24, 2025 at 09:38:42AM +0100, Frediano Ziglio wrote:
> On Tue, Jun 24, 2025 at 9:32=E2=80=AFAM Frediano Ziglio
> <frediano.ziglio@cloud.com> wrote:
> >
> > The combination of GRUB2, EFI and UKI allows potentially more flexibili=
ty.
> > For instance is possible to load xen.efi from a no ESP partition leaving
> > a boot loader like GRUB2 taking care of the file loading.
> > This however requires some changes in Xen to be less restrictive.
> > Specifically for GRUB2 these changes allows the usage of "chainloader"
> > command with UKI and reading xen.efi from no ESP (so no DeviceHandle
> > set) and usage of "linux" and "initrd" commands to load separately
> > the kernel (embedding using UKI) and initrd (using LoadFile2 protocol).
>=20
> I was forgetting. If somebody wants to test "linux" and "initrd"
> command with these changes be aware that GRUB currently has a problem
> passing arguments, I posted a patch, see
> https://lists.gnu.org/archive/html/grub-devel/2025-06/msg00156.html.
> I also have a workaround for this issue in xen but it would be better
> to have a fix in GRUB.

Can you tell more how to test this, especially the second variant? When
trying to use GRUB linux or linuxefi commands on xen.efi, I get "invalid
magic number" error.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--yTvFbj8bQLmgNqm8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhcW4sACgkQ24/THMrX
1yx/qgf+NrB03zsRbIO28kwVEC9k2EYtzWY/GAFQFdx9oJg+ET/0ixGkdXhjAAHv
dltGNjslGRVtJoRV3HG0kUSNZcVzO9GhOkFc1K8eqhxQR+Qqg6jYQsWTrhdMa7x2
weBb46ezacUJ1xa/kwJU65Ccc9mqCdZ82wyKe9vrxp7R2tgVKT1CtRbkctYb6XNS
8zkysCxcnSGOsfoQFYY7NZf9QndKx91u2xvPRuT2Ckbf6uySyPt5Doptsrv8P9Sv
rG87QmSA+2Y/NVpRQxnmSmsPuUa4F7EkTGF495ZlJEmVvjwrh6G99BsBqUYdTSni
0gl1/2Oyi6opsJ0mgV2USMzp8HAPfw==
=lqBA
-----END PGP SIGNATURE-----

--yTvFbj8bQLmgNqm8--

