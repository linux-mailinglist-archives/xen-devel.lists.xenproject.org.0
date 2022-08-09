Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D8058D33B
	for <lists+xen-devel@lfdr.de>; Tue,  9 Aug 2022 07:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.382691.617730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtR-0007DT-QQ; Tue, 09 Aug 2022 05:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 382691.617730; Tue, 09 Aug 2022 05:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLHtR-000753-L3; Tue, 09 Aug 2022 05:35:05 +0000
Received: by outflank-mailman (input) for mailman id 382691;
 Tue, 09 Aug 2022 05:35:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6IoV=YN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oLHtQ-0006dh-FZ
 for xen-devel@lists.xen.org; Tue, 09 Aug 2022 05:35:04 +0000
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [2607:f8b0:4864:20::1034])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00cb5078-17a5-11ed-924f-1f966e50362f;
 Tue, 09 Aug 2022 07:34:57 +0200 (CEST)
Received: by mail-pj1-x1034.google.com with SMTP id
 t22-20020a17090a449600b001f617f2bf3eso779512pjg.0
 for <xen-devel@lists.xen.org>; Mon, 08 Aug 2022 22:35:03 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 j8-20020a170903024800b0016f0939080asm9841381plh.249.2022.08.08.22.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 22:35:01 -0700 (PDT)
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
X-Inumbo-ID: 00cb5078-17a5-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=LLdxJR0I0KlWe+VourMuHy/5SrI2DecWdGVQY+6l0fk=;
        b=yb7fJ3Rlyi7pqniWC3V1Hyq24bYKaCbdh/rnacELcRgF/yeq4X2NTyhYQA+thM6Zfh
         GW3a/IH1bnj2MfGDAKsVqsRGkRt6aieIebz2oLDhiCXG47HQ/kmZpJ5CCtdrc8ebqxy8
         nflypvXXp2shqgA6APRwnehqjMHlJ4eh2GyXm42okdsKk1gbsEVHaR49kJUGaRYQh+hL
         9Xm5qkBpNzP1d/uRKdIE5m7uCqwbia9BQsDtMqHpzgyeCel8rTawhTWqpJOauGgWcQNz
         t5S9WGN6pYlBpWSAwP2tfY7h2SX+F21tWAk9NfyoTUsOVP6zwTUgt0TRESCFc3aVi5CB
         URFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=LLdxJR0I0KlWe+VourMuHy/5SrI2DecWdGVQY+6l0fk=;
        b=dh/U7BVGMj9jdKOdMDd0XMdWK+0q9prNKUpBGCFxYUemCrV9YQmQvJzdF8K/3vmZGg
         2ZMZj9qQR8Rmdl3b+SDUOKfXHs2DlkO14JknS7OpPXzzSqXYjRUxo8lUfv/gQIoJx0c1
         Ovgdv7dXTgr8ZuWy9iERuTnhMwzGVMvmMsIQX6+6GPnV9dQA7tS0+Te/YuZ26zhwZl9/
         9r1nTxYw2g8dvKsBJl96irmpSYVhyDxKmdPX9pjHXf0KVypigctiNYvTbOzwcDN7XFh6
         ng1zJ08bsxvSZxhGnOftcm9Ap5azlXqhCgdWJEb20u+l9jQmrhjrJE4H/UePz5JuO/af
         rmsA==
X-Gm-Message-State: ACgBeo11fZJ3vs9haG5DjeXWcggKhIg8Sm3erLvc7phW51ueDFDOn1Bj
	i3ZUMuz7QtDY0+88g719xiuQkCDKRq8TeQ==
X-Google-Smtp-Source: AA6agR5WXwm6bXsxWu+JiXGozCZ9DPjjaZTnOTV2c3XsEJyI37ETAYJg4eaXsGv577HJbC76MpFkRQ==
X-Received: by 2002:a17:902:f712:b0:171:29d0:6f9f with SMTP id h18-20020a170902f71200b0017129d06f9fmr171336plo.84.1660023302320;
        Mon, 08 Aug 2022 22:35:02 -0700 (PDT)
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
Subject: [PATCH V4 4/6] libxl: arm: Split make_virtio_mmio_node()
Date: Tue,  9 Aug 2022 11:04:31 +0530
Message-Id: <25fa5be0459f2f790f8420540840ea951a2f872e.1660023094.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1660023094.git.viresh.kumar@linaro.org>
References: <cover.1660023094.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

make_virtio_mmio_node() creates the DT node for simple MMIO devices
currently, i.e. the ones that don't require any additional properties.

In order to allow using it for other complex device types, split the
functionality into two, one where the fdt node isn't closed and the
other one to create a simple DT node.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 4a750852b671..891cb6ef2674 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -899,9 +899,8 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
     return 0;
 }
 
-static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
-                                 uint64_t base, uint32_t irq,
-                                 uint32_t backend_domid)
+static int make_virtio_mmio_node_common(libxl__gc *gc, void *fdt, uint64_t base,
+                                        uint32_t irq, uint32_t backend_domid)
 {
     int res;
     gic_interrupt intr;
@@ -934,10 +933,18 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
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
@@ -1260,8 +1267,8 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
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


