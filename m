Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C76A6138F54
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 11:38:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iqx5P-0007S8-7o; Mon, 13 Jan 2020 10:36:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=boG1=3C=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iqx5M-0007S0-Gz
 for xen-devel@lists.xen.org; Mon, 13 Jan 2020 10:36:41 +0000
X-Inumbo-ID: 93ebfcee-35f0-11ea-a985-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::9])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93ebfcee-35f0-11ea-a985-bc764e2007e4;
 Mon, 13 Jan 2020 10:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1578911797;
 s=strato-dkim-0002; d=aepfle.de;
 h=Message-ID:Subject:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
 Subject:Sender;
 bh=srcUxU5L823y+0IIB8vyTKA9pNJDZ1TvSqzqE+NWBQo=;
 b=OhOWCqrlGIzn+XvAYCvhSUtO9D8T7Qp7rIKO/4mnIS9Sc/J7gMB8WqnQZXJJ2o7KM1
 AazCIwDFNzoDVxUlxUXCodM0FbQ0UIrfma4zLAGbvx67DFgT5di7GQtVSpbHUY4+IU95
 /bHg4gWcipDSKj0j25BfRH6o3EjzYST+JPJeG1wnkVQCEjPxCAkgqcElS4P4yB6D4dxA
 YbHI8yAWMQFaxU92BTMu73F4VJN3kPTxp1TgIj/zX9wV4xarZCuIicEHPhh6ILsrwBWB
 Ujur10i7qyaGWLrqB8/ifeMakgOTqfo6/aq1lrG1xEtkxBrcAttkc1N/joSuJVWI9Hv0
 gTjw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuY8phYg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.1.4 DYNA|AUTH)
 with ESMTPSA id j08473w0DAabF9o
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <xen-devel@lists.xen.org>;
 Mon, 13 Jan 2020 11:36:37 +0100 (CET)
Date: Mon, 13 Jan 2020 11:36:27 +0100
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xen.org
Message-ID: <20200113113627.08786ba0.olaf@aepfle.de>
X-Mailer: Claws Mail 2019.12.31 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: [Xen-devel] live migration from 4.12 to 4.13 fails due to qemu-xen
 bug
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
Content-Type: multipart/mixed; boundary="===============1698699879911430258=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1698699879911430258==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/QyZvMRQ9DejTfYt0McO3zva"; protocol="application/pgp-signature"

--Sig_/QyZvMRQ9DejTfYt0McO3zva
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

I did not find anything in the Xen 4.13 release notes, so I'm asking here:

This HVM domU fails to live migrate from staging-4.12 to staging-4.13:

name=3D'hvm'
serial=3D'pty'
vcpus=3D'4'
memory=3D'888'
disk=3D[ 'vdev=3Dxvda, format=3Draw, access=3Drw, target=3D/netshare/disk0.=
raw' ]
vif=3D[ 'bridge=3Dbr0,mac=3D3c:27:63:58:ca:35' ]
builder=3D"hvm"
device_model_version=3D"qemu-xen"

The receiving qemu fails like that:

char device redirected to /dev/pts/3 (label serial0)
xen_ram_alloc: do not alloc 37000000 bytes of ram at 0 when runstate is INM=
IGRATE
xen_ram_alloc: do not alloc 800000 bytes of ram at 37000000 when runstate i=
s INMIGRATE
xen_ram_alloc: do not alloc 10000 bytes of ram at 37800000 when runstate is=
 INMIGRATE
xen_ram_alloc: do not alloc 40000 bytes of ram at 37840000 when runstate is=
 INMIGRATE
VNC server running on 127.0.0.1:5900
qemu-system-i386: Unknown savevm section type 111
qemu-system-i386: load of migration failed: Invalid argument

Google does not seem to know this specific error.
In fact, every upstream qemu-3.x fails to migrate to qemu-4.x.
Does anyone know what incompatible change was done to qemu.git?

Olaf

--Sig_/QyZvMRQ9DejTfYt0McO3zva
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl4cSCsACgkQ86SN7mm1
DoABJQ//RVMt3WtJiOkNNRqA0md3Gy0IiyNMOt2xfSm/e6SLdHgxJZJoIZYRBeYk
MHHB7nL4DKtFThuwjYNLJ0h+63m/HbzTiCeU+ye+TWz3GQrd9d00voobB7Htd4aG
meA9SGoO8AIanHkO49bCZ47YQCmNLM/RldZXc5A7MCAPFIlaowKaVZ6cElvP6gW9
fgQKBRXM6J6fk1FFoGQARZAN6+xfZXp6fld4+aWJ59bQoOmYb/ht30eQ7G4ctuw/
roOawHoT/9CTf20gyIrv9NQ5qAsrjVkaE9ABbFvO9ssA0aJOdYnCkwvJosTlLY7g
cx0x9TORErLHrvMm04WDsEBwzIdDNhvdw9xveyRp07qb+gY0duQIWODP9sCfq3xu
xqcCDJoAOQG9JkVbAIW5PZvpRIic+MVZ8b0Q8q77IzLxXjlHrEaA0C09RYCTmQj1
l3iWVKf0dlePVoLrUdpoKztW/RtBjAEqlDXui4osizekEyLPK7vQ5htb3bSV8EgW
aFUjzC5x2usC5JG4GYH8x/mvIW3pyDj4Fndmyngx0kZUCbcOydCkp8VyTsRTeLhi
HKquLY2RSyJSKw/okHcuSV9MBYQElypCwb4HczLwR1NofJc2vSj0rw7GwB1Meu7V
574syKEIl1NxJW5CSkdsF3nlMCzBjc4X6A7AdlTgiqlUS1/dM90=
=gNY5
-----END PGP SIGNATURE-----

--Sig_/QyZvMRQ9DejTfYt0McO3zva--


--===============1698699879911430258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1698699879911430258==--

