Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1163687D31C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 18:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693976.1082667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBjL-00039F-TX; Fri, 15 Mar 2024 17:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693976.1082667; Fri, 15 Mar 2024 17:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBjL-00036w-Pc; Fri, 15 Mar 2024 17:52:31 +0000
Received: by outflank-mailman (input) for mailman id 693976;
 Fri, 15 Mar 2024 17:52:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+CdM=KV=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1rlBjK-0002sX-4J
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 17:52:30 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca78f8af-e2f4-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 18:52:29 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-413f76fcf41so14585645e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 10:52:29 -0700 (PDT)
Received: from EMEAENGAAD91498.citrite.net
 (default-46-102-197-201.interdsl.co.uk. [46.102.197.201])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a5d69c6000000b0033e9f6997c7sm3631448wrw.66.2024.03.15.10.52.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 10:52:27 -0700 (PDT)
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
X-Inumbo-ID: ca78f8af-e2f4-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1710525148; x=1711129948; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3xo7OpI3t17GvZtWVbf/bOFO4OxNlnVn4a3LYdu7XY=;
        b=lD31A+PCY8pEBsu1/GrO+uUYPeTT4tztVBGCoLJZjNtgvdPF31T4F9OvXX2iSWO678
         G/O/FEBjwp/IrRZWcAKiu3rXoJPg1UlEnEGVDwTiBVmcUssY9OWh4K0AxYLjq3OqnpnJ
         9GLbIfMo9Rxcy2lGfQgjsld6MGeyn9Ct0XL9U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525148; x=1711129948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A3xo7OpI3t17GvZtWVbf/bOFO4OxNlnVn4a3LYdu7XY=;
        b=gDoduhQTVM7bR9KVuuuG2qtlyrGOwmY/MZV/DOoeQmSxxo+rMo+LnIZY4OyzkFW4fY
         R+LufwxQyKwiRw81sE3v2SJv9xJhOFEpKHRgriZQDyPlwZjebin9w79PeaDZcC/bGNSM
         wNiWF11JeEb+Pg62BjOUAga1CKkWQIbQu2lLTJ5h6+ZuOEXqPOka1FvusTTHjnwsrUno
         Lt68q98qr0NFdX1z1oKz5EqOiWKk24iHUb3C9LQAKoX1t2OQojCe2Q572vkhmHxWp/SX
         ViZWV+R3peVwbdnqeLZfZapSc1FM5X/AQaAI4eVQKx0+/kEYihHvlSTISuxHKU0uwwXL
         SNFA==
X-Gm-Message-State: AOJu0YwWBzviF0Aca2Cgz1MNqp3DCU/ep9//KvKuE5icpyNAaBRF6gri
	Sil1d8fiWzkGoBPjeBdcetS+ObfrYjdqc7iyaFJw5dRcGwZ5tHO19COWhWe2c5Q3N+FbhrgnDId
	V
X-Google-Smtp-Source: AGHT+IFZr9DuyeXZebztwFFVMcKj7dEhu/jn+GFXCDO8LtgYFsieP3WM/Qj8hWEkm8nk9Euy5eeCzw==
X-Received: by 2002:adf:ff87:0:b0:33e:6833:8fa9 with SMTP id j7-20020adfff87000000b0033e68338fa9mr3985505wrr.44.1710525148557;
        Fri, 15 Mar 2024 10:52:28 -0700 (PDT)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 1/2] x86: Enable BLD and handle #DB traps
Date: Fri, 15 Mar 2024 17:52:23 +0000
Message-Id: <5c0c2fd252f425a397981546496438ebac439db2.1710524011.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710524011.git.matthew.barnes@cloud.com>
References: <cover.1710524011.git.matthew.barnes@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable Bus Lock Detect if available, and handle #DB traps to reduce
effects of DoS.

The value to restore MSR_DEBUGCTL to after VMExit will now depend on
whether BLD is enabled or not.

Restore MSR_DEBUGCTL after being cleared by storing a copy of the
register value in memory, instead of hard-coding it.

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 xen/arch/x86/cpu/common.c            |  5 +++++
 xen/arch/x86/hvm/vmx/entry.S         |  2 +-
 xen/arch/x86/include/asm/debugreg.h  |  1 +
 xen/arch/x86/include/asm/msr-index.h |  1 +
 xen/arch/x86/include/asm/msr.h       |  2 ++
 xen/arch/x86/msr.c                   |  2 ++
 xen/arch/x86/traps.c                 | 10 ++++++++--
 7 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 28d7f34c4dbe..f11ac06f8292 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -623,6 +623,11 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	}
 
 	setup_doitm();
