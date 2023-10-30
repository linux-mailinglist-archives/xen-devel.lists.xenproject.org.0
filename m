Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97A7DBE1A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 17:39:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625324.974533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVHv-000438-Mp; Mon, 30 Oct 2023 16:38:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625324.974533; Mon, 30 Oct 2023 16:38:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxVHv-00040K-Ji; Mon, 30 Oct 2023 16:38:51 +0000
Received: by outflank-mailman (input) for mailman id 625324;
 Mon, 30 Oct 2023 16:38:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZGw=GM=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qxVHt-00040A-Uz
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 16:38:49 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb2619c5-7742-11ee-98d6-6d05b1d4d9a1;
 Mon, 30 Oct 2023 17:38:48 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id EC4A65C022C;
 Mon, 30 Oct 2023 12:38:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 30 Oct 2023 12:38:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Oct 2023 12:38:43 -0400 (EDT)
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
X-Inumbo-ID: cb2619c5-7742-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1698683924; x=1698770324; bh=H3FMm/KCOvYupYm8lx7+FY9QkhQ2/K9SJCK
	V5VPpvSE=; b=CTiqYtHl00tCgERkKdZHfKZlS3dbXPQtBs/yP4mmxebTSEjRo+I
	WXNjhmQyf+gc4S7/f7cydfVcb8+HbJQgk7thZS4Bu+Xxhr9bt3A7TolkS8BzsUV7
	thMxSMFNROrPylVw72Y/Dn85kOkcQjG6G6gZ2NidKQrrlq+aXUqHQcx48ZTTyf9d
	Lp1EK6J8gKADTVWxzMD+VSg7iVDhRlpsr1wZmYX2eybOXFp1aDpxy7lKo7I27RUN
	27Gd2ZOgI6XvMrkbwtWaY70MsjVCcakuZhPerBjOEHT99uUYF6p8I59ExPDrsAJ2
	hO1RcOxwGx3/Fk8cpH/bAuICVqTZLktROhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698683924; x=1698770324; bh=H3FMm/KCOvYup
	Ym8lx7+FY9QkhQ2/K9SJCKV5VPpvSE=; b=fRsIR26mJT/vGYovfsdFBVU4A+cDp
	djp+Wq2JaIxZhL9fRwcvf3MOjmFuncjR4PHvrsdiyloHfaSxND2gVCHfOF2RPVaf
	+74UW3USNehJ7l4a7VC0WEyoFDwAwjJxat6JCBWfsDp2bSTRyw7LYDfqo5s7IRmb
	PazezrbNPKAiIkyTOC4TuP8/DWkIQbR/x2JOb/bV+0BE9gwX9ReuV4AWCuViSB1A
	7dlCMaahKTnFD0VIsatUGHZ0KQ+0d00s8nnaG/orJc75qRm61BFsCwtIXr+w2dme
	QJoVCTILI0oASgh/H29QwbCVsVxZLAf7RVqnaX/heDpX2kqgR+qaKZRnw==
X-ME-Sender: <xms:FNw_ZUKhBTtsfVI7v6G75EwLSZkX9nMBRIzBkGE-UdECbh_ZDd70nQ>
    <xme:FNw_ZUIRFV1z7HJcjgGXjFuL4uecRWO5PkHjeIp90zyvP45p5wBRfkI5jowAOPh1W
    ht21Qfkk08ufQ>
X-ME-Received: <xmr:FNw_ZUv9sas5Aj-Xp4WldJSYOAU9XDKdre81wNGph20mKb92YU8umyTR3etEdtwXJhqShYWKky2lSn22Ng3Gd2eqlTbVCeeYLLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddttddgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:FNw_ZRanYdTCkAacV-qGlBbBqt0svYLRY57IKds9YWYHODbRbZvvlw>
    <xmx:FNw_ZbasPYJQYbFa2bBjLXU4EgtSkUU1oiDlpfJbz0D8elOq8w2noA>
    <xmx:FNw_ZdCpHGq-e4TJAmAjjciBhVhatf6GIU79R2mRaQe4PT5F1y-TBA>
    <xmx:FNw_ZSw_4vKwn-MP8TiJPHQt6X_B58-9pJoFXCWHW99rMSJHNKTZmg>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 30 Oct 2023 17:38:41 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: fix race condition in adl-suspend test
