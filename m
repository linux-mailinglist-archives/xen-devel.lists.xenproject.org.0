Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A437A5B7C0
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 05:09:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907033.1314391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvl-0003Tr-Th; Tue, 11 Mar 2025 04:09:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907033.1314391; Tue, 11 Mar 2025 04:09:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trqvl-0003Rd-Q4; Tue, 11 Mar 2025 04:09:25 +0000
Received: by outflank-mailman (input) for mailman id 907033;
 Tue, 11 Mar 2025 04:09:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trqvl-0003IE-59
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 04:09:25 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9228c9b1-fe2e-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 05:09:05 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-223fb0f619dso93350375ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 21:09:05 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af28c0339cesm7324454a12.46.2025.03.10.21.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 21:09:03 -0700 (PDT)
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
X-Inumbo-ID: 9228c9b1-fe2e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741666144; x=1742270944; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYUY7egDw13yHwOIShpp+yHE9Lg9eeptR3FMaPhbw5Y=;
        b=gXPpclS3LVHGQvNC0lT60hIxV2wPW8XtdvfbeysQq7Gia9bTrSHGYabEiWsfOO09r6
         kv/0cUspprenkU4TKQuesy290rKTcud8TBVFjeQBDGAYIvIGShVSD3tnz58bHarIdVgw
         v5qdIAFPl8vQWL8X0INQYpEbmassVgN0oalgNM/NFt4zqW6KI03LaERRmSmvlF4IrHPX
         N59aGn2Po6RIaP1jvMxEQEhdlpQm0fktWcbDa2/HdzPI27sG/Kvu+yEk5TiIOGja27Uv
         Lxcte7y0ifQb7ZA0oZMlf2G+I99yT+BLjVywP8zmHvvZnU87O9tK2dk7jEqPOAnP/ZPB
         /9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741666144; x=1742270944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYUY7egDw13yHwOIShpp+yHE9Lg9eeptR3FMaPhbw5Y=;
        b=mMdXibXLFHPo8FaoO8+479nj/MYXd79D/+cfTiKl4mQDnxSnLZ9ckg1Jq9sgxx2fun
         +YNQzJMZk8BeYf3rI3mY1+Fgyw0Ia6cyVa/3Ha/CCjvOCMTAwNP/OxQjrcLU01S5hYnW
         c40+dryr2++RV75Bi58N7B3SmXecZnRVuxyWGthbkgec6JbInPak1/vXxF4Nf0M4fpQN
         GvNXGpWBFenU1VwCqTR6iFjL4OPs9XKo2tRTUGigUhEsI1e4xkuj48O/KVZPmYEOEAU1
         xvD3T/oUPKCg7LiihU7OdxWpz52XEcgwFgF9xcyNsxvZSefxtmM1Mn/1pJZQiQZpDyAq
         N/sw==
X-Forwarded-Encrypted: i=1; AJvYcCX10oCQ3YvF8zDhiaImHE9Uvv5ZpkRXTMgcouSCfPrktsVlgYIEelsqDFf+1ICks454ORLgGB6HmGU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYC6kpAW1mXuJ52gcdtPeg2XppypZuPk8rcn0UvpcSqYCehj7b
	MTBw+9cGnCcmrQiA+Aek3IDb9rYKy8BU6DIMaxVkk+9MxQXpt7acPICEqwUHUhU=
X-Gm-Gg: ASbGncuvU/iZE3xcyUpteX/7Ga3N+0m/AqfHuFlonySotT1dWhlRpavSf05mQL4Mp/A
	zE+ZIHpQJMglWnGI7102JT90+wUh6gG6x/5zHMIJR1mm6vDOk1vYH6Wrr2Q91DOzY/hxLm9ARId
	3Jf6bv+4oaO3Xi1YXXCC3OqP9Zaxfpc8obh8bcYU57m+2OeNt0OjPN5sQcSb6kYlNLX6Qt8z0ER
	r4Pa/L4OEkdG2ka7aAhhJKfhMbphtTeguePsWaw4WAjO7cP+4lGIb/RaaWRh7s9mbpNx6zagJAK
	w85JCwpIy4F6y4bB9MRflaWYz3o7q1CQL5ApL1WBWd9o
