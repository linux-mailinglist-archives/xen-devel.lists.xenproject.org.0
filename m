Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B0B67F0E5
	for <lists+xen-devel@lfdr.de>; Fri, 27 Jan 2023 23:07:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485978.753444 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLWry-0002Ir-C3; Fri, 27 Jan 2023 22:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485978.753444; Fri, 27 Jan 2023 22:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pLWry-0002Fb-9K; Fri, 27 Jan 2023 22:06:50 +0000
Received: by outflank-mailman (input) for mailman id 485978;
 Fri, 27 Jan 2023 22:06:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z+bZ=5Y=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pLWrv-0002FV-Qk
 for xen-devel@lists.xenproject.org; Fri, 27 Jan 2023 22:06:48 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id df26c746-9e8e-11ed-a5d9-ddcf98b90cbd;
 Fri, 27 Jan 2023 23:06:45 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id E23A732009BC;
 Fri, 27 Jan 2023 17:06:36 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 27 Jan 2023 17:06:37 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 27 Jan 2023 17:06:35 -0500 (EST)
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
X-Inumbo-ID: df26c746-9e8e-11ed-a5d9-ddcf98b90cbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1674857196; x=1674943596; bh=TPBEW+uosa
	jbirowMp+jxKXraQdttyikIIaXjbTbDB4=; b=vKA95+vD+TZtLXUoXaU9BBrozP
	4dCxrxxKxnN7h88FlBZpiC/SIfFMg39I3jkG75FgjsLjSGIUOl0NBwxfV26J9ieI
	je6jNQf7G80WtS3Fsnaki4lrXpKHDB3GNaibgMxCfJDe/k/SqMEshYrcn/1akesj
	g3IibY5pM5qtlLK2K5QpVy8MGjGY7Vs2/ukZvVHc0jM22faNk/cgWP9ipu/m2swx
	42aXf1CefxttCSOQncVXGua08O3/2+Xz187Aw9Qrkhck68z3FLzqCqOzgqV80J9Y
	f8JQkP7SkDmlE3tm1Fq92kd+3B5Gs4idA+Px5wFCXlNAp/RpSzP8SbbCZ/xg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1674857196; x=
	1674943596; bh=TPBEW+uosajbirowMp+jxKXraQdttyikIIaXjbTbDB4=; b=p
	CiQBL4Vu7YaQHF1aDsbMqLYdl83dzb9YW8yfBilrgHK7hcPBgLg//yjY0L0ilSt7
	KKeCA0AXBO69bsIzyrCXAiG0OtyvmdzzIts1Ud15ccqf/R9ZMRRQZECpJFT46Oyf
	q2kzvJKbxoszPhSunHShb4e4HAZ9rJ8+0ECvYz5oBJmZC/JdoF3IxpxZ7afreLe+
	o+2/E7qCOfMmmENohkPe9bcKhCHddrqpemLyM1tpZzMtp8XTbIqDGt8RGAMiLLkD
	VJf84rPX3EL7FhLlvEZOR882TtMn1N316/VXxCIqOQKVTQxdfA12vkwPYZrYBLdS
	zYLQ38/6YIMHEZ7tQPWig==
X-ME-Sender: <xms:7ErUYyAPNPx49IYJnWPrsLDq4XVjUHa8ET9a0XGJt6Ao69qR4p-AbA>
    <xme:7ErUY8hMNyErpTSV1tJ0g8Fk6aRpPIe8J-u9GvxHUUTSwz3W7OeH8LlcCZgedoXdV
    sM6TOVHHMCB-nE>
X-ME-Received: <xmr:7ErUY1m5RwO7NeUbZ0tdz97692yS8UV7RCd_J_x2Ssko3pvmeb72VYbcEJU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddviedgudehiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfggtggusehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiiedvfeevvddtgfduvdekieekieeg
    heelkeetffefjeekfedvgffgtdejveeljeenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:7ErUYwxN_ybDKMGOqrOmjW8tc7WcDwjr67PFK-D-wIeOg8sn3rGLEA>
    <xmx:7ErUY3RaQKUDWP9ML3TSq898ACPqEbSC4r5zjwPT-yVxLgdZCiE81g>
    <xmx:7ErUY7ZXgakXuBI15ZRYJhpAe42DtW64TaYxtEAjRVG4rmA3fOSz_g>
    <xmx:7ErUY6NQfWFYgKxpLPfiH0cXgZNUMl4RFCpQI4wo8qtytlnNMTr8nQ>
Feedback-ID: iac594737:Fastmail
Date: Fri, 27 Jan 2023 17:06:29 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Regular file support in Linux blkback?
Message-ID: <Y9RK6cf2Hu9vQRqN@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JgBqpPnRKPLzKWek"
Content-Disposition: inline


--JgBqpPnRKPLzKWek
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Jan 2023 17:06:29 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Regular file support in Linux blkback?

What would be involved in supporting regular files in Linux blkback?  Is
it just a matter of using the call_{read,write}_iter functions for read
and write, and punting the work that cannot be done asynchronously to a
thread pool?  Or is it more complex than that?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--JgBqpPnRKPLzKWek
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmPUSukACgkQsoi1X/+c
IsEQIhAAj84mXFmQ8iojEvwh+xC9AfAEgY0m87RnVfj4sFqiOWPZ4QK9uMApgp/R
pTVf4sjcSqtPgNMygAwLdWtJA56U2bhnJDyWYYLTBGuwgsD6P+lKEKpOulF7qebM
Tl85A6LYLVjoOr+QkprMHQC52TdIjtOiygTaD/VoaYe+FdzsPJaHRei3a8K4YmCv
ooxcyJLNbYhpZi6bJNMyZG3CunEqK/QY/A57Rl7rYxEyils9o1uZhVF5fg+T9K6T
weC5AJoPjLM4BRDsEugxPPJAhViusyF7Nbaa5r5ePDUIDgDJzD0aBAyj188SK3B3
moAIhrJbOAhphBpWSu/7d3Kz9YyuUt6mhDiUGpBblxR/OapSJeF89vrXAefqkBci
TMTUN1v6qGwfdMVl/kJNxSPq8nGOp410DsH9fGkUboMzo3awLnOOQCm2yKOLq9oU
uyTyOzprQGzOujrF67rqEBEmHHojgcmSUug7Ndk8YsBuTSvs1FoM36Fwp7GN7IN0
U9Jxtdz+HTxTJLqey4DE9Cj8xvet11eFSKfVRkJx31x1CSpKc1img0bN3sF/xijj
U/ZLa44VHZzsK+Jk8PAoYbHF14DWiY0AfHMd5MXd8nmiUcFhAbfaXy5avyySEXtB
kxjmFXZ0WTt9lJeJO+a9iY4fzOlWqf4h9Vo3TJ0kcO2f7fh5+7s=
=XMPn
-----END PGP SIGNATURE-----

--JgBqpPnRKPLzKWek--

