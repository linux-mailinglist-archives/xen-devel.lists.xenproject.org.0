Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C64B9F1578
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 20:09:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.857088.1269528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMB2C-0004jM-D1; Fri, 13 Dec 2024 19:09:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 857088.1269528; Fri, 13 Dec 2024 19:09:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tMB2C-0004hl-8Z; Fri, 13 Dec 2024 19:09:08 +0000
Received: by outflank-mailman (input) for mailman id 857088;
 Fri, 13 Dec 2024 19:09:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I5eD=TG=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tMB2A-0004TW-Uu
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 19:09:06 +0000
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [2607:f8b0:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b852f025-b985-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 20:09:05 +0100 (CET)
Received: by mail-ot1-x32d.google.com with SMTP id
 46e09a7af769-71e2aa8d5e3so1086778a34.2
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 11:09:05 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-71e4834da91sm29697a34.18.2024.12.13.11.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 11:09:03 -0800 (PST)
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
X-Inumbo-ID: b852f025-b985-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734116944; x=1734721744; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvKuTabJuM44RrR9LqcDtNRzVnC+ouLNjCo5mA0gZDg=;
        b=gC/gomOO+FDbnqz7bFspjcJXROTR4HEevGRfrf/56eLxkMGJ8C9flybddKA6fpbUHT
         Kl3xICcCmrhkwuPG1aHqLTfhIL/3/CO2/as2Ey3Ha0MjB87QHnHGoZPIurtCU9Wz1LGh
         YtLZF525p0paJJFSdrw2wH+ib06fvlOM0iWUfNkM5edPfcl4eBgV7SR64YMWh9MD7h4t
         /glKpzjjx5bHJ/LrhHW0dylkUae9hrEo7j6ox2NvUOBEzYV8BsABE1ab+ENcs3ySvrFn
         549MAXQxeN0w1jky8RBROSVr9703k1NcTDrFzghMibeNjSRNULk4gbJeBUPjkKpAJ561
         /uOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734116944; x=1734721744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvKuTabJuM44RrR9LqcDtNRzVnC+ouLNjCo5mA0gZDg=;
        b=cs/Utu+mJhmcQyGEo2Ar6fKLcNIjuBglqFlfFp8TdCq8nWatWgra28/Kj1lDIy4Vew
         Sycn+zDA+ajUbInnc6be6YWD5zYlW2ZO3zwEY8S2Z4Cp7bNZcUYvL7KE3qTVC5ozqNAY
         ljdPRAcFcQFIBgnn7v5Ht2zvXdsHq0zxvKN1aNfLsNehJGLPFSRW00pxPI0YX9I4Vd8/
         PjXxwSWizrPxhwVxhackBHlVi+pi4aG+I/WUCyfGSO2lDumNtiMvz1HQS3HdSXYovsIu
         dSAPjeatulnyqCRNxpHrDPJ62jciGBzKZIJEpzS6plpN68FnGmJH9oZLzUUHM9OU9ucE
         /UJw==
X-Forwarded-Encrypted: i=1; AJvYcCXVeBpTk9emX1ETCTnJUKw5qw8O1RzH8ejPqFP2qzCeXQJFVym6n+5sJLa8ZykOz81bXjksHTDCRwk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9hwNRjmbpjPNZIOaGimYpqnGEfN/7ImV6jejsWH3pZXc7b7MK
	lF/R34UnnuNxc6NS4lbNyYXG+pLgZNeBwnYEacA4JJRngKb8CE1oTuXZKWUEpoo=
X-Gm-Gg: ASbGnctT2E20UgjQE7NnrZj+0z+BQA8KOXVZuu/OEi6TxmRnUUFjqRIzDDlN94jO9kh
	m1JCOab0ZDke02GZJMtvIsWu4d0hpWogKYQ9gcklL+R7vB26+yE9mKF0nw+FMOnRiNPgSPZlDgO
	bEChoiXjDP80inQT5S3/BIp4ExuGlhXELL0xjGNncyRm9fd3goNr6Ut9f+ZqIKMgFaqRh+2atL3
	MMR1zisbf8SsoCnONfyy4Gpq0yasNiXok5W18OM1HRUrtaTbLeOHahs/Z1kbuPH
X-Google-Smtp-Source: AGHT+IH4rJcdXbtBNLnupXAb1IE3M6qGGNYml9H8C6S7DGbxJKBCaGKoGLFrcPQYq1LiK/0DBH3rEw==
X-Received: by 2002:a05:6830:6e18:b0:71d:f239:c0a8 with SMTP id 46e09a7af769-71e3b827be9mr2189273a34.6.1734116944096;
        Fri, 13 Dec 2024 11:09:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	Raphael Norwitz <raphael@enfabrica.net>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-block@nongnu.org (open list:Floppy),
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 19/71] hw/block: Constify all Property
Date: Fri, 13 Dec 2024 13:06:53 -0600
Message-ID: <20241213190750.2513964-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213190750.2513964-1-richard.henderson@linaro.org>
References: <20241213190750.2513964-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/block/fdc-isa.c        | 2 +-
 hw/block/fdc-sysbus.c     | 4 ++--
 hw/block/fdc.c            | 2 +-
 hw/block/m25p80.c         | 2 +-
 hw/block/nand.c           | 2 +-
 hw/block/pflash_cfi01.c   | 2 +-
 hw/block/pflash_cfi02.c   | 2 +-
 hw/block/swim.c           | 2 +-
 hw/block/vhost-user-blk.c | 2 +-
 hw/block/virtio-blk.c     | 2 +-
 hw/block/xen-block.c      | 2 +-
 11 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/block/fdc-isa.c b/hw/block/fdc-isa.c
