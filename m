Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281057F71CF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:42:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640463.998757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tdg-0004tW-6S; Fri, 24 Nov 2023 10:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640463.998757; Fri, 24 Nov 2023 10:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tdg-0004rV-1G; Fri, 24 Nov 2023 10:42:24 +0000
Received: by outflank-mailman (input) for mailman id 640463;
 Fri, 24 Nov 2023 10:42:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTS-0006hy-M9
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:50 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abde6b3d-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:47 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9e1021dbd28so233225166b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:47 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:46 -0800 (PST)
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
X-Inumbo-ID: abde6b3d-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821907; x=1701426707; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UScCEDxS8mLDHQ4sL4jK5fPSbpWBZopM7oODLGS6zhA=;
        b=Nldv+OHhjnopmmFWEr36jbIx+aD90wUHjTCyGIhXp/vy5lUHHHzdHgwK84uF+d4Tan
         MoEm1rmAiPW+nEe9NAz/EZYKXRstcjCbjRge99HzXOwaOn41fIh69QT6QX+e6iq48fNH
         ezHw6Ode8lUYPHsOo2U33W/3DLY0DlFTdTHNmUkTitJ6ypx1BWSt7N1KiKmmQMPbE3pN
         NMKi9Eo4hWVgdGw7iVf95y619lPwYHMBN3ToiH2rFKZIQUUJBy9CPztHEA49zbmT+QzC
         gKSNMQpFtZpwWTWgRwiMQIvj0zRS46pe/LwmXurY4jdK9Mizp6AhVjOv6gstJICf3irX
         fOOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821907; x=1701426707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UScCEDxS8mLDHQ4sL4jK5fPSbpWBZopM7oODLGS6zhA=;
        b=DEbIx2E2lkZzGluc0KwC0UoAXTnvltgcVd9JQmOkjAyzrEqJAUX24aSpDvi48A1SRo
         vqR6ffs/YSpOyS9Kih5qMzCYw+C6mBpF0YyxhIxNC0H4eUj3GU+kVbdip6X/j27ISnqM
         wfu4DCmoci/E7ktsdMqmNiIUw2bPJR84ZrqH1nsYnfamgtll1FePFnKJep34TROjuZWd
         7s8ING/t3YDC1vluKUjrXByeqjd0DXpqmzWaTTR8tnMPl5PjFlaAAcp57Ablts74NvjD
         uUEN5SyJ3PMw39frGYsSRpy6p6p5c/5DKnDPr5vx0yy1MdMeTxzK9Jh4D/okBaiWcfGl
         PMHA==
X-Gm-Message-State: AOJu0YzD8LCD8W4xgojhDOIT9wBnt/5GSpVVGMjYDuVL/jmuVIMUFkaY
	psC59596R1mtmB6xGOQNvCcN25hHRHg0sA==
X-Google-Smtp-Source: AGHT+IGg6jGlLXjZmWG0OBAHquOt9I9C2kvaUJ5n8vGH7hXZmRk1j62Eu/UQtQ9pLnLaUaUCaiolpQ==
X-Received: by 2002:a17:906:291:b0:a01:b8d6:2ea with SMTP id 17-20020a170906029100b00a01b8d602eamr1936661ejf.49.1700821907084;
        Fri, 24 Nov 2023 02:31:47 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 37/39] xen/rirscv: add minimal amount of stubs to build full Xen
Date: Fri, 24 Nov 2023 12:30:57 +0200
Message-ID: <091887466560fbd6b66239f7fee5193eb97570b9.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - define udelay stub
 - remove 'select HAS_PDX' from RISC-V Kconfig because of
   https://lore.kernel.org/xen-devel/20231006144405.1078260-1-andrew.cooper3@citrix.com/
---
 xen/arch/riscv/Makefile       |   1 +
 xen/arch/riscv/early_printk.c | 168 --------------
 xen/arch/riscv/mm.c           |  52 ++++-
 xen/arch/riscv/setup.c        |   9 +-
 xen/arch/riscv/stubs.c        | 426 ++++++++++++++++++++++++++++++++++
 xen/arch/riscv/traps.c        |  25 ++
 6 files changed, 511 insertions(+), 170 deletions(-)
 create mode 100644 xen/arch/riscv/stubs.c

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
index 053f043a3d..f0eddab56c 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,19 +1,23 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
 #include <xen/cache.h>
 #include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/macros.h>
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
@@ -294,3 +298,49 @@ unsigned long __init calc_phys_offset(void)
     phys_offset = load_start - XEN_VIRT_START;
     return phys_offset;
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
index 6593f601c1..8944e0ecfe 100644
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
index 0000000000..2031ef6bde
--- /dev/null
+++ b/xen/arch/riscv/stubs.c
@@ -0,0 +1,426 @@
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
+/* delay.c */
+
+void udelay(unsigned long usecs)
+{
+    BUG_ON("unimplemented");
+}
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
2.42.0


