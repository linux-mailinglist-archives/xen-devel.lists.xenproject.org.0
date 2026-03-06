Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GfPNQICq2msZQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:34:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A3D225021
	for <lists+xen-devel@lfdr.de>; Fri, 06 Mar 2026 17:34:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1247988.1546434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7k-0006Wc-D6; Fri, 06 Mar 2026 16:34:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1247988.1546434; Fri, 06 Mar 2026 16:34:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vyY7j-0006OI-UM; Fri, 06 Mar 2026 16:33:59 +0000
Received: by outflank-mailman (input) for mailman id 1247988;
 Fri, 06 Mar 2026 16:33:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RAjd=BG=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vyY7h-0003HN-2Z
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2026 16:33:57 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44742426-197a-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Mar 2026 17:33:55 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso139922685e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Mar 2026 08:33:55 -0800 (PST)
Received: from fedora (user-109-243-67-101.play-internet.pl. [109.243.67.101])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dae57c05sm4406550f8f.39.2026.03.06.08.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 08:33:53 -0800 (PST)
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
X-Inumbo-ID: 44742426-197a-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772814834; x=1773419634; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qFpsHTy+iZE+ZlLI/wSoHNKAABJERus7tjJu21kZd2A=;
        b=c/VEaL7MKi7XawxZ031l/Wj7E2m8bIBAHYmP0SbEsYoR0Hjy9lr5nu57miDo+7uFJQ
         HzuZnvXQB7V7D1Ocic+fk+Ge8WGx36N8dVifHX7UAPP/xiR78fm4kEO3wkqEQbCJ2kNL
         CZThkYtnEtBe6ejK/uRtmKwnqZU5+OzAY+aTc0Q5x49qjbzkJzVoU1fbOSjStXrPvZ2C
         WAdjZjk/v17VibI6NCwzW44XABgbsi6KcY+dtyO6to3Or9Jqno47pf59t5VYybf7+K+t
         xnePYR/uPAASaOc5wDikjm6/3vWXNK39z8GTQJwglO2aIntilHPxP3GupSeOXOYBLb36
         hBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772814834; x=1773419634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qFpsHTy+iZE+ZlLI/wSoHNKAABJERus7tjJu21kZd2A=;
        b=Mqu5wf0zrvB15s2yUVhHetipNZvORV5BLfK8lBfqpmvLmGCfFkYKT84KzollCs0x85
         Z6sxYzlqbjeTsG8zeozxSn/gGIA+hBSWwaKpdrvYsPXZAh9fT6U3iJyRHDRI0rhkzp1L
         bLnP78OAjUyj7kS7uLToulsRe+eZmrHyowbZpHLBbq/3Gj5iCmisTTT54gAyj9AGi3ie
         ql7ccA6vbuAt9beDqcnNGFcjSen40q+VjIqr3msyCldDRx5LbClZ33hmSZQs3iDPLSO6
         igHWofbV8hbOuPR0KhjIh09PpIHw4x3a+70lDHoAmETuS+1HQf6YXrMN5MnXnVvXwu6/
         FQlw==
X-Gm-Message-State: AOJu0YwfDU9MULWb1m4yh3WaFMIZzYtsvvE3i4BplAj8up/ZxStE8ufZ
	kcvpFWqtC36M+qysRJDbrEP/GwjaD3a6wactLmnqyE/ZcAQ1AXhFJfPjM2Fu6w==
X-Gm-Gg: ATEYQzy3Zd5EGKrv+P2dTIPSwqOiqiWjCCFYn12EilJ7Fv+HtC0r5QA4hKCn22u58Ti
	Ye7OtGK4bvATWPIgbL1GU0U/5ZXmqLqt3AKkJXh0YkNH8AIc278I6hsZTKL4FsZsEkOuv07ECr8
	zYv6HbKj6mBTpr3a+LBUIYVXIgI0k0bES2T0mNxvxOvpuIdpHxeYHbFSUeU8IenesuLtEt5uj/V
	FXNdf0EmwG8GzMr4oegpW7SOxZy2AjEoItaNC5w0W9YbiiNh56Lsi+v/4GbspixqzJrfce6YaSF
	hceFvo854xMidHb5EO0um4z58kDEAa0bZoxPiOuLPu2tAIBfT40WknS6DNTdRBjK/pLJsdFN+mV
	99yE5iaooMqju8KQY5TYMe1IQZ/f99bAn/Ng05bWSoZB6BZDtLOpMo9qUza1RwOCX+4qiEhiOOQ
	vk+TYwhfeWVTCxUDnenkpYDjVc659rnwXvUhT4J7jhT+a+w7kIy9divUzr1VwA+1X58g==
