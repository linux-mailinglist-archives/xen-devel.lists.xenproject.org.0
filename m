Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CC783E380
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 21:55:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672501.1046587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTTDk-0000Pz-3A; Fri, 26 Jan 2024 20:54:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672501.1046587; Fri, 26 Jan 2024 20:54:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTTDj-0000NN-Vq; Fri, 26 Jan 2024 20:54:39 +0000
Received: by outflank-mailman (input) for mailman id 672501;
 Fri, 26 Jan 2024 20:54:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gD8/=JE=citrix.com=prvs=748d50c66=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rTTDi-0000Mm-T7
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 20:54:39 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c50c1eb-bc8d-11ee-98f5-efadbce2ee36;
 Fri, 26 Jan 2024 21:54:35 +0100 (CET)
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
X-Inumbo-ID: 1c50c1eb-bc8d-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1706302475;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YgJTxoPk/8SnLTcVM5dSngcyjid+DLHSFQzqgZ/acuc=;
  b=M1OLByhyJ+OAWYuN+FgNuhPS1iqUUZyPNGIku5FLvJoLbm3s5axKFBK9
   KWsVJWOnrGejk+3Qrw0MO+LVKYuM8pbvNTUAGwkxQSuTpQx+YPcUVVGTZ
   r4Yby63F3Rs03lCG6cZdkYYvvon0Pze3aUEOZh/d2VZMzVxBOu/h0NWFB
   4=;
X-CSE-ConnectionGUID: iFRVMXhCS7e2sdKvpcNc6g==
X-CSE-MsgGUID: BBW5m3kyTGqOBu2HYP744w==
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 128269106
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:OaGffq6fsO8/UIEBtzmArQxRtGHHchMFZxGqfqrLsTDasY5as4F+v
 jBKWW6FMqqDamqme413Ot7jpkoE6JDSzd5rTVRoqSs1Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRG/ykTraCY3gtLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU34ZwehBtC5gZiPakR4AeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m9
 NIiFhU9bju42O/s276YVPFnoM99I5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmRJUIXUrsUIMtWcOOAr3/zaTBH7nmSorI6+TP7xw1tyrn9dtHSf7RmQO0MxBbC+
 DOfpzqR7hcyHvaglD/e8WOQqfbotz6heLMqS+Hk6as/6LGU7jNKU0BHPbehmtGph0j7V99BJ
 kg8/is1sbN05EGtVsP6XRCzvDiDpBF0c/h6HvA+6QqN4rHJ+AvfDW8BJhZebPQ2uclwQiYlv
 neOm97qHj1u9r6IU3WW9rSThTy3MCkRa2QFYEc5oRAtuoe55ttp11SWE4clT/bdYsDJ9S/Yw
 h6wkg0Oh54o0sNRzKmY40jMpTnyqc2cJuIq3Tk7Tl5J/ysgO9b7PdP0sgGGhcusOrp1WbVog
 ZTlpyR9xLpXZX11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW4meh04bppdKGS4P
 yc/XD+9A7cKYhOXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQraTYqolmY
 c3zWZ/1XR4n5VFPkGLeqxE1jeV6mUjTBAr7GfjG8vhQ+ePENSHME+lcbTNjrIkRtcu5nekcy
 P4HX+Pi9vmVeLSWjvX/mWLLEW03EA==
IronPort-HdrOrdr: A9a23:D3pPOqiL5ndSpDRg4iB2BGsVJnBQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-Talos-CUID: =?us-ascii?q?9a23=3AnBvRvGu96BV6utO4GRyIXm/E6IskXEfj6UfQCHT?=
 =?us-ascii?q?nBDxyRJ6LUVS28/1rxp8=3D?=
X-Talos-MUID: 9a23:ngWxVATZtX0f+BSGRXTGrg4/MZxr8piBEWcnjM8mivHbaXBvbmI=
X-IronPort-AV: E=Sophos;i="6.05,216,1701147600"; 
   d="scan'208";a="128269106"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>
Subject: [PATCH 1/2] x86: Remove gdbstub
Date: Fri, 26 Jan 2024 20:54:17 +0000
Message-ID: <20240126205418.3587177-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240126205418.3587177-1-andrew.cooper3@citrix.com>
References: <20240126205418.3587177-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In 13y of working on Xen, I've never seen seen it used.  The implementation
was introduced (commit b69f92f3012e, Jul 28 2004) with known issues such as:

  /* Resuming after we've stopped used to work, but more through luck
     than any actual intention.  It doesn't at the moment. */

which appear to have gone unfixed for the 20 years since.

Nowadays there are more robust ways of inspecting crashed state, such as a
kexec crash kernel, or running Xen in a VM.

This will allow us to clean up some hooks around the codebase which are
proving awkward for other tasks.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Bloat-o-meter really likes this change.

