Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7687F5762BD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 15:27:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368230.599436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCLLn-0000iB-Ms; Fri, 15 Jul 2022 13:27:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368230.599436; Fri, 15 Jul 2022 13:27:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCLLn-0000ep-J9; Fri, 15 Jul 2022 13:27:23 +0000
Received: by outflank-mailman (input) for mailman id 368230;
 Fri, 15 Jul 2022 13:27:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xid4=XU=citrix.com=prvs=188d5c0a5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oCLLl-00007s-CD
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 13:27:21 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da51210b-0441-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 15:27:20 +0200 (CEST)
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
X-Inumbo-ID: da51210b-0441-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657891640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=U5l4uZAhsQRLLS5kMyqPK59gZmSwaebKw6RbWmoikFw=;
  b=XFOfC6UEt/X4f1cpX/J3Y9dCW8gz+L/NwVIzNQxErV1YvRHo43V4DDma
   EzM49tcvLXtYe6CTzjQi3lpxJsfTR3Lz/EHPF9KteFSGemCnUzCOysBfW
   NnTJUrl08EFnPBJ2Amjw+E0woPI8h2bj435Dii4AemWjE6Y+uiaxSzJ1C
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75187322
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:B3v3G61K40KjDHM+X/bD5SVxkn2cJEfYwER7XKvMYLTBsI5bpz0Cn
 zMWXGnVbv/YZWSkeYh/OoS2ox5SusfTmIRnHQNtpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOKn9RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUwx4VlmrBVOSvU0
 T/Ji5CZaQXNNwJcaDpOsfrc8U4355wehRtD1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86rIGaRpz6xE78FU7tJo56jGqE4aue60Tum0xK6b5OKkBlazhHe545gXBYqheW7vB3S9zx54
 I0lWZVd0m7FNIWU8AgWe0Ew/y2TocSqUVIISJSymZX78qHIT5fj6/5oDmMOMIIdwbtuOl5Wr
 v0iCjVOMDnW0opawJrjIgVtrsEqLc2tN4IDoHBwizreCJ7KQ7iaHf+Mv4UBmm5t2IYeRp4yZ
 OJAAdZrRD3GbwdCJRE8D5Umkf3zrnL+bydZuBSeoq9fD237k1EogOe2aoC9ltqiY90K3Rypq
 1n8pUfSDD5EDoOC8WWfyyf57gPItXyiA99DfFGizdZviUGTx2EOTgEfT0GypdGhkEmiXNRaI
 k0QvCEpqMAa9lGvT9T7dw21pjiDpBF0c/BdCfEg4QeBjI/d+R+EB3MsRyRELtchsaceYSEh3
 xmnltXiCDhrrZWcU3fb/bCRxRuQEyUIKW4JZQcfUBAIpdLkpekbnh/JC9puDqOxptn0Ai3rh
 SCHqjAkgLcehtJN0L+0lXjYhxq8q56PSRQ6ji3MRX6s5A59YI+jZqSr5ELd4PIGK5yWJmRtp
 1BdxZLYtrpXS8jQymrdG43hAY1F+d6ONj/+uVNgGqJ87g+S4yWiR6JVo29XcRIB3tk/RdP5X
 KPCkVoPucADYCr1NPQfj5GZUJpzk/W5fTjxfrWNN4cVPMAsHOOS1Hs2DXN8yVwBh6TFfUsXH
 Z6AOfihAn8BYUiM5GrnHrxNuVPHK81X+I8yeXwY507+uVZmTCTJIYrpyXPXBgzD0IuKoR/O7
 /FUPNaQxhNUXYXWO3eKrt5JdgBRfSJkXvgaTvC7kcbaeGJb9JwJUaeNkdvNhaQ/90iqqgs41
 i7kARIJoLYOrXbGNR+LehheVV8bZr4m9ShTFXV1ZT6AgiFzCa7yvfx3X8ZmItEaGBlLkKcco
 w8tIJ7bXJyii13vplwgUHUKhNczJU/72FjXYXvNjfpWV8cIejElM+TMJmPHnBTixALt3Sfii
 9VMDj/mfKc=
