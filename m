Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1F6933BFA
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2024 13:13:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.759925.1169621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU2aN-00059n-MB; Wed, 17 Jul 2024 11:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 759925.1169621; Wed, 17 Jul 2024 11:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sU2aN-00056x-JJ; Wed, 17 Jul 2024 11:12:39 +0000
Received: by outflank-mailman (input) for mailman id 759925;
 Wed, 17 Jul 2024 11:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rux=OR=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sU2aM-00056r-0C
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2024 11:12:38 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78601fd1-442d-11ef-8776-851b0ebba9a2;
 Wed, 17 Jul 2024 13:12:35 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a797c62565aso680760166b.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jul 2024 04:12:35 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a79bc7f1e04sm434292866b.127.2024.07.17.04.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jul 2024 04:12:34 -0700 (PDT)
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
X-Inumbo-ID: 78601fd1-442d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721214755; x=1721819555; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uQJlmImWUn4JLfPzBBHp3AQMvRB1xhH6UYv2sVQJD38=;
        b=Gy8fuYn4EdVkgI35U1zoseAeZiji25W/2Ar2XLhO/3wmIPAAD21q7PqQTI66rTfWdI
         ebSwpSPAzJzct20M9Bw56LlymVOQTy8ccI5dyPEaZo4vGALHUhfndS0nkjmypQ6m2zc2
         4a7BC9Y01mRrlOW0Ua1VvRT+iNdmxD6EzCVuA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721214755; x=1721819555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uQJlmImWUn4JLfPzBBHp3AQMvRB1xhH6UYv2sVQJD38=;
        b=qWR/7QtRViQIxMl9eeBWaHzewsj/acvLPtuQHEpRsR2uIpC29IdAzPSfUsXQ26x97y
         VVM+5n3/evwGTh3vQ0byRcTg62v8xpNtZyOFDIJLIa1Mlgi43z6/nPBDH7dj17oqgxub
         uU8crgxO0xWK7ixmkaFYtFm1G4bPonoitqxE3MjDuj2VJNcIR5jNN4MPd7qzW+LIFmkn
         2pftokupKA/aRWysruUWbpP6+Oj36UwxKXf9ow+mQVGdVqm1nDaWHe2SrQOTzaWMb0Co
         7gsW7vCo1Lu5qgn0EDQr952hHY11UX0WDxWhVcAC3ASd39hFdsIUIQVsyEXCFg7T27uc
         w78w==
X-Gm-Message-State: AOJu0YxRnQS20A8KQj9uR35jBvDoRi808ZekAC19zEdvW7Zj8Wq8hTwk
	D9rIIq6kc/1wDJNAzCxWJ2Cx1dnhXOx/XArd9SPuSs7OfjSoRm/xBqW62yVmvmpW4MnVcgRlO3z
	p
X-Google-Smtp-Source: AGHT+IHMyxXCqflcImchzoCp0xLOwkteW+TCnCKMVBZP/Oc0mxgUAvxooEcKW9b/OduXX8rfohn7aA==
X-Received: by 2002:a17:906:2e8a:b0:a6f:e66a:1d3f with SMTP id a640c23a62f3a-a7a01192cafmr97866666b.32.1721214754529;
        Wed, 17 Jul 2024 04:12:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH for-4.20] hvmloader: Rework hypercall infrastructure
Date: Wed, 17 Jul 2024 12:12:31 +0100
Message-Id: <20240717111231.3517605-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Right now, the hypercall page is at a hardcoded physical address, and making
hypercalls involves indirect calls to compile-time constant addresses.
e.g. HYPERCALL_memory_op is:

  mov    $0x80180,%eax
  call   *%eax

Instead, import the hypercall infrastructure from XTF to have hypercall_page[]
fully within the hvmloader image, and prepared at compile time rather than
runtime.  This uses direct calls, so HYPERCALL_memory_op now disassembles as:

  call   132180 <HYPERCALL_memory_op>

which is faster and clearer.

Remove the loop over multiple hypercall pages.  It was long ago realised to be
an unworkable design, and eax fixed in the ABI to 1.