+
+	if (cpu_has(c, X86_FEATURE_BLD)) {
+		host_msr_debugctl |= IA32_DEBUGCTLMSR_BLD;
+		wrmsrl(MSR_IA32_DEBUGCTLMSR, host_msr_debugctl);
+	}
 }
 
 /* leaf 0xb SMT level */
diff --git a/xen/arch/x86/hvm/vmx/entry.S b/xen/arch/x86/hvm/vmx/entry.S
index 1bead826caa3..a0148f78584d 100644
--- a/xen/arch/x86/hvm/vmx/entry.S
+++ b/xen/arch/x86/hvm/vmx/entry.S
@@ -46,8 +46,8 @@ ENTRY(vmx_asm_vmexit_handler)
         /* WARNING! `ret`, `call *`, `jmp *` not safe before this point. */
 
         /* Hardware clears MSR_DEBUGCTL on VMExit.  Reinstate it if debugging Xen. */
+        mov host_msr_debugctl(%rip), %eax
         .macro restore_lbr
-            mov $IA32_DEBUGCTLMSR_LBR, %eax
             mov $MSR_IA32_DEBUGCTLMSR, %ecx
             xor %edx, %edx
             wrmsr
diff --git a/xen/arch/x86/include/asm/debugreg.h b/xen/arch/x86/include/asm/debugreg.h
index 2bdaf5d9aa11..9c048ae215d6 100644
--- a/xen/arch/x86/include/asm/debugreg.h
+++ b/xen/arch/x86/include/asm/debugreg.h
@@ -19,6 +19,7 @@
 #define DR_TRAP1        (0x2)           /* db1 */
 #define DR_TRAP2        (0x4)           /* db2 */
 #define DR_TRAP3        (0x8)           /* db3 */
+#define DR_TRAP11       (0x800)         /* db11 */
 #define DR_STEP         (0x4000)        /* single-step */
 #define DR_SWITCH       (0x8000)        /* task switch */
 #define DR_NOT_RTM      (0x10000)       /* clear: #BP inside RTM region */
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 92dd9fa4962c..2e397bd28c77 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -292,6 +292,7 @@
 #define MSR_IA32_DEBUGCTLMSR		0x000001d9
 #define IA32_DEBUGCTLMSR_LBR		(1<<0) /* Last Branch Record */
 #define IA32_DEBUGCTLMSR_BTF		(1<<1) /* Single Step on Branches */
+#define IA32_DEBUGCTLMSR_BLD		(1<<2) /* Bus Lock Detect */
 #define IA32_DEBUGCTLMSR_TR		(1<<6) /* Trace Message Enable */
 #define IA32_DEBUGCTLMSR_BTS		(1<<7) /* Branch Trace Store */
 #define IA32_DEBUGCTLMSR_BTINT		(1<<8) /* Branch Trace Interrupt */
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 1d8ea9f26faa..9ff7dcc8ca8b 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -432,4 +432,6 @@ int init_vcpu_msr_policy(struct vcpu *v);
 int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val);
 int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val);
 
+extern uint32_t host_msr_debugctl;
+
 #endif /* __ASM_MSR_H */
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 9babd441f9d4..7d9d162cb8b4 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -24,6 +24,8 @@
 
 #include <public/hvm/params.h>
 
+uint32_t host_msr_debugctl;
+
 DEFINE_PER_CPU(uint32_t, tsc_aux);
 
 int init_vcpu_msr_policy(struct vcpu *v)
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index d554c9d41edd..7d8eee013d00 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1936,9 +1936,12 @@ void asmlinkage do_debug(struct cpu_user_regs *regs)
      */
     write_debugreg(6, X86_DR6_DEFAULT);
 
+    if ( !( dr6 & DR_TRAP11 ) )
+        return;
+
     /* #DB automatically disabled LBR.  Reinstate it if debugging Xen. */
     if ( cpu_has_xen_lbr )
-        wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
+        wrmsrl(MSR_IA32_DEBUGCTLMSR, host_msr_debugctl);
 
     if ( !guest_mode(regs) )
     {
@@ -2130,7 +2133,10 @@ void percpu_traps_init(void)
     }
 
     if ( cpu_has_xen_lbr )
-        wrmsrl(MSR_IA32_DEBUGCTLMSR, IA32_DEBUGCTLMSR_LBR);
+    {
+        host_msr_debugctl |= IA32_DEBUGCTLMSR_LBR;
+        wrmsrl(MSR_IA32_DEBUGCTLMSR, host_msr_debugctl);
+    }
 }
 
 /* Exception entries */
-- 
2.34.1


