Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131E92741EA
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 14:18:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKhEN-0002RR-TJ; Tue, 22 Sep 2020 12:17:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Js2O=C7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1kKhEM-0002RL-Sm
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 12:17:11 +0000
X-Inumbo-ID: 2bd73ab6-4213-4899-90c2-c71ddf662483
Received: from mo4-p00-ob.smtp.rzone.de (unknown [81.169.146.219])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2bd73ab6-4213-4899-90c2-c71ddf662483;
 Tue, 22 Sep 2020 12:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600777028;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-ID:Subject:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=DWiDGc/gihJEg8RbgxtOZchNuEdysACsGrpTBrXJYXA=;
 b=c2ScpmLDQ6neUR2SdZCse2kcOWVjV9IFA47jyQAf54ROJAJQa0QZWEgpRZVfwKdPRE
 kXhi48YgNg9vMTiva2HvoKq/meLwgN4SfP00Td1JWTXOc64jwy8JHUcoDXh0eXMDa+rI
 xopkl8U/TZUFBbpUTMGMllNVeEkJAI3NKfYVG9NGf0wKLAJnCoBfETavyJatJ6/Mpt6g
 snm4R1Vk1gbWm4BWsXDYCzS68SXB0c2f6W3S6PtcX4XW2hCeJL7U+07hBFRX0inSIpJz
 nPkoAoEoSuG3Qx+GoT2Ac1RzBFwCbMQ/tOumZ406zOP9DFOVywvUuD24kAGX/JfZjXgR
 iFlA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDXdoX8l8pYAcz5OTW+n+/A=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
 with ESMTPSA id 60ad29w8MCH7E25
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate)
 for <xen-devel@lists.xenproject.org>;
 Tue, 22 Sep 2020 14:17:07 +0200 (CEST)
Date: Tue, 22 Sep 2020 14:17:00 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Subject: races in toolstack build
Message-ID: <20200922141700.4627df0d.olaf@aepfle.de>
X-Mailer: Claws Mail 2020.08.19 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/HBsdLm.O3f4riucIG0BF00p"; protocol="application/pgp-signature"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--Sig_/HBsdLm.O3f4riucIG0BF00p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

With commit 68a8aa5d72 the build randomly fails. Up to commit c7e3021a71 no=
 errors (like this) are seen. For some reason nothing below tools/ was touc=
hed in this range, so the bug may already exist for a while.

attempt on host#1:
[   81s] ln: failed to create symbolic link '/home/abuild/rpmbuild/BUILD/xe=
n-4.15.20200922T102230.68a8aa5d72/non-dbg/tools/libs/ctrl/../../../tools/in=
clude/xenctrl_dom.h': File exists
[   81s] /home/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/no=
n-dbg/tools/libs/ctrl/../../../tools/libs/libs.mk:82: recipe for target '/h=
ome/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/non-dbg/tools=
/libs/ctrl/../../../tools/include/xenctrl_compat.h' failed
[   81s] make[6]: *** [/home/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230=
.68a8aa5d72/non-dbg/tools/libs/ctrl/../../../tools/include/xenctrl_compat.h=
] Error 1

attempt on host#2:
[  178s] xenstat_qmp.c:26:10: fatal error: _paths.h: No such file or direct=
ory
[  178s] me/abuild/rpmbuild/BUILD/xen-4.15.20200922T102230.68a8aa5d72/non-d=
bg/tools/libs/stat/../../../tools/Rules.mk:153: xenstat_qmp.opic] Error 1


Olaf

--Sig_/HBsdLm.O3f4riucIG0BF00p
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl9p6zwACgkQ86SN7mm1
DoDXFg/+KZrKhzK30BXMlTPeKjkv+/i9fzQzq6l0iaR1iivh/KE/GEbdrdlrBTNN
5OT72U4sZijx1kdu6p/XA2++vIUUNBknm61JXNpKGGQBWZlfZOM0z5PzS8fDkshg
5Ku15wtGHvH/kBA8fxjg0C0mwCjJbWYUbcYQCyqNsb8CBtyAYQ0UF6kmhALy6n2X
/kwa9Dwkt8wK6YUI6B7Ww1i75yjfecOtP4PaE567GPHcyZSTg5PGo1rjNX0aqXcM
w+81N3JPE8uVkO292oRFx18Suz11c/YG8zRfOze97qbe0OwH3BikRmzzYwvqtBJ7
HmWm7Cm8/gIV4/ALWPP+eNNx0wcrwjwU0uXQGh4PpbK/96T5k5xmS9tIkvNPnB77
+ncEqLpLBez5sjK4zusXWO1ka4zFbijtB7NjMyf24df1HsN1UB+UFwVb/D3VZ+4S
QpMLsFgKnKcd7vWGlhrGVTAlafCg0SUM7b5aGDP/Vlt+VSLeBel8k9MnI7Nzn/7C
jiIokx1YR+clPzmVziBbDavA7jpC1DW6w2sSzn7lkU6r0WnHQKg6SzypPWafv5aH
kD6S7pTzSSBuJ8wWOOTokKBI4icj7lVLwNaBQi3GvOwz8II7YU1/aBNCVJWiMoQW
ln6i+ui4ebTdvw7HUSWh5Si0Xpe2Pm2sPrpZilSjMrYAiVrPI4c=
=2GXK
-----END PGP SIGNATURE-----

--Sig_/HBsdLm.O3f4riucIG0BF00p--

