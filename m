Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9584945EEAA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232817.403901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawl-0008WI-JV; Fri, 26 Nov 2021 13:07:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232817.403901; Fri, 26 Nov 2021 13:07:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawk-0008Hy-QQ; Fri, 26 Nov 2021 13:07:22 +0000
Received: by outflank-mailman (input) for mailman id 232817;
 Fri, 26 Nov 2021 13:07:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavP-0002zD-Li
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:59 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 98288177-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:05:58 +0100 (CET)
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
X-Inumbo-ID: 98288177-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vtDK4Lm6UnR4ZAbcZE6B6lPCfdnsXXgGlR9U+vikoZM=;
  b=AIcPW41nh3a5BIwylumcuTNrXtqDKetx0T0KT+wQ+YJO4A4/owpCAlyz
   FAgyiFE9+WsEd6FGrKgF917yFgJSSYgpw+kcOp0nMMjLbJ0SflT0pMcTz
   CWRpZ1j+nCaKokL6KIPivf+mmucyZgoauTuXfi30geeedwYhTnay8PWx6
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: Y0EDDO3sfh+2/6bNtzn3Z3M6c3FySYttdkmzca9t+jQBfprYKF8wGjbHTU2jkld97GTWGBCEQt
 KNlRxsJlINk6fy3efVuKiiv6vgrxtFIBYhCAQ6Ts0Rd6PJNZkro3oFMbk/G668fGW/YGx8V8/K
 3YNxGdEsmhXvPhr5IKFFud01N3rKcMuphyUzMXuDqXauPiu51l1xYv0GW2ogQMruL+uciYf3hE
 255OBVmT/e5KCHkZqSHZ4wvNG7j9BBNJmGHrtFHtWfzm/SIidJjVCYLuXas7NNmw4vNCrN94pc
 7/kVGvBe8Z+TzzJIFIjDrp5L
X-SBRS: 5.1
X-MesageID: 58696027
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LmiHgaDjct/1QxVW/+Tkw5YqxClBgxIJ4kV8jS/XYbTApD5w1jcBy
 jcbD2CDMvbZYTPxeI8iOdizoEhVv57XyNRmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5400w7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/ggiZjv5uz
 Od35ZGNcj4jIL/l39U0TEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcFjGlh2JgUQp4yY
 eJIZDZsQQnKTSEXZH0ONqAwnsiWuF7WJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHe5rg8yRN5iKb031Tq0wLTGykGoL3dRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqWFo47eJNZmOEZDt0ZL
 9qiiCElz4segscQv0lQ1QCW2mn8znQlo+Nc2+k2Yo5Hxl8mDGJGT9bxgbQ+0RqmBN3CJrVml
 CJZ8/VyFMhUUfmweNWlGY3h5o2B6fefKyH7ilVyBZQn/DnF0yf9Jt8AvmwhdRs3bp1sldrVj
 Kn74lg5CHh7ZibCUEOKS9jpV5RCIVbISbwJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfufpXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN/pxnPVNbtnhE5FyS2Im
 +ti2zyil08CDbagO3aPqub+7zkidBAGOHw/kOQPHsbrH+asMDhJ5yb5zexzdop7sb5Sk+uUr
 HixVlUBkAj0hGHdKBXMYXdmMeu9UZF6pHM9HCotIVf3hCRzPdfxtP8SJ8ktYL0q1O1/1vooH
 fMLTNqNX6ZUQTPd9jVDMZSk9N5+dA6mjB6lNja+ZGRtZIZpQgHEo4e2fgbm+CQUIDCwsM8y/
 ++p2g/BGMJRTAV+FsfGLvmoygrp73QanetzWWrOI8VSJxqwoNQ7dXSpg6Zucc8WKBjFyj+L7
 CqsAE8V9bvXvos40NjVnqTY/Y2nJPRzQxhBFG7B4LfoaSSDpji/wZVNWfqjdCzGUD+m472rY
 OhYwq2uMPADm1oW4YNwH6wykPA77trr4bRb0h5lDDPAaFHyUuFsJXyP3M9usKxRx+AG5VvqC
 xzXotQKa6+UPM7FEUIKIFt3Z+uO4vgYhz3O4KlnO079/iJ2oOKKXEg608NgU8CBwG+Z6L8Y/
 No=
IronPort-HdrOrdr: A9a23:9bD1Q65MZhzjqF9AEgPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58696027"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 62/65] x86/entry: Make IDT entrypoints CET-IBT compatible
Date: Fri, 26 Nov 2021 12:34:43 +0000
Message-ID: <20211126123446.32324-63-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Each IDT vector needs to land on an endbr64 instruction.  This is especially
important for the #CP handler, which will escalate to #DF if the endbr64 is
missing.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/x86_64/compat/entry.S |  1 +
 xen/arch/x86/x86_64/entry.S        | 28 ++++++++++++++++++++++++++--
 2 files changed, 27 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/x86_64/compat/entry.S b/xen/arch/x86/x86_64/compat/entry.S
index c84ff7ea6476..5fd6dbbd4513 100644
--- a/xen/arch/x86/x86_64/compat/entry.S
+++ b/xen/arch/x86/x86_64/compat/entry.S
@@ -12,6 +12,7 @@
 #include <irq_vectors.h>
 
 ENTRY(entry_int82)
