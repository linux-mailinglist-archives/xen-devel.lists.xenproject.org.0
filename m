Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A2E92F59F
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 08:38:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757783.1166918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS9v0-0005xw-86; Fri, 12 Jul 2024 06:38:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757783.1166918; Fri, 12 Jul 2024 06:38:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sS9v0-0005wP-5U; Fri, 12 Jul 2024 06:38:10 +0000
Received: by outflank-mailman (input) for mailman id 757783;
 Fri, 12 Jul 2024 06:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GSxy=OM=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1sS9uy-0005wJ-S0
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 06:38:08 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b81d741-4019-11ef-8776-851b0ebba9a2;
 Fri, 12 Jul 2024 08:38:06 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 50.5.0 AUTH)
 with ESMTPSA id Dbccd106C6ba1WB
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 12 Jul 2024 08:37:36 +0200 (CEST)
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
X-Inumbo-ID: 4b81d741-4019-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; t=1720766260; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=mljz1yQlZSPpbSf93uu32lEDGyb98eIcGdijMpZPIshu4wyTZr46dq0rk3b+CbFBFT
    ziqRFDY/ag915vFfKHtp9Qt+oDMrYBp+b6xNuu5DzdDnSQOMlp1YiZ44HytAQPJRJphQ
    zSFV8yrVpkBJN2YI/YH/nzIIpOMSBaOAEws0N5Qjt0Rn3Squd84NelGf6PXo3EPy2Fcu
    /H9b6EZxUjiAurDfRmoAWTFM+kqVaFqhGFz6UiygullaxmxA7P0UqT9gRWaK3BT2FmQH
    0iCEk/gVJn+G70/cqmbxTVdOHaRB5vzhqzuwjWLXSUE0IkRtu+6QLAT1bqBGJMmOsGXs
    Jecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720766260;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=rbqW7y8oG+GFJU7taOIL3A5vB9h4QDPT1Qgt1/xkRAY=;
    b=nQ4O3vLOwMMa+ESqrOyPwTjmNJpn0gBRCI7kVQGsdWrHz1Nn5JYFPGyfzo4A2D7oqu
    f9WS4ZBm1jc/TLSVMPvgK4dWo6PlTP6hHOHooGkDCTsyx0yowdWaNSipeVqAx+DWHguW
    5gv3YbwGq3EwyvdML1otsZQ9m6KD521bJ4yo8B2R8pYsHo5qHw76A9ehfq2dzYRWu+bQ
    k/8SsT8tONzn0fB4Wh3+1UfY0N9j8mHRkCCkmm3wN8cGtK2SwefOw6KEzG0iM0mlAswa
    7XKuWr7GldVnQpp0aENVYdUWkS9Oj4GDlOK6gl5gyj5qpyvpWUBKRdmn1CXxkr1AN870
    a4dA==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720766260;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=rbqW7y8oG+GFJU7taOIL3A5vB9h4QDPT1Qgt1/xkRAY=;
    b=GYxfvzv1hJKD5QQRqTumewjy8WsKlIH/ffzrdTUbltob79GA10uILNZoRy8q8cBa/+
    2TMEe+Ge8KSQ09BHrjRiWt03AWoCdap2A1/kNDe3s9SD+/uM1nP3FdPC/goJkQHvZo56
    2SP2bofg9S0EhSf0xSJ6O13tCdDRjzcHHGNfwZ2mydwNKAIq1DPRoWuu5YbczAF3Bavy
    nMfp91ZNypt/iFpOmWblRqavTup6/4UYbfaPyMVWPEWC2EAmM/YZ6M6nKETi5Ev04lX5
    RqvkuCYncL0q3cY+8ORpIf/1y9SARXWINZ6MXhTzWHiGuomm1Y4CUbKsW4Lu/MlLdwxt
    6hpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720766260;
    s=strato-dkim-0003; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=rbqW7y8oG+GFJU7taOIL3A5vB9h4QDPT1Qgt1/xkRAY=;
    b=zSp/+XgWr8APHyMl0QrN0sz3I84+xY1Mq44ZpG1jJeUZLYCp0uAnjphFsGM39dEM50
    wfhmCxU7grqtbFGAadAQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisR5BkKIOBzsrQFE/ZQyiRRrPkprT4fzoKOdWSb+rw=="
