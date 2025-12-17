Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DB1CC8E3B
	for <lists+xen-devel@lfdr.de>; Wed, 17 Dec 2025 17:54:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1188963.1509963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVunJ-0003Ej-R3; Wed, 17 Dec 2025 16:54:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1188963.1509963; Wed, 17 Dec 2025 16:54:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVunJ-0003D9-OG; Wed, 17 Dec 2025 16:54:33 +0000
Received: by outflank-mailman (input) for mailman id 1188963;
 Wed, 17 Dec 2025 16:54:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ddEZ=6X=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vVunI-0003An-FR
 for xen-devel@lists.xenproject.org; Wed, 17 Dec 2025 16:54:32 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ddc1f4d-db69-11f0-9cce-f158ae23cfc8;
 Wed, 17 Dec 2025 17:54:30 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b79af62d36bso146021766b.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Dec 2025 08:54:30 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7cfa5d1e89sm2015077966b.69.2025.12.17.08.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Dec 2025 08:54:28 -0800 (PST)
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
X-Inumbo-ID: 0ddc1f4d-db69-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765990469; x=1766595269; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kQk7ZnANczFPXo4k/D8bh9dPiQ3Gd6pMKZAsRVMfKwc=;
        b=KWi0IFtrRUFVtG6KjKkjy9sWzjALC6noIilmwWAMMB7G4WrGJtp5I8lV9acjB7PrA5
         HiAew+JI12s5CO8TbDyPQe7+bREz9FnrIil8qQrR0M+t0t+zK9Y7MK070HIUPu6uRCb1
         RtBSrLcdqphbM+2I96+gYY0T/REEFDxCeKJdgNi+sKccVMMYjTZrpJAqvW6eskExYsvi
         e75+gtJjhU9drmSGsrsmifGI36Ga/tJJZg57E8g55hvk6ZKBw6i8QDVufH48JgjyD16q
         Df2qzZiza2zNL/P044v5hdy+k0bnESvC7N9oyc1+w+U19oYlqJBTytldpKZsc/+gJzkp
         XdCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765990469; x=1766595269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kQk7ZnANczFPXo4k/D8bh9dPiQ3Gd6pMKZAsRVMfKwc=;
        b=IBcjbpm8Snj01oQwbbhiRTjqCUoJSmO/5YSXM6leipuYxFQsraDdn/q8yn1ni5CaDq
         BDT1oEZaBfxyAGSVIF+fD0MkQQqrqQcv4knadiDNjqTqX7kfPYc48honRi1vMmobwjlf
         68NQCQ6m3deYFxxAKLY4D6i0dYyVdhXbyzWKjfj2yQAeFV+Y8DFSvh+qrJKMPkh8ycZN
         fad9AQ3Bj1EkwitQcWcCCPLRkXtJYigjndDRNda7u1x/cNNd13/RJBUMXnUzzhrnrBfO
         Amm+V9S0MoGUgoyB66EpHNwtMAPy29JGLsnsd2DjQoxpOCo5aP3aKTtMHNPxlhFmaDsq
         Gqww==
X-Gm-Message-State: AOJu0Yxpp2sYIBT9up63zBfOlq9VzSQOZv8DejF2f7abMkSeYOabGmmz
	o0KIczPiM2ftn9R9mVL46djpWWbvKJhE5AmhRJN6HolKoshSosjJb1OrGz1zcg==
X-Gm-Gg: AY/fxX60BguPoJNBnkwCmZ8PkibBqzPvxvRyLQ/cfsxQDukLDQttBCrDHym15uLcXRT
	L05M6myNfl/tZFdy/G584d2nVcTX3JK7ftr+ghjanVV3pGrnawh7DX3fSv4fsGVdDawqk0q78ig
	9RCOXyxSS+GjKX3AYcSUraCiFreovCBx+HA+8sOWgg7FpvqJU1qOviOm0GY8nUpO0JysieusF0p
	ABsgOnS/Y/9pbOiABMawdIEmX9Tmgh+tjS+pKROyajUAImppjwZTAlPHLRj6cMucaCAdzebPc7J
	3CuyeAlcpwwjDd/D2iTygtGrMQNnd3Y9jOyHdNDMxxDQ/us8aEO4cbFHFfsgsEZYUVeB9sZIIee
	/85Tu/kUOZf7KE2u3omnGBrGmXdaL79Lt4Ja7W7JCysI0qF9TIy3MN8K6OtR4dJyDKqhUA53T+G
	MWT8jnr/07vQ477i8rgAVY9W75bzfxsMnE9koNf6OuBl5V5guRGET6Mw4=