X-Received: by 2002:a05:600c:45c6:b0:483:c35d:3662 with SMTP id 5b1f17b1804b1-48526957c37mr42964395e9.18.1772814834067;
        Fri, 06 Mar 2026 08:33:54 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Romain Caritey <Romain.Caritey@microchip.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v7 14/14] xen/riscv: Disable SSTC extension and add trap-based CSR probing
Date: Fri,  6 Mar 2026 17:33:31 +0100
Message-ID: <f7b30c80eabd3ba371a0d541e3be023314ec37fd.1772814110.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1772814110.git.oleksii.kurochko@gmail.com>
References: <cover.1772814110.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 44A3D225021
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:Romain.Caritey@microchip.com,m:oleksii.kurochko@gmail.com,m:cardoe@cardoe.com,m:sstabellini@kernel.org,m:alistair.francis@wdc.com,m:connojdavis@gmail.com,m:jbeulich@suse.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FREEMAIL_CC(0.00)[microchip.com,gmail.com,cardoe.com,kernel.org,wdc.com,suse.com];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiikurochko@gmail.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Some RISC-V platforms expose the SSTC extension, but its CSRs are not
properly saved and restored by Xen. Using SSTC in Xen could therefore
lead to unexpected behaviour.

To avoid this in QEMU, disable SSTC by passing "sstc=off". On real
hardware, OpenSBI does not provide a mechanism to disable SSTC via the
DTS (riscv,isa or similar property), as it does not rely on that
property to determine extension availability. Instead, it directly
probes the CSR_STIMECMP register.

Introduce struct trap_info together with the do_expected_trap() handler
to safely probe CSRs. The helper csr_read_allowed() attempts to read a
CSR while catching traps, allowing Xen to detect whether the register
is accessible. This mechanism is used at boot to verify SSTC support and
panic if the CSR is not available.

The trap handling infrastructure may also be reused for other cases
where controlled trap handling is required (e.g. probing instructions
such as HLV*).

Also reorder header inclusion in asm-offsets.c to follow Xen coding
style: <xen/types.h> should be included before <asm/*> headers as there
is no any specific reason to remain the current order.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v7:
 - new patch.
   IMO, it is okay to have this patch separetely as at the moment it won't be
   an issue if Xen will use CSR_STIMECMP to setup its timer. The issue will
   start to occur when a guest will run.
---
 automation/scripts/qemu-smoke-riscv64.sh |  2 +-
 xen/arch/riscv/cpufeature.c              |  8 ++++++
 xen/arch/riscv/entry.S                   | 24 ++++++++++++++++++
 xen/arch/riscv/include/asm/csr.h         | 32 ++++++++++++++++++++++++
 xen/arch/riscv/include/asm/traps.h       |  7 ++++++
 xen/arch/riscv/riscv64/asm-offsets.c     |  7 +++++-
 6 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/automation/scripts/qemu-smoke-riscv64.sh b/automation/scripts/qemu-smoke-riscv64.sh
index c0b1082a08fd..1909abb7af32 100755
--- a/automation/scripts/qemu-smoke-riscv64.sh
+++ b/automation/scripts/qemu-smoke-riscv64.sh
@@ -7,7 +7,7 @@ rm -f smoke.serial
 
 export TEST_CMD="qemu-system-riscv64 \
     -M virt,aia=aplic-imsic \
-    -cpu rv64,svpbmt=on \
+    -cpu rv64,svpbmt=on,sstc=off \
     -smp 1 \
     -nographic \
     -m 2g \
diff --git a/xen/arch/riscv/cpufeature.c b/xen/arch/riscv/cpufeature.c
index 03e27b037be0..987d36dc7eee 100644
--- a/xen/arch/riscv/cpufeature.c
+++ b/xen/arch/riscv/cpufeature.c
@@ -17,6 +17,8 @@
 #include <xen/sections.h>
 
 #include <asm/cpufeature.h>
+#include <asm/csr.h>
+#include <asm/traps.h>
 
 #ifdef CONFIG_ACPI
 # error "cpufeature.c functions should be updated to support ACPI"
@@ -483,6 +485,7 @@ void __init riscv_fill_hwcap(void)
     unsigned int i;
     const size_t req_extns_amount = ARRAY_SIZE(required_extensions);
     bool all_extns_available = true;
+    struct trap_info trap;
 
     riscv_fill_hwcap_from_isa_string();
 
@@ -509,4 +512,9 @@ void __init riscv_fill_hwcap(void)
     if ( !all_extns_available )
         panic("Look why the extensions above are needed in "
               "https://xenbits.xenproject.org/docs/unstable/misc/riscv/booting.txt\n");
+
+    csr_read_allowed(CSR_STIMECMP, (unsigned long)&trap);
+
+    if ( !trap.scause )
+        panic("SSTC isn't supported\n");
 }
diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
index 202a35fb03a8..b434948da3a4 100644
--- a/xen/arch/riscv/entry.S
+++ b/xen/arch/riscv/entry.S
@@ -99,3 +99,27 @@ restore_registers:
 
         sret
 END(handle_trap)
+
+        /*
+         * We assume that the faulting instruction is 4 bytes long and blindly
+         * increment SEPC by 4.
+         *
+         * This should be safe because all places that may trigger this handler
+         * use ".option norvc" around the instruction that could cause the trap,
+         * or the instruction is not available in the RVC instruction set.
+         *
+         * do_expected_trap(a3, a4):
+         *   a3 <- pointer to struct trap_info
+         *   a4 <- temporary register
+         */
+FUNC(do_expected_trap)
+        csrr    a4, CSR_SEPC
+        REG_S   a4, RISCV_TRAP_SEPC(a3)
+        csrr    a4, CSR_SCAUSE
+        REG_S   a4, RISCV_TRAP_SCAUSE(a3)
+
+        csrr    a4, CSR_SEPC
+        addi    a4, a4, 4
+        csrw    CSR_SEPC, a4
+        sret
+END(do_expected_trap)
diff --git a/xen/arch/riscv/include/asm/csr.h b/xen/arch/riscv/include/asm/csr.h
index 01876f828981..b318cbdf35c3 100644
--- a/xen/arch/riscv/include/asm/csr.h
+++ b/xen/arch/riscv/include/asm/csr.h
@@ -9,6 +9,7 @@
 #include <asm/asm.h>
 #include <xen/const.h>
 #include <asm/riscv_encoding.h>
