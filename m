Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A575EA1A4CF
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 14:24:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876250.1286631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taxBh-0003iS-W5; Thu, 23 Jan 2025 13:24:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876250.1286631; Thu, 23 Jan 2025 13:24:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taxBh-0003ha-Qs; Thu, 23 Jan 2025 13:24:01 +0000
Received: by outflank-mailman (input) for mailman id 876250;
 Thu, 23 Jan 2025 13:24:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AE9i=UP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1taxBh-0003hU-28
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 13:24:01 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ca45d23-d98d-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 14:23:58 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 9826F1380193;
 Thu, 23 Jan 2025 08:23:56 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Thu, 23 Jan 2025 08:23:56 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 08:23:54 -0500 (EST)
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
X-Inumbo-ID: 4ca45d23-d98d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737638636;
	 x=1737725036; bh=DgjgGv7jyTeHmwDzOc84QYkjkbvkYFUocoQoxVjSo6o=; b=
	K5QdPxKv7Endgvv6UxUni76NhpABqGfSRQff+EKuePeySA10KdeVNUYQFF+TCPbX
	72YjVr7wStFXW2iW5ozxZu347QaLzjE9BU6IBc5oyC1Yc76rXqJ082NrE8lGlC6J
	cYceEprbsPzLwHbHSK93nx8/0B9Xub6yeqw3Xjz1QO31gKVFg/8EgpMxEC/cfdFD
	PAVFdBXKoNLdfsmRDQUCfQ4Xl4xE4zbDbJyVZfvkvBRO/+wyjRh5dvA7YNIOhPAN
	JeYpWsQvPyKFtAtPfPlzE6DqB2iJa3Wug9d3And+AzINoiP/8f3mpmUtvFMIP8RB
	/MbIc9aTp2ATYtWyAh1Eog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1737638636; x=1737725036; bh=DgjgGv7jyTeHmwDzOc84QYkjkbvkYFUocoQ
	oxVjSo6o=; b=QuaTGKnP2JW0es9xmMC9VM4KWYHWqR9mGoR359jxVL59Z3t7LgC
	ukMUTfMVlnnJUQ62PfPGQhWBGCQ6RUgp0KKeF5ut0Fsz44TnX86dagnTdFv9LoNu
	NhVlv+zBI0LWLScSdDUKzojk0ZyepIcRIPDRrpu150V0VrcFysxS1Td7clBvot+n
	AFmqJ7Tsv6gonMbZpeVUw2Usy4gG/igLpV0ZOzZ9G+ATM567hqnrmP2jbenl5mSZ
	Qi/M5E+5KG9JD6SrWtsHbsrldsUIE0eNGg6RnnzXEz9cCy4/Ym6kTcNt7S1k5yz4
	tB8Zdn+B1JBsCULsRfGy2B+m5t803aW3SAg==
X-ME-Sender: <xms:60KSZ_odNENTJMa_u51_H2fzaQSp3brNAZ5SPh5SwEUSpTTt6WUGHA>
    <xme:60KSZ5p7jSbtOrWWuJsTmtBh5jxuwJCiklzu6_70ro4K0qW5ANwGkSZlTXBNh3ktF
    3PiYTOO9onE9g>
X-ME-Received: <xmr:60KSZ8NUovzoGXqFeP8cQ8DV39BXs07etsKqMFt-ZwifvA8iZnukvUgkd2grwzy-Mt_3a7tEu_HxCVCQLkv7rycfpoG31pCf4g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudejkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgs
    vghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlih
    hsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtgho
    ohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrd
    horhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtoheplh
    hukhgrshiisehhrgifrhihlhhkohdrphhlpdhrtghpthhtohepughpshhmihhthhesrghp
    vghrthhushhsohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepmhgrthgvuhhsiidrmh
    hofihkrgesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:7EKSZy617Ot1YxrZLeoAyiKeQHuCD7URHwHXJOckmZBEl9wr5Ze0oQ>
    <xmx:7EKSZ-48PEV4ns1pYZ-SD4t_C9R0UQKRHSr6mZ5WP5FMNin1_cRFmg>
    <xmx:7EKSZ6hhsqnnMjD2FHxqFiligYjNfnJFStWuHx62S_K_gQ-KGKEAhQ>
    <xmx:7EKSZw4WLq6zv-ACYrz-G4bei9kXG8PbR3ospW1vQmvfpXHu08MfxA>
    <xmx:7EKSZ7zmA3nV6bE1uzwH-mVUn3ZEYgy3_vP2zKfwm7H-cQO0UZzqcKQ4>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 23 Jan 2025 14:23:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [XEN RFC PATCH v5 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface
Message-ID: <Z5JC6ELVTWtvbqPU@mail-itl>
References: <cover.1737470269.git.teddy.astie@vates.tech>
 <Z5I59HC77QxpPtJG@mail-itl>
 <8e19c066-2d76-4f4d-9ccc-ed57e02143ab@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HzESkeORsoA+bDtT"
Content-Disposition: inline
In-Reply-To: <8e19c066-2d76-4f4d-9ccc-ed57e02143ab@suse.com>


--HzESkeORsoA+bDtT
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jan 2025 14:23:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: Re: [XEN RFC PATCH v5 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface

On Thu, Jan 23, 2025 at 01:48:29PM +0100, Jan Beulich wrote:
> On 23.01.2025 13:45, Marek Marczykowski-G=C3=B3recki wrote:
> > BTW Linux says it detected "Xen version 4.19." - shouldn't it report
> > 4.20 already at this point in release cycle?
>=20
> Not only at this point, but throughout the release cycle. Yet I fear I
> haven't seen such, so I wouldn't be able to look into it.

Ah, my bad, it seems Teddy's branch is based on 4.19, not staging.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--HzESkeORsoA+bDtT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmeSQugACgkQ24/THMrX
1yzMcgf+JHwlpghc/p0Ho9n3bWbYggDhPxoy0nDmFRPAFayT5S1xU4v1wo30cBgi
rNKLOlT43yb1xTukdAZnBqvFu4rXDG3kw4au4D3kXGXYtJrr2cBmRRTi/S+cc39Q
SDM3+QssS/dqu1+0N4olIf9E8Ig1YJmiTfZ4unoKLeLf9Ve6aMIUSjO76BVHGoL8
EtIxCLCnhPEuUy4AacYxmtKaw+XnqOcvQ5JFZutp0zyZR/vmsfrLe44eHPDCgihn
SjUBJIfuHyxTu2wYs9asFXYYEAAmlxKjgJqmsdVc6RiHI4FLwgCjVXlE4qiM3d8E
Znbh77PDx4bJSEqjbHbQe/5EXQe0bw==
=2TQ+
-----END PGP SIGNATURE-----

--HzESkeORsoA+bDtT--