X-Google-Smtp-Source: AGHT+IG1r91N/pZj/+/h4MYPAOLJfFbK6eObEmS4IiEzuC9Hkmi66055HrrfvkPljzn8i/+Wegt/7g==
X-Received: by 2002:a05:6a21:4cc7:b0:1f3:36f7:c0d2 with SMTP id adf61e73a8af0-1f58cbf3befmr3240926637.41.1741666144062;
        Mon, 10 Mar 2025 21:09:04 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	xen-devel@lists.xenproject.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v2 06/16] codebase: prepare to remove cpu.h from exec/exec-all.h
Date: Mon, 10 Mar 2025 21:08:28 -0700
Message-Id: <20250311040838.3937136-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
References: <20250311040838.3937136-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/tcg/tcg-op.h           | 1 +
 target/ppc/helper_regs.h       | 2 ++
 hw/ppc/spapr_nested.c          | 1 +
 hw/sh4/sh7750.c                | 1 +
 page-vary-target.c             | 2 +-
 target/riscv/bitmanip_helper.c | 2 +-
 6 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/tcg/tcg-op.h b/include/tcg/tcg-op.h
index a02850583bd..bc46b5570c4 100644
--- a/include/tcg/tcg-op.h
+++ b/include/tcg/tcg-op.h
@@ -9,6 +9,7 @@
 #define TCG_TCG_OP_H
 
 #include "tcg/tcg-op-common.h"
+#include "exec/target_long.h"
 
 #ifndef TARGET_LONG_BITS
 #error must include QEMU headers
diff --git a/target/ppc/helper_regs.h b/target/ppc/helper_regs.h
index 8196c1346dc..b928c2c452d 100644
--- a/target/ppc/helper_regs.h
+++ b/target/ppc/helper_regs.h
@@ -20,6 +20,8 @@
 #ifndef HELPER_REGS_H
 #define HELPER_REGS_H
 
+#include "target/ppc/cpu.h"
+
 void hreg_swap_gpr_tgpr(CPUPPCState *env);
 void hreg_compute_hflags(CPUPPCState *env);
 void hreg_update_pmu_hflags(CPUPPCState *env);
diff --git a/hw/ppc/spapr_nested.c b/hw/ppc/spapr_nested.c
index 23958c6383a..18bbb1403c6 100644
--- a/hw/ppc/spapr_nested.c
+++ b/hw/ppc/spapr_nested.c
@@ -2,6 +2,7 @@
 #include "qemu/cutils.h"
 #include "exec/exec-all.h"
 #include "exec/cputlb.h"
+#include "exec/target_long.h"
 #include "helper_regs.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/spapr.h"
diff --git a/hw/sh4/sh7750.c b/hw/sh4/sh7750.c
index 6faf0e3ca8b..41306fb6008 100644
--- a/hw/sh4/sh7750.c
+++ b/hw/sh4/sh7750.c
@@ -29,6 +29,7 @@
 #include "hw/irq.h"
 #include "hw/sh4/sh.h"
 #include "system/system.h"
+#include "target/sh4/cpu.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "sh7750_regs.h"
diff --git a/page-vary-target.c b/page-vary-target.c
index 3f81144cda8..84ddeb7c26a 100644
--- a/page-vary-target.c
+++ b/page-vary-target.c
@@ -21,7 +21,7 @@
 
 #include "qemu/osdep.h"
 #include "exec/page-vary.h"
-#include "exec/exec-all.h"
+#include "exec/target_page.h"
 
 bool set_preferred_target_page_bits(int bits)
 {
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index b99c4a39a1f..e9c8d7f7780 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -20,7 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
-#include "exec/exec-all.h"
+#include "exec/target_long.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 
-- 
2.39.5


