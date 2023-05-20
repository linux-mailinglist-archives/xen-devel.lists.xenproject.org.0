Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D1570A5B8
	for <lists+xen-devel@lfdr.de>; Sat, 20 May 2023 07:38:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537366.836483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0FH0-0006De-Nz; Sat, 20 May 2023 05:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537366.836483; Sat, 20 May 2023 05:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q0FH0-0006C0-KL; Sat, 20 May 2023 05:36:58 +0000
Received: by outflank-mailman (input) for mailman id 537366;
 Sat, 20 May 2023 05:36:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQEh=BJ=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1q0FGz-0006Bu-1r
 for xen-devel@lists.xenproject.org; Sat, 20 May 2023 05:36:57 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52a43a09-f6d0-11ed-8611-37d641c3527e;
 Sat, 20 May 2023 07:36:52 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 809765C00DA;
 Sat, 20 May 2023 01:36:51 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sat, 20 May 2023 01:36:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 20 May 2023 01:36:50 -0400 (EDT)
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
X-Inumbo-ID: 52a43a09-f6d0-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:sender:subject:subject:to:to; s=fm1; t=1684561011; x=
	1684647411; bh=8IitWPFe78G+zxKofkqDDSKZmdplMZYDBzCeut9KBls=; b=q
	6/r7wB2zQZ2jEjveKe/1SGYEU/FNePYE70vakyrRqUbYr2BimK+WMM8slYFnwfiA
	kP3ete9uVx90mRdW9y10J7bTUqDD/6Ncjt167n72EZMyS36oYCRoVMQ+3VFxZYTT
	nGonFB8vQiXBFq4hjQBGxY5ipJgmS3gO569RucVleuufPDVLVlJC2FTn2VQ4tkez
	fs1GvvfkT8QIsNcDh2faPmjYcUYqIKWEzkuU8RQnq7AANj4iAnG8zs3P658lz6r3
	Z8ghyu8GASq+YqBuBsmbWRVdnEdgazOp2hqdq/ZSpbh9EiqRT1h8FsyfqbSMg6qt
	nE67bYhXmjhn/hT/T1ykg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1684561011; x=1684647411; bh=8IitWPFe78G+zxKofkqDDSKZmdplMZYDBzC
	eut9KBls=; b=TMSSDr0UaFz1SHJZdiS8/CeBFuUkKAjOjkdjnHdiz4AsyrkC7sG
	whDCBDHNOjWZhbZ5E59Qtn/tMwwH6w8meCw0atTapN22IiNPH+1hasgsOvf3ooEU
	3Wb5gqvHQcrxqGchnsSKGXAAYUA3W3phzvEaFKXm7soy0mrhczruUJge+B+Qe9Ps
	OxICwtN+gmDjNisVX6uJsQ9f2mLhw8LY0vXw/bcN4HpxX3Cv5B+ODM6PAYNkMAvO
	s0Nfr3inATVRJpWKPFxWY1DtILafHxEr/1wo9V6pOHxopDG18xU8skLjTjXF4Rrg
	/xAFfY0mnctQsJrCqRPV+n9DUGDjYQlBPHA==
X-ME-Sender: <xms:c1xoZPkxsJ2ADDhMkmc7fzFYgrgOF6F4JqkAm9tfnfVgWPa8NYO4HA>
    <xme:c1xoZC0ZbbgGWHfo--rImLALvQPWtYrOX6E2ncrPrIJ9N8VftBvB1PgP71dXOF6rm
    p5Qzpcn4ozjToI>
X-ME-Received: <xmr:c1xoZFp-7r2T7PxWn6VEqUpTwGSzP1mP-dmAUQ_rNWdPDreA8lzirtyngvY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeiiedgleeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepffgvmhhiucfo
    rghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomheqnecuggftrfgrthhtvghrnhepueevleffkeefueelieeuveehfeeigfff
    gefgudeiueejveevheffgfdthfeijefhnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgr
    sgdrtghomh
X-ME-Proxy: <xmx:c1xoZHkU7O8JRorYdPUhsShUQkgo5Jsk3HTrd_JVxR_CKWgUrEhIKQ>
    <xmx:c1xoZN0xuUuIh8AiQcciNySbGKzeRBFyZ4CyM_0z_zzCqmAhwkvINQ>
    <xmx:c1xoZGtlSb-iDCRRgSTCsKR6geWYZAoMM6KwDMG9QVRj9dnG8sLbvQ>
    <xmx:c1xoZKhk-I6OtuUPbpkXDVqXnGoonlGzZNgVmUoKvRYlLJB1blboaA>
