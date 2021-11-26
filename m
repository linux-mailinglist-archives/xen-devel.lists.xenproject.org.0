Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0539245F242
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 17:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233242.404598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqeEf-0001AA-1d; Fri, 26 Nov 2021 16:38:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233242.404598; Fri, 26 Nov 2021 16:38:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqeEe-000175-Tp; Fri, 26 Nov 2021 16:38:04 +0000
Received: by outflank-mailman (input) for mailman id 233242;
 Fri, 26 Nov 2021 16:38:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqeEd-00016T-H3
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 16:38:03 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3798379d-4ed7-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 17:38:01 +0100 (CET)
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
X-Inumbo-ID: 3798379d-4ed7-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637944681;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3/NSMBOP/JTQOyrzYRs/g6kXzLCntN/islndZqobP2A=;
  b=fHTEOc5bsGQR/2ghLjq12c9Ysde2RrWLIZD+PvjpMSdd8tx1ldQALi7m
   UR7CrSZ4ZcabtZAh+quoUhNypWg9b4yyzMYCqgeqF8VtOJT3Jt1DMu8Vo
   U7LUwInHWF0X9mxKNHsT+5Nw8xvZWoB8Bir3YU7WErPPJM1ryuKDSWa8E
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: gP0vgzTaE3WaM/cuUgl+CufkQG5kFJBtOQLSYtnjRVimZhPkhfI9r1CKRblfJ2Siwlzp7lk5Pi
 uqGf2I9Q/Lq+iQQ2Uk4JVQ766DJBFeeTnMip0FCo15yLXhcIwIAtjOn2Nmsc/Rr0FwrONfa+lX
 iLd2/OLLlvJXCv7r+Sup18zbPu0co4BlOBa+TZByHDLAQ3cqP02PrPNDChlCDsQyN8VPhxePNk
 QOQD4slsyMrzV9YqNr1WCXBZUB3wle+kWHg1CpiBhqf1yMu6Iq2KXQ6EKzJmlSXhgWKQcag1rT
 yqUbewEqur95krDwC/c94Y4o
X-SBRS: 5.1
X-MesageID: 58647550
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CDflPq3zkrkNgO6zh/bD5R52kn2cJEfYwER7XKvMYLTBsI5bpzQGz
 TYfC2vVbKyDMWfzfd8kYNzl8R5TuMXWztY1TgU5pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wbBh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhg+8t2
 NUUmr6KaiQ3OIz2we4NWSJgHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t1p4SQquDP
 6L1bxIxQyzfQyVkFm4KS7cDmb+4gmikbjRx/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalgIjB8pQSsIY0iKu1Kz12V+TFmI/djEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/46SPbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL6D2BLwQKChRqlEGp/ZgLa1
 JTjs5LDhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOu24ueho2Y5paJWSBj
 KrvVeV5v8Q70JyCN/IfXm5MI55ykfiI+SrNCpg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3DLejP3KJqNFLdjjn7xETXPjLliCeTcbbSiIOJY3rI6W5LWoJd9M3kqJLuP3P+
 33hCEZUxECm3S/MKBmQa2AlY7TqBM4toXU+NC0qHFCpx3l8Ptr/sPZBL8M6Les96ehu7f9oV
 P1ZKc+ONetCF2bc8DMHYJij8IE7LEa3hRiDNjaOaSQke8IyXBTA/9LpJ1O99CQHAietm9E5p
 rmsilHSTZYZHlwwB8fKcvO/iVi2uCFFyu51WkLJJPhVeVntr9c2e3Cg0KdvLphVexvZxzac2
 wKHOjsipLHA890v7d3EpaGYtIP1QeFwKVVXQjvA5rGsOCiEomf6md1cUPyFdCz2XX/v/Pnwf
 v1cyvzxPaFVnFtOtIYgQb9nwbhnuonqrr5eiA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjZatn4FFMxJRY+arXR3P4ZrTDe8PApLRio/yRw5reGDR1fMhTkZPax91ep3FfJG
 dschfM=
IronPort-HdrOrdr: A9a23:gDK2b62eaXLx2f9WTua6YgqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoVj6faUskd2ZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOcOEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58647550"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v1.1 60/65] x86/emul: Update emulation stubs to be CET-IBT compatible
Date: Fri, 26 Nov 2021 16:37:14 +0000
Message-ID: <20211126163714.28870-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All indirect branches need to land on an endbr64 instruction.

