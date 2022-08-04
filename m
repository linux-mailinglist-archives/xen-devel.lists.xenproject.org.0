Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FB2589801
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 09:02:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380192.614264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJUs6-0000tr-Sg; Thu, 04 Aug 2022 07:02:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380192.614264; Thu, 04 Aug 2022 07:02:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJUs6-0000sd-Nq; Thu, 04 Aug 2022 07:02:18 +0000
Received: by outflank-mailman (input) for mailman id 380192;
 Thu, 04 Aug 2022 07:02:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wk0C=YI=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oJUs4-0000K7-WC
 for xen-devel@lists.xen.org; Thu, 04 Aug 2022 07:02:17 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ecd4071-13c3-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 09:02:15 +0200 (CEST)
Received: by mail-pj1-x1033.google.com with SMTP id gj1so3706980pjb.0
 for <xen-devel@lists.xen.org>; Thu, 04 Aug 2022 00:02:16 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 13-20020a170902c20d00b0016e808dbe55sm61539pll.96.2022.08.04.00.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 00:02:13 -0700 (PDT)
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
X-Inumbo-ID: 5ecd4071-13c3-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jnP87DDY9e5w/7DpOY7qD8IgK2FdJZgySh2bza0OcUU=;
        b=hPlIZbpNzs5JyiNyGlwydaIggY2csLotkcb9yq3kJMW3dGJiHfcr0mfqeBbiiEtkox
         Zw5I4a4OByiKiXu3+khoeWfqLWSdVI3UO7eUabIoUDcbcfVIL7lleB5zkfWgEv7H8XTI
         gafGXs+tmRa1RhdVRpTmB/dPTYZrEAEvBt5j0s3wtw5zUd1BERUHOire1ErjZCG46gtz
         TuVtw1QBzMq1wiGfdm/msZwjeOWOdnTMduO/gwGngC8XsyMo6Y4qVvJ0Xvkk5+/rjYRu
         cLKpb3ERUXqhqF4eMPgwWMzLLvotFPZr8m7pXfajIiXew/CeeMfzir4vj7ps2SXee4u2
         +dJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jnP87DDY9e5w/7DpOY7qD8IgK2FdJZgySh2bza0OcUU=;
        b=QmlrWKszX2ZJOK22Vj/JrlvcOd/lqVcDHJstNQiiQqMX7rNamLAdPGp3kn/EfdOrhO
         iSnqvKb240oaaensQc/YTqUwEJB/iRU7oMJYVt1w4aP4O6lgBHbRs5YJzeqDvY7cYDWi
         YpbgzFf23HpR6Jq0AxZubPnLuffV0m1fUmem3noVpurBxZoiyPhSLWChXICWankr18vc
         gSBL2OmcBdl+clFCWosYAf9HqDRoNL0+OTG7UCyGAbge7LeKhfk8bVB1vM00nfDhxpPD
         AmcgjR6WzC6oLWh3e8UUYu++xpKRwGfhnnGS1Z94NgwfxNeJJEALqYmL1shqRZ+iAyoJ
         VeEg==
X-Gm-Message-State: ACgBeo14aei7q3Ms8oNOT4chSpDVkU8b+GD1qTe8woMTSxcbq0anjlmO
	hj3n5HHLvUFKgj6mIR4sQPZq3VjB27hwtQ==
X-Google-Smtp-Source: AA6agR4ijlVlOpqTXiYXXLsVPnBoPAub2by/fursTxgK7g2T0ShzSEw4Kj7xvjSvQYiKBuHI3EOu5A==
X-Received: by 2002:a17:90a:f418:b0:1f3:223d:4349 with SMTP id ch24-20020a17090af41800b001f3223d4349mr9189723pjb.2.1659596534819;
        Thu, 04 Aug 2022 00:02:14 -0700 (PDT)
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
Subject: [PATCH V3 4/6] libxl: arm: Split make_virtio_mmio_node()
Date: Thu,  4 Aug 2022 12:31:52 +0530
Message-Id: <ae20b87d583b981302905059d157a03400cd8eb2.1659596139.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1659596139.git.viresh.kumar@linaro.org>
References: <cover.1659596139.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make_virtio_mmio_node() creates the DT node for simple MMIO devices
currently, i.e. the ones that don't require any additional properties.

In order to allow using it for other complex device types, split the
functionality into two, one where the fdt node isn't closed and the
other one to create a simple DT node.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 2f64b9f0ebee..6a8c4d042bd9 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -900,9 +900,8 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
     return 0;
 }
 
-static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
-                                 uint64_t base, uint32_t irq,
-                                 uint32_t backend_domid)
+static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
+                                        uint32_t irq)
 {
     int res;
     gic_interrupt intr;
@@ -922,7 +921,15 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
     res = fdt_property_interrupts(gc, fdt, &intr, 1);
     if (res) return res;
 
-    res = fdt_property(fdt, "dma-coherent", NULL, 0);
+    return fdt_property(fdt, "dma-coherent", NULL, 0);
+}
+
+static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, uint64_t base,
+                                        uint32_t irq, uint32_t backend_domid)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq);
     if (res) return res;
 
     if (backend_domid != LIBXL_TOOLSTACK_DOMID) {
@@ -935,10 +942,7 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
         if (res) return res;
     }
 
-    res = fdt_end_node(fdt);
-    if (res) return res;
-
-    return 0;
+    return fdt_end_node(fdt);
 }
 
 static const struct arch_info *get_arch_info(libxl__gc *gc,
@@ -1261,8 +1265,8 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                     iommu_created = true;
                 }
 
-                FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq,
-                                           disk->backend_domid) );
+                FDT( make_virtio_mmio_node_simple(gc, fdt, disk->base,
+                                            disk->irq, disk->backend_domid) );
             }
         }
 
-- 
2.31.1.272.g89b43f80a514


