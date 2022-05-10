Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8A3520D95
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 08:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325180.547672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noIzi-0000WH-R9; Tue, 10 May 2022 06:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325180.547672; Tue, 10 May 2022 06:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noIzi-0000U3-Nr; Tue, 10 May 2022 06:05:14 +0000
Received: by outflank-mailman (input) for mailman id 325180;
 Tue, 10 May 2022 06:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+NA3=VS=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1noIzg-0007ob-PR
 for xen-devel@lists.xen.org; Tue, 10 May 2022 06:05:12 +0000
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [2607:f8b0:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26a1bf24-d027-11ec-a406-831a346695d4;
 Tue, 10 May 2022 08:05:12 +0200 (CEST)
Received: by mail-pg1-x533.google.com with SMTP id a191so13834968pge.2
 for <xen-devel@lists.xen.org>; Mon, 09 May 2022 23:05:12 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 g8-20020a1709029f8800b0015e8d4eb277sm971751plq.193.2022.05.09.23.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 23:05:10 -0700 (PDT)
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
X-Inumbo-ID: 26a1bf24-d027-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PPqz95lztCC38dTJHeWNR5iEVbeizZheBx488usygyI=;
        b=vMHmiiogda0eo2/FDg6G7b/iTEveRUAuIW2QZ0etiRM4FaQNA6XkuU+P+GXpnXf+5b
         enCYqyc1TUOUd26J0sLkxH/e6wIA6yU4ZJptcid0h+KsWU+69ifJTbbgyTivLDvgG6SH
         L1PodZd2PtLXYXUtl8DwkcGyBom3cTecCzSEdwlaTIfNAV2tlorluAa0qsJuYkYap1RD
         OnRZiBUkmd+c/5JNSKaAfpCaNouATNjXvBRXBeIetFY+k9GyV91ls6DnwguiUVny6z7P
         LYMpAaKnKKeLCeweY8nJHftRFAIZf4olPFXkC6rRKP5HqP38WlRQ94l+yuRDulWPETzY
         7EyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PPqz95lztCC38dTJHeWNR5iEVbeizZheBx488usygyI=;
        b=wqFfOkEHmjwZvEpgj7z60JbdSmePlxHgdzMLBvGsYpT4HzZvIfoDOvdjizzLtvtnLW
         37UHPNljVw8kRDK4F/vqAEvAbTjt2olJ70w6eIHq7xLfDr75bYwkXev9Wn6J3MntIT3M
         CpcHcCWdM3sBEZ3gd+50lO2Kc1jyX2V7VH3yKqHAh0xPb12+oIz3PNoIVjjybo4FZAsv
         LpKj33LMKbA7yEmKokF9vc9C8DIJuoow8pHOIRnExDxVfk+VxIxyzi2X31qGnwhdGNQv
         h0FsrH3oql33Sk5vEPo7/+YnCXt6N5QqtRDGfV2HvOE+oLBw+IaravqPx6uDwTbSKeXl
         Wmew==
X-Gm-Message-State: AOAM530DOH2XUMJ76s73PBKGM90BBWKppchh/UpP+iMYXamfLj3sogAI
	b/Fb8drxjux6ATwflnSF7tMtDKFS5r7d6g==
X-Google-Smtp-Source: ABdhPJzcx6XKRkhlGQEGnNBK9sTlPxZap2TWqCwx24Uvq6gyUKoCCpT28whgCMXvS+N9E7dqP+t5aQ==
X-Received: by 2002:a63:a50e:0:b0:3c6:d417:6704 with SMTP id n14-20020a63a50e000000b003c6d4176704mr4793374pgf.526.1652162710796;
        Mon, 09 May 2022 23:05:10 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH V2 4/6] libxl: arm: Split make_virtio_mmio_node()
Date: Tue, 10 May 2022 11:34:49 +0530
Message-Id: <65dfe45db3829990335c0c5307d4bcfb40647986.1652162646.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1652162646.git.viresh.kumar@linaro.org>
References: <cover.1652162646.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make_virtio_mmio_node() creates the DT node for simple MMIO devices
currently, i.e. the ones that don't require any additional properties.

In order to allow using it for other complex device types, split the
functionality into two, one where the fdt node isn't closed and the
other one to create a simple DT node.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 6b95ded82dc3..3a038d388cf0 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -872,8 +872,8 @@ static int make_vpci_node(libxl__gc *gc, void *fdt,
 }
 
 
-static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
-                                 uint64_t base, uint32_t irq)
+static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
+                                        uint32_t irq)
 {
     int res;
     gic_interrupt intr;
@@ -895,13 +895,18 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
     res = fdt_property_interrupts(gc, fdt, &intr, 1);
     if (res) return res;
 
-    res = fdt_property(fdt, "dma-coherent", NULL, 0);
-    if (res) return res;
+    return fdt_property(fdt, "dma-coherent", NULL, 0);
+}
 
-    res = fdt_end_node(fdt);
+static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, uint64_t base,
+                                        uint32_t irq)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq);
     if (res) return res;
 
-    return 0;
+    return fdt_end_node(fdt);
 }
 
 static const struct arch_info *get_arch_info(libxl__gc *gc,
@@ -1216,7 +1221,7 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
             libxl_device_disk *disk = &d_config->disks[i];
 
             if (disk->specification == LIBXL_DISK_SPECIFICATION_VIRTIO)
-                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
+                FDT( make_virtio_mmio_node_simple(gc, fdt, disk->base, disk->irq) );
         }
 
         if (pfdt)
-- 
2.31.1.272.g89b43f80a514


