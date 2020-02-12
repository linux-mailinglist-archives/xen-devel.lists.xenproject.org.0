Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F3215A728
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2020 11:56:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j1peF-0001HO-Hh; Wed, 12 Feb 2020 10:53:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1nZR=4A=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1j1peD-0001HJ-IU
 for xen-devel@lists.xen.org; Wed, 12 Feb 2020 10:53:38 +0000
X-Inumbo-ID: ea98e9ec-4d85-11ea-b0fd-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::12])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea98e9ec-4d85-11ea-b0fd-bc764e2007e4;
 Wed, 12 Feb 2020 10:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581504814;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-ID:Subject:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=iq+55xiw8Xtwxd+bPvYeqAm/A1Njm8XCejtqPeqNmBA=;
 b=TXihHRdtRk/C1PUcqoSpPYjBe2ErAuw8vaLE7+LXxS/UCWKtV7vd9VBU1wLOPBAOVF
 JZUY2JV5ybdwE8kaKIFutRdWCFopJzlofD4ZQzvNE9ceT7QZ1uKw4N19F7wTn5hSS5qQ
 ow8HYxpkKTm88350THT0nKKbPTrbuOrKztmGgPeMqt8NiF8WDwakWIDrux+AoTuR95n3
 iBdRuoBcIlnWw9rT2EzH0OwQIW/7nfuDAn2McDDjhInDqR7b7/XPMKlPfpRyFltDKQg/
 6RxfKQL9yUXECTVqTlfdO6q/gu9QcQA1z3UUK//ix7+JcrWZYme7gjFV5cfqTg4nv63o
 F6Lw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.1.12 AUTH)
 with ESMTPSA id 605caew1CArYoSf
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <xen-devel@lists.xen.org>;
 Wed, 12 Feb 2020 11:53:34 +0100 (CET)
Date: Wed, 12 Feb 2020 11:53:25 +0100
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xen.org
Message-ID: <20200212115325.12f2efc4.olaf@aepfle.de>
X-Mailer: Claws Mail 2019.12.31 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: [Xen-devel] reported memory usage does not match real memory usage
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3476480907078871117=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3476480907078871117==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zbfXY8=9g5zvz=h_9Xo5WPh"; protocol="application/pgp-signature"

--Sig_/zbfXY8=9g5zvz=h_9Xo5WPh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

I was made aware of the fact that Xen apparently loses memory as soon as do=
mUs are started. In my testing HVM domUs occupy much more memory than what =
was configured for them. The expected memory footprint for a PV domU seems =
to match the value in the domU config file.

My test host has 128GB and 8 cpus, dom0 is started with a fixed amount of m=
emory. Before any domU is started, 1.4G are already "lost".

It seems for each HVM a certain amount of extra memory must be available. F=
or a 100G HVM domU another 809M is required. With just 1 vcpu instead of 8 =
the amount of extra memory is reduced to 802M. With 32 vcpus it increases t=
o 834M. Apparently each vcpu needs 1M extra memory.


Is there a formula to calculate that amount of extra memory, is this behavi=
or documented somewhere?


Olaf

(XEN) System RAM: 131062MB (134208492kB)
 xl info | grep -i mem
total_memory           : 131062
free_memory            : 125551
xen_commandline        : loglvl=3Dall guest_loglvl=3Dall smt=3D1 console=3D=
com1 com1=3D57600 dom0_mem=3D4G

131062M - 125551M =3D 5511M used for just dom0
5511M - 4096M =3D 1415M lost?



pv domU, pvgrub2, mem=3D1024, vcpu=3D1
free_memory            : 124527
125551M - 124527M =3D 1024M, matches expectation


pv domU, pvgrub2, mem=3D65536, vcpu=3D8
free_memory            : 58990
124527M - 58990M =3D 65537M
65537M - 65536M =3D 1M extra?


fv domU, mem=3D32768, vcpu=3D8
free_memory            : 25957
58990M - 25957M =3D 33033M
33033M - 32768M =3D  256M extra?


stop all domUs
free_memory            : 125551


fv domU, mem=3D102400, vcpu=3D8
free_memory            : 22342
125551M - 22342M =3D 103209M
103209M - 102400M =3D  809M extra?


fv domU, mem=3D102400, vcpu=3D1
free_memory            : 22349
125551M - 22349M =3D 103202M
103202M - 102400M =3D  802M extra?


--Sig_/zbfXY8=9g5zvz=h_9Xo5WPh
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl5D2SUACgkQ86SN7mm1
DoCitQ//cok+jHU5bn465FU7LFVfl9iPLu3sU0rC2hdTiZ9JUZFXQpP2qqCWu7Td
X7TZG9TqDEOEG2eB827WhKwqeP7EcciZ6q5vrzdGento1dwrbVs3VgI9ybbreM23
Kncx4sxPXCXnn2aehICeUdyxGoj0JF6ZnSM06AcHZIaWP0yh+sus6R6puxqVPwT9
YmHxspWb1feYk6iDwtL6iAYxQpAWPdT12xjgJAYjEsRS2Z2ldVJ/J3Yof6w2pLhY
zn+GligF+g/ilytPiel0n3ZL5FdaSLzCf9QwnM4eCts91vA+rp40KkjkVdBkTsYd
luvHCcVsuiumXiRj/yL9ktpL6vbJAMyRcMRPrNKM5KDqbPpJewF9ZDOyBdsyHUsu
wkmBnENPKiZjs6RcbJn7guu4qe2HmJspu+uNx64VEcsT982JACSGcyMbsIEUar3b
JpAGVYUWcPucij5TAZXSvJi2a8WPu9kzmmJYCt0U0vWhioJc1umJpR6HSL8Y+1Fw
6bsdhtj+3jkNYtaoyNhYofPfltqsF8/vuQgnlv096fiqbbpuC/PD7MXAUIo4+lmg
HffQyYQwp46fKJptThAla0NbFoiIbxgfLmyrurS2Cn5DQAB06ph+s8uVm4CW6Xj8
6zhNNXGMo6ySnQCR5q2/XN9iFWFUmHog/HkfWYVGTXH8nbJUTdQ=
=rMGm
-----END PGP SIGNATURE-----

--Sig_/zbfXY8=9g5zvz=h_9Xo5WPh--


--===============3476480907078871117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3476480907078871117==--

