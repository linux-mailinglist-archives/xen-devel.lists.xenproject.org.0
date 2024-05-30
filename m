Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC1448D4258
	for <lists+xen-devel@lfdr.de>; Thu, 30 May 2024 02:27:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732425.1138429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCTcD-0005cv-Rs; Thu, 30 May 2024 00:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732425.1138429; Thu, 30 May 2024 00:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCTcD-0005Zs-P2; Thu, 30 May 2024 00:25:57 +0000
Received: by outflank-mailman (input) for mailman id 732425;
 Thu, 30 May 2024 00:25:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KshN=NB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sCTcB-0005Zk-BB
 for xen-devel@lists.xenproject.org; Thu, 30 May 2024 00:25:55 +0000
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a75ca94-1e1b-11ef-b4bb-af5377834399;
 Thu, 30 May 2024 02:25:51 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.west.internal (Postfix) with ESMTP id 057D51800134;
 Wed, 29 May 2024 20:25:47 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 29 May 2024 20:25:48 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 May 2024 20:25:45 -0400 (EDT)
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
X-Inumbo-ID: 2a75ca94-1e1b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1717028747;
	 x=1717115147; bh=08citzDiN2uS6821pFoEZp+AjfcQSFyt3aPtXMU2tXw=; b=
	qefYF7RX/Ms780axJo1mDqebme6G2o8Z0mCrp2+2ZGYzqaCme939fMdaFQiHl+RT
	I3o9WJA+ZY8EqU8frsfll6wW7RrO96Xx6A2IKftXsxb9UpVtI0QmIAj9cwi3Y61e
	NiNN1VsY7H41qDQF9uouRmv4oDSD/ik92iyu5iBiOlMQLsm+cRN14pQvEu8b9J/V
	L8ouzZBvA/RIsB20wYasI3bp0miyw45T6D0X5wtCijp29hKMguGYWbkzYDd3sBNa
	35qUW5oa9r6ubGdEyVzrKP8ybKE4gWvpc4hzC31V0vxaKo0oECSm/CeRfnhapJP/
	sZSZzVAmTPFr1bFhP3YUSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717028747; x=1717115147; bh=08citzDiN2uS6821pFoEZp+AjfcQ
	SFyt3aPtXMU2tXw=; b=PeskwC0Ir1aqrpRDkZJNLZh6gb/zbmSL3tvGRnk6k8qN
	0S/5DYB/Jw5+cTmUteIbNMNsjjAE54G57Z7eGYMfLg2tYa94l7qS81d8Qc4QuoYN
	uB7lCXzcuWfBlbOKC9PUpw3w53D5o5aQ+76uXAtLFnKlbdG8a3jFk7q5aAtELbp1
	RUgAxZ/O1QW78fBRVnnjwo5U4ML+U6Hd14ij8twkEhO5BzNCu7zwXR0HfWbXiQfZ
	I9nISROI7DPXjoc4Wq3c3S4T07IYQl9bYc1jisUfMx0VV/IobsUR+QRS1LAl5yX1
	rfX3o/4gjSUlRrC8qetBhgYRCibAeSyziNYuYvLGHw==
X-ME-Sender: <xms:i8dXZhwK7BO3NVupsqVWMtWwxyWz9ovOS0eaVu84PTxXyyFV3enMEQ>
    <xme:i8dXZhSSW26LVQeOYNMoTUJ4cAVSX4o4KYgAqn59j4gXqF0fXCwXSLHlvjI5JYlFW
    q4OGfZ-CtWUQQ>
X-ME-Received: <xmr:i8dXZrWCCzxXFE7WR-i22HbJB1swEFgXl7qfk9CAwPbI0DPhaBCM71lwEFc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekvddgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:i8dXZjixFKKx8qooXas9d9oUE7UGW0YQWo2m5szSCz_dJgowqvo9vw>
    <xmx:i8dXZjCJ68Ud51I7q5xNnZd5dHX0icpDUOrpAyPCOhi4LlEmRdygYg>
    <xmx:i8dXZsIlsXudyJwzvmWl8JPOVRy3bpweNXzg6YK3kiXs_PWkPV8dEg>
    <xmx:i8dXZiDxzk8rT0heeiwjcxThyaMffbwXRsUi5psUNFcKdkzyyg6llw>
    <xmx:i8dXZu7cytMgdmflU3fhnip21oSqJUmD7mlaCI5S4j9Y52Sf86XDnl9c>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 30 May 2024 02:25:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/3] CI: Remove CI_COMMIT_REF_PROTECTED requirement for
 HW jobs
