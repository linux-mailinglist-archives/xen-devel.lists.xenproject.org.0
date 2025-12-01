Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52738C96A21
	for <lists+xen-devel@lfdr.de>; Mon, 01 Dec 2025 11:25:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175650.1500272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ14x-0004HV-Tp; Mon, 01 Dec 2025 10:24:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175650.1500272; Mon, 01 Dec 2025 10:24:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vQ14x-0004FR-QM; Mon, 01 Dec 2025 10:24:23 +0000
Received: by outflank-mailman (input) for mailman id 1175650;
 Mon, 01 Dec 2025 10:24:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tSLg=6H=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vQ14w-00041l-8H
 for xen-devel@lists.xenproject.org; Mon, 01 Dec 2025 10:24:22 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5df3a98-ce9f-11f0-9d19-b5c5bf9af7f9;
 Mon, 01 Dec 2025 11:24:20 +0100 (CET)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-640aa1445c3so6082833a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Dec 2025 02:24:20 -0800 (PST)
Received: from fedora (user-109-243-71-38.play-internet.pl. [109.243.71.38])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-647510508e1sm12104724a12.27.2025.12.01.02.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Dec 2025 02:24:18 -0800 (PST)
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
X-Inumbo-ID: e5df3a98-ce9f-11f0-9d19-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764584659; x=1765189459; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kL4brVLXUEDyfmktWCJt4oVhAjrxxXr8mVfyNYUUh4g=;
        b=QyrNZBAbhL3d18StdX1x9+dFgrViHwJ41ovITKtg7LNT4mYOWdmWeBHIWKsa9WxTyI
         bJPuMCpLFhT2xBnnyFwLPDaWLwomKwB2XX9wGeVC2/EgPO0Y6SQlyxuOGRA2rYq2JabO
         CRNocLGx3Ddk4cfobOFK5xe9Je0lmzXxYiqDYoZRO0h6ONzmPBPmPkUM7kTJ1+kcERJh
         t+CeVvWyvygbLI3UvD1LV5YvQH5UwzC/EgmfW5FQZylK3rdqdMIIJkutycIPCbud+zIx
         XtWX9Fu8Ap89BPa8uJmiQ6QtAIBVUDdIVLX3EWOMn2aB0tjMbU3zp1lIstFjPtHFBwHN
         Jf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584659; x=1765189459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kL4brVLXUEDyfmktWCJt4oVhAjrxxXr8mVfyNYUUh4g=;
        b=T4KqQDAhwMwBsSMqbddh0BcF16zyLTS/4bX7JWwwqGccneVzy2VsBLlM5bkMrFsmvX
         KwmHdgYpU9Z0fu94c7+1pSf55y1SnYTzrEe6SoDSC7Wl2SE5AtusbnqDygDE+H1WDwIX
         O/IwOi+/Tg6Z/kbLSYvb/e0cZatMyfWKIwMs/gADpnbLfY2h4Lj2cuyQWPYmZIjTlFaO
         zz4Iii+MrWy//6WSpV3QcRj2sACRgb+ydzBxE46K4e8KhrChjOhCOcaYuGe/YU2doMOV
         9j7JQCUifEgws/EPCX0tDHON41ao4tsQuiLiNWQ3jId8xUMzUasobOgQkwB6EKm3W+sW
         Lj1A==
X-Gm-Message-State: AOJu0YzKuGaIU64JtcbampMKOZkE+qYIhrl0yXa0Dc0JUx0dMal/MVtf
	vnHjoFGTk6b3OWZOm2QNUuar/5xaPSJ1/VeKwsuhLeV/Uun+IROYhXrAuQjAOtkD
X-Gm-Gg: ASbGncszsRZOyGoTWQGp1xasgp5YIFm+N1ijxQ4YTbVgVwytCdzvlrcBgSrAaPAEip6
	JcVKcPeBviN1/e+C0LQQR72DPXUZo/otUJrdfEpYHGjiokVTJnLg/WIbDLjKU6YTiH4SK9p148a
	uTLP7szPNtttI31RHmdrfDmog43SGrhxY6bkYakxtlDnaG23mcJXWzi2kLKAk8YTno8ZXP5oTGE
	SqPPkvvhj7EtDhqzxTVByNFII9Z3c8xgfqDDb3GTmCSUejuM41Bif5nr0TQ9PkRKi0dc4fKWk6J
	7U7+oxXplsY6sRhr50BEvuP+jcm4FCyVp60vo/toNvddyUt4dOnJgoVaWxJkeE9x1HDbo5juUYn
	UgrqybTTJzTlDhcIbL8j9HnbruQIlsVHxig8L6tvj3V72iJK1CZcNO+rMgPPSHTaUCgf3sUK4kl
	kajXlI0hyWGRXv6RxdAf5YKZl4DmS5Zw2I0O9e4p8geQ/sTvTktGxr/Ps=
X-Google-Smtp-Source: AGHT+IFZryrOYkb6E/sYYZM1iPLmqTVJAElhSu2fpr7iBRoTe37+HPbTSir8+/dPNhmm4EjTHBrQVQ==
X-Received: by 2002:a05:6402:3494:b0:647:5c27:5440 with SMTP id 4fb4d7f45d1cf-6475c2754b6mr11197062a12.24.1764584659125;
        Mon, 01 Dec 2025 02:24:19 -0800 (PST)
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
Subject: [PATCH v1 1/3] xen/riscv: introduce vSBI extension framework
Date: Mon,  1 Dec 2025 11:24:08 +0100
Message-ID: <3b67330dc4c1aa053eb15261a559e7b4eac3f493.1764582112.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1764582112.git.oleksii.kurochko@gmail.com>
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit introduces support for handling virtual SBI extensions in Xen.