X-Google-Smtp-Source: AGHT+IHqilvwj5t8yrsGPSAYmL11A43Cp28OZZNp5iLgT32cQWncDyFE/6JLXBfxQEHwTLlQVsgdAw==
X-Received: by 2002:a17:907:2d8d:b0:b76:23b0:7d89 with SMTP id a640c23a62f3a-b7d236265abmr1903765666b.14.1765990468825;
        Wed, 17 Dec 2025 08:54:28 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 1/3] xen/riscv: introduce vSBI extension framework
Date: Wed, 17 Dec 2025 17:54:18 +0100
Message-ID: <dc1045d1831908678a1e4a79571adab2ab362ef6.1765888425.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1765888425.git.oleksii.kurochko@gmail.com>
References: <cover.1765888425.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit introduces support for handling virtual SBI extensions in Xen.

The changes include:
- Added new vsbi/core.c and vsbi.h files to implement virtual SBI extension
  handling.
- Modified traps.c to handle CAUSE_VIRTUAL_SUPERVISOR_ECALL by calling
  vsbi_handle_ecall() when the trap originates from VS-mode.
- Updated xen.lds.S to include a new .vsbi.exts section for virtual SBI
  extension data.
- Updated Makefile to include the new vsbi/ directory in the build.
- Add hstatus register to struct cpu_user_regs as it is needed for
  a check that CAUSE_VIRTUAL_SUPERVISOR_ECALL happens from VS-mode.
  Also, add storing/restoring of hstatus register in handle_trap().
- Introduce vsbi_find_extension() to check if vsbi extension is supported
  by Xen. For now it is called only inside vsbi/core.c, but in future
  it is going to be called from other files.
- Introduce check_vsbi_ext_ranges() to check if there EIDs ranges
  overlapping between extensions.

The implementation allows for registration and handling of SBI
extensions via a new vsbi_ext structure and ".vsbi.exts" section,
enabling extensible virtual SBI support for RISC-V guests.

Note: All EIDs are printed in the format #%#lx and all FIDs in #%#lu, as
the SBI spec uses these formats. Printing them this way makes it easier to
search for them in the SBI spec.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - s/struct regs/struct cpu_user_regs.
 - s/handle/handler.
 - Drop extid_ prefix inside VSBI_EXT_START().
 - use BUG_ON() instead of panic to be sure that 
   CAUSE_VIRTUAL_SUPERVISOR_ECALL comes from VS-mode.
 - s/ext_id/eid for vsbi_find_extension().
 - Add the comment above VSBI_EXT_START about [start,end] range.
 - Drop check "&& ext->handler" in vsbi_handle_ecall() as it isn't
   be so that handler() isn't provided.
 - s/vsbi.c/core.c
 - s/vsbi_ext/ext for local variable inside vsbi_find_extension().
 - Update the commit message: add a note about FID and EID printing formats,
   add some information about vsbo_find_extension() function, and add info
   about check_vsbi_ext_ranges().
 - Introduce check_vsbi_ext_ranges() to be sure that there is no overlapping
   in EIDs range(s).
 - Add storing/restoring of hstatus register in handle_trap()[entry.S].
---
 xen/arch/riscv/Makefile                |  1 +
 xen/arch/riscv/entry.S                 |  6 +++
 xen/arch/riscv/include/asm/processor.h |  1 +
 xen/arch/riscv/include/asm/vsbi.h      | 32 +++++++++++++++
 xen/arch/riscv/riscv64/asm-offsets.c   |  1 +
 xen/arch/riscv/setup.c                 |  3 ++
 xen/arch/riscv/traps.c                 |  8 ++++
 xen/arch/riscv/vsbi/Makefile           |  1 +
 xen/arch/riscv/vsbi/core.c             | 56 ++++++++++++++++++++++++++
 xen/arch/riscv/xen.lds.S               |  7 ++++
 10 files changed, 116 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/vsbi.h
 create mode 100644 xen/arch/riscv/vsbi/Makefile
 create mode 100644 xen/arch/riscv/vsbi/core.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 9dde693db4..87c1148b00 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -20,6 +20,7 @@ obj-y += time.o
 obj-y += traps.o
 obj-y += vmid.o
 obj-y += vm_event.o
