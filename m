Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8451E4E3F
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 21:34:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1je1ot-0006bS-0a; Wed, 27 May 2020 19:34:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/dLv=7J=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1je1or-0006b7-HC
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 19:34:29 +0000
X-Inumbo-ID: 107ad8aa-a051-11ea-9947-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 107ad8aa-a051-11ea-9947-bc764e2007e4;
 Wed, 27 May 2020 19:34:21 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: y3yuGKwlIoZ/HdGOnxeDgPPOs0wYll11M5AmTmCsBOgUvsK+Ui34zh3c7zEMnp8C8ZMwhgrbzY
 ONgNIr9ifCCY9QmRQ592wMWvYsy952D5rLRirgbTZYlYR7XasUsPjGm0wkdLgkfMMZz9RoCyEk
 inT5OCYK5wlOdtiHr/frvxX95qgNFOpt1MgEG3BNf+hFvXhmr9lkj8kxbiXv/7g5I5pd+4W6eV
 wrqjo/oLEFZOBWyrfmG/mmdmOIKhu9oh7cWsx4x6hWghUHzJNzOn9MiviLGQ+LzQgofCXVJXL3
 6Vg=
X-SBRS: 2.7
X-MesageID: 18890134
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,442,1583211600"; d="scan'208";a="18890134"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 13/14] x86/S3: Save and restore Shadow Stack configuration
Date: Wed, 27 May 2020 20:18:46 +0100
Message-ID: <20200527191847.17207-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200527191847.17207-1-andrew.cooper3@citrix.com>
References: <20200527191847.17207-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

See code for details

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>

Semi-RFC - I can't actually test this path.  Currently attempting to arrange
for someone else to.

v2:
 * New, split out of "x86/shstk: Activate Supervisor Shadow Stacks"
 * Drop asm/config.h include
 * Fix order of operations to avoid multiple crashes.
---
 xen/arch/x86/acpi/wakeup_prot.S | 58 +++++++++++++++++++++++++++++++++++++++++
 xen/include/asm-x86/msr-index.h |  3 +++
 xen/include/asm-x86/x86-defns.h |  1 +
 3 files changed, 62 insertions(+)

diff --git a/xen/arch/x86/acpi/wakeup_prot.S b/xen/arch/x86/acpi/wakeup_prot.S
index 4dba6020a7..dcc7e2327d 100644
--- a/xen/arch/x86/acpi/wakeup_prot.S
+++ b/xen/arch/x86/acpi/wakeup_prot.S
@@ -1,3 +1,7 @@
+#include <asm/msr-index.h>
+#include <asm/page.h>
+#include <asm/processor.h>
+
         .file __FILE__
         .text
         .code64
@@ -15,6 +19,12 @@ ENTRY(do_suspend_lowlevel)
         mov     %cr0, %rax
         mov     %rax, saved_cr0(%rip)
 
+#ifdef CONFIG_XEN_SHSTK
+        mov     $1, %eax
+        rdsspq  %rax
+        mov     %rax, saved_ssp(%rip)
+#endif
+
         /* enter sleep state physically */
         mov     $3, %edi
         call    acpi_enter_sleep_state
@@ -48,6 +58,51 @@ ENTRY(s3_resume)
         pushq   %rax
         lretq
 1:
+#ifdef CONFIG_XEN_SHSTK
+        /*
+         * Restoring SSP is a little complicated, because we are intercepting
+         * an in-use shadow stack.  Write a temporary token under the stack,
+         * so SETSSBSY will successfully load a value useful for us, then
+         * reset MSR_PL0_SSP to its usual value and pop the temporary token.
+         */
+        mov     saved_rsp(%rip), %rdi
+        cmpq    $1, %rdi
+        je      .L_shstk_done
+
+        /* Set up MSR_S_CET. */
+        mov     $MSR_S_CET, %ecx
+        xor     %edx, %edx
+        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
+        wrmsr
+
+        /* Construct the temporary supervisor token under SSP. */
+        sub     $8, %rdi
+
+        /* Load it into MSR_PL0_SSP. */
+        mov     $MSR_PL0_SSP, %ecx
+        mov     %rdi, %rdx
+        shr     $32, %rdx
+        mov     %edi, %eax
+        wrmsr
+
+        /* Enable CET.  MSR_INTERRUPT_SSP_TABLE is set up later in load_system_tables(). */
+        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
+        mov     %rbx, %cr4
+
+        /* Write the temporary token onto the shadow stack, and activate it. */
+        wrssq   %rdi, (%rdi)
+        setssbsy
+
+        /* Reset MSR_PL0_SSP back to its normal value. */
+        and     $~(STACK_SIZE - 1), %eax
+        or      $(PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - 8, %eax
+        wrmsr
+
+        /* Pop the temporary token off the stack. */
+        mov     $2, %eax
+        incsspd %eax
+.L_shstk_done:
+#endif
 
         call    load_system_tables
 
@@ -65,6 +120,9 @@ ENTRY(s3_resume)
 
 saved_rsp:      .quad   0
 saved_cr0:      .quad   0
+#ifdef CONFIG_XEN_SHSTK
+saved_ssp:      .quad   0
+#endif
 
 GLOBAL(saved_magic)
         .long   0x9abcdef0
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index 85c5f20b76..cdfb7b047b 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -68,6 +68,9 @@
 
 #define MSR_U_CET                           0x000006a0
 #define MSR_S_CET                           0x000006a2
+#define  CET_SHSTK_EN                       (_AC(1, ULL) <<  0)
+#define  CET_WRSS_EN                        (_AC(1, ULL) <<  1)
+
 #define MSR_PL0_SSP                         0x000006a4
 #define MSR_PL1_SSP                         0x000006a5
 #define MSR_PL2_SSP                         0x000006a6
diff --git a/xen/include/asm-x86/x86-defns.h b/xen/include/asm-x86/x86-defns.h
index 5366e2d018..072c87042c 100644
--- a/xen/include/asm-x86/x86-defns.h
+++ b/xen/include/asm-x86/x86-defns.h
@@ -73,6 +73,7 @@
 #define X86_CR4_SMEP       0x00100000 /* enable SMEP */
 #define X86_CR4_SMAP       0x00200000 /* enable SMAP */
 #define X86_CR4_PKE        0x00400000 /* enable PKE */
+#define X86_CR4_CET        0x00800000 /* Control-flow Enforcement Technology */
 
 /*
  * XSTATE component flags in XCR0
-- 
2.11.0


