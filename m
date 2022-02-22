Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252AE4BFCB6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Feb 2022 16:35:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276926.473329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXBx-0006IY-E5; Tue, 22 Feb 2022 15:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276926.473329; Tue, 22 Feb 2022 15:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMXBx-0006Eh-9a; Tue, 22 Feb 2022 15:35:05 +0000
Received: by outflank-mailman (input) for mailman id 276926;
 Tue, 22 Feb 2022 15:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Woib=TF=citrix.com=prvs=045a4fa17=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMXBv-0005NF-3g
 for xen-devel@lists.xenproject.org; Tue, 22 Feb 2022 15:35:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ffb73fde-93f4-11ec-8eb8-a37418f5ba1a;
 Tue, 22 Feb 2022 16:35:01 +0100 (CET)
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
X-Inumbo-ID: ffb73fde-93f4-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645544101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h8j452T6Tw+1j6rlogEw/+HJLpPlGl8BUaxfVL2dCbE=;
  b=Mjz3mXhiwaMeE6vSglPaG7+k8Y0IIUAbVByOVxqXnJcBbWnHzOw2NInL
   TRBJnJBEQ1LUOXX42D3P5G9F4WNxpLKBs0x1sFcKNgkry3Nyy5TnBXBig
   S2NpPH58Tz2w/77WF2lXCV5POWsDvQBtb9ab2pmCtIphtHnM7KRGTaX8x
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65138991
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:S4p2+a6PMK1nfApL6JsZmQxRtBzHchMFZxGqfqrLsTDasY5as4F+v
 mMaWm3TaK6CMGGjc41xPIS18k8Cvp7Xz9IySgU5qCtjHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFx2XqPp8Zj2tQy2YLjWVvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurThEF4gJI+Lut00dDN6T3p1AYh23pn+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKs2vH16wC6fJvEhWZ3ZGI3B5MNC3Sd2jcdLdRrbT
 5REMGE/PUWZC/FJEmUNCJ0sp96Mvz6hbQBn9F+Sl7IW23eGmWSd15CyaYGIK7RmX/59vGyVu
 2bH9GTRGQwBOZqUzj/t2m2orv/Cm2X8Qo16PK218LtmjUOewkQXCQYKTh2rrP+hkEm8VtlDb
 UsO9UIGqKEo8UWxQ9rVXhumoWWFtBoRR9pRFeIh7AiHjKHT5m6k6nMsF2AbLoZ87YlvGGJsh
 gThc87V6SJH4eTMQGi/sZWthBSYG3ROJlMnVQkidF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wy3QDgCa6Y71pBSifjilbzTq3f1/8WSEFZpjunCdj/9tmtEiJiZi5tEALQxxdJJN86nQ1aIp
 xDocODOvblVXflheMFgKdjh/Y1FBd7YaFUwYnY1RvHNEghBHVb5Jui8BxkkeS9U3j4sI2OBX
 aMqkVo5CGVvFHWrd7RrRIm6Ft4ny6Ptffy8CKyJMoQfP8UrKFbflM2LWaJ29zq2+KTLuftiU
 ap3jO72VSpKYUiZ5GDeqxghPU8DmXllmDK7qWHTxBW7y7uODEN5up9eWGZimtsRtfveyC2Mq
 o43H5LTl313Db2vCgGKoNV7BQ1bchAG6WXe9pU/mhireVE9RgnMypb5nNscRmCSt/4LzryRp
 inlACe1CjPX3BX6FOlDUVg7AJuHYHq1hStT0fAEVbpw50UeXA==
IronPort-HdrOrdr: A9a23:TQC3V64sn5kqz2+WCQPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,387,1635220800"; 
   d="scan'208";a="65138991"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 60/70] x86: Build check for embedded endbr64 instructions
Date: Tue, 22 Feb 2022 15:26:44 +0000
Message-ID: <20220222152645.8844-15-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220222152645.8844-1-andrew.cooper3@citrix.com>
References: <20220222152645.8844-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

An interesting corner case occurs when the byte sequence making up endb64 ends
up on a non-instruction boundary.  Such embedded instructions mark legal
indirect branch targets as far as the CPU is concerned, which aren't legal as
far as the logic is concerned.

When CET-IBT is active, check for embedded byte sequences.  Example failures
look like:

  check-endbr.sh xen-syms Fail: Found 2 embedded endbr64 instructions
  0xffff82d040325677: test_endbr64 at /local/xen.git/xen/arch/x86/x86_64/entry.S:28
  0xffff82d040352da6: init_done at /local/xen.git/xen/arch/x86/setup.c:675

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * New
v3:
 * Reposition to the end of the cf_check-ing, to retain bisectability
 * Reword commit message to explain 'embedded'
 * Use ${ADDR2LINE} if present in the environment
 * Use objdump -w
 * Explain the use of octal
 * Check the EFI build too.  Reposition to be last action, so all build
   artefacts remain in a failure case
 * Check for grep support and warn if missing
 * Replace strtonum() with int() to avoid gaining a gawk dependency
 * Replace `join` with `sort | uniq` to avoid adding a coreutils dependency
---
 README                   |  1 +
 xen/arch/x86/Makefile    |  6 ++++
 xen/tools/check-endbr.sh | 85 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 92 insertions(+)
 create mode 100755 xen/tools/check-endbr.sh

