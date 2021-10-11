Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BFD429676
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 20:06:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.206447.362020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzgg-0005ZR-PK; Mon, 11 Oct 2021 18:06:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 206447.362020; Mon, 11 Oct 2021 18:06:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZzgg-0005XK-M0; Mon, 11 Oct 2021 18:06:10 +0000
Received: by outflank-mailman (input) for mailman id 206447;
 Mon, 11 Oct 2021 18:06:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BpBC=O7=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mZzgf-0005XE-Eb
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 18:06:09 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e7c6baca-2abd-11ec-80ee-12813bfff9fa;
 Mon, 11 Oct 2021 18:06:07 +0000 (UTC)
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
X-Inumbo-ID: e7c6baca-2abd-11ec-80ee-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1633975567;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lvswEG2MEMgg4mNzsuL0uRhvX1GUmpngDXemfCWI2+Y=;
  b=VAU48sNwEkxHhr543ia97cAAmOCuDR7Yj7rgRo5OieUtG3uguMKfCQun
   cw3yyXYIcA3XxvjUr4xFy5DReAsN76cohy2Og1axmLRGWFkhfu5lJy38V
   Zk4Fa1uQ9t89pTSW4xN7ADTA+cGgobx6ZiyI09FzWJzD3DQcpFtBS9VVi
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: +E1KJLph8b3VPchHHtSA9U6zbm7shbOvPErQRtkWV2DS+DOgb6+K9Sxns+wAMqSJf+mKS7UR1T
 8WW2PNErKAHgXrqCd1XEyD0xl3iaWS32BAjds4MazBUwl1zwGQjkuR4zO7JbqYN0KG2r8suypv
 O21HwnNpOWxc8yMhyjHOCF4GOAZ0k1JCQFQdjac5UYRahSKca5oHzPy2Al+60WjG2vQ3VAEydZ
 +7V2U6Fze/gwyRt15xBIGLzNKaIBvdtzQKStOrtdrbH1uic7vwvFAGpaBqH6oV4mgZHiirZ+33
 iobJSDFmabgIxPXtbS8w14/t
X-SBRS: 5.1
X-MesageID: 54940701
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:aUht/6x8L+5ruiKBG4d6t+f+wSrEfRIJ4+MujC+fZmUNrF6WrkUAx
 jBOWTqAbK2JYmDwLYh/OomwpBsGsZDXzodjTQE5pCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAsLeNYYH1500s6w7dg2tQAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9po4
 9RosoSNdR9zZIjCpORGXURbGhgraMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY25wfQa6BP
 5NxhTxHQi7dbhBxIQ0rFLkcreyxvWKuUBlqkQfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYWQvFRNuoi1T2VkPDx7TqZXWZZTTd4PYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOcjdcPX5soR8tpoC5+tlq302nosNLSfbt1rXI9SfML
 ydmRcTUr44YitIXzO2F9FTDjiPESnPhH1NtuFu/so5I6GpEiG+Zi26AtQizARVodt/xory9U
 J4swZX2AAcmV8DlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkyaZZVIWCwO
 RON4mu9AaO/2lPxN8ebhKrrWqwXIVXIT4y5Bpg4kPIfCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGOqdRNcgtQcSRibX00wuQOHtO+zsNdMDlJI5fsLXkJIeSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:TAX/260N9vacc/Xzfbq5SAqjBLYkLtp133Aq2lEZdPUzSL3+qy
 nOpoV+6faQsl0ssR4b9exoVJPufZq+z/5ICOsqU4tKNTOO0AHEEGgI1+rf6gylNyri9vNMkY
 dMGpIObeEY1GIK7voSNjPIceod/A==
X-IronPort-AV: E=Sophos;i="5.85,365,1624334400"; 
   d="scan'208";a="54940701"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/pv: Split pv_hypercall() in two
Date: Mon, 11 Oct 2021 19:05:41 +0100
Message-ID: <20211011180541.24501-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211011180541.24501-1-andrew.cooper3@citrix.com>
References: <20211011180541.24501-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The is_pv_32bit_vcpu() conditionals hide four lfences, with two taken on any
individual path through the function.  There is very little code common
between compat and native, and context-dependent conditionals predict very
badly for a period of time after context switch.

Move do_entry_int82() from pv/traps.c into pv/hypercall.c, allowing
_pv_hypercall() to be static and forced inline.  The delta is:

  add/remove: 0/0 grow/shrink: 1/1 up/down: 300/-282 (18)
  Function                                     old     new   delta
  do_entry_int82                                50     350    +300
  pv_hypercall                                 579     297    -282

