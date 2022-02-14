Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFDD4B50AB
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 13:52:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271509.466040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapr-0006UD-VF; Mon, 14 Feb 2022 12:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271509.466040; Mon, 14 Feb 2022 12:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJapr-0006NK-JA; Mon, 14 Feb 2022 12:52:07 +0000
Received: by outflank-mailman (input) for mailman id 271509;
 Mon, 14 Feb 2022 12:52:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJapp-0003jk-Hz
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 12:52:05 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7d49223-8d94-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 13:52:04 +0100 (CET)
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
X-Inumbo-ID: e7d49223-8d94-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oxJaFnzRqRx4KksSzKdm9U/GeHdsnrwelajX2UNO1Ws=;
  b=QWiTa+KJGTp3Ol0d5YAtgCRtnzxPfBUgVnXUp5JZwSnWb2U/p7g3NX6B
   dABX5IFCTBNC4kF72yyLtowF/AuG0EQEzWCdxAOEQtsCOMMHGecoFecF2
   1wWbTv3SS5NIvDr/iNK9Bvq0z7/F7JflbgTTiCa+HydrPjn0nY2QPbKCI
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: xsBF8hEax4w9v1BBDx5lBacOYqJkw1ZtbWPKGqe3M74rDPMUYHUwo4NUX65uOjv8NjT9PxHecG
 cSMSVGRJWv5YkhU0C9cZNM5hkj+toofGDFUNpWrnO6cYIxpSzEDVhndGhBoBkFVMUZOB2m+2sK
 /M8Yo/4460TajJqgOsVrwt63Kiu89raAL5mQP/4TbkCJN6t7Ou/EAEhX1htranQBAxyk2R0BVP
 YO6qkiNL1+cfeFYDuDnwxZUCNLx+4ZsrauR6dfviqssZeCB8y1OyWYqwfgHKBGiVIDkiiFpNfS
 1RFlJboZXgXCy7EAi/DR8PoE
X-SBRS: 5.1
X-MesageID: 64553121
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:nJyemqk0CKoYXB36bu28rk7o5gy/IURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaDWrVb66JYGX0c4sgbd/i900HsZPUyYUwQFM4rC9mHyMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 Ndykq2vTUArB47nsc46Dl5nKHtbOYQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6qDO
 pFAM2MHgBLoODhNZVUXE70Hoeb3uVr5Ly9VugmZqv9ii4TU5FMoi+W8WDbPQfSPTN9Ql1yVp
 UrH+Xr4GRAQMNGDyTuD/Wmoj+WJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+8FzzCSzu3W2iWyL0IjE3l+U4YDsOZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WoQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtAKzARVodt/xory9U
 J8swZb20Qz2JcvR/BFhuc1UdF1T296LMSfHnXlkFIQ7+jKm9haLJN4MvG4udBo0ap9fI1cFh
 XM/XisLuvdu0IaCN/crM+pd9ex2pUQfKTgVfq+NNYcfCnSAXASG4DtvdSatM5PFyyARfVUEE
 c7DK66EVC9CYYw+lWbeb7pNgNcDm3FlrUuOFM+T8vhS+efHDJJjYexeawXmgyFQxP7snTg5B
 P4Ba5XUm08CDIUToED/qOYuELzDFlBjbbieliCdXrXrztNOFD5zBvnP76kmfoA5za1Zmv2Rp
 iO2W1NCyUq5jnrCcF3YZndmYbLpfJB+sXNkYnB8YQf2gyAuMdS18aMSV5orZr17puZt+uF5E
 qsecMKaD/URFjmeo2YBbYPwpZBJfQiwgV7cJDKsZTUyJsYyRwHA9tL+UBHo8S0CUni+ucck+
 uXy3QLHW5sTAQ9lCZ+OOv6oylqwu1kbmf5zABSUcoUCJh20/dEzeSLrj/IxL8UdEjn5x2OXh
 1SMHBMVhejRuItpotPHsr+J8tWyGOxkE0sEQ2SCteSqNTPX93aIyJNbVLraZijUUW759fnwZ
 ehRyP2gYvQLkEwT7th5Grdvi6k/+8Hut/lRyQE9RCfHaFGiC7VBJHia3JYQ6v0Rl+EB4QbmC
 FiS/tR6OKmSPJK3GVEcEwMpc+Cf2KxGgTLV9/k0fB336SIfEGBriqmO081gUBBgEYY=
