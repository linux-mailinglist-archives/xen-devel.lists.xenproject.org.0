Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB349C5F2D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2024 18:37:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834865.1250665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAuoo-00067J-Q9; Tue, 12 Nov 2024 17:36:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834865.1250665; Tue, 12 Nov 2024 17:36:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAuoo-000652-MN; Tue, 12 Nov 2024 17:36:46 +0000
Received: by outflank-mailman (input) for mailman id 834865;
 Tue, 12 Nov 2024 17:36:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mdiu=SH=cloud.com=matthew.barnes@srs-se1.protection.inumbo.net>)
 id 1tAuon-00064w-ET
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2024 17:36:45 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac8109b6-a11c-11ef-a0c7-8be0dac302b0;
 Tue, 12 Nov 2024 18:36:39 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a628b68a7so1055396166b.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2024 09:36:40 -0800 (PST)
Received: from mbarnes-x-u.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9ee0deef3esm746325966b.141.2024.11.12.09.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Nov 2024 09:36:38 -0800 (PST)
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
X-Inumbo-ID: ac8109b6-a11c-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFjODEwOWI2LWExMWMtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDMyOTk5Ljg2NzQyNiwic2VuZGVyIjoibWF0dGhldy5iYXJuZXNAY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731432999; x=1732037799; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4dHtb4C0WC3jTkiClRLTbwiGLDfIKgOfntISQe9iTE8=;
        b=S+Q8GX+7T4fIQLdJVVDqG5VN3mfU/aITZTiczya1/JU96j3D+qZ7STSaY/eu2pLPc0
         2Nn+gox0uOjq49DtP+s+OXquEEd73zd5zOTszBfVG5l96mw7I1CAafoL8dl0s7IZgTuy
         FgzKg2bUocGzLUb3WHHxzMgFzUnM5aNA2QWxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731432999; x=1732037799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4dHtb4C0WC3jTkiClRLTbwiGLDfIKgOfntISQe9iTE8=;
        b=VincPFrJjjYfl4EaTCO6gpdExgtv2+Zh3lmRZ5oo1KB4ZsVggMaj5eEDq9QxOdAv8z
         5IcT7c7JAa+4Oy2k39ZFKWGBX1dWBqAuwbIV0niucqqetqJ0V4eo2ufiQoUfNw9tSg5P
         Q4pLIk9os8CqgnHZdIVEVfDMrrssvvrJKcZXNPHVaajrAZZWpFAqaCsT9JL+ywlREjgG
         m+DXukNaLf42pDBmGYu4yPOuRGQzCuDilNsHfCOAP7uHZgTyl2gJBJpGuVrwPQQva/O/
         zUsRBi80VSUJVtQiN958JYS6ShDVL7TAczRj7I6Bv8IB3D1XGUb1dC/cCtDdSsi6alcg
         5iMw==
X-Gm-Message-State: AOJu0YxXAxUSk2hMh66XQ3Gv+9xppy4hotNuexT+1UJizxXV2wx4dW8S
	tjcR5Vf2qyN0q5C+o+0P9NMli9F6sJVjP3ft0hoM2ILr9BvLNFIV+hRcpXMCtnqVKVkee5fd0E/
	4
X-Google-Smtp-Source: AGHT+IF0UOvRLGygklKcZJ+srfbdfCdYMlXr8+i6cu93V0/IYVMXEHgrVOpu64PJntugmVoOZKs7rg==
X-Received: by 2002:a17:906:6a20:b0:a99:61d1:348f with SMTP id a640c23a62f3a-a9ef0016c58mr1634215166b.52.1731432999128;
        Tue, 12 Nov 2024 09:36:39 -0800 (PST)
From: Matthew Barnes <matthew.barnes@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Matthew Barnes <matthew.barnes@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XTF PATCH] Misaligned I/O Breakpoints
Date: Tue, 12 Nov 2024 17:22:46 +0000
Message-Id: <bb3e94bf31387725fdc0dca6ab2154c2d24d2bc0.1731427668.git.matthew.barnes@cloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This xtf test tests a bug to hardware IO port breakpoints fixed by
08aacc392d86 ("x86/emul: Fix misaligned IO breakpoint behaviour in PV guests")

Signed-off-by: Matthew Barnes <matthew.barnes@cloud.com>
---
 docs/all-tests.dox                       |   2 +
 tests/misaligned-io-breakpoints/Makefile |   9 +
 tests/misaligned-io-breakpoints/main.c   | 283 +++++++++++++++++++++++
 3 files changed, 294 insertions(+)
 create mode 100644 tests/misaligned-io-breakpoints/Makefile
 create mode 100644 tests/misaligned-io-breakpoints/main.c