index 5ed3c18c28..2b9f667fe4 100644
--- a/hw/block/fdc-isa.c
+++ b/hw/block/fdc-isa.c
@@ -283,7 +283,7 @@ static const VMStateDescription vmstate_isa_fdc = {
     }
 };
 
-static Property isa_fdc_properties[] = {
+static const Property isa_fdc_properties[] = {
     DEFINE_PROP_UINT32("iobase", FDCtrlISABus, iobase, 0x3f0),
     DEFINE_PROP_UINT32("irq", FDCtrlISABus, irq, 6),
     DEFINE_PROP_UINT32("dma", FDCtrlISABus, dma, 2),
diff --git a/hw/block/fdc-sysbus.c b/hw/block/fdc-sysbus.c
index e1ddbf3d1a..f17e04b138 100644
--- a/hw/block/fdc-sysbus.c
+++ b/hw/block/fdc-sysbus.c
@@ -196,7 +196,7 @@ static const TypeInfo sysbus_fdc_common_typeinfo = {
     .class_size    = sizeof(FDCtrlSysBusClass),
 };
 
-static Property sysbus_fdc_properties[] = {
+static const Property sysbus_fdc_properties[] = {
     DEFINE_PROP_SIGNED("fdtypeA", FDCtrlSysBus, state.qdev_for_drives[0].type,
                         FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
@@ -223,7 +223,7 @@ static const TypeInfo sysbus_fdc_typeinfo = {
     .class_init    = sysbus_fdc_class_init,
 };
 
-static Property sun4m_fdc_properties[] = {
+static const Property sun4m_fdc_properties[] = {
     DEFINE_PROP_SIGNED("fdtype", FDCtrlSysBus, state.qdev_for_drives[0].type,
                         FLOPPY_DRIVE_TYPE_AUTO, qdev_prop_fdc_drive_type,
                         FloppyDriveType),
diff --git a/hw/block/fdc.c b/hw/block/fdc.c
index 6dd94e98bc..57d6844806 100644
--- a/hw/block/fdc.c
+++ b/hw/block/fdc.c
@@ -454,7 +454,7 @@ struct FloppyDrive {
     FloppyDriveType type;
 };
 
-static Property floppy_drive_properties[] = {
+static const Property floppy_drive_properties[] = {
     DEFINE_PROP_UINT32("unit", FloppyDrive, unit, -1),
     DEFINE_BLOCK_PROPERTIES(FloppyDrive, conf),
     DEFINE_PROP_SIGNED("drive-type", FloppyDrive, type,
diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 748594524e..ca97365926 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -1720,7 +1720,7 @@ static int m25p80_pre_save(void *opaque)
     return 0;
 }
 
-static Property m25p80_properties[] = {
+static const Property m25p80_properties[] = {
     /* This is default value for Micron flash */
     DEFINE_PROP_BOOL("write-enable", Flash, write_enable, false),
     DEFINE_PROP_UINT32("nonvolatile-cfg", Flash, nonvolatile_cfg, 0x8FFF),
diff --git a/hw/block/nand.c b/hw/block/nand.c
index ac0a5d2b42..b6e6bfac23 100644
--- a/hw/block/nand.c
+++ b/hw/block/nand.c
@@ -445,7 +445,7 @@ static void nand_realize(DeviceState *dev, Error **errp)
     s->ioaddr = s->io;
 }
 
-static Property nand_properties[] = {
+static const Property nand_properties[] = {
     DEFINE_PROP_UINT8("manufacturer_id", NANDFlashState, manf_id, 0),
     DEFINE_PROP_UINT8("chip_id", NANDFlashState, chip_id, 0),
     DEFINE_PROP_DRIVE("drive", NANDFlashState, blk),
diff --git a/hw/block/pflash_cfi01.c b/hw/block/pflash_cfi01.c
index 21a81b44f0..20f4fc67a0 100644
--- a/hw/block/pflash_cfi01.c
+++ b/hw/block/pflash_cfi01.c
@@ -895,7 +895,7 @@ static void pflash_cfi01_system_reset(DeviceState *dev)
     pfl->blk_offset = -1;
 }
 
-static Property pflash_cfi01_properties[] = {
+static const Property pflash_cfi01_properties[] = {
     DEFINE_PROP_DRIVE("drive", PFlashCFI01, blk),
     /* num-blocks is the number of blocks actually visible to the guest,
      * ie the total size of the device divided by the sector length.
diff --git a/hw/block/pflash_cfi02.c b/hw/block/pflash_cfi02.c
index 8393f261b8..c82002d665 100644
--- a/hw/block/pflash_cfi02.c
+++ b/hw/block/pflash_cfi02.c
@@ -937,7 +937,7 @@ static void pflash_cfi02_reset(DeviceState *dev)
     pflash_reset_state_machine(pfl);
 }
 
-static Property pflash_cfi02_properties[] = {
+static const Property pflash_cfi02_properties[] = {
     DEFINE_PROP_DRIVE("drive", PFlashCFI02, blk),
     DEFINE_PROP_UINT32("num-blocks", PFlashCFI02, uniform_nb_blocs, 0),
     DEFINE_PROP_UINT32("sector-length", PFlashCFI02, uniform_sector_len, 0),
diff --git a/hw/block/swim.c b/hw/block/swim.c
index 64992eb72e..c336d83bdc 100644
--- a/hw/block/swim.c
+++ b/hw/block/swim.c
@@ -166,7 +166,7 @@ static const BlockDevOps swim_block_ops = {
     .change_media_cb = swim_change_cb,
 };
 
-static Property swim_drive_properties[] = {
+static const Property swim_drive_properties[] = {
     DEFINE_PROP_INT32("unit", SWIMDrive, unit, -1),
     DEFINE_BLOCK_PROPERTIES(SWIMDrive, conf),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 7996e49821..f3ac007108 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -570,7 +570,7 @@ static const VMStateDescription vmstate_vhost_user_blk = {
     },
 };
 
-static Property vhost_user_blk_properties[] = {
+static const Property vhost_user_blk_properties[] = {
     DEFINE_PROP_CHR("chardev", VHostUserBlk, chardev),
     DEFINE_PROP_UINT16("num-queues", VHostUserBlk, num_queues,
                        VHOST_USER_BLK_AUTO_NUM_QUEUES),
diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index 9166d7974d..9ca60fbc07 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -1985,7 +1985,7 @@ static const VMStateDescription vmstate_virtio_blk = {
     },
 };
 
-static Property virtio_blk_properties[] = {
+static const Property virtio_blk_properties[] = {
     DEFINE_BLOCK_PROPERTIES(VirtIOBlock, conf.conf),
     DEFINE_BLOCK_ERROR_PROPERTIES(VirtIOBlock, conf.conf),
     DEFINE_BLOCK_CHS_PROPERTIES(VirtIOBlock, conf.conf),
diff --git a/hw/block/xen-block.c b/hw/block/xen-block.c
index 72cfd6893a..0c0817f498 100644
--- a/hw/block/xen-block.c
+++ b/hw/block/xen-block.c
@@ -666,7 +666,7 @@ static const PropertyInfo xen_block_prop_vdev = {
     .set = xen_block_set_vdev,
 };
 
-static Property xen_block_props[] = {
+static const Property xen_block_props[] = {
     DEFINE_PROP("vdev", XenBlockDevice, props.vdev,
                 xen_block_prop_vdev, XenBlockVdev),
     DEFINE_BLOCK_PROPERTIES(XenBlockDevice, props.conf),
-- 
2.43.0


