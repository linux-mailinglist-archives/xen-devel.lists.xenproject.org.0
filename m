Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02469A617B5
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 18:32:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.914973.1320650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8t5-0004Q0-9c; Fri, 14 Mar 2025 17:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 914973.1320650; Fri, 14 Mar 2025 17:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tt8t5-0004Iy-45; Fri, 14 Mar 2025 17:31:59 +0000
Received: by outflank-mailman (input) for mailman id 914973;
 Fri, 14 Mar 2025 17:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zh9v=WB=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tt8t3-0000xy-1c
 for xen-devel@lists.xenproject.org; Fri, 14 Mar 2025 17:31:57 +0000
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [2607:f8b0:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37ada7f0-00fa-11f0-9899-31a8f345e629;
 Fri, 14 Mar 2025 18:31:53 +0100 (CET)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-225b5448519so44944565ad.0
 for <xen-devel@lists.xenproject.org>; Fri, 14 Mar 2025 10:31:53 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af56e9cd03bsm2990529a12.8.2025.03.14.10.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Mar 2025 10:31:51 -0700 (PDT)
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
X-Inumbo-ID: 37ada7f0-00fa-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741973512; x=1742578312; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZcjdDtX1Z7JVvsuWgguTldfqVr7ZBWkV3i9i17ooa8=;
        b=On3N5RnjG6CDLw0GxVnAXIuA2OOm+JODVdFabP//UbCFxQA7lH310ewQwBC8PtGA7K
         6nbcZiHyn4LkmPRgIhpL0IEqetTK5oIl9TYH3En/OMnxSJF87edR6wDQQG8tlL2lYlKm
         k9dbc/oSC7cQ1O35ITZ2OlRtNUkHQMC7VUdyN8lUgDBbGQ/wLeu9NPkqEbCzZKR/qcRE
         0MoPBIqvkU2zTZlMUceg5h2Izev2J1rqrYCKe9nuqWsKUs/hUTFKTJwDzdFoYRNlL8tK
         qVCbA2EhKo0yRRF+Lk+U7GVU2l+fAcDLdeVTgHSw3DB3YIj4EjHBfYYY2SeF2d1VoYRp
         teyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741973512; x=1742578312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZcjdDtX1Z7JVvsuWgguTldfqVr7ZBWkV3i9i17ooa8=;
        b=eIB18KERE368Ugw7m+yUXbQf+OJTBHUoCFPeeYUaNJ8xziIlJo+MCd32uUsU9vvNpT
         sHKIcJYlJDdoHnRUSR7x/9eaHlEhojv4tcuzBgk/g2eYprQjc3Dyk0KB8slFmV0Udomh
         nS7esWbsLoILk9vXoDExCmVt873nbfDuc5jBFwCBk9FGVDHxbKTAwiKBb504jeLbvQEN
         G2hfApxZvqh6w+andSPxzWCRUSdf+Nc/Yu7ii5xDaRfVmSEYxyAHZOG3N/9/djumR8kT
         FnnvoC8F0GihABqmxTiqhoPFf1ufCp5NKfQed81g4xnIC0WEHjO5a0ZpJXWJ5+rGzEoS
         IWJg==
X-Forwarded-Encrypted: i=1; AJvYcCXZ+lPgb8Op62q261hmJ/W7wfQWG+FCOr1lDIIPKqPI3UzPxS651ME0I6ygRHmmvbatyLKiyR73YNc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwPYGDEXnu7ZcrjCuFk5xBxL0YhdIvKOO8sv+gFt6LqpDVSD7IT
	D/la1iUbUalqODNZbf+mfv7rzSXKVss44Qsmys5gUgONtmSa8l3yGoZsVjFb3UI=
X-Gm-Gg: ASbGncsSSWZQigfSjvlKT0b6AMDd8rrN+pX9Fg2vS3YUjmIi7+gNMHBQDRACrktNQxn
	lvjbybsnPgeypGCJEkpVpIl0Tfw1iQ4aTmXaq0oortixBXkmbE9A8BWkExqwR5o+zCErVSz/gQb
	trS5qJ2vAfDOxCQJd8vSZQbKnPfEXlrvYWB0junCovQn/nnTOS+6FNTgHamuWyNYe+rdmqcc9ba
	t6XJV+3fOt/ba9p0JeWLzl0CGwxvyQupa55q1O2xjCqz+hSron7pDDw7xMpdtZ+SwbVhlx5f7AM
	i8eYuEFWLylImewSp/84f7dFO6sCKgkUviYuxhR2IBv+
X-Google-Smtp-Source: AGHT+IEORLbJQZPgomOf1sDjTcDkAnGl+mlFCK1VHaTDHzBWmfJYoIo2+c2hSAC++5jNWglDm/0AKA==
X-Received: by 2002:a05:6a21:502:b0:1f5:8179:4f47 with SMTP id adf61e73a8af0-1f5c11d86e1mr5274835637.20.1741973511929;
        Fri, 14 Mar 2025 10:31:51 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Paul Durrant <paul@xen.org>,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	qemu-riscv@nongnu.org,
	manos.pitsidianakis@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anthony PERARD <anthony@xenproject.org>,
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v5 06/17] codebase: prepare to remove cpu.h from exec/exec-all.h
Date: Fri, 14 Mar 2025 10:31:28 -0700
Message-Id: <20250314173139.2122904-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
References: <20250314173139.2122904-1-pierrick.bouvier@linaro.org>
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
 target/ppc/tcg-excp_helper.c   | 1 +
 target/riscv/bitmanip_helper.c | 2 +-
 7 files changed, 8 insertions(+), 2 deletions(-)

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
index 201f6292033..a79e398c132 100644
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
diff --git a/target/ppc/tcg-excp_helper.c b/target/ppc/tcg-excp_helper.c
index 5a189dc3d70..c422648cfdd 100644
--- a/target/ppc/tcg-excp_helper.c
+++ b/target/ppc/tcg-excp_helper.c
@@ -19,6 +19,7 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "qemu/log.h"
+#include "target/ppc/cpu.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
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


