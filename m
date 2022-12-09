Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6957647A91
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 01:14:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457499.715425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3R1f-0002zB-0t; Fri, 09 Dec 2022 00:14:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457499.715425; Fri, 09 Dec 2022 00:14:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3R1e-0002vj-SD; Fri, 09 Dec 2022 00:14:02 +0000
Received: by outflank-mailman (input) for mailman id 457499;
 Fri, 09 Dec 2022 00:14:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aovy=4H=linaro.org=viresh.kumar@srs-se1.protection.inumbo.net>)
 id 1p3R1c-0002vd-Ds
 for xen-devel@lists.xen.org; Fri, 09 Dec 2022 00:14:00 +0000
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [2607:f8b0:4864:20::1029])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fe4f160-7756-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 01:13:58 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id js9so2121701pjb.2
 for <xen-devel@lists.xen.org>; Thu, 08 Dec 2022 16:13:58 -0800 (PST)
Received: from localhost ([122.172.87.149]) by smtp.gmail.com with ESMTPSA id
 c13-20020a170902c1cd00b001898ee9f723sm31657plc.2.2022.12.08.16.13.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Dec 2022 16:13:56 -0800 (PST)
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
X-Inumbo-ID: 5fe4f160-7756-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KJwro0Ojinz8n+VhqRodmJ/6fJKHl5xhktqqLHt5/sE=;
        b=w7qojt+COFQBxunOWluOIOrI2TF0VY3fuOqr9gejF4667t8Kui3SF7lJq9TOwMoviE
         Ovrv76THsd4cuJHo/FV7qDORXX9B0xWYsxvPNs5P5Jg147KA7+fu7+F5Aig4W2dtrxYf
         3RYJksjuYMAz9zQOoGAuzGsXzxkcFbJli9a8jDD9dNtTLaXi+gfipHsD3cEWvK10mdvb
         78rfrpjhWjDuMJ/qLAid8bHCDnIck4i6ROlhoVCkIuqCsAtgeubI29ZZONtRGV7ZG6V2
         7Bl+AmsIh+YvZbR6i0+bluYd73RBMk46bQRjduEWZ+YpeQOHLFNS8zZEU11uXu5TKpoz
         Wbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJwro0Ojinz8n+VhqRodmJ/6fJKHl5xhktqqLHt5/sE=;
        b=Ss3j8WnCnVCdpTCAymP8q/r323FUXYXGat0OMEp++tHrorVNaI8TP7h3WMH6QL8qo2
         Mcs2XwyUuWArWkZ08DhlO0BE2o7Rs3tPizv3a739ExiX3azFQSwgP8nb3KjmmU7AHuSN
         7c6X0g5Y1Q9+aSdwULDRHfd0UhCFdt8MnFKIO/gR1yqbA82MH7fjEBLLSaPpKQhgtcwq
         odHswnKnGH0/I5q+l9wigT3QdCeR4+7eOjuKEbOSrCPyIYTKIJjaA+jAGwJgm/S0io/a
         P9Ja5cbzU1yTVuXpBlNOuWPl1/K5kej3sDT3lFd7p/g3RbhXKPmMHydwoilvUAgFDGo1
         GRLQ==
X-Gm-Message-State: ANoB5pm8HXes+cUSre6zTGMvEKXsv6OFjgi0TRg85VLHKQjWlZYUzYVO
	ApwYLGWlVPIjwx5mmtQAXy4PZA==
X-Google-Smtp-Source: AA0mqf7BCUx10WZXYz0Do+rUldVC0Acgwv1SleW4Eqy/OYQpxpqHUbRhMfhv91586zQEf7m3KmiRsw==
X-Received: by 2002:a17:902:ba95:b0:185:441f:7091 with SMTP id k21-20020a170902ba9500b00185441f7091mr3499000pls.22.1670544837155;
        Thu, 08 Dec 2022 16:13:57 -0800 (PST)
Date: Fri, 9 Dec 2022 05:43:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xen.org, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	stratos-dev@op-lists.linaro.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>,
	Mathieu Poirier <mathieu.poirier@linaro.com>,
	Mike Holmes <mike.holmes@linaro.org>,
	Oleksandr Tyshchenko <olekstysh@gmail.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH V7 1/3] libxl: Add support for generic virtio device
Message-ID: <20221209001354.ufvavrxvucdvzjks@vireshk-i7>
References: <cover.1670396758.git.viresh.kumar@linaro.org>
 <903506db6c7dadb2a5304e9894950c673e308f41.1670396758.git.viresh.kumar@linaro.org>
 <Y5InlfaQoY18WjZe@perard.uk.xensource.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5InlfaQoY18WjZe@perard.uk.xensource.com>

On 08-12-22, 18:06, Anthony PERARD wrote:
> Nit: Something like:
>     const char check[] = "virtio,device";
>     const size_t checkl = sizeof(check) - 1;
>     ... strncmp(tmp, check, checkl)...
>     (or just strncmp(tmp, check, sizeof(check)-1))
> would avoid issue with both string "virtio,device" potentially been
> different.

