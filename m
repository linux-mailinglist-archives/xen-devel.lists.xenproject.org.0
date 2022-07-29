Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F05585317
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jul 2022 17:50:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.377619.610889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHSG0-0004wB-36; Fri, 29 Jul 2022 15:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 377619.610889; Fri, 29 Jul 2022 15:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oHSG0-0004tp-0A; Fri, 29 Jul 2022 15:50:32 +0000
Received: by outflank-mailman (input) for mailman id 377619;
 Fri, 29 Jul 2022 15:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QCuC=YC=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1oHSFz-0004tj-6J
 for xen-devel@lists.xenproject.org; Fri, 29 Jul 2022 15:50:31 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c048b38-0f56-11ed-bd2d-47488cf2e6aa;
 Fri, 29 Jul 2022 17:50:30 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id bf9so7872620lfb.13
 for <xen-devel@lists.xenproject.org>; Fri, 29 Jul 2022 08:50:30 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 bp23-20020a056512159700b0048a835a60f6sm693428lfb.251.2022.07.29.08.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 08:50:28 -0700 (PDT)
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
X-Inumbo-ID: 2c048b38-0f56-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=S01wSBMMcdelVnVjOkH9lCwWoMGdbRzrK7HqSib69Hg=;
        b=LFp7OCtLArAWZrWOeuJsky9HKKLt42lomc5ZCZlwDVu7gTbyAhWxVFxCHMqauI5zQP
         XrQjSoQnO+SwTEVZPkTLnp8siPxVgTADZviZjxWaT0FhHniUCT1AuZR6+wWux2lfKdHr
         wtAfBqGskxrja9bdWbmbc1qLUMioLFT7HS5cClX7hIQhm+DzV/S8z3pqMbiv25UL3aeZ
         he/avPFnqs2Hug7Lzv94C6QulY10W8FMDp1MwxXQ3OGW3hWZ2psFppL62R3rnpIFqTTr
         uKOykqGzCXBQFnDcQgrON0kzlrv1OBOMRjRWpd5HTEK88zqNSm9XOzyCmnPRMSvuVN64
         XVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=S01wSBMMcdelVnVjOkH9lCwWoMGdbRzrK7HqSib69Hg=;
        b=Sbw7xwhxFGyi1H3GBzseW0sZAfLI2o14XPplnglmM871Z57dR8XRr/k8PtUO5Eq5fJ
         ay6t3wwEUgUgwvT3vofQkWpS5i8DskEzZiW85uSUpbHcDqIzCC7Zgnp8YX/Q5Yyzel7V
         ONwpzHbD62BnjyeOZTbBFF2hdqpXZbMWmRdmyocbPuRA0zyjlMLNfrWpSVH8J4+ZDyEn
         Qeo0p4z3fbvF6U9AMfEIcmKrfNggO+KZnv/EF7OSmv2L/NawfUVpRC+jN0bNKottKNck
         7U59wmQSI5R0v9eYR0kx/9oUYOWsCovqNf0+5alJdIaKVHaqhhliEXbxJbVyrSV7IUhk
         GnWg==
X-Gm-Message-State: ACgBeo1HoE1vpx5ySHU/JXXPN6Xg5uSjlAfy3e+F22Y0EZ/xK+1d5j9j
	3qFLfFO6VonbCE9tdmZusmyRwWhM4SRzlA==
X-Google-Smtp-Source: AA6agR7I0GXQBFySP974763gBQRcBZVi3iQZyVTmh3NffVj56BJeEOk++Kyr+zNdGBCsmPwcxzVclw==
X-Received: by 2002:a05:6512:1292:b0:48a:e693:9da3 with SMTP id u18-20020a056512129200b0048ae6939da3mr566261lfs.328.1659109828939;
        Fri, 29 Jul 2022 08:50:28 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	libvir-list@redhat.com
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Michal Privoznik <mprivozn@redhat.com>
Subject: [libvirt PATCH] libxl: Fix build with recent Xen that introduces new disk backend type
Date: Fri, 29 Jul 2022 18:50:24 +0300
Message-Id: <20220729155024.3327364-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Xen toolstack has gained basic Virtio support recently which becides
adding various virtio related stuff introduces new disk backend type
LIBXL_DISK_BACKEND_STANDALONE [1].

