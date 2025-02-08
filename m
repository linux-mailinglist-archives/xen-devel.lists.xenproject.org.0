Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A58A2D1E0
	for <lists+xen-devel@lfdr.de>; Sat,  8 Feb 2025 01:05:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884155.1293981 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgYLN-0002JO-JL; Sat, 08 Feb 2025 00:05:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884155.1293981; Sat, 08 Feb 2025 00:05:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgYLN-0002Hl-Fx; Sat, 08 Feb 2025 00:05:09 +0000
Received: by outflank-mailman (input) for mailman id 884155;
 Sat, 08 Feb 2025 00:05:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lbac=U7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tgYLM-00022W-8i
 for xen-devel@lists.xenproject.org; Sat, 08 Feb 2025 00:05:08 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a9b9d0e-e5b0-11ef-a073-877d107080fb;
 Sat, 08 Feb 2025 01:05:07 +0100 (CET)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-38dd0dc21b2so313496f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 16:05:07 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4391da9656fsm72336295e9.3.2025.02.07.16.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 16:05:05 -0800 (PST)
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
X-Inumbo-ID: 5a9b9d0e-e5b0-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1738973106; x=1739577906; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k79odjZVJL9qLhOKUcXOXOULzXIyeOuWCwsvg6fXSdI=;
        b=Ng4y2rot+MBJhxcOO5Y//IPsjLxm8Z2PY80dnPGWb+Z3Fa2CsOdABtld/2lflzb9RD
         BPhsbu+nSLQQuePBq9Mmne1G2EArK6bHvqKFbrWRHkT+RjlcY080u4I2KJjPREP85jQo
         3BV5XgpY4yTblw7RBXqLgo6WDVRKLxQSQH4kE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738973106; x=1739577906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k79odjZVJL9qLhOKUcXOXOULzXIyeOuWCwsvg6fXSdI=;
        b=CUFiHtXkiNz7/IFleUGvRYttSJVwL7daNJk2WSVeD2oAfIbS8fz9pSQ/76kBnsWxb1
         5hDdUUXfuNhnoprsmycN+UotBmXDQbUkrqg7IhHs+oe+VbBLr9w26aQg6B+BE4+Tezvi
         uB4cg5WSABJYw9kZyoFS1Mm4y+cBl5R4hdjKwXPj4mfZ4mPI/NzsXCpkJRiAUH4RIfSe
         gVSK1aMceO4jQlj34YTbfgeHBEPne+9LC8B6gB0nzKsMH8bVAzE22lDQVNvg8E/H15Uh
         QT89TBcbUUmkYDdotEib3icz8pKVINlAkRqY1AnvpHt14kOASLvBuwrnjllghN10CanG
         33HA==
X-Gm-Message-State: AOJu0YxZudUlNilE3etXdlV5hPT4NwT0VNTFEBbtLqqOX7KN0cHCjHwK
	LY+23coKDIAOIo+6QRByXInCTaXiRP/vuFBLMPAc18zPHNTrlgnisdQlv+6EqgwEg86smx6pV+G
	NZkE=
X-Gm-Gg: ASbGncud6WD42LTF+OyfBqNT2+OmgFX1KdqlvuMlJQF36roQenq7QEQK+bv+7aNb5yF
	3z46s4F1KvLvM2dCLulQjZoWwWn+OY3oTxOoh3I4V8twe4oO2lgNXbV7OrFcf72PztkKdBwvZjk
	45mmTMnlc3VrIoaLsuFXJzicl+hj4G/Fx7AzoSnmpGRCgWaJKNODDKDbMrr/A+L1J7ep+Hb6TM1
	WMalURzv/6MFIn3dOfzBuiVOxGx7vD2yQMVQJpPmSjzvkNpF72ynJ85LzrfYdE3j/s/xKg/kPUd
	wAYt1yH8yKm6h/4zApc0vBzFUcTbs2qZjEcRe6no/2EHF3zuvW+SyjMCMWIIymI0xtBuNO8=
X-Google-Smtp-Source: AGHT+IGJkEWOFX5Gjq2VAs2p6GZzpMkyV0TM9zLwmOR59crbwu92jAZYa+h37SfthZDUenAOfcn4Dg==
X-Received: by 2002:a05:6000:1884:b0:385:e0d6:fb73 with SMTP id ffacd0b85a97d-38dc8dc1f92mr3586402f8f.15.1738973106144;
        Fri, 07 Feb 2025 16:05:06 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 3/4] xen: Centralise the declaration of dump_execution_state()
