Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB38501C06
	for <lists+xen-devel@lfdr.de>; Thu, 14 Apr 2022 21:36:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.305089.519942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf5GA-0003Js-73; Thu, 14 Apr 2022 19:36:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 305089.519942; Thu, 14 Apr 2022 19:36:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nf5GA-0003HB-46; Thu, 14 Apr 2022 19:36:06 +0000
Received: by outflank-mailman (input) for mailman id 305089;
 Thu, 14 Apr 2022 19:36:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RCiM=UY=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1nf5G8-0003H5-IV
 for xen-devel@lists.xenproject.org; Thu, 14 Apr 2022 19:36:04 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e9644a1-bc2a-11ec-a405-831a346695d4;
 Thu, 14 Apr 2022 21:36:03 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id c15so7298520ljr.9
 for <xen-devel@lists.xenproject.org>; Thu, 14 Apr 2022 12:36:03 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a2eb00e000000b0024b55cda2eesm80127ljk.30.2022.04.14.12.36.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:36:01 -0700 (PDT)
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
X-Inumbo-ID: 1e9644a1-bc2a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sOQzqq1JRdIBUn7b46U2ZLsHxv1oDPMvZlhGwn1tgUM=;
        b=DWmwgeffoVU1kflkJbM00vaPsUrpMY7mEHEHMEMctxShKY35faldd4CvM0qK3a2zXZ
         neMNYoChcxVBY4ngfy8HKHmZRcPq74o7AlkimyX2uucmytuCZMREfB35rrO15GIIvxLn
         PCmpflHcA/TqR3q58tT0ejO6wpJVWjfTyRCaRqiz+jqq0IuSSKqfdmf+Qv5WhIeQQeQL
         e13qyV2aWIMGP2AazfOLgDwiJ8jcUt6atugFDE4D/7V1/MaHL3Mo0vKgwWJAmR4kq+wm
         wQyNWF4eoPI97GgcoCOUffuwtu7Nsyg0FMF9wEJqzUZ164lh20vU1IEOz0X5sS30xhdf
         Y57g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sOQzqq1JRdIBUn7b46U2ZLsHxv1oDPMvZlhGwn1tgUM=;
        b=FYCKgjD6Ta/kJ1C10CduVM3HfalkLnST/eJGRvgYcKsjBakgaG0R35LJBus5Nai+tR
         Q6+R+9xyoeDtKaswoqX7jJtUkbsnHG71bgR0cSsO6KsfBEw4/LMtjJya9vkHosoNFN3H
         i0riz0R59G+jm1c9JNtaDvjdWZLSvT277cNdAtRvVVE8oVOb3UyC3UX+VmUOH+59NI1C
         8TVwSyDKCVLby1vEyPOexBUTLz4Ksujbgr+oMbwzG9Owb1f16UY41pILzvnaBsvdbFuI
         U0py+O5DG6UbyVMHSGMXLWrezeWMUetd26KsR/WI0iDkWrHhgbBbwC3B/L/44EL3QYWq
         nYGg==
X-Gm-Message-State: AOAM532C3a366YsVkuUBmCRVgV93Tqa3AOdAK1cgIjFavNULEWnhhHJx
	srccTWFlfRZp4W53Tpx5gcrBxaurT+s=
X-Google-Smtp-Source: ABdhPJxHGujD1IucpfW2l2QsnEeQLPUoypoFIolcUnb9af/DdrdyTNAq4fgZpfB5d8xa0HK56Zfd1Q==
X-Received: by 2002:a05:651c:1591:b0:24d:a2ed:7104 with SMTP id h17-20020a05651c159100b0024da2ed7104mr584691ljq.11.1649964962411;
        Thu, 14 Apr 2022 12:36:02 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Kaly Xin <Kaly.Xin@arm.com>,
	Jiamei Xie <Jiamei.Xie@arm.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH] libxl/arm: Insert "xen,dev-domid" property to virtio-mmio device node
Date: Thu, 14 Apr 2022 22:36:00 +0300
Message-Id: <1649964960-24864-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is needed for grant table based DMA ops layer (CONFIG_XEN_VIRTIO)
at the guest side to retrieve the ID of Xen domain where the corresponding
backend resides (it is used as an argument to the grant table APIs).

This is a part of restricted memory access under Xen feature.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
!!! This patch is based on non upstreamed yet “Virtio support for toolstack
on Arm” series which is on review now:
https://lore.kernel.org/xen-devel/1649442065-8332-1-git-send-email-olekstysh@gmail.com/

All details are at:
https://lore.kernel.org/xen-devel/1649963973-22879-1-git-send-email-olekstysh@gmail.com/
---
 tools/libs/light/libxl_arm.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 8132a47..d9b26fc 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -875,7 +875,8 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
 
 
 static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
-                                 uint64_t base, uint32_t irq)
+                                 uint64_t base, uint32_t irq,
+                                 uint32_t backend_domid)
 {
     int res;
     gic_interrupt intr;
@@ -900,6 +901,14 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
     res = fdt_property(fdt, "dma-coherent", NULL, 0);
     if (res) return res;
 
+    if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
+        uint32_t domid[1];
+
+        domid[0] = cpu_to_fdt32(backend_domid);
+        res = fdt_property(fdt, "xen,dev-domid", domid, sizeof(domid));
+        if (res) return res;
+    }
+
     res = fdt_end_node(fdt);
     if (res) return res;
 
@@ -1218,7 +1227,8 @@ next_resize:
             libxl_device_disk *disk = &d_config->disks[i];
 
             if (disk->protocol == LIBXL_DISK_PROTOCOL_VIRTIO_MMIO)
-                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
+                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
+                                           disk->backend_domid) );
         }
 
         if (pfdt)
-- 
2.7.4


