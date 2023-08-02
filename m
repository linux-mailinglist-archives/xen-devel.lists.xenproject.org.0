Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A27276C157
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 02:06:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574602.900023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzMn-0001Is-7T; Wed, 02 Aug 2023 00:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574602.900023; Wed, 02 Aug 2023 00:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzMn-0001Fj-4e; Wed, 02 Aug 2023 00:05:29 +0000
Received: by outflank-mailman (input) for mailman id 574602;
 Wed, 02 Aug 2023 00:05:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xkiE=DT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qQzMl-0001Fc-CE
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 00:05:27 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46ba67e0-30c8-11ee-b25c-6b7b168915f2;
 Wed, 02 Aug 2023 02:05:25 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id E60415C01A1;
 Tue,  1 Aug 2023 20:05:22 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 01 Aug 2023 20:05:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Aug 2023 20:05:21 -0400 (EDT)
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
X-Inumbo-ID: 46ba67e0-30c8-11ee-b25c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1690934722; x=1691021122; bh=8WhJYcgNJo9vOQ4evmBwmKMCj1RPcplmZPN
	dqAmCGbA=; b=rWeCAnaHP0g+ajeAOTMXYz8UMeMBmxdmVtiVHopEaJlJLCoLn+m
	SEn6QQAfooD5KXe6+nl7kveQdsqG123O2LlzUNi25QyaK9A1QUBrj0+zTirpGf90
	fAFfVvdBRN8TQc726N0/hMmjNsHuqtkzEjC7r3XQvmFPv4CtJYsTDuMBaYgBo0Jg
	iYzGUWMP8Okm2RFxHUo3OOcazeuDdBqIqIjUsc3fcITU027QPgDSDD5KrP7/uJi7
	nd/GP79I4SZJh2J87Gli9f3WTFrpFu7x1NMuo7VH8y4IFGD54mSXaR8h0Ze8Et6F
	cKq1LVrzys9BJXQexCNre7yzhj0w2j4q1xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1690934722; x=1691021122; bh=8WhJYcgNJo9vO
	Q4evmBwmKMCj1RPcplmZPNdqAmCGbA=; b=cMaJEJmSX28+T/QKK4/OwvCzykGzG
	2u4kd8MUF02ue71pT2Y2i4Xxd1VP+jsIW9pK+uGMXd9jV/1ushTaWgANcaR7ER0f
	iCkCd3GUhhswZXPK5utlM4/qOKa+VggAdxRNYlwNqsRgmAkkpbCSl8CosvY/0OpU
	PXY+bej3OKPBisjmIPRTereYmF3pC3qTmuKplxxCT5EYcNoO3UcVkW0tUPDb8tOh
	HKZnr1nwciQOIDVRxnLmWvaJ7RvIrtJTYqV2wFLCqaIS2IVSdaMInKP3+yk4SUoP
	zXz9fRAy1xJlYMKCSGt8XDoukCWwI72zWapSzZWWhjGgm/ximBjvgdUKQ==
X-ME-Sender: <xms:wp3JZDCIGVvVgHEkilK-kGGXaV3iK_-j6hw-C1exeqhLtdfBO5VaZQ>
    <xme:wp3JZJg4cC5ijDOUCpnOnZETtOs4IBAfzAUT7U_OmLsvlGfqU67wQWFu8YWs8e44O
    qrlCRfmT7wAwg>
X-ME-Received: <xmr:wp3JZOkAIYwXWK3Nx_tSwcSh3EuvGyveAg0If6WxcV3sqINFKTpvXsw5vyAe-XJeLkAZRjEVBWITRNGDE64S8jUdqeu3zqQs1jI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrjeejgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevueej
    teegleelteduueevhfetgfffjeevtddvgfeiveehteehleegueelvdejveenucffohhmrg
    hinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:wp3JZFwljnry1BYClnxP6Ie-FiNuqi7lMtJ79G6dEyR5d1B2vhFTNw>
    <xmx:wp3JZIRUKlmnwjXk5AkHJ1BLZ6e_Ix2vVmWLYMQj6UlhYjUBFvimcg>
    <xmx:wp3JZIYwi-E3ZMcvxQUe-EaZm9j6oOfLNKz92_wfaJW-zIVAWAlvBQ>
    <xmx:wp3JZDfu0bifyAKXCZpOKO8gCBEcPBqkr2yUdPxlM_twOn6tHAMJfA>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 2 Aug 2023 02:05:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>,
	xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 3/4] automation/eclair: add scheduled pipelines
Message-ID: <ZMmdvllVvfDz3T92@mail-itl>
References: <cover.1690881495.git.simone.ballarin@bugseng.com>
 <76f3cdddcba485e8124659566b2f992b3b14da17.1690881495.git.simone.ballarin@bugseng.com>
 <alpine.DEB.2.22.394.2308011545350.2127516@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+YnZtu0Gyqk33/ME"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2308011545350.2127516@ubuntu-linux-20-04-desktop>


--+YnZtu0Gyqk33/ME
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 2 Aug 2023 02:05:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Simone Ballarin <simone.ballarin@bugseng.com>,
	xen-devel@lists.xenproject.org, consulting@bugseng.com,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [XEN PATCH 3/4] automation/eclair: add scheduled pipelines

On Tue, Aug 01, 2023 at 03:55:20PM -0700, Stefano Stabellini wrote:
> On Tue, 1 Aug 2023, Simone Ballarin wrote:
> > This patch introduces six new ECLAIR jobs that run only
> > when triggered by a GitLab scheduled pipeline.
> >=20
> > Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
> > ---
> > +.eclair-analysis:on-schedule:
> > +  extends: .eclair-analysis
> > +  rules:
> > +    - if: $CI_PIPELINE_SOURCE =3D=3D "schedule"
>=20
> If I understand this right, the idea is that someone would schedule a
> pipeline (Build -> "Pipeline Schedules") and as part of that, they would
> also define the variable "CI_PIPELINE_SOURCE" to schedule.

No, this is pre-defined variable in gitlab:
https://docs.gitlab.com/ee/ci/variables/predefined_variables.html

>=20
> Is that correct?
>=20
> If so, please add a good in-code comments here on top of
> .eclair-analysis:on-schedule to explain it. So that someone reading this
> might know how what to do with the Gitlab CI settings.
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--+YnZtu0Gyqk33/ME
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmTJnb4ACgkQ24/THMrX
1yz9rgf+M38/Y0SWqKAwhTVqJNOx6NknckOsDs5c2DtB5GMozpVPF+15a8FA/ZO0
MWz8BF9c/KUfhIxPY9PvDkkRNM/q+xslNUUrR1K2eEfoUvgMLyHQ4cC6YPIb7RHb
v1DKUIOqmKnzGMFAKUAmlZY0l+cmx6AVN4iJ3otAVvYOC2ZDPdP5kCW17H4PUpEK
qJg44jeb6RVVrUaBLCBMLlBCVRoMVImhDP8RcfiUUmXg83c6h7g3lvhsUCRcDrSw
GP+Dk6qAl4UilnJ14F2ysepNv9gE9I+GZ7MdjGuGT2YUMFBLyPQM0QrLjYo50ICC
kZLSs1Tn6jxLy3BErX4/X5TjccaOog==
=CZVL
-----END PGP SIGNATURE-----

--+YnZtu0Gyqk33/ME--