IronPort-HdrOrdr: A9a23:70og06kttIZ1SWNHzmotKXlgjgDpDfIf3DAbv31ZSRFFG/Fwwf
 re5cjztCWE7Qr4Ohkb8+xoXZPsfZqyz/JICOUqUotKPzOW2ldATrsD0WK4+UyHJ8SWzIc0vp
 uIFZIRNDSaNykYsS+V2miF+3lL+qj+zEgF792uq0uE7GtRGsZd0zs=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64553121"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 07/70] x86: Build check for embedded endbr64 instructions
Date: Mon, 14 Feb 2022 12:50:24 +0000
Message-ID: <20220214125127.17985-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>

Embedded endbr64 instructions mark legal indirect branches as far as the CPU
is concerned, which aren't legal as far as the logic is concerned.

When CET-IBT is active, check for embedded byte sequences.  Example failures
look like:

  Fail: Found 2 embedded endbr64 instructions
  0xffff82d040325677: test_endbr64 at /local/xen.git/xen/arch/x86/x86_64/entry.S:28
  0xffff82d040352da6: init_done at /local/xen.git/xen/arch/x86/setup.c:675

Signed-off-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
v2:
 * New
---
 xen/arch/x86/Makefile    |  3 ++
 xen/tools/check-endbr.sh | 76 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100755 xen/tools/check-endbr.sh

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 9fc884813cb5..f15a984aacc2 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -155,6 +155,9 @@ $(TARGET)-syms: prelink.o xen.lds
 	$(MAKE) -f $(BASEDIR)/Rules.mk $(@D)/.$(@F).1.o
 	$(LD) $(XEN_LDFLAGS) -T xen.lds -N prelink.o $(build_id_linker) \
 	    $(@D)/.$(@F).1.o -o $@
+ifeq ($(CONFIG_XEN_IBT),y)
+	$(SHELL) $(BASEDIR)/tools/check-endbr.sh $@
+endif
 	$(NM) -pa --format=sysv $(@D)/$(@F) \
 		| $(BASEDIR)/tools/symbols --all-symbols --xensyms --sysv --sort \
 		>$(@D)/$(@F).map
diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
new file mode 100755
index 000000000000..3d96e02bdf93
--- /dev/null
+++ b/xen/tools/check-endbr.sh
@@ -0,0 +1,76 @@
+#!/bin/sh
+
+#
+# Usage ./$0 xen-syms
+#
+
+set -e
+
+OBJCOPY="${OBJCOPY:-objcopy} -j .text $1"
+OBJDUMP="${OBJDUMP:-objdump} -j .text $1"
+
+D=$(mktemp -d)
+trap "rm -rf $D" EXIT
+
+TEXT_BIN=$D/xen-syms.text
+VALID=$D/valid-addrs
+ALL=$D/all-addrs
+BAD=$D/bad-addrs
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
+${OBJDUMP} -d | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
+
+#
+# Second, look for any endbr64 byte sequence
+# This has a couple of complications:
+#
+# 1) Grep binary search isn't VMA aware.  Copy .text out as binary, causing
+#    the grep offset to be from the start of .text.
+#
+# 2) AWK can't add 64bit integers, because internally all numbers are doubles.
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
+    awk -F':' '{printf "%s%x\n", "'$vma_hi'", strtonum(0x'$vma_lo') + $1}' > $ALL
+
+# Wait for $VALID to become complete
+wait
+
+# Sanity check $VALID and $ALL, in case the string parsing bitrots
+val_sz=$(stat -c '%s' $VALID)
+all_sz=$(stat -c '%s' $ALL)
+[ "$val_sz" -eq 0 ]         && { echo "Error: Empty valid-addrs" >&2; exit 1; }
+[ "$all_sz" -eq 0 ]         && { echo "Error: Empty all-addrs" >&2; exit 1; }
+[ "$all_sz" -lt "$val_sz" ] && { echo "Error: More valid-addrs than all-addrs" >&2; exit 1; }
+
+# $BAD = $ALL - $VALID
+join -v 2 $VALID $ALL > $BAD
+nr_bad=$(wc -l < $BAD)
+
+# Success
+[ "$nr_bad" -eq 0 ] && exit 0
+
+# Failure
+echo "Fail: Found ${nr_bad} embedded endbr64 instructions" >&2
+addr2line -afip -e $1 < $BAD >&2
+exit 1
-- 
2.11.0


