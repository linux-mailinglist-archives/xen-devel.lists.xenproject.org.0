Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F08F3B94A2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jul 2021 18:24:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.148954.275307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyzTG-0003T3-27; Thu, 01 Jul 2021 16:23:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 148954.275307; Thu, 01 Jul 2021 16:23:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lyzTF-0003Qj-VD; Thu, 01 Jul 2021 16:23:21 +0000
Received: by outflank-mailman (input) for mailman id 148954;
 Thu, 01 Jul 2021 16:23:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lvjd=LZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1lyzTD-0003Qd-S5
 for xen-devel@lists.xenproject.org; Thu, 01 Jul 2021 16:23:20 +0000
Received: from mo4-p00-ob.smtp.rzone.de (unknown [85.215.255.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id deb8d0ca-a45b-4ab6-ac30-1b552949c886;
 Thu, 01 Jul 2021 16:23:18 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id 30791cx61GNH7g0
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 1 Jul 2021 18:23:17 +0200 (CEST)
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
X-Inumbo-ID: deb8d0ca-a45b-4ab6-ac30-1b552949c886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625156597;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=Vn+2Cg38JHefu8IRGLFILggWXxBZgWIPgtfWkr3bmLM=;
    b=IDY0PVhJXUOoCm9WsGq9/yjF/VTVf4T3uOdPDv7BA8XmrL9UNn3jbQARfHPrZeZM+j
    hYOs2SeTPGpNLdG2p1J+6514KdTXQ8vmnRnroxhzEBLuc31h4Ssw63/8UQKzTXlI9gAC
    tyCIgTs71fxdHHr0k8odhnGQKkkCUAMifi+S4BtkpSUjRW8B92sWTMPIWMqbQz9fC9aA
    Asiqjla9ZgLBwBnrao6osi+NmSpLx4OmWFXDwIxA0GjVZWyvd+0ZNlyfKsFICezZjgJW
    2oXRxFXtBWAgDaIt8k+K/h4TE/4c9yxfO4Cntn5QAtD0NE81AFIkf2m02CBkmvTGTg8k
    YbDg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsBBSIa03sY9BUY2ao0oygRsMfcqA6zjDLeeWXNg=="
X-RZG-CLASS-ID: mo00
Date: Thu, 1 Jul 2021 18:23:03 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: <xen-devel@lists.xenproject.org>
Subject: Re: XEN_SYSCTL_cpu_policy_hvm_default truncates leaf count
Message-ID: <20210701182303.53756e1e.olaf@aepfle.de>
In-Reply-To: <dc9af473-b613-721c-87b8-d259a2448c09@citrix.com>
References: <20210701125623.593fe3ae.olaf@aepfle.de>
	<20e828c9-e7dc-4401-9307-a6d72eb618d8@citrix.com>
	<20210701170009.5a8be33f.olaf@aepfle.de>
	<48cfe27b-70fe-36aa-833a-7d78e205528c@citrix.com>
	<20210701171819.67968d4d.olaf@aepfle.de>
	<dc9af473-b613-721c-87b8-d259a2448c09@citrix.com>
X-Mailer: Claws Mail 2021.05.27 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ZX8F8fCP.bKboWIEMyMZzaB";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ZX8F8fCP.bKboWIEMyMZzaB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 1 Jul 2021 16:25:10 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->extd.max_leaf =3D min(p->e=
xtd.max_leaf, 0x1cu);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p->extd.max_leaf =3D 0x800000=
00 | min(p->extd.max_leaf & 0xffff,
> 0x1cu);

Yes, this fixes it for me. Thanks.

Olaf

--Sig_/ZX8F8fCP.bKboWIEMyMZzaB
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDd6+cACgkQ86SN7mm1
DoBVgg/8C3Qwwaw/1t1Suul1ZLu8HXZ44bMfBfQjLkLWuo9+Gp/ixpMVrKUxGerL
g13cBrMpUiByf4C1TMn4s/SWNBUKcrnF8GlMwQCQXe0eSjxTGYVTMU51x+wTLUXm
I6YXzUdEo+yrJDdrFWcd7mWP3o69qfMTnnmMcjHsVStDTXrtjOxutGMPjwi1eu/Z
21mcH7OjMUeZlxr+g/msYwFWPOHROw7Uj/eD0HubGYKx+VGwpzc2poHcz9NKTZ9F
5rPsGhf35oEzhZWMkvN7XxdwG1RrP0ZP+F/WQ2UkGEQ8pVH8KLHykRpw3I8eLjhP
X514TVcOu4nJvONmbGVeMvMutGAPygoEuuBkYdO/VzlEe55impmaxXo1RYh18PZ1
Yo9x7X/TFwwG4B1n4axBL7A1twR35OklbIdLpsnhbR+FSWJFTx4PfIX0+qCVHyMg
ZxtWbz4o7Li5JO2AeRq0X9B2yY1AiV7Ewul+iO5mpTQlPAHOni4fZxm/WTaTC4VS
wnhJ3dwe4K4iOuWaQuRuWlRO/FK0cq/GRJ2ReVzuXrto8+WgFJ2GtaN3BCTdyp5Q
hA9vzqnKtIVhJAKkIiBN1HWCrqM5p2rCCM04Zu4jONq8/kPSBZHDHNy0hVrMqh7c
oRULMLBTMyeK2eN8YLY1UD2JzbYKlDp+EzJU7BP3rVOIzkPaOD0=
=lpa2
-----END PGP SIGNATURE-----

--Sig_/ZX8F8fCP.bKboWIEMyMZzaB--

