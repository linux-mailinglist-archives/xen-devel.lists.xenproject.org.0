Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A51778BFD54
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 14:40:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718779.1121301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaB-0003R7-S4; Wed, 08 May 2024 12:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718779.1121301; Wed, 08 May 2024 12:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4gaB-0003LY-L6; Wed, 08 May 2024 12:39:39 +0000
Received: by outflank-mailman (input) for mailman id 718779;
 Wed, 08 May 2024 12:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6nIi=ML=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s4ga9-0002b0-J3
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 12:39:37 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06dbf4e2-0d38-11ef-909c-e314d9c70b13;
 Wed, 08 May 2024 14:39:35 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a59b49162aeso949718866b.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 May 2024 05:39:35 -0700 (PDT)
Received: from EMEAENGAAD19049.citrite.net
 (default-46-102-197-194.interdsl.co.uk. [46.102.197.194])
 by smtp.gmail.com with ESMTPSA id
 uj4-20020a170907c98400b00a599f876c28sm5984439ejc.38.2024.05.08.05.39.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 05:39:34 -0700 (PDT)
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
X-Inumbo-ID: 06dbf4e2-0d38-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715171975; x=1715776775; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqD0+veAXWzP3pl5EqEMwlTj/kQBDP8F+ZMM9Cf6nOI=;
        b=b4Tqc86tE+8yM+fJ41o291lmU20XK9g5RjMWM9NIzFrYzQDr0Eb08XOHEaDvwKTwLA
         Y1Lm55N4yU+5VGsmyYtzz0l+1IF92TRxbFZcmCIRerHNO9IXlrDiGhyKmBKPIPPrUzxo
         mW2+ij4ZNIGGPMj8E4oABS4EaN2c+TKdWfFfs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171975; x=1715776775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SqD0+veAXWzP3pl5EqEMwlTj/kQBDP8F+ZMM9Cf6nOI=;
        b=ueCeDGnBB8Jyp5OzakJ9K7xqlXBHYjySlY0d1vdrrVUJnR44T4HQIZao4kaReKCe8z
         +Hc3HvEbIsKrB6goNmXxXycgLU5zpi2p6Q3juAMe9it6LkkeJrEFqM5BRxIe3fZEw/gj
         SBbp4+s/YRGURgsf9Ej+yk66cf6NcfuGaQaf+XvUMN/ELlbywE15SN7cKhpOcfC6UvYC
         3AeBKW7ZVzt+j89bV0wvc0lgW812CB6n7KxJLu8FEn0vMn9fhViUVFKys68qlwwsrw+u
         Ty+6EvzLoa7Yx/MSVwOW6s9wjAxwl/fHKgdsYKBHgF+VhKWFdQ2f1jVggvXvVTLtO3R5
         04UA==
X-Gm-Message-State: AOJu0Ywswu5fsUUmsjUCivSaom1fxUgueOQShkO9yFVlnbDHb9zMohby
	hkt42Tp6bC9IfPLzF6xaS2b4Fpk66Ukbe1paT38Pgxz/MZcut9+gtFuBPY8lHifBMj15CeRJywO
	Y
X-Google-Smtp-Source: AGHT+IGg/M+0iKytNyTfXIK6S1aJWBIHRH7JNnNwznMpl2CuP/vkB2TIZRLcAfCZph/OLryXk56CSw==
X-Received: by 2002:a17:907:990b:b0:a59:c3d0:550c with SMTP id a640c23a62f3a-a59fb95a533mr160323066b.43.1715171975070;
        Wed, 08 May 2024 05:39:35 -0700 (PDT)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v2 4/8] tools/hvmloader: Wake APs with hypercalls and not with INIT+SIPI+SIPI
Date: Wed,  8 May 2024 13:39:23 +0100
Message-Id: <bd23a05ea25b2f431bb0655ca6402073f9cf49b8.1715102098.git.alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715102098.git.alejandro.vallejo@cloud.com>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes a needless assembly entry point and simplifies the codebase by allowing
hvmloader to wake APs it doesn't know the APIC ID of.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
v2:
  * New patch. Replaces adding cpu policy to hvmloader in v1.
---
 tools/firmware/hvmloader/smp.c | 111 +++++++++++++--------------------
 1 file changed, 44 insertions(+), 67 deletions(-)

diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
index 082b17f13818..a668f15d7e1f 100644
--- a/tools/firmware/hvmloader/smp.c
+++ b/tools/firmware/hvmloader/smp.c
@@ -22,88 +22,68 @@
 #include "util.h"
 #include "config.h"
 #include "apic_regs.h"
+#include "hypercall.h"
 
-#define AP_BOOT_EIP 0x1000
-extern char ap_boot_start[], ap_boot_end[];
+#include <xen/asm/x86-defns.h>
+#include <xen/hvm/hvm_vcpu.h>
+
+#include <xen/vcpu.h>
 
 static int ap_callin, ap_cpuid;
 
