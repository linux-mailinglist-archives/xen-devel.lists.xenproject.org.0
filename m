Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367824E878A
	for <lists+xen-devel@lfdr.de>; Sun, 27 Mar 2022 14:01:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295073.502184 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYRZ8-0007SZ-TU; Sun, 27 Mar 2022 12:00:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295073.502184; Sun, 27 Mar 2022 12:00:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYRZ8-0007NN-On; Sun, 27 Mar 2022 12:00:14 +0000
Received: by outflank-mailman (input) for mailman id 295073;
 Sat, 26 Mar 2022 16:59:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HfZe=UF=gmail.com=shentey@srs-se1.protection.inumbo.net>)
 id 1nY9kk-0006Rm-VE
 for xen-devel@lists.xenproject.org; Sat, 26 Mar 2022 16:59:02 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08bb333f-ad26-11ec-a405-831a346695d4;
 Sat, 26 Mar 2022 17:59:02 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id bq8so6913380ejb.10
 for <xen-devel@lists.xenproject.org>; Sat, 26 Mar 2022 09:59:01 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-089-012-231-111.89.12.pool.telefonica.de. [89.12.231.111])
 by smtp.gmail.com with ESMTPSA id
 x12-20020a50d9cc000000b0040f70fe78f3sm4515930edj.36.2022.03.26.09.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 09:59:00 -0700 (PDT)
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
X-Inumbo-ID: 08bb333f-ad26-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LkZ15wJd+LFpAdx6Z7RYH7A3b7bWmA7jprwHFNQo/OI=;
        b=aVO5+9ALXYQ2+LvXDMxIdtX5vgsMUD3RKGLQ5rKAkXg3AWbqFEkLAXQAzueihImtnQ
         l5jnGHJIGeRmY9NfJptFUkenke1t9lzmhk7WLvXi6YeTrXc44ssdXq8jOSk3NX4P4uwb
         YIQNe62roU6/GS7vqIi/T4QnrOEuDiVpW4ilV5qrIUNbPWBX7dVgZelHHmF0awHWC6Oa
         7kGIam6rXJQTJFOEmJQVuzICDsiXv6+vu/s1nQhkZ1eh/UUdqb0a8n3HbwIfckG5BVyp
         GBYO16X2OKQcP8z1M4h+RRnrOZjwjULYC1BBZ5ivOMYzR+KtErsr1WaavJoKmGQsb7ar
         tWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LkZ15wJd+LFpAdx6Z7RYH7A3b7bWmA7jprwHFNQo/OI=;
        b=SM99GtBADRO3sxR0EDAcxr7aUTgk12AFwVCTV5JCMETyvSDroE+5eTnFFZlind8PW2
         kgfJNT18vTn49EuqXMhUHm7hOmOdBtP+UZM+EovRkOPRhzNgaBS23gM85mJaV9H4nqK5
         rRshhwLUe0bmFEnFr/1s2RTGib28zSRXcV7I8ME90huceu1POGpXDUhcRGTE0APB4Rsv
         8q4XDHhqJXyMhPORFAUjk2XaxIvLIkKvRvQh82v3ct7nBc/pSdmZqcrFuaktScS5XYLB
         OL5hkIz4YWp74Nf4u4WzUZ5/Bh+7BxGwLDpnJR2b0wTyQrVGC0rix4o/U+fdYfH45A0d
         V8Uw==
X-Gm-Message-State: AOAM531GTQ/hKzbX6S3PCg2z8QzDeQqDNj89+lVJryqlLBQkVYvCNmnl
	AfWjAfGNPXvChx9AzpF7TEo=
X-Google-Smtp-Source: ABdhPJzYO2gb06syFIc8TRb0WdtWjgdYrAposyrJYvIapzWbj5+wwbunnqa50xyfLwrcULPoYggIGA==
X-Received: by 2002:a17:907:7f21:b0:6e0:355f:805e with SMTP id qf33-20020a1709077f2100b006e0355f805emr18792587ejc.752.1648313940656;
        Sat, 26 Mar 2022 09:59:00 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org (open list:X86 Xen CPUs)
Subject: [PATCH 2/2] hw/xen/xen_pt: Resolve igd_passthrough_isa_bridge_create() indirection
Date: Sat, 26 Mar 2022 17:58:24 +0100
Message-Id: <20220326165825.30794-3-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220326165825.30794-1-shentey@gmail.com>
References: <20220326165825.30794-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that igd_passthrough_isa_bridge_create() is implemented within the
xen context it may use Xen* data types directly and become
xen_igd_passthrough_isa_bridge_create(). This resolves an indirection.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/xen/xen_pt.c          | 11 -----------
 hw/xen/xen_pt.h          |  3 ++-
 hw/xen/xen_pt_graphics.c |  5 ++++-
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/hw/xen/xen_pt.c b/hw/xen/xen_pt.c
index 829ea9985f..0ec7e52183 100644
--- a/hw/xen/xen_pt.c
+++ b/hw/xen/xen_pt.c
@@ -701,17 +701,6 @@ static const MemoryListener xen_pt_io_listener = {
     .priority = 10,
 };
 
-static void
-xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
-                                      XenHostPCIDevice *dev)
-{
-    uint16_t gpu_dev_id;
-    PCIDevice *d = &s->dev;
-
-    gpu_dev_id = dev->device_id;
-    igd_passthrough_isa_bridge_create(pci_get_bus(d), gpu_dev_id);
-}
-
 /* destroy. */
 static void xen_pt_destroy(PCIDevice *d) {
 
diff --git a/hw/xen/xen_pt.h b/hw/xen/xen_pt.h
index 806d832c94..e7c4316a7d 100644
--- a/hw/xen/xen_pt.h
+++ b/hw/xen/xen_pt.h
@@ -43,7 +43,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XenPCIPassthroughState, XEN_PT_DEVICE)
 
 uint32_t igd_read_opregion(XenPCIPassthroughState *s);
 void igd_write_opregion(XenPCIPassthroughState *s, uint32_t val);
-void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id);
+void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
+                                           XenHostPCIDevice *dev);
 
 /* function type for config reg */
 typedef int (*xen_pt_conf_reg_init)
diff --git a/hw/xen/xen_pt_graphics.c b/hw/xen/xen_pt_graphics.c
index f1fbb98912..f303f67c9c 100644
--- a/hw/xen/xen_pt_graphics.c
+++ b/hw/xen/xen_pt_graphics.c
@@ -375,10 +375,13 @@ static void pt_graphics_register_types(void)
 }
 type_init(pt_graphics_register_types)
 
-void igd_passthrough_isa_bridge_create(PCIBus *bus, uint16_t gpu_dev_id)
+void xen_igd_passthrough_isa_bridge_create(XenPCIPassthroughState *s,
+                                           XenHostPCIDevice *dev)
 {
+    PCIBus *bus = pci_get_bus(&s->dev);
     struct PCIDevice *bridge_dev;
     int i, num;
+    const uint16_t gpu_dev_id = dev->device_id;
     uint16_t pch_dev_id = 0xffff;
     uint8_t pch_rev_id = 0;
 
-- 
2.35.1


