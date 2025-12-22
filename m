Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E2BCD6AE0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Dec 2025 17:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1192146.1511463 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXiue-00088V-7t; Mon, 22 Dec 2025 16:37:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1192146.1511463; Mon, 22 Dec 2025 16:37:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vXiue-00085j-4L; Mon, 22 Dec 2025 16:37:36 +0000
Received: by outflank-mailman (input) for mailman id 1192146;
 Mon, 22 Dec 2025 16:37:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ACBk=64=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vXiuc-00085X-Gg
 for xen-devel@lists.xenproject.org; Mon, 22 Dec 2025 16:37:34 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 839cd4df-df54-11f0-b15b-2bf370ae4941;
 Mon, 22 Dec 2025 17:37:32 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-64b9d01e473so4544646a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Dec 2025 08:37:32 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b9105655asm10977819a12.9.2025.12.22.08.37.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 08:37:31 -0800 (PST)
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
X-Inumbo-ID: 839cd4df-df54-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766421452; x=1767026252; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HCe2N/71vT19AvFHOzu9qbV/lmSQc59kxkuI015uss=;
        b=SX0X+mUIG8C81gRN1nrnt3ToF54BCCTqtlOUX8VcLjt97uK0nngTrOnxoZu0/boyHL
         0ptd6ORev+eCIeFO0R0RNYeldDogwcMNuTBDZrVJNXcKWC3vR0Zd5rVyKFm56bwV4znn
         fVdf9HvMrewogjVXLFn0VvffdgGE3p/jVlRbo+kVynIPTWQzNwKCj51g5qCho3aGnDS7
         tfRPUib/4e0WS9fsN2wemXDuWRd/FZTIhRlVH77nEXParIKK9zBvsmsczAULyaHPFFT9
         76S/OgCA5+lQlgW22GW/5rpuZoMvzkW4DR8cfJtpnf7w3oqhgxP2kpkVK3mKb2rqYEKW
         NMGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766421452; x=1767026252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/HCe2N/71vT19AvFHOzu9qbV/lmSQc59kxkuI015uss=;
        b=dSOC94kZ+tKdreiRGikE7H/oWl6ga3doUbNzo+g/End5uO5oBhbabGVZWnC/2CgqKh
         dVa4sjcU4fRevzuNCUiVau4U89b+lqzxQMAyuWuPqvJNS3Y+GyY4QTVa+FgJuPpDStGj
         DazIqsmwJvzy2bRrP4wtN3g5Z0DzrK4FHwW8TCkZF42Kuys/K7jKvV7hYK8HD1Fsmr7l
         jm3YZlSqKVbdWs163GxhxVIsHqfJmFA7R+Yi7H/Uvj8reTbRdG+CCfwDkqmUelzyGZYV
         0HD2XYn+CpYUgpb3U6uk8mgBUCCfO8K5qrbM6bcS9ml2UYXbt/+0/mB6bDztxWquwKHa
         khtg==
X-Gm-Message-State: AOJu0Yxh1d/m9+8aBrIEC90BtuJH6EWMg7AJSeaU0UF2ZtY0eH6iyA+V
	6/9Kq9GPAc1naIwmEFnHTs+M9j4CXufEvTQzG1In0nFWTl3h/BtX6HK1kdx3Wg==
X-Gm-Gg: AY/fxX4o+NC+QGB0wvyuQrEmHcSQ0j47yyeVzL4HnLHtzz8nyGL0cj/HpXgy8fCkX7U
	2NbrxXex1+5BxxfR2d9wbKoHuGWD58v9TpTGUHd7rZI1Qt6yMoVfqlCOH0rEQv8Eyb7dl8M55Vc
	YeJKqJICOhOoztY+13u5zSCcmHRtY6zd9fQ8SDnvNavziuXHKqOFB52CWnoTG6ge4guQK7tXE9p
	WJkR2Z60dPknZIOZIPte0W427Cui1OVSSdHlphoyiPdlPTT0qesEITK9PhjGT1Tkztq5mQKR9bn
	0h+Bc8k5LajwvqrTRW4Q0FGLGAKWY9ZLW3L6GiP0lhA/DH5PDGrGcFDDREk3d+e40nYLcamxCY9
	mpJnSzwyDCjaJXi5S2ELKa5719KhSYb9t49MV1UkDt4rJlQYTk9t231lVXw17T1HK9u9lIb9veD
	Og2tbt1Ut3LLDFaVdOO8i3CRoQOHDJNqEc5+mZTWN3SH6V+dUExN9dJJc=