add/remove: 1/31 grow/shrink: 2/15 up/down: 113/-17033 (-16920)
Function                                     old     new   delta
hwdom_shutdown                               101     176     +75
do_int3.cold                                   -      27     +27
do_bug_frame                                 566     577     +11
panic.cold                                    98      97      -1
gdb_arch_print_state                           1       -      -1
gdb_arch_exit                                  1       -      -1
gdb_arch_enter                                 1       -      -1
do_page_fault.cold                            55      53      -2
gdb_smp_paused_count                           4       -      -4
__setup_str_opt_gdb                            4       -      -4
gdb_arch_copy_to_user                          5       -      -5
gdb_arch_copy_from_user                        5       -      -5
gdb_arch_signal_num                            6       -      -6
xen_config_data                             1280    1273      -7
__initcall_initialise_gdb                      8       -      -8
do_debugger_trap_fatal                        15       5     -10
do_debug_key                                  48      35     -13
gdb_arch_write_reg_array                      15       -     -15
gdb_send_packet.cold                          16       -     -16
do_debug                                     457     441     -16
do_trap                                      213     194     -19
do_int3                                      251     230     -21
do_invalid_op                                331     307     -24
__setup_opt_gdb                               24       -     -24
opt_gdb                                       30       -     -30
do_unhandled_trap                             38       7     -31
cpumask_first.constprop                      138     104     -34
cpumask_next.constprop                       174     129     -45
gdb_arch_resume                               52       -     -52
char2hex                                      58       -     -58
do_page_fault                               1820    1752     -68
gdb_write_to_packet                           69       -     -69
do_general_protection                        542     471     -71
initialise_gdb                                81       -     -81
gdb_write_to_packet_str                       86       -     -86
do_bug_frame.cold                            131      39     -92
gdb_send_reply                               110       -    -110
hwdom_shutdown.cold                          140       -    -140
gdb_pause_this_cpu                           159       -    -159
gdb_write_to_packet_hex                      200       -    -200
gdb_send_packet                              216       -    -216
gdbstub_console_puts                         220       -    -220
__trap_to_gdb.cold                           313       -    -313
gdb_arch_read_reg_array                      451       -    -451
gdb_arch_write_reg                           585       -    -585
gdb_arch_read_reg                            883       -    -883
gdb_cpu                                     2048       -   -2048
__trap_to_gdb                               2540       -   -2540
__gdb_ctx                                   8248       -   -8248
Total: Before=4081568, After=4064648, chg -0.41%
---
 CHANGELOG.md                      |   1 +
 docs/misc/xen-command-line.pandoc |   7 -
 xen/Kconfig.debug                 |   7 -
 xen/arch/x86/Makefile             |   1 -
 xen/arch/x86/gdbstub.c            |  91 ----
 xen/arch/x86/x86_64/Makefile      |   2 -
 xen/arch/x86/x86_64/gdbstub.c     | 150 ------
 xen/common/Makefile               |   1 -
 xen/common/gdbstub.c              | 748 ------------------------------
 xen/include/xen/gdbstub.h         | 103 ----
 10 files changed, 1 insertion(+), 1110 deletions(-)
 delete mode 100644 xen/arch/x86/gdbstub.c
 delete mode 100644 xen/arch/x86/x86_64/gdbstub.c
 delete mode 100644 xen/common/gdbstub.c
 delete mode 100644 xen/include/xen/gdbstub.h

diff --git a/CHANGELOG.md b/CHANGELOG.md
index ddb3ab8db4e7..e357b64546d8 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -23,6 +23,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 - /usr/bin/pygrub symlink.  This was deprecated in Xen 4.2 (2012) but left for
   compatibility reasons.  VMs configured with bootloader="/usr/bin/pygrub"
   should be updated to just bootloader="pygrub".
+- The Xen gdbstub on x86.
 
 ## [4.18.0](https://xenbits.xenproject.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.18.0) - 2023-11-16
 
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 8e65f8bd18bf..be76be8d5365 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1242,13 +1242,6 @@ requirement can be relaxed.  This option is particularly useful for nested
 virtualization, to allow the L1 hypervisor to use EPT even if the L0 hypervisor
 does not provide `VM_ENTRY_LOAD_GUEST_PAT`.
 
-### gdb
-> `= com1[H,L] | com2[H,L] | dbgp`
-
-> Default: ``
-
-Specify which console gdbstub should use. See **console**.
-
 ### gnttab
 > `= List of [ max-ver:<integer>, transitive=<bool>, transfer=<bool> ]`
 
diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
index e19e9d48817c..fa81853e9385 100644
--- a/xen/Kconfig.debug
+++ b/xen/Kconfig.debug
@@ -13,13 +13,6 @@ config DEBUG
 
 if DEBUG || EXPERT
 
-config CRASH_DEBUG
-	bool "Crash Debugging Support"
-	depends on X86
-	---help---
-	  If you want to attach gdb to Xen to debug Xen if it crashes
-	  then say Y.
-
 config GDBSX
 	bool "Guest debugging with gdbsx"
 	depends on X86
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 9f326b9e32e3..26d87405297b 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -35,7 +35,6 @@ obj-y += e820.o
 obj-y += emul-i8254.o
 obj-y += extable.o
 obj-y += flushtlb.o
-obj-$(CONFIG_CRASH_DEBUG) += gdbstub.o
 obj-$(CONFIG_GDBSX) += gdbsx.o
 obj-y += hypercall.o
 obj-y += i387.o
