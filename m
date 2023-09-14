Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FED79F7DD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 04:18:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601719.937849 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgbvV-0007fP-Au; Thu, 14 Sep 2023 02:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601719.937849; Thu, 14 Sep 2023 02:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgbvV-0007dA-7y; Thu, 14 Sep 2023 02:17:53 +0000
Received: by outflank-mailman (input) for mailman id 601719;
 Thu, 14 Sep 2023 02:17:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eUwO=E6=linaro.org=leo.yan@srs-se1.protection.inumbo.net>)
 id 1qgbvU-0007cj-4y
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 02:17:52 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e3ff7399-52a4-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 04:17:45 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68fc081cd46so440840b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 13 Sep 2023 19:17:45 -0700 (PDT)
Received: from leoy-huanghe.lan ([98.98.115.199])
 by smtp.gmail.com with ESMTPSA id
 w17-20020aa78591000000b0068c5bd3c3b4sm212275pfn.206.2023.09.13.19.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 19:17:43 -0700 (PDT)
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
X-Inumbo-ID: e3ff7399-52a4-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694657864; x=1695262664; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ZhYSY8Bdfcj4po7z+q8sAviQ3OBUmp6eSh3vGvduLY=;
        b=srDQVawyYQFY6X+qN7giHnk9On23q15uGx3oU51ILK1tGmMEcli0TadwHvuRdrNotI
         Ws1aoxY8vUWmB2p/Oayn4+f038FAi+Y1dC3I3piv3VFuPN09fdLWtQmkAYmobP8FeBx1
         OJbB57ouP06LZUv77ZV0YB9UUrUBJctNH+Qlkl7tVy3xyIUsxI4WdPVIy3tFBLDowLv8
         NQjDGW33fs4zTaib3vOxWpqd4+5bGWnvXS/ZwQoB3qTTust9Fd+/vPxe+/V3Ilq1QaRA
         2TkM8ws86D95Gv/SwQhmTtqH2t0Wn8N72ixeiYVTSx7S/h7Ab9+NVi5njqm/nwZ2r8Sz
         LO1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694657864; x=1695262664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ZhYSY8Bdfcj4po7z+q8sAviQ3OBUmp6eSh3vGvduLY=;
        b=tlxnRCyHTDLVjwyWk6Ej0sOr64DkXNzmGzhuK5VZhGeBXi7Aa0YyY8b7TW3Yix8QQC
         NVLM/u8o2bjDe/SDnbQNQNQLWxIXxRHgkTfA3w50phchHIXU+licsCMb4Q7ycTQX7pZA
         +XsM82LaWcajRO1W6touPDE0AjCDgF1xvKEZuZCn9LZVDtRhpk//bxYMUnk9vbfdStHn
         OvKkByA7tWheS76UghBswciqVCOJQzdJ4h0UFDs+A13kt1AQKyo7vSvbjEZU3wHz/gf0
         TR6M8w+VxIy9dVd7TKwhP+1s1UZttulMqE0XZzx/AVMBotKJ4Z4aBgfGMLeLNM0BW9Rn
         Im0g==
X-Gm-Message-State: AOJu0YwDZTHPYLBLU/jTAPLmvMixadrhfo5D+Ux7k7OT2YlMK9KTsN0S
	tIDF86PadIZI6ZkJPwzyDBxRZsRfw6A0lmH8ONOR4rxC
X-Google-Smtp-Source: AGHT+IGVpz8CnUa5h0fqWmTHXMGcDwtylhRN9gcJF15nindufcCxGeYsE01Liy2m9RGZRGjkV7ku7g==
X-Received: by 2002:a05:6a00:2495:b0:68f:e810:e86f with SMTP id c21-20020a056a00249500b0068fe810e86fmr4833623pfv.28.1694657864285;
        Wed, 13 Sep 2023 19:17:44 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Alexey Klimov <alexey.klimov@linaro.org>,
	Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 1/2] xen/arm: Add macro XEN_VM_MAPPING
Date: Thu, 14 Sep 2023 10:17:33 +0800
Message-Id: <20230914021734.1395472-2-leo.yan@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230914021734.1395472-1-leo.yan@linaro.org>
References: <20230914021734.1395472-1-leo.yan@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen maps the virtual memory space starting from L0 slot 4, so it's open
coded for macros with the offset '4'.

For more readable, add a new macro XEN_VM_MAPPING which defines the
start slot for Xen virtual memory mapping, and all virtual memory
regions are defined based on it.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 xen/arch/arm/include/asm/mmu/layout.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
index da6be276ac..2cb2382fbf 100644
--- a/xen/arch/arm/include/asm/mmu/layout.h
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -49,11 +49,14 @@
 #define XEN_VIRT_START          _AT(vaddr_t, MB(2))
 #else
 
+#define IDENTITY_MAPPING_AREA_NR_L0     4
+#define XEN_VM_MAPPING                  SLOT0(IDENTITY_MAPPING_AREA_NR_L0)
+
 #define SLOT0_ENTRY_BITS  39
 #define SLOT0(slot) (_AT(vaddr_t,slot) << SLOT0_ENTRY_BITS)
 #define SLOT0_ENTRY_SIZE  SLOT0(1)
 
-#define XEN_VIRT_START          (SLOT0(4) + _AT(vaddr_t, MB(2)))
+#define XEN_VIRT_START          (XEN_VM_MAPPING + _AT(vaddr_t, MB(2)))
 #endif
 
 /*
@@ -116,12 +119,10 @@
 
 #else /* ARM_64 */
 
-#define IDENTITY_MAPPING_AREA_NR_L0  4
-
-#define VMAP_VIRT_START  (SLOT0(4) + GB(1))
+#define VMAP_VIRT_START  (XEN_VM_MAPPING + GB(1))
 #define VMAP_VIRT_SIZE   GB(1)
 
-#define FRAMETABLE_VIRT_START  (SLOT0(4) + GB(32))
+#define FRAMETABLE_VIRT_START  (XEN_VM_MAPPING + GB(32))
 #define FRAMETABLE_SIZE        GB(32)
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
 
-- 
2.34.1


