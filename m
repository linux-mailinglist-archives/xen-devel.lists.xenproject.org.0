Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E73A64DC386
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 11:02:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291463.494670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUmxq-0006AD-0c; Thu, 17 Mar 2022 10:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291463.494670; Thu, 17 Mar 2022 10:02:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUmxp-00067q-Tf; Thu, 17 Mar 2022 10:02:37 +0000
Received: by outflank-mailman (input) for mailman id 291463;
 Thu, 17 Mar 2022 10:02:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hAZZ=T4=citrix.com=prvs=068f51ced=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUmxo-00067k-TT
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 10:02:37 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d1fa310-a5d9-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 11:02:34 +0100 (CET)
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
X-Inumbo-ID: 5d1fa310-a5d9-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647511354;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QOkGG/mkDiGgS/npBNx/ai2OE1b789ixepmDnoSfjrY=;
  b=cgl71R/fgdgA+Nr7ZSXC1BdyQNlyCu1PFS5NmC5YnbQUko4DOnhw/gYD
   06HFX98KLN7rTTwVLl5jDJ4/+IWWZm2M/QmitJt4cgkUtXagEOwcX0cDo
   k57u5pAseHuwoa2LJehhds7oAPNdLS79sBlUOTSR8TaPREwfpjKRF35hU
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 66883879
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/0sDm6Ny8fICY/vvrR2Vl8FynXyQoLVcMsEvi/4bfWQNrUpz3jQCz
 jMXXjyBP/jeM2D3ctx1Pdix/ENS7Z/dyNViTQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi29Ew27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z+
 e1OuZa5cxwQMI7Jh+QWbj5/FghiBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gQQ6aOP
 JpGOFKDajz7cSIIBggQLqscv/WuvyLAWD1irVO88P9fD2/7k1UqjemF3MDuUtCNSM9Ymm6Ro
 2vU+GK/DhxyHNmc1BKM93u+gemJkS6TcIcKE728//VpqFSWz34UDlsaWDOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jY+cddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQXO
 kShxo2zQ2Y16fvMFCzbpuz8QS6O1TY9HFcBaSUNdxA87frmv4E4szXoS/9/Kfvg5jHqIg3Yz
 zePpSk4orwci88Xyqm2lWz6byKQSovhFVBsuFiONo6xxkYgPdP+OdT0gbTOxawYRLt1WGVtq
 5TtdyK2yOkVRa+AmyWWKAnmNOH4vq3VWNEwbLMGInXAy9hP0yP7FWyzyGsnTKuMDiriUWW1C
 KM0kVkNjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwORHMgj+0yhZ0zvxX1
 XKnnSCEVypy5UNPlmbeegvg+eVzmnBWKZ37GPgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 403Cid+8D0GCLeWSnCOqeY7dAlWRVBmVcGeg5EGLYarf1s5cFzN/teMmNvNjaQ+xP8L/goJl
 1ngMnJlJK3X3iSWd1/VNig9NNsCn/9X9BoGAMDlBn7ws1BLXGplxP53m0cfFVX/yNFe8A==
IronPort-HdrOrdr: A9a23:+tcvV61puvCwmsRnm+23WwqjBLwkLtp133Aq2lEZdPRUGvb4qy
 nIpoV86faUskd3ZJhOo6HiBEDtexzhHP1OkO0s1NWZLWvbUQKTRekIh+aP/9SJIVyGygc378
 ddmsZFZuEYdWIK6PrH3A==
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="66883879"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Bjoern Doebel
	<doebel@amazon.de>, Michael Kurth <mku@amazon.de>, Martin Pohlack
	<mpohlack@amazon.de>
Subject: [PATCH] x86/cet: Use dedicated NOP4 for cf_clobber
Date: Thu, 17 Mar 2022 10:02:04 +0000
Message-ID: <20220317100204.16391-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For livepatching, we need to look at a potentially clobbered function and
determine whether it used to have an ENDBR64 instruction.

Use a non-default 4-byte P6 long nop, not emitted by toolchains, and extend
check-endbr.sh to look for it.

The choice of nop has some complicated consequences.  nopw (%rax) has a ModRM
byte of 0, which the Bourne compatible shells unconditionally strip from
parameters, meaning that we can't pass it to `grep -aob`.

Therefore, use nopw (%rcx) so the ModRM byte becomes 1.

This then demonstrates another bug.  Under perl regexes, \1 thru \9 are
subpattern matches, and not octal escapes.  Switch the `grep -P` runes to use
hex escapes instead.

The build time check then requires that the endbr64 poison have the same
treatment as endbr64 to avoid placing the byte pattern in immediate operands.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Bjoern Doebel <doebel@amazon.de>
CC: Michael Kurth <mku@amazon.de>
CC: Martin Pohlack <mpohlack@amazon.de>