Message-ID: <ZT/cEqEUlBoyvyr0@mail-itl>
References: <20231028033404.262729-1-marmarek@invisiblethingslab.com>
 <ZT-WvAye6OlWGLAx@macbook>
 <ZT/aiFnjW4dOIaiw@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="paK9yxII+R3FdtFG"
Content-Disposition: inline
In-Reply-To: <ZT/aiFnjW4dOIaiw@mail-itl>


--paK9yxII+R3FdtFG
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 30 Oct 2023 17:38:41 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] automation: fix race condition in adl-suspend test

On Mon, Oct 30, 2023 at 05:32:08PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Oct 30, 2023 at 12:42:52PM +0100, Roger Pau Monn=C3=A9 wrote:
> > On Sat, Oct 28, 2023 at 05:33:57AM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > If system suspends too quickly, the message for the test controller to
> > > wake up the system may be not sent to the console before suspending.
> > > This will cause the test to timeout.
> > >=20
> > > Fix this by waiting a bit after printing the message. The test
> > > controller then resumes the system 30s after the message, so as long =
as
> > > the delay + suspending takes less time it is okay.
> > >=20
> > > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethi=
ngslab.com>
> > > ---
> > > This is consistent with the observation that sync_console "fixes" the
> > > issue.
> > > ---
> > >  automation/scripts/qubes-x86-64.sh | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/automation/scripts/qubes-x86-64.sh b/automation/scripts/=
qubes-x86-64.sh
> > > index 26131b082671..a34db96e4585 100755
> > > --- a/automation/scripts/qubes-x86-64.sh
> > > +++ b/automation/scripts/qubes-x86-64.sh
> > > @@ -54,11 +54,11 @@ until grep 'domU started' /var/log/xen/console/gu=
est-domU.log; do
> > >      sleep 1
> > >  done
> > >  echo \"${wait_and_wakeup}\"
> > > +# let the above message flow to console, then suspend
> > > +sleep 5
> >=20
> > Could you use `sync /dev/stdout`?  I guess that might not be enough,
> > since the sync won't be propagated to the hypervisor, and hence even
> > if flushed from Linux, we have no guarantee that the hypervisor has
> > also flushed it.
>=20
> It seems `sync /dev/stdout` helps too, at least in a limited sample of
> two.

=2E.. and the third attempt (with sync instead of sleep) failed.

> > Xen should flush the buffer when a newline character is found, but I
> > have no idea whether context could return to guest while the buffer is
> > still in the process of being fully flushed.
>=20
> IIC Xen should flush the console buffer on the suspend path (there is
> console_start_sync() in enter_state()). So, if linux manages to send it
> to Xen in time, all should be good (in theory at least).
>=20
> > Anyway, adding the extra sync might be good regardless, and keeping
> > the sleep.
>=20
> Good idea, I'll send v2 with it included.


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--paK9yxII+R3FdtFG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmU/3BIACgkQ24/THMrX
1yxrDwf/UzxTdP8sfURuvoBtUSKDzS5kWeowPDyaxhZcyqa8LthzBme/GiY7vUil
WOG2mtDAJSoDG3HleBdPpiPwtxPg8+NK0c+iLmLb15ulRkybYl0DlqpfCnXebtAm
OqJA+Fxbsmw7vo+v+sNgGUOlZFrCAFraBlD+nkQliuN50sGJ0NRB7WRqR1aNSYXl
SqifHkeUTYfh2aKpBxwph6goSESfmNzjGc7o0DmLv4IeLetBvlULT/zAPXcLFzsp
QWzwVu9EGQrnkyOcKzIOk2XXxHUU9qq5s+zfuHxosiiHQgHnfjGLR+k9t4qyNk2y
jfyCNQlvnAHsDHyixlzUi3XuPzsvOw==
=eFxg
-----END PGP SIGNATURE-----

--paK9yxII+R3FdtFG--