+obj-y += vsbi/
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
diff --git a/xen/arch/riscv/entry.S b/xen/arch/riscv/entry.S
index 4db818ba8d..202a35fb03 100644
--- a/xen/arch/riscv/entry.S
+++ b/xen/arch/riscv/entry.S
@@ -48,11 +48,17 @@ save_to_stack:
         csrr    t0, CSR_SSTATUS
         REG_S   t0, CPU_USER_REGS_SSTATUS(sp)
 
+        csrr    t0, CSR_HSTATUS
+        REG_S   t0, CPU_USER_REGS_HSTATUS(sp)
+
         mv      a0, sp
         call    do_trap
 
 restore_registers:
         /* Restore stack_cpu_regs */
+        REG_L	t0, CPU_USER_REGS_HSTATUS(sp)
+        csrw	CSR_HSTATUS, t0
+
         REG_L   t0, CPU_USER_REGS_SEPC(sp)
         csrw    CSR_SEPC, t0
         REG_L   t0, CPU_USER_REGS_SSTATUS(sp)
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 2502045642..6b89df4a2d 100644
--- a/xen/arch/riscv/include/asm/processor.h
+++ b/xen/arch/riscv/include/asm/processor.h
@@ -49,6 +49,7 @@ struct cpu_user_regs
     unsigned long t6;
     unsigned long sepc;
     unsigned long sstatus;
+    unsigned long hstatus;
     /* pointer to previous stack_cpu_regs */
     unsigned long pregs;
 };
diff --git a/xen/arch/riscv/include/asm/vsbi.h b/xen/arch/riscv/include/asm/vsbi.h
new file mode 100644
index 0000000000..47a38dce02
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vsbi.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier:  GPL-2.0-only */
+
+#ifndef ASM_RISCV_VSBI_H
+#define ASM_RISCV_VSBI_H
+
+struct cpu_user_regs;
+struct vcpu;
+
+struct vsbi_ext {
+    const char *name;
+    unsigned long eid_start;
+    unsigned long eid_end;
+    int (*handler)(struct vcpu *vcpu, unsigned long eid,
+                   unsigned long fid, struct cpu_user_regs *regs);
+};
+
+/* Ranges (start and end) are inclusive within an extension */
+#define VSBI_EXT(ext, start, end, handle)           \
+static const struct vsbi_ext vsbi_ext_##ext __used  \
+__section(".vsbi.exts") = {                         \
+    .name = #ext,                                   \
+    .eid_start = start,                             \
+    .eid_end = end,                                 \
+    .handler = handle,                              \
+};
+
+void vsbi_handle_ecall(struct vcpu *vcpu, struct cpu_user_regs *regs);
+const struct vsbi_ext *vsbi_find_extension(unsigned long eid);
+
+void check_vsbi_ext_ranges(void);
+
+#endif
diff --git a/xen/arch/riscv/riscv64/asm-offsets.c b/xen/arch/riscv/riscv64/asm-offsets.c
index 3b5daf3b36..472cced4f8 100644
--- a/xen/arch/riscv/riscv64/asm-offsets.c
+++ b/xen/arch/riscv/riscv64/asm-offsets.c
@@ -49,6 +49,7 @@ void asm_offsets(void)
     OFFSET(CPU_USER_REGS_T6, struct cpu_user_regs, t6);
     OFFSET(CPU_USER_REGS_SEPC, struct cpu_user_regs, sepc);
     OFFSET(CPU_USER_REGS_SSTATUS, struct cpu_user_regs, sstatus);
+    OFFSET(CPU_USER_REGS_HSTATUS, struct cpu_user_regs, hstatus);
     OFFSET(CPU_USER_REGS_PREGS, struct cpu_user_regs, pregs);
     BLANK();
     DEFINE(PCPU_INFO_SIZE, sizeof(struct pcpu_info));
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 8f46f1a1de..9b4835960d 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -26,6 +26,7 @@
 #include <asm/sbi.h>
 #include <asm/setup.h>
 #include <asm/traps.h>
+#include <asm/vsbi.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
@@ -110,6 +111,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     end_boot_allocator();
 
