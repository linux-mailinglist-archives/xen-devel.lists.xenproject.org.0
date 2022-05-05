Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594F251B92E
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 09:33:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321564.542618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVze-0008UE-4p; Thu, 05 May 2022 07:33:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321564.542618; Thu, 05 May 2022 07:33:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmVze-0008Qx-0I; Thu, 05 May 2022 07:33:46 +0000
Received: by outflank-mailman (input) for mailman id 321564;
 Thu, 05 May 2022 07:33:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v7gz=VN=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1nmVzc-0007CX-Mi
 for xen-devel@lists.xen.org; Thu, 05 May 2022 07:33:44 +0000
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [2607:f8b0:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0a68c66-cc45-11ec-a406-831a346695d4;
 Thu, 05 May 2022 09:33:44 +0200 (CEST)
Received: by mail-pl1-x634.google.com with SMTP id i1so3631155plg.7
 for <xen-devel@lists.xen.org>; Thu, 05 May 2022 00:33:43 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 6-20020a631546000000b003c14af50628sm591840pgv.64.2022.05.05.00.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 00:33:40 -0700 (PDT)
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
X-Inumbo-ID: b0a68c66-cc45-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QGzDrTPy64513Du9xuDXa48CFlPswySc0zHzj23oYf8=;
        b=RxPh60rFi0elI38eto3TqPlDZfFZal0laZeixIdoLopmOZAb73Vxx1fWN2wCIObCvO
         jIpnaNf6YMKDdNllCJAT0oR0zpuW0nnnXshrpTKEgnYIMU7e4mZVriwWq12z4/QBI1Y3
         cAEL2FB3116miQnVi5XUfJO9mKoDw9PTEZIhf643PzJXYrO1CLUstYY3G9T5qeb+2ik3
         Wvvd6g36jxK1CYLm+h5uqKckO1k50Y7NyUjWBAzyBoGFCU333Ikd74gXUWsovu2GFp4f
         nWJWdARTUU5P8ysk0hmar4QhnI8VGSZ16+5Qp16ewKskcP1Gp/0YgpTzPp1LYg0OWcpr
         oYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QGzDrTPy64513Du9xuDXa48CFlPswySc0zHzj23oYf8=;
        b=X2iXhHMwKO3NIn70tmtYLOKllAdTSkY/9Vx1FMmrgaocYxaK/RUyMH7Uytw0RAA10p
         As5D7Pmh+1z5Fnd31VGCcc/62Gl91AAgK9Ci215y2aQXELLC5JxmTzOOMw6+vIavaYv4
         IsRWPU2xk97lzeUH9qHicZJKRwz3+Y34IkB2h56pkIreaoI4ArTgyMIq4aNHZbLCjzlu
         yF03K/3+qYb4/sLcUzll/SkDJnmJL6EI1y+/FwiXuhiHLGGgwYUNOYKWBRxl2+1jK7rY
         mQwcBn3xqpoQViIiviGmtAMAum2vrZcXyiVrFUSCkHvBiUyb0Xll4Hf+DpoednWB75vq
         3fAQ==
X-Gm-Message-State: AOAM531XrMiA6xU1dNbNEvMp+kfB9yBYD3WpQ2tvrz09ZVeug+GjGsS6
	iMQGLMe1jIYrek+1QBvYa6xcKCEa1NmSXA==
X-Google-Smtp-Source: ABdhPJwFRgUBsEWqupRmG0rkhQ5zqwButa/QLfnJhmFpSeJkJ1MEZDguOtWs3PBiKoi2GHTCECyw7Q==
X-Received: by 2002:a17:90b:3508:b0:1dc:c275:3e18 with SMTP id ls8-20020a17090b350800b001dcc2753e18mr714198pjb.245.1651736021423;
        Thu, 05 May 2022 00:33:41 -0700 (PDT)
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
Subject: [PATCH 4/4] libxl: Allocate MMIO params for GPIO device and update DT
Date: Thu,  5 May 2022 13:03:23 +0530
Message-Id: <0b8d38ef26bfa9bc150f3818108ca9e875652e5e.1651734854.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1651734854.git.viresh.kumar@linaro.org>
References: <cover.1651734854.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch allocates Virtio MMIO params (IRQ and memory region) and pass
them to the backend, also update Guest device-tree.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 60 ++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index ea633d6f91df..89e5a1e5780d 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -135,6 +135,26 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             i2c->irq, i2c->base);
     }
 
+    for (i = 0; i < d_config->num_gpios; i++) {
+        libxl_device_gpio *gpio = &d_config->gpios[i];
+
+        gpio->base = alloc_virtio_mmio_base(gc);
+        if (!gpio->base)
+            return ERROR_FAIL;
+
+        gpio->irq = alloc_virtio_mmio_irq(gc);
+        if (!gpio->irq)
+            return ERROR_FAIL;
+
+        if (virtio_irq < gpio->irq)
+            virtio_irq = gpio->irq;
+
+        virtio_enabled = true;
+
+        LOG(DEBUG, "Allocate Virtio MMIO params for GPIO: IRQ %u BASE 0x%"PRIx64,
+            gpio->irq, gpio->base);
+    }
+
     if (virtio_enabled)
         nr_spis += (virtio_irq - 32) + 1;
 
@@ -954,6 +974,41 @@ static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt,
     return 0;
 }
 
+static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt,
+                                 uint64_t base, uint32_t irq)
+{
+    int res;
+
+    res = _make_virtio_mmio_node(gc, fdt, base, irq);
+    if (res) return res;
+
+    res = fdt_begin_node(fdt, "gpio");
+    if (res) return res;
+
+    res = fdt_property_compat(gc, fdt, 1, "virtio,device29");
+    if (res) return res;
+
+    res = fdt_property(fdt, "gpio-controller", NULL, 0);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#gpio-cells", 2);
+    if (res) return res;
+
+    res = fdt_property(fdt, "interrupt-controller", NULL, 0);
+    if (res) return res;
+
+    res = fdt_property_cell(fdt, "#interrupt-cells", 2);
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    res = fdt_end_node(fdt);
+    if (res) return res;
+
+    return 0;
+}
+
 static const struct arch_info *get_arch_info(libxl__gc *gc,
                                              const struct xc_dom_image *dom)
 {
@@ -1269,6 +1324,11 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                 FDT( make_virtio_mmio_node(gc, fdt, disk->base, disk->irq) );
         }
 
+        for (i = 0; i < d_config->num_gpios; i++) {
+            libxl_device_gpio *gpio = &d_config->gpios[i];
+            FDT( make_virtio_mmio_node_gpio(gc, fdt, gpio->base, gpio->irq) );
+        }
+
         for (i = 0; i < d_config->num_i2cs; i++) {
             libxl_device_i2c *i2c = &d_config->i2cs[i];
             FDT( make_virtio_mmio_node_i2c(gc, fdt, i2c->base, i2c->irq) );
-- 
2.31.1.272.g89b43f80a514