diff --git a/docs/all-tests.dox b/docs/all-tests.dox
index 0a8b9130cfe8..66e35babe4d7 100644
--- a/docs/all-tests.dox
+++ b/docs/all-tests.dox
@@ -41,6 +41,8 @@ Coveres XSA-106 and XSA-156.
 
 @subpage test-umip - Guest User-Mode Instruction Prevention support.
 
+@subpage test-misaligned-io-breakpoints - Misaligned I/O port hardware breakpoint test.
+
 
 @section index-xsa XSA Proof-of-Concept tests
 
diff --git a/tests/misaligned-io-breakpoints/Makefile b/tests/misaligned-io-breakpoints/Makefile
new file mode 100644
index 000000000000..9e4cd3eef761
--- /dev/null
+++ b/tests/misaligned-io-breakpoints/Makefile
@@ -0,0 +1,9 @@
+include $(ROOT)/build/common.mk
+
+NAME      := misaligned-io-breakpoints
+CATEGORY  := utility
+TEST-ENVS := pv64
+
+obj-perenv += main.o
+
+include $(ROOT)/build/gen.mk
diff --git a/tests/misaligned-io-breakpoints/main.c b/tests/misaligned-io-breakpoints/main.c
new file mode 100644
index 000000000000..d91222b29288
--- /dev/null
+++ b/tests/misaligned-io-breakpoints/main.c
@@ -0,0 +1,283 @@
+/**
+ * @file tests/misaligned-io-breakpoints/main.c
+ * @ref test-misaligned-io-breakpoints - Misaligned I/O port hardware breakpoint test.
+ *
+ * @page test-misaligned-io-breakpoints Misaligned I/O Breakpoints
+ *
+ * When hardware breakpoints are configured on misaligned IO ports, the
+ * hardware will mask the addresses based on the breakpoint width during
+ * comparison.
+ *
+ * This test checks that the emulated behaviour of misaligned IO breakpoints
+ * in PV guests match that of real hardware.
+ *
+ * @see tests/io-breakpoint-bug/main.c
+ */
+#include <xtf.h>
+
+enum width { _16, _32 };
+
+const char test_title[] = "Misaligned I/O Breakpoints";
+
+static const struct test {
+    unsigned long breakpoint_port;
+    enum width breakpoint_size;
+    uint16_t io_op_port;
+    enum width io_op_len;
+    bool expect_breakpoint_trigger;
+} tests[] = {
+    /* 16-bit breakpoint, 16-bit I/O operation */
+    { 0x09, _16, 0x06, _16, false },
+    { 0x09, _16, 0x07, _16, true  },
+    { 0x09, _16, 0x08, _16, true  },
+    { 0x09, _16, 0x09, _16, true  },
+    { 0x09, _16, 0x0a, _16, false },
+
+    { 0x0b, _16, 0x08, _16, false },
+    { 0x0b, _16, 0x09, _16, true  },
+    { 0x0b, _16, 0x0a, _16, true  },
+    { 0x0b, _16, 0x0b, _16, true  },
+    { 0x0b, _16, 0x0c, _16, false },
+
+    /* 16-bit breakpoint, 32-bit I/O operation */
+    { 0x09, _16, 0x04, _32, false },
+    { 0x09, _16, 0x05, _32, true  },
+    { 0x09, _16, 0x06, _32, true  },
+    { 0x09, _16, 0x07, _32, true  },
+    { 0x09, _16, 0x08, _32, true  },
+    { 0x09, _16, 0x09, _32, true  },
+    { 0x09, _16, 0x0a, _32, false },
+
+    { 0x0b, _16, 0x06, _32, false },
+    { 0x0b, _16, 0x07, _32, true  },
+    { 0x0b, _16, 0x08, _32, true  },
+    { 0x0b, _16, 0x09, _32, true  },
+    { 0x0b, _16, 0x0a, _32, true  },
+    { 0x0b, _16, 0x0b, _32, true  },
+    { 0x0b, _16, 0x0c, _32, false },
+
+    /* 32-bit breakpoint, 16-bit I/O operation */
+    { 0x09, _32, 0x06, _16, false },
+    { 0x09, _32, 0x07, _16, true  },
+    { 0x09, _32, 0x08, _16, true  },
+    { 0x09, _32, 0x09, _16, true  },
+    { 0x09, _32, 0x0a, _16, true  },
+    { 0x09, _32, 0x0b, _16, true  },
+    { 0x09, _32, 0x0c, _16, false },
+
+    { 0x0a, _32, 0x06, _16, false },
+    { 0x0a, _32, 0x07, _16, true  },
+    { 0x0a, _32, 0x08, _16, true  },
+    { 0x0a, _32, 0x09, _16, true  },
+    { 0x0a, _32, 0x0a, _16, true  },
+    { 0x0a, _32, 0x0b, _16, true  },
+    { 0x0a, _32, 0x0c, _16, false },
+
+    { 0x0b, _32, 0x06, _16, false },
+    { 0x0b, _32, 0x07, _16, true  },
+    { 0x0b, _32, 0x08, _16, true  },
+    { 0x0b, _32, 0x09, _16, true  },
+    { 0x0b, _32, 0x0a, _16, true  },
+    { 0x0b, _32, 0x0b, _16, true  },
+    { 0x0b, _32, 0x0c, _16, false },
+
+    { 0x0d, _32, 0x0a, _16, false },
+    { 0x0d, _32, 0x0b, _16, true  },
+    { 0x0d, _32, 0x0c, _16, true  },
+    { 0x0d, _32, 0x0d, _16, true  },
+    { 0x0d, _32, 0x0e, _16, true  },
+    { 0x0d, _32, 0x0f, _16, true  },
+    { 0x0d, _32, 0x10, _16, false },
+
+    { 0x0e, _32, 0x0a, _16, false },
+    { 0x0e, _32, 0x0b, _16, true  },
+    { 0x0e, _32, 0x0c, _16, true  },
+    { 0x0e, _32, 0x0d, _16, true  },
+    { 0x0e, _32, 0x0e, _16, true  },
+    { 0x0e, _32, 0x0f, _16, true  },
+    { 0x0e, _32, 0x10, _16, false },
+
+    { 0x0f, _32, 0x0a, _16, false },
+    { 0x0f, _32, 0x0b, _16, true  },
+    { 0x0f, _32, 0x0c, _16, true  },
+    { 0x0f, _32, 0x0d, _16, true  },
+    { 0x0f, _32, 0x0e, _16, true  },
+    { 0x0f, _32, 0x0f, _16, true  },
+    { 0x0f, _32, 0x10, _16, false },
+
+    /* 32-bit breakpoint, 32-bit I/O operation */
+    { 0x09, _32, 0x04, _32, false },
+    { 0x09, _32, 0x05, _32, true  },
+    { 0x09, _32, 0x06, _32, true  },
+    { 0x09, _32, 0x07, _32, true  },
+    { 0x09, _32, 0x08, _32, true  },
+    { 0x09, _32, 0x09, _32, true  },
+    { 0x09, _32, 0x0a, _32, true  },
+    { 0x09, _32, 0x0b, _32, true  },
+    { 0x09, _32, 0x0c, _32, false },
+
+    { 0x0a, _32, 0x04, _32, false },
+    { 0x0a, _32, 0x05, _32, true  },
+    { 0x0a, _32, 0x06, _32, true  },
+    { 0x0a, _32, 0x07, _32, true  },
+    { 0x0a, _32, 0x08, _32, true  },
+    { 0x0a, _32, 0x09, _32, true  },
+    { 0x0a, _32, 0x0a, _32, true  },
+    { 0x0a, _32, 0x0b, _32, true  },
+    { 0x0a, _32, 0x0c, _32, false },
+
+    { 0x0b, _32, 0x04, _32, false },
+    { 0x0b, _32, 0x05, _32, true  },
+    { 0x0b, _32, 0x06, _32, true  },
+    { 0x0b, _32, 0x07, _32, true  },
+    { 0x0b, _32, 0x08, _32, true  },
+    { 0x0b, _32, 0x09, _32, true  },
+    { 0x0b, _32, 0x0a, _32, true  },
+    { 0x0b, _32, 0x0b, _32, true  },
+    { 0x0b, _32, 0x0c, _32, false },
+
+    { 0x0d, _32, 0x08, _32, false },
+    { 0x0d, _32, 0x09, _32, true  },
+    { 0x0d, _32, 0x0a, _32, true  },
+    { 0x0d, _32, 0x0b, _32, true  },
+    { 0x0d, _32, 0x0c, _32, true  },
+    { 0x0d, _32, 0x0d, _32, true  },
+    { 0x0d, _32, 0x0e, _32, true  },
+    { 0x0d, _32, 0x0f, _32, true  },
+    { 0x0d, _32, 0x10, _32, false },
+
+    { 0x0e, _32, 0x08, _32, false },
+    { 0x0e, _32, 0x09, _32, true  },
+    { 0x0e, _32, 0x0a, _32, true  },
+    { 0x0e, _32, 0x0b, _32, true  },
+    { 0x0e, _32, 0x0c, _32, true  },
+    { 0x0e, _32, 0x0d, _32, true  },
+    { 0x0e, _32, 0x0e, _32, true  },
+    { 0x0e, _32, 0x0f, _32, true  },
+    { 0x0e, _32, 0x10, _32, false },
+
+    { 0x0f, _32, 0x08, _32, false },
+    { 0x0f, _32, 0x09, _32, true  },
+    { 0x0f, _32, 0x0a, _32, true  },
+    { 0x0f, _32, 0x0b, _32, true  },
+    { 0x0f, _32, 0x0c, _32, true  },
+    { 0x0f, _32, 0x0d, _32, true  },
+    { 0x0f, _32, 0x0e, _32, true  },
+    { 0x0f, _32, 0x0f, _32, true  },
+    { 0x0f, _32, 0x10, _32, false },
+};
+
+static void enable_debug_extensions(void)
+{
+    unsigned long cr4 = read_cr4();
+
+    if ( !(cr4 & X86_CR4_DE) )
+        write_cr4(cr4 | X86_CR4_DE);
+}
+
+static void init_breakpoint(enum width width)
+{
+    unsigned long io0, dr7;
+
+    switch (width)
+    {
+    case _16:
+        io0 = DR7_SYM(0, G, IO, 16) | X86_DR7_GE | X86_DR7_DEFAULT;
+        break;
+    case _32:
+        io0 = DR7_SYM(0, G, IO, 32) | X86_DR7_GE | X86_DR7_DEFAULT;
+        break;
+    default:
+        xtf_failure("  Fail: Unknown width %d\n", width);
+        return;
+    }
+
+    write_dr7(io0);
+
+    if ( (dr7 = read_dr7()) != io0 )
+        xtf_failure("  Fail: dr7 %#lx != io0 %#lx\n", dr7, io0);
+}
+
+static void set_breakpoint(unsigned long io_port)
+{
+    unsigned long dr0;
+
+    write_dr0(io_port);
+
+    if ( (dr0 = read_dr0()) != io_port )
+        xtf_failure("  Fail: dr0 %#lx != %#lx\n", dr0, io_port);
+}
+
+/* Set vCPU IOPL to 1 to allow IO calls in kernel space */
+static void set_iopl(void)
+{
+    unsigned int iopl = 1;
+
+    hypercall_physdev_op(PHYSDEVOP_set_iopl, &iopl);
+}
+
+static exinfo_t io_op(uint16_t io_port, enum width io_op_len)
+{
+    exinfo_t fault = 0;
+
+    switch (io_op_len)
+    {
+    case _16:
+        asm volatile ("outw %w0, %w1; 1:"
+                      _ASM_EXTABLE_HANDLER(1b, 1b, %P[rec])
+                      : "+a" (fault)
+                      : "Nd" (io_port),
+                        [rec] "p" (ex_record_fault_eax));
+        break;
+    case _32:
+        asm volatile ("outl %k0, %w1; 1:"
+                      _ASM_EXTABLE_HANDLER(1b, 1b, %P[rec])
+                      : "+a" (fault)
+                      : "Nd" (io_port),
+                        [rec] "p" (ex_record_fault_eax));
+        break;
+    default:
+        xtf_failure("  Fail: Unknown width %d\n", io_op_len);
+        break;
+    }
+
+    return fault;
+}
+
+void test_main(void)
+{
+    unsigned int i;
+
+    enable_debug_extensions();
+    set_iopl();
+
+    for ( i = 0; i < ARRAY_SIZE(tests); ++i )
+    {
+        const struct test *t = &tests[i];
+
+        /* arrange */
+        init_breakpoint(t->breakpoint_size);
+        set_breakpoint(t->breakpoint_port);
+
+        /* act */
+        exinfo_t ex = io_op(t->io_op_port, t->io_op_len);
+
+        /* assert */
+        if ( t->expect_breakpoint_trigger && ex != EXINFO_SYM(DB, 0) )
+            xtf_failure("Fail: Expected trigger with breakpoint port 0x%02lx and io port 0x%02x, but got no trigger.\n", t->breakpoint_port, t->io_op_port);
+        if ( !t->expect_breakpoint_trigger && ex == EXINFO_SYM(DB, 0) )
+            xtf_failure("Fail: Expected no trigger with breakpoint port 0x%02lx and io port 0x%02x, but got trigger.\n", t->breakpoint_port, t->io_op_port);
+    }
+
+    xtf_success(NULL);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.34.1


