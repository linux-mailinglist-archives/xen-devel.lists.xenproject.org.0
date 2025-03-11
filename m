Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2003A5D021
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 20:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908975.1316066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5kB-0008VL-Q1; Tue, 11 Mar 2025 19:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908975.1316066; Tue, 11 Mar 2025 19:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts5kB-0008Nc-J6; Tue, 11 Mar 2025 19:58:27 +0000
Received: by outflank-mailman (input) for mailman id 908975;
 Tue, 11 Mar 2025 19:58:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EQfW=V6=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1ts5k9-0007Uu-JG
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 19:58:25 +0000
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [2607:f8b0:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d24adc0-feb3-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 20:58:19 +0100 (CET)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-22359001f1aso140554015ad.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 12:58:19 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736a6e5c13asm9646981b3a.157.2025.03.11.12.58.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:58:17 -0700 (PDT)
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
X-Inumbo-ID: 2d24adc0-feb3-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741723097; x=1742327897; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wYUY7egDw13yHwOIShpp+yHE9Lg9eeptR3FMaPhbw5Y=;
        b=bdZecelYaEvd+aGIJaZvtG1mNhnUBGkmlB4X9p1O1nhGjayi25f4JSs/EOVd53V69z
         WzBwpRwmOdAdgKpS0ps2XlmC1DaIZr8C8ex6INA7LkCETLq6DBL8hJn3HARnjtA55/3a
         erRD0DISmjfw9ulLDUXB424ggSftIBS89Nk9Tp36rCCZhLEVmZA60pwaxNilzVOMtqLk
         /8XJDgMz1QnADG56XqpupL1ZIXkGdofUOWkadRrwUCdNDynrGVZ83dnIXYMXQhbBlSMY
         8e5m8Ox9xQsLlAT746wzTYFwkVpsQc1fVDmY3o4gTivBfoq0HqqooA8iTgxK+7ReSKpN
         5BXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741723097; x=1742327897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wYUY7egDw13yHwOIShpp+yHE9Lg9eeptR3FMaPhbw5Y=;
        b=hoWz6uk+WAAG8tqUqyItnH/n2yNBbNnryZHajI4b4uJMihEddfk0xwBUiW/prv+KGS
         3wsBxlyV6eVoehiABYWqx27szZGcpH7FycgU//S83SvjdslN68qAOWtvrDQuxuKGeQts
         9sAQeoP1zGJbIvgn6t5zgQ3lu+M7A8Lz+xhJe7ExFT36Cnmc2hS6MfHAmyOR2VBCBj5G
         QvxUH5HNe1rZPqirEXZ22z3z2IrGVaKRjldbsEU+P816xBugWTESZCgtnxumyJygITV6
         6jKWZL87GPjDznJ8FrmDyoj3xT3+vb+ig++KNUiV3hY1c8VM39RlFE5DkthD5KmW4Z8z
         y6cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWl835NQH0aWF1JGmk6WsCi3QyeASD7UksnJsTNCRswdf6cnWX6fauPlN79MMf450Ydh7Yq+wGCidk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyIJMxZ8dWBjoZs7gzckxT2B7HEKWwAEydyi6XKVRi0U7HyBsJG
	4owv9hNzsSnQo4foTa67JnuztZG6KG979lze1BZzFb9OV4HdtgMdhywJzkS7XrI=
X-Gm-Gg: ASbGncvKjS4D7Ji09KM+wYCkfJzZ/4tzAMe5LLWM2gXZ43gt0j4W6YfmhstSN2/dHKV
	SrqH+Ccq3xYgQ6t1O9DRyV+tdVCONSosVgAP2zUlBIkwqmuvl9XTbusWMKzexZqzNqOeul5I7U3
	ivYYSGy6jB2yiTUdyF8zn61GYus359q4A6Lu5a4OaOpl8pcumChQMbYo7xAR8mC5xHWJGJ+UuM/
	SfpfplNbplwnbA1aHnzdYs33C3FWRXKQQOUiVuyOgauOpJ97QIJWjROwg+pda/24fvhzO+VrV+R
	ETtt06FWC6JQD07ystgulHIJfNSFrSsVVlB9Tae1k0Wr
X-Google-Smtp-Source: AGHT+IHUxq5bEYzFkU8q2EMgwzHdCRPdTyU3cSt/scNg1CwBg3gT9IGXS4Ltng7xzXvu5gfwiPtTEg==
X-Received: by 2002:a05:6a00:7218:b0:736:ab48:18f0 with SMTP id d2e1a72fcca58-736ab481a99mr17386794b3a.1.1741723097629;
        Tue, 11 Mar 2025 12:58:17 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Anthony PERARD <anthony@xenproject.org>,
	xen-devel@lists.xenproject.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	manos.pitsidianakis@linaro.org,
	Peter Xu <peterx@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	alex.bennee@linaro.org,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 06/17] codebase: prepare to remove cpu.h from exec/exec-all.h
Date: Tue, 11 Mar 2025 12:57:52 -0700
Message-Id: <20250311195803.4115788-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
References: <20250311195803.4115788-1-pierrick.bouvier@linaro.org>
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


