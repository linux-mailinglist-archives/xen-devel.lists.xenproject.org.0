Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4E56029F7
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 13:13:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424860.672603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okkWd-000271-2D; Tue, 18 Oct 2022 11:12:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424860.672603; Tue, 18 Oct 2022 11:12:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okkWc-00024W-Uo; Tue, 18 Oct 2022 11:12:46 +0000
Received: by outflank-mailman (input) for mailman id 424860;
 Tue, 18 Oct 2022 11:12:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XTa7=2T=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1okkWc-00024Q-4F
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 11:12:46 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca058cda-4ed5-11ed-91b4-6bf2151ebd3b;
 Tue, 18 Oct 2022 13:12:44 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 48.2.0 AUTH)
 with ESMTPSA id z9e8dfy9IBCgpG5
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 18 Oct 2022 13:12:42 +0200 (CEST)
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
X-Inumbo-ID: ca058cda-4ed5-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1666091562;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=LtcbZ9Iww575aSLIrkBg79ikIdVbb2hej8vnSDJr77Q=;
    b=tKE5Cc6UXOo5coTpnKDUbm3BwCfN7cKEPctjvIR10G6e0MBvSyOYtJTaU9QznPhJlm
    k7DW/yzD4Z30scpzGT+bNLMOPnkKWxlmeLJHOQT8fcZqiBUfY+xp8DbXkV+mtq9Qc2aP
    sVKSTK1jMtIre5IqM09ZdSm5CSX7XOtjlaywy2gUlt0bqNXg9Ldcn6/ZgFYYZ3yIDSIG
    5ela96sFSVsuTIPy9PXgqC70a6WsxITox1JVLF9TGnyG4AiBDdU0E1jWhbexbBoAMjSK
    Tmpg3TLY3B2muIWFVCHqIy9taktTWloTW7cIAMRb9jUf1oPSPN65e7eIB/4r1zZoCAf+
    xieQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX2j/OiDv7LX1ITFkr8sRtLhQJY8wcRJ+GvY"
X-RZG-CLASS-ID: mo00
Date: Tue, 18 Oct 2022 13:12:35 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Denton Liu <liu.denton@gmail.com>
Cc: grub-devel@gnu.org, Daniel Kiper <daniel.kiper@oracle.com>, Oskari
 Pirhonen <xxc3ncoredxx@gmail.com>, mathieu.desnoyers@efficios.com,
 rharwood@redhat.com, samuel.thibault@ens-lyon.org,
 debian-bsd@lists.debian.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4] templates: introduce GRUB_TOP_LEVEL_* vars
Message-ID: <20221018131235.5e70f0bc.olaf@aepfle.de>
In-Reply-To: <20221017103532.845293-1-liu.denton@gmail.com>
References: <20221017103532.845293-1-liu.denton@gmail.com>
X-Mailer: Claws Mail 20220819T065813.516423bc hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E6wAUjBaT41rYmMIlhKgAKC";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/E6wAUjBaT41rYmMIlhKgAKC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Mon, 17 Oct 2022 03:35:32 -0700 Denton Liu <liu.denton@gmail.com>:

> A user may wish to use an image that is not sorted as the "latest"
> version as the top-level entry.=20

Correct.

What is really required is some form of file pattern matching and to use --=
id=3D in "menuentry title" commands.

That way one can have the "latest" of /boot/${short_pattern} as default ent=
ry, in case there are multiple variants of files matching ${short_pattern}.=
 The pattern gets enabled with "grub-set-default pattern".

Based on this, I have to NACK your patch.


Olaf

--Sig_/E6wAUjBaT41rYmMIlhKgAKC
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmNOiiMACgkQ86SN7mm1
DoA4mRAAnXfdszjjzJS++3/9jLYMrjGScSHdTCxMkwofUdmS7PxjvHEI1Xofs0t5
IdjAT2g7brdzynpd2y1PDYAcs9OXI5lowh+qWsPll9OVvBFppQoyg6dzAAmue6N3
XWB8vyUgemZaLjphOsUkGRcFpafTF/8ChX8En+CkqLggDS6+wzGJAFnEL1lh5UuY
ZBvnNHThRZ1FXQa/EOnDsdIXlAgu4tIeo5F6BY8acpM4rDb6q9LsMvzanKOkJoqv
ckfurfIqvTjm76c+lmKJ5tcWsT/ouHuJ7BuRsWsyjAJ1dyw34Pj1LyTQ38DSP6s3
DBidiRbApGz0Dn2Fzn07QSx2hRXqYqR3C7O7/ATHwbVQNdxyc0PG9ggCPZT6RyfG
ia//22r1dNSE60Efc75Fbx2ru8MLokq1Uzf2GBfNPETF8IHTtJtCmAZs+9HVELbP
t7Ugwyt4ga1I/EpKYEZpiXQBMVFhIROynFSXS9guNFWf2QrlXTTMBWTr7/TJBlqt
s41KwF0SBNMD8rOs3rESwfyZjUTewaM1avm5ccjQcAVK87/CyBVXFbPXFIxRfWjg
ysR/zYQt/DiiUBinNSB+BRpjOeHteyJMFBKlsUX8WDyDRIF4jFsoYo4vHlywd97C
0BNjmZ4mypYVJXURcDHP5xs13aABYj2Q/9saYp1PONk+xtvvUY0=
=Myb3
-----END PGP SIGNATURE-----

--Sig_/E6wAUjBaT41rYmMIlhKgAKC--

