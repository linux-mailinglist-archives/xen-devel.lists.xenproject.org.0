Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E59C073E
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 14:26:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831814.1247207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t92Vr-0006Zj-L3; Thu, 07 Nov 2024 13:25:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831814.1247207; Thu, 07 Nov 2024 13:25:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t92Vr-0006YC-IA; Thu, 07 Nov 2024 13:25:27 +0000
Received: by outflank-mailman (input) for mailman id 831814;
 Thu, 07 Nov 2024 13:25:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tRHX=SC=gmail.com=gragst.linux@srs-se1.protection.inumbo.net>)
 id 1t92Vq-0006Jr-Ri
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 13:25:26 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be6d0503-9d0b-11ef-99a3-01e77a169b0f;
 Thu, 07 Nov 2024 14:25:23 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-539f6e1f756so975874e87.0
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 05:25:23 -0800 (PST)
Received: from epuakyiw0a98.kyiv.epam.com (ll-22.209.223.85.sovam.net.ua.
 [85.223.209.22]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53d826af003sm214286e87.265.2024.11.07.05.25.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 05:25:20 -0800 (PST)
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
X-Inumbo-ID: be6d0503-9d0b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzIiLCJoZWxvIjoibWFpbC1sZjEteDEzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImJlNmQwNTAzLTlkMGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwOTg1OTIzLjc5ODI4Mywic2VuZGVyIjoiZ3JhZ3N0LmxpbnV4QGdtYWlsLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730985923; x=1731590723; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bpKqtiiah/MyPzTQHICukxAGpceAk/bMRNOsccrstIk=;
        b=Ck6rGt5hjBYKuDZcW8jySoolSPFzJX+hmjoAW9TPyPh5CgegNG+5t5wEsuhozJRxsT
         BxyPH1fo5ubyLIbsHoeX2yFHns8htgXr5EbJOop3F00ZIdSrDqxSqj6ehVYRiLrbYYTM
         aeTYQr0pPmuw4yEkkqul1E+R6DOP0Ci3yaA99Ygd4aHd1tCoejt3hTvVzyXW5+3/GzAt
         IHHhIxU0ILP9ghl9hTTBbx7GeRtliOjyUfxyrqZAqhQFSHJLsPZitxEvRMbJ+QO1EYmX
         IAJzge/npxpXVRJNcLyNDQt7d+al0HREJaLwRxXqMGtl1ICg4uGGRWoooIjrQFWj28/y
         IE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730985923; x=1731590723;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpKqtiiah/MyPzTQHICukxAGpceAk/bMRNOsccrstIk=;
        b=TK1Is6sKvgYlajvTVmFhpupORRdWX3qD45Tg+p5BJ4kE6DyfdUndUUpFmeSb+cBMAl
         m2abEQNVh2DdRgGCQU0RnuqrmzdMkunEe7Vi6BKCFpMQH4rtZ6qRFhNt9zx3IiS/T2sU
         8NmAuf6ZwK5OqHvEGvFHPcE4EQtoSRrZaBA+R/T7ZEkQT39aymTSCu3As+TEHLIdkwVb
         v3LWEm9YdKXVvm/JX7WmbJIG0fWA66SE/yFVQbjWuRasEFJhCsGniwrKh+dRIHwAc1Ju
         tVXDiwMJ6ibAKZDk/iD4Zrx+1TKNd0Wr5iXNrg06JF7ZImA2rzecinZr2v9au23MyU6J
         Vw1g==
X-Gm-Message-State: AOJu0Yzqza4g1oyKLFbXcjNbqW/7J6DROrDXOBQpoPMdYkZnXwNjFQRv
	4l6/hqZvedJzsow4nWUlp3rNrFFNAhItFWP8hpXEO32xODLQ/YCYqYz74Ha8
X-Google-Smtp-Source: AGHT+IFWhmelZY20geYJLdWJ1tRmBFGsoNiLCmj2ZIb8PPqeoNJJsJzX90s+FodxvE+6DeAjEFC2IQ==
X-Received: by 2002:a05:6512:ad6:b0:539:fb6f:cb8d with SMTP id 2adb3069b0e04-53b348e1452mr23410418e87.27.1730985922468;
        Thu, 07 Nov 2024 05:25:22 -0800 (PST)
From: gragst.linux@gmail.com
X-Google-Original-From: grygorii_strashko@epam.com
To: xen-devel@lists.xenproject.org
Cc: Grygorii Strashko <grygorii_strashko@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Mykyta Poturai <Mykyta_Poturai@epam.com>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Subject: [PATCH] iommu/ipmmu-vmsa: Add Renesas R8A779G0 (R-Car V4H) support
Date: Thu,  7 Nov 2024 15:25:01 +0200
Message-Id: <20241107132501.724836-1-grygorii_strashko@epam.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Add Renesas R8A779G0 (R-Car V4H) IPMMU support.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
 xen/drivers/passthrough/arm/ipmmu-vmsa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
index da011413c5c0..d828d9cf6afd 100644
--- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
+++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
@@ -788,6 +788,7 @@ static void ipmmu_device_reset(struct ipmmu_vmsa_device *mmu)
 #define RCAR_PRODUCT_M3W     0x00005200
 #define RCAR_PRODUCT_M3N     0x00005500
 #define RCAR_PRODUCT_S4      0x00005A00
+#define RCAR_PRODUCT_V4H     0x00005C00
 #define RCAR_CUT_MASK        0x000000FF
 #define RCAR_CUT_VER30       0x00000020
 
@@ -836,6 +837,7 @@ static __init bool ipmmu_stage2_supported(void)
         break;
 
     case RCAR_PRODUCT_S4:
+    case RCAR_PRODUCT_V4H:
         stage2_supported = true;
         break;
 
@@ -871,6 +873,10 @@ static const struct dt_device_match ipmmu_dt_match[] __initconst =
         .compatible = "renesas,ipmmu-r8a779f0",
         .data = &ipmmu_features_rcar_gen4,
     },
+    {
+        .compatible = "renesas,ipmmu-r8a779g0",
+        .data = &ipmmu_features_rcar_gen4,
+    },
     { /* sentinel */ },
 };
 
-- 
2.34.1


