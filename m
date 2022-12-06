Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5CE644AEB
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 19:12:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455438.712906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cQU-0004x5-2p; Tue, 06 Dec 2022 18:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455438.712906; Tue, 06 Dec 2022 18:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cQT-0004vG-Vy; Tue, 06 Dec 2022 18:12:17 +0000
Received: by outflank-mailman (input) for mailman id 455438;
 Tue, 06 Dec 2022 18:12:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhi9=4E=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1p2cQS-0004v9-5y
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 18:12:16 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8277f950-7591-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 19:12:15 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id C64B632008C3;
 Tue,  6 Dec 2022 13:12:11 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 06 Dec 2022 13:12:12 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Dec 2022 13:12:09 -0500 (EST)
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
X-Inumbo-ID: 8277f950-7591-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670350331; x=
	1670436731; bh=IqyEmswc1g3rzfC3h2fIpwFqo4emiUgxmfSKyN57Bmo=; b=h
	MEOSh6cVGCXo2/A3vAUVs3FyZbzyRZYtj2QT9XNjehXc0yE/3rEpDbX80qu72IOi
	WKumOld6iDYBsEV+ZiKKhvY0usvrzjXeSvvvtpnZ4uTNy/r85qDc1ALc9Hu5g8ol
	hK3Z+r6vcyhEnBAHOiy72FexyT7xyc02ureF/avuPIsNcMpa7jC1mVJuV4DplwfW
	5cI733vJ7CKVkGBjVra/25bES+/Std1PpJaZxhlHrn8Ve8YCrjixU29jlKl4a3MI
	P7FJNv/0L5sBubcEnS8YN86jIe8G9bzgvYDQ6KSCvd1qbALI/GM23I2TDBO79Nq1
	NkIoF0ANoNbCX2la2VkAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670350331; x=1670436731; bh=IqyEmswc1g3rzfC3h2fIpwFqo4em
	iUgxmfSKyN57Bmo=; b=qP1ZdpyNWmLvk551LewC9g5FcbS40Ded0BtXmVIEgB3p
	FSKVfTGvKRF9fzGLSaUwYy0wQSV8U549vl/CTemu2Hoy7vWVlnGXLiDU0+u4gxmB
	nNKQFdOKr5HxQmSsT/hNwq1Vf5Kdk8/TtCfXzUeS6sXyjd2WkswN7pvsyzxfvxGi
	ndgOwnRJhjN8BBJ7/GCkap94hBvgl64u7VhMgv1mwzBAt5RWb8ykgfkHEmcjsQI6
	heRHxyCki2hYSMTYzk99do+gE/NivsoXL6iQ7nT5RZHB2Q2Kq9p+F2GxAgfENbnT
	4Agg9x85875VonXaDLL91DFPWAm0BpFT3uxGOhrZKw==
X-ME-Sender: <xms:-4WPY4gQBqrajtE8WHWHJszTn_FDDEzU1mO41fGP4YuviJ11U_LpRA>
    <xme:-4WPYxBWxUwABWf6BMZmuIGWKSIWyd3527J79O5Lhl1e0mQJlVIjYiI0Mcfy1MPQs
    edJqIFbg1Q8rg>
X-ME-Received: <xmr:-4WPYwFdeCl4CrouzTwJlhQydzW4naclv30l9EY4NYJG4x-a96uq1hjmRM0HMjoVtU7T3mINQ7GsdHewDWC7JURnVkjSz_I3aw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeigddutdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:-4WPY5TrnasQiNduovKYuAycJJd43Fyq-N8ymHeVIB8FNuq2Y4zl9w>
    <xmx:-4WPY1wKmLRFSj8LOHLNMNuanDocfIVD8sNWZv2U0ON8y0X3pCpABg>
    <xmx:-4WPY36twVP7Yr1fFG5-6Vq6n8vRaQkgM3Ov4hsp51EDtYoL6Z6_OQ>
    <xmx:-4WPY8mnuGBxH-x-2hFiQ5F1xOL7F-eF9tiVrqbmTEuBFNeVEVs-7Q>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 6 Dec 2022 19:12:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 8/8] Use Linux's PAT
Message-ID: <Y4+F9iujzOmoOAVe@mail-itl>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <9f0bd911ba6c7fe1b7285f232154d42807145ced.1670300446.git.demi@invisiblethingslab.com>
 <4b2a87e1-89d1-b5fb-bd92-b891c8cea98a@citrix.com>
 <Y4+Die8lcZUwwGmK@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rYRF28xWz3K770gH"
Content-Disposition: inline
In-Reply-To: <Y4+Die8lcZUwwGmK@itl-email>


--rYRF28xWz3K770gH
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Dec 2022 19:12:06 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 8/8] Use Linux's PAT

On Tue, Dec 06, 2022 at 01:01:41PM -0500, Demi Marie Obenour wrote:
> On Tue, Dec 06, 2022 at 11:38:03AM +0000, Andrew Cooper wrote:
> > On 06/12/2022 04:33, Demi Marie Obenour wrote:
> > > This is purely for testing, to see if it works around a bug in i915. =
 It
> > > is not intended to be merged.
> > >
> > > NOT-signed-off-by: DO NOT MERGE
> >=20
> > Following up on Marek's report on IRC/Matrix, you're saying that this
> > change does actually fix screen corruption issues on AlderLake, and
> > something on TigerLake too?
>=20
> Correct
>=20
> > If that is actually the case, then one of two things is happening.=C2=
=A0 Either,
> >=20
> > 1) Drivers in Linux are bypassing the regular caching APIs, or
>=20
> This would not surprise me at all.
>=20
> > 2) The translation logic between Linux's idea of cacheability and Xen's
> > PAT values is buggy.
>=20
> How could I check for this?

See Andy's unit test idea on #xendevel:

    as a pretty simple "unit" test in dom0, it might be a good idea to
    have a module which watches the PTE in question, and cycles through
    various of the memremap_*() APIs and checks the raw PTE that gets
    written after Linux and Xen are done fighting with it

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--rYRF28xWz3K770gH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOPhfcACgkQ24/THMrX
1ywR9gf/VnJy5XbHiFGOloFmTa5fTOhJ6O/hLcfubRva3WtUKtovyZmFRV0aAKkJ
TUvFnFhLoidxDOjQ+eqCJvWjJSCOuZ7VRAvj1TJq3uWNA6d2xZSZcDB0Ptj69vr7
7vpHkOojQlGkEnqKnBqsWYaRX6+xe7YVkzkOaUJdZYnDd5JSiHdKW0rXOIMWuQW0
BtlfiMJ8wpywhoC1Uk3w87Fg/HvHa3xaxDLr0j3lW7YGqfRo0i+IFYd9dwvHCOtb
dnZEZBbR4ELdQ8WzrICuzjdpQlBeOu/ffNHEEsKRGg+fofFGJlNXdgUrnY51/Djx
YiF8BJajnyRmvlArvCJD1qUgImAXnw==
=FiSR
-----END PGP SIGNATURE-----

--rYRF28xWz3K770gH--