Feedback-ID: iac594737:Fastmail
Date: Sat, 20 May 2023 01:36:44 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Removing Linux memory hotplug limitations
Message-ID: <ZGhccUNlipyTIm5/@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Em6P91+DqSFMPKbb"
Content-Disposition: inline


--Em6P91+DqSFMPKbb
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 20 May 2023 01:36:44 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Removing Linux memory hotplug limitations

Qubes OS is trying to switch from relying on populate-on-demand to
memory hotplug for Linux guests.  However, this runs into a problem,
which is that only a limited amount of memory can be hotplugged.

My experiments with Qubes OS=E2=80=99s build of Linux 6.3.2 reveal:

- The more memory a guest starts off with, the more memory that can be
  added to it via hotplug.

- The memory that the guest is not able to use remains available on the
  host and can be assigned to dom0 (and, presumably, to oother guests).

- There is no sudden jump at 2GiB or 3GiB as far as I can tell.

- There are no kernel warning messages unless I try to add a huge amount
  of memory (far beyond what can be successfully hotplugged).  In
  particular, there are no warning messages from drivers/xen/balloon.c.

- There are several waits in the balloon driver that should probably
  hvae comments added.

- `cat /sys/devices/system/memory/memory*/state` reveals that all memory
  devices are online.

- `echo $((1 << 63)) | sudo tee /sys/devices/system/xen_memory/xen_memory0/=
target`
  causes a kernel crash (BUG_ON(ret !=3D nr_pages) in drivers/xen/balloon.c=
).
  Patch coming.

- The initial amount of memory assigned to a guest is irrelevant.

- The maximum amount of memory assigned to a guest is highly relevant.
  Table below:

   Initial maximum memory:      Maximum after hotplug
             400M                       2733M=20
             500M                       3067M=20
             600M                       3535M
             700M                       3919M
             800M                       4315
             900m                       4711
             1000m                      5105

SciPy linear regression gives:

- Slope: 3.9943
- Y-Intercept: 1116.14
- R: 0.99965
- stderr: 0.047

In short, there is a very clear, nearly linear relationship between the
amount of cold-plugged memory and the amount of memory that can be
hotplugged later.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--Em6P91+DqSFMPKbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmRoXHEACgkQsoi1X/+c
IsEMwg//ST7yUUKUJZL4pqYw+siRHT6dD8oax7dAGQx2Zo6CLyQ0K3fu27FOqTEM
hB7Ua3h05DzYtOSJbDcdjqlYendfIo2Yj7ItBgt3VF1rPTBKy+sNYqxjr838LvUR
18adFho7fiyqmuRB+kqmdQ/BW2S1mQos5AIq1rY7E+MaIgGyzXQHc2oIyGw1X6uY
FJ3RoLRo3cHk1dbwsmSc+OXjxKPAW6I1DLd8GhFLhiBXUV1Q+QlUt5lJTPS7Ci5b
nbIvEh+1kOyg35ZUefLWlMzdTGIMW6rpzIT3Q1C6YDr2K0EXeigUbgvhZIrbId0T
zILnEI44MLzGAHyrC52BXyCPik8l97rlRHxW9/nV0dMXiM7/vVj1INURGK1Vm3y1
waNiLfBohbKpGKb5cz874FgQV8dNl1704zSkKgchVRRTBQjte0PhgUDpHNM+IdtG
E1fZZJ4wquJikUUYLqS2Hc8Z3O0H+2ALWVJwz8ZnosEARw8aZcICIbKpQgaReMHB
+dNxmyy4nSxBBzSMllLJhjsTjqA33MXAFIVRtAjmOqODR1sxhMjALdBCvTu5qXXt
MycpQY4xVOVMC9E0QdD4XiKNbkFg+CHT0dzJmE5JQm3J/NZdGxeBAa5nbweXzJMX
VJnF5eJogsnPXHAr42QFmW5HWrci3tg2ATGg9UOUSlQCzu7stV0=
=3tFv
-----END PGP SIGNATURE-----

--Em6P91+DqSFMPKbb--