Date: Sat,  8 Feb 2025 00:02:55 +0000
Message-Id: <20250208000256.431883-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250208000256.431883-1-andrew.cooper3@citrix.com>
References: <20250208000256.431883-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Three architectures have an identical dump_execution_state(), and PPC has a
stub for show_execution_state() that just isn't wired up yet.

show_execution_state() is declared in a common header, meaning that
dump_execution_state() really ought to be too.  Move them both into xen/bug.h
as they're tightly tied to run_in_exception_handler().  Drop the include of
xen/kernel.h from ubsan.c which was required reviously for RISC-V to compile.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/arm/include/asm/processor.h   | 2 --
 xen/arch/riscv/include/asm/processor.h | 2 --
 xen/arch/x86/include/asm/processor.h   | 1 -
 xen/common/ubsan/ubsan.c               | 1 -
 xen/include/xen/bug.h                  | 3 +++
 xen/include/xen/kernel.h               | 2 --
 6 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/include/asm/processor.h b/xen/arch/arm/include/asm/processor.h
index d80d44aeaa8f..f2c4d990c71c 100644
--- a/xen/arch/arm/include/asm/processor.h
+++ b/xen/arch/arm/include/asm/processor.h
@@ -577,8 +577,6 @@ void panic_PAR(uint64_t par);
 void show_registers(const struct cpu_user_regs *regs);
 void show_stack(const struct cpu_user_regs *regs);
 
-#define dump_execution_state() run_in_exception_handler(show_execution_state)
-
 #define cpu_relax() barrier() /* Could yield? */
 
 /* All a bit UP for the moment */
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 39696fb58dc6..90b800956303 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -91,8 +91,6 @@ static inline void sfence_vma(void)
     asm volatile ( "sfence.vma" ::: "memory" );
 }
 
-#define dump_execution_state() run_in_exception_handler(show_execution_state)
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* ASM__RISCV__PROCESSOR_H */
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index d247ef8dd226..c2eafaecfd40 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -405,7 +405,6 @@ static always_inline void rep_nop(void)
 void show_code(const struct cpu_user_regs *regs);
 void show_stack_overflow(unsigned int cpu, const struct cpu_user_regs *regs);
 void show_registers(const struct cpu_user_regs *regs);
-#define dump_execution_state() run_in_exception_handler(show_execution_state)
 void show_page_walk(unsigned long addr);
 void noreturn fatal_trap(const struct cpu_user_regs *regs, bool show_remote);
 
diff --git a/xen/common/ubsan/ubsan.c b/xen/common/ubsan/ubsan.c
index e99370322b44..a96153c08078 100644
--- a/xen/common/ubsan/ubsan.c
+++ b/xen/common/ubsan/ubsan.c
@@ -11,7 +11,6 @@
  */
 
 #include <xen/bitops.h>
-#include <xen/kernel.h>
 #include <xen/lib.h>
 #include <xen/percpu.h>
 #include <xen/spinlock.h>
diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
index 99814c4bef36..2325a46e7f61 100644
--- a/xen/include/xen/bug.h
+++ b/xen/include/xen/bug.h
@@ -155,6 +155,9 @@ int do_bug_frame(const struct cpu_user_regs *regs, unsigned long pc);
 
 #endif /* CONFIG_GENERIC_BUG_FRAME */
 
+void cf_check show_execution_state(const struct cpu_user_regs *regs);
+#define dump_execution_state() run_in_exception_handler(show_execution_state)
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __XEN_BUG_H__ */
diff --git a/xen/include/xen/kernel.h b/xen/include/xen/kernel.h
index c5b6cc977772..57a1ef4e17b7 100644
--- a/xen/include/xen/kernel.h
+++ b/xen/include/xen/kernel.h
@@ -94,10 +94,8 @@ bool is_active_kernel_text(unsigned long addr);
 extern const char xen_config_data[];
 extern const unsigned int xen_config_data_size;
 
-struct cpu_user_regs;
 struct vcpu;
 
-void cf_check show_execution_state(const struct cpu_user_regs *regs);
 void vcpu_show_execution_state(struct vcpu *v);
 
 #endif /* _LINUX_KERNEL_H */
-- 
2.39.5