+        ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movl  $HYPERCALL_VECTOR, 4(%rsp)
diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index 9abcf95bd010..c5fa4b3c0f41 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -386,6 +386,7 @@ UNLIKELY_END(sysenter_gpf)
         jmp   .Lbounce_exception
 
 ENTRY(int80_direct_trap)
+        ENDBR64
         ALTERNATIVE "", clac, X86_FEATURE_XEN_SMAP
         pushq $0
         movl  $0x80, 4(%rsp)
@@ -698,6 +699,7 @@ ENTRY(common_interrupt)
         jmp ret_from_intr
 
 ENTRY(page_fault)
+        ENDBR64
         movl  $TRAP_page_fault,4(%rsp)
 /* No special register assumptions. */
 GLOBAL(handle_exception)
@@ -872,75 +874,91 @@ FATAL_exception_with_ints_disabled:
         BUG   /* fatal_trap() shouldn't return. */
 
 ENTRY(divide_error)
+        ENDBR64
         pushq $0
         movl  $TRAP_divide_error,4(%rsp)
         jmp   handle_exception
 
 ENTRY(coprocessor_error)
+        ENDBR64
         pushq $0
         movl  $TRAP_copro_error,4(%rsp)
         jmp   handle_exception
 
 ENTRY(simd_coprocessor_error)
+        ENDBR64
         pushq $0
         movl  $TRAP_simd_error,4(%rsp)
         jmp   handle_exception
 
 ENTRY(device_not_available)
+        ENDBR64
         pushq $0
         movl  $TRAP_no_device,4(%rsp)
         jmp   handle_exception
 
 ENTRY(debug)
+        ENDBR64
         pushq $0
         movl  $TRAP_debug,4(%rsp)
         jmp   handle_ist_exception
 
 ENTRY(int3)
+        ENDBR64
         pushq $0
         movl  $TRAP_int3,4(%rsp)
         jmp   handle_exception
 
 ENTRY(overflow)
+        ENDBR64
         pushq $0
         movl  $TRAP_overflow,4(%rsp)
         jmp   handle_exception
 
 ENTRY(bounds)
+        ENDBR64
         pushq $0
         movl  $TRAP_bounds,4(%rsp)
         jmp   handle_exception
 
 ENTRY(invalid_op)
+        ENDBR64
         pushq $0
         movl  $TRAP_invalid_op,4(%rsp)
         jmp   handle_exception
 
 ENTRY(invalid_TSS)
+        ENDBR64
         movl  $TRAP_invalid_tss,4(%rsp)
         jmp   handle_exception
 
 ENTRY(segment_not_present)
+        ENDBR64
         movl  $TRAP_no_segment,4(%rsp)
         jmp   handle_exception
 
 ENTRY(stack_segment)
+        ENDBR64
         movl  $TRAP_stack_error,4(%rsp)
         jmp   handle_exception
 
 ENTRY(general_protection)
+        ENDBR64
         movl  $TRAP_gp_fault,4(%rsp)
         jmp   handle_exception
 
 ENTRY(alignment_check)
+        ENDBR64
         movl  $TRAP_alignment_check,4(%rsp)
         jmp   handle_exception
 
 ENTRY(entry_CP)
+        ENDBR64
         movl  $X86_EXC_CP, 4(%rsp)
         jmp   handle_exception
 
 ENTRY(double_fault)
+        ENDBR64
         movl  $TRAP_double_fault,4(%rsp)
         /* Set AC to reduce chance of further SMAP faults */
         ALTERNATIVE "", stac, X86_FEATURE_XEN_SMAP
@@ -966,6 +984,7 @@ ENTRY(double_fault)
 
         .pushsection .init.text, "ax", @progbits
 ENTRY(early_page_fault)
+        ENDBR64
         movl  $TRAP_page_fault,4(%rsp)
         SAVE_ALL
         movq  %rsp,%rdi
@@ -974,6 +993,7 @@ ENTRY(early_page_fault)
         .popsection
 
 ENTRY(nmi)
+        ENDBR64
         pushq $0
         movl  $TRAP_nmi,4(%rsp)
 handle_ist_exception:
@@ -1102,12 +1122,14 @@ handle_ist_exception:
 #endif
 
 ENTRY(machine_check)
+        ENDBR64
         pushq $0
         movl  $TRAP_machine_check,4(%rsp)
         jmp   handle_ist_exception
 
 /* No op trap handler.  Required for kexec crash path. */
 GLOBAL(trap_nop)
+        ENDBR64
         iretq
 
 /* Table of automatically generated entry points.  One per vector. */
@@ -1136,7 +1158,8 @@ autogen_stubs: /* Automatically generated stubs. */
 #endif
 
         ALIGN
-1:      pushq $0
+1:      ENDBR64
+        pushq $0
         movb  $vec,4(%rsp)
         jmp   common_interrupt
 
@@ -1146,7 +1169,8 @@ autogen_stubs: /* Automatically generated stubs. */
         .elseif vec == X86_EXC_CSO || vec == X86_EXC_SPV || \
                 vec == X86_EXC_VE  || (vec > X86_EXC_CP && vec < TRAP_nr)
 
-1:      test  $8,%spl        /* 64bit exception frames are 16 byte aligned, but the word */
+1:      ENDBR64
+        test  $8,%spl        /* 64bit exception frames are 16 byte aligned, but the word */
         jz    2f             /* size is 8 bytes.  Check whether the processor gave us an */
         pushq $0             /* error code, and insert an empty one if not.              */
 2:      movb  $vec,4(%rsp)
-- 
2.11.0