diff --git a/xen/arch/x86/gdbstub.c b/xen/arch/x86/gdbstub.c
deleted file mode 100644
index 961cae0be74f..000000000000
--- a/xen/arch/x86/gdbstub.c
+++ /dev/null
@@ -1,91 +0,0 @@
-/*
- * x86-specific gdb stub routines
- * based on x86 cdb(xen/arch/x86/cdb.c), but Extensively modified.
- * 
- * Copyright (C) 2006 Isaku Yamahata <yamahata at valinux co jp>
- *                    VA Linux Systems Japan. K.K.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- * 
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- * 
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-#include <asm/uaccess.h>
-#include <asm/x86-defns.h>
-
-#include <xen/gdbstub.h>
-
-u16
-gdb_arch_signal_num(struct cpu_user_regs *regs, unsigned long cookie)
-{
-    return 5;   /* TRAP signal.  see include/gdb/signals.h */
-}
-
-/*
- * Use __copy_*_user to make us page-fault safe, but not otherwise restrict
- * our access to the full virtual address space.
- */
-unsigned int
-gdb_arch_copy_from_user(void *dest, const void *src, unsigned len)
-{
-    return copy_from_unsafe(dest, src, len);
-}
-
-unsigned int 
-gdb_arch_copy_to_user(void *dest, const void *src, unsigned len)
-{
-    return copy_to_unsafe(dest, src, len);
-}
-
-void
-gdb_arch_print_state(struct cpu_user_regs *regs)
-{
-    /* XXX */
-}
-
-void
-gdb_arch_enter(struct cpu_user_regs *regs)
-{
-    /* nothing */
-}
-
-void
-gdb_arch_exit(struct cpu_user_regs *regs)
-{
-    /* nothing */
-}
-
-void 
-gdb_arch_resume(struct cpu_user_regs *regs,
-                unsigned long addr, unsigned long type,
-                struct gdb_context *ctx)
-{
-    if ( addr != -1UL )
-        regs->rip = addr;
-
-    regs->eflags &= ~X86_EFLAGS_TF;
-
-    /* Set eflags.RF to ensure we do not re-enter. */
-    regs->eflags |= X86_EFLAGS_RF;
-
-    /* Set the trap flag if we are single stepping. */
-    if ( type == GDB_STEP )
-        regs->eflags |= X86_EFLAGS_TF;
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * End:
- */
diff --git a/xen/arch/x86/x86_64/Makefile b/xen/arch/x86/x86_64/Makefile
index 213b789c4247..472b2bab523d 100644
--- a/xen/arch/x86/x86_64/Makefile
+++ b/xen/arch/x86/x86_64/Makefile
@@ -12,5 +12,3 @@ obj-$(CONFIG_COMPAT) += domain.o
 obj-$(CONFIG_COMPAT) += cpu_idle.o
 obj-$(CONFIG_COMPAT) += cpufreq.o
 obj-bin-$(CONFIG_KEXEC) += kexec_reloc.o
-
-obj-$(CONFIG_CRASH_DEBUG)   += gdbstub.o
diff --git a/xen/arch/x86/x86_64/gdbstub.c b/xen/arch/x86/x86_64/gdbstub.c
deleted file mode 100644
index 8287124dfb1d..000000000000
--- a/xen/arch/x86/x86_64/gdbstub.c
+++ /dev/null
@@ -1,150 +0,0 @@
-/*
- * x86_64 -specific gdb stub routines
- * 
- * Copyright (C) 2007 Dan Doucette   ddoucette@teradici.com
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- * 
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- * 
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#include <xen/gdbstub.h>
-
-#define GDB_REG64(r) gdb_write_to_packet_hex(r, sizeof(u64), ctx)
-#define GDB_REG32(r)  gdb_write_to_packet_hex(r, sizeof(u32), ctx)
-
-void 
-gdb_arch_read_reg_array(struct cpu_user_regs *regs, struct gdb_context *ctx)
-{
-    GDB_REG64(regs->rax);
-    GDB_REG64(regs->rbx);
-    GDB_REG64(regs->rcx);
-    GDB_REG64(regs->rdx);
-    GDB_REG64(regs->rsi);
-    GDB_REG64(regs->rdi);
-    GDB_REG64(regs->rbp);
-    GDB_REG64(regs->rsp);
-
-    GDB_REG64(regs->r8);
-    GDB_REG64(regs->r9);
-    GDB_REG64(regs->r10);
-    GDB_REG64(regs->r11);
-    GDB_REG64(regs->r12);
-    GDB_REG64(regs->r13);
-    GDB_REG64(regs->r14);
-    GDB_REG64(regs->r15);
-
-    GDB_REG64(regs->rip);
-    GDB_REG32(regs->eflags);
-
-    GDB_REG32(regs->cs);
-    GDB_REG32(regs->ss);
-    GDB_REG32(regs->ds);
-    GDB_REG32(regs->es);
-    GDB_REG32(regs->fs);
-    GDB_REG32(regs->gs);
-
-    gdb_send_packet(ctx);
-}
-
-void 
-gdb_arch_write_reg_array(struct cpu_user_regs *regs, const char* buf,
-                         struct gdb_context *ctx)
-{
-    gdb_send_reply("", ctx);
-}
-
-void 
-gdb_arch_read_reg(unsigned long regnum, struct cpu_user_regs *regs,
-                  struct gdb_context *ctx)
-{
-    switch (regnum)
-    {
-        case 0: GDB_REG64(regs->rax); break;
-        case 1: GDB_REG64(regs->rbx); break;
-        case 2: GDB_REG64(regs->rcx); break;
-        case 3: GDB_REG64(regs->rdx); break;
-        case 4: GDB_REG64(regs->rsi); break;
-        case 5: GDB_REG64(regs->rdi); break;
-        case 6: GDB_REG64(regs->rbp); break;
-        case 7: GDB_REG64(regs->rsp); break;
-
-        case 8: GDB_REG64(regs->r8); break;
-        case 9: GDB_REG64(regs->r9); break;
-        case 10: GDB_REG64(regs->r10); break;
-        case 11: GDB_REG64(regs->r11); break;
-        case 12: GDB_REG64(regs->r12); break;
-        case 13: GDB_REG64(regs->r13); break;
-        case 14: GDB_REG64(regs->r14); break;
-        case 15: GDB_REG64(regs->r15); break;
-
-        case 16: GDB_REG64(regs->rip); break;
-        case 17: GDB_REG32(regs->rflags); break;
-        case 18: GDB_REG32(regs->cs); break;
-        case 19: GDB_REG32(regs->ss); break;
-        case 20: GDB_REG32(regs->ds); break;
-        case 21: GDB_REG32(regs->es); break;
-        case 22: GDB_REG32(regs->fs); break;
-        case 23: GDB_REG32(regs->gs); break;
-        default:
-            GDB_REG64(0xbaadf00ddeadbeef);
-            break;
-    }
-    gdb_send_packet(ctx);
-}
-
-void 
-gdb_arch_write_reg(unsigned long regnum, unsigned long val, 
-                    struct cpu_user_regs *regs, struct gdb_context *ctx)
-{
-    switch (regnum)
-    {
-        case 0: regs->rax = val; break;
-        case 1: regs->rbx = val; break;
-        case 2: regs->rcx = val; break;
-        case 3: regs->rdx = val; break;
-        case 4: regs->rsi = val; break;
-        case 5: regs->rdi = val; break;
-        case 6: regs->rbp = val; break;
-        case 7: regs->rsp = val; break;
-
-        case 8: regs->r8 = val; break;
-        case 9: regs->r9 = val; break;
-        case 10: regs->r10 = val; break;
-        case 11: regs->r11 = val; break;
-        case 12: regs->r12 = val; break;
-        case 13: regs->r13 = val; break;
-        case 14: regs->r14 = val; break;
-        case 15: regs->r15 = val; break;
-
-        case 16: regs->rip = val; break;
-        case 17: regs->rflags = (u32)val; break;
-        case 18: regs->cs = (u16)val; break;
-        case 19: regs->ss = (u16)val; break;
-        case 20: regs->ds = (u16)val; break;
-        case 21: regs->es = (u16)val; break;
-        case 22: regs->fs = (u16)val; break;
-        case 23: regs->gs = (u16)val; break;
-        default:
-            break;
-    }
-    gdb_send_reply("OK", ctx);
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * End:
- */
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 69d6aa626c7f..e5eee19a8537 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -12,7 +12,6 @@ obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-y += event_fifo.o
-obj-$(CONFIG_CRASH_DEBUG) += gdbstub.o
 obj-$(CONFIG_GRANT_TABLE) += grant_table.o
 obj-y += guestcopy.o
 obj-bin-y += gunzip.init.o
diff --git a/xen/common/gdbstub.c b/xen/common/gdbstub.c
deleted file mode 100644
index df8d122bce8d..000000000000
--- a/xen/common/gdbstub.c
+++ /dev/null
@@ -1,748 +0,0 @@
-/*
- * Copyright (C) 2005 Jimi Xenidis <jimix@watson.ibm.com>, IBM Corporation
- * Copyright (C) 2006 Isaku Yamahata <yamahata at valinux co jp>
- *                    VA Linux Systems Japan. K.K.
- * 
- * gdbstub arch neutral part
- * Based on x86 cdb (xen/arch/x86/cdb.c) and ppc gdbstub(xen/common/gdbstub.c)
- * But extensively modified.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- * 
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- * 
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-/*
- * gdbstub: implements the architecture independant parts of the
- * gdb remote protocol.
- */
-
-/* We try to avoid assuming much about what the rest of the system is
-   doing.  In particular, dynamic memory allocation is out of the
-   question. */
-
-/* Resuming after we've stopped used to work, but more through luck
-   than any actual intention.  It doesn't at the moment. */
-
-#include <xen/lib.h>
-#include <xen/spinlock.h>
-#include <xen/serial.h>
-#include <xen/irq.h>
-#include <xen/watchdog.h>
-#include <xen/init.h>
-#include <xen/param.h>
-#include <xen/smp.h>
-#include <xen/console.h>
-#include <xen/errno.h>
-#include <xen/delay.h>
-#include <xen/gdbstub.h>
-
-#include <asm/byteorder.h>
-
-/* Printk isn't particularly safe just after we've trapped to the
-   debugger. so avoid it. */
-#define dbg_printk(...)
-/*#define dbg_printk(...)   printk(__VA_ARGS__)*/
-
-#define GDB_RETRY_MAX   10
-
-struct gdb_cpu_info
-{
-    atomic_t paused;
-    atomic_t ack;
-};
-
-static struct gdb_cpu_info gdb_cpu[NR_CPUS];
-static atomic_t gdb_smp_paused_count;
-
-static void gdb_smp_pause(void);
-static void gdb_smp_resume(void);
-
-static char __initdata opt_gdb[30];
-string_param("gdb", opt_gdb);
-
-static void cf_check gdbstub_console_puts(const char *str, size_t nr);
-
-/* value <-> char (de)serialzers */
-static char
-hex2char(unsigned long x)
-{
-    const char array[] = "0123456789abcdef";
-    return array[x & 15];
-}
-
-static unsigned int
-char2hex(unsigned char c)
-{
-    if ( (c >= '0') && (c <= '9') )
-        return c - '0';
-    else if ( (c >= 'a') && (c <= 'f') )
-        return c - 'a' + 10;
-    else if ( (c >= 'A') && (c <= 'F') )
-        return c - 'A' + 10;
-    else
-        BUG();
-    return -1;
-}
-
-static unsigned char
-str2hex(const char *str)
-{
-    return (char2hex(str[0]) << 4) | char2hex(str[1]);
-}
-
-static unsigned long
-str2ulong(const char *str, unsigned long bytes)
-{
-    unsigned long x = 0;
-    unsigned long i = 0;
-
-    while ( *str && (i < (bytes * 2)) )
-    {
-        x <<= 4;
-        x += char2hex(*str);
-        ++str;
-        ++i;
-    }
-
-    return x;
-}
-
-static unsigned long
-str_to_native_ulong(const char *str)
-{
-    unsigned long x = 0, i = 0;
-
-    while ( *str && (i < BYTES_PER_LONG) )
-    {
-#ifdef __BIG_ENDIAN
-        x <<= 8;
-        x += str2hex(str);
-#elif defined(__LITTLE_ENDIAN)
-        x += (unsigned long)str2hex(str) << (i*8);
-#else
-# error unknown endian
-#endif
-        str += 2;
-        i++;
-    }
-
-    return x;
-}
-
-/* gdb io wrappers */
-static signed long
-gdb_io_write(const char *buf, unsigned long len, struct gdb_context *ctx)
-{
-    int i;
-    for ( i = 0; i < len; i++ )
-        serial_putc(ctx->serhnd, buf[i]);
-    return i;
-}
-
-static int
-gdb_io_write_char(u8 data, struct gdb_context *ctx)
-{
-    return gdb_io_write((char*)&data, 1, ctx);
-}
-
-static unsigned char
-gdb_io_read(struct gdb_context *ctx)
-{
-    return serial_getc(ctx->serhnd);
-}
-
-/* Receive a command.  Returns -1 on csum error, 0 otherwise. */
-/* Does not acknowledge. */
-static int 
-attempt_receive_packet(struct gdb_context *ctx)
-{
-    u8 csum;
-    u8 received_csum;
-    u8 ch;
-
-    /* Skip over everything up to the first '$' */
-    while ( (ch = gdb_io_read(ctx)) != '$' )
-        continue;
-
-    csum = 0;
-    for ( ctx->in_bytes = 0;
-          ctx->in_bytes < sizeof(ctx->in_buf);
-          ctx->in_bytes++ )
-    {
-        ch = gdb_io_read(ctx);
-        if ( ch == '#' )
-            break;
-        ctx->in_buf[ctx->in_bytes] = ch;
-        csum += ch;
-    }
-
-    if ( ctx->in_bytes == sizeof(ctx->in_buf) )
-    {
-        dbg_printk("WARNING: GDB sent a stupidly big packet.\n");
-        return -1;
-    }
-
-    ctx->in_buf[ctx->in_bytes] = '\0';
-    received_csum = char2hex(gdb_io_read(ctx)) * 16 +
-        char2hex(gdb_io_read(ctx));
-
-    return (received_csum == csum) ? 0 : -1;
-}
-
-/* Receive a command, discarding up to ten packets with csum
- * errors.  Acknowledges all received packets. */
-static int 
-receive_command(struct gdb_context *ctx)
-{
-    int r, count = 0;
-
-    count = 0;
-    do {
-        r = attempt_receive_packet(ctx);
-        gdb_io_write_char((r < 0) ? '-' : '+', ctx);
-        count++;
-    } while ( (r < 0) && (count < GDB_RETRY_MAX) );
-
-    return r;
-}
-
-/* routines to send reply packets */
-
-static void 
-gdb_start_packet(struct gdb_context *ctx)
-{
-    ctx->out_buf[0] = '$';
-    ctx->out_offset = 1;
-    ctx->out_csum = 0;
-}
-
-static void 
-gdb_write_to_packet_char(u8 data, struct gdb_context *ctx)
-{
-    ctx->out_csum += data;
-    ctx->out_buf[ctx->out_offset] = data;
-    ctx->out_offset++;
-}
-
-void 
-gdb_write_to_packet(const char *buf, int count, struct gdb_context *ctx)
-{
-    int x;
-    for ( x = 0; x < count; x++ )
-        gdb_write_to_packet_char(buf[x], ctx);
-}
-
-void 
-gdb_write_to_packet_str(const char *buf, struct gdb_context *ctx)
-{
-    gdb_write_to_packet(buf, strlen(buf), ctx);
-}
-
-void
-gdb_write_to_packet_hex(unsigned long x, int int_size, struct gdb_context *ctx)
-{
-    char buf[sizeof(unsigned long) * 2 + 1];
-    int i, width = int_size * 2;
-
-    buf[sizeof(unsigned long) * 2] = 0;
-
-    switch ( int_size )
-    {
-    case sizeof(u8):
-    case sizeof(u16):
-    case sizeof(u32):
-    case sizeof(u64):
-        break;
-    default:
-        dbg_printk("WARNING: %s x: %#lx int_size: %d\n",
-                   __func__, x, int_size);
-        break;
-    }
-
-#ifdef __BIG_ENDIAN
-    i = sizeof(unsigned long) * 2
-    do {
-        buf[--i] = hex2char(x & 15);
-        x >>= 4;
-    } while ( x );
-
-    while ( (i + width) > (sizeof(unsigned long) * 2) )
-        buf[--i] = '0';
-
-    gdb_write_to_packet(&buf[i], width, ctx);
-#elif defined(__LITTLE_ENDIAN)
-    i = 0;
-    while ( i < width )
-    {
-        buf[i++] = hex2char(x>>4);
-        buf[i++] = hex2char(x);
-        x >>= 8;
-    }
-    gdb_write_to_packet(buf, width, ctx);
-#else
-# error unknown endian
-#endif
-}
-
-static int
-gdb_check_ack(struct gdb_context *ctx)
-{
-    u8 c = gdb_io_read(ctx);
-
-    switch ( c )
-    {
-    case '+':
-        return 1;
-    case '-':
-        return 0;
-    default:
-        printk("Bad ack: %c\n", c);
-        return 0;
-    }
-}
-
-/* Return 0 if the reply was successfully received, !0 otherwise. */
-void 
-gdb_send_packet(struct gdb_context *ctx)
-{
-    char buf[3];
-    int count;
-
-    snprintf(buf, sizeof(buf), "%.02x\n", ctx->out_csum);
-
-    gdb_write_to_packet_char('#', ctx);
-    gdb_write_to_packet(buf, 2, ctx);
-
-    count = 0;
-    do {
-        gdb_io_write(ctx->out_buf, ctx->out_offset, ctx);
-    } while ( !gdb_check_ack(ctx) && (count++ < GDB_RETRY_MAX) );
-
-    if ( count == GDB_RETRY_MAX )
-        dbg_printk("WARNING: %s reached max retry %d\n",
-                   __func__, GDB_RETRY_MAX);
-}
-
-void 
-gdb_send_reply(const char *buf, struct gdb_context *ctx)
-{
-    gdb_start_packet(ctx);
-    gdb_write_to_packet_str(buf, ctx);
-    gdb_send_packet(ctx);
-}
-
-/* arch neutral command handlers */
-
-static void 
-gdb_cmd_signum(struct gdb_context *ctx)
-{
-    gdb_write_to_packet_char('S', ctx);
-    gdb_write_to_packet_hex(ctx->signum, sizeof(ctx->signum), ctx);
-    gdb_send_packet(ctx);
-}
-
-static void 
-gdb_cmd_read_mem(unsigned long addr, unsigned long length,
-                 struct gdb_context *ctx)
-{
-    int x, r;
-    unsigned char val;
-
-    dbg_printk("Memory read starting at %lx, length %lx.\n", addr,
-               length);
-
-    for ( x = 0; x < length; x++ )
-    {
-        r = gdb_arch_copy_from_user(&val, (void *)(addr + x), 1);
-        if ( r != 0 )
-        {
-            dbg_printk("Error reading from %lx.\n", addr + x);
-            break;
-        }
-        gdb_write_to_packet_hex(val, sizeof(val), ctx);
-    }
-
-    if ( x == 0 )
-        gdb_write_to_packet_str("E05", ctx);
-
-    dbg_printk("Read done.\n");
-
-    gdb_send_packet(ctx);
-}
-
-static void 
-gdb_cmd_write_mem(unsigned long addr, unsigned long length,
-                  const char *buf, struct gdb_context *ctx)
-{
-    int x, r;
-    unsigned char val;
-
-    dbg_printk("Memory write starting at %lx, length %lx.\n", addr, length);
-
-    for ( x = 0; x < length; x++, addr++, buf += 2 )
-    {
-        val = str2ulong(buf, sizeof(val));
-        r = gdb_arch_copy_to_user((void*)addr, (void*)&val, 1);
-        if ( r != 0 )
-        {
-            dbg_printk("Error writing to %lx.\n", addr);
-            break;
-        }
-    }
-
-    if (x == length)
-        gdb_write_to_packet_str("OK", ctx);
-    else
-        gdb_write_to_packet_str("E11", ctx);
-
-    dbg_printk("Write done.\n");
-
-    gdb_send_packet(ctx);
-}
-
-static void
-gdbstub_attach(struct gdb_context *ctx)
-{
-    if ( ctx->currently_attached )
-        return;    
-    ctx->currently_attached = 1;
-    ctx->console_steal_id = console_steal(ctx->serhnd, gdbstub_console_puts);
-}
-
-static void
-gdbstub_detach(struct gdb_context *ctx)
-{
-    if ( !ctx->currently_attached )
-        return;
-    ctx->currently_attached = 0;
-    console_giveback(ctx->console_steal_id);
-}
-
-/* command dispatcher */
-static int 
-process_command(struct cpu_user_regs *regs, struct gdb_context *ctx)
-{
-    const char *ptr;
-    unsigned long addr, length, val;
-    int resume = 0;
-    unsigned long type = GDB_CONTINUE;
-
-    /* XXX check ctx->in_bytes >= 2 or similar. */
-
-    gdb_start_packet(ctx);
-    switch ( ctx->in_buf[0] )
-    {
-    case '?':    /* query signal number */
-        gdb_cmd_signum(ctx);
-        break;
-    case 'H':    /* thread operations */
-        gdb_send_reply("OK", ctx);
-        break;
-    case 'g': /* Read registers */
-        gdb_arch_read_reg_array(regs, ctx);
-        break;
-    case 'G': /* Write registers */
-        gdb_arch_write_reg_array(regs, ctx->in_buf + 1, ctx);
-        break;
-    case 'm': /* Read memory */
-        addr = simple_strtoul(ctx->in_buf + 1, &ptr, 16);
-        if ( (ptr == (ctx->in_buf + 1)) || (ptr[0] != ',') )
-        {
-            gdb_send_reply("E03", ctx);
-            return 0;
-        }
-        length = simple_strtoul(ptr + 1, &ptr, 16);
-        if ( ptr[0] != 0 )
-        {
-            gdb_send_reply("E04", ctx);
-            return 0;
-        }
-        gdb_cmd_read_mem(addr, length, ctx);
-        break;
-    case 'M': /* Write memory */
-        addr = simple_strtoul(ctx->in_buf + 1, &ptr, 16);
-        if ( (ptr == (ctx->in_buf + 1)) || (ptr[0] != ',') )
-        {
-            gdb_send_reply("E03", ctx);
-            return 0;
-        }
-        length = simple_strtoul(ptr + 1, &ptr, 16);
-        if ( ptr[0] != ':')
-        {
-            gdb_send_reply("E04", ctx);
-            return 0;
-        }
-        gdb_cmd_write_mem(addr, length, ptr + 1, ctx);
-        break;
-    case 'p': /* read register */
-        addr = simple_strtoul(ctx->in_buf + 1, &ptr, 16);
-        if ( ptr == (ctx->in_buf + 1) )
-        {
-            gdb_send_reply("E03", ctx);
-            return 0;
-        }
-        if ( ptr[0] != 0 )
-        {
-            gdb_send_reply("E04", ctx);
-            return 0;
-        }
-        gdb_arch_read_reg(addr, regs, ctx);
-        break;
-    case 'P': /* write register */
-        addr = simple_strtoul(ctx->in_buf + 1, &ptr, 16);
-        if ( ptr == (ctx->in_buf + 1) )
-        {
-            gdb_send_reply("E03", ctx);
-            return 0;
-        }
-        if ( ptr[0] != '=' )
-        {
-            gdb_send_reply("E04", ctx);
-            return 0;
-        }
-        ptr++;
-        val = str_to_native_ulong(ptr);
-        gdb_arch_write_reg(addr, val, regs, ctx);
-        break;
-    case 'D':
-    case 'k':
-        gdbstub_detach(ctx);
-        gdb_send_reply("OK", ctx);
-        ctx->connected = 0;
-        resume = 1;
-        break;
-    case 's': /* Single step */
-        type = GDB_STEP;
-    case 'c': /* Resume at current address */
-        addr = ~((unsigned long)0);
-
-        if ( ctx->in_buf[1] )
-            addr = str2ulong(&ctx->in_buf[1], sizeof(unsigned long));
-        gdbstub_attach(ctx);
-        resume = 1;
-        gdb_arch_resume(regs, addr, type, ctx);
-        break;
-    default:
-        gdb_send_reply("", ctx);
-        break;
-    }
-    return resume;
-}
-
-static struct gdb_context
-__gdb_ctx = {
-    .serhnd  = -1,
-    .running = ATOMIC_INIT(1),
-    .signum  = 1
-};
-static struct gdb_context *gdb_ctx = &__gdb_ctx;
-
-static void cf_check gdbstub_console_puts(const char *str, size_t nr)
-{
-    const char *p;
-
-    gdb_start_packet(gdb_ctx);
-    gdb_write_to_packet_char('O', gdb_ctx);
-
-    for ( p = str; nr > 0; p++, nr-- )
-    {
-        gdb_write_to_packet_char(hex2char((*p>>4) & 0x0f), gdb_ctx );
-        gdb_write_to_packet_char(hex2char((*p) & 0x0f), gdb_ctx );
-    }
-
-    gdb_send_packet(gdb_ctx);
-}
-
-/* trap handler: main entry point */
-int 
-__trap_to_gdb(struct cpu_user_regs *regs, unsigned long cookie)
-{
-    int rc = 0;
-    unsigned long flags;
-
-    if ( gdb_ctx->serhnd < 0 )
-    {
-        printk("Debugging connection not set up.\n");
-        return -EBUSY;
-    }
-
-    /* We rely on our caller to ensure we're only on one processor
-     * at a time... We should probably panic here, but given that
-     * we're a debugger we should probably be a little tolerant of
-     * things going wrong. */
-    /* We don't want to use a spin lock here, because we're doing
-       two distinct things:
-
-       1 -- we don't want to run on more than one processor at a time,
-            and
-       2 -- we want to do something sensible if we re-enter ourselves.
-
-       Spin locks are good for 1, but useless for 2. */
-    if ( !atomic_dec_and_test(&gdb_ctx->running) )
-    {
-        printk("WARNING WARNING WARNING: Avoiding recursive gdb.\n");
-        atomic_inc(&gdb_ctx->running);
-        return -EBUSY;
-    }
-
-    if ( !gdb_ctx->connected )
-    {
-        printk("GDB connection activated.\n");
-        gdb_arch_print_state(regs);
-        gdb_ctx->connected = 1;
-    }
-
-    gdb_smp_pause();
-
-    local_irq_save(flags);
-
-    watchdog_disable();
-    console_start_sync();
-
-    gdb_arch_enter(regs);
-    gdb_ctx->signum = gdb_arch_signal_num(regs, cookie);
-
-    /* If gdb is already attached, tell it we've stopped again. */
-    if ( gdb_ctx->currently_attached )
-    {
-        gdb_start_packet(gdb_ctx);
-        gdb_cmd_signum(gdb_ctx);
-    }
-
-    do {
-        if ( receive_command(gdb_ctx) < 0 )
-        {
-            dbg_printk("Error in GDB session...\n");
-            rc = -EIO;
-            break;
-        }
-    } while ( process_command(regs, gdb_ctx) == 0 );
-
-    gdb_smp_resume();
-
-    gdb_arch_exit(regs);
-    console_end_sync();
-    watchdog_enable();
-    atomic_inc(&gdb_ctx->running);
-
-    local_irq_restore(flags);
-
-    return rc;
-}
-
-static int __init cf_check initialise_gdb(void)
-{
-    if ( *opt_gdb == '\0' )
-        return 0;
-
-    gdb_ctx->serhnd = serial_parse_handle(opt_gdb);
-    if ( gdb_ctx->serhnd == -1 )
-    {
-        printk("Bad gdb= option '%s'\n", opt_gdb);
-        return 0;
-    }
-
-    serial_start_sync(gdb_ctx->serhnd);
-
-    printk("GDB stub initialised.\n");
-
-    return 0;
-}
-presmp_initcall(initialise_gdb);
-
-static void cf_check gdb_pause_this_cpu(void *unused)
-{
-    unsigned long flags;
-
-    local_irq_save(flags);
-
-    atomic_set(&gdb_cpu[smp_processor_id()].ack, 1);
-    atomic_inc(&gdb_smp_paused_count);
-
-    while ( atomic_read(&gdb_cpu[smp_processor_id()].paused) )
-        mdelay(1);
-
-    atomic_dec(&gdb_smp_paused_count);
-    atomic_set(&gdb_cpu[smp_processor_id()].ack, 0);
-
-    /* Restore interrupts */
-    local_irq_restore(flags);
-}
-
-static void gdb_smp_pause(void)
-{
-    int timeout = 100;
-    int cpu;
-
-    for_each_online_cpu(cpu)
-    {
-        atomic_set(&gdb_cpu[cpu].ack, 0);
-        atomic_set(&gdb_cpu[cpu].paused, 1);
-    }
-
-    atomic_set(&gdb_smp_paused_count, 0);
-
-    smp_call_function(gdb_pause_this_cpu, NULL, /* dont wait! */0);
-
-    /* Wait 100ms for all other CPUs to enter pause loop */
-    while ( (atomic_read(&gdb_smp_paused_count) < (num_online_cpus() - 1)) 
-            && (timeout-- > 0) )
-        mdelay(1);
-
-    if ( atomic_read(&gdb_smp_paused_count) < (num_online_cpus() - 1) )
-    {
-        printk("GDB: Not all CPUs have paused, missing CPUs ");
-        for_each_online_cpu(cpu)
-        {
-            if ( (cpu != smp_processor_id()) &&
-                 !atomic_read(&gdb_cpu[cpu].ack) )
-                printk("%d ", cpu);
-        }
-        printk("\n");
-    }
-}
-
-static void gdb_smp_resume(void)
-{
-    int cpu;
-    int timeout = 100;
-
-    for_each_online_cpu(cpu)
-        atomic_set(&gdb_cpu[cpu].paused, 0);
-
-    /* Make sure all CPUs resume */
-    while ( (atomic_read(&gdb_smp_paused_count) > 0)
-            && (timeout-- > 0) )
-        mdelay(1);
-
-    if ( atomic_read(&gdb_smp_paused_count) > 0 )
-    {
-        printk("GDB: Not all CPUs have resumed execution, missing CPUs ");
-        for_each_online_cpu(cpu)
-        {
-            if ( (cpu != smp_processor_id()) &&
-                 atomic_read(&gdb_cpu[cpu].ack) )
-                printk("%d ", cpu);
-        }
-        printk("\n");
-    }
-}
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * End:
- */
diff --git a/xen/include/xen/gdbstub.h b/xen/include/xen/gdbstub.h
deleted file mode 100644
index d2efeb0e3ae1..000000000000
--- a/xen/include/xen/gdbstub.h
+++ /dev/null
@@ -1,103 +0,0 @@
-/*
- * Copyright (C) 2005 Hollis Blanchard <hollisb@us.ibm.com>, IBM Corporation
- * Copyright (C) 2006 Isaku Yamahata <yamahata at valinux co jp>
- *                    VA Linux Systems Japan. K.K.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- * 
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- * 
- * You should have received a copy of the GNU General Public License
- * along with this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef __XEN_GDBSTUB_H__
-#define __XEN_GDBSTUB_H__
-
-#include <xen/page-size.h>
-#include <asm/atomic.h>
-
-#ifdef CONFIG_CRASH_DEBUG
-
-struct cpu_user_regs;
-
-struct gdb_context {
-    int                 serhnd;           /* handle on our serial line */
-    int                 console_steal_id; /* handle on stolen console */
-    bool                currently_attached;
-    atomic_t            running;
-    unsigned long       connected;
-    u8                  signum;
-
-    char                in_buf[PAGE_SIZE];
-    unsigned long       in_bytes;
-
-    char                out_buf[PAGE_SIZE];
-    unsigned long       out_offset;
-    u8                  out_csum;
-};
-
-/* interface to arch specific routines */
-void gdb_write_to_packet(
-    const char *buf, int count, struct gdb_context *ctx);
-void gdb_write_to_packet_hex(
-    unsigned long x, int int_size, struct gdb_context *ctx);
-    /* ... writes in target native byte order as required by gdb spec. */
-void gdb_send_packet(struct gdb_context *ctx);
-void gdb_send_reply(const char *buf, struct gdb_context *ctx);
-
-/* gdb stub trap handler: entry point */
-int __trap_to_gdb(struct cpu_user_regs *regs, unsigned long cookie);
-
-/* arch specific routines */
-u16 gdb_arch_signal_num(
-    struct cpu_user_regs *regs, unsigned long cookie);
-void gdb_arch_read_reg_array(
-    struct cpu_user_regs *regs, struct gdb_context *ctx);
-void gdb_arch_write_reg_array(
-    struct cpu_user_regs *regs, const char* buf, struct gdb_context *ctx);
-void gdb_arch_read_reg(
-    unsigned long regnum, struct cpu_user_regs *regs, struct gdb_context *ctx);
-void gdb_arch_write_reg(
-    unsigned long regnum, unsigned long val, struct cpu_user_regs *regs, 
-    struct gdb_context *ctx);
-unsigned int gdb_arch_copy_from_user(
-    void *dest, const void *src, unsigned len);
-unsigned int gdb_arch_copy_to_user(
-    void *dest, const void *src, unsigned len);
-void gdb_arch_resume(
-    struct cpu_user_regs *regs, unsigned long addr,
-    unsigned long type, struct gdb_context *ctx);
-void gdb_arch_print_state(struct cpu_user_regs *regs);
-void gdb_arch_enter(struct cpu_user_regs *regs);
-void gdb_arch_exit(struct cpu_user_regs *regs);
-
-#define GDB_CONTINUE     0
-#define GDB_STEP         1
-
-#define SIGILL           4
-#define SIGTRAP          5
-#define SIGBUS           7
-#define SIGFPE           8
-#define SIGSEGV         11
-#define SIGALRM         14
-#define SIGTERM         15
-
-#endif
-
-#endif /* __XEN_GDBSTUB_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * End:
- */

base-commit: c378ff8983cd69786c35117e49640f027e581bca
-- 
2.30.2


