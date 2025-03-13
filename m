Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD74A5FBFE
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 17:39:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.912887.1319115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslad-00025a-2i; Thu, 13 Mar 2025 16:39:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 912887.1319115; Thu, 13 Mar 2025 16:39:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tslac-000232-S2; Thu, 13 Mar 2025 16:39:22 +0000
Received: by outflank-mailman (input) for mailman id 912887;
 Thu, 13 Mar 2025 16:39:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNRr=WA=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tslaa-0000Wy-Gt
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 16:39:20 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5b2c604-0029-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 17:39:19 +0100 (CET)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2ff799d99dcso2532041a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 09:39:19 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30119265938sm4020084a91.39.2025.03.13.09.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 09:39:18 -0700 (PDT)
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
X-Inumbo-ID: b5b2c604-0029-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741883958; x=1742488758; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZcjdDtX1Z7JVvsuWgguTldfqVr7ZBWkV3i9i17ooa8=;
        b=QVmlzocMSuBV+lgRH+JPWIMOSeSQ8SZybQDvXi7tWV3JBlUzIoDckDWeTLw3W+PQhR
         WPQ3ytRgODRKgF8+OHseyQeYLlBO76spmDZkc+T/1Xu0wIG8gnwCPItVJPDoL0UzEe2n
         MdG6R+NN/iY6ECypGbK5p1RJ1/1SRWUDGLHLYEIBBqtg43Djy6AP2MVsCiP5/H30Q4xr
         IzeOP/PdTQkCWpN6aTpf3S/jKt4DB7t2hFz9xDXFKwo5tTtxjFHR82MxoUTj1pgKHBod
         YKdcE79BmVy82JthIqeZlwtztgzniR5HofNqJyS/7GUjn5vItgBOZuJFsZ0rE9ULjxzW
         giOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741883958; x=1742488758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZcjdDtX1Z7JVvsuWgguTldfqVr7ZBWkV3i9i17ooa8=;
        b=sxXWRmVsBizsW0vJb2Ej2FHdMn5jKNvkutqWKNaqXCPBDikrsBVNk/HQT/xFK4oEq/
         hDQZ8ck4N89qXVmQJ+xn/RJUPtYmynu/+CvFOwqVPYxYabJfN28TafMiFsDcTb4Dxovj
         7EVqgELkl1GK+Sk4zzsb25rVdM3tbS1yJBjv2jsoYHBPtdIaiHQkD1HZWIVeAmSQgsDl
         Ry3dQGy1QswAVeVH9xVfh3sHKeWWY3XJuSB3iltIrWEhGM2oa64UmEPA3PUF0gbENUzD
         opU51y7rUkdWvR282sRNoN9K17jv8F1frQIvDePm5lzVmISeBlONqfn0Q2f2Gsl/VUJZ
         HxcA==
X-Forwarded-Encrypted: i=1; AJvYcCXOo/BJosfafDS4WAQ0V3nAaffrVynfd51zjZi/K7K1DfqDSGJ01ChSStqbgKAjkBNhVewSEw4zvMY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxJXJGeN96161O6Ov8/YH+P9fPY1j5yy0XxcE8RVM8aCLOhIMCC
	BTKaOO3638GqiKCmeLXO9hr0YxtWrZYSl3LiJ0p4GSgn//QVMWn1HdKvxwKH31U=
X-Gm-Gg: ASbGncujo6Fg2annUORhnjIAPJJCEKdxJ3rD/mzf0ENbXbJ/65cVlot/bUyi4TzVxOc
	FdqqZ9jcGrpHhzMNOKcjy/f4SypAaAFA06cGJUr0feGrZQH1xge0cxIDd4IYF/CHVMjfABOGxPb
	AKTBAX8IB6JxFMiP5/MOB80dUmZ4uv/WcVY4Ya+10VXuHzbfZbQTH8CHj6gXoqKyqtMD5l1rZYW
	ixTkTmGGmWiVpWSjr6Bafc89uKPVfHATsCpGDmaq/AhEtw5+K6jJc7XNbDBildhejK95AvRBeFr
	UG/BWYwZGj0JLjYsLqcvT/j6Bd2SA0QmmUFdbw8hiuvh
X-Google-Smtp-Source: AGHT+IG4zIqLxuyjovKp9g3TAXrCpctV1RL6f3536TGUBfN83HoHfbIXNZa1EoQ+qlG58AlBh7g+Ww==
X-Received: by 2002:a17:90b:5403:b0:2ee:fa0c:cebc with SMTP id 98e67ed59e1d1-3014e861c18mr244498a91.20.1741883958391;
        Thu, 13 Mar 2025 09:39:18 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org,
	Peter Xu <peterx@redhat.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Weiwei Li <liwei1518@gmail.com>,
	qemu-riscv@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 06/17] codebase: prepare to remove cpu.h from exec/exec-all.h
Date: Thu, 13 Mar 2025 09:38:52 -0700
Message-Id: <20250313163903.1738581-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
References: <20250313163903.1738581-1-pierrick.bouvier@linaro.org>
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


