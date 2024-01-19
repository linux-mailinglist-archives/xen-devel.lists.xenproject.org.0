Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5F3832AA5
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jan 2024 14:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669049.1041631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQp6d-0001M7-K4; Fri, 19 Jan 2024 13:40:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669049.1041631; Fri, 19 Jan 2024 13:40:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rQp6d-0001JP-Gl; Fri, 19 Jan 2024 13:40:23 +0000
Received: by outflank-mailman (input) for mailman id 669049;
 Fri, 19 Jan 2024 13:40:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TJ2q=I5=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rQp6b-0001JH-VN
 for xen-devel@lists.xenproject.org; Fri, 19 Jan 2024 13:40:22 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47f43681-b6d0-11ee-9b0f-b553b5be7939;
 Fri, 19 Jan 2024 14:40:18 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6B4CE3200ADB;
 Fri, 19 Jan 2024 08:40:15 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 19 Jan 2024 08:40:15 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 19 Jan 2024 08:40:13 -0500 (EST)
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
X-Inumbo-ID: 47f43681-b6d0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1705671614;
	 x=1705758014; bh=bKRJytPaVVHYQd0BqnQ8SWnr+G8qm+sktgYsg/SsISc=; b=
	L9myp6wPsFtgA67yt9QrwoEsSG7aJ4RFIXsCpPN3GZ6eouZDjAdFZQTOQje7l4+k
	tijKoNsq39rRAk3acfMdsQp9B4UdxxnkS81sNTgtDB7W6hp4L2ENuTcirGvyr8fu
	wMywREfv7GSyiJX5LOyKtc65uRn+acuobrxxkSgMI47s/lej075pwzbC624Mpn13
	WYRjQCyDEj8SvMWB9hYAHSTNqx9oaQQFYZCAWAUHcdiP+OBVjmZYg8mb52QM0HNX
	7GYI9Iv445hSmee5lMRrAG+nKAxLFEe0F2Ru3ZDL2O0TL+qNuKKXeyPzcFfGJhzu
	7uvdGGW+gYHemFjCQpDJ6w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1705671614; x=1705758014; bh=bKRJytPaVVHYQd0BqnQ8SWnr+G8q
	m+sktgYsg/SsISc=; b=JQEdRDy/wLrEQjNGMe/Kyis7jMiPmlKTALlF/PIHz6YH
	DVBPbuh9vj8FcdYrG2V0jlSYZC8UrPEEfqUFLa9eTJFxdFWBO/mY4jQxpSWWF2eN
	+y2vaB/YWeNrZRZDkjLblsMe3msXHaSqxwZrIdqGxQWbId/rZ0fYOBT+ecLPmYiY
	os9QGqSB1CCURhVwW6UPb6P6fBD4zqt0G5y05WjvT9vsqgI/xcTq0rR+VcE1ixZz
	ypFYk7yHIiU15oq+eZep1ALlI5vEfV5WRnPoFuTcDPR0uQIkrM3xTwne46MBlT6P
	XS4gakUskhItiBun49wJRc1F3hwMDnjrj6LiTo/6VA==
X-ME-Sender: <xms:vnuqZX3zQpjlf90DDa-hsO4o-sZfT-Bzsff6J_b4Q3Kkc7xuDf-_-w>
    <xme:vnuqZWEWdiDUJlZbFj3j30-RndBoFiYrxfqso3WrflEgSzhQu6eboV78qV_XfkitR
    tLFKJhH0dxTpg>
