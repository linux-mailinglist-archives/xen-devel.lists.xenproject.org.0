Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A21AE77DEAA
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:30:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584395.915117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnL-00006F-7S; Wed, 16 Aug 2023 10:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584395.915117; Wed, 16 Aug 2023 10:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDnL-0008Uf-3V; Wed, 16 Aug 2023 10:30:31 +0000
Received: by outflank-mailman (input) for mailman id 584395;
 Wed, 16 Aug 2023 10:30:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDeP-0003RA-4J
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:21:17 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 98b9e70b-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:21:00 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-307d20548adso5631878f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:21:00 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:59 -0700 (PDT)
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
X-Inumbo-ID: 98b9e70b-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181260; x=1692786060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KVoQAWJ/PbaQENCx7icmqy75Oh9EhkFYatUKPfuVRa4=;
        b=IyN0tCT+CxVaLEyI9NQLiBNnaXRHdKHCqkauB/HwDACE7x5mRYTwbavApfsjb7qcMb
         tAZeAMCPyY91OP/zmS39cLuhF8jY4TtfgUKWxu54+FCIRwP5x2GTVgZEfc9PvoC6fx16
         1PsW15fvV9IHdAF22Q65Zq9fAImS/ITggAZVDR8eBfq/jj8aEXhvy3f0mr3C9v/+dUMb
         fFZy+TDphOLNDEXkOF0p/s5uUI+XxbtkuYTNBSVJKH0p0zf1hgQDCAnp5+gaRcDiN+uQ
         6scXRz/hXpopoW11Uj5Tn2GC4jz06yU2Rv11UaQV/1+oZ1LnQFFyCMAoIx7bCR9qXoLv
         3egw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181260; x=1692786060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KVoQAWJ/PbaQENCx7icmqy75Oh9EhkFYatUKPfuVRa4=;
        b=gLklmEm/EytLqnLfogLJDoIQZE46R9mH8iCtgH7O5pejNdTDy5KYIDKsvU6TAFv91A
         KR4HdaHSgPC9Xxxi5f0v9x3aUhN5In33hGNtSWlOvKyeytxVZo++OGWgsiDbY7XWvbjG
         Usb6UFoYCjvxuQuAUfvZo6Y5IP9hUtGDzYMs7hV5S54TePD7YPESGuedplXdx2WAoZC3
         XN5nvdM8/0Hf4F0W5DlcB3r/kuwyLUhJPXqf9aj9WQ1wg8s8Q9tzcn52kfP1V4ccckU0
         7rkPlpBuj6PV7fqJOLUMINNrSIbZCkDrP3kYNFtUsJMR0/UfhBeVOXA75j7eLKcrqa6s
         q9lw==
X-Gm-Message-State: AOJu0YxkHpT7d/aiYtqZc2lWwR2+mlcAG+zV4/J9bllnCAOWKfedh1hH
	KEJ/a9E09l6s20A1hOhH5Y7YenKk7wWmJLzc
X-Google-Smtp-Source: AGHT+IGVKGrBOrq+PRu/P+wiRl46ER+uh/IzFSN3kQNscFjbkS6SUBOL45nwtxKCWCkwMYGS6qzf7A==
X-Received: by 2002:adf:e40f:0:b0:31a:ccc7:29ee with SMTP id g15-20020adfe40f000000b0031accc729eemr242525wrm.7.1692181259760;
        Wed, 16 Aug 2023 03:20:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 54/57] xen/rirscv: add minimal amount of stubs to build full Xen
Date: Wed, 16 Aug 2023 13:20:07 +0300
Message-ID: <5946097b08b3ba98a6e78e853ce6cf89b1d8abc3.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Kconfig        |   1 +
 xen/arch/riscv/Makefile       |   1 +
 xen/arch/riscv/early_printk.c | 168 -------------
 xen/arch/riscv/mm.c           |  52 +++-
 xen/arch/riscv/setup.c        |   9 +-
 xen/arch/riscv/stubs.c        | 437 ++++++++++++++++++++++++++++++++++
 xen/arch/riscv/traps.c        |  25 ++
 7 files changed, 523 insertions(+), 170 deletions(-)
 create mode 100644 xen/arch/riscv/stubs.c

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index f382b36f6c..64caaa2750 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -4,6 +4,7 @@ config RISCV
 config RISCV_64
 	def_bool y
 	select 64BIT
