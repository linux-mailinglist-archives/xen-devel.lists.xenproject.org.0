Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E357FA7C8D7
	for <lists+xen-devel@lfdr.de>; Sat,  5 Apr 2025 13:12:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.938896.1339308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u11Qs-0000dW-R1; Sat, 05 Apr 2025 11:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 938896.1339308; Sat, 05 Apr 2025 11:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u11Qs-0000c1-Ko; Sat, 05 Apr 2025 11:11:26 +0000
Received: by outflank-mailman (input) for mailman id 938896;
 Sat, 05 Apr 2025 11:11:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzGc=WX=mail.com=hehongbo@srs-se1.protection.inumbo.net>)
 id 1u11Qq-0000bv-PT
 for xen-devel@lists.xenproject.org; Sat, 05 Apr 2025 11:11:24 +0000
Received: from mout.mail.com (mout.mail.com [74.208.4.200])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3ea3668-120e-11f0-9eaa-5ba50f476ded;
 Sat, 05 Apr 2025 13:11:21 +0200 (CEST)
Received: from localhost.localdomain ([60.26.200.33]) by smtp.mail.com
 (mrgmxus003 [74.208.5.15]) with ESMTPSA (Nemesis) id
 0MPn0e-1txBfl1p1G-00BMXF; Sat, 05 Apr 2025 13:11:15 +0200
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
X-Inumbo-ID: b3ea3668-120e-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.com;
	s=s1089575; t=1743851476; x=1744456276; i=hehongbo@mail.com;
	bh=35rpjIw3rvJ77kDrFNFnyrXV4+t5U6U23ZkCz5hAQ+g=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=cHcGflogW+2WhvqK0p/NcF6PKtQcNeaGU0PTzrzLYMbOJY+acmsFngyXa0lEevB7
	 I4Vk5jsJ2gnl1IobdQg4BgDqyqBpfsiYXKPtzXMuLFrzz30a3jTUUbD1L+pPd1Cg4
	 T9HXIjO0iE8RYt23ieriIDpQZ530IaXXd9Zva0GykKU7dHZq4SHBDCDB5I5DViZoT
	 mLIn1X0MTYvCnvXo+NGebkrQWhxTf5wLYin90jixFfrptc8mF+MEfRASTnsTKtJRm
	 GXfWu0kAHkmzg52RXzU+g09N8Fkw3lD9XXUouh8YyuBpz/kOqeev/90iSX68FSHhE
	 STyy3urtAseXudihJA==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