Pass -z noexecstack to LD to stop newer bintuils complaining about the absence
of .note.GNU-stack.  hvmloader is not a regular binary, and in fact its stack
is always executable owing to operating in unpaged mode.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

There doesn't appear to be any sensible AFLAGS infrastructure to set
-D__ASSEMBLY__.  Opecoding it once seemed like the least bad option.
---
 tools/firmware/hvmloader/Makefile         |   3 +
 tools/firmware/hvmloader/config.h         |   1 -
 tools/firmware/hvmloader/hvmloader.c      |   7 +-
 tools/firmware/hvmloader/hvmloader.lds    |   4 +-
 tools/firmware/hvmloader/hypercall.h      | 121 ++++++----------------
 tools/firmware/hvmloader/hypercall_page.S |  67 ++++++++++++
 6 files changed, 105 insertions(+), 98 deletions(-)
 create mode 100644 tools/firmware/hvmloader/hypercall_page.S

diff --git a/tools/firmware/hvmloader/Makefile b/tools/firmware/hvmloader/Makefile
index 84cba171cd6b..0e1dce26b342 100644
--- a/tools/firmware/hvmloader/Makefile
+++ b/tools/firmware/hvmloader/Makefile
@@ -34,6 +34,7 @@ OBJS  = hvmloader.o mp_tables.o util.o smbios.o
 OBJS += smp.o cacheattr.o xenbus.o vnuma.o
 OBJS += e820.o pci.o pir.o ctype.o
 OBJS += hvm_param.o
+OBJS += hypercall_page.o
 OBJS += ovmf.o seabios.o
 ifeq ($(debug),y)
 OBJS += tests.o
@@ -64,6 +65,7 @@ endif
 # Suppress the warning about LOAD segments with RWX permissions, as what we
 # build isn't a normal user-mode executable.
 LDFLAGS-$(call ld-option,--warn-rwx-segments) := --no-warn-rwx-segments
+LDFLAGS-y += -z noexecstack
 
 .PHONY: all
 all: hvmloader
@@ -74,6 +76,7 @@ acpi:
 
 rombios.o: roms.inc
 smbios.o: CFLAGS += -D__SMBIOS_DATE__="\"$(SMBIOS_REL_DATE)\""
+hypercall_page.o: CFLAGS += -D__ASSEMBLY__
 
 ACPI_PATH = ../../libacpi
 DSDT_FILES = dsdt_anycpu.c dsdt_15cpu.c dsdt_anycpu_qemu_xen.c
diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
index cd716bf39245..4ff7aa9d4483 100644
--- a/tools/firmware/hvmloader/config.h
+++ b/tools/firmware/hvmloader/config.h
@@ -64,7 +64,6 @@ extern bool acpi_enabled;
 
 /* Memory map. */
 #define SCRATCH_PHYSICAL_ADDRESS      0x00010000
-#define HYPERCALL_PHYSICAL_ADDRESS    0x00080000
 #define VGABIOS_PHYSICAL_ADDRESS      0x000C0000
 #define HVMLOADER_PHYSICAL_ADDRESS    0x00100000
 /* Special BIOS mappings, etc. are allocated from here upwards... */
diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
index f8af88fabf24..cd81eb412840 100644
--- a/tools/firmware/hvmloader/hvmloader.c
+++ b/tools/firmware/hvmloader/hvmloader.c
@@ -120,7 +120,6 @@ bool acpi_enabled;
 static void init_hypercalls(void)
 {
     uint32_t eax, ebx, ecx, edx;
-    unsigned long i;
     char signature[13];
     xen_extraversion_t extraversion;
     uint32_t base;
@@ -142,8 +141,7 @@ static void init_hypercalls(void)
 
     /* Fill in hypercall transfer pages. */
     cpuid(base + 2, &eax, &ebx, &ecx, &edx);
-    for ( i = 0; i < eax; i++ )
-        wrmsr(ebx, HYPERCALL_PHYSICAL_ADDRESS + (i << 12) + i);
+    wrmsr(ebx, (unsigned long)hypercall_page);
 
     /* Print version information. */
     cpuid(base + 1, &eax, &ebx, &ecx, &edx);
@@ -324,9 +322,6 @@ int main(void)
     const struct bios_config *bios;
     const struct hvm_modlist_entry *bios_module;
 
-    /* Initialise hypercall stubs with RET, rendering them no-ops. */
-    memset((void *)HYPERCALL_PHYSICAL_ADDRESS, 0xc3 /* RET */, PAGE_SIZE);
-
     printf("HVM Loader\n");
     BUG_ON(hvm_start_info->magic != XEN_HVM_START_MAGIC_VALUE);
 
diff --git a/tools/firmware/hvmloader/hvmloader.lds b/tools/firmware/hvmloader/hvmloader.lds
index edb1a12dc305..559cd2107f6a 100644
--- a/tools/firmware/hvmloader/hvmloader.lds
+++ b/tools/firmware/hvmloader/hvmloader.lds
@@ -7,9 +7,9 @@ SECTIONS
    * NB: there's no need to use the AT keyword in order to set the LMA, by
    * default the linker will use VMA = LMA unless specified otherwise.
    */
-  .text : { *(.text) *(.text.*) }
+  .text : { *(.text) *(.text.*)}
   .rodata : { *(.rodata) *(.rodata.*) }
-  .data : { *(.data) *(.data.*) }
+  .data : { *(.data) *(.data.*) *(.hcall) }
   .bss : { *(.bss) *(.bss.*) }
   _end = .;
 }
diff --git a/tools/firmware/hvmloader/hypercall.h b/tools/firmware/hvmloader/hypercall.h
index 5368c3072007..a55051c5350f 100644
--- a/tools/firmware/hvmloader/hypercall.h
+++ b/tools/firmware/hvmloader/hypercall.h
@@ -35,148 +35,91 @@
 #include <xen/xen.h>
 #include "config.h"
 
