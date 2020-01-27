Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5A14A316
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 12:33:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iw2au-00019s-Up; Mon, 27 Jan 2020 11:30:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZsnO=3Q=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iw2at-00019n-5s
 for xen-devel@lists.xen.org; Mon, 27 Jan 2020 11:30:15 +0000
X-Inumbo-ID: 618e6454-40f8-11ea-9fd7-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 618e6454-40f8-11ea-9fd7-bc764e2007e4;
 Mon, 27 Jan 2020 11:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1580124611;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=G3QBfnTmIwujQxlFIYRYGjBiHLKLYZVK7AcVmig+Fu8=;
 b=hamdyORHsbKzgosHWBrIR3ooJt57/PheEOxgBzmHIVpMgGlRnAA3THGnjf28U3sfC0
 Uu13fIfgKBc+JauYI1C65VcnRorQJx1ENRNWdGAJPPFg4FktbR2WO+LEQbfu352PizM8
 TWni1sCMfq3Pp4JzPy1lhfqPnzObtLaWeII8K1mrodntsxPf8mc1xzN+IhcaLirGjprq
 8VlrDV31SnrwLvbounaeGqLgu0Hrt8ijtTYJ6uoioqKJRPJHc0GnOAvQzhSqE40WhB0D
 Q8rH5I1xTuTVlZ4wph8Gx4PvRZ6f8on91TQPYAI/xBq2KFhjuR2wuQkHM27QoghuueaK
 P4rg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.1.7 AUTH)
 with ESMTPSA id j07b1dw0RBUBCBL
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate) for <xen-devel@lists.xen.org>;
 Mon, 27 Jan 2020 12:30:11 +0100 (CET)
Date: Mon, 27 Jan 2020 12:30:05 +0100
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xen.org
Message-ID: <20200127123005.7d6767c2.olaf@aepfle.de>
In-Reply-To: <20200113113627.08786ba0.olaf@aepfle.de>
References: <20200113113627.08786ba0.olaf@aepfle.de>
X-Mailer: Claws Mail 2019.12.31 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] live migration from 4.12 to 4.13 fails due to
 qemu-xen bug
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
Content-Type: multipart/mixed; boundary="===============3194328737199180424=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3194328737199180424==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/vJ7d.qTgkrDDnbTEXi=0upw"; protocol="application/pgp-signature"

--Sig_/vJ7d.qTgkrDDnbTEXi=0upw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Mon, 13 Jan 2020 11:36:27 +0100
schrieb Olaf Hering <olaf@aepfle.de>:

> This HVM domU fails to live migrate from staging-4.12 to staging-4.13:

It turned out libxl does not configure qemu correctly at runtime:
libxl__build_device_model_args_new() uses 'qemu -machine xenfv', perhaps wi=
th the assumption that 'xenfv' does the right thing. Unfortunately, 'xenfv'=
 entirely ignores compatibility of "pc-i440fx" between qemu versions, 'xenf=
v' just maps to 'pc' aka 'the lastest'. Instead of 'qemu -machine xenfv', l=
ibxl should run 'qemu -machine pc-i440fx-3.0 -device xen-platform -accel xe=
n' to make sure the domU can be migrated safely to future versions of qemu.

Maybe there should also be a way to select a specific variant of "pc-i440fx=
". Currently the only way to do that is to use device_model_args_hvm=3D in =
xl.cfg. Unfortunately libvirt does not support "b_info->extra*".

Should the string "pc-i440fx-3.0" become a configure option?



I think this (untested) patch has to be applied to staging-4.13:


--- a/tools/libxl/libxl_dm.c
+++ b/tools/libxl/libxl_dm.c
@@ -1715,23 +1715,20 @@ static int libxl__build_device_model_args_new(libxl=
__gc *gc,
     for (i =3D 0; b_info->extra && b_info->extra[i] !=3D NULL; i++)
         flexarray_append(dm_args, b_info->extra[i]);
=20
-    flexarray_append(dm_args, "-machine");
     switch (b_info->type) {
     case LIBXL_DOMAIN_TYPE_PVH:
     case LIBXL_DOMAIN_TYPE_PV:
+        flexarray_append(dm_args, "-machine");
         flexarray_append(dm_args, "xenpv");
         for (i =3D 0; b_info->extra_pv && b_info->extra_pv[i] !=3D NULL; i=
++)
             flexarray_append(dm_args, b_info->extra_pv[i]);
         break;
     case LIBXL_DOMAIN_TYPE_HVM:
-        if (!libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
-            /* Switching here to the machine "pc" which does not add
-             * the xen-platform device instead of the default "xenfv" mach=
ine.
-             */
-            machinearg =3D libxl__strdup(gc, "pc,accel=3Dxen");
-        } else {
-            machinearg =3D libxl__strdup(gc, "xenfv");
+        if (libxl_defbool_val(b_info->u.hvm.xen_platform_pci)) {
+            flexarray_append(dm_args, "-device");
+            flexarray_append(dm_args, "xen-platform");
         }
+        machinearg =3D libxl__strdup(gc, "pc-i440fx-3.0,accel=3Dxen");
         if (b_info->u.hvm.mmio_hole_memkb) {
             uint64_t max_ram_below_4g =3D (1ULL << 32) -
                 (b_info->u.hvm.mmio_hole_memkb << 10);
@@ -1762,6 +1759,7 @@ static int libxl__build_device_model_args_new(libxl__=
gc *gc,
             }
         }
=20
+        flexarray_append(dm_args, "-machine");
         flexarray_append(dm_args, machinearg);
         for (i =3D 0; b_info->extra_hvm && b_info->extra_hvm[i] !=3D NULL;=
 i++)
             flexarray_append(dm_args, b_info->extra_hvm[i]);



Olaf

--Sig_/vJ7d.qTgkrDDnbTEXi=0upw
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl4uyb0ACgkQ86SN7mm1
DoDjXg//b6GlUcth1GhOpp9+o3seO3mdTVrkN0xg3R/e3u64mknWWQlxGfPHps1Z
3ITkWeJNNrHv1Ztp+7YAj8qWU+/d5BidovYuDpz4ECnsah94bBWpM+TZvOYY9dIS
hwlupTQoQWACcNjt/WFcW4oyoHZEaAChPunTTtkzwWw51w3AkOdwkvWWcReFGkPs
Gft3+nbSKVSxrPYKtzHazwjWxFWXqgPginkhYTWDG+07PS0gOodv205UefOIzVA2
Rhy1LJadc0h1/5lm4AweokLesIA1mQYMSUvnLoOCy9vWlRkeFZT6JKxzJzYQqKKN
63g0SCSM/DQgOwmC0HUInywOJU2jpWPw/1ll36WkGXBtwFjg5LmAHe4Do6u1EKay
wC+pcM7XQ5GK76g9LwkFRKzOa0xPQiuYhjtBqXejfSH190swpTGfEx27lfaht2O5
OhUaHEU/El3jWVACjD6ZJ7eImA1lgrgdeOB3scQLbOTmSpcoElyjakG6vp3/qtpS
q9NV9gUBhPAJM9K/TZuxqOOi6XvPFPfvn1DjGtVNph+UwIkG8c5UehdleIj/HRDg
R5U3TYq33XG0Jlb77vHuvSvNvuEHMDM95XRrZocsoz2ZZgmDrSaRySyWxduFjmHm
i4L8GmOSADGOKg72qPoyVNSM1BJIWph/MkPwCt6YHA/q0iaUPEA=
=mbgD
-----END PGP SIGNATURE-----

--Sig_/vJ7d.qTgkrDDnbTEXi=0upw--


--===============3194328737199180424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3194328737199180424==--