The changes include:
- Added new vsbi.c and vsbi.h files to implement virtual SBI extension
  handling.
- Modified traps.c to handle CAUSE_VIRTUAL_SUPERVISOR_ECALL by calling
  vsbi_handle_ecall() when the trap originates from VS-mode.
- Updated xen.lds.S to include a new .vsbi.exts section for virtual SBI
  extension data.
- Updated Makefile to include the new vsbi/ directory in the build.
- Add hstatus register to struct cpu_user_regs as it is needed for
  a check that CAUSE_VIRTUAL_SUPERVISOR_ECALL happens from VS-mode.

The implementation allows for registration and handling of SBI
extensions via a new vsbi_ext structure and ".vsbi.exts" section,
enabling extensible virtual SBI support for RISC-V guests.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/Makefile                |  1 +
 xen/arch/riscv/include/asm/processor.h |  1 +
 xen/arch/riscv/include/asm/vsbi.h      | 31 +++++++++++++++++
 xen/arch/riscv/traps.c                 |  8 +++++
 xen/arch/riscv/vsbi/Makefile           |  1 +
 xen/arch/riscv/vsbi/vsbi.c             | 46 ++++++++++++++++++++++++++
 xen/arch/riscv/xen.lds.S               |  7 ++++
 7 files changed, 95 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/vsbi.h
 create mode 100644 xen/arch/riscv/vsbi/Makefile
 create mode 100644 xen/arch/riscv/vsbi/vsbi.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index e2b8aa42c8..7bfe7024ef 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -17,6 +17,7 @@ obj-y += stubs.o
 obj-y += time.o
 obj-y += traps.o
 obj-y += vm_event.o
+obj-y += vsbi/
 
 $(TARGET): $(TARGET)-syms
 	$(OBJCOPY) -O binary -S $< $@
diff --git a/xen/arch/riscv/include/asm/processor.h b/xen/arch/riscv/include/asm/processor.h
index 39696fb58d..79d02c3dd2 100644
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
index 0000000000..984e7acf7b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/vsbi.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier:  GPL-2.0-only */
+
+#ifndef ASM_RISCV_VSBI_H
+#define ASM_RISCV_VSBI_H
+
+struct regs;
+struct vcpu;
+
+struct vsbi_ext {
+    const char *name;
+    unsigned long eid_start;
+    unsigned long eid_end;
+    int (*handle)(struct vcpu *vcpu, unsigned long eid,
+                  unsigned long fid, struct cpu_user_regs *regs);
+};
+
+#define VSBI_EXT_START(ext, extid_start, extid_end, extid_handle)   \
+static const struct vsbi_ext vsbi_ext_##ext __used                  \
+__section(".vsbi.exts") = {                                         \
+    .name = #ext,                                                   \
+    .eid_start = extid_start,                                       \
+    .eid_end = extid_end,                                           \
+    .handle = extid_handle,
+
+#define VSBI_EXT_END                                                \
+};
+
+void vsbi_handle_ecall(struct vcpu *vcpu, struct cpu_user_regs *regs);
+const struct vsbi_ext *vsbi_find_extension(unsigned long ext_id);
+
+#endif
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index f061004d83..dfe1a5a112 100644
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
+        if ( !(cpu_regs->hstatus & HSTATUS_SPV) )
+            panic("CAUSE_VIRTUAL_SUPERVISOR_ECALL came not from VS-mode\n");
+
+        vsbi_handle_ecall(current, cpu_regs);
+        break;
+
     case CAUSE_ILLEGAL_INSTRUCTION:
         if ( do_bug_frame(cpu_regs, pc) >= 0 )
         {
diff --git a/xen/arch/riscv/vsbi/Makefile b/xen/arch/riscv/vsbi/Makefile
new file mode 100644
index 0000000000..574c8ff78d
--- /dev/null
+++ b/xen/arch/riscv/vsbi/Makefile
@@ -0,0 +1 @@
+obj-y += vsbi.o
diff --git a/xen/arch/riscv/vsbi/vsbi.c b/xen/arch/riscv/vsbi/vsbi.c
new file mode 100644
index 0000000000..cd119ce0d6
--- /dev/null
+++ b/xen/arch/riscv/vsbi/vsbi.c
@@ -0,0 +1,46 @@
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
+const struct vsbi_ext *vsbi_find_extension(unsigned long ext_id)
+{
+    const struct vsbi_ext *vsbi_ext;
+
+    for ( vsbi_ext = _svsbi_exts; vsbi_ext != _evsbi_exts; vsbi_ext++ )
+        if ( ext_id >= vsbi_ext->eid_start &&
+             ext_id <= vsbi_ext->eid_end )
+            return vsbi_ext;
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
+    if ( ext && ext->handle )
+        ret = ext->handle(vcpu, eid, fid, regs);
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
index edcadff90b..2967f00ac5 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -91,6 +91,13 @@ SECTIONS
 
     DT_DEV_INFO                       /* Devicetree based device info */
 
+    . = ALIGN(POINTER_ALIGN);
+    DECL_SECTION(.vsbi.exts) {
+        _svsbi_exts = .;
+        *(.vsbi.exts)
+        _evsbi_exts = .;
+    } :text
+
     . = ALIGN(PAGE_SIZE);             /* Init code and data */
     __init_begin = .;
     .init.text : {
-- 
2.52.0


