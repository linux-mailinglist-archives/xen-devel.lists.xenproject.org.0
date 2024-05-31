Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5448F8D60D5
	for <lists+xen-devel@lfdr.de>; Fri, 31 May 2024 13:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733669.1139980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD0c9-0002bG-Py; Fri, 31 May 2024 11:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733669.1139980; Fri, 31 May 2024 11:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sD0c9-0002YM-Ms; Fri, 31 May 2024 11:40:05 +0000
Received: by outflank-mailman (input) for mailman id 733669;
 Fri, 31 May 2024 11:40:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xPZo=NC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sD0c8-0002Ae-0n
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 11:40:04 +0000
Received: from wfout1-smtp.messagingengine.com
 (wfout1-smtp.messagingengine.com [64.147.123.144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 837edcfa-1f42-11ef-90a1-e314d9c70b13;
 Fri, 31 May 2024 13:40:02 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfout.west.internal (Postfix) with ESMTP id 18F651C00224;
 Fri, 31 May 2024 07:39:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 31 May 2024 07:39:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 May 2024 07:39:56 -0400 (EDT)
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
X-Inumbo-ID: 837edcfa-1f42-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1717155598;
	 x=1717241998; bh=PtyDoQ5hXIUw/iYJcJ0Fd/M4Ak5wsByW/SqcYzEaX/Y=; b=
	FjH2Uz3gFWVXntIWh/tFZBVsB0yZQpEIbnBJhHlm1tquzjcFOWQZ8GhzHLnZwWZl
	dsDpue7nhFXqpRYtUro9P+UsNWaRqOkwqi/a2ZCKySflULqAEFVgc8yqEi6+ylAL
	OfTrpBk0zC4h/suma/SjgbZ68T3S8luD+K4H5+bvWb9wEgZf85/4eOrU0ny1FyTo
	hL/Ey8gMbRl0XpbWVf3yUuOlxOJ8o0zpA1uWCGssynrELZYev0Mv54ly3X2UGqcN
	FC1AXz1pz/hCjQGzV3n6TShkNzD9VCwLowPRzLMEu8JpieHy2TvuhjTQUxOHR+74
	7UBnD+l5Kl9ReUBmN6rc0w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717155598; x=1717241998; bh=PtyDoQ5hXIUw/iYJcJ0Fd/M4Ak5w
	sByW/SqcYzEaX/Y=; b=kfJ8r3d/HPvq4TDMlUmxkVw9c2uiVJI0N2aPLS9bhGP0
	YWpu92UeJ1P1AXC+bPM+OjO93kzWjiGZAgq2gcY/X8PDbZ3nwxFTgTs+WxccKI7S
	uIESJ4vlDgqgyGuDcmxhAj+QIJ0Zo9m1ok/8qOLfwohjtWmeeTLLBYvYgmWhINly
	7PJEm016mXft6bsFhvQc0j52y9oNYKZxPovYusbcDxq7jZCioguDGYFpiceB8W4n
	D9cnoKAo/tZGnIXQcepg0zhGmfEDUvMPtnNzVvgtnT7QqPlrSgCRt/XWgsItY4IP
	/P4cTD9gMgxluTG0IAHtyojvDldnwZqGL4BHxlsJQA==
X-ME-Sender: <xms:DrdZZmSoj_HAULYl5hfZn-cZwWNceuMbp88tqPlvwzGpjyfW-l_7uQ>
    <xme:DrdZZrymmic_iJ2jENfSlgp-mptBh-lXj6RAAd61moqF36DCmPbHTDecELUjOlvS4
    5guYjNs6hpPTQ>
X-ME-Received: <xmr:DrdZZj0-VoP8NyDw0aAF23RwhRukJDplFiQZ35yD2NKQae61IGlEz5erO0I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekiedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:DrdZZiC6wvK-z-wSibhxhty8VYeGSdt2xiozSxmRdGvzxuUX59ONwA>
    <xmx:DrdZZvjD5eGZLkfgS-Ecl8J5vsZe3v6sRxx7wiVUz0u-ZdeJ3IiXTA>
    <xmx:DrdZZurca9YnRObjruZwF6g5yu5ZfeCuIZxdBfj8i3yi8Fu8ML4tdA>
    <xmx:DrdZZijdvDrdFXLtRZLZ6WwPXrY4WEIAN1DuNCmAJEWzHRvfotztoA>
    <xmx:DrdZZlYRF1_gY_Arfhaojkz3wMRa2xma2m8EBRLbdbePdu9ADLc44Y8f>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 31 May 2024 13:39:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/3] CI: Remove CI_COMMIT_REF_PROTECTED requirement for
 HW jobs
Message-ID: <Zlm3CwgwccpPU4f6@mail-itl>
References: <20240529141945.41669-1-andrew.cooper3@citrix.com>
 <20240529141945.41669-2-andrew.cooper3@citrix.com>
 <ZlfHh_blx1i0eE7O@mail-itl>
 <alpine.DEB.2.22.394.2405301715010.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0qbZMnV+fSlTWEii"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2405301715010.2557291@ubuntu-linux-20-04-desktop>


--0qbZMnV+fSlTWEii
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 May 2024 13:39:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: Re: [PATCH 1/3] CI: Remove CI_COMMIT_REF_PROTECTED requirement for
 HW jobs

On Thu, May 30, 2024 at 05:43:12PM -0700, Stefano Stabellini wrote:
> On Thu, 30 May 2024, Marek Marczykowski-G=C3=B3recki wrote:
> > On Wed, May 29, 2024 at 03:19:43PM +0100, Andrew Cooper wrote:
> > > This restriction doesn't provide any security because anyone with sui=
table
> > > permissions on the HW runners can bypass it with this local patch.
> > >=20
> > > Requiring branches to be protected hampers usability of transient tes=
ting
> > > branches (specifically, can't delete branches except via the Gitlab U=
I).
> > >
> > > Drop the requirement.
> > >=20
> > > Fixes: 746774cd1786 ("automation: introduce a dom0less test run on Xi=
linx hardware")
> > > Fixes: 0ab316e7e15f ("automation: add a smoke and suspend test on an =
Alder Lake system")
> > > Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >=20
> > Runners used to be set to run only on protected branches. I think it
> > isn't the case anymore from what I see, but it needs checking (I don't
> > see specific settings in all the projects). If it were still the case,
> > removing variable check would result in jobs forever pending.
>=20
> Andrew, thank you so much for pointing this out.
>=20
> I think the idea was that we can specify the individual users with
> access to protected branches. We cannot add restrictions for unprotected
> branches. So if we set the gitlab runner to only run protected jobs,
> then the $CI_COMMIT_REF_PROTECTED check makes sense. Not for security,
> but to prevent the jobs from getting stuck waiting for a runner that
> will never arrive.
>=20
> However, like Marek said, now the gitlab runners don't have the
> "Protected" check set, so it is all useless :-(
>=20
> I would prefer to set "Protected" in the gitlab runners settings so that
> it becomes easier to specify users that can and cannot trigger the jobs.

Owners of subprojects can control branch protection rules, so this
feature doesn't help with limiting access to runners added to the whole
group. Qubes runners are not group runners, they are project runners
added only to select projects.

I don't remember why exactly runners got "protected" disabled, but AFAIR
there was some issue with that setting.

> Then, we'll need the $CI_COMMIT_REF_PROTECTED check, not for security,
> but to avoid pipelines getting stuck for unprotected branches.
>=20
> It is really difficult to restrict users from triggering jobs in other
> way because they are all automatically added to all subprojects.
>=20
>=20
> Would you guys be OK if I set "Protected" in the Xilinx and Qubes gitlab
> runners as soon as possible?


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--0qbZMnV+fSlTWEii
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZZtwsACgkQ24/THMrX
1yy5+Qf+ICtQHPgXu0IXrYCdZYqHJNc18ypMaNIJKR4Ltj0OF40ylFkEcVSBswnX
Z6y0ZlJH9D6R8CFgIIpR5rQ0YxIExslDUj2E1KFnluqt6zg3fFN23eDxflYvmI8C
4O7tEcdDLlB765NAWyCY+CvBvO1yG9xCW0WrkWkKOAwajqYNBUcpVOQ/syhftUnZ
JWb+ePoPrlwq1bDKqHO7jidmjtGIMdfzt2bbJbR4m70VRb5Zftai0uyjr54p+km0
omXfL+T5SJRctnUpcH+xS7Z38gjCKaLW29CXXKJiKFJibyhizm345ZD26nXz5ycm
6tB+eUu7RLxgPCj4JxywV8gi0NVV3A==
=162x
-----END PGP SIGNATURE-----

--0qbZMnV+fSlTWEii--

