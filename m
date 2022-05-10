Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 330B8520D94
	for <lists+xen-devel@lfdr.de>; Tue, 10 May 2022 08:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.325182.547694 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noIzn-0001Dl-Hq; Tue, 10 May 2022 06:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 325182.547694; Tue, 10 May 2022 06:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1noIzn-00019P-EZ; Tue, 10 May 2022 06:05:19 +0000
Received: by outflank-mailman (input) for mailman id 325182;
 Tue, 10 May 2022 06:05:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+NA3=VS=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1noIzm-0007z7-44
 for xen-devel@lists.xen.org; Tue, 10 May 2022 06:05:18 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 232c783a-d027-11ec-8fc4-03012f2f19d4;
 Tue, 10 May 2022 08:05:06 +0200 (CEST)
Received: by mail-pj1-x1029.google.com with SMTP id
 w17-20020a17090a529100b001db302efed6so1258812pjh.4
 for <xen-devel@lists.xen.org>; Mon, 09 May 2022 23:05:17 -0700 (PDT)
Received: from localhost ([122.162.234.2]) by smtp.gmail.com with ESMTPSA id
 i63-20020a636d42000000b003c14af5062esm9489879pgc.70.2022.05.09.23.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 23:05:15 -0700 (PDT)
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
X-Inumbo-ID: 232c783a-d027-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LdUL/a7ibfgZJBH8Cwv9KTcb3UJUgKsljFq91lvqCvU=;
        b=k181qsg4Qqs42nA6b8nsKIeuG8Fdeh1LZm41PT3KKx6dGkeV/r8YFGCtyV57yQuzjo
         kIptadhPH57dwBQtf0tn1kRKYhyF+sC+KZvhttghy8dnvrYJAA0A1v93+Ovo28q34zvS
         cRhJFtZh4Fn015Q9ZING6/pjkd9+PBoKa9vaYQzXm1hkOqrVS2ACRbwKNts1dVD1z4KR
         hOzxtV7WYkIHKmgTbJwg7DkSfa7EKdrNqf60YoeJItsYva2LqK2puY+vy9S/pdxYSfrB
         YWLg1q8SjkmLT9ZUp74vAzgRJJd9HUrhVd/hLn2sSDCEXOeKnHoCihy8S7gK1in4dNWL
         ZOMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LdUL/a7ibfgZJBH8Cwv9KTcb3UJUgKsljFq91lvqCvU=;
        b=gzoozIml9x0MjzhbJ4PpqUYaaFlJVkAsb4r5X8U5R5Z4TbLBMA+Zr9RarJ6ZN6XN6j
         vWdi+X0pwfQ2ypDlNaX41nzBY2IzEPzZz/8NoIvgcNiuOU2KOwSSc9j2LQfsl0Rzbl7B
         6ic4sB2+03ylata/CVWszOiZhVzMOJf0yvz2SqBTE38KXw84ugbqP/FsjW3lvnJ5SLo6
         /pXP6L7IRmeNC8h7VSGes+B1h+PIDHsSalqB4hMHznOUKh/Z9BT+pGQPuZiXWSWmlTmj
         SwnkQTw1uAJsg185gL1MPux24uMP6FQWN0v3U4EfTp0DD5oSofYMntZfjq7Eg59sazWz
         BJkQ==
X-Gm-Message-State: AOAM533XgfFtaAnDZcVBT+NOMAQG+qSn8mP/t9U91hRJjCcqCTmgHWzi
	EIH9Yi9E+29EfOkB8FYTtiZzXIiyFmM1ZQ==
X-Google-Smtp-Source: ABdhPJw/ICaJJRhvcX/HWYXMOuOkkNrEi+Qx5x4tMRG+zUNhqhq33zc7z7WNf7qxwb1Sgq1hPehPuw==
X-Received: by 2002:a17:902:70c9:b0:15f:a78:fd15 with SMTP id l9-20020a17090270c900b0015f0a78fd15mr9855184plt.12.1652162715940;
        Mon, 09 May 2022 23:05:15 -0700 (PDT)
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
Subject: [PATCH V2 6/6] libxl: Allocate MMIO params for GPIO device and update DT
Date: Tue, 10 May 2022 11:34:51 +0530
Message-Id: <5bae7f1e7fe2415f075e71353e3ca12f8f662b05.1652162646.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
In-Reply-To: <cover.1652162646.git.viresh.kumar@linaro.org>
References: <cover.1652162646.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch allocates Virtio MMIO params (IRQ and memory region) and pass
them to the backend, also update Guest device-tree based on Virtio GPIO
DT bindings [1].

[1] https://www.kernel.org/doc/Documentation/devicetree/bindings/gpio/gpio-virtio.yaml

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 tools/libs/light/libxl_arm.c | 46 ++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index d085c7cf4dbd..2f23430a3ea3 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -119,6 +119,15 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
             return rc;
     }
 
+    for (i = 0; i < d_config->num_gpios; i++) {
+        libxl_device_gpio *gpio = &d_config->gpios[i];
+
+    int rc = alloc_virtio_mmio_params(gc, &gpio->base, &gpio->irq,
+            &virtio_mmio_base, &virtio_mmio_irq);
+    if (rc)
+        return rc;
+    }
+
     if (virtio_mmio_irq != GUEST_VIRTIO_MMIO_SPI_FIRST) {
         virtio_irq = virtio_mmio_irq - 1;
         nr_spis += (virtio_irq - 32) + 1;
@@ -938,6 +947,38 @@ static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt,
     return fdt_end_node(fdt);
 }
 
+static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt,
+                                 uint64_t base, uint32_t irq)
+{
+    int res;
+
+    res = make_virtio_mmio_node_common(gc, fdt, base, irq);
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
+    return fdt_end_node(fdt);
+}
+
 static const struct arch_info *get_arch_info(libxl__gc *gc,
                                              const struct xc_dom_image *dom)
 {
@@ -1253,6 +1294,11 @@ static int libxl__prepare_dtb(libxl__gc *gc, libxl_domain_config *d_config,
                 FDT( make_virtio_mmio_node_simple(gc, fdt, disk->base, disk->irq) );
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