-#define hcall_addr(name)                                                \
-    ((unsigned long)HYPERCALL_PHYSICAL_ADDRESS + __HYPERVISOR_##name * 32)
-
-#define _hypercall0(type, name)                 \
-({                                              \
-    long __res;                                 \
-    asm volatile (                              \
-        "call *%%eax"                           \
-        : "=a" (__res)                          \
-        : "0" (hcall_addr(name))                \
-        : "memory" );                           \
-    (type)__res;                                \
-})
-
-#define _hypercall1(type, name, a1)             \
-({                                              \
-    long __res, __ign1;                         \
-    asm volatile (                              \
-        "call *%%eax"                           \
-        : "=a" (__res), "=b" (__ign1)           \
-        : "0" (hcall_addr(name)),               \
-          "1" ((long)(a1))                      \
-        : "memory" );                           \
-    (type)__res;                                \
-})
-
-#define _hypercall2(type, name, a1, a2)                 \
-({                                                      \
-    long __res, __ign1, __ign2;                         \
-    asm volatile (                                      \
-        "call *%%eax"                                   \
-        : "=a" (__res), "=b" (__ign1), "=c" (__ign2)    \
-        : "0" (hcall_addr(name)),                       \
-          "1" ((long)(a1)), "2" ((long)(a2))            \
-        : "memory" );                                   \
-    (type)__res;                                        \
-})
-
-#define _hypercall3(type, name, a1, a2, a3)             \
-({                                                      \
-    long __res, __ign1, __ign2, __ign3;                 \
-    asm volatile (                                      \
-        "call *%%eax"                                   \
-        : "=a" (__res), "=b" (__ign1), "=c" (__ign2),   \
-          "=d" (__ign3)                                 \
-        : "0" (hcall_addr(name)),                       \
-          "1" ((long)(a1)), "2" ((long)(a2)),           \
-          "3" ((long)(a3))                              \
-        : "memory" );                                   \
-    (type)__res;                                        \
-})
-
-#define _hypercall4(type, name, a1, a2, a3, a4)         \
-({                                                      \
-    long __res, __ign1, __ign2, __ign3, __ign4;         \
-    asm volatile (                                      \
-        "call *%%eax"                                   \
-        : "=a" (__res), "=b" (__ign1), "=c" (__ign2),   \
-          "=d" (__ign3), "=S" (__ign4)                  \
-        : "0" (hcall_addr(name)),                       \
-          "1" ((long)(a1)), "2" ((long)(a2)),           \
-          "3" ((long)(a3)), "4" ((long)(a4))            \
-        : "memory" );                                   \
-    (type)__res;                                        \
-})
-
-#define _hypercall5(type, name, a1, a2, a3, a4, a5)     \
-({                                                      \
-    long __res, __ign1, __ign2, __ign3, __ign4, __ign5; \
-    asm volatile (                                      \
-        "call *%%eax"                                   \
-        : "=a" (__res), "=b" (__ign1), "=c" (__ign2),   \
-          "=d" (__ign3), "=S" (__ign4), "=D" (__ign5)   \
-        : "0" (hcall_addr(name)),                       \
-          "1" ((long)(a1)), "2" ((long)(a2)),           \
-          "3" ((long)(a3)), "4" ((long)(a4)),           \
-          "5" ((long)(a5))                              \
-        : "memory" );                                   \
-    (type)__res;                                        \
-})
+extern const char hypercall_page[];
+
+#define _hypercall2(type, hcall, a1, a2)                                \
+    ({                                                                  \
+        long res, _a1 = (long)(a1), _a2 = (long)(a2);                   \
+        asm volatile (                                                  \
+            "call hypercall_page + %c[offset]"                          \
+            : "=a" (res), "+b" (_a1), "+c" (_a2)                        \
+            : [offset] "i" (hcall * 32)                                 \
+            : "memory" );                                               \
+        (type)res;                                                      \
+    })
+
+#define _hypercall3(type, hcall, a1, a2, a3)                            \
+    ({                                                                  \
+        long res, _a1 = (long)(a1), _a2 = (long)(a2), _a3 = (long)(a3); \
+        asm volatile (                                                  \
+            "call hypercall_page + %c[offset]"                          \
+            : "=a" (res), "+b" (_a1), "+c" (_a2), "+d" (_a3)            \
+            : [offset] "i" (hcall * 32)                                 \
+            : "memory" );                                               \
+        (type)res;                                                      \
+    })
 
 static inline int
 hypercall_sched_op(
     int cmd, void *arg)
 {
-    return _hypercall2(int, sched_op, cmd, arg);
+    return _hypercall2(int, __HYPERVISOR_sched_op, cmd, arg);
 }
 
 static inline int
 hypercall_memory_op(
     unsigned int cmd, void *arg)
 {
-    return _hypercall2(int, memory_op, cmd, arg);
+    return _hypercall2(int, __HYPERVISOR_memory_op, cmd, arg);
 }
 
 static inline int
 hypercall_multicall(
     void *call_list, int nr_calls)
 {
-    return _hypercall2(int, multicall, call_list, nr_calls);
+    return _hypercall2(int, __HYPERVISOR_multicall, call_list, nr_calls);
 }
 
 static inline int
 hypercall_event_channel_op(
     int cmd, void *arg)
 {
-    return _hypercall2(int, event_channel_op, cmd, arg);
+    return _hypercall2(int, __HYPERVISOR_event_channel_op, cmd, arg);
 }
 
 static inline int
 hypercall_xen_version(
     int cmd, void *arg)
 {
-    return _hypercall2(int, xen_version, cmd, arg);
+    return _hypercall2(int, __HYPERVISOR_xen_version, cmd, arg);
 }
 
 static inline int
 hypercall_console_io(
     int cmd, int count, char *str)
 {
-    return _hypercall3(int, console_io, cmd, count, str);
+    return _hypercall3(int, __HYPERVISOR_console_io, cmd, count, str);
 }
 
 static inline int
 hypercall_vm_assist(
     unsigned int cmd, unsigned int type)
 {
-    return _hypercall2(int, vm_assist, cmd, type);
+    return _hypercall2(int, __HYPERVISOR_vm_assist, cmd, type);
 }
 
 static inline int
 hypercall_vcpu_op(
     int cmd, int vcpuid, void *extra_args)
 {
-    return _hypercall3(int, vcpu_op, cmd, vcpuid, extra_args);
+    return _hypercall3(int, __HYPERVISOR_vcpu_op, cmd, vcpuid, extra_args);
 }
 
 static inline int
 hypercall_hvm_op(
     int cmd, void *arg)
 {
-    return _hypercall2(int, hvm_op, cmd, arg);
+    return _hypercall2(int, __HYPERVISOR_hvm_op, cmd, arg);
 }
 
 #endif /* __HVMLOADER_HYPERCALL_H__ */
diff --git a/tools/firmware/hvmloader/hypercall_page.S b/tools/firmware/hvmloader/hypercall_page.S
new file mode 100644
index 000000000000..75428591d19a
--- /dev/null
+++ b/tools/firmware/hvmloader/hypercall_page.S
@@ -0,0 +1,67 @@
+#include <xen/xen.h>
+
+        .section ".hcall", "aw"
+        .align 4096
+
+        .globl hypercall_page
+hypercall_page:
+         /* Poisoned with `ret` for safety before hypercalls are set up. */
+        .fill 4096, 1, 0xc3
+        .type hypercall_page, STT_OBJECT
+        .size hypercall_page, 4096
+
+#define DECLARE_HYPERCALL(name)                                                 \
+        .globl HYPERCALL_ ## name;                                              \
+        .type  HYPERCALL_ ## name, STT_FUNC;                                    \
+        .size  HYPERCALL_ ## name, 32;                                          \
+        .set   HYPERCALL_ ## name, hypercall_page + __HYPERVISOR_ ## name * 32
+
+DECLARE_HYPERCALL(set_trap_table)
+DECLARE_HYPERCALL(mmu_update)
+DECLARE_HYPERCALL(set_gdt)
+DECLARE_HYPERCALL(stack_switch)
+DECLARE_HYPERCALL(set_callbacks)
+DECLARE_HYPERCALL(fpu_taskswitch)
+DECLARE_HYPERCALL(sched_op_compat)
+DECLARE_HYPERCALL(platform_op)
+DECLARE_HYPERCALL(set_debugreg)
+DECLARE_HYPERCALL(get_debugreg)
+DECLARE_HYPERCALL(update_descriptor)
+DECLARE_HYPERCALL(memory_op)
+DECLARE_HYPERCALL(multicall)
+DECLARE_HYPERCALL(update_va_mapping)
+DECLARE_HYPERCALL(set_timer_op)
+DECLARE_HYPERCALL(event_channel_op_compat)
+DECLARE_HYPERCALL(xen_version)
+DECLARE_HYPERCALL(console_io)
+DECLARE_HYPERCALL(physdev_op_compat)
+DECLARE_HYPERCALL(grant_table_op)
+DECLARE_HYPERCALL(vm_assist)
+DECLARE_HYPERCALL(update_va_mapping_otherdomain)
+DECLARE_HYPERCALL(iret)
+DECLARE_HYPERCALL(vcpu_op)
+DECLARE_HYPERCALL(set_segment_base)
+DECLARE_HYPERCALL(mmuext_op)
+DECLARE_HYPERCALL(xsm_op)
+DECLARE_HYPERCALL(nmi_op)
+DECLARE_HYPERCALL(sched_op)
+DECLARE_HYPERCALL(callback_op)
+DECLARE_HYPERCALL(xenoprof_op)
+DECLARE_HYPERCALL(event_channel_op)
+DECLARE_HYPERCALL(physdev_op)
+DECLARE_HYPERCALL(hvm_op)
+DECLARE_HYPERCALL(sysctl)
+DECLARE_HYPERCALL(domctl)
+DECLARE_HYPERCALL(kexec_op)
+DECLARE_HYPERCALL(tmem_op)
+DECLARE_HYPERCALL(argo_op)
+DECLARE_HYPERCALL(xenpmu_op)
+
+DECLARE_HYPERCALL(arch_0)
+DECLARE_HYPERCALL(arch_1)
+DECLARE_HYPERCALL(arch_2)
+DECLARE_HYPERCALL(arch_3)
+DECLARE_HYPERCALL(arch_4)
+DECLARE_HYPERCALL(arch_5)
+DECLARE_HYPERCALL(arch_6)
+DECLARE_HYPERCALL(arch_7)
-- 
2.39.2