which is tiny, but the perf implications are large:

  Guest | Naples | Milan  | SKX    | CFL-R  |
  ------+--------+--------+--------+--------+
  pv64  |  17.4% |  15.5% |   2.6% |   4.5% |
  pv32  |   1.9% |  10.9% |   1.4% |   2.5% |

These are percentage improvements in raw TSC detlas for a xen_version
hypercall, with obvious outliers excluded.  Therefore, it is an idealised best
case improvement.

The pv64 path uses `syscall`, while the pv32 path uses `int $0x82` so
necessarily has higher overhead.  Therefore, dropping the lfences is less over
an overall improvement.

I don't know why the Naples pv32 improvement is so small, but I've double
checked the numbers and they're correct.  There's something we're doing which
is a large overhead in the pipeline.

On the Intel side, both systems are writing to MSR_SPEC_CTRL on
entry/exit (SKX using the retrofitted microcode implementation, CFL-R using
the hardware implementation), while SKX is suffering further from XPTI for
Meltdown protection.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/pv/hypercall.c | 24 +++++++++++++++++++-----
 xen/arch/x86/pv/traps.c     | 11 -----------
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/pv/hypercall.c b/xen/arch/x86/pv/hypercall.c
index 9765e674cf60..3579ba905c1c 100644
--- a/xen/arch/x86/pv/hypercall.c
+++ b/xen/arch/x86/pv/hypercall.c
@@ -23,6 +23,7 @@
 #include <xen/hypercall.h>
 #include <xen/nospec.h>
 #include <xen/trace.h>
+#include <asm/apic.h>
 #include <asm/multicall.h>
 #include <irq_vectors.h>
 
@@ -109,15 +110,15 @@ const pv_hypercall_table_t pv_hypercall_table[] = {
 #undef COMPAT_CALL
 #undef HYPERCALL
 
-void pv_hypercall(struct cpu_user_regs *regs)
+/* Forced inline to cause 'compat' to be evaluated at compile time. */
+static void always_inline
+_pv_hypercall(struct cpu_user_regs *regs, bool compat)
 {
     struct vcpu *curr = current;
-    unsigned long eax;
+    unsigned long eax = compat ? regs->eax : regs->rax;
 
     ASSERT(guest_kernel_mode(curr, regs));
 
-    eax = is_pv_32bit_vcpu(curr) ? regs->eax : regs->rax;
-
     BUILD_BUG_ON(ARRAY_SIZE(pv_hypercall_table) >
                  ARRAY_SIZE(hypercall_args_table));
 
@@ -137,7 +138,7 @@ void pv_hypercall(struct cpu_user_regs *regs)
 
     curr->hcall_preempted = false;
 
-    if ( !is_pv_32bit_vcpu(curr) )
+    if ( !compat )
     {
         unsigned long rdi = regs->rdi;
         unsigned long rsi = regs->rsi;
@@ -348,8 +349,21 @@ void pv_ring1_init_hypercall_page(void *p)
         *(u8  *)(p+ 7) = 0xc3;    /* ret */
     }
 }
+
+void do_entry_int82(struct cpu_user_regs *regs)
+{
+    if ( unlikely(untrusted_msi) )
+        check_for_unexpected_msi((uint8_t)regs->entry_vector);
+
+    _pv_hypercall(regs, true /* compat */);
+}
 #endif
 
+void pv_hypercall(struct cpu_user_regs *regs)
+{
+    _pv_hypercall(regs, false /* native */);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
index 764773c02104..1e05a9f1cdad 100644
--- a/xen/arch/x86/pv/traps.c
+++ b/xen/arch/x86/pv/traps.c
@@ -24,22 +24,11 @@
 #include <xen/lib.h>
 #include <xen/softirq.h>
 
-#include <asm/apic.h>
 #include <asm/pv/trace.h>
 #include <asm/shared.h>
 #include <asm/traps.h>
 #include <irq_vectors.h>
 
-#ifdef CONFIG_PV32
-void do_entry_int82(struct cpu_user_regs *regs)
-{
-    if ( unlikely(untrusted_msi) )
-        check_for_unexpected_msi((uint8_t)regs->entry_vector);
-
-    pv_hypercall(regs);
-}
-#endif
-
 void pv_inject_event(const struct x86_event *event)
 {
     struct vcpu *curr = current;
-- 
2.11.0


