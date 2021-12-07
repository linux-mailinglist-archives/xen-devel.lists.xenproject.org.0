Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C11546B99B
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 11:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240875.417662 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY6o-0000FL-VD; Tue, 07 Dec 2021 10:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240875.417662; Tue, 07 Dec 2021 10:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muY6o-0000B6-QR; Tue, 07 Dec 2021 10:54:06 +0000
Received: by outflank-mailman (input) for mailman id 240875;
 Tue, 07 Dec 2021 10:54:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WjKu=QY=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1muY6n-0007ZY-IQ
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 10:54:05 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd4fab96-574b-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 11:54:04 +0100 (CET)
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
X-Inumbo-ID: fd4fab96-574b-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638874444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fbig8ZrshkFGK596jPWQZGyoDDWpC3fZiJfWDk+IDGU=;
  b=KIcx92tjufdGfKmXRg09ye9cDaVbXR4t9euHnMx3Km4sUGIBh0rlgDdi
   adKEEK8etJZXxl9H9IkaLeSb1rqBSDpSUAEF98nM4H5zXE8J2Rstxc5/D
   NuE2ssFeTMEO2SO7epIeWoRAk8cJOD4d50owB4aJp8o5ApP1ZcS2KkX0R
   Y=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OWEdGLEuOdn8Ms4IOSKYbFVQOki0Azv0nsLgY5gdxuAnngZ4mmE92Lj2m/dnqSkp6smVumcKEK
 /Uafh8pze9xYxI0w8wK6pG8Y1v0uoTmF6vM7iWTBATByQI6grGG4dYBaNZb8/d5EB3HAjVtgjD
 5kaauncSMaQi93aHjUhQda55xmhcz60GJfkKQLYi0oDLYDWhnbi/rFwQHy4tr6MvI3uYOXPHqK
 CqMTlBGFX8oYFJFyYIPfB3lqSl5VEwlKzhnaLTArd5D6TNmW+1aruXIxQCNYjXpOGEAGaY+4R6
 vF2Tsm/DV4MPjFqcPJTjOrpC
X-SBRS: 5.1
X-MesageID: 58948462
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:t2zT2qMjybxlMUfvrR2dkMFynXyQoLVcMsEvi/4bfWQNrUom0zcDx
 2YeDWqBaKmDMWf1ctglboS09BhU6JfSx9c1QQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6bUsxNbVU8En5400o8w7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYozGooPVIl
 uxEiYCtVV87PqOVxeEQdzANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgWdh2pASQ6y2i
 8wxSQFfcxH6Oxt0JmgaNbRhlcOvpFWmWmgNwL6SjfVuuDWCpOBr65DyNPLFd9rMQt9a9m66j
 G/b+2XyAjkBKceSjzGC9xqEluLJ2C/2Ro8WPLm57eJxxk2ewHQJDx8bXkf9puO24nNSQPoGd
 RZSoHB36/Fvqgr7FbERQiFUvlaAnyE5YoRpGtEm9R3V2KraulucC0wtG2sphMMdiOc6Qjkj1
 1msltzvBCByvLD9dU9x5ot4vhvpZ3FLcDZqiTssCFJcvoK9+N1bYgfnF447SMaIYsvJ9SYcK
 txghAw3nP0tgMECzM1XFniX0mv39vAlouPYjzg7v15JDCslNeZJhKTysDA3CMqsy67DETG8U
 IAswZT20Qz3JcjleNaxaOsMBqq1wP2OLSfRh1Vid7F4qW/9qyf9I9gKuG0gTKuMDirjUWW2C
 HI/RCsLvMMDVJdURfEfj32N5zQCkvG7SIWNugH8ZdtSeJlhHDJrDwk1DXN8K1vFyRB2+YlmY
 M/zWZ/1UR4yVPQ2pBLrFrx1+eJ6mUgDKZb7GMmTI+KPiuHFOhZ4iN4tbTOzUwzOxP/e/ViOr
 Y8Ab5DiJtc2eLSWXxQ7OLU7dTgiRUXXz7iv8aS7r8aPfVhrHn8PEfjUze9zcoBphf0NxOzJ4
 mu8SglTz1+m3S/LLgCDa3ZCbrLzXMkg8SJnbHJ0ZVv4iWI+ZYuP7bsEc8dld7cQ6+E+n+V/S
 OMIepvcD60XGCjH4TkUcbL0sJdmKEawnQuLMif8OGo/cpdsShbn4NjhegezpiACAjDu7Zk1o
 qG61xOdSp0GHlwwAMHTYfOp7lWwoXlCx74iAxqWeoFeIRy+/pJrJir9iu4MD/sNcRiTlCGH0
 wu2AAsDobWfqYEC79SU17uPqJ2kErUiExMCTXXb97u/KQLT4nGnnd1bSO+NcD3QCDH09aGla
 bkHxv3wKqRazlNDso46GLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+8LoxayV
 2KO5sJeaOeAN87SGVIMIBYoM7aY3vYOlziOtfk4LS0WPsOsEGZrhamKAySxtQ==