-asm (
-    "    .text                       \n"
-    "    .code16                     \n"
-    "ap_boot_start: .code16          \n"
-    "    mov   %cs,%ax               \n"
-    "    mov   %ax,%ds               \n"
-    "    lgdt  gdt_desr-ap_boot_start\n"
-    "    xor   %ax, %ax              \n"
-    "    inc   %ax                   \n"
-    "    lmsw  %ax                   \n"
-    "    ljmpl $0x08,$1f             \n"
-    "gdt_desr:                       \n"
-    "    .word gdt_end - gdt - 1     \n"
-    "    .long gdt                   \n"
-    "ap_boot_end: .code32            \n"
-    "1:  mov   $0x10,%eax            \n"
-    "    mov   %eax,%ds              \n"
-    "    mov   %eax,%es              \n"
-    "    mov   %eax,%ss              \n"
-    "    movl  $stack_top,%esp       \n"
-    "    movl  %esp,%ebp             \n"
-    "    call  ap_start              \n"
-    "1:  hlt                         \n"
-    "    jmp  1b                     \n"
-    "                                \n"
-    "    .align 8                    \n"
-    "gdt:                            \n"
-    "    .quad 0x0000000000000000    \n"
-    "    .quad 0x00cf9a000000ffff    \n" /* 0x08: Flat code segment */
-    "    .quad 0x00cf92000000ffff    \n" /* 0x10: Flat data segment */
-    "gdt_end:                        \n"
-    "                                \n"
-    "    .bss                        \n"
-    "    .align    8                 \n"
-    "stack:                          \n"
-    "    .skip    0x4000             \n"
-    "stack_top:                      \n"
-    "    .text                       \n"
-    );
-
-void ap_start(void); /* non-static avoids unused-function compiler warning */
-/*static*/ void ap_start(void)
+static void ap_start(void)
 {
     printf(" - CPU%d ... ", ap_cpuid);
     cacheattr_init();
     printf("done.\n");
+
+    if ( !ap_cpuid )
+        return;
+
     wmb();
     ap_callin = 1;
-}
 
-static void lapic_wait_ready(void)
-{
-    while ( lapic_read(APIC_ICR) & APIC_ICR_BUSY )
-        cpu_relax();
+    while ( 1 )
+        asm volatile ( "hlt" );
 }
 
 static void boot_cpu(unsigned int cpu)
 {
-    unsigned int icr2 = SET_APIC_DEST_FIELD(LAPIC_ID(cpu));
+    static uint8_t ap_stack[4 * PAGE_SIZE] __attribute__ ((aligned (16)));
+    static struct vcpu_hvm_context ap;
 
     /* Initialise shared variables. */
     ap_cpuid = cpu;
-    ap_callin = 0;
     wmb();
 
-    /* Wake up the secondary processor: INIT-SIPI-SIPI... */
-    lapic_wait_ready();
-    lapic_write(APIC_ICR2, icr2);
-    lapic_write(APIC_ICR, APIC_DM_INIT);
-    lapic_wait_ready();
-    lapic_write(APIC_ICR2, icr2);
-    lapic_write(APIC_ICR, APIC_DM_STARTUP | (AP_BOOT_EIP >> 12));
-    lapic_wait_ready();
-    lapic_write(APIC_ICR2, icr2);
-    lapic_write(APIC_ICR, APIC_DM_STARTUP | (AP_BOOT_EIP >> 12));
-    lapic_wait_ready();
+    /* Wake up the secondary processor */
+    ap = (struct vcpu_hvm_context) {
+        .mode = VCPU_HVM_MODE_32B,
+        .cpu_regs.x86_32 = {
+            .eip = (uint32_t)ap_start,
+            .esp = (uint32_t)ap_stack + ARRAY_SIZE(ap_stack),
+
+            /* Protected mode with MMU off */
+            .cr0 = X86_CR0_PE,
+
+            /* Prepopulate the GDT */
+            .cs_limit = -1U,
+            .ds_limit = -1U,
+            .ss_limit = -1U,
+            .es_limit = -1U,
+            .tr_limit = 0x67,
+            .cs_ar = 0xc9b,
+            .ds_ar = 0xc93,
+            .es_ar = 0xc93,
+            .ss_ar = 0xc93,
+            .tr_ar = 0x8b,
+        },
+    };
+
+    if ( hypercall_vcpu_op(VCPUOP_initialise, cpu, &ap) )
+        BUG();
+    if ( hypercall_vcpu_op(VCPUOP_up, cpu, NULL) )
+        BUG();
 
     /*
      * Wait for the secondary processor to complete initialisation.
@@ -113,17 +93,14 @@ static void boot_cpu(unsigned int cpu)
         cpu_relax();
 
     /* Take the secondary processor offline. */
-    lapic_write(APIC_ICR2, icr2);
-    lapic_write(APIC_ICR, APIC_DM_INIT);
-    lapic_wait_ready();    
+    if ( hypercall_vcpu_op(VCPUOP_down, cpu, NULL) )
+        BUG();
 }
 
 void smp_initialise(void)
 {
     unsigned int i, nr_cpus = hvm_info->nr_vcpus;
 
-    memcpy((void *)AP_BOOT_EIP, ap_boot_start, ap_boot_end - ap_boot_start);
-
     printf("Multiprocessor initialisation:\n");
     ap_start();
     for ( i = 1; i < nr_cpus; i++ )
-- 
2.34.1


