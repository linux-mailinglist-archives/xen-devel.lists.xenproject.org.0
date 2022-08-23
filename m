Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B56459D267
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 09:40:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391699.629640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQOWM-0004sO-5V; Tue, 23 Aug 2022 07:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391699.629640; Tue, 23 Aug 2022 07:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQOWM-0004pg-2F; Tue, 23 Aug 2022 07:40:22 +0000
Received: by outflank-mailman (input) for mailman id 391699;
 Tue, 23 Aug 2022 07:40:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ktx1=Y3=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1oQOWK-0004pa-Tg
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 07:40:21 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d574b76b-22b6-11ed-bd2e-47488cf2e6aa;
 Tue, 23 Aug 2022 09:40:19 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 63C835C004B;
 Tue, 23 Aug 2022 03:40:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Tue, 23 Aug 2022 03:40:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Aug 2022 03:40:16 -0400 (EDT)
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
X-Inumbo-ID: d574b76b-22b6-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1661240417; x=1661326817; bh=+0y/igUiEW
	/l7fgCww+PcmK4Hxvd2NS0xaNQHbUgFvg=; b=Tf0XDBpB5KiFFrm5LMMA3IzIJR
	UndFi+j7IGrZoXc3yLZQk3KmZCzIxjZ8SV1KDmteJ4pcP2sHtwtb/pNla2E8d6VC
	N13bqWEEKZrFmQ401WP8i/Efxf7VDGvHt0cl46hHpMrD870qr26ojiaOhSS2GmEY
	z16wNgvV5xHXfsz5SmPB0q5PuR+wICmqJ4jAByin6ZSrmTTktCgSRJxiQc78VDA9
	gqflB61vb31quzrm3YMptmmgVdUWgmgHksWAa/BT46UVyHFaXlV6Aslb9An6ojAO
	rJCRHsDpVn5gSA3mM9xw1zI6yKcYAKjf02wVhMWz5G3mhWhwqb3KpScbfBeA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1661240417; x=
	1661326817; bh=+0y/igUiEW/l7fgCww+PcmK4Hxvd2NS0xaNQHbUgFvg=; b=3
	vQcwZcwXT3hgVNNRBWUkSmARjBJktgYJ/6qKX1gKthHGRfcs+E1CtO6p3YjScq4V
	gtp9KptIU2KqYaqlMlXM733ykqlVuRFp5eE4gu1P9bgpJTP0mYJ/EPWWrPRCjCD5
	J/qotuvVBE4kDPRVc1xMc4ge2N6lORxTYpTeZCWIiBTtxensGY6PmD3xIcfM2uxF
	WB+cJyc5ez9bERaUNRkH64AJU70yldaJzF1nIE/CsTMyQu4i2YyLI7nRtsCVRyek
	Q7VhH4ubCLJELZnyy4sUJwg4h/UCgqwwZ4xyuCwR9fXvOk/fpOAfQ9I4fxN9i9JD
	/c5o+azla8DKajLKCKPBw==
X-ME-Sender: <xms:YYQEY-ku3_X51HrkRIpMjzu67CSqAUChqu8Hnn8ym7miUgG8cBCP-A>
    <xme:YYQEY11r7sgSZxElF-iHvtdrf--7voJD74NdLf-4hsX8fwU3IcEwHRe0BKVqCJUUl
    GejwjEkgJyB4rs>
X-ME-Received: <xmr:YYQEY8qcFVlMN-OoE6vTS_rEoqcBQRB05NP1AobUSjX26utniaTTQ99CvN2q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdeikedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeuveelffekfeeuleeiueevheefiefg
    ffeggfduieeujeevveehfffgtdfhieejhfenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:YYQEYymqLFR6c95D96z_mY8awDmiIynw2BnO-fOqfw-xw7CBWYg0-g>
    <xmx:YYQEY80N9Z8gx-bBx5cGZfaDkR-fs9mm2IwJ7oiGzdK3wMYMKJrF2w>
    <xmx:YYQEY5uqn0Xk-fUMxQg_ZL4pf00-k8bBcS3ACDrCFLFZdaavkLOgPA>
    <xmx:YYQEY9jMn7IoxC8fY8cndGpfdtmvbq8SDGxq76Q9TMQ7lZj2-zWdJw>
