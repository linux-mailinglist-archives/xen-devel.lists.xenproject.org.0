Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF4A92FE54
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:19:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758147.1167483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSIz8-0004W1-PH; Fri, 12 Jul 2024 16:19:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758147.1167483; Fri, 12 Jul 2024 16:19:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSIz8-0004TP-M2; Fri, 12 Jul 2024 16:19:02 +0000
Received: by outflank-mailman (input) for mailman id 758147;
 Fri, 12 Jul 2024 16:19:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSIz6-00040f-RP
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:19:00 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 725cc52d-406a-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 18:19:00 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-58bac81f40bso2957343a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 09:19:00 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-594bb9604f7sm4669169a12.15.2024.07.12.09.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:18:59 -0700 (PDT)
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
X-Inumbo-ID: 725cc52d-406a-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720801139; x=1721405939; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BY3OUb5w0oTrYR4mV0gprlP5xV2m84WlodPsogn9Pjs=;
        b=lyKrcixoE2JbL8aCfalV6m8iFZeZq+epl8czRQsC9RP6XgqfKX10VPOxxs9ukqxVHO
         ItrJ6vmpFY/PftN7zpHQv5uQWVUHSVuUVscqMT3TtrGmel95h2sYq62oMR/eWuBFHug4
         I+uddAJKWICaK4jMjlVyvIVFu6ysOIdtKqM8W5KS+5rFr2PTRzu4vv8UzOG62GThGlv+
         NqlEcVSBhwArEef5ib+Fodq3/+yGSye6EjvT3VPaJC00eV/M5E+WhzHIYdV9gmEuI+N0
         ajQsEjY0zKT5yDup2rHfwFqQXdaPWZUZW6eTPb2ESgkHlsahmqJzYZY8/mqcfMWp3zKL
         xgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801139; x=1721405939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BY3OUb5w0oTrYR4mV0gprlP5xV2m84WlodPsogn9Pjs=;
        b=JI85Pbc7+cWqC0uMHpKHTvccGGlz+l3C2HBhcRhwI+3X/J//WN0hpuvilo8IBKgHSE
         TkTZhZv9Vz4v3X2XJ4fjgb+AP4yDjS15/IzkkMsajhUbKIiiugcRNwpPOxWsgjBnprnq
         wcmlhjTM5W3u6ozWoNeEtC/58YgCL1mX/YpTr5JD8YcJuqjWbBkNrnjnRf9ziWzUeoPH
         y3hlgyr3zbREGOGIMffTcoigECD9DtIAGy0MorqShArOZzzMzy5P5s1GnJ3XHn+grjbY
         q4u4sh2bQtvJ6m37uQqLegX+Rw/ITeWjrBps1AklG4eC0nfibJ7w5eWknnJVS7x3VrGg
         v4Pw==
X-Gm-Message-State: AOJu0Yzz5x/WSmoLCpWC8KA0d8YDJz3oTVnOyNpL8uqJze0pM3BNNGre
	NVxfbz2ljhbwd8K4fVc60lC2ZPRIGMfKGZv83ApLANIkfCQM6cE6l0vDHAj0
X-Google-Smtp-Source: AGHT+IHL4FpM9BdrB3G+J7mKN1NNcS9yF2cOvmTTRegbZwowIZgJUdW3gdEkQ0GTVm3AiEdwiU2g1w==
X-Received: by 2002:aa7:c35a:0:b0:57a:858d:20ca with SMTP id 4fb4d7f45d1cf-594bc7c7e77mr7398976a12.28.1720801139348;
        Fri, 12 Jul 2024 09:18:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 3/5] xen/riscv: introduce trap_init()
Date: Fri, 12 Jul 2024 18:18:52 +0200
Message-ID: <80c02f1215d74e42fd9bc7f0d6e27d043a11b0e9.1720799487.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720799487.git.oleksii.kurochko@gmail.com>
References: <cover.1720799487.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

trap_init() wasn't declared with the __init attribute to avoid removing
__init when multi-CPU support for Xen is added.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V10:
  - update the commit message
---
Changes in V9:
 - drop inclusion of <asm/mm.h> in setup.c
 - drop #include <public/version.h>
 - ... <xen/bug.h>
 - introduce stub for
   void arch_get_xen_caps(xen_capabilities_info_t *info);

 - resolve rebase conflicts.
---
Changes in V8:
 - nothing changed. only rebase was done.
---
Changes in V7:
 - #define cast_to_bug_frame(addr) ((const struct bug_frame *)(addr)).
 - remove unnecessary comments in trap_init() function.
---
Changes in V6:
 - trap_init() is now called after enabling the MMU.
 - Add additional explanatory comments.
---
Changes in V5:
  - Nothing changed
---
Changes in V4:
  - Nothing changed
---
Changes in V3:
  - Nothing changed
---
Changes in V2:
  - Rename setup_trap_handler() to trap_init().
  - Add Reviewed-by to the commit message.
---
 xen/arch/riscv/include/asm/traps.h |  1 +
 xen/arch/riscv/setup.c             |  3 +++
 xen/arch/riscv/traps.c             | 12 ++++++++++++
 3 files changed, 16 insertions(+)

diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index 3fef318478..c30118e095 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -9,6 +9,7 @@
 
 void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
+void trap_init(void);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index e3cb0866d5..a6a29a1508 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -8,6 +8,7 @@
 #include <public/version.h>
 
 #include <asm/early_printk.h>
+#include <asm/traps.h>
 
 void arch_get_xen_caps(xen_capabilities_info_t *info)
 {
@@ -23,6 +24,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 {
     remove_identity_mapping();
 
+    trap_init();
+
     printk("All set up\n");
 
     for ( ;; )
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 37cec40dfa..cb18b30ff2 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -12,6 +12,18 @@
 #include <asm/riscv_encoding.h>
 #include <asm/traps.h>
 
+/*
+ * Initialize the trap handling.
+ *
+ * The function is called after MMU is enabled.
+ */
+void trap_init(void)
+{
+    unsigned long addr = (unsigned long)&handle_trap;
+
+    csr_write(CSR_STVEC, addr);
+}
+
 static const char *decode_trap_cause(unsigned long cause)
 {
     static const char *const trap_causes[] = {
-- 
2.45.2