IronPort-HdrOrdr: A9a23:Sqxqj6ickQ/t/Xk8JOH9arjRfnBQXt4ji2hC6mlwRA09TySZ//
 rOoB17726NtN9/YgBCpTntAsa9qDbnhPpICOoqTM6ftWvdyQmVxehZhOOIqVCNJ8S9zJ876U
 4JSdkZNDSaNzhHZKjBjjVQa+xQpeW6zA==
X-IronPort-AV: E=Sophos;i="5.92,274,1650945600"; 
   d="scan'208";a="75187322"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<Luca.Fancellu@arm.com>, Mathieu Tarral <mathieu.tarral@protonmail.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: [PATCH v2 2/2] xen: Fix latent check-endbr.sh bug with 32bit build environments
Date: Fri, 15 Jul 2022 14:26:51 +0100
Message-ID: <20220715132651.1093-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220715132651.1093-1-andrew.cooper3@citrix.com>
References: <20220715132651.1093-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

While Xen's current VMA means it works, the mawk fix (i.e. using $((0xN)) in
the shell) isn't portable in 32bit shells.  See the code comment for the fix.

The fix found a second latent bug.  Recombining $vma_hi/lo should have used
printf "%s%08x" and only worked previously because $vma_lo had bits set in
it's top nibble.  Combining with the main fix, %08x becomes %07x.

Fixes: $XXX patch 1
Reported-by: Jan Beulich <JBeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Luca Fancellu <Luca.Fancellu@arm.com>
CC: Mathieu Tarral <mathieu.tarral@protonmail.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>

v2:
 * New
---
 xen/tools/check-endbr.sh | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
index b3febd6a4ccc..d6aa117de13b 100755
--- a/xen/tools/check-endbr.sh
+++ b/xen/tools/check-endbr.sh
@@ -61,19 +61,36 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
 #    the lower bits, rounding integers to the nearest 4k.
 #
 #    Instead, use the fact that Xen's .text is within a 1G aligned region, and
-#    split the VMA in half so AWK's numeric addition is only working on 32 bit
-#    numbers, which don't lose precision.
+#    split the VMA so AWK's numeric addition is only working on <32 bit
+#    numbers, which don't lose precision.  (See point 5)
 #
 # 4) MAWK doesn't support plain hex constants (an optional part of the POSIX
 #    spec), and GAWK and MAWK can't agree on how to work with hex constants in
 #    a string.  Use the shell to convert $vma_lo to decimal before passing to
 #    AWK.
 #
+# 5) Point 4 isn't fully portable.  POSIX only requires that $((0xN)) be
+#    evaluated as long, which in 32bit shells turns negative if bit 31 of the
+#    VMA is set.  AWK then interprets this negative number as a double before
+#    adding the offsets from the binary grep.
+#
+#    Instead of doing an 8/8 split with vma_hi/lo, do a 9/7 split.
+#
+#    The consequence of this is that for all offsets, $vma_lo + offset needs
+#    to be less that 256M (i.e. 7 nibbles) so as to be successfully recombined
+#    with the 9 nibbles of $vma_hi.  This is fine; .text is at the start of a
+#    1G aligned region, and Xen is far far smaller than 256M, but leave safety
+#    check nevertheless.
+#
 eval $(${OBJDUMP} -j .text $1 -h |
-    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
+    $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 9), substr($4, 10, 16)}')
 
 ${OBJCOPY} -j .text $1 -O binary $TEXT_BIN
 
+bin_sz=$(stat -c '%s' $TEXT_BIN)
+[ "$bin_sz" -ge $(((1 << 28) - $vma_lo)) ] &&
+    { echo "$MSG_PFX Error: .text offsets can exceed 256M" >&2; exit 1; }
+
 # instruction:    hex:           oct:
 # endbr64         f3 0f 1e fa    363 017 036 372
 # endbr32         f3 0f 1e fb    363 017 036 373
@@ -84,7 +101,7 @@ then
 else
     grep -aob -e "$(printf '\363\17\36\372')" -e "$(printf '\363\17\36\373')" \
          -e "$(printf '\146\17\37\1')" $TEXT_BIN
-fi | $AWK -F':' '{printf "%s%x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' > $ALL
+fi | $AWK -F':' '{printf "%s%07x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' > $ALL
 
 # Wait for $VALID to become complete
 wait
-- 
2.11.0