+#include <asm/traps.h>
 
 #ifndef __ASSEMBLER__
 
@@ -78,6 +79,37 @@
                            : "memory" );                        \
 })
 
+/*
+ * Some functions inside asm/system.h requires some of the macros above,
+ * so this header should be included after the macros above are introduced.
+ */
+#include <asm/system.h>
+
+#define csr_read_allowed(csr_num, trap) \
+({ \
+    register unsigned long tinfo asm("a3") = (unsigned long)trap; \
+    register unsigned long ttmp asm("a4"); \
+    register unsigned long stvec = (unsigned long)&do_expected_trap; \
+    register unsigned long ret = 0; \
+    unsigned long flags; \
+    ((struct trap_info *)(trap))->scause = 0; \
+    local_irq_save(flags); \
+    asm volatile ( \
+        ".option push\n" \
+        ".option norvc\n" \
+        "add %[ttmp], %[tinfo], zero\n" \
+        "csrrw %[stvec], " STR(CSR_STVEC) ", %[stvec]\n" \
+        "csrr %[ret], %[csr]\n" \
+        "csrw " STR(CSR_STVEC) ", %[stvec]\n" \
+        ".option pop" \
+        : [stvec] "+&r" (stvec), [tinfo] "+&r" (tinfo), \
+          [ttmp] "+&r" (ttmp), [ret] "=&r" (ret) \
+        : [csr] "i" (csr_num) \
+        : "memory" ); \
+    local_irq_restore(flags); \
+    ret; \
+})
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__CSR_H */
diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index 21fa3c3259b3..194d9a72f3ed 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -7,10 +7,17 @@
 
 #ifndef __ASSEMBLER__
 
+struct trap_info {
+    register_t sepc;
+    register_t scause;
+};
+
 void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
 void trap_init(void);
 
+void do_expected_trap(void);
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* ASM__RISCV__TRAPS_H */
diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
index 472cced4f8af..b0e2a4d86bd3 100644
--- a/xen/arch/riscv/riscv64/asm-offsets.c
+++ b/xen/arch/riscv/riscv64/asm-offsets.c
@@ -1,8 +1,10 @@
 #define COMPILE_OFFSETS
 
+#include <xen/types.h>
+
 #include <asm/current.h>
 #include <asm/processor.h>
-#include <xen/types.h>
+#include <asm/traps.h>
 
 #define DEFINE(_sym, _val)                                                 \
     asm volatile ( "\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\""\
@@ -54,4 +56,7 @@ void asm_offsets(void)
     BLANK();
     DEFINE(PCPU_INFO_SIZE, sizeof(struct pcpu_info));
     BLANK();
+    OFFSET(RISCV_TRAP_SEPC, struct trap_info, sepc);
+    OFFSET(RISCV_TRAP_SCAUSE, struct trap_info, scause);
+    BLANK();
 }
-- 
2.53.0


