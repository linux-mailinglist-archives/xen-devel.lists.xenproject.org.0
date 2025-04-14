Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11C6A887D7
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 17:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950711.1346950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MB0-0000Ak-53; Mon, 14 Apr 2025 15:56:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950711.1346950; Mon, 14 Apr 2025 15:56:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MB0-00007v-0r; Mon, 14 Apr 2025 15:56:50 +0000
Received: by outflank-mailman (input) for mailman id 950711;
 Mon, 14 Apr 2025 15:56:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YdIb=XA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1u4MAy-0008LI-LV
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 15:56:48 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 119cce06-1949-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 17:56:46 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-ac2a81e41e3so808862266b.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 08:56:46 -0700 (PDT)
Received: from fedora.. (user-109-243-64-225.play-internet.pl.
 [109.243.64.225]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb4288sm951760866b.96.2025.04.14.08.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 08:56:45 -0700 (PDT)
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
X-Inumbo-ID: 119cce06-1949-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744646206; x=1745251006; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Lq5mEW6mI18WMUBH5O3rO4qgR6VSRrIO7ZvgOMZ7TA=;
        b=j6Hqv32Pe9SiuH/rKZ2faDSILfZrgmUIrCvH1cTz5oteciSciZw8eZnZq30UyjIt3n
         sc2cF2h/k4va+iEGgoMtXQpYq6CQr97IlygxZXucEwBvy9c8mWnjQze26zuXJAi1pbn8
         E9LbX2hYld5A+MPxLVokr9LI6J/wtl4BmJoMG34Bjsvi+UfvM97TYM5lLS8haxCLXe08
         zfei5qj3N7gSiCBj0CWkJvzBILifGNceQ/JCKQyYgMKgo9Y9G1b3VTI9wY55fwEbS3RA
         ze/RASOqPkjLfeYTAgq5yRVhkJDZMA69SNllxVNgqNtWg/qHbnPwTH5OF1fjr+U0kJK4
         itng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646206; x=1745251006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Lq5mEW6mI18WMUBH5O3rO4qgR6VSRrIO7ZvgOMZ7TA=;
        b=rrHTA7hkTV5w9hwgDuS4Zt0+VTcvErpoHhxFENFUu7TEm0OxVOy1w/18Gs2N+TNeSQ
         HVZuGtWhGQKaSVSbVBPx8mwX1y2YyhP5R9ZMMxZQkY4K3f48mv94yTjX+1r1wOmtz4zw
         4QLSCFsSo4EvhpwXYUoJRAEzB9r4VaS4dqby9bCYgrlHU/oGIXVgRLF0CwruN/mqdcbq
         rdA6Y7bRA1dOgbKypRiGLxcbgrw/ah2GoDBOyPsPTr8wZFUEX7WQYiou25l/Kwdzv+YW
         rDJne9B++PNVHVSeiMEIvK1zN9stHHO6yE+Sb2LmhnGIj9xavQ/cS1kAMZIZf/ZtWxSj
         5mBA==
X-Gm-Message-State: AOJu0YwNIb5caOOMvpBcz081wulmJuVHvGW2Iiju3Z1VSwoQpNyObpZe
	dbAKC/Kjr2DfBLvw0eEew6m24mXES1G8LliyC5nL5HPINxwinEV5YF7LTw==
X-Gm-Gg: ASbGncvc7wsGdtL9cZWfwIG7UQ1b8xxw6gbxw72sv9OAElHpKB+UgvwKN7o00cHhQH9
	oLeOMYUhwveG0RlskhKiwPlEIsiKxR+AEZtyVsPwXdbIpznfa46mDp6C7aJkOVleHcjh1tzZ6YV
	+Kf4gSH5It8eMCxnJJ7ktqJoydfA4syich+Du7zvPwkE4SjeWoLgVMwn+PxqkrINMfvS4zM3kwY
	6f4eLIqieMuNortSwMc+DE2cgzjOLHNglzY9YE0YwtStD8jukFdfeYYbVm82IYw16xiMJW0ks1S
	psLh7dncHbdcs/8btFhBRF7kuCDSNTk5iaUGA7gZMbvL2thQn6WPgNBSOxe3K0PuVTiSBzw5YBN
	H+lmvDgdzMacIRV0oJXos
X-Google-Smtp-Source: AGHT+IGdJchHJ7P4CPTBsMcZjyAW+4qwRb+NegY1OFv/HcLj0sn/mAXf+megG2Ra8AGAsBOFPrHCGw==
X-Received: by 2002:a17:906:6a25:b0:ac3:17bb:34fc with SMTP id a640c23a62f3a-acad36d89f6mr984525966b.52.1744646205570;
        Mon, 14 Apr 2025 08:56:45 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/8] xen/arm: drop declaration of handle_device_interrupts()
Date: Mon, 14 Apr 2025 17:56:34 +0200
Message-ID: <ec1bfe540b4588c749fcdc932bd93da96db1d8a2.1744626032.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744626032.git.oleksii.kurochko@gmail.com>
References: <cover.1744626032.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no any users of handle_device_interrupts() thereby it
could be dropped.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
- New patch.
---
 xen/arch/arm/include/asm/domain_build.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 134290853c..38546de477 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -27,17 +27,6 @@ void evtchn_allocate(struct domain *d);
 
 unsigned int get_allocation_size(paddr_t size);
 
-/*
- * handle_device_interrupts retrieves the interrupts configuration from
- * a device tree node and maps those interrupts to the target domain.
- *
- * Returns:
- *   < 0 error
- *   0   success
- */
-int handle_device_interrupts(struct domain *d, struct dt_device_node *dev,
-                             bool need_mapping);
-
 /*
  * Helper to write an interrupts with the GIC format
  * This code is assuming the irq is an PPI.
-- 
2.49.0