+	select HAS_PDX
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index b08048948f..50c09469a0 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -5,6 +5,7 @@ obj-y += mm.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
 obj-y += setup.o
+obj-y += stubs.o
 obj-y += traps.o
 
 $(TARGET): $(TARGET)-syms
diff --git a/xen/arch/riscv/early_printk.c b/xen/arch/riscv/early_printk.c
index 60742a042d..610c814f54 100644
--- a/xen/arch/riscv/early_printk.c
+++ b/xen/arch/riscv/early_printk.c
@@ -40,171 +40,3 @@ void early_printk(const char *str)
         str++;
     }
 }
-
-/*
- * The following #if 1 ... #endif should be removed after printk
- * and related stuff are ready.
- */
-#if 1
-
-#include <xen/stdarg.h>
-#include <xen/string.h>
-
-/**
- * strlen - Find the length of a string
- * @s: The string to be sized
- */
-size_t (strlen)(const char * s)
-{
-    const char *sc;
-
-    for (sc = s; *sc != '\0'; ++sc)
-        /* nothing */;
-    return sc - s;
-}
-
-/**
- * memcpy - Copy one area of memory to another
- * @dest: Where to copy to
- * @src: Where to copy from
- * @count: The size of the area.
- *
- * You should not use this function to access IO space, use memcpy_toio()
- * or memcpy_fromio() instead.
- */
-void *(memcpy)(void *dest, const void *src, size_t count)
-{
-    char *tmp = (char *) dest, *s = (char *) src;
-
-    while (count--)
-        *tmp++ = *s++;
-
-    return dest;
-}
-
-int vsnprintf(char* str, size_t size, const char* format, va_list args)
-{
-    size_t i = 0; /* Current position in the output string */
-    size_t written = 0; /* Total number of characters written */
-    char* dest = str;
-
-    while ( format[i] != '\0' && written < size - 1 )
-    {
-        if ( format[i] == '%' )
-        {
-            i++;
-
-            if ( format[i] == '\0' )
-                break;
-
-            if ( format[i] == '%' )
-            {
-                if ( written < size - 1 )
-                {
-                    dest[written] = '%';
-                    written++;
-                }
-                i++;
-                continue;
-            }
-
-            /*
-             * Handle format specifiers.
-             * For simplicity, only %s and %d are implemented here.
-             */
-
-            if ( format[i] == 's' )
-            {
-                char* arg = va_arg(args, char*);
-                size_t arglen = strlen(arg);
-
-                size_t remaining = size - written - 1;
-
-                if ( arglen > remaining )
-                    arglen = remaining;
-
-                memcpy(dest + written, arg, arglen);
-
-                written += arglen;
-                i++;
-            }
-            else if ( format[i] == 'd' )
-            {
-                int arg = va_arg(args, int);
-
-                /* Convert the integer to string representation */
-                char numstr[32]; /* Assumes a maximum of 32 digits */
-                int numlen = 0;
-                int num = arg;
-                size_t remaining;
-
-                if ( arg < 0 )
-                {
-                    if ( written < size - 1 )
-                    {
-                        dest[written] = '-';
-                        written++;
-                    }
-
-                    num = -arg;
-                }
-
-                do
-                {
-                    numstr[numlen] = '0' + num % 10;
-                    num = num / 10;
-                    numlen++;
-                } while ( num > 0 );
-
-                /* Reverse the string */
-                for (int j = 0; j < numlen / 2; j++)
-                {
-                    char tmp = numstr[j];
-                    numstr[j] = numstr[numlen - 1 - j];
-                    numstr[numlen - 1 - j] = tmp;
-                }
-
-                remaining = size - written - 1;
-
-                if ( numlen > remaining )
-                    numlen = remaining;
-
-                memcpy(dest + written, numstr, numlen);
-
-                written += numlen;
-                i++;
-            }
-        }
-        else
-        {
-            if ( written < size - 1 )
-            {
-                dest[written] = format[i];
-                written++;
-            }
-            i++;
-        }
-    }
-
-    if ( size > 0 )
-        dest[written] = '\0';
-
-    return written;
-}
-
-void printk(const char *format, ...)
-{
-    static char buf[1024];
-
-    va_list args;
-    va_start(args, format);
-
-    (void)vsnprintf(buf, sizeof(buf), format, args);
-
-    early_printk(buf);
-
-    va_end(args);
-}
-
-#endif
-
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 99ed5e9623..0f40641db7 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -3,15 +3,19 @@
 #include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
 #include <xen/pfn.h>
 
 #include <asm/early_printk.h>
 #include <asm/csr.h>
 #include <asm/current.h>
