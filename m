Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAA85A3BFB
	for <lists+xen-devel@lfdr.de>; Sun, 28 Aug 2022 07:17:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.394278.633625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSAeR-0000GK-0L; Sun, 28 Aug 2022 05:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 394278.633625; Sun, 28 Aug 2022 05:16:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oSAeQ-0000Dd-TK; Sun, 28 Aug 2022 05:16:02 +0000
Received: by outflank-mailman (input) for mailman id 394278;
 Sun, 28 Aug 2022 05:16:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2YP=ZA=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oSAeP-0000DR-7L
 for xen-devel@lists.xenproject.org; Sun, 28 Aug 2022 05:16:01 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7eeaeef6-2690-11ed-9250-1f966e50362f;
 Sun, 28 Aug 2022 07:15:58 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 322025C00CB;
 Sun, 28 Aug 2022 01:15:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 28 Aug 2022 01:15:56 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 28 Aug 2022 01:15:54 -0400 (EDT)
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
X-Inumbo-ID: 7eeaeef6-2690-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1661663756; x=
	1661750156; bh=QbI3nMCfAEAIkLCbLK6lBGyzYnOR/5l4uI4jb4UZa9M=; b=Z
	p4IcS/3tp+880an5O4Snl1gsExwqtuzV1J9+G2n9n3M4vSBNieLoqu0Fk20NbFoy
	500PihEHrQgBbpRHlKQLADKlP5U1+DTZTIJIYp+qScvHDr5ye8PUaQ3m2l5XOy4t
	r7G93pdGqMsJMf3ZILlkyxmGgpsNpfdixvNPR9OQViso3CYSWWLsZGipUEzv2zE0
	3AH2QLwNVT0XWl6PcF1XyO7TpazTGGZ0kAdwC1WOLivrD+VLPPxQ2jDQMXRJTDN8
	sXaqzNiwDbhhYlhS0uVJIiRwd8qrkNFwhw4Ooz83rlr/au5SSXdkMcsoY3+zQnPz
	qAtQHRz151Kx2GLJi2BFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1661663756; x=1661750156; bh=QbI3nMCfAEAIkLCbLK6lBGyzYnOR
	/5l4uI4jb4UZa9M=; b=xicgA8yrNETLyVTXkRykqePATc9hRHBQsqXJGf2cXxh2
	+eGtljA7DxCGmALKBp6k5/h6kHvbXdDjbZg2N80DSNWkV+7G/LDbH8w2wdCqU/+K
	1Veh08QlHdYOid9tek3WQ/M7Qi4rkL5BJO31QaXCDUPVcLVSPyohGiVTD8KIPBae
	B9lUHF7je2mgiVNeun+OXKNt7xsjq9ZUCpLPkalux7RShnbdRi1zzJyLvOKGedf/
	NtaP7dGp/tKY54IiVu/796EMLYTvMdUEouNsb4PDhTEnUUGcnQTSAfg37MdqMTp+
	v8kPjQ6zGrKyRUUhoVJHzaXPs7d6vRvUIdoxYLBhJQ==
X-ME-Sender: <xms:CvoKY-Mkt4Vw3zLQG0SteCkafB15xMswijGnDV84UsHBpouHlgNjqA>
    <xme:CvoKY8_CWJ3izMtKJ5xdvMVnfZpm-RBMzgJxY9qNwefp9_1-2SQQsproL5rJDuloI
    HrWv91mGyMJjxQ>
X-ME-Received: <xmr:CvoKY1REBc6CM6lGuHduDk4vZm0PUKiySgPrvpK4_MNe41sevV_Q-f3uxTu9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejkedgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:C_oKY-v79I0wu75A3KJlXiY_5_9A2c6VadvK1ua3eJiUOWLDuIfyMg>
    <xmx:C_oKY2cpjM7haH1X2j2HoV383bInmInurAkn3KUgGCX3Ws8LI_zshw>
    <xmx:C_oKYy3HutxfLAr3P6adFGQsQ6pv9oA4qduIXv8E9dxVJ5CWT4Mm1w>
    <xmx:DPoKY-kXjwhS00einBMVWxYZgcrVY1IyCFkNnNCp2Ve_G4-M2d9Dxw>
Feedback-ID: iac594737:Fastmail
Date: Sun, 28 Aug 2022 01:15:50 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: =?utf-8?Q?=E2=80=9CBackend_has_not_unm?=
 =?utf-8?Q?apped_grant=E2=80=9D?= errors
Message-ID: <Ywr6CfxUZs4zRPYR@itl-email>
References: <YwSEXonOg1CMzeQv@itl-email>
 <fe4aa229-2d3b-2bc7-e906-bb61a5d45f6d@suse.com>
 <YwVuwXOGoZX3pM7n@mail-itl>
 <ebc89685-a559-5511-5c82-41ae30ddbf6d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jFhi5uLrMH7VjIo/"
Content-Disposition: inline
In-Reply-To: <ebc89685-a559-5511-5c82-41ae30ddbf6d@suse.com>


--jFhi5uLrMH7VjIo/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Aug 2022 01:15:50 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: =?utf-8?Q?=E2=80=9CBackend_has_not_unm?=
 =?utf-8?Q?apped_grant=E2=80=9D?= errors

