Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6B17A08FA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602494.939170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoAn-0008S1-KP; Thu, 14 Sep 2023 15:22:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602494.939170; Thu, 14 Sep 2023 15:22:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgoAn-0008Og-G7; Thu, 14 Sep 2023 15:22:29 +0000
Received: by outflank-mailman (input) for mailman id 602494;
 Thu, 14 Sep 2023 15:22:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmX-0002W4-N5
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:25 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 032ce7ed-530f-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:23 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bfc1d8f2d2so13634341fa.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:23 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:22 -0700 (PDT)
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
X-Inumbo-ID: 032ce7ed-530f-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703443; x=1695308243; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGJnL2nL418M5/uszjX/GlUjvflTtKGWfxAcKAqqexc=;
        b=jNUQvqOeBMSDGD+JgOdSUqCfVApGuGjZ2qLOV+1Y1GBdbZao6bYyuugJJliXdpuraL
         JFcQkdznxowmut/aQnMPnB4n0Rl23/1IHbD9DByKHoCt6ccH36BEo1PdoPSym2RsiP1U
         gr44pzwSSaKOmM3i/2cwoHUD3Fx3jEscx95OyiW/pF+4AsvsUlVEMGUtDgY9qWBkFKN8
         m5UrcX6oCdNUG9SaQ9P0fjER/eoSn3RfhHWPRYml1EHt6+WBZBor35mu8x8LLOfQTTxR
         dD3xLsm0m7VKMpXUIJrpR4OC1lNBbsCYk1G9cN5Rcr/z6lw6XWwoSWWG3azxSAQPAExg
         0i2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703443; x=1695308243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NGJnL2nL418M5/uszjX/GlUjvflTtKGWfxAcKAqqexc=;
        b=cY0VRaIIGCElNItWEMdHtFkRvoGk2QbxyJh3DT/Bzf7wpnLjlk7YozCYdX/pULqpN3
         bxRWGWMInLIjodNLfK+H90uGO6P5FfgMIu2x0gWpsgzK7w4I8k9l22Gj/ztlaBgC/t3N
         0Q94uNm+9ClzcHkH18NeIMp57gqA8sOpjtE6kBVfKWjaGOWkLUCFZ8dmXDfoJoyVx5tT
         +MZEKCxXVeCiAJxz1HRn7ElTOuzVeii9Vj8gBRDAjVV13t6yJflPc0xeCY34BgMHe2we
         GzuLtUpY3yB0M2MwRxjR6FDM5qOS8qFs3ivVT90Hi8pd9giZqjyycqc7Q8nrZB76tj8K
         Rxog==
X-Gm-Message-State: AOJu0Yw32jnysGeCMCybnl0G/YyQTXNaQiDMRW7/aA2HT9kqcD+xdeZI
	TRV0mKnnsAkg2QljrQjfhQ6xMd7sT7Y=
X-Google-Smtp-Source: AGHT+IGpK0E7SuflPXItoYH5tWLeY7McAC9Nf7YsdmHOvtwG74oWQuABe3GYNz3ubbaUUW4mz2J0tg==
X-Received: by 2002:a05:651c:1250:b0:2bc:d2a6:3083 with SMTP id h16-20020a05651c125000b002bcd2a63083mr778572ljh.18.1694703443185;
        Thu, 14 Sep 2023 07:57:23 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 20/29] xen/asm-generic: introduce stub header div64.h
Date: Thu, 14 Sep 2023 17:56:41 +0300
Message-ID: <0c006d03b917924c411e563dcdc8043498be48b3.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/div64.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 xen/include/asm-generic/div64.h

diff --git a/xen/include/asm-generic/div64.h b/xen/include/asm-generic/div64.h
new file mode 100644
index 0000000000..9f9c20878b
--- /dev/null
+++ b/xen/include/asm-generic/div64.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_DIV64
+#define __ASM_GENERIC_DIV64
+
+#include <xen/types.h>
+
+# define do_div(n,base) ({                                      \
+        uint32_t __base = (base);                               \
+        uint32_t __rem;                                         \
+        __rem = ((uint64_t)(n)) % __base;                       \
+        (n) = ((uint64_t)(n)) / __base;                         \
+        __rem;                                                  \
+ })
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