Feedback-ID: iac594737:Fastmail
Date: Tue, 23 Aug 2022 03:40:09 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: =?utf-8?Q?=E2=80=9CBackend_has_not_unmappe?=
 =?utf-8?Q?d_grant=E2=80=9D?= errors
Message-ID: <YwSEXonOg1CMzeQv@itl-email>
Mail-Followup-To: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iWaubkXInM1xFKXz"
Content-Disposition: inline


--iWaubkXInM1xFKXz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Aug 2022 03:40:09 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: =?utf-8?Q?=E2=80=9CBackend_has_not_unmappe?=
 =?utf-8?Q?d_grant=E2=80=9D?= errors

I recently had a VM=E2=80=99s /dev/xvdb stop working with a =E2=80=9Cbacken=
d has not
unmapped grant=E2=80=9D error.  Since /dev/xvdb was the VM=E2=80=99s privat=
e volume,
that rendered the VM effectively useless.  I had to kill it with
qvm-kill.

The backend of /dev/xvdb is dom0, so a malicious backend is clearly not
the cause of this.  I believe the actual cause is a race condition, such
as the following:

1. GUI agent in VM allocates grant X.
2. GUI agent tells GUI daemon in dom0 to map X.
3. GUI agent frees grant X.
4. blkfront allocates grant X and passes it to dom0.
5. dom0=E2=80=99s blkback maps grant X.
6. blkback unmaps grant X.
7. GUI daemon maps grant X.
8. blkfront tries to revoke access to grant X and fails.  Disaster
   ensues.

What could be done to prevent this race?  Right now all of the
approaches I can think of are horribly backwards-incompatible.  They
require replacing grant IDs with some sort of handle, and requiring
userspace to pass these handles to ioctls.  It is also possible that
netfront and blkfront could race against each other in a way that causes
this, though I suspect that race would be much harder to trigger.

This has happened more than once so it is not a fluke due to e.g. cosmic
rays or other random bit-flips.

Marek, do you have any suggestions?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--iWaubkXInM1xFKXz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmMEhF4ACgkQsoi1X/+c
IsHnxQ/+IPIs20JGMzdfmqTChAVu4ufQ6b5v9SR5xpILd69xIDKAaHu9a/D//yfQ
8RHbM8UwJ+38qYVKz5ZLib3ooYJIe/sEhwqGnpG8Rb48zh4VBmNsWbUhpldv4CtY
usQrbYpWiIctRxo+bJUeoAxEYLD26ivoAAp7LLUGXI1xm4G787Aq38kPh0hEPX2+
mHp0tUHfofLYmPujFrayqso/WWTCReYWuHTS6s2318d5dNQh71eCbcrr2wljjPv2
rfUnnaPyg13bH12xAQF0Qgn0c1760VclvhMCzx5MUVcK32F3Uuj3QM7/JPC5JWuj
EmwzvERFAXdBggHoV+ZHwV8Y8xxbkWMgakrT6ULjyFVgn1SGIaQkiZ/y+RoAZd0L
jOXdB2gp76S/owA5tSSw0P440F3GBjrrp+s/StuxYh3zRKCcgUyEEJATsAkEg5P8
d0M537LFxK6lMMJH60LgLL3Xc6IkbqhO6AXqN8TxyiqOJEPBXMOT+onNPQwHZBCp
5WaVEQ2ca41QbDjlMxEAiPLGjuHHuOwPCG7h35wRKxIl1//wc2VQL81wNmfgk/sd
DqrnuFwMi+5NC6rQ7egLo7s3qnPTlhtYoMr1Eou1cISesjpWSmXn+1ROPDYTNVFt
xiyV8M8mbNgu0oAOeiJu0yUR12qrgAnFU12zJQsvFAcLBlZf0rU=
=aJ5I
-----END PGP SIGNATURE-----

--iWaubkXInM1xFKXz--

