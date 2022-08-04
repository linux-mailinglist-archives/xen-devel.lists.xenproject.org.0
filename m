Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F013A589804
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 09:02:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380193.614275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJUsC-0001Mn-71; Thu, 04 Aug 2022 07:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380193.614275; Thu, 04 Aug 2022 07:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJUsC-0001Ie-2z; Thu, 04 Aug 2022 07:02:24 +0000
Received: by outflank-mailman (input) for mailman id 380193;
 Thu, 04 Aug 2022 07:02:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wk0C=YI=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1oJUs9-0000K7-Ss
 for xen-devel@lists.xen.org; Thu, 04 Aug 2022 07:02:22 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61b4ac22-13c3-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 09:02:20 +0200 (CEST)
Received: by mail-pl1-x636.google.com with SMTP id iw1so18529438plb.6
 for <xen-devel@lists.xen.org>; Thu, 04 Aug 2022 00:02:21 -0700 (PDT)
Received: from localhost ([122.171.18.80]) by smtp.gmail.com with ESMTPSA id
 b9-20020a170903228900b0016be596c8afsm3304467plh.282.2022.08.04.00.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 00:02:17 -0700 (PDT)
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
X-Inumbo-ID: 61b4ac22-13c3-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plcNRN/8tQG5s5rS9QurHAfD6YpV7OI/Z7FI5KAqQ4s=;
        b=K8raEjzmABAiayJjDNqkxk7YSxZQuKQXlcIUbbnRWmEDx3AaQ5MnvPI9eAvXDjQv5t
         /vG+onpXKnKLoDuuMWQAyMGwpfcGMdhVqpmWl04Mv6iKR4169ZfwhQsREaVN1jrvBQIg
         AEbYsI4FmX1SGhAozoDRcrYnnVltepQqTjbQhwJPRZkrQCEt1FWru+ZeEmaayFF7NE55
         W17YHI5wzf9iM5Xi3iEBJhoLSXqD70N2MCyP4l6/Zyc67rHn/ydYln8wPYYPBBasWQAY
         N+ufGPb5JZ3HwIJh06hzQIL7C+jqToa4A9+0eH7a/o3oyGUdM9oA6BPV7D13eWIUyBQE
         u54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plcNRN/8tQG5s5rS9QurHAfD6YpV7OI/Z7FI5KAqQ4s=;
        b=zZNb07RZTlaeG9/4G+ac/xVhnakDQqLebjWCzlQK7Eank3mug9GNKLk7GNo13Acey/
         66ZJoctVOMebh+xfUflTdrVPTe+b2uWB0OECjpuztE+p1m6nALZN6GiKxN3Ml7iLddKE
         qdB/WE65/iHy28f2MLCFU+zp4Pi3mA1oTOnooMrFnOIDg8lgm0vNqqMPQwf6w1IEU1B4
         Ca9zvcQnnMDXiGwXEZTpceWpVDCxLYy5DI430PAXrEYquXGchMn7m7sWHnX2wQ68GRT4
         78UDP4MA6jd0prW4dI+4k/4jGZV1vI/YAnsDT6ABBrEGe4dEkbSZmi3Xl0F9990aw8Hz
         Kd9Q==
X-Gm-Message-State: ACgBeo2vE3H9M9CdkydBg+auC8msuxgMrT1kuAFvK8gHeDD1pgAOiEKa
	uW6gye5MXF+zA7Go4BJZUQJs9Q03Lyc2Bg==
X-Google-Smtp-Source: AA6agR5rOsm8iFNxhTGFwolo4GgVdRr4qTTCVkcKGgqBCfdGxSNJLngy3Jw+P3Wl5rWCP4/myEVdTQ==
X-Received: by 2002:a17:902:b20d:b0:16d:aefa:8ef6 with SMTP id t13-20020a170902b20d00b0016daefa8ef6mr631278plr.90.1659596539540;
        Thu, 04 Aug 2022 00:02:19 -0700 (PDT)
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
Subject: [PATCH V3 5/6] libxl: Allocate MMIO params for I2c device and update DT
Date: Thu,  4 Aug 2022 12:31:53 +0530
Message-Id: <8dbee989789fdd872256a8679278e174c8c2bdb0.1659596139.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1659596139.git.viresh.kumar@linaro.org>
References: <cover.1659596139.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch allocates Virtio MMIO params (IRQ and memory region) and pass
them to the backend, also update Guest device-tree based on Virtio I2C
DT bindings [1].

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/i2c/i2c-virtio.yaml

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index 6a8c4d042bd9..08a1499c9523 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -112,6 +112,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         }
     }
 
+    for (i = 0; i < d_config->num_i2cs; i++) {
+        libxl_device_i2c *i2c = &d_config->i2cs[i];
+
+        int rc = alloc_virtio_mmio_params(gc, &i2c->base, &i2c->irq,
+                &virtio_mmio_base, &virtio_mmio_irq);
+        if (rc)
+            return rc;
+    }
+
     /*
      * Every virtio-mmio device uses one emulated SPI. If Virtio devices are
      * present, make sure that we allocate enough SPIs for them.
@@ -945,6 +954,26 @@ static int make_virtio_mmio_node_simple(libxl__gc *gc, void *fdt, uint64_t base,
     return fdt_end_node(fdt);
 }
 
+static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt, uint64_t base,
+                                     uint32_t irq)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq);
+    if (res) return res;
+
+    res = fdt_begin_node(fdt, "i2c");
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "virtio,device22");
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return fdt_end_node(fdt);
+}
+
 static const struct arch_info *get_arch_info(libxl__gc *gc,
                                              const struct xc_dom_image *dom)
 {
@@ -1270,6 +1299,12 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
             }
         }
 
+        for (i = 0; i < d_config->num_i2cs; i++) {
+            libxl_device_i2c *i2c = &d_config->i2cs[i];
+
+            FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq) );
+        }
+
         if (pfdt)
             FDT( copy_partial_fdt(gc, fdt, pfdt) );
 
-- 
2.31.1.272.g89b43f80a514


