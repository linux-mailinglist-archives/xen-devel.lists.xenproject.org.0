Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA284B516D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:17:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271986.466784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbE7-0007bS-0T; Mon, 14 Feb 2022 13:17:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271986.466784; Mon, 14 Feb 2022 13:17:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbE6-0007Rq-Mx; Mon, 14 Feb 2022 13:17:10 +0000
Received: by outflank-mailman (input) for mailman id 271986;
 Mon, 14 Feb 2022 13:17:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4a-0008IH-4W
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:07:20 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 095611f6-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:07:18 +0100 (CET)
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
X-Inumbo-ID: 095611f6-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aoU1tlx3/7aKi+MsHLxvtpIMc2l5mgsFiREtPDfU0UA=;
  b=NknLRxWQTo0jT/I6xWYXDTnmbQ8+DINujBwbqTaJE8V75uoeeUoA4gJP
   Gaxe2t6ZDcoaGhlkGbhjMq9uEgr4Wb2s4oiUOzWjulfsA8e023O8nREts
   yGyk0zT1ERKa7rupWbsQdDVZTbumERexSZRP3IEpiGtEpkwJo1rl/pe7H
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: yZ/WHagyhkmgZH6D/G6afvcrch+YSiqNBZREZVVz8msHnzsKLXfI+mDHdHRoVFlkGAZ1qjZFZx
 zQiokczxcLCoeLkhlx3zXBgvgQD4yow7vdsgzhrPAT3up8x0y0g7qOX2vcXKzKhhMDzXY6Ga6H
 h7U7OQqWIx1cVA7q/g2JwgSYMFxeXUudRzkNUH4rAita1abD//RYph06KlptLlM9f0cN2o+4Vf
 Rwb1MD3ZYNGiSuvo+QIEjA9AEp0LM7Iqx/VGSZ7xt2ZZfkbpA4aywwKAw3Fu5yLEXObOcNE3Cv
 f7IlpOmPvSKjGyAIJvnKCiMD
X-SBRS: 5.1
X-MesageID: 64554404
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Au+0GqtXFkkzplbLcH5d5PcgbufnVG9ZMUV32f8akzHdYApBsoF/q
 tZmKW6PO62IZmr3Lo1+b9i2pElS75PVztdlHgY6ryBmFX8X+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHdJZS5LwbZj2NYy2IThWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npl7rWaEgx4brT1lac/WTJzIRBdGZBWweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 5dENWY3MHwsZTUIF3QzDrVugt26qVfYaRZbhE+Nh4kOtj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO7YTwlqGm/rN2gvaJGIvZQxwS/gbpPZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtAKzARVodt/xory9U
 J8swZb20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4MvG4udBo0ap9fI1cFh
 XM/XisLuvdu0IaCN/crM+pd9ex2pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Ba5rUm00HCrWWj+u+2dd7EG3m5EMTXfjew/G7vMbafFQO9LgJB6CDzLU/VZZimqgJxO7E8
 mvkAh1TyUblhG2BIgKPMygxZLTqVJd5jHQ6IS1zYgr4hyl9Od6ivPUFap86Xbg77+g/n/R6e
 OYIJpebCfNVRzWZpzlENcvhrJZvfQiAjB6VO3b3eyA2epNtHlSb+tLtcgb12jMJCy676Zk3r
 7G6j1uJSpsfXQVySs3Rbav3nV+2uHEcnsN0XlfJfYYPKBm9rtAyJnWo3PEtIswKJRHS/Reg1
 l6bUUUCuO3Ag44p692V16qKmJikTrllFU1AEmiFsbvvbXvG/nCuyJNrWfqTeWyPT3v9/aiva
 LkHz/z4N/Fbzl9Gv5AlTuRuxKM6odDuu6Vb3kJvG3CSNwanDbZpI3+n28hTt/ISmu8F6FXuA
 k/fqMNHPbipOd/+FA9DLQUoWe2PyPUIl2SA9v8yOkj7uHd68bfvvZ++5PVQZPix9IdIDb4=
IronPort-HdrOrdr: A9a23:6a/Zlao2AYSbUfE5zhv9VCgaV5opeYIsimQD101hICG8cqSj+f
 xG/c5rrCMc5wxwZJhNo7y90ey7MBbhHP1OkO8s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpM
 BdmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554404"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 65/70] x86/emul: Update emulation stubs to be CET-IBT compatible
Date: Mon, 14 Feb 2022 12:51:22 +0000
Message-ID: <20220214125127.17985-66-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All indirect branches need to land on an endbr64 instruction.

For stub_selftests(), use endbr64 unconditionally for simplicity.  For ioport
and instruction emulation, add endbr64 conditionally.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Use local endbr64 define rather than raw opcodes in stub_selftest()
v1.1:
 * Update to use endbr helpers
---
 xen/arch/x86/extable.c         | 12 +++++++-----
 xen/arch/x86/pv/emul-priv-op.c |  7 +++++++
 xen/arch/x86/x86_emulate.c     | 13 +++++++++++--
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/extable.c b/xen/arch/x86/extable.c
index 4d1875585f9d..4913c4a6dd5d 100644
--- a/xen/arch/x86/extable.c
+++ b/xen/arch/x86/extable.c
@@ -129,20 +129,22 @@ search_exception_table(const struct cpu_user_regs *regs)
 static int __init cf_check stub_selftest(void)
 {
     static const struct {
-        uint8_t opc[4];
+        uint8_t opc[8];
         uint64_t rax;
         union stub_exception_token res;
     } tests[] __initconst = {
-        { .opc = { 0x0f, 0xb9, 0xc3, 0xc3 }, /* ud1 */
+#define endbr64 0xf3, 0x0f, 0x1e, 0xfa
+        { .opc = { endbr64, 0x0f, 0xb9, 0xc3, 0xc3 }, /* ud1 */
           .res.fields.trapnr = TRAP_invalid_op },
-        { .opc = { 0x90, 0x02, 0x00, 0xc3 }, /* nop; add (%rax),%al */
+        { .opc = { endbr64, 0x90, 0x02, 0x00, 0xc3 }, /* nop; add (%rax),%al */
           .rax = 0x0123456789abcdef,
           .res.fields.trapnr = TRAP_gp_fault },
-        { .opc = { 0x02, 0x04, 0x04, 0xc3 }, /* add (%rsp,%rax),%al */
+        { .opc = { endbr64, 0x02, 0x04, 0x04, 0xc3 }, /* add (%rsp,%rax),%al */
           .rax = 0xfedcba9876543210,
           .res.fields.trapnr = TRAP_stack_error },
-        { .opc = { 0xcc, 0xc3, 0xc3, 0xc3 }, /* int3 */
+        { .opc = { endbr64, 0xcc, 0xc3, 0xc3, 0xc3 }, /* int3 */
           .res.fields.trapnr = TRAP_int3 },
+#undef endbr64
     };
     unsigned long addr = this_cpu(stubs.addr) + STUB_BUF_SIZE / 2;
     unsigned int i;
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index c46c072f93db..22b10dec2a6e 100644
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