+    check_vsbi_ext_ranges();
+
     /*
      * The memory subsystem has been initialized, we can now switch from
      * early_boot -> boot.
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index f061004d83..5c3d1988d7 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -15,6 +15,7 @@
 #include <asm/processor.h>
 #include <asm/riscv_encoding.h>
 #include <asm/traps.h>
+#include <asm/vsbi.h>
 
 /*
  * Initialize the trap handling.
@@ -114,6 +115,13 @@ void do_trap(struct cpu_user_regs *cpu_regs)
 
     switch ( cause )
     {
+    case CAUSE_VIRTUAL_SUPERVISOR_ECALL:
+        /* CAUSE_VIRTUAL_SUPERVISOR_ECALL should come from VS-mode */
+        BUG_ON(!(cpu_regs->hstatus & HSTATUS_SPV));
+
+        vsbi_handle_ecall(current, cpu_regs);
+        break;
+
     case CAUSE_ILLEGAL_INSTRUCTION:
         if ( do_bug_frame(cpu_regs, pc) >= 0 )
         {
diff --git a/xen/arch/riscv/vsbi/Makefile b/xen/arch/riscv/vsbi/Makefile
new file mode 100644
index 0000000000..820eb10ac2
--- /dev/null
+++ b/xen/arch/riscv/vsbi/Makefile
@@ -0,0 +1 @@
+obj-y += core.o
diff --git a/xen/arch/riscv/vsbi/core.c b/xen/arch/riscv/vsbi/core.c
new file mode 100644
index 0000000000..5ac4fee379
--- /dev/null
+++ b/xen/arch/riscv/vsbi/core.c
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/sched.h>
+
+#include <asm/processor.h>
+#include <asm/sbi.h>
+#include <asm/vsbi.h>
+
+extern const struct vsbi_ext _svsbi_exts[], _evsbi_exts[];
+
+void __init check_vsbi_ext_ranges(void)
+{
+    for ( const struct vsbi_ext *a = _svsbi_exts; a != _evsbi_exts; a++ )
+        for ( const struct vsbi_ext *b = a + 1; b != _evsbi_exts; b++ )
+            if ( !(a->eid_end < b->eid_start || b->eid_end < a->eid_start) )
+                panic("EID range overlap detected: "
+                      "%s:[#%#lx..#%#lx] vs %s:[#%#lx..#%#lx]\n",
+                      a->name, a->eid_start, a->eid_end,
+                      b->name, b->eid_start, b->eid_end);
+}
+
+const struct vsbi_ext *vsbi_find_extension(unsigned long eid)
+{
+    const struct vsbi_ext *ext;
+
+    for ( ext = _svsbi_exts; ext != _evsbi_exts; ext++ )
+        if ( (eid >= ext->eid_start) && (eid <= ext->eid_end) )
+            return ext;
+
+    return NULL;
+}
+
+void vsbi_handle_ecall(struct vcpu *vcpu, struct cpu_user_regs *regs)
+{
+    const unsigned long eid = regs->a7;
+    const unsigned long fid = regs->a6;
+    const struct vsbi_ext *ext = vsbi_find_extension(eid);
+    int ret;
+
+    if ( ext )
+        ret = ext->handler(vcpu, eid, fid, regs);
+    else
+    {
+        printk("Unsupported Guest SBI EID #%#lx, FID #%lu\n", eid, regs->a1);
+        ret = SBI_ERR_NOT_SUPPORTED;
+    }
+
+    /*
+     * The ecall instruction is not part of the RISC-V C extension (compressed
+     * instructions), so it is always 4 bytes long. Therefore, it is safe to
+     * use a fixed length of 4 bytes instead of reading guest memory to
+     * determine the instruction length.
+     */
+    regs->sepc += 4;
+    regs->a0 = ret;
+}
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 45d2e053d0..331a7d63d3 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -61,6 +61,13 @@ SECTIONS
         __note_gnu_build_id_end = .;
     } :note :text
     #endif
+
+    . = ALIGN(POINTER_ALIGN);
+    DECL_SECTION(.vsbi.exts) {
+        _svsbi_exts = .;
+        *(.vsbi.exts)
+        _evsbi_exts = .;
+    } :text
     _erodata = .;                /* End of read-only data */
 
     . = ALIGN(PAGE_SIZE);
-- 
2.52.0


