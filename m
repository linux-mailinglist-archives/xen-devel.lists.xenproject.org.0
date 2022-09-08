Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2695B17BE
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 10:53:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.402881.644833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDHq-0004ci-17; Thu, 08 Sep 2022 08:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 402881.644833; Thu, 08 Sep 2022 08:53:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWDHp-0004Zp-TY; Thu, 08 Sep 2022 08:53:25 +0000
Received: by outflank-mailman (input) for mailman id 402881;
 Thu, 08 Sep 2022 08:53:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jDMa=ZL=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oWDHp-0004Hp-0g
 for xen-devel@lists.xen.org; Thu, 08 Sep 2022 08:53:25 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b1dc067c-2f53-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 10:53:24 +0200 (CEST)
Received: by mail-pl1-x62e.google.com with SMTP id iw17so10521616plb.0
 for <xen-devel@lists.xen.org>; Thu, 08 Sep 2022 01:53:23 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 m14-20020a170902bb8e00b0017519b86996sm13793459pls.218.2022.09.08.01.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 01:53:22 -0700 (PDT)
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
X-Inumbo-ID: b1dc067c-2f53-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=/UEiFJKtm7/4NuvrzhnPo0LaLbvuX390efC9WrRSDDA=;
        b=wWgUabhPbeJq2hBFiCzFdXfq110UIC+HRSYH4k4bh1bV8dxugymD82lrIUOn94NmRv
         s0FW+wjGfMw2GIm2DXIuYb2V9zrhWmiO6VhHl++hzYejWaFGRnR+KS36dw2PFqKjWf0E
         8WRYpRnyZZR2vHWeLXdhw8uKDCcSBpqswRXY7p2i4U7LWNMOcfW2L9viOsLvz88kzdcT
         wpCphxw+pJyYzwI3gXt2Y4GEqI3O0OO2W0+67/dUnShjm/IE3+J5rPG00TVoeR2lJHSx
         8psrXFdHGoYrlBllLO5rNUsj9eGcvV9y9hCeZOy9asX3DfwwMOI9Lc+EC7DMaoDauxdY
         z0Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=/UEiFJKtm7/4NuvrzhnPo0LaLbvuX390efC9WrRSDDA=;
        b=LMVkFl21/V+64rIN2BAvKt36iDR4xAouXqKn0nkMSqgY1Z+5k+wXme6yDGy91hM8C6
         tW7wBIjHVAatQcrBF5yqmxscKHVkiIpag+Uy74ID9c00t5vfYA/REco3F2ppM+CfBRbx
         aLc8fx+JpPgnLkax4KTg3QrjkZ9zW8s+pY0a4UbR7krmeFLh5K90eLYEMsStnxUHr2/N
         qiQRzKMYHLP6RT8ms5BpXijeWTJAKQUylYkANs2LKdA5v7Faqa5l0xFnc9oSyxpK6rCy
         2w6b1WRbOpTDb6QfkJAfmH7Mqs9zNJ22NRYpdioGTX7zU6xF4B6PLEoHniuxh9fGbx76
         x25Q==
X-Gm-Message-State: ACgBeo2uHul7ZyKyYBJod+rKFmWUKWuum/OVmq2Z5mCqIExYeTfx2Wao
	H4b2Jefh8ykL116EildX06hGxkMXTlzYsg==
X-Google-Smtp-Source: AA6agR44zhvleFny9uTwjI62GkT4G1FygHSVLhOOBlnLa/zEmKAqCg6xfNxPUp/bNyLw2IyO1iNKhQ==
X-Received: by 2002:a17:903:40d2:b0:174:e086:c748 with SMTP id t18-20020a17090340d200b00174e086c748mr8259497pld.108.1662627202662;
        Thu, 08 Sep 2022 01:53:22 -0700 (PDT)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: xen-devel@lists.xen.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>,
	Wei Liu <wl@xen.org>,
	Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH V6 2/3] libxl: arm: Split make_virtio_mmio_node()
Date: Thu,  8 Sep 2022 14:23:00 +0530
Message-Id: <0edb5dc1ea3308cf9202e6476ff2797aad953966.1662626550.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1662626550.git.viresh.kumar@linaro.org>
References: <cover.1662626550.git.viresh.kumar@linaro.org>
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
 tools/libs/light/libxl_arm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index cc30ba124918..55aee15c10b4 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -907,9 +907,9 @@ static int make_xen_iommu_node(libxl__gc *gc, void *fdt)
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
@@ -942,10 +942,18 @@ static int make_virtio_mmio_node(libxl__gc *gc, void *fdt,
         if (res) return res;
     }
 
-    res = fdt_end_node(fdt);
+    return res;
+}
+
+static int make_virtio_mmio_node(libxl__gc *gc, void *fdt, uint64_t base,
+                                 uint32_t irq, uint32_t backend_domid)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
     if (res) return res;
 
-    return 0;
+    return fdt_end_node(fdt);
 }
 
 static const struct arch_info *get_arch_info(libxl__gc *gc,
-- 
2.31.1.272.g89b43f80a514


