Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759811F8B13
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 00:12:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkarc-0000Ci-GJ; Sun, 14 Jun 2020 22:12:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UtKD=73=gmail.com=gorbak25@srs-us1.protection.inumbo.net>)
 id 1jkara-00009r-NB
 for xen-devel@lists.xenproject.org; Sun, 14 Jun 2020 22:12:26 +0000
X-Inumbo-ID: 1b898bb2-ae8c-11ea-8496-bc764e2007e4
Received: from mail-ej1-x643.google.com (unknown [2a00:1450:4864:20::643])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1b898bb2-ae8c-11ea-8496-bc764e2007e4;
 Sun, 14 Jun 2020 22:12:17 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id gl26so15342904ejb.11
 for <xen-devel@lists.xenproject.org>; Sun, 14 Jun 2020 15:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kLRVBuDUDaOcgBVQ0wo5+UBjW8DkKN77rftCvaZTsIA=;
 b=nekzYCKtPlBwtlHnKvgZ9CzTcRT1AtzMXQnmTO+Ob3xGKrOHXKGXinBUOlfitQfQxj
 ZCEHH+Iun4a2lBF8xkAiON++UnRrbOE31OymdlD0PHC3t+wuYyKyIx2nU0d+Y/fyFv47
 h6YeG9ALHOj+CJkXbphz5+cW8Qk/pF8Et213L8PHGdTIRvvbp1tgu/o6e5MUujYWcjCn
 q/x7AIO7U6QTbmFsuSrYCN502H+bD8/oj9kCiClP2/2dYf00xGN6Rq51llar0eVlwksR
 KTZdIAsPZTBTCQRjBd0iprT2fWDeovBcOmWB6bTZBKw1kOVLJbpWTKtIWE4or+AFvc4/
 5DtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kLRVBuDUDaOcgBVQ0wo5+UBjW8DkKN77rftCvaZTsIA=;
 b=g8PP/JF8ae/cdlqh+0tDrVLCHie4S6s+iYAoC/tJx4dR72a4MnTGB6d4b4CPrZP/dl
 /RfCYSFigBsZV7qUrhpG8zhK4MD3XN58N5y907VkRtcdSdOsY9ahOlMGd+bFsLdf9EsY
 J/JWj/btUes8XZOjDMqBpHaphDH/QoYh0BqtHeYPcVLiPYgiQr/JAvN5W9DJ3edZUpxd
 KmU1jv/NPtUWbui3EnLLdjS7rsK7SWlBgt0YWHdLMpeTiSlVRGlmRsNW7kd9m1R4s5n9
 ZhKSJlBqXB/2YksiHq87Ta+9CXx7h7+JsK4Wrw2cW58UNI0ntpShD/iT5SysvKZXfkDc
 h5Zw==
X-Gm-Message-State: AOAM530F8Xc7fJ0aRrU43gjKtvaVrnlUX5rYmRhxueUe5XhWrwQ1XAHU
 hfiCjqBeaE774jp0ML6Q14FKE6u41GBXeQ==
X-Google-Smtp-Source: ABdhPJz0czg6GoGOiQFBr78sHMKFKu2xW2RrdQcRTPNKDp6zAcszpEcJ6ykOIpV0LcbSQwAIhSlTJg==
X-Received: by 2002:a17:907:2162:: with SMTP id
 rl2mr21608022ejb.365.1592172736358; 
 Sun, 14 Jun 2020 15:12:16 -0700 (PDT)
Received: from localhost.localdomain (public-gprs354212.centertel.pl.
 [37.47.14.229])
 by smtp.gmail.com with ESMTPSA id o13sm7772828ejb.46.2020.06.14.15.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Jun 2020 15:12:15 -0700 (PDT)
From: Grzegorz Uriasz <gorbak25@gmail.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 3/3] tools/libxl: Directly map VBIOS to stubdomain
Date: Sun, 14 Jun 2020 22:12:03 +0000
Message-Id: <9817b73ea628c7ac86903bb9aa7fcfecf4f7b900.1592171394.git.gorbak25@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1592171394.git.gorbak25@gmail.com>
References: <cover.1592171394.git.gorbak25@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <wl@xen.org>, jakub@bartmin.ski,
 Ian Jackson <ian.jackson@eu.citrix.com>, marmarek@invisiblethingslab.com,
 Grzegorz Uriasz <gorbak25@gmail.com>, j.nowak26@student.uw.edu.pl,
 Anthony PERARD <anthony.perard@citrix.com>, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

When passing through a IGD VGA device qemu needs to copy the host VBIOS
to the target domain. Right now the current implementation on the qemu side
is one big undefined behavior as described in my qemu patchset here:
https://patchew.org/QEMU/20200428062847.7764-1-gorbak25@gmail.com/
This patch is tied to the linked patchset for qemu but fortunately
this patch still works without the qemu part merged. When the qemu part
gets merged then qemu will access the VBIOS using /dev/mem - this is
required as currently the linux kernel forbids accessing this memory
region when the VBIOS is corrupted - which will always be the case as
described in the linked patchset. When qemu is running inside a linux
based stubdomain then the stubdomain does not have access to the VBIOS.
This patch maps the VBIOS to the stubdomain so qemu with my fixes may
create a shadow copy for the target domain.

Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
---
 tools/libxl/libxl_pci.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
index 48b1d8073b..9b9564dd73 100644
--- a/tools/libxl/libxl_pci.c
+++ b/tools/libxl/libxl_pci.c
@@ -2445,6 +2445,8 @@ static int libxl__grant_legacy_vga_permissions(libxl__gc *gc, const uint32_t dom
     int ret, i;
     uint64_t vga_iomem_start = 0xa0000 >> XC_PAGE_SHIFT;
     uint64_t vga_iomem_npages = 0x20;
+    uint64_t vga_vbios_start = 0xc0000 >> XC_PAGE_SHIFT;
+    uint64_t vga_vbios_npages = 0x20;
     uint32_t stubdom_domid = libxl_get_stubdom_id(CTX, domid);
     uint64_t vga_ioport_start[] = {0x3B0, 0x3C0};
     uint64_t vga_ioport_size[] = {0xC, 0x20};
@@ -2460,6 +2462,7 @@ static int libxl__grant_legacy_vga_permissions(libxl__gc *gc, const uint32_t dom
               vga_iomem_start, (vga_iomem_start + (vga_iomem_npages << XC_PAGE_SHIFT) - 1));
         return ret;
     }
+
     ret = xc_domain_iomem_permission(CTX->xch, domid,
                                      vga_iomem_start, vga_iomem_npages, 1);
     if (ret < 0) {
@@ -2470,6 +2473,13 @@ static int libxl__grant_legacy_vga_permissions(libxl__gc *gc, const uint32_t dom
         return ret;
     }
 
+    /* VGA ROM */
+    ret = xc_domain_memory_mapping(CTX->xch, stubdom_domid, vga_vbios_start, vga_vbios_start, vga_vbios_npages, DPCI_ADD_MAPPING);
+    if (ret < 0) {
+        LOGED(ERROR, domid, "failed to map VBIOS to stubdom%d", stubdom_domid);
+        return ret;
+    }
+
     /* VGA IOPORTS */
     for (i = 0 ; i < 2 ; i++) {
         ret = xc_domain_ioport_permission(CTX->xch, stubdom_domid,
-- 
2.27.0


