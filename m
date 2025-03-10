Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5675CA58C32
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 07:43:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.905963.1313454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqr-0001nz-SP; Mon, 10 Mar 2025 06:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 905963.1313454; Mon, 10 Mar 2025 06:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trWqr-0001iB-JH; Mon, 10 Mar 2025 06:43:01 +0000
Received: by outflank-mailman (input) for mailman id 905963;
 Mon, 10 Mar 2025 04:59:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fu2G=V5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1trVEE-000735-U7
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 04:59:02 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60758afa-fd6c-11ef-9ab8-95dc52dad729;
 Mon, 10 Mar 2025 05:59:01 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-22398e09e39so65589935ad.3
 for <xen-devel@lists.xenproject.org>; Sun, 09 Mar 2025 21:58:59 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736d2ae318csm1708308b3a.53.2025.03.09.21.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 21:58:57 -0700 (PDT)
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
X-Inumbo-ID: 60758afa-fd6c-11ef-9ab8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741582738; x=1742187538; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8s25jeAGTcBk8xCVR99anv09nY4TtNOY1pAkSQYXuE0=;
        b=MAuFZdP1snK4RBJauQKk9IyBArEt30/odJpEL6c0pv50e/d05kLEHtfCesSDPBi08O
         qAGC0JN6u8lXlh3uO5EYC+Op9xhfb/TQoBo1yXVrW3XRhI03r1rA4t+dv2qjgnfvIRAr
         soS5fjZXUOGQ/4naN9dxxBxC3kzKrZ+GK31FcL2yL+sBZCd8w63iDdvrwAlA21fAhW4E
         846D1OOsoM4I5xX53JzaCVVtg6atWB4Lk2hbHAattBX6qzQjPvq7ku4/ttywBlb8FH/y
         6WfpDdeNjfLbGqrumNPoCirmjdSpB2f0ai7yb+GZjqo+ABE8+gD1Zdn0CYdc7S/zyJ9w
         OZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741582738; x=1742187538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8s25jeAGTcBk8xCVR99anv09nY4TtNOY1pAkSQYXuE0=;
        b=AcAW2pXFnNy31DBxKnZjtfR4+93G5+NPCWrgMMn5GndEHsCTN+l5Lsgnh+KmeMalei
         tpnIcIN3SXVwYoYl1B574dSisruLseqX5Bb58S5s3qleYC1FNSixFl5VqCAZnt4vBVEF
         z5lpJmLR2FOcPywuKWVNJ+mNn4EGCa21xXq5tJSLnspT2eSWo3rxwnkkCpHjQJssrBYQ
         O0EK7mbXBA9Vp6ryTXpEuOc/x9CIBMezRItsMeMVSyARBa4d2max3S6Mtgejk5xipxD7
         FQWRf6hmhN83LsBFFtbHvC7V4HzMJ9jBnAuBiZTf6hPW3TarVw6R8/aNLcrFS/Ud94Xm
         MLpw==
X-Forwarded-Encrypted: i=1; AJvYcCXT6GUbSTPcHn9rMmo2VPaR6OybmW3nGRU68CZqzeinUDfFqClJeiiXlmr80YciCzGCk6Nbu+rqqqk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz0PYbIa0ZxIK7KwESaf0r3P4S95oqKFlvb7zGMV30KFlres+/g
	2klTWlfLqGNK4XoKcIA8XcZ05GzmNqkwwEOwrA/igU/hWSlYniFmNYnAjRw8Kro=
X-Gm-Gg: ASbGncvXluj052xIQcddWBgQADCTL6/PJlKlbwwT8kTujXc4NUXRVtvVhM+/WKCde1H
	wraN9AmAJxxoUdjSb5E6XTcBJ35aZYhbwmwt0OfNclsYv7xrdzcleNMwUyB/CQtg1e52mKS8itp
	CjLkkBi2bfKdXv82NMgs4hnBL9j4iE0pvggoJcaUrw0aH2En/QO/gX6CePQKjiZ+uaGi0z1KHUz
	owmYJ6dqqcahmcwCGydrqKVbr2Q4bXHSgmkw0iL5rEt9vKzvAEtEGhOfrc1kKqixaOjrY9351WY
	Mh0/vPN1h+F7ftLNIybM6qHNQMZxseRMrq7bTleivc859nsVO9UXEw4=
X-Google-Smtp-Source: AGHT+IGRoGZ7coEeYo9o9fE7YTKv7YM5Vcb8VYcCl0LtzUFuhPuPAIbAabhl/TEnMhgrans4FlUiUA==
X-Received: by 2002:a17:902:f648:b0:220:d601:a704 with SMTP id d9443c01a7336-22428a967a4mr181654565ad.18.1741582738292;
        Sun, 09 Mar 2025 21:58:58 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	kvm@vger.kernel.org,
	Peter Xu <peterx@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Weiwei Li <liwei1518@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	manos.pitsidianakis@linaro.org,
	qemu-riscv@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 07/16] codebase: prepare to remove cpu.h from exec/exec-all.h
Date: Sun,  9 Mar 2025 21:58:33 -0700
Message-Id: <20250310045842.2650784-8-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
References: <20250310045842.2650784-1-pierrick.bouvier@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
---
 include/tcg/tcg-op.h           | 1 +
 target/ppc/helper_regs.h       | 2 ++
 hw/ppc/spapr_nested.c          | 1 +
 hw/sh4/sh7750.c                | 1 +
 page-vary-target.c             | 3 ++-
 target/riscv/bitmanip_helper.c | 1 +
 6 files changed, 8 insertions(+), 1 deletion(-)

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
index 3f81144cda8..12fda410bb0 100644
--- a/page-vary-target.c
+++ b/page-vary-target.c
@@ -20,8 +20,9 @@
 #define IN_PAGE_VARY 1
 
 #include "qemu/osdep.h"
-#include "exec/page-vary.h"
 #include "exec/exec-all.h"
+#include "exec/page-vary.h"
+#include "exec/target_page.h"
 
 bool set_preferred_target_page_bits(int bits)
 {
diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index b99c4a39a1f..d93312a811c 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -21,6 +21,7 @@
 #include "qemu/osdep.h"
 #include "qemu/host-utils.h"
 #include "exec/exec-all.h"
+#include "exec/target_long.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 
-- 
2.39.5


