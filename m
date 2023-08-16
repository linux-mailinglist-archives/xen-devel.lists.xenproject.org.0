Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B438B77DECB
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:32:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584507.915406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpD-00072D-JY; Wed, 16 Aug 2023 10:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584507.915406; Wed, 16 Aug 2023 10:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpC-0006lM-Pk; Wed, 16 Aug 2023 10:32:26 +0000
Received: by outflank-mailman (input) for mailman id 584507;
 Wed, 16 Aug 2023 10:32:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDe4-0003R9-Jh
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:56 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94a37645-3c1e-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 12:20:53 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2bb9a063f26so4877431fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:53 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:52 -0700 (PDT)
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
X-Inumbo-ID: 94a37645-3c1e-11ee-8779-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181253; x=1692786053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a5o/J0Yhy4zQnMbYIdMWJX60W2Yerk1IC1deMjRe2no=;
        b=sr51+ZqaNCC8F3FLT++AiEX4BmivgASgkqfxYcbwMmvh93OejrpnbMnEV3BiIK1q5q
         hI4/sKh3UHlNh4p7t2YMKUl5JephP+022eEB2tSz61A9OXsq6wxLE0CNnAgLV6nuIuAE
         9OjU4PLZZgGpihmiI9RUohX6DHrSJ5/m+Hbho8jEl9gQWRFogMPoDt2OdbZ31CdYcaV1
         lf1QaDa4bMUP1rxlvlGvib4ecvDnJnekiiimZGKa/gmgnub50WmF53L3p+fq1QvO1Ycx
         yNdPPzSxMLegLlghV//+Y7cUlKEUygQ5vIzRW9RWuektsugMR+8z4Uqhuil1jj1eW5nd
         kfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181253; x=1692786053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5o/J0Yhy4zQnMbYIdMWJX60W2Yerk1IC1deMjRe2no=;
        b=C/uo5pt0vtTN0E3FlRbKSN4KxexLT+0RE57j6jVjRsaMtY/1vahixxWUJUb/VNVwSe
         6fIemtcM/fr53ttzi9E9fUM2vruZ+JmDHe/xOWX2R37AGTDHNywjM/MAUXzJDPEYAf6j
         9LIyDv3wYD+dJ5AgN1mTKkmHoUg+Z77W6gWe6r9nraUXYpaz+pY7kGuIdXtXLi6rWNl6
         4fLzmAN0Jk8fOenUi1OfgB66HSxsCCOYL/Xwg5jEw5D/oog2kVvppcPdZHl4hqeXqcX9
         38inGOL6bYC17FI+B/gnI4zDasHYsh9AK8QoExWmmG3T+XUCozDkaOpB+1+qchEs/Lvo
         a1oQ==
X-Gm-Message-State: AOJu0YxbB7QHvCGTjJ08ofj3iKuxSW7oXH2VS51QzNPU+92EPv+Qo+BP
	0vtQdD+q+46bl9jBrtXgFo9ceP3mX4VyK5KU
X-Google-Smtp-Source: AGHT+IGc4HRQkUQ4oizER2Lxid9+s3toHPwW+S5C/FlXgrPoF7uyRY4LwRlLNBqL31IvVoUed0+3IQ==
X-Received: by 2002:a2e:8341:0:b0:2b9:e053:79d8 with SMTP id l1-20020a2e8341000000b002b9e05379d8mr1071162ljh.18.1692181252829;
        Wed, 16 Aug 2023 03:20:52 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 46/57] xen/riscv: define an address of frame table
Date: Wed, 16 Aug 2023 13:19:59 +0300
Message-ID: <8d3a615afbcff9681aa0ba8e2272d7e7e26251d1.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Also the patchs adds some helpful macros.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/config.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index fa90ae0898..63ddcae1f9 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -77,12 +77,31 @@
   name:
 #endif
 
+#define VPN_BITS    (9)
+#define OFFSET_BITS (12)
+
 #ifdef CONFIG_RISCV_64
+
+#define SLOTN_ENTRY_BITS        (HYP_PT_ROOT_LEVEL * VPN_BITS + OFFSET_BITS)
+#define SLOTN(slot)             (_AT(vaddr_t,slot) << SLOTN_ENTRY_BITS)
+#define SLOTN_ENTRY_SIZE        SLOTN(1)
+
 #define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 - GB(1)) */
+
+#define FRAMETABLE_VIRT_START   SLOTN(196)
+#define FRAMETABLE_SIZE         GB(3)
+#define FRAMETABLE_NR           (FRAMETABLE_SIZE / sizeof(*frame_table))
+#define FRAMETABLE_VIRT_END     (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
+
+#define VMAP_VIRT_START         SLOTN(194)
+#define VMAP_VIRT_SIZE          GB(1)
+
 #else
 #error "RV32 isn't supported"
 #endif
 
+#define HYPERVISOR_VIRT_START XEN_VIRT_START
+
 #define SMP_CACHE_BYTES (1 << 6)
 
 #define STACK_SIZE PAGE_SIZE
@@ -95,6 +114,8 @@
 #define RV_STAGE1_MODE SATP_MODE_SV32
 #endif
 
+#define HYP_PT_ROOT_LEVEL (CONFIG_PAGING_LEVELS - 1)
+
 #endif /* __RISCV_CONFIG_H__ */
 /*
  * Local variables:
-- 
2.41.0