For stub_selftests(), use endbr64 unconditionally for simplicity.  For ioport
and instruction emulation, add endbr64 conditionally.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Update to use endbr helpers
---
 xen/arch/x86/extable.c         | 14 +++++++++-----
 xen/arch/x86/pv/emul-priv-op.c |  7 +++++++
 xen/arch/x86/x86_emulate.c     | 13 +++++++++++--
 3 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 4aa1ab4b2a45..25c6fda00d28 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -129,19 +129,23 @@ search_exception_table(const struct cpu_user_regs *regs)
 static int __init cf_check stub_selftest(void)
 {
     static const struct {
-        uint8_t opc[4];
+        uint8_t opc[8];
         uint64_t rax;
         union stub_exception_token res;
     } tests[] __initconst = {
-        { .opc = { 0x0f, 0xb9, 0xc3, 0xc3 }, /* ud1 */
+        { .opc = { 0xf3, 0x0f, 0x1e, 0xfa,   /* endbr64 */
+                   0x0f, 0xb9, 0xc3, 0xc3 }, /* ud1 */
           .res.fields.trapnr = TRAP_invalid_op },
-        { .opc = { 0x90, 0x02, 0x00, 0xc3 }, /* nop; add (%rax),%al */
+        { .opc = { 0xf3, 0x0f, 0x1e, 0xfa,   /* endbr64 */
+                   0x90, 0x02, 0x00, 0xc3 }, /* nop; add (%rax),%al */
           .rax = 0x0123456789abcdef,
           .res.fields.trapnr = TRAP_gp_fault },
-        { .opc = { 0x02, 0x04, 0x04, 0xc3 }, /* add (%rsp,%rax),%al */
+        { .opc = { 0xf3, 0x0f, 0x1e, 0xfa,   /* endbr64 */
+                   0x02, 0x04, 0x04, 0xc3 }, /* add (%rsp,%rax),%al */
           .rax = 0xfedcba9876543210,
           .res.fields.trapnr = TRAP_stack_error },
-        { .opc = { 0xcc, 0xc3, 0xc3, 0xc3 }, /* int3 */
+        { .opc = { 0xf3, 0x0f, 0x1e, 0xfa,   /* endbr64 */
+                   0xcc, 0xc3, 0xc3, 0xc3 }, /* int3 */
           .res.fields.trapnr = TRAP_int3 },
     };
     unsigned long addr = this_cpu(stubs.addr) + STUB_BUF_SIZE / 2;
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 808ff1873352..e35cb4b8669d 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -26,6 +26,7 @@
 
 #include <asm/amd.h>
 #include <asm/debugreg.h>
+#include <asm/endbr.h>
 #include <asm/hpet.h>
 #include <asm/hypercall.h>
 #include <asm/mc146818rtc.h>
@@ -111,6 +112,12 @@ static io_emul_stub_t *io_emul_stub_setup(struct priv_op_ctxt *ctxt, u8 opcode,
 
     p = ctxt->io_emul_stub;
 
+    if ( cpu_has_xen_ibt )
+    {
+        place_endbr64(p);
+        p += 4;
+    }
+
     APPEND_BUFF(prologue);
     APPEND_CALL(load_guest_gprs);
 
diff --git a/xen/arch/x86/x86_emulate.c b/xen/arch/x86/x86_emulate.c
index 60191a94dc18..720740f29b84 100644
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -17,6 +17,7 @@
 #include <asm/xstate.h>
 #include <asm/amd.h> /* cpu_has_amd_erratum() */
 #include <asm/debugreg.h>
+#include <asm/endbr.h>
 
 /* Avoid namespace pollution. */
 #undef cmpxchg
@@ -29,11 +30,19 @@
         cpu_has_amd_erratum(&current_cpu_data, AMD_ERRATUM_##nr)
 
 #define get_stub(stb) ({                                        \
+    void *ptr;                                                  \
     BUILD_BUG_ON(STUB_BUF_SIZE / 2 < MAX_INST_LEN + 1);         \
     ASSERT(!(stb).ptr);                                         \
     (stb).addr = this_cpu(stubs.addr) + STUB_BUF_SIZE / 2;      \
-    memset(((stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn)))) +  \
-           ((stb).addr & ~PAGE_MASK), 0xcc, STUB_BUF_SIZE / 2);        \
+    (stb).ptr = map_domain_page(_mfn(this_cpu(stubs.mfn))) +    \
+        ((stb).addr & ~PAGE_MASK);                              \
+    ptr = memset((stb).ptr, 0xcc, STUB_BUF_SIZE / 2);           \
+    if ( cpu_has_xen_ibt )                                      \
+    {                                                           \
+        place_endbr64(ptr);                                     \
+        ptr += 4;                                               \
+    }                                                           \
+    ptr;                                                        \
 })
 #define put_stub(stb) ({                                   \
     if ( (stb).ptr )                                       \
-- 
2.11.0