Date: Fri, 12 Jul 2024 08:37:29 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Anthony PERARD
 <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Roger Pau
 =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH 13/12] CI: Refresh OpenSUSE Tumbleweed container
Message-ID: <20240712083729.1374ce8b.olaf@aepfle.de>
In-Reply-To: <44cc71ca-00b2-42a8-9dc4-bc0b6f1df6d0@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
	<20240711202337.3128473-1-andrew.cooper3@citrix.com>
	<20240711234925.189e16d5.olaf@aepfle.de>
	<44cc71ca-00b2-42a8-9dc4-bc0b6f1df6d0@citrix.com>
X-Mailer: Claws Mail (olh) 20240408T134401.7adfa8f7 hat ein Softwareproblem, kann man nichts machen.
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/sB=if5wPO7C.SUZtIdOdLyJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Content-Transfer-Encoding: 7bit

--Sig_/sB=if5wPO7C.SUZtIdOdLyJ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thu, 11 Jul 2024 23:39:42 +0100 Andrew Cooper <andrew.cooper3@citrix.com>:

> configure has to cope with distros taking different naming decisions,
> and while I appreciate that packages may change over time even within a
> distro ...

configure does "pkgconfig --exists something" to probe for some API.
I'm sure noone will rename the pkgconfig files, "something.pc" in this case.

> ... this is just a differently-inconsistent list of names, with some
> very dubious aliases such as `form` and `menu`.

I should have truncated that list of names, 'pkgconfig(ncurses)' and
'pkgconfig(glib-2.0)' are relevant.

> What makes pkgconfig() any more stable than the main package name?

They are supposed to describe some API, and in some cases some functionalit=
y.
It does not matter much which package provides the API.

> Why do we want to be treating libraries different to other packages?

Because there is no other namespace to describe functionality.
It was implemented for pkg-config, it exists for some cmake and perl
modules.

> > python3-devel is "special", can be used as is. =20
> As an aside, I looked for a python3-minimal or equivalent, and couldn't
> find one.=C2=A0 I take it there isn't one?

I think there are libraries compiled. There is indeed a 'pkgconfig(python3)=
',
my search just failed to find it. Otherwise, if there are really just .py
files in the tree, 'python3-base' is the string provided by 'python3N-base'.


Olaf

--Sig_/sB=if5wPO7C.SUZtIdOdLyJ
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmaQzykACgkQ86SN7mm1
DoALAg//W4Jv8u6wWm0vCCe7Cn9Cgfhofln54CrScn0DsQ3pz+TertfM+6Xj3k5Z
2pw8hEZGxA1xH+L29Qf9O2MpahFc4qYduyx850aGPbpMCTiTSm8JgYh28G6vARQZ
t7wVvafnOuOCK3l8O3Hb7d+MJC41JI0BAm8JqftdOWk2GUaUTNlj4LDw2tc/zeEp
DQKcc5mQI6f+ZygWC3n5NespjJNAOZlJFtA6TO+R4WFcNFVdVPQYBZpONX2EvXek
SmN8G4uHBePIRgFf/Ip5QmC6RoeXMXLnNjVfkj0EfXWFYNzkwyC03VcpxOv1O6Mw
qn9veMXOqxh+ZvexaaTMFRkkhCn/lgMaHkXZ41d+RRR9MYO1k0sT6Z3OIMUyagSy
5q6OHW5FJpxtXvrSdAkeqQ2gp2PXRRf82hmKb6q4cmqw9lOXPPPE1P2KHx7oMpeV
bmtYlysQOfiTspcf056Fu2Ultqy75xuyvKfhhUWgAFwPEtmH1nfBalY9qZBiRkKS
Ufk99yqPMKvVZefB5tbGah2gNh/uHmmbU1/ph5JCfAGkR+uVKoUni1vC+XESkWkD
zrYuedPJ6EdiNswbXKnrmh5NjMTfVKOt5kXqI5JSf4QepQyAS6QXzp/z/3lqkMe7
kd/H44UFoRl8C0uSH8dKPtWNCGvsQO3CAsSkdZB1rKKj21GOE8s=
=PGlN
-----END PGP SIGNATURE-----

--Sig_/sB=if5wPO7C.SUZtIdOdLyJ--