-#include <asm/mm.h>
 #include <asm/page.h>
 #include <asm/processor.h>
 
+unsigned long frametable_base_pdx __read_mostly;
+unsigned long frametable_virt_end __read_mostly;
+
 struct mmu_desc {
     unsigned int num_levels;
     unsigned int pgtbl_count;
@@ -273,3 +277,49 @@ void __init noreturn noinline enable_mmu()
     switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
                           cont_after_mmu_is_enabled);
 }
+
+void put_page(struct page_info *page)
+{
+    assert_failed(__func__);
+}
+
+unsigned long get_upper_mfn_bound(void)
+{
+    /* No memory hotplug yet, so current memory limit is the final one. */
+    return max_page - 1;
+}
+
+void arch_dump_shared_mem_info(void)
+{
+    WARN();
+}
+
+int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+{
+    assert_failed(__func__);
+    return -1;
+}
+
+int xenmem_add_to_physmap_one(struct domain *d, unsigned int space,
+                              union add_to_physmap_extra extra,
+                              unsigned long idx, gfn_t gfn)
+{
+    WARN();
+
+    return 0;
+}
+
+int destroy_xen_mappings(unsigned long s, unsigned long e)
+{
+    assert_failed(__func__);
+    return -1;
+}
+
+int map_pages_to_xen(unsigned long virt,
+                     mfn_t mfn,
+                     unsigned long nr_mfns,
+                     unsigned int flags)
+{
+    assert_failed(__func__);
+    return -1;
+}
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index dde8fb898b..b44ce41d22 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -2,9 +2,16 @@
 
 #include <xen/compile.h>
 #include <xen/init.h>
+#include <xen/mm.h>
+
+#include <public/version.h>
 
 #include <asm/early_printk.h>