From: Hongbo <hehongbo@mail.com>
To: xen-devel@lists.xenproject.org
Cc: Hongbo <hehongbo@mail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2 RESEND 1/1] tools/libxl: search PATH for QEMU if `QEMU_XEN_PATH` is not absolute
Date: Sat,  5 Apr 2025 19:10:55 +0800
Message-Id: <20250405111055.98611-1-hehongbo@mail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241223031753.13709-1-hehongbo@mail.com>
References: <20241223031753.13709-1-hehongbo@mail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:mxojhmVDNe9q8C+1EcHPd0Dx7a/PlGzdzMfpIlWOQEfjeZeuSwM
 Nj/8ianMFB0fMkiZbm+FKnxYgKecQbhAZJY5vNe1jnxdRJ+ptd98MEPxsmY4nZ9KFx5/x5n
 GZ8JDXusie93JbNswK/0q1944xymJWK4T490GOl4zo4Lp9NcXzrN4Q6m2dow6CdlI6PP57Q
 KJxiIDuuFGF7NDVoBHDLg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sXq0PRCMVHw=;XodLUuNKekH1mSifk9Iw/Wq4cSV
 ekkC5IY8IXYFqcY2DdTBk4rCBYA5KDzKchjXVA3yFGRMQMz5kJALxneSpfAKCXe8zSCCAbXN2
 FbLy87chDaKDrhABgHsIgTon95CWZuHHV+jWbDgFImwZXZdIhekua/WEvq5SlPchPwIVVPHPn
 ihKd79r/Lx8ifVHa61iL2Mn2HmrWK8Jd1l1OCRx9aKk10iQRmxwvXvfxtP8LkyEztyHroKcXJ
 VIRkpzj0e5oaWWCnBdF4eVDtEc8AAwD5ypU8y4KegHtVfT4eVxXyMa8hZZQ6DznL7Ga+1wL+s
 9whZ5D2uRJ1jmY/qcbA/uDKq5m69u+/1HyLDTuROBfpO/AxGqEFKsEKO8rdhv+g5wuzI3DBUu
 XMdqbSrTCUMZJUwsV0KlvUZ1qjDvXEdB3HR5fpDJzN77hDaNCcvuj+RHT4ZG/u2GIVzsuu28M
 TbyLDlHyHxxWwOw54uBSPuwJK2Z0fMwUOShKbPsQX9uLJM64kl0S/IGH51Fqvzz1AJUv1B+sU
 4MVCiVCI/FLbFMbW5spZcRPQz6G//m1NHIXsdXmd+t5zk07tlN79NyeVawTCyLTuk0giN6Kzh
 HjP2/7BJRDq395YniXZIWVZp5Mpzfgg7Wp0ARxEX9ENN0mQ4VIHofIq2b0EDZ2a8HcHhMg8Vn
 TiHGRqzkxzzOaPhNLpizzVpeopnvLkoQWja+7e2fJC3UbWwNmIzRNXzCOF1Spk/KAupzg/e8B
 EIDkj0tOuajoI5j7KgoGKggOKjndqhHODram2KHL9vbJ1ii2IOYWF6cLWvEc9FDi1cadw67U+
 mtR7DQ/mbwECfOmFaZdklHI+2N3Ru7fkLl98z5is5IgsS40+C+EMBIVBVmMdyo1Fo0KpG0UAQ
 5np5FRA3q2gXzAWTarX+XM5zeNheqcfaVZdcVM0x67rmKxAkU7PPGAZKc/hUDIYRvwvT11Q9E
 GDb6TD7lbDHusSzaER5YGybvQrumlvrQToKoQJFVcLedvRZwIZ8jLsHPuyeTnyXP5oZT7Ku9R
 g1iscUEhedeSBQVXNp/mfg8wjUTDz+vh98wNb7FImwPQc2GG7PFIkeQvvz4rpoH2S2RizBEaU
 b9YHM7sLh5sKuFlqu61Hy0x4NvEs0V39uQFbs6ld4owI0wo6TaQPSNWZzhJnFi8EPZaTnyg93
 qfzot8AW1FxNH+UshlDBcAdyBTMvo/xOqd3YgkgGpAAXrAcMD+4ojrAGiZqU3MX5AgygmUjzP
 s3ZT6Tc5/dnLl3vgnsRcXdxowv30yeeWiD/9Rc2uH+c9aGnuJK11G3gbPpbQZ9qBo+OnB/ep3
 fUN20UIjuPy9QKk8RI7/JB8gf3FzCXoyIUFOUncv9PuTZGI0xBkbnSW1IGOEsdn7FkG/PJgWJ
 lhnWWEQ7l7sr1ZGbJ+hcYflwt7nqRP3HHyb0nTmnTlBBa+vF0x0hA4lWWPamTOhF3JbtR1gwD
 jmWO0ys47BJ/OQMfirr7QVmP2a60=

`QEMU_XEN_PATH` will be configured as `qemu-system-i386` with no clue wher=
e, if
`--with-system-qemu` is set without giving a path (as matched in the case =
`yes`
but not `*`). However, the existence of the executable is checked by `acce=
ss()`,
that will not look for anywhere in $PATH but the current directory. And si=
nce it
is possible for `qemu-system-i386` (or any other configured values) to be
executed from PATH later, we'd better find that in PATH and return the ful=
l path
for the caller to check against.

Signed-off-by: Hongbo <hehongbo@mail.com>
Reviewed-by: Anthony PERARD <anthony.perard@vates.tech>
=2D--
No changes since v2. Resending to add `Reviewed-by` from Anthony PERARD.

Best regards,
Hongbo
=2D--
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
=2D--
 tools/libs/light/libxl_dm.c | 38 +++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index b193a5dc37..8f0bbd5d64 100644
=2D-- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -331,9 +331,43 @@ const char *libxl__domain_device_model(libxl__gc *gc,
         case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
             dm =3D libxl__abs_path(gc, "qemu-dm", libxl__private_bindir_p=
ath());
             break;
-        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
-            dm =3D qemu_xen_path(gc);
+        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN: {
+            const char *configured_dm =3D qemu_xen_path(gc);
+            if (configured_dm[0] =3D=3D '/')
+            {
+                dm =3D configured_dm;
+            }
+            else
+            {
+                const char *path_env =3D getenv("PATH");
+                if (!path_env)
+                {
+                    dm =3D configured_dm;
+                }
+                else
+                {
+                    char *path_dup =3D libxl__strdup(gc, path_env);
+                    char *saveptr;
+
+                    char *path =3D strtok_r(path_dup, ":", &saveptr);
+                    dm =3D NULL;
+                    while (path)
+                    {
+                        char *candidate =3D libxl__abs_path(gc, configure=
d_dm, path);
+                        if (access(candidate, X_OK) =3D=3D 0)
+                        {
+                            dm =3D candidate;
+                            break;
+                        }
+                        path =3D strtok_r(NULL, ":", &saveptr);
+                    }
+
+                    if (!dm)
+                        dm =3D configured_dm;
+                }
+            }
             break;
+        }
         default:
             LOG(ERROR, "invalid device model version %d",
                 info->device_model_version);
=2D-
2.39.5 (Apple Git-154)