IronPort-HdrOrdr: A9a23:54NIH6rPXRN33PNiKsPkMKQaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rrCMc6QxhPk3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaXN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.87,293,1631592000"; 
   d="scan'208";a="58948462"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] x86/boot: Don't double-copy the stack during physical relocation
Date: Tue, 7 Dec 2021 10:53:39 +0000
Message-ID: <20211207105339.28440-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211207105339.28440-1-andrew.cooper3@citrix.com>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

cpu0_stack is contained within .data, which means the memcpy() already takes a
snapshot at the start of the critical region.

Later, when we switch to the relocated Xen, we do end up losing updates to the
local variables, but that's fine because the only variables we've modified go
out of scope after the printk().  Use this properly to avoid copying the whole
stack (32k) a second time.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Ever so slightly RFC, as it has only had light testing, but I'm confident in
the reasoning.
---
 xen/arch/x86/setup.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index a6ff450daab7..c04c68a09b47 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1183,6 +1183,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
             l3_pgentry_t *pl3e;
             l2_pgentry_t *pl2e;
             int i, j, k;
+            unsigned long tmp;
 
             /* Select relocation address. */
             xen_phys_start = end - reloc_size;
@@ -1193,7 +1194,8 @@ void __init noreturn __start_xen(unsigned long mbi_p)
              * Perform relocation to new physical address.
              * Before doing so we must sync static/global data with main memory
              * with a barrier(). After this we must *not* modify static/global
-             * data until after we have switched to the relocated pagetables!
+             * data, or locals that need to survive, until after we have
+             * switched to the relocated pagetables!
              */
             barrier();
             memcpy(__va(__pa(_start)), _start, _end - _start);
@@ -1239,18 +1241,21 @@ void __init noreturn __start_xen(unsigned long mbi_p)
                 *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) + xen_phys_start);
             }
 
-            /* Re-sync the stack and then switch to relocated pagetables. */
+            /*
+             * Switch to relocated pagetables.  This also discards updates to
+             * any local variables since the memmove() call above, but that's
+             * fine because we don't use any of them again.
+             */
             asm volatile (
-                "rep movsq        ; " /* re-sync the stack */
-                "movq %%cr4,%%rsi ; "
-                "andb $0x7f,%%sil ; "
-                "movq %%rsi,%%cr4 ; " /* CR4.PGE == 0 */
-                "movq %[pg],%%cr3 ; " /* CR3 == new pagetables */
-                "orb $0x80,%%sil  ; "
-                "movq %%rsi,%%cr4   " /* CR4.PGE == 1 */
-                : "=&S" (i), "=&D" (i), "=&c" (i) /* All outputs discarded. */
-                :  [pg] "r" (__pa(idle_pg_table)), "0" (cpu0_stack),
-                   "1" (__va(__pa(cpu0_stack))), "2" (STACK_SIZE / 8)
+                "mov    %%cr4, %[cr4]\n\t"
+                "andb   $~%c[pge], %b[cr4]\n\t"
+                "mov    %[cr4], %%cr4\n\t"     /* CR4.PGE = 0 */
+                "mov    %[cr3], %%cr3\n\t"     /* CR3 = new pagetables */
+                "orb    $%c[pge], %b[cr4]\n\t"
+                "mov    %[cr4], %%cr4\n\t"     /* CR4.PGE = 1 */
+                : [cr4] "=&a" (tmp) /* Could be "r", but "a" makes better asm */
+                : [cr3] "r" (__pa(idle_pg_table)),
+                  [pge] "i" (X86_CR4_PGE)
                 : "memory" );
 
             printk("New Xen image base address: %#lx\n", xen_phys_start);
-- 
2.11.0


