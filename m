Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB22AA7725
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 18:23:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974787.1362589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAtA1-0006oj-Op; Fri, 02 May 2025 16:22:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974787.1362589; Fri, 02 May 2025 16:22:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAtA1-0006kl-I2; Fri, 02 May 2025 16:22:49 +0000
Received: by outflank-mailman (input) for mailman id 974787;
 Fri, 02 May 2025 16:22:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EvHp=XS=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1uAt9z-0005rY-Lg
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 16:22:47 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae782e10-2771-11f0-9ffb-bf95429c2676;
 Fri, 02 May 2025 18:22:46 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ace3b03c043so324833566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 02 May 2025 09:22:46 -0700 (PDT)
Received: from fedora.. (user-109-243-69-225.play-internet.pl.
 [109.243.69.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1894c01f2sm68158766b.119.2025.05.02.09.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 09:22:45 -0700 (PDT)
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
X-Inumbo-ID: ae782e10-2771-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746202965; x=1746807765; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUnfT2l87qKF2diopszkoUIkPb5NuR2WPUZYnC7hfok=;
        b=UqivhO8hk9oL+PFMO3RH8AC5oPzvK4i6e94TB8Bs4u94VVuJhQiFREHSlbekRYTteS
         8qDKAvG6aaFzpmChPvcLWaeEkU9TC6IZbSDPtxQdojpRhQcXVpD9bQ3rIjrpKy/hpjx+
         h0oLBeSmswgWx8NrkXlH7ZneVSzpucNpVsCSa/BP4EA4Xzkx75EthcIznD2+iP7H/TVH
         ce5SrHFK/rJGLp8q3sC28e4cxU7833F51xWiOneGWy6y3jl52AuQGy8qUt+bnjc9fk0a
         +7h6SnG5ZMy0TZNb/Zxfz2fElUvXHRxhNNRThiGCGTZihQTARS80Nv6MBS6bCG2PBark
         tq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746202965; x=1746807765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GUnfT2l87qKF2diopszkoUIkPb5NuR2WPUZYnC7hfok=;
        b=Bu6WLeICisOBxdF+li+fUpZJHkxqW1ddmL6QZya0JSwvHByOoOcEtC5+K7o61C/1Ht
         f097k8thUI8VH5D9fzktmp/GjgkSvyJ+uLDuHzxbEv1TH/VmRJ3OSH4jlfUA6gkS0UBt
         JbSB64DpcOA5qq1ZMkrEsce+OcmeJb9OZuKq4XlDYjRg9+OXDKtciJNsoKIBIyBylQkh
         Bczj9ZeM9WVA/b0v+2MFdT3QPK22jYP6DIPShZ2ke4BATdjfjNaR3sJRr9GVz7nfDE8G
         JJFGUENtuqI9c5j3CIU/5RxcAshpRM5wWe6xsT32c9Rjw1eqIhP9r+K8YgYwGCtPr/+y
         8ncg==
X-Gm-Message-State: AOJu0YzYWTyxYa2xPAqLktu33/hgusSDXeo04SIUHJYfKvls0CnsvYn3
	cI2+7PqjZBrIZH/Q38NUR5hGY5vJ4+poguePFnlf1DBXlv0l3Z4kOZVC1w==
X-Gm-Gg: ASbGncvaXF1fm+BUEKSDGhqy1DJzWMhy4cNarPy6h10O+g+LN6yE699N3kBdxXls4FB
	LjFwp+zndSh6mAuMjrsdGpK+JdkLIJ4R3V1zsxtklYFFsEo5nLICR77TsIzxuzFqLzRN6+prwHC
	j6DUNQ8JHsAMXkKKnGiZ2zJoTXtdQFE6LWKg14IqFfk3p+hK8GbxtjSN+XWaKctWHTbwQEMHPcw
	UGjPTm17Cc9xm8XJXEOVgULBa5axHFasWpAGmkhHcBz9eIR+4OitDQoA88Qgw6+bfqbylVb7Y7a
	8+sk1A5v1Wh9nxBJyGzedHl+33kk09D6UUFnHEVP4HFz450yTNze+P3zI+qx8dA1gZkEWZTbGXS
	TheAcsM0Plg==
X-Google-Smtp-Source: AGHT+IGtFzwT6D6y10u4kO1tm8gVNtyNHsF29taj/ekvV8Ee/bnhSAIr3w8QQ8ZXv7tca3xsqBx1mw==
X-Received: by 2002:a17:907:60cf:b0:ac3:446d:142 with SMTP id a640c23a62f3a-ad17ad39ff9mr376934066b.2.1746202965316;
        Fri, 02 May 2025 09:22:45 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 4/8] arm/static-shmem.h: drop inclusion of asm/setup.h
Date: Fri,  2 May 2025 18:22:34 +0200
Message-ID: <5e02dc75f4f396d054e9b9206b9305889cadb1a5.1746199009.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746199009.git.oleksii.kurochko@gmail.com>
References: <cover.1746199009.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nothing is dependent from asm/setup.h in asm/static-shmem.h so inclusion of
asm/setup.h is droped.

After this drop the following compilation error related to impicit declaration
of the following functions device_tree_get_reg and map_device_irqs_to_domain,
device_tree_get_u32 occur during compilation of dom0less-build.c ( as they are
declared in asm/setup.h ).

Add inclusion of <asm/setup.h> in dt-overlay.c as it is using handle_device()
declared in <asm/setup.h>.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2-3:
 - Nothing changed. Only rebase.
---
 xen/arch/arm/dom0less-build.c       | 1 +
 xen/common/device-tree/dt-overlay.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index c0634dd61e..7eecd06d44 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -20,6 +20,7 @@
 #include <asm/dom0less-build.h>
 #include <asm/domain_build.h>
 #include <asm/grant_table.h>
+#include <asm/setup.h>
 #include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
diff --git a/xen/common/device-tree/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
index 81107cb48d..d184186c01 100644
--- a/xen/common/device-tree/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -13,6 +13,8 @@
 #include <xen/libfdt/libfdt.h>
 #include <xen/xmalloc.h>
 
+#include <asm/setup.h>
+
 #define DT_OVERLAY_MAX_SIZE KB(500)
 
 static LIST_HEAD(overlay_tracker);
-- 
2.49.0