I think that is a generic problem with all the strings I am using. What about
this diff over current patch ?

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index ab3668b3b8a3..292b31881210 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -981,7 +981,7 @@ static int make_virtio_mmio_node_i2c(libxl__gc *gc, void *fdt)
     res = fdt_begin_node(fdt, "i2c");
     if (res) return res;
 
-    res = fdt_property_compat(gc, fdt, 1, "virtio,device22");
+    res = fdt_property_compat(gc, fdt, 1, VIRTIO_DEVICE_TYPE_I2C);
     if (res) return res;
 
     return fdt_end_node(fdt);
@@ -999,7 +999,7 @@ static int make_virtio_mmio_node_gpio(libxl__gc *gc, void *fdt)
     res = fdt_begin_node(fdt, "gpio");
     if (res) return res;
 
-    res = fdt_property_compat(gc, fdt, 1, "virtio,device29");
+    res = fdt_property_compat(gc, fdt, 1, VIRTIO_DEVICE_TYPE_GPIO);
     if (res) return res;
 
     res = fdt_property(fdt, "gpio-controller", NULL, 0);
@@ -1021,23 +1021,20 @@ static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
                                         uint32_t irq, const char *type,
                                         uint32_t backend_domid)
 {
-    int res, len = strlen(type);
+    int res;
 
     res = make_virtio_mmio_node_common(gc, fdt, base, irq, backend_domid);
     if (res) return res;
 
     /* Add device specific nodes */
-    if (!strncmp(type, "virtio,device22", len)) {
+    if (!strcmp(type, VIRTIO_DEVICE_TYPE_I2C)) {
         res = make_virtio_mmio_node_i2c(gc, fdt);
         if (res) return res;
-    } else if (!strncmp(type, "virtio,device29", len)) {
+    } else if (!strcmp(type, VIRTIO_DEVICE_TYPE_GPIO)) {
         res = make_virtio_mmio_node_gpio(gc, fdt);
         if (res) return res;
-    } else if (!strncmp(type, "virtio,device", len)) {
-        /* Generic Virtio Device */
-        res = fdt_end_node(fdt);
-        if (res) return res;
-    } else {
+    } else if (strcmp(type, VIRTIO_DEVICE_TYPE_GENERIC)) {
+        /* Doesn't match generic virtio device */
         LOG(ERROR, "Invalid type for virtio device: %s", type);
         return -EINVAL;
     }
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index cdd155d925c1..a062fca0e2bb 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -166,6 +166,11 @@
 /* Convert pfn to physical address space. */
 #define pfn_to_paddr(x) ((uint64_t)(x) << XC_PAGE_SHIFT)
 
+/* Virtio device types */
+#define VIRTIO_DEVICE_TYPE_GENERIC   "virtio,device"
+#define VIRTIO_DEVICE_TYPE_GPIO      "virtio,device22"
+#define VIRTIO_DEVICE_TYPE_I2C       "virtio,device29"
+
 /* logging */
 _hidden void libxl__logv(libxl_ctx *ctx, xentoollog_level msglevel, int errnoval,
              const char *file /* may be 0 */, int line /* ignored if !file */,
diff --git a/tools/libs/light/libxl_virtio.c b/tools/libs/light/libxl_virtio.c
index 64cec989c674..183d9c906e27 100644
--- a/tools/libs/light/libxl_virtio.c
+++ b/tools/libs/light/libxl_virtio.c
@@ -62,7 +62,7 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
                                        libxl_device_virtio *virtio)
 {
     const char *be_path, *tmp = NULL;
-    int rc;
+    int rc, len = sizeof(VIRTIO_DEVICE_TYPE_GENERIC) - 1;
 
     virtio->devid = devid;
 
@@ -97,10 +97,8 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
     if (rc) goto out;
 
     if (tmp) {
-        if (!strncmp(tmp, "mmio", strlen(tmp))) {
+        if (!strcmp(tmp, "mmio")) {
             virtio->transport = LIBXL_VIRTIO_TRANSPORT_MMIO;
-        } else if (!strncmp(tmp, "unknown", strlen(tmp))) {
-            virtio->transport = LIBXL_VIRTIO_TRANSPORT_UNKNOWN;
         } else {
             return ERROR_INVAL;
         }
@@ -112,8 +110,8 @@ static int libxl__virtio_from_xenstore(libxl__gc *gc, const char *libxl_path,
     if (rc) goto out;
 
     if (tmp) {
-        if (!strncmp(tmp, "virtio,device", strlen("virtio,device"))) {
-            virtio->type = strdup(tmp);
+        if (!strncmp(tmp, VIRTIO_DEVICE_TYPE_GENERIC, len)) {
+            virtio->type = libxl__strdup(NOGC, tmp);
         } else {
             return ERROR_INVAL;
         }

-- 
viresh