diff --git a/README b/README
index 562b80808033..5e55047ffd9e 100644
--- a/README
+++ b/README
@@ -68,6 +68,7 @@ provided by your OS distributor:
 In addition to the above there are a number of optional build
 prerequisites. Omitting these will cause the related features to be
 disabled at compile time:
+    * Binary-search capable grep (if building Xen with CET support)
     * Development install of Ocaml (e.g. ocaml-nox and
       ocaml-findlib). Required to build ocaml components which
       includes the alternative ocaml xenstored.
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index db97ae8c07f0..b90146b75636 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -142,6 +142,9 @@ $(TARGET)-syms: $(BASEDIR)/prelink.o $(obj)/xen.lds
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
+ifeq ($(CONFIG_XEN_IBT),y)
+	$(SHELL) $(BASEDIR)/tools/check-endbr.sh $@
+endif
 
 $(obj)/note.o: $(TARGET)-syms
 	$(OBJCOPY) -O binary --only-section=.note.gnu.build-id $< $@.bin
@@ -212,6 +215,9 @@ endif
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort >$(@D)/$(@F).map
 	rm -f $(@D)/.$(@F).[0-9]* $(@D)/..$(@F).[0-9]*
+ifeq ($(CONFIG_XEN_IBT),y)
+	$(SHELL) $(BASEDIR)/tools/check-endbr.sh $@
+endif
 else
 $(TARGET).efi: FORCE
 	rm -f $@
diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
new file mode 100755
index 000000000000..85878353112a
--- /dev/null
+++ b/xen/tools/check-endbr.sh
@@ -0,0 +1,85 @@
+#!/bin/sh
+#
+# Usage ./$0 xen-syms
+#
+set -e
+
+# Prettyprint parameters a little for message
+MSG_PFX="${0##*/} ${1##*/}"
+
+OBJCOPY="${OBJCOPY:-objcopy} -j .text $1"
+OBJDUMP="${OBJDUMP:-objdump} -j .text $1"
+ADDR2LINE="${ADDR2LINE:-addr2line}"
+
+D=$(mktemp -d)
+trap "rm -rf $D" EXIT
+
+TEXT_BIN=$D/xen-syms.text
+VALID=$D/valid-addrs
+ALL=$D/all-addrs
+BAD=$D/bad-addrs
+
+# Check that grep can do binary searches.  Some, e.g. busybox, can't.  Leave a
+# warning but don't fail the build.
+echo "X" | grep -aob "X" -q 2>/dev/null ||
+    { echo "$MSG_PFX Warning: grep can't do binary searches" >&2; exit 0; }
+
+#
+# First, look for all the valid endbr64 instructions.
+# A worst-case disassembly, viewed through cat -A, may look like:
+#
+# ffff82d040337bd4 <endbr64>:$
+# ffff82d040337bd4:^If3 0f 1e fa          ^Iendbr64 $
+# ffff82d040337bd8:^Ieb fe                ^Ijmp    ffff82d040337bd8 <endbr64+0x4>$
+# ffff82d040337bda:^Ib8 f3 0f 1e fa       ^Imov    $0xfa1e0ff3,%eax$
+#
+# Want to grab the address of endbr64 instructions only, ignoring function
+# names/jump labels/etc, so look for 'endbr64' preceeded by a tab and with any
+# number of trailing spaces before the end of the line.
+#
+${OBJDUMP} -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
+
+#
+# Second, look for any endbr64 byte sequence
+# This has a couple of complications:
+#
+# 1) Grep binary search isn't VMA aware.  Copy .text out as binary, causing
+#    the grep offset to be from the start of .text.
+#
+# 2) dash's printf doesn't understand hex escapes, hence the use of octal.
+#
+# 3) AWK can't add 64bit integers, because internally all numbers are doubles.
+#    When the upper bits are set, the exponents worth of precision is lost in
+#    the lower bits, rounding integers to the nearest 4k.
+#
+#    Instead, use the fact that Xen's .text is within a 1G aligned region, and
+#    split the VMA in half so AWK's numeric addition is only working on 32 bit
+#    numbers, which don't lose precision.
+#
+eval $(${OBJDUMP} -h | awk '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
+
+${OBJCOPY} -O binary $TEXT_BIN
+grep -aob "$(printf '\363\17\36\372')" $TEXT_BIN |
+    awk -F':' '{printf "%s%x\n", "'$vma_hi'", int(0x'$vma_lo') + $1}' > $ALL
+
+# Wait for $VALID to become complete
+wait
+
+# Sanity check $VALID and $ALL, in case the string parsing bitrots
+val_sz=$(stat -c '%s' $VALID)
+all_sz=$(stat -c '%s' $ALL)
+[ "$val_sz" -eq 0 ]         && { echo "$MSG_PFX Error: Empty valid-addrs" >&2; exit 1; }
+[ "$all_sz" -eq 0 ]         && { echo "$MSG_PFX Error: Empty all-addrs" >&2; exit 1; }
+[ "$all_sz" -lt "$val_sz" ] && { echo "$MSG_PFX Error: More valid-addrs than all-addrs" >&2; exit 1; }
+
+# $BAD = $ALL - $VALID
+sort $VALID $ALL | uniq -u > $BAD
+nr_bad=$(wc -l < $BAD)
+
+# Success
+[ "$nr_bad" -eq 0 ] && exit 0
+
+# Failure
+echo "$MSG_PFX Fail: Found ${nr_bad} embedded endbr64 instructions" >&2
+${ADDR2LINE} -afip -e $1 < $BAD >&2
+exit 1
-- 
2.11.0


