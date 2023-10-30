Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 887177DBDE7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:32:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625299.974474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVBY-000812-Ot; Mon, 30 Oct 2023 16:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625299.974474; Mon, 30 Oct 2023 16:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVBY-0007xh-LY; Mon, 30 Oct 2023 16:32:16 +0000
Received: by outflank-mailman (input) for mailman id 625299;
 Mon, 30 Oct 2023 16:32:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZGw=GM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qxVBX-0007xZ-0a
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:32:15 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0a0fe33-7741-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 17:32:12 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 94CEF5C022C;
 Mon, 30 Oct 2023 12:32:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 30 Oct 2023 12:32:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Oct 2023 12:32:10 -0400 (EDT)
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
X-Inumbo-ID: e0a0fe33-7741-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1698683531; x=1698769931; bh=0OtgsMvHzA1yM+SFXRCisDbGSA/ccSpclUn
	hLDlxpgk=; b=KTCG9qCWjWJpvcnwYHsWO54MkJnMivtXJgac/TrJsWOqPwuU3Cs
	QJlF6/qKfZX36dYRVWuEFo9GdhdkeyRXDX6H4cb7oCW5BGJMxAK/KiGtkxMBRF5r
	0uE/siyC/y8TxHdPfwBR2Zdetq7Q72ezwYhRAlgawWuJk4aJTuZHo20l0mpVoBz7
	xNKBKa+iXsE1/+ib+q4YW8wAN7yM4izFE6RYDZWG05fA3HoYAL9j+ZXQyR7MJRFG
	P/kp3rXVuS9iF7Mas/Sm+fNZTJqzOorpkqddkEAqcXFPbji8eckT60/mC79d/ImK
	+AVbEePVszR8TZTPqSRY5eUFr/lWE7+07RA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698683531; x=1698769931; bh=0OtgsMvHzA1yM
	+SFXRCisDbGSA/ccSpclUnhLDlxpgk=; b=CwgiyZhvlQy8GLr0gUS6mwiXdUtRa
	pFWObJIcZnJsRraeKRFXmYnFrRasLtJ3HZxaihT9wYO553jUFl5nhtcdREgRdg98
	EIdl7zZaVBA5EFa5O8LW/+k8LiV1ww0jWs9jT3gtsiK0kDLEp9ygbrQ6RUxAj+os
	ZvnCgu4GmBy4NHGXK+kLvCo7L2j32nLJ8f2kwwgk2TI70pYGpGM74ZQT28FeXFb1
	YU/67pEp7Zpg52nAUo4HDrr+YSKRgPTR2SzIGCYeSdtAldwByeA2T537jenBHWry
	HrhaZHf84hID9efyLQEwlHxDmEdr31WqvVg90pGBDh75lKRzc9D6yRLVA==
X-ME-Sender: <xms:i9o_ZZWhK6z8xbspTfAp6M7bM8lsaFBLxbKUiYOB8ef-Kx9JNtr0og>
    <xme:i9o_ZZnGEfWmASnbDZZnFQfab3jCHJaBKgtn0Iq5mS1ebECPiUdCSj2NuV3vSkMEK
    1uMrcAkouQ6kA>
X-ME-Received: <xmr:i9o_ZVZdawt2OBNwNyW6Id7MovsDCbukTNWVRaq7Ku8f9oDzydd85s6KkB_hlper_5rAiKf_Z5bOeHAn97HTQxn-8Xn8XoJBC8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddttddgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:i9o_ZcVtvTbgtxLB3ptZsvV2y8iuOTjCSoKk-pMfE5O542_2CQLh0A>
    <xmx:i9o_ZTl_JsNztL98lwcYeXuciNz3iuoevi8Qx_yiJIVBY_GjC0MASg>
    <xmx:i9o_ZZf9I-UtuMSvqiB6RRqBjXj6mdL9HS-r08GVKoktZkyxAjE7Fg>
    <xmx:i9o_ZbuMaAl_x_rrukYQ8caDNfnYRHaJq4cjc976Gp-_g-c5IUsscw>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 30 Oct 2023 17:32:08 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: fix race condition in adl-suspend test
Message-ID: <ZT/aiFnjW4dOIaiw@mail-itl>
References: <20231028033404.262729-1-marmarek@invisiblethingslab.com>
 <ZT-WvAye6OlWGLAx@macbook>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N4zB2EWuPretiURx"
Content-Disposition: inline
In-Reply-To: <ZT-WvAye6OlWGLAx@macbook>


--N4zB2EWuPretiURx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 30 Oct 2023 17:32:08 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: fix race condition in adl-suspend test

On Mon, Oct 30, 2023 at 12:42:52PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Sat, Oct 28, 2023 at 05:33:57AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > If system suspends too quickly, the message for the test controller to
> > wake up the system may be not sent to the console before suspending.
> > This will cause the test to timeout.
> >=20
> > Fix this by waiting a bit after printing the message. The test
> > controller then resumes the system 30s after the message, so as long as
> > the delay + suspending takes less time it is okay.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> > This is consistent with the observation that sync_console "fixes" the
> > issue.
> > ---
> >  automation/scripts/qubes-x86-64.sh | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/qu=
bes-x86-64.sh
> > index 26131b082671..a34db96e4585 100755
> > --- a/automation/scripts/qubes-x86-64.sh
> > +++ b/automation/scripts/qubes-x86-64.sh
> > @@ -54,11 +54,11 @@ until grep 'domU started' /var/log/xen/console/gues=
t-domU.log; do
> >      sleep 1
> >  done
> >  echo \"${wait_and_wakeup}\"
> > +# let the above message flow to console, then suspend
> > +sleep 5
>=20
> Could you use `sync /dev/stdout`?  I guess that might not be enough,
> since the sync won't be propagated to the hypervisor, and hence even
> if flushed from Linux, we have no guarantee that the hypervisor has
> also flushed it.

It seems `sync /dev/stdout` helps too, at least in a limited sample of
two.

> Xen should flush the buffer when a newline character is found, but I
> have no idea whether context could return to guest while the buffer is
> still in the process of being fully flushed.

IIC Xen should flush the console buffer on the suspend path (there is
console_start_sync() in enter_state()). So, if linux manages to send it
to Xen in time, all should be good (in theory at least).

> Anyway, adding the extra sync might be good regardless, and keeping
> the sleep.

Good idea, I'll send v2 with it included.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--N4zB2EWuPretiURx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmU/2ogACgkQ24/THMrX
1yyfDggAmI7R5YuGcPV57JeI6Z60mW+wA+1cN3+Iwh386ddFKxPmBgufwK1BQ0kZ
TKOm0ZkCRp/yu7Th5bfyMrixk6Z5ypeC+u7lcqy0mwg85qjqlBTs7bO9/Sx6TzIW
O0UvHHsFyWzfhGajboEAOxa4Uq/NSk7OIlWCFHzqHWCwpZ7W+YZd41CZNtZBXmy5
zAVEFzN025xxwAQZf5oI5AqovFRgEofKxH1U0SugyhGyRYHzJ/gcyGgogYap0MaB
U7bvMfax3KMAdUcgbLaxzC8T8RwXG4txPplXBVGyz7JZvxmsBS/SKcjCtQq1JE4u
Gia9MWWwduJ/zSxjH6EmwqQR4I13eQ==
=/Co5
-----END PGP SIGNATURE-----

--N4zB2EWuPretiURx--

