Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AD459BC82
	for <lists+xen-devel@lfdr.de>; Mon, 22 Aug 2022 11:16:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391247.629020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ3X2-00020d-5E; Mon, 22 Aug 2022 09:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391247.629020; Mon, 22 Aug 2022 09:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQ3X2-0001wf-1H; Mon, 22 Aug 2022 09:15:40 +0000
Received: by outflank-mailman (input) for mailman id 391247;
 Mon, 22 Aug 2022 09:15:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J63M=Y2=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oQ3X0-00016q-MO
 for xen-devel@lists.xen.org; Mon, 22 Aug 2022 09:15:38 +0000
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [2607:f8b0:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbc912f6-21fa-11ed-9250-1f966e50362f;
 Mon, 22 Aug 2022 11:15:37 +0200 (CEST)
Received: by mail-pg1-x52d.google.com with SMTP id w13so3760117pgq.7
 for <xen-devel@lists.xen.org>; Mon, 22 Aug 2022 02:15:37 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 z7-20020a1709027e8700b00172951dd9absm7873503pla.43.2022.08.22.02.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 02:15:35 -0700 (PDT)
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
X-Inumbo-ID: fbc912f6-21fa-11ed-9250-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=V2mdY566ca45hKMG7KJR4XNdOwkTjA1uL0gZlrSZ5zw=;
        b=CP9lYPL2sKa6LoCzSJ0w0suKTfTkrz8Hw+WrE9qWYmYaXSHCMEuWr7MGNXlLFZIo+o
         vAlGupnv63mpPWoeKDL9/hVbIhbrkXEKB0AaScNpwrMkmdTPCdyWeulperiYXNQExVKh
         IgoenigXuS4Hhc51nrsTkIVexka4EbRplpyDtUwHuG1Zmz3WKE2w5vCT/eTfCtxYZow+
         V/gFh5z7r0+XvH4ah8f3T6cL/q5bKkqUzz1gCaCggq5JCCB3TCNU2LGC0XyL+qYouEdz
         XpeQsZBard7u+onEcoqX4DemUzc9J/Nd85Q5izQgo/PPCvZavrdRcemVtBWeqwowpOvh
         Mb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=V2mdY566ca45hKMG7KJR4XNdOwkTjA1uL0gZlrSZ5zw=;
        b=dnHyPPOx4MWj4d77XywMpL3oEk5rRlcN25kD+FiEDoiLCOmw3ufDasYXJGOzR647Jk
         TqFTLZVQKQxGpuT5fwMj5qAPyzamguBp//aojvU39ncfHo75gc4SAZ9+LsQA6+0wLIHD
         QRgjrJKyynb5yv2W5tsgf9hNqu7Cv22WfWLdz9myNjmKZZyADGpvtMSI6+A53WAMG7Rm
         gIxQYrrfzbLQZZ6AXFoLqB1es5ZvItDWKlQ/+NHuCoP4XWoABQpD2KTf4MoszlBqKvfJ
         +khRGcpY+humHaLPSuX4vNGX6g4/ddLZCOHUeTwtIHDwiKRpODUQ2lheL6046MCJwRsJ
         DoNw==
X-Gm-Message-State: ACgBeo3knMQInmzJwzlJKHBJvgKliMfrFcN3gUbkjKEKFd0w66FFEXFv
	Zi4Z6aR2nN4yCU3gkrs3lx5DNOKDDUh0Aw==
X-Google-Smtp-Source: AA6agR7eDgV6y/I71nVNPuZqwM1wnvxBOMzpWrGIbv80XVcveKBAmq4LmZHHSYJu/f0PlO3uSdjZew==
X-Received: by 2002:a63:6c49:0:b0:41d:e36b:1e4a with SMTP id h70-20020a636c49000000b0041de36b1e4amr16389739pgc.300.1661159736323;
        Mon, 22 Aug 2022 02:15:36 -0700 (PDT)
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
	Julien Grall <julien@xen.org>,
	anthony.perard@citrix.com,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V5 4/6] libxl: arm: Split make_virtio_mmio_node()
Date: Mon, 22 Aug 2022 14:45:16 +0530
Message-Id: <981b663f6a44f9f82f32cc58219f6af26f73d66f.1661159474.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1661159474.git.viresh.kumar@linaro.org>
References: <cover.1661159474.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make_virtio_mmio_node() creates the DT node for simple MMIO devices
currently, i.e. the ones that don't require any additional properties.

In order to allow using it for other complex device types, split the
functionality into two, one where the fdt node isn't closed and the
other one to create a simple DT node.

Reviewed-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 0e3051bac5e4..4d0469f8166a 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -906,9 +906,9 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
     return 0;
 }
 
-static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
-                                 uint64_t base, uint32_t irq,
-                                 uint32_t backend_domid)
+/* The caller is responsible to complete / close the fdt node */
+static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
+                                        uint32_t irq, uint32_t backend_domid)
 {
     int res;
     gic_interrupt intr;
@@ -941,10 +941,18 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
         if (res) return res;
     }
 
-    res = fdt_end_node(fdt);
+    return res;
+}
+
+static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, uint64_t base,
+                                        uint32_t irq, uint32_t backend_domid)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
     if (res) return res;
 
-    return 0;
+    return fdt_end_node(fdt);
 }
 
 static const struct arch_info *get_arch_info(libxl__gc *gc,
@@ -1267,8 +1275,9 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                     iommu_created = true;
                 }
 
-                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
-                                           disk->backend_domid) );
+                FDT( make_virtio_mmio_node_simple(gc, fdt, disk->base,
+                                                  disk->irq,
+                                                  disk->backend_domid) );
             }
         }
 
-- 
2.31.1.272.g89b43f80a514