Unfortunately, this caused a regression in libvirt build with Xen support
enabled, reported by the osstest today [2]:

CC       libxl/libvirt_driver_libxl_impl_la-xen_xl.lo
../../src/libxl/xen_xl.c: In function 'xenParseXLDisk':
../../src/libxl/xen_xl.c:779:17: error: enumeration value 'LIBXL_DISK_BACKEND_STANDALONE'
   not handled in switch [-Werror=switch-enum]
                 switch (libxldisk->backend) {
                 ^~~~~~
cc1: all warnings being treated as errors

The interesting fact is that switch already has a default branch (which ought
to cover such new addition), but the error is triggered as -Wswitch-enum
gives a warning about an omitted enumeration code even if there is a default
label.

Also there is a similar issue in libxlUpdateDiskDef() which I have reproduced
after fixing the first one, but it that case the corresponding switch doesn't
have a default branch.

Fix both issues by inserting required enumeration item to make the compiler
happy and adding ifdef guard to be able to build against old Xen libraries
as well (without LIBXL_HAVE_DEVICE_DISK_SPECIFICATION). Also add a default
branch to switch in libxlUpdateDiskDef().

Please note, that current patch doesn't implement the proper handling of
LIBXL_DISK_BACKEND_STANDALONE and friends, it is just intended to fix
the regression immediately to unblock the osstest.  Also it worth mentioning
that current patch won't solve the possible additions in the future.

[1] https://lore.kernel.org/xen-devel/20220716163745.28712-1-olekstysh@gmail.com/
[2] https://lore.kernel.org/xen-devel/E1oHEQO-0008GA-Uo@osstest.test-lab.xenproject.org/

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Cc: Julien Grall <julien@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Michal Privoznik <mprivozn@redhat.com>

Please note, the patch is tested on:
https://xenbits.xen.org/gitweb/?p=libvirt.git;a=shortlog;h=refs/heads/xen-tested-master
but should work on the master as well (as the same code is present here).
---
 src/libxl/libxl_conf.c | 4 ++++
 src/libxl/xen_xl.c     | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/src/libxl/libxl_conf.c b/src/libxl/libxl_conf.c
index aa3d7925ec..526f0b2b08 100644
--- a/src/libxl/libxl_conf.c
+++ b/src/libxl/libxl_conf.c
@@ -1240,6 +1240,10 @@ libxlUpdateDiskDef(virDomainDiskDef *l_disk, libxl_device_disk *x_disk)
         driver = "phy";
         break;
     case LIBXL_DISK_BACKEND_UNKNOWN:
+#ifdef LIBXL_HAVE_DEVICE_DISK_SPECIFICATION
+    case LIBXL_DISK_BACKEND_STANDALONE:
+#endif
+    default:
         break;
     }
     if (driver)
diff --git a/src/libxl/xen_xl.c b/src/libxl/xen_xl.c
index 4de4e3140f..6919325623 100644
--- a/src/libxl/xen_xl.c
+++ b/src/libxl/xen_xl.c
@@ -715,6 +715,9 @@ xenParseXLDisk(virConf *conf, virDomainDef *def)
                     virDomainDiskSetDriver(disk, "phy");
                     virDomainDiskSetType(disk, VIR_STORAGE_TYPE_BLOCK);
                     break;
+#ifdef LIBXL_HAVE_DEVICE_DISK_SPECIFICATION
+                case LIBXL_DISK_BACKEND_STANDALONE:
+#endif
                 default:
                     virReportError(VIR_ERR_CONFIG_UNSUPPORTED,
                                    _("disk backend not supported: %s"),
-- 
2.25.1


