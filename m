Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 520422CD046
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 08:20:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43133.77597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkiuC-000557-Os; Thu, 03 Dec 2020 07:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43133.77597; Thu, 03 Dec 2020 07:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkiuC-00054i-Lg; Thu, 03 Dec 2020 07:19:56 +0000
Received: by outflank-mailman (input) for mailman id 43133;
 Thu, 03 Dec 2020 07:19:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lmMJ=FH=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kkiuA-00054d-Ob
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 07:19:54 +0000
Received: from mo4-p01-ob.smtp.rzone.de (unknown [85.215.255.53])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 978cc648-d550-4ede-ad82-04ad26eb4d88;
 Thu, 03 Dec 2020 07:19:53 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.3.4 DYNA|AUTH)
 with ESMTPSA id 60a649wB37JkZ2d
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 3 Dec 2020 08:19:46 +0100 (CET)
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
X-Inumbo-ID: 978cc648-d550-4ede-ad82-04ad26eb4d88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1606979992;
	s=strato-dkim-0002; d=aepfle.de;
	h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=JpCtL3qbfGKidI+NEmgXGicjB/JyJQLZXBgAfjzf7ZU=;
	b=EYtmm0EDHwoCwSLrv2U7sL/3QIY19uqzLs3DB9Ry/cu/L4Vu1CLn5GoIJPTbbzMnTt
	ghbmFNIhlAOsza1CEWY6XIVT6phKPv47611UWBvpY+/nVJtRle8J4+qEMecE2MyvhvXA
	WtaGZ2eb1g+RbZwPeeq0YA3L8V2r1+ygdX8ZrPWKjgb+10h29EJ81EZiR/IIhEtQeYZ6
	WV2f9yk62Zd2VMt7cldjkaSkNHedTlMMGlQZxcqh+ED+e/jzW98HTYiGgyh0femmXVFi
	Q2guXVgkH5RZWMJBGtMTG+lyQDEkCZa5vu+4pkV2u6Bau9YdTxHyfJsfVpbHjyKY4Q1h
	sikA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+uX"
X-RZG-CLASS-ID: mo00
Date: Thu, 3 Dec 2020 08:19:39 +0100
From: Olaf Hering <olaf@aepfle.de>
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
Subject: Re: [PATCH v2] tools/hotplug: allow tuning of xenwatchdogd
 arguments
Message-ID: <20201203081939.7265ac3d.olaf@aepfle.de>
In-Reply-To: <3fc53e0a-c7b4-4c56-9ba8-0b0a55c10f50@suse.com>
References: <20201203063436.4503-1-olaf@aepfle.de>
	<3fc53e0a-c7b4-4c56-9ba8-0b0a55c10f50@suse.com>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/IIE1r9olYuIgrzDFlnEO3q4"; protocol="application/pgp-signature"

--Sig_/IIE1r9olYuIgrzDFlnEO3q4
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 3 Dec 2020 07:47:58 +0100
schrieb J=C3=BCrgen Gro=C3=9F <jgross@suse.com>:

> Could you please add a section for XENWATCHDOGD_ARGS in
> tools/hotplug/Linux/init.d/sysconfig.xencommons.in ?

No. Such details have to go into a to-be-written xencommons(8).

There will be a xenwatchdogd(8) shortly, which will cover this knob.


Olaf

--Sig_/IIE1r9olYuIgrzDFlnEO3q4
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl/IkYsACgkQ86SN7mm1
DoBS1g/9G0hcHBXQ7TX/+gJu0C+Enrt2yj/CZ30M+ZTajY7g3uDBzwJFsq55vNpZ
MS3wxRYlpvpT+khPQ3fFJRQOa/9xSAascyAjpgXjrOQ3l8ixCi548HDdzXZYMaWJ
ShdIqvtP5ROrUO1K74Q1bySajoLbAnuD6ni3s/boE42kM/tBNMUZYFjlEWkhMH3U
dJTTRnrvyNIdWz9CiQ9SGL2B3LSk/mIvHYaAwNOnJy4xIzdR+dV7Kp1iAoxU/ekM
KAzm4nFdZSV1ibMkcYmvmd7y8BQOovVSyQkFL6p8bRSE+FN2p/oNkgoU3BUnGjQA
wav0k8z/UCykrCyFmcgOePGbaSG8GdM6JPYbG3F/aw4GbduwaSbirfIX+7WNkCbV
VanmutKmPLT2pNghd+ZAiD7txskowQocNjkYv17FXKvmROzgTBySm0L94LXm9h2a
j6OFStr6tvYME1j5sPcfsNFzZpCJz5XtV3QxzpVrZX/dsSHKOZfUIC5/ZNFWCX7V
OhP8aCw7SGbnPxheozDEnesNUppYmQPCYbEwHKQ3EHuO31J5SoEZFxmCHqHhLDpv
lPUw6Hsslaxzqs1A7jxOaV0dMv0Kifz6cGPtvqYFXsIyvxOxVlilB5lbLO11YldQ
ZmwLxcMc7oPiDaDXSRXb8GDDtP1xgrMGnTI+0qLxdwKfkenbQew=
=JEwf
-----END PGP SIGNATURE-----

--Sig_/IIE1r9olYuIgrzDFlnEO3q4--

