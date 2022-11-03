Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B161891C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Nov 2022 20:58:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437022.691345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqgKj-0001Td-Th; Thu, 03 Nov 2022 19:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437022.691345; Thu, 03 Nov 2022 19:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqgKj-0001Rj-Qf; Thu, 03 Nov 2022 19:57:01 +0000
Received: by outflank-mailman (input) for mailman id 437022;
 Thu, 03 Nov 2022 19:57:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=e0F9=3D=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oqgKi-0001Rd-La
 for xen-devel@lists.xenproject.org; Thu, 03 Nov 2022 19:57:01 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a9d5054b-5bb1-11ed-91b5-6bf2151ebd3b;
 Thu, 03 Nov 2022 20:56:57 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 0990E320030E;
 Thu,  3 Nov 2022 15:56:51 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 03 Nov 2022 15:56:52 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Nov 2022 15:56:49 -0400 (EDT)
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
X-Inumbo-ID: a9d5054b-5bb1-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1667505411; x=
	1667591811; bh=cbyVflLeIMmEFWy7x4clexNUFMuHe7NwhfURRALJF6w=; b=f
	IoPHM57F4SYkwI56VFufDQrtL+PmfvaGEU/67yRYEAfgMTVF8tlG7vXtQ3ItDLNh
	23PwM/+wEWFtPmjXSE97efc+nIVEkH11HzLyz0lHOx1vxQRf5IWNNLyN/ZcjlJwr
	RlaVi8YCyjSYVpqAhdB2RiBxcmobZykh2Ph+29cCGL7IO4koyBeh4k8+c5TdLdcB
	WZXo7Gt04QlR+HEPXzLHrQ6KTxZ4Twoykof1hMlDrhpbjutPORPfFJvnEWTI4kcZ
	+puVbx6XxLFitdvOjaQU03g0RwNinC3JxkCaOUd8JW+fein/oAqCsunuxs0ZxPwS
	R/7yAQ/rbTykjVBKpW4cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667505411; x=1667591811; bh=cbyVflLeIMmEFWy7x4clexNUFMuH
	e7NwhfURRALJF6w=; b=BMp0bf18rSjjc+udwSi2vU80xSOJIfjZOThDJvRWU8N+
	L0fDkYCkmRZQpuDF28M181ZFwsvpkLTQWP1AwwbLoPSoNt+Qx/bLonuo0Ry21AHm
	DakELIpmEnQ+xxbaD+L7AnakQw5JNCpnn5BA2Zg4lrg7EUvFFQ68pU+k1bWU2ZPm
	B+R7Df9MjCtJK1rBZpQdTg8myUHf8xLhok5ty9sGAPU5xZv9bB3GK9XxwtP70KXC
	fWXSpVj6RzkeA4BqbLiD4yYpndwyqeRc/KfNW3C8aEP8bNSQbttHgqDw1aTrrxZF
	nZ10w4nj9gIxGY6yhyEQDDWNVh3nI+QIzkkAUWKZTQ==
X-ME-Sender: <xms:Ax1kY1BU7RuNPy6EmWcV_lqq42nwftj6a1NtFA-mDXqdUqYhXQxQXg>
    <xme:Ax1kYzjign_yWsGT_ip5-fNubKO2dtJiuvZxw2OOtwtGbhgVOD7LoKDiglgIGTJUF
    5ialQhormxpjA>
X-ME-Received: <xmr:Ax1kYwn6-PScIbrsjLRaGfq4LabY8Zd2-SkWHYxVkEs89qhjnN9qUzNANFD5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrudelgdduvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:Ax1kY_z31ZGAWPOjgMRDucKAbtCYd3CvmpOQtRXT1UBivyHVX5CdDw>
    <xmx:Ax1kY6TCerXH5uLyt6GIiH7aZDt2RLZLI6X3LHRpHfNEx6Rc3hsoQw>
    <xmx:Ax1kYybUOrjl3F4QSzqDHI1-MVElh5-4aJ1gMWyjDWBzzVBKXhpaWw>
    <xmx:Ax1kY4dYf3L8kzlF6z7n9WlROMmhdgvQQLPS8aIl7AoCDMDKd0JvXw>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 3 Nov 2022 20:56:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory API
