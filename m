Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F82045EE81
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:05:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232752.403664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauQ-0004xN-By; Fri, 26 Nov 2021 13:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232752.403664; Fri, 26 Nov 2021 13:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqauQ-0004sZ-1J; Fri, 26 Nov 2021 13:04:58 +0000
Received: by outflank-mailman (input) for mailman id 232752;
 Fri, 26 Nov 2021 13:04:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauN-0003W9-E0
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:04:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 718cc36b-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:04:54 +0100 (CET)
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
X-Inumbo-ID: 718cc36b-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931894;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HcmfBpauAYXuC35jOvSCXt5rS/45eJAP/EQh3RsIuyw=;
  b=HzqFQ0t33tKuw/7Z/EhqY51lMi7J767xI0E/RpvygcMftgVDjMQ30780
   1rs/or1bqqEmwWJeVYMqxb8h3mhqCjzScbo53KZB9bc8h/Tc3jF9NPGRe
   dMorJtgIzzisjQlcu5ZsTgmh2Xo2mvNOxRr/12kG65qVJH2y+hyF2QoN8
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EVsLFuAFkDLW+JkrLW9MsUlIohhH3cb3mKa3DRvfjWtMzZ4p2H0dQLac9HgEC8oB9z8k77jkl+
 luFKIHOX0f/AnPAUrrpIO+DjgP2gxtp65MSnU7hxM4fxos0Yv0s/iHVHrk9zHKLc8hJ8pzkjdE
 YKs2BTY9A3KZZaLMC75hyeBFrD+qLtc/Dya+YD4K/9Z3/zHz90wDPtM2CsmaWpgLrSHaMFRkM/
 ndB9S2KBRmf6MserNSewHIPHR0/RpkxwevXohvYBSRRSV2GRO/uh4ByKVB3E6ql9iCy1qQDHit
 4gniXb7ekmfOxqWxPmxLT16H
X-SBRS: 5.1
X-MesageID: 58634951
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:EY52sa1f1bFNsZqlyfbD5R52kn2cJEfYwER7XKvMYLTBsI5bpzICx
 2MbD22Cb6nbNjf1fItzYImx9EMBvJ7VyNJrTAU6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wbBh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhg/5wz
 up2mJmMdF0kAv3JnPosCzcBKnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9t1p4VQaeDP
 qL1bxJDTgnbXwBFCGxPK4AMmur5h1WgcTdH/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKalgIyWtxvKMA/1DzXx5aE5gKHNzAqFwcUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/46SPbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL6D2BLwQKChRqlEGp/ZgLa1
 JTjs5LDhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOu24ueho2Y5paJWSBj
 KrvVeV5v8Q70JyCN/IfXm5MI55ykfiI+SrNCpg4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjlTK7bc2qlHyPjOvBDEN5vJ9YaTNimMhit/jayOgUm
 v4CX/a3J+J3DLejP3KJqNFLdjjn7xETXPjLliCeTcbbSiIOJY3rI6a5LWoJd9M3kqJLuP3P+
 33hCEZUxECm3S/MKBmQa2AlY7TqBM4toXU+NC0qHFCpx3l8Ptr/sPZBL8M6Les96ehu7f9oV
 P1ZKc+ONetCF2bc8DMHYJij8IE7LEa3hRiDNjaOaSQke8IyXBTA/9LpJ1O99CQHAietm9E5p
 rmsilHSTZYZHlwwB8fKcvO/iVi2uCFFyu51WkLJJPhVeVntr9c2e3Cg0KdvLphVexvZxzac2
 wKHOjsipLHA890v7d3EpaGYtIP1QeFwKVVXQjvA5rGsOCiEomf6md1cUPyFdCz2XX/v/Pnwf
 v1cyvzxPaFVnFtOtIYgQb9nwbhnuonqrr5eiA9lAG/KfxKgDbY5eiuK2sxGt6tswL5FuFTpB
 hLTq4cCYbjZatn4FFMxJRY+arXR3P4ZrTDe8PApLRio/yRw5reGDR1fMhTkZPax91ep3FfJG
 dschfM=
IronPort-HdrOrdr: A9a23:VV8wGaEyRdChOKgPpLqE0seALOsnbusQ8zAXP0AYc31om6uj5r
 iTdZUgpGbJYVkqKRIdcLy7V5VoBEmskaKdgrNhW4tKPjOW2ldARbsKheCJrlHd8m/Fh4lgPM
 9bAtND4bbLbWSS4/yV3ODBKadE/OW6
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58634951"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 60/65] x86/emul: Update emulation stubs to be CET-IBT compatible
Date: Fri, 26 Nov 2021 12:34:41 +0000
Message-ID: <20211126123446.32324-61-andrew.cooper3@citrix.com>
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
---
 xen/arch/x86/extable.c         | 14 +++++++++-----
 xen/arch/x86/pv/emul-priv-op.c |  5 +++++
 xen/arch/x86/x86_emulate.c     | 12 ++++++++++--
 3 files changed, 24 insertions(+), 7 deletions(-)

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
index 808ff1873352..51638c8f7273 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -68,6 +68,9 @@ static io_emul_stub_t *io_emul_stub_setup(struct priv_op_ctxt *ctxt, u8 opcode,
      * helpers (non-standard ABI), and one of several possible stubs
      * performing the real I/O.
      */
+    static const char endbr64[] = {
+        0xf3, 0x0f, 0x1e, 0xfa, /* endbr64 */
+    };
     static const char prologue[] = {
         0x53,       /* push %rbx */
         0x55,       /* push %rbp */
@@ -111,6 +114,8 @@ static io_emul_stub_t *io_emul_stub_setup(struct priv_op_ctxt *ctxt, u8 opcode,
 
     p = ctxt->io_emul_stub;
 
+    if ( cpu_has_xen_ibt )
+        APPEND_BUFF(endbr64);
     APPEND_BUFF(prologue);
     APPEND_CALL(load_guest_gprs);
 
diff --git a/xen/arch/x86/x86_emulate.c b/xen/arch/x86/x86_emulate.c
index 60191a94dc18..8ba71a577f09 100644
--- a/xen/arch/x86/x86_emulate.c
+++ b/xen/arch/x86/x86_emulate.c
@@ -29,11 +29,19 @@
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
+        memcpy(ptr, "\xf3\x0f\x1e\xfa", 4); /* endbr64 */       \
+        ptr += 4;                                               \
+    }                                                           \
+    ptr;                                                        \
 })
 #define put_stub(stb) ({                                   \
     if ( (stb).ptr )                                       \
-- 
2.11.0


