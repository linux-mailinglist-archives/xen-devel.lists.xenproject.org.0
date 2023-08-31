Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29CA78EB42
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 13:01:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593790.926898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbfQU-00030w-8W; Thu, 31 Aug 2023 11:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593790.926898; Thu, 31 Aug 2023 11:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbfQU-0002y5-4Z; Thu, 31 Aug 2023 11:01:26 +0000
Received: by outflank-mailman (input) for mailman id 593790;
 Thu, 31 Aug 2023 11:01:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NA7E=EQ=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qbfQS-0002x7-Qj
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 11:01:24 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b82ee6a9-47ed-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 13:01:22 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68a402c1fcdso528236b3a.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 04:01:22 -0700 (PDT)
Received: from leoy-yangtze.lan (211-75-219-203.hinet-ip.hinet.net.
 [211.75.219.203]) by smtp.gmail.com with ESMTPSA id
 o9-20020a63a809000000b0056c2de1f32esm1161686pgf.78.2023.08.31.04.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 04:01:20 -0700 (PDT)
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
X-Inumbo-ID: b82ee6a9-47ed-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693479681; x=1694084481; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNWUOGWF52DUMNgUzQtRSA7m6UouW3TS9Lcf703h7SI=;
        b=RS9lEADjb9huvTBuq0qU9GMxC5xKStBe1cDedngDaM3RWbD3XMenEvGGRrE741Wa/l
         aHrdgOVRy75Wl52zqD4BK1ntRo8N0uacBqThaBKatxAraGZ64AzHKJ4XiWUY1UH8Uffq
         y11UeQfulLFcfB0MuRy90Sq5e5iCQHr2hdCs/m5sLfdBuRswInUdWnLvL+t3ImGHeyRi
         7sk4NLu+DQy/0u2UqI9soeheWqC3obGZzM039dakaE5AvuErkA6rnRYPVPpPpfEVFnTx
         YuaZreMqMBS1iNrTKQw5jQ8M1yXKGs2eF8or4Mlx+KINxMI5oN1nx8so1YRhdYW94jZl
         38XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693479681; x=1694084481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNWUOGWF52DUMNgUzQtRSA7m6UouW3TS9Lcf703h7SI=;
        b=Kck6TRUsn8731otDwOX/TWJTiyhpuqHaWm0mWlHiai5oJAjmP7JEQ2r2QZk7U154GA
         TUm7iSnJm+1V+HUJuYjGKRj3z8xyZsgHCs7F8jLPTqIRjtxijiJblOryFvFzm/QWTTfa
         aZMypsuwjPLdyJZLoX930uJN8Z+qulTPKwRCOmBRiFaWs7VJTdJ0BFrzLh33+f5+OIQQ
         sF8EhFA5UXagoFHZ5kmXOF02+aPxGq76xrgE93Ys8UF+SHiGdZvYzfax6BtjF5f1iuII
         uds3rirLOFDlcHe/z6HKTr3f0M0aNKlTsXlizRQxnWeTrcLshSJ4EzbJGut8mffQSkqi
         bYvQ==
X-Gm-Message-State: AOJu0YzEqpQMUTS2SAIS1X6W+ucYQlhXnvtAD3uGftcMWmjKJSSS4QOb
	NoU4vntzSNRIXuaThC0Dl3YcnapHokUIR7HEbBFmt7vN4Tk=
X-Google-Smtp-Source: AGHT+IHBvhlfHGJHHiueKu6JRQER8/WU/2Wcbrb+ZuOjTldbeD+dzozunS6234J3gq5+bvVJVqhi2A==
X-Received: by 2002:a05:6a20:12d2:b0:14c:5dc2:659c with SMTP id v18-20020a056a2012d200b0014c5dc2659cmr5460366pzg.22.1693479681170;
        Thu, 31 Aug 2023 04:01:21 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v1 2/2] xen/arm: Enlarge identity map space to 127TiB
Date: Thu, 31 Aug 2023 19:01:07 +0800
Message-Id: <20230831110107.2747633-3-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230831110107.2747633-1-leo.yan@linaro.org>
References: <20230831110107.2747633-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On some platforms, the memory regions could be:

  (XEN) MODULE[0]: 00000807f6df0000 - 00000807f6f3e000 Xen
  (XEN) MODULE[1]: 00000807f8054000 - 00000807f8056000 Device Tree
  (XEN) MODULE[2]: 00000000fa834000 - 00000000fc5de1d5 Ramdisk
  (XEN) MODULE[3]: 00000000fc5df000 - 00000000ffb3f810 Kernel

In this case, the Xen binary is loaded above 2TB, so Xen fails to boot
up due to the out of the identity map space.

This patch enlarges identity map space to 127TiB, which can support the
memory space [0x0 .. 0x00007eff_ffff_ffff], thus it has flexibility for
support different platforms.

Fixes: 1c78d76b67 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable")
Reported-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 xen/arch/arm/include/asm/config.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 21f4e68a40..3e97c95b57 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -87,11 +87,11 @@
  *   2G -   4G   Domheap: on-demand-mapped
  *
  * ARM64 layout:
- * 0x0000000000000000 - 0x000001ffffffffff (2TB, L0 slots [0..3])
+ * 0x0000000000000000 - 0x00007effffffffff (127TB, L0 slots [0..253])
  *
  *  Reserved to identity map Xen
  *
- * 0x0000020000000000 - 0x0000027fffffffff (512GB, L0 slot [4])
+ * 0x000007f000000000 - 0x00007fffffffffff (1TB, L0 slot [254..255])
  *  (Relative offsets)
  *   0  -   2M   Unmapped
  *   2M -  10M   Xen text, data, bss
@@ -103,9 +103,6 @@
  *
  *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
  *
- * 0x0000028000000000 - 0x00007fffffffffff (125TB, L0 slots [5..255])
- *  Unused
- *
  * 0x0000800000000000 - 0x000084ffffffffff (5TB, L0 slots [256..265])
  *  1:1 mapping of RAM
  *
@@ -117,7 +114,7 @@
 #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
 #else
 
-#define IDENTITY_MAPPING_AREA_NR_L0	4
+#define IDENTITY_MAPPING_AREA_NR_L0	254
 #define XEN_VM_MAPPING			SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
 
 #define SLOT0_ENTRY_BITS  39
-- 
2.39.2