-#include <asm/mm.h>
+
+void arch_get_xen_caps(xen_capabilities_info_t *info)
+{
+    assert_failed("need to be implemented");
+}
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
new file mode 100644
index 0000000000..3232039bc2
--- /dev/null
+++ b/xen/arch/riscv/stubs.c
@@ -0,0 +1,437 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/cpumask.h>
+#include <xen/domain.h>
+#include <xen/irq.h>
+#include <xen/nodemask.h>
+#include <xen/time.h>
+#include <public/domctl.h>
+#include <public/vm_event.h>
+
+#include <asm/current.h>
+
+/* smpboot.c */
+
+cpumask_t cpu_online_map;
+cpumask_t cpu_present_map;
+cpumask_t cpu_possible_map;
+
+/* ID of the PCPU we're running on */
+DEFINE_PER_CPU(unsigned int, cpu_id);
+/* XXX these seem awfully x86ish... */
+/* representing HT siblings of each logical CPU */
+DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_sibling_mask);
+/* representing HT and core siblings of each logical CPU */
+DEFINE_PER_CPU_READ_MOSTLY(cpumask_var_t, cpu_core_mask);
+
+nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+
+/* time.c */
+
+unsigned long __read_mostly cpu_khz;  /* CPU clock frequency in kHz. */
+
+s_time_t get_s_time(void)
+{
+    BUG();
+}
+
+int reprogram_timer(s_time_t timeout)
+{
+    BUG();
+}
+
+void send_timer_event(struct vcpu *v)
+{
+    BUG();
+}
+
+void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
+{
+    BUG();
+}
+
+/* shutdown.c */
+
+void machine_restart(unsigned int delay_millisecs)
+{
+    BUG();
+}
+
+void machine_halt(void)
+{
+    BUG();
+}
+
+/* vm_event.c */
+
+void vm_event_fill_regs(vm_event_request_t *req)
+{
+    BUG();
+}
+
+void vm_event_set_registers(struct vcpu *v, vm_event_response_t *rsp)
+{
+    BUG();
+}
+
+void vm_event_monitor_next_interrupt(struct vcpu *v)
+{
+    /* Not supported on RISCV. */
+}
+
+void vm_event_reset_vmtrace(struct vcpu *v)
+{
+    /* Not supported on RISCV. */
+}
+
+/* domctl.c */
+
+long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
+                    XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
+{
+    BUG();
+}
+
+void arch_get_domain_info(const struct domain *d,
+                          struct xen_domctl_getdomaininfo *info)
+{
+    BUG();
+}
+
+void arch_get_info_guest(struct vcpu *v, vcpu_guest_context_u c)
+{
+    BUG();
+}
+
+/* monitor.c */
+
+int arch_monitor_domctl_event(struct domain *d,
+                              struct xen_domctl_monitor_op *mop)
+{
+    BUG();
+}
+
+/* smp.c */
+
+void arch_flush_tlb_mask(const cpumask_t *mask)
+{
+    BUG();
+}
+
+void smp_send_event_check_mask(const cpumask_t *mask)
+{
+    BUG();
+}
+
+void smp_send_call_function_mask(const cpumask_t *mask)
+{
+    BUG();
+}
+
+/* irq.c */
+
+struct pirq *alloc_pirq_struct(struct domain *d)
+{
+    BUG();
+}
+
+int pirq_guest_bind(struct vcpu *v, struct pirq *pirq, int will_share)
+{
+    BUG();
+}
+
+void pirq_guest_unbind(struct domain *d, struct pirq *pirq)
+{
+    BUG();
+}
+
+void pirq_set_affinity(struct domain *d, int pirq, const cpumask_t *mask)
+{
+    BUG();
+}
+
+static void ack_none(struct irq_desc *irq)
+{
+    BUG();
+}
+
+static void end_none(struct irq_desc *irq)
+{
+    BUG();
+}
+
+hw_irq_controller no_irq_type = {
+    .typename = "none",
+    .startup = irq_startup_none,
+    .shutdown = irq_shutdown_none,
+    .enable = irq_enable_none,
+    .disable = irq_disable_none,
+    .ack = ack_none,
+    .end = end_none
+};
+
+int arch_init_one_irq_desc(struct irq_desc *desc)
+{
+    BUG();
+}
+
+void smp_send_state_dump(unsigned int cpu)
+{
+    BUG();
+}
+
+/* domain.c */
+
+DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
+unsigned long __per_cpu_offset[NR_CPUS];
+
+void context_switch(struct vcpu *prev, struct vcpu *next)
+{
+    BUG();
+}
+
+void continue_running(struct vcpu *same)
+{
+    BUG();
+}
+
+void sync_local_execstate(void)
+{
+    BUG();
+}
+
+void sync_vcpu_execstate(struct vcpu *v)
+{
+    BUG();
+}
+
+void startup_cpu_idle_loop(void)
+{
+    BUG();
+}
+
+void free_domain_struct(struct domain *d)
+{
+    BUG();
+}
+
+void dump_pageframe_info(struct domain *d)
+{
+    BUG();
+}
+
+void free_vcpu_struct(struct vcpu *v)
+{
+    BUG();
+}
+
+int arch_vcpu_create(struct vcpu *v)
+{
+    BUG();
+}
+
+void arch_vcpu_destroy(struct vcpu *v)
+{
+    BUG();
+}
+
+void vcpu_switch_to_aarch64_mode(struct vcpu *v)
+{
+    BUG();
+}
+
+int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
+{
+    BUG();
+}
+
+int arch_domain_create(struct domain *d,
+                       struct xen_domctl_createdomain *config,
+                       unsigned int flags)
+{
+    BUG();
+}
+
+int arch_domain_teardown(struct domain *d)
+{
+    BUG();
+}
+
+void arch_domain_destroy(struct domain *d)
+{
+    BUG();
+}
+
+void arch_domain_shutdown(struct domain *d)
+{
+    BUG();
+}
+
+void arch_domain_pause(struct domain *d)
+{
+    BUG();
+}
+
+void arch_domain_unpause(struct domain *d)
+{
+    BUG();
+}
+
+int arch_domain_soft_reset(struct domain *d)
+{
+    BUG();
+}
+
+void arch_domain_creation_finished(struct domain *d)
+{
+    BUG();
+}
+
+int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
+{
+    BUG();
+}
+
+int arch_initialise_vcpu(struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
+{
+    BUG();
+}
+
+int arch_vcpu_reset(struct vcpu *v)
+{
+    BUG();
+}
+
+int domain_relinquish_resources(struct domain *d)
+{
+    BUG();
+}
+
+void arch_dump_domain_info(struct domain *d)
+{
+    BUG();
+}
+
+void arch_dump_vcpu_info(struct vcpu *v)
+{
+    BUG();
+}
+
+void vcpu_mark_events_pending(struct vcpu *v)
+{
+    BUG();
+}
+
+void vcpu_update_evtchn_irq(struct vcpu *v)
+{
+    BUG();
+}
+
+void vcpu_block_unless_event_pending(struct vcpu *v)
+{
+    BUG();
+}
+
+void vcpu_kick(struct vcpu *v)
+{
+    BUG();
+}
+
+struct domain *alloc_domain_struct(void)
+{
+    BUG();
+}
+
+struct vcpu *alloc_vcpu_struct(const struct domain *d)
+{
+    BUG();
+}
+
+unsigned long
+hypercall_create_continuation(unsigned int op, const char *format, ...)
+{
+    BUG();
+}
+
+int __init parse_arch_dom0_param(const char *s, const char *e)
+{
+    BUG();
+}
+
+/* guestcopy.c */
+
+unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
+{
+    BUG();
+}
+
+unsigned long raw_copy_from_guest(void *to, const void __user *from,
+                                  unsigned int len)
+{
+    BUG();
+}
+
+/* sysctl.c */
+
+long arch_do_sysctl(struct xen_sysctl *sysctl,
+                    XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
+{
+    BUG();
+}
+
+void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
+{
+    BUG();
+}
+
+/* p2m.c */
+
+int arch_set_paging_mempool_size(struct domain *d, uint64_t size)
+{
+    BUG();
+}
+
+int unmap_mmio_regions(struct domain *d,
+                       gfn_t start_gfn,
+                       unsigned long nr,
+                       mfn_t mfn)
+{
+    BUG();
+}
+
+int map_mmio_regions(struct domain *d,
+                     gfn_t start_gfn,
+                     unsigned long nr,
+                     mfn_t mfn)
+{
+    BUG();
+}
+
+int set_foreign_p2m_entry(struct domain *d, const struct domain *fd,
+                          unsigned long gfn, mfn_t mfn)
+{
+    BUG();
+}
+
+/* Return the size of the pool, in bytes. */
+int arch_get_paging_mempool_size(struct domain *d, uint64_t *size)
+{
+    BUG();
+}
+
+/* need for build until common code starts be buildable */
+unsigned long __read_mostly max_page;
+
+void printk(const char *fmt, ...)
+{
+    BUG();
+}
+
+void cf_check irq_actor_none(struct irq_desc *desc)
+{
+    BUG();
+}
+
+unsigned int cf_check irq_startup_none(struct irq_desc *desc)
+{
+    return 0;
+}
\ No newline at end of file
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index ccd3593f5a..ca56df75d8 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -4,6 +4,10 @@
  *
  * RISC-V Trap handlers
  */
+
+#include <xen/lib.h>
+#include <xen/sched.h>
+
 #include <asm/processor.h>
 #include <asm/traps.h>
 
@@ -11,3 +15,24 @@ void do_trap(struct cpu_user_regs *cpu_regs)
 {
     die();
 }
+
+void vcpu_show_execution_state(struct vcpu *v)
+{
+    assert_failed("need to be implented");
+}
+
+void show_execution_state(const struct cpu_user_regs *regs)
+{
+    printk("implement show_execution_state(regs)\n");
+}
+
+void arch_hypercall_tasklet_result(struct vcpu *v, long res)
+{
+    assert_failed("need to be implented");
+}
+
+enum mc_disposition arch_do_multicall_call(struct mc_state *state)
+{
+    assert_failed("need to be implented");
+    return mc_continue;
+}
-- 
2.41.0