Message-ID: <Y2Qc/j8WYETDHjr8@mail-itl>
References: <cover.9762b1190a6fd8f0232c26cbace1b2c4f8555818.1664458360.git-series.marmarek@invisiblethingslab.com>
 <ecee2217151efd08b2bae58166efcdd319ec82c8.1664458360.git-series.marmarek@invisiblethingslab.com>
 <Y0s5Xvr5PBQq5pVB@mail-itl>
 <AS8PR08MB7991A2F3DE5A5B55ED3D09F492299@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <2214fd86-0cfa-58ef-39db-6f913a9de75e@suse.com>
 <2ee2c1f9-a6bf-7641-16fa-ce2ea90f377b@suse.com>
 <AS8PR08MB7991EAAF194842E14F28F62092389@AS8PR08MB7991.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BW1v4jERWnm7xIGu"
Content-Disposition: inline
In-Reply-To: <AS8PR08MB7991EAAF194842E14F28F62092389@AS8PR08MB7991.eurprd08.prod.outlook.com>


--BW1v4jERWnm7xIGu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 3 Nov 2022 20:56:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Jan Beulich <jbeulich@suse.com>, Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved memory API

On Thu, Nov 03, 2022 at 02:55:31AM +0000, Henry Wang wrote:
> Hi Jan,
>=20
> > -----Original Message-----
> > From: Jan Beulich <jbeulich@suse.com>
> > Subject: Re: [PATCH v8 1/2] IOMMU/VT-d: wire common device reserved
> > memory API
> >=20
> > >>>> Signed-off-by: Marek Marczykowski-G=C3=B3recki
> > >>> <marmarek@invisiblethingslab.com>
> > >>>> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> > >>>
> > >>> Henry, can this be included in 4.17? The AMD counterpart went in
> > >>> earlier, but due to late review on Intel part, this one didn't.
> > >>
> > >> Thanks for the information. I agree this is a valid reason, but to be
> > >> safe I would like to hear opinions from the x86 maintainers (added
> > >> in CC).
> > >>
> > >> Andrew/Jan/Roger: May I have your feedback about this? Thanks!
> > >
> > > Hmm, not sure what to say here. Yes, it would be nice for things to e=
nd
> > > up consistent across vendors. And yes, the change here is largely
> > > mechanical (afaics) and to code most of which shouldn't typically be =
in
> > > use on systems anyway, and so should not pose an undue risk. But still
> > > it is quite a bit of code churn ...
> >=20
> > Was this lost, did you decide against allowing this in, or were you hop=
ing
> > for further responses by others?
>=20
> Sorry for the confusion. Yeah I was hoping to see if we can have further
> responses from others, but it seems no responses so far...
>=20
> I have the exact same opinion as yours so I am also not sure. But if you
> changed your mind and would like to commit the patch for completeness
> of the original series, please feel free to add my release-ack. I would n=
ot
> block this patch.

FWIW, most of the diff is just extracting loop body into a function, the
only functional difference is a new called for this function, and moving
one of the checks (MAX_USER_RMRR_PAGES enforcement) outside of it. So,
my (biased) opinion is, it's rather low risk.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BW1v4jERWnm7xIGu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNkHP4ACgkQ24/THMrX
1yxMVwf+Ortf73eYGBgsWy3r7xRk2quPA58zbmX1nPrcg3kkhc9G9AJBGdHNNNiI
4RhHEAjyuiqHBwcg22hSH11sd/keWSIgyyHmVhXCkW8oGaN2u7DxqAAck8Ln0hK+
ePmwO8tf8V5xpiK2DtTkOx3xi1IMft6B5VXelDVMfeHb4Qqri/biHTAvIOVb8+33
xxb1+fGKshpElxrlUavFRQCCwAMzwwUdS+AyDLZufYyauk4S5KvSHl5gBdpEXFYF
RXF+T6sYSaeV/etOk9KqrogQMCcBFxjK2kFQcitYPD4w9hfzP4UCDTYhhmv89lbL
l/YfhjfaYwTimgY4D18Pp+0ThvwbGg==
=I9/e
-----END PGP SIGNATURE-----

--BW1v4jERWnm7xIGu--