X-ME-Received: <xmr:vnuqZX4FL6H3N__K_xiCe1rD9gwUNTvq29_eI5log4WOTuhaI24l0ML8Zx3KwNjriJ89zNdTbZeYXtQcvTlOIps1CQGVRkzl2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdektddgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:vnuqZc32_3h_xzaUZ6O9K_7vjNK8Df1UbpgA-orgnYdzpLHmLxATCA>
    <xmx:vnuqZaEH-APuY53zdd5p6827XnxyuYjznHWHg63UeD5VPltU3NQm0g>
    <xmx:vnuqZd-ByK6I8pogvHwVngT623zcDxGtCbaboKBZc3RDjJ1MzLnoSQ>
    <xmx:vnuqZfQHxmX7YrEAIULPnAwqPtC9c6dnI-Kjlg6znDcqgMqqbSVW7A>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 19 Jan 2024 14:40:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: E820 memory allocation issue on Threadripper platforms
Message-ID: <Zap7uX3k0kfoMOoF@mail-itl>
References: <CAOCpoWdOH=xGxiQSC1c5Ueb1THxAjH4WiZbCZq-QT+d_KAk3SA@mail.gmail.com>
 <1708c3d7-662a-44bc-b9b3-4ab9f8642d7b@suse.com>
 <dcaf9d8d-ad5a-4714-936b-79ed0e587f9d@suse.com>
 <CAOCpoWeowZPuQTeBp9nu8p8CDtE=u++wN_UqRoABZtB57D50Qw@mail.gmail.com>
 <ac742d12-ec91-4215-bb42-82a145924b4f@suse.com>
 <CAOCpoWfQmkhN3hms1xuotSUZzVzR99i9cNGGU2r=yD5PjysMiQ@mail.gmail.com>
 <fa23a590-5869-4e11-8998-1d03742c5919@suse.com>
 <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PNmSiVhT5vUfc3R7"
Content-Disposition: inline
In-Reply-To: <CAOCpoWf4CMkCWx8uR2NbFrZrKSS78wj1-hFsAUqsjCfsmqooVA@mail.gmail.com>


--PNmSiVhT5vUfc3R7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Jan 2024 14:40:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Patrick Plenefisch <simonpatp@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: Re: E820 memory allocation issue on Threadripper platforms

On Thu, Jan 18, 2024 at 01:23:56AM -0500, Patrick Plenefisch wrote:
> On Wed, Jan 17, 2024 at 3:46=E2=80=AFAM Jan Beulich <jbeulich@suse.com> w=
rote:
> > On 17.01.2024 07:12, Patrick Plenefisch wrote:
> > > As someone who hasn't built a kernel in over a decade, should I figure
> > out
> > > how to do a kernel build with CONFIG_PHYSICAL_START=3D0x2000000 and r=
eport
> > > back?
> >
> > That was largely a suggestion to perhaps allow you to gain some
> > workable setup. It would be of interest to us largely for completeness.
> >
>=20
> Typo aside, setting the boot to 2MiB works! It works better for PV

Are there any downsides of running kernel with
CONFIG_PHYSICAL_START=3D0x200000? I can confirm it fixes the issue on
another affected system, and if there aren't any practical downsides,
I'm tempted to change it the default kernel in Qubes OS.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--PNmSiVhT5vUfc3R7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmWqe7kACgkQ24/THMrX
1yxXwgf9FLeYuLDgT9jy6Me0tB/M2egM1T6lUv7HgLq87Al0Q8hshcL1VnGyWDmF
phHifLuvxLEPk8F6A1ir0fNW63Qxryx3cu0KNcMOlrAg32jJl+JbB0qzKsZWLfUE
N85fDlEccDHZX4aArGe39Qn65ipu9aG6+SCird1OKSec5Aae230joMxUp8JgR/PB
/G1vcf/ujnZLCtuvD6xJWloPnT9s6XbyT6CheDZnNj7Yg9NjvK60e+Pncs9XeaHD
TkqIlrzOrbqAc1cCYkmekkGWAOfN59Xcuiiic7AehTUngBgAZWEU/u78RDiQYNMD
/BljlE7vUkDwIwiUGpb5xK/3TLuFrw==
=t1m9
-----END PGP SIGNATURE-----

--PNmSiVhT5vUfc3R7--