Message-ID: <ZlfHh_blx1i0eE7O@mail-itl>
References: <20240529141945.41669-1-andrew.cooper3@citrix.com>
 <20240529141945.41669-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2bIh9cXtMpJeLTbF"
Content-Disposition: inline
In-Reply-To: <20240529141945.41669-2-andrew.cooper3@citrix.com>


--2bIh9cXtMpJeLTbF
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 May 2024 02:25:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/3] CI: Remove CI_COMMIT_REF_PROTECTED requirement for
 HW jobs

On Wed, May 29, 2024 at 03:19:43PM +0100, Andrew Cooper wrote:
> This restriction doesn't provide any security because anyone with suitable
> permissions on the HW runners can bypass it with this local patch.
>=20
> Requiring branches to be protected hampers usability of transient testing
> branches (specifically, can't delete branches except via the Gitlab UI).
>
> Drop the requirement.
>=20
> Fixes: 746774cd1786 ("automation: introduce a dom0less test run on Xilinx=
 hardware")
> Fixes: 0ab316e7e15f ("automation: add a smoke and suspend test on an Alde=
r Lake system")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Runners used to be set to run only on protected branches. I think it
isn't the case anymore from what I see, but it needs checking (I don't
see specific settings in all the projects). If it were still the case,
removing variable check would result in jobs forever pending.

Other than that, I'm okay with this change, since the hw runners are
added only to select projects. You can interpret this as Acked-by, if
you verify if indeed runners are not limited to protected branches only.

I will need to adjust setting of my project, to set "QUBES_JOBS" only
to some branches - I used to use branch protection rules as a proxy to
selecting on which branch to run hw tests...

> ---
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>=20
> Fixes because this wants backporting, but it also needs acks from both Ma=
rek
> and Stefano as the owners of the hardware in question.
> ---
>  automation/gitlab-ci/test.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
> index ad249fa0a5d9..efd3ad46f08e 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -92,7 +92,7 @@
>      when: always
>    only:
>      variables:
> -      - $XILINX_JOBS =3D=3D "true" && $CI_COMMIT_REF_PROTECTED =3D=3D "t=
rue"
> +      - $XILINX_JOBS =3D=3D "true"
>    tags:
>      - xilinx
> =20
> @@ -112,7 +112,7 @@
>      when: always
>    only:
>      variables:
> -      - $QUBES_JOBS =3D=3D "true" && $CI_COMMIT_REF_PROTECTED =3D=3D "tr=
ue"
> +      - $QUBES_JOBS =3D=3D "true"
>    tags:
>      - qubes-hw2
> =20
> --=20
> 2.30.2
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2bIh9cXtMpJeLTbF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZXx4cACgkQ24/THMrX
1yx+Nwf+MYUlCbZHeAuvtaVkSdCOEbvMNu31TleFCnDnHrxQkX8Uj/nzONqkz42I
Wk/zzS3fbkHi1lrTWjKJYmxSZ+nukeYbfDnxxIaT4vygoDvBelFF82Oes6xqES01
eScEzHQPGz9UIK07k5gpe7LrZyNIqKEGfnILd77L34siUufOVSetydRHviJXSOse
+z9AuBL8SA1GsTNxfKjRyRcFBV/hTjvQV2w+pKTfwwii5AfVw08souYMUOhrhFgS
vgt10SiQ0aAgQBmukjsLHDo0zpDcwucTYSBFn1G4X5DLK9wsTQ64WDxOhnDTo3BB
KuZwn9I0bECW8vkKeGHP8TeIZ/C/Dw==
=vAra
-----END PGP SIGNATURE-----

--2bIh9cXtMpJeLTbF--