X-Google-Smtp-Source: AGHT+IHxOjBBbC9qjZkEhy5tVsK3+XU0w9+7o+vioqLqz0q3SXmicwbaorTzm1Sl3J/danOUJafZ2Q==
X-Received: by 2002:a05:6402:1e92:b0:64d:589a:572b with SMTP id 4fb4d7f45d1cf-64d589a59f3mr4424897a12.17.1766421451785;
        Mon, 22 Dec 2025 08:37:31 -0800 (PST)
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
Subject: [PATCH v3 1/3] xen/riscv: introduce vSBI extension framework
Date: Mon, 22 Dec 2025 17:37:19 +0100
Message-ID: <61c84c3e296ab53f57d090c6ba3a533aa7049088.1766399205.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1766399205.git.oleksii.kurochko@gmail.com>
References: <cover.1766399205.git.oleksii.kurochko@gmail.com>
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

Note: All EIDs are printed in the format #%#lx and all FIDs in #%lu, as
the SBI spec uses these formats. Printing them this way makes it easier
to search for them in the SBI spec.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v3:
 - Declare ext inside for() in vsbi_find_extension().
 - Use gprintk() instead of printk().
 - Drop `vcpu` argument for vsbi_handle_ecall() and
   ->handlers() as current is always used.
 - Correct commit message: s/#%#lu/#%lu.
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
 xen/arch/riscv/include/asm/vsbi.h      | 31 ++++++++++++++
 xen/arch/riscv/riscv64/asm-offsets.c   |  1 +
 xen/arch/riscv/setup.c                 |  3 ++
 xen/arch/riscv/traps.c                 |  8 ++++
 xen/arch/riscv/vsbi/Makefile           |  1 +
 xen/arch/riscv/vsbi/core.c             | 57 ++++++++++++++++++++++++++
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
index 0000000000..fa0cad604e
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vsbi.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier:  GPL-2.0-only */
+
+#ifndef ASM_RISCV_VSBI_H
+#define ASM_RISCV_VSBI_H
+
+struct cpu_user_regs;
+
+struct vsbi_ext {
+    const char *name;
+    unsigned long eid_start;
+    unsigned long eid_end;
+    int (*handler)(unsigned long eid, unsigned long fid,
+                   struct cpu_user_regs *regs);
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
+void vsbi_handle_ecall(struct cpu_user_regs *regs);
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
index f061004d83..e9c9677863 100644
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
+        vsbi_handle_ecall(cpu_regs);
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
index 0000000000..f5ded8f676
--- /dev/null
+++ b/xen/arch/riscv/vsbi/core.c
@@ -0,0 +1,57 @@
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
+    for ( const struct vsbi_ext *ext = _svsbi_exts;
+          ext != _evsbi_exts;
+          ext++ )
+        if ( (eid >= ext->eid_start) && (eid <= ext->eid_end) )
+            return ext;
+
+    return NULL;
+}
+
+void vsbi_handle_ecall(struct cpu_user_regs *regs)
+{
+    const unsigned long eid = regs->a7;
+    const unsigned long fid = regs->a6;
+    const struct vsbi_ext *ext = vsbi_find_extension(eid);
+    int ret;
+
+    if ( ext )
+        ret = ext->handler(eid, fid, regs);
+    else
+    {
+        gprintk(XENLOG_ERR, "Unsupported Guest SBI EID #%#lx, FID #%lu\n",
+                eid, regs->a1);
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


