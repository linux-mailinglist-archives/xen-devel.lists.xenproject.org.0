Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DED1A65CAB
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 19:34:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.917741.1322594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIJ-0007WP-F3; Mon, 17 Mar 2025 18:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 917741.1322594; Mon, 17 Mar 2025 18:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuFIJ-0007Ly-7d; Mon, 17 Mar 2025 18:34:35 +0000
Received: by outflank-mailman (input) for mailman id 917741;
 Mon, 17 Mar 2025 18:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q3WP=WE=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1tuFIH-0006VW-Qo
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 18:34:33 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78007f36-035e-11f0-9aba-95dc52dad729;
 Mon, 17 Mar 2025 19:34:33 +0100 (CET)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-224341bbc1dso88729235ad.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 11:34:33 -0700 (PDT)
Received: from pc.. ([38.39.164.180]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73711695a2esm8188770b3a.144.2025.03.17.11.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 11:34:31 -0700 (PDT)
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
X-Inumbo-ID: 78007f36-035e-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742236472; x=1742841272; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZcjdDtX1Z7JVvsuWgguTldfqVr7ZBWkV3i9i17ooa8=;
        b=S+5g4C5MVY2dvDtJ0ZkI2YIG1J/a6yv6o61nS27M95QBlK20WQv3RbiXkpFg8aPQfp
         truNAwLFXxMCSbNytDH2wcIL2ujWkqZbcFiHOgNSOpg62GSo1Q5LnnjVPEE7TnsMAfaX
         TqP7bzNB3XWTnxRXIhN6jEtqEHLxNFuv0SuOUxOGGhDx5pzbY+0jHAKewYCCykDNYroa
         yUhPVmYwM7dyYmDSd4sXaqWbEmKIpObJGA0nwt9ukPdHH1IXDvnTsg0dpzjkd/6x74QP
         VaLmdRpDcsVHxwjWDe9UN1NciRjwNMr3MmgSTIoAeJj8SU6nxyjCs5VSJbjY6ojMPmow
         7Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742236472; x=1742841272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZcjdDtX1Z7JVvsuWgguTldfqVr7ZBWkV3i9i17ooa8=;
        b=GSwjU/z0W26tGfyO/RDnco1upmbOHZCiafGwpR7iZnjuFEJNHh6UnALhATX242dv2G
         2eL1yTEdDlE6Q5yCW76cVz53qmb2nd/FRn3KIaAPLmPCezABIFV/Ac2kZb/I6fmihXY2
         9J69ZwHuj52BHkfKhksUpef693UQ1al5OQspDtzgVBl21a2DGx2J/hPVOHLYFxjIGks7
         s5ht1lVP2c4sb5j6Ccoxo3gC50+KfS1AO/J0tf2UEQwuvBSbB/pHkcBIemketnm4TRV9
         uBtk+S4EnnojPKnQcAdck8NA652TtU3yvZKjgG+teQSgU3BQh7VOFVY62loDHAuKGfM4
         K3/w==
X-Forwarded-Encrypted: i=1; AJvYcCVBJ9iyGW8kQgRZ8H1/JANQQvFO4DsFrMZHmdA5FSwpSC4vOOFwnsfpBL/7RgQjINIFrXpS6x2Q8HY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwRB0fsoDUj8UXmKkUSbRuDle0frHyAyAP9SRFWY6jvn7afg9ci
	TdUIaHaQBq86g78jJ9gfxxFbyLTAEhqjMqOrX3e/0wS5xjGah9Tua7yRk3/NsJ8=
X-Gm-Gg: ASbGncv+Y2dUdc7OE1LAqskr/bk16SKA/n8rapniDHqY+hdxWCCnirAQmN9nFfX3nEN
	yC6yeNdz8xX/VdEGik/y6bCB1mT0+VSNEa0iMLgDEOI3PTUjNwkLFMKVnsCIIKRNArvhxWkyUIQ
	joc6K9zC5cCcUpvDc3ACsNTINSVYJa4aMOwrzpKD0YAFKe9jYy2tJSVBAvreQfBoFv7S/aVmbhN
	UsU121pL3qfIJs4ASWMYvBtU23i+wgo7P7373D6Tu1IF83gGUisjhrhhY1NmBR6+Q195Iz08lN/
	3WwSDKgbn3DBpJp8Ts3+Mc0qssIdyjL98Becu8eXfSL7
X-Google-Smtp-Source: AGHT+IGNO8bUyUW0Tf64WVNf5jONex1ECKej9xrvhw7mQgHMktiWmZ+ZuCh9rC5TGEXL07arJnJidg==
X-Received: by 2002:a05:6a00:3c81:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-7375723f949mr818617b3a.14.1742236471771;
        Mon, 17 Mar 2025 11:34:31 -0700 (PDT)
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paul Durrant <paul@xen.org>,
	xen-devel@lists.xenproject.org,
	David Hildenbrand <david@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	qemu-riscv@nongnu.org,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Harsh Prateek Bora <harshpb@linux.ibm.com>,
	alex.bennee@linaro.org,
	manos.pitsidianakis@linaro.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-ppc@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Weiwei Li <liwei1518@gmail.com>,
	kvm@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Xu <peterx@redhat.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Anthony PERARD <anthony@xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v6 06/18] codebase: prepare to remove cpu.h from exec/exec-all.h
Date: Mon, 17 Mar 2025 11:34:05 -0700
Message-Id: <20250317183417.285700-7-pierrick.bouvier@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
References: <20250317183417.285700-1-pierrick.bouvier@linaro.org>
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