On Wed, Aug 24, 2022 at 08:11:56AM +0200, Juergen Gross wrote:
> On 24.08.22 02:20, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Aug 23, 2022 at 09:48:57AM +0200, Juergen Gross wrote:
> > > On 23.08.22 09:40, Demi Marie Obenour wrote:
> > > > I recently had a VM=E2=80=99s /dev/xvdb stop working with a =E2=80=
=9Cbackend has not
> > > > unmapped grant=E2=80=9D error.  Since /dev/xvdb was the VM=E2=80=99=
s private volume,
> > > > that rendered the VM effectively useless.  I had to kill it with
> > > > qvm-kill.
> > > >=20
> > > > The backend of /dev/xvdb is dom0, so a malicious backend is clearly=
 not
> > > > the cause of this.  I believe the actual cause is a race condition,=
 such
> > > > as the following:
> > > >=20
> > > > 1. GUI agent in VM allocates grant X.
> > > > 2. GUI agent tells GUI daemon in dom0 to map X.
> > > > 3. GUI agent frees grant X.
> > > > 4. blkfront allocates grant X and passes it to dom0.
> > > > 5. dom0=E2=80=99s blkback maps grant X.
> > > > 6. blkback unmaps grant X.
> > > > 7. GUI daemon maps grant X.
> > > > 8. blkfront tries to revoke access to grant X and fails.  Disaster
> > > >      ensues.
> > > >=20
> > > > What could be done to prevent this race?  Right now all of the
> > > > approaches I can think of are horribly backwards-incompatible.  They
> > > > require replacing grant IDs with some sort of handle, and requiring
> > > > userspace to pass these handles to ioctls.  It is also possible that
> > > > netfront and blkfront could race against each other in a way that c=
auses
> > > > this, though I suspect that race would be much harder to trigger.
> > > >=20
> > > > This has happened more than once so it is not a fluke due to e.g. c=
osmic
> > > > rays or other random bit-flips.
> > > >=20
> > > > Marek, do you have any suggestions?
> > >=20
> > > To me that sounds like the interface of the GUI is the culprit.
> > >=20
> > > The GUI agent in the guest should only free a grant, if it got a mess=
age
> > > from the backend that it can do so. Just assuming to be able to free =
it
> > > because it isn't in use currently is the broken assumption here.
> >=20
> > FWIW, I hit this issue twice already in this week CI run, while it never
> > happened before. The difference compared to previous run is Linux
> > 5.15.57 vs 5.15.61. The latter reports persistent grants disabled.
>=20
> I think this additional bug is just triggering the race in the GUI
> interface more easily, as blkfront will allocate new grants with a
> much higher frequency.
>=20
> So fixing the persistent grant issue will just paper over the real
> issue.

Indeed so, but making the bug happen much less frequently is still a
significant win for users.

In the long term, there is one situation I do not have a good solution
for: recovery from GUI agent crashes.  If the GUI agent crashes, the
kernel it is running under has two bad choices.  Either the kernel can
reclaim the grants, risking them being mapped at a later time by the GUI
daemon, or it can leak them, which is bad for obvious reasons.  I
believe the current implementation makes the former choice.

To fix this problem, I recommend the following changes:

1. Treat =E2=80=9Cbackend has not unmapped grant=E2=80=9D errors as non-fat=
al.  The most
   likely cause is buggy userspace software, not an attempt to exploit
   XSA-396.  Instead of disabling the device, just log a warning message
   and put the grant on the deferred queue.  Even leaking the grant
   would be preferable to the current behavior, as disabling a block
   device typically leaves the VM unusable.

2. Ensure that the same grant being mapped twice is handled correctly.
   At least Linux is known to have bugs in this regard.

3. Provide a means for a domain to be notified by Xen whenever one of
   its grants is unmapped.  Setting an event channel and writing to a
   shared ring would suffice.  This would allow eliminating the kludgy
   deferred freeing mechanism.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--jFhi5uLrMH7VjIo/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMK+ggACgkQsoi1X/+c
IsG+cQ/7BzwGSjViK054IMFa9MXvHS7Rews5K3hzGGZzEnQpljLiF4fHUl8bIpF8
/iSetiQYwrFnQJ2IbGOw5dBNN9pF2w1pok9Eiq7iy0TXs1AhNomKZA5xmHVj+i7Y
Sbeng6pLfFwkgotMT4QB46ZEOhwnuJ02+sMT8JdTqWEE7a0uFMKP5Eh/H09jfGY3
Pnfekvsg4moNkSllSejfGmJvI/uzo1t6AE19payXS8hdLMzxHhss31ZSAiuh4m+q
WDT8N0CZZBlZKk36NXMdHKp+u3qojrUY8Y1m9MDrv6yN+nAWn5d66gIvikA8Rwj8
TtE2xjHY61QCgjgsJLMpV+5n2jwEQ+kaqzN0FKtAPGez3KZKSwuhBNxn9rXzVn/J
DOTVTOPGsQBsy62tJfrOyR5quq+Dm1ElVky6MZLQ7KlZEK8MdnI+0BmueXig6FA9
GhZFXaVD0N81CLJKiUUBN3FWD5uq03hpW1xg6LI469VBsibcXUvw4PorYb0o849N
m2WrD/rv6X3zZTmINfjZX3HvoVXCa50UepTuUpqEm5DF+CQcfQrpv9gMvh1dYCgf
9dOJQ2oEkNx+q/ooKCV/GlVZxuarsW9NF6EybxhVZVwMUQEiN2cOocinstnAcOOy
rr9QyNXPjFChasEMl2ez2dLmaq+VGcE6z6jpI3QVI5csBr1s4bE=
=7NHB
-----END PGP SIGNATURE-----

--jFhi5uLrMH7VjIo/--

