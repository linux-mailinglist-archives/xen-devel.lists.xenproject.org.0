Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98BB4DC85D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:06:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291606.495038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqm0-00040U-Cz; Thu, 17 Mar 2022 14:06:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291606.495038; Thu, 17 Mar 2022 14:06:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqm0-0003ye-8q; Thu, 17 Mar 2022 14:06:40 +0000
Received: by outflank-mailman (input) for mailman id 291606;
 Thu, 17 Mar 2022 14:06:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hAZZ=T4=citrix.com=prvs=068f51ced=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nUqly-0003yY-Vi
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:06:38 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7501439d-a5fb-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 15:06:37 +0100 (CET)
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
X-Inumbo-ID: 7501439d-a5fb-11ec-853c-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647525997;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2oDBgP9ZstjxHtvjS2AzV+OyJzvdnX17JYruJ+eUj50=;
  b=TYsX8RET/OZ7EVKyKI+wqZgKfSBA9wDujCG0LAsOTS6euEHAiCSUx0lI
   uscZeq0AMrZKTcIQ4i8JWRXUa0IOT0mvCEs2WkFDPws3T2dMMjO/3cGVy
   9q8l9gaSa37NSH/tm8LmrDlfAFJYmCaFu0RpzkjGbfKbX8Cjrd+nu3FEl
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65968955
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Nx4eHqzJ40v54nnE9Wl6t+cHxirEfRIJ4+MujC+fZmUNrF6WrkVVy
 jMbWm6BOPzYYjH1fd5xb9m+90hU75bSzYRgTQI++yAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NYz2IfhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpllKSPWTl0F7PwyM8yXh9GEBBPL7N/9+qSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AO
 ptHOWsyMXwsZTVgEXoHDcsHhdyHuVDwaTZ960KWoZEetj27IAtZj+G2bYu9lsaxbclSk0yVo
 krP+m3rBRdcONH34T+G71qlg+bdmiW9VI96PLig8f5uiVaQ7mUWAQ8RUx23rJGRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+nS/Wja1TUpwXEqRBc7XTVYysff8KocgxTRTedSArCMgYigcd3v+
 AyioC87jrQVqMcE0aSn4FzK6w6RSoj1oh0dvVuOAD/8hu9tTMv8PtHztwCHhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVd0IiN2dDB0wWirhRdMPS
 BWP0e+2zMUPVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOgz+xzRd1y/9nZ
 srznSOQ4ZAyU/gPIN2eHbt17FPW7npmmTO7qW7TknxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Di9vmra8WnOnO/2ddKdTgidCFnbbir+50/XrPSeWJORTB+Y8I9NJt8IuSJaYwOzbyWl
 px8M2cFoGfCaYrvclzbNCo8NOuxAf6SbxsTZEQRALph4FB7Ca7H0UvVX8FfkWUPnAC78cNJc
 g==
IronPort-HdrOrdr: A9a23:2qsWLaqJWBmAEXWPSNI/LE4aV5oleYIsimQD101hICG9E/bo8/
 xG+c5x6faaslossR0b9uxoW5PhfZq/z/BICOAqVN/JMTUO01HIEKhSqafk3j38C2nf24dmpM
 JdmnFFeb7N5I5B/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.90,188,1643691600"; 
   d="scan'208";a="65968955"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Bjoern Doebel
	<doebel@amazon.de>, Michael Kurth <mku@amazon.de>, Martin Pohlack
	<mpohlack@amazon.de>
Subject: [PATCH v3] x86/cet: Use dedicated NOP4 for cf_clobber
Date: Thu, 17 Mar 2022 14:06:24 +0000
Message-ID: <20220317140624.4258-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

For livepatching, we need to look at a potentially clobbered function and
determine whether it used to have an ENDBR64 instruction.

Use a non-default 4-byte P6 long nop, not emitted by toolchains, and extend
check-endbr.sh to look for it.  The same logic can check for the absence of
any endbr32 instructions, so include a check for those too.

The choice of nop has some complicated consequences.  nopw (%rax) has a ModRM
byte of 0, which the Bourne compatible shells unconditionally strip from
parameters, meaning that we can't pass it to `grep -aob`.

Therefore, use nopw (%rcx) so the ModRM byte becomes 1.

This then demonstrates another bug.  Under perl regexes, \1 thru \9 are
subpattern matches, and not octal escapes, while the behaviour of \10 and
higher depend on the number of capture groups.  Switch the `grep -P` runes to
use hex escapes instead, which are unambiguous

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
v3:
 * Tweak wording about perl regex
 * Check for endbr32 as well
---
 xen/arch/x86/alternative.c       |  2 +-
 xen/arch/x86/include/asm/endbr.h | 26 ++++++++++++++++++++++++++
 xen/tools/check-endbr.sh         | 18 +++++++++++++-----
 3 files changed, 40 insertions(+), 6 deletions(-)

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
index 9799c451a18d..641a2342199e 100755
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
+# Second, look for all endbr64, endbr32 and nop poison byte sequences
 # This has a couple of complications:
 #
 # 1) Grep binary search isn't VMA aware.  Copy .text out as binary, causing
 #    the grep offset to be from the start of .text.
 #
 # 2) dash's printf doesn't understand hex escapes, hence the use of octal.
+#    `grep -P` on the other hand can has various ambiguities with octal-like
+#    escapes, so use hex escapes instead which are unambiguous.
 #
 # 3) AWK can't add 64bit integers, because internally all numbers are doubles.
 #    When the upper bits are set, the exponents worth of precision is lost in
@@ -65,11 +67,17 @@ eval $(${OBJDUMP} -j .text $1 -h |
     awk '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
 
 ${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
+
+# instruction:    hex:           oct:
+# endbr64         f3 0f 1e fa    363 017 036 372
+# endbr32         f3 0f 1e fb    363 017 036 373
+# nopw (%rcx)     66 0f 1f 01    146 017 037 001
 if $perl_re
 then
-    LC_ALL=C grep -aobP '\363\17\36\372' $TEXT_BIN
+    LC_ALL=C grep -aobP '\xf3\x0f\x1e(\xfa|\xfb)|\x66\x0f\x1f\x01' $TEXT_BIN
 else
-    grep -aob "$(printf '\363\17\36\372')" $TEXT_BIN
+    grep -aob -e "$(printf '\363\17\36\372')" -e "$(printf '\363\17\36\373')" \
+         -e "$(printf '\146\17\37\1')" $TEXT_BIN
 fi | awk -F':' '{printf "%s%x\n", "'$vma_hi'", int(0x'$vma_lo') + $1}' > $ALL
 
 # Wait for $VALID to become complete
@@ -90,6 +98,6 @@ nr_bad=$(wc -l < $BAD)
 [ "$nr_bad" -eq 0 ] && exit 0
 
 # Failure
-echo "$MSG_PFX Fail: Found ${nr_bad} embedded endbr64 instructions" >&2
+echo "$MSG_PFX Fail: Found ${nr_bad} endb32, nop poison, or embedded endbr64 instructions" >&2
 ${ADDR2LINE} -afip -e $1 < $BAD >&2
 exit 1
-- 
2.11.0


