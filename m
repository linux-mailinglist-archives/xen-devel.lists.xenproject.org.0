Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2531629794
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 12:38:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443870.698640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouuH6-0001OS-75; Tue, 15 Nov 2022 11:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443870.698640; Tue, 15 Nov 2022 11:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouuH6-0001Kw-3h; Tue, 15 Nov 2022 11:38:44 +0000
Received: by outflank-mailman (input) for mailman id 443870;
 Tue, 15 Nov 2022 11:38:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vqu=3P=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ouuH5-0001Kn-AQ
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 11:38:43 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0de5eb8a-64da-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 12:38:42 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 822635C0120;
 Tue, 15 Nov 2022 06:38:41 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 15 Nov 2022 06:38:41 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 15 Nov 2022 06:38:40 -0500 (EST)
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
X-Inumbo-ID: 0de5eb8a-64da-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1668512321; x=
	1668598721; bh=Jxo4IkBy5DIaegqe/RAVUhtnEdJPJXh23XEzegecNQs=; b=l
	5QT+DF59k9EAsNiskPsQEF486fgMzxSC7HHmyllCU+VhwfxJ/VRLHQJ3BH+7LST/
	vXmJ0R5moNCc4PCUBkSgDDcFARE08NuzmCOrbp0ljqhPi7JmQwUmvC+DYS3eNicN
	NvQOadz2LdwfmhJ+D/qJphr3OH1kXcUUJk+/ns5qzECsSJr16cKmrvaAL4uagabH
	uekJSpO5Pfebox/y9XLK6mz3aDwl7N/zNHBlukthb2IF8JViNsQXifemNPv5Livu
	feagrwn2L3Y7aEaXeHMft1gFfUOEGLo10Ww0QAlz4DCtJJ2hqNSNRYczvVhMp4x9
	84m0duEcVOoBKVy2XY9wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1668512321; x=1668598721; bh=Jxo4IkBy5DIaegqe/RAVUhtnEdJP
	JXh23XEzegecNQs=; b=sl/OykJkqXee2YpcNCgxo6NH1+bjCJIbqkW6Jj57hB1C
	6QMPRsJ3psw+zXdCdFn3x/Tx4ox+Ew6A8hAbPpjNNrgV0AOoPZ22Q5arj3f8jQ9U
	+VZi27xpgEFFt4LZAtk8YYH0sLzjqT+jY0PrAfW8Odl6W6sIXOaxmh/3OUsHf2vW
	jiStlqkEg1c8ZOR9vXJxfobqGFZPvUbeY6OP+MRmnImTTa7uInvqqTMwnI048xkc
	DqVgFyMp66asHbFlo0jDP9Q+EZgPuZeQyi32YKq3P2YW8wdbkIk7+giGguy+a6fL
	yhUwyPrOrCA9mtx7dOGAbulgrXdpZd+1h2NXh+DW1Q==
X-ME-Sender: <xms:QXpzY_EGxQF0AhqQZ-M5akQbCVQOWMLmpeV9hD1MHs6pZCjBbfijSg>
    <xme:QXpzY8WWQnElLB0GEgAfnATjPmnbFbx_k9cKWOfEaLMfdolJpAqB7DeriKBnDpzp1
    I_9wwjtqKe1rw>
X-ME-Received: <xmr:QXpzYxKIy9dDoRFCXIhMsjwTVjuUMIs7eepO28AdlUIJin14AKXNv5DnqAfbnJfWagg-akiyUmUPahB0EdtEuYxDXxtBm-piAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeeggdefudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:QXpzY9GHZA8PsOe_rspROjh9iFyLtp2lGUY_izfCfST9ckhE2Wq9nQ>
    <xmx:QXpzY1Vew46dJ-_0UiACnJU_PMxRacU-aznWtNHT9weVgPPHCaMdyA>
    <xmx:QXpzY4MkMn12Ogvay_NhlJ76z-e7bRz68vNL_H9vj1Mba9_BvqyhMQ>
    <xmx:QXpzY4R3u9GMz-GvUaAlJ_fiY8J6LIG2gAYbCgNHHKJILSgDAfawgQ>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 15 Nov 2022 12:38:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
	qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen
Message-ID: <Y3N6PZN0AnldeQdQ@mail-itl>
References: <20221114192011.1539233-1-marmarek@invisiblethingslab.com>
 <20221114192011.1539233-2-marmarek@invisiblethingslab.com>
 <dc3472e9-d73e-9540-deb2-b47a527000a2@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fP+2vUV7w+NDnUJ4"
Content-Disposition: inline
In-Reply-To: <dc3472e9-d73e-9540-deb2-b47a527000a2@suse.com>


--fP+2vUV7w+NDnUJ4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Nov 2022 12:38:37 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	"open list:X86 Xen CPUs" <xen-devel@lists.xenproject.org>,
	qemu-devel@nongnu.org
Subject: Re: [PATCH 2/2] Do not access /dev/mem in MSI-X PCI passthrough on
 Xen

On Tue, Nov 15, 2022 at 09:14:07AM +0100, Jan Beulich wrote:
> On 14.11.2022 20:20, Marek Marczykowski-G=C3=B3recki wrote:
> > The /dev/mem is used for two purposes:
> >  - reading PCI_MSIX_ENTRY_CTRL_MASKBIT
> >  - reading Pending Bit Array (PBA)
> >=20
> > The first one was originally done because when Xen did not send all
> > vector ctrl writes to the device model, so QEMU might have outdated old
> > register value. This has been changed in Xen, so QEMU can now use its
> > cached value of the register instead.
> >=20
> > The Pending Bit Array (PBA) handling is for the case where it lives on
> > the same page as the MSI-X table itself. Xen has been extended to handle
> > this case too (as well as other registers that may live on those pages),
> > so QEMU handling is not necessary anymore.
>=20
> Don't you need to check for new enough Xen for both aspects?

Yes, see my response to Andrew in the thread. I'm open for suggestions
what to check specifically (Xen version directly?).=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fP+2vUV7w+NDnUJ4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNzej0ACgkQ24/THMrX
1ywIwQf/UFUun8P7OUjaX2Ec/IHmNYzkkRwq3iQjfLPLZBwaFQQptqOqE4wf6XLq
YaBlINhTIW4WnYziauBQnANTna4e2guNyungBS+ELjXqziZJ0vY/yMtg0/Z0Ajy0
cGg9Rt6swEvK8GBqAo21juYlZcOgtq7LvisGWh2mRb6+xnT1m6Iiq9UurGomHIwk
m8F5Q5dqV7gu3zS4C3AxaqHdttR1YcNmnpa5GrZYWt2MVpJ6LRChAKXRUXhlsqGP
180DHGlF5vVobPqMIOL9SBewp1X+kK0Qy9fN06hG+CAGvreZjBIVLMr7XmoGUQhG
mZ1tumxTGC3+T/b4l3C814kUOSnA/w==
=UW15
-----END PGP SIGNATURE-----

--fP+2vUV7w+NDnUJ4--