v2:
 * Check for the poison byte pattern in check-endbr.sh
 * Use nopw (%rcx) to work around shell NUL (mis)features
 * Use hex escapes to work around Perl subpattern matches

Jan: As you had the buggy grep, can you please confirm that hex escapes work.
---
 xen/arch/x86/alternative.c       |  2 +-
 xen/arch/x86/include/asm/endbr.h | 26 ++++++++++++++++++++++++++
 xen/tools/check-endbr.sh         | 12 +++++++-----
 3 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index d41eeef1bcaf..0c6fc7b4fb0c 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -362,7 +362,7 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
             if ( !is_kernel_text(ptr) || !is_endbr64(ptr) )
                 continue;
 
-            add_nops(ptr, ENDBR64_LEN);
+            place_endbr64_poison(ptr);
             clobbered++;
         }
 
diff --git a/xen/arch/x86/include/asm/endbr.h b/xen/arch/x86/include/asm/endbr.h
index 6090afeb0bd8..d946fac13130 100644
--- a/xen/arch/x86/include/asm/endbr.h
+++ b/xen/arch/x86/include/asm/endbr.h
@@ -52,4 +52,30 @@ static inline void place_endbr64(void *ptr)
     *(uint32_t *)ptr = gen_endbr64();
 }
 
+/*
+ * After clobbering ENDBR64, we may need to confirm that the site used to
+ * contain an ENDBR64 instruction.  Use an encoding which isn't the default
+ * P6_NOP4.  Specifically, nopw (%rcx)
+ */
+static inline uint32_t __attribute_const__ gen_endbr64_poison(void)
+{
+    uint32_t res;
+
+    asm ( "mov $~0x011f0f66, %[res]\n\t"
+          "not %[res]\n\t"
+          : [res] "=&r" (res) );
+
+    return res;
+}
+
+static inline bool is_endbr64_poison(const void *ptr)
+{
+    return *(const uint32_t *)ptr == gen_endbr64_poison();
+}
+
+static inline void place_endbr64_poison(void *ptr)
+{
+    *(uint32_t *)ptr = gen_endbr64_poison();
+}
+
 #endif /* XEN_ASM_ENDBR_H */
diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
index 9799c451a18d..126a2a14d44e 100755
--- a/xen/tools/check-endbr.sh
+++ b/xen/tools/check-endbr.sh
@@ -27,7 +27,7 @@ echo "X" | grep -aob "X" -q 2>/dev/null ||
 # Check whether grep supports Perl regexps. Older GNU grep doesn't reliably
 # find binary patterns otherwise.
 perl_re=true
-echo "X" | grep -aobP "\130" -q 2>/dev/null || perl_re=false
+echo "X" | grep -aobP "\x58" -q 2>/dev/null || perl_re=false
 
 #
 # First, look for all the valid endbr64 instructions.
@@ -45,13 +45,15 @@ echo "X" | grep -aobP "\130" -q 2>/dev/null || perl_re=false
 ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
 
 #
-# Second, look for any endbr64 byte sequence
+# Second, look for any endbr64 or nop4 poison byte sequences
 # This has a couple of complications:
 #
 # 1) Grep binary search isn't VMA aware.  Copy .text out as binary, causing
 #    the grep offset to be from the start of .text.
 #
 # 2) dash's printf doesn't understand hex escapes, hence the use of octal.
+#    `grep -P` on the other hand can interpret hex escapes, and must use them
+#    to avoid \1 thru \9 being interpreted as subpatterns matches.
 #
 # 3) AWK can't add 64bit integers, because internally all numbers are doubles.
 #    When the upper bits are set, the exponents worth of precision is lost in
@@ -67,9 +69,9 @@ eval $(${OBJDUMP} -j .text $1 -h |
 ${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
 if $perl_re
 then
-    LC_ALL=C grep -aobP '\363\17\36\372' $TEXT_BIN
+    LC_ALL=C grep -aobP '\xf3\x0f\x1e\xfa|\x66\x0f\x1f\x01' $TEXT_BIN
 else
-    grep -aob "$(printf '\363\17\36\372')" $TEXT_BIN
+    grep -aob -e "$(printf '\363\17\36\372')" -e "$(printf '\146\17\37\1')" $TEXT_BIN
 fi | awk -F':' '{printf "%s%x\n", "'$vma_hi'", int(0x'$vma_lo') + $1}' > $ALL
 
 # Wait for $VALID to become complete
@@ -90,6 +92,6 @@ nr_bad=$(wc -l < $BAD)
 [ "$nr_bad" -eq 0 ] && exit 0
 
 # Failure
-echo "$MSG_PFX Fail: Found ${nr_bad} embedded endbr64 instructions" >&2
+echo "$MSG_PFX Fail: Found ${nr_bad} embedded endbr64 or poison instructions" >&2
 ${ADDR2LINE} -afip -e $1 < $BAD >&2
 exit 1
-- 
2.11.0


