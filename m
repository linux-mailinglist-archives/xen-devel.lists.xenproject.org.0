Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 945D3521ED1
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 17:32:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325800.548543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noRpy-0002NM-Ba; Tue, 10 May 2022 15:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325800.548543; Tue, 10 May 2022 15:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noRpy-0002KX-8a; Tue, 10 May 2022 15:31:46 +0000
Received: by outflank-mailman (input) for mailman id 325800;
 Tue, 10 May 2022 15:31:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bZuJ=VS=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1noRpw-0002KR-LR
 for xen-devel@lists.xenproject.org; Tue, 10 May 2022 15:31:44 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4bae2705-d076-11ec-a406-831a346695d4;
 Tue, 10 May 2022 17:31:43 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id d15so21481401lfk.5
 for <xen-devel@lists.xenproject.org>; Tue, 10 May 2022 08:31:43 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id
 o28-20020ac2495c000000b0047255d211b3sm1682490lfi.226.2022.05.10.08.31.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 10 May 2022 08:31:41 -0700 (PDT)
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
X-Inumbo-ID: 4bae2705-d076-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iv0IL6AtnXgnr8MUvSke35+4yXUMx4F0Bkh2lEdPPQg=;
        b=fBq38ROfDoJI7x6svPyWaTXK/LZQhypxQZTbZLK3CXuEpdZvQP1uOdcIqbe2CHRDWU
         N8IzziYBzE21gymvbJl/xsXoQ0efYKio91eBS8dLwOtqO2AWsfhBFrhnZcJS2FuiyLnl
         gETL6cLZe7VPbcqu8WwFGmm32Iq3GYFSeL7oBpeg1eq7ZxGVFNvNWCOdT1WfSq5XFSLy
         K1qrLYW0l/YkGlIwwKeqjDp3A+fW+MNVQKEtMQ6ifTIT1ftw+vsSegmWrrd9RPOo+PMl
         EpCYLXLjgUpkaA9yZWmcxqqYjVkss098efDmxAlyK/+xXold4ptrsGisgmxmqusKnsun
         yCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Iv0IL6AtnXgnr8MUvSke35+4yXUMx4F0Bkh2lEdPPQg=;
        b=JZD/UCULi3cJKkXdo965rfh3ZkeKfmU8samkpLgSTTWmIL3rqaCDqnLL1Ag6gdhAlV
         bCnarcsDkn4pOa2Wp4C9Zk+W8NlGcFZnMYPnBcrIFjOyp+r+wAzYAW3msi1TTjPC5ieO
         IHmkmG7bvbSHyFtKjNj1MYnMxjQq36pU+REVxDZeJt+1n1wfzaQhSwiXh5x/36sj2/8X
         y0yrBP8LPY2jw86Sit48J9/9AWfuOQ+t8qesbaNLOiETPyl16jqYF4SLal2rDUyaips8
         U/brhycXDpLQn/EIBMoI5AJ/jLylbM6SPGSIe9ydrQ5ApysWr+toD8tp/sPhhA7rzoT8
         i0rg==
X-Gm-Message-State: AOAM531zQrXYvyyxbqFjsjhDvvsbLPFv+f4EzWfQTqpYD+jipq2KP02I
	HETkfKNw2TYgPiuFHbcTctzlsyFLQxc=
X-Google-Smtp-Source: ABdhPJxO2qsi9uz6Y+ru8QWBielkM7K/yltoMEAUq6k4ZKv+NjJfIZZ6agBVkLZJE6me5OBsHHcUAQ==
X-Received: by 2002:ac2:4c42:0:b0:471:a8e2:198e with SMTP id o2-20020ac24c42000000b00471a8e2198emr16894400lfk.673.1652196702270;
        Tue, 10 May 2022 08:31:42 -0700 (PDT)
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
Subject: [PATCH V1] libxl/arm: Insert "xen,dev-domid" property to virtio-mmio device node
Date: Tue, 10 May 2022 18:31:16 +0300
Message-Id: <1652196676-14745-1-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Use specific binding for the virtio devices for which the restricted
memory access using Xen grant mappings need to be enabled.

Based on device-tree binding from Linux:
Documentation/devicetree/bindings/arm/xen,dev-domid.yaml

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
!!! This patch is based on non upstreamed yet “Virtio support for toolstack
on Arm” V8 series which is on review now:
https://lore.kernel.org/xen-devel/1651598763-12162-1-git-send-email-olekstysh@gmail.com/

New device-tree binding (commit #5) is a part of solution to restrict memory
access under Xen using xen-grant DMA-mapping layer (which is also on review):
https://lore.kernel.org/xen-devel/1651947548-4055-1-git-send-email-olekstysh@gmail.com/

Changes RFC -> V1:
   - update commit description
   - rebase according to the recent changes to
     "libxl: Introduce basic virtio-mmio support on Arm"
---
 tools/libs/light/libxl_arm.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 37403a2..27ff328 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -862,7 +862,8 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
 
 
 static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
-                                 uint64_t base, uint32_t irq)
+                                 uint64_t base, uint32_t irq,
+                                 uint32_t backend_domid)
 {
     int res;
     gic_interrupt intr;
@@ -887,6 +888,14 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
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
 
@@ -1205,7 +1214,8 @@ next_resize:
             libxl_device_disk *disk = &d_config->disks[i];
 
             if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
-                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
+                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
+                                           disk->backend_domid) );
         }
 
         if (pfdt)
-- 
2.7.4


