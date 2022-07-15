Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BA85762C4
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 15:27:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368229.599426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCLLl-0000RF-CJ; Fri, 15 Jul 2022 13:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368229.599426; Fri, 15 Jul 2022 13:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCLLl-0000OI-9G; Fri, 15 Jul 2022 13:27:21 +0000
Received: by outflank-mailman (input) for mailman id 368229;
 Fri, 15 Jul 2022 13:27:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xid4=XU=citrix.com=prvs=188d5c0a5=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oCLLk-00007s-4y
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 13:27:20 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9929a37-0441-11ed-924f-1f966e50362f;
 Fri, 15 Jul 2022 15:27:19 +0200 (CEST)
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
X-Inumbo-ID: d9929a37-0441-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1657891639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Bo8WYCUkVXZCZC7rokwVAr1QbuRms3WVx1QMppMlBro=;
  b=Qk3ZvARhIJABb0VmBkgNepGSvVHhiiIGx0vZrGBxMAXrCttjevaHikFN
   3WXF+57lqgvDazTZtFDFqiRSdJAskfgctCJyuHA1lhAmGN2qCiMJCIyST
   07+V86S7sDy/HhkJnf0QHPTbHekGiy/SV7+nyASp+Ee9nOjUh3esvaLvZ
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 75187320
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:LZ1TWqMOoOa/7AbvrR1Tl8FynXyQoLVcMsEvi/4bfWQNrUp20DcPx
 zdMXT3XPvnbZzCjL912aNm18BgD7JLWxoVgSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyFULOZ82QsaDhMtPve8EgHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPnxfdMNEw5OLZF491IGTpPz
 94da24kO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJGahjabgIJEVAQEJ8kx8+jh2Xlci0eo1WQzUYyyzeOlVwui+K1WDbTUvyWftdwmUTCn
 z7t5UD8IRQlL+649wPQpxpAgceQxHimCer+DoaQ8/d2gFye2yoPAQcMXF+TueO+lkm4XtteL
 wof/S9Ghaov8E2mSPHtUhv+p2SL1jY2VsBMCeQ85Eeow7DN/geCLmEeS3hKb9lOnOsrTjVs+
 FaPlN7tASFHuaeQD3ma89+8jxm/JCwUJm8qfjIfQE0O5NyLiJE+iFfDQ8huFIaxj8bpAnfgz
 jaSti88ir4Py8kR2M2T4lTvkz+q4J/TQWYd/R7LV2io6gd4Yo+NZIGy71Xfq/FaI+6kokKp5
 SZe3ZLEtaZXUM/LxHflrPgx8K+B7PCHEgXRjltUQoAayCz2+kSBeMMOyWQrTKt2CfroaQMFc
 WeK514OtMMCYyLxBUNkS9nvUpp3lMAMAfygD6mJNYQWP/CdYSfdpElTiVisM3cBeaTGuYU2I
 t+lfMmlFh724ow3nWPtF4/xPVLGrx3SJF8/prihlnxLKZLEOBaopU4taTNilNwR4qKeuxny+
 N1CLcaMwBg3eLSgP3aHq9VDdgBQciNT6XXKRyt/L7TrH+abMDt5V6+5LU0JIeSJYJi5Zs+Xp
 yrgCye0OXL0hGHdKBXiV02PnIjHBM4lxVpiZHREFQ/xixALPNf0hI9CJsRfQFXS3LE6pRKCZ
 6JeIJvo7zUmYmmvxgnxmrGm/d05JEnx3FzfV8dnCRBmF6Ndq8Xy0oeMVmPSGOMmUkJbaeNWT
 2Wc6z7m
IronPort-HdrOrdr: A9a23:9u2/RK/CT4G883Uhn35uk+DaI+orL9Y04lQ7vn2YSXRuHPBw9v
 re5cjzuiWVtN98Yh0dcJW7Scy9qBDnhPhICOsqTNSftWDd0QPCRuxfBMnZslnd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.92,274,1650945600"; 
   d="scan'208";a="75187320"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<George.Dunlap@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Luca Fancellu <Luca.Fancellu@arm.com>, Mathieu Tarral
	<mathieu.tarral@protonmail.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: [PATCH v2 1/2] xen: Fix check-endbr.sh with mawk
Date: Fri, 15 Jul 2022 14:26:50 +0100
Message-ID: <20220715132651.1093-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220715132651.1093-1-andrew.cooper3@citrix.com>
References: <20220715132651.1093-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Anthony PERARD <anthony.perard@citrix.com>

check-endbr.sh works with gawk, but fails with mawk. The produced $ALL
file is smaller as it is missing 0x$vma_lo on every line.  With mawk,
int(0x2A) just produces 0, instead of the expected value.

The use of hexadecimal-constant in awk is an optional part of the posix
spec, and mawk doesn't seems to implemented.

There is a way to convert an hexadecimal to a number be putting it in a
string, and awk as I understand is supposed to use strtod() to convert
the string to a number when needed. The expression 'int("0x15") + 21'
would produce the expected value in `mawk` but now `gawk` won't convert
the string to a number unless we use the option "--non-decimal-data".

So let's convert the hexadecimal number before using it in the awk
script. The shell as no issue with dealing with hexadecimal-constant so
we'll simply use the expression "$(( 0x15 ))" to convert the value
before using it in awk.

Note: This does introduce a latent portability bug, which fixed in a separate
      change to avoid mixing complexity/explanations.

Fixes: 4d037425dc ("x86: Build check for embedded endbr64 instructions")
Resolves: xen-project/xen#26
Reported-by: Luca Fancellu <Luca.Fancellu@arm.com>
Reported-by: Mathieu Tarral <mathieu.tarral@protonmail.com>
Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
 * Add comment explaining what's going on.
 * Tweak commit message.  Add a note about the portibility issue.
---
 xen/tools/check-endbr.sh | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/xen/tools/check-endbr.sh b/xen/tools/check-endbr.sh
index f633846b0f79..b3febd6a4ccc 100755
--- a/xen/tools/check-endbr.sh
+++ b/xen/tools/check-endbr.sh
@@ -64,6 +64,11 @@ ${OBJDUMP} -j .text $1 -d -w | grep '	endbr64 *$' | cut -f 1 -d ':' > $VALID &
 #    split the VMA in half so AWK's numeric addition is only working on 32 bit
 #    numbers, which don't lose precision.
 #
+# 4) MAWK doesn't support plain hex constants (an optional part of the POSIX
+#    spec), and GAWK and MAWK can't agree on how to work with hex constants in
+#    a string.  Use the shell to convert $vma_lo to decimal before passing to
+#    AWK.
+#
 eval $(${OBJDUMP} -j .text $1 -h |
     $AWK '$2 == ".text" {printf "vma_hi=%s\nvma_lo=%s\n", substr($4, 1, 8), substr($4, 9, 16)}')
 
@@ -79,7 +84,7 @@ then
 else
     grep -aob -e "$(printf '\363\17\36\372')" -e "$(printf '\363\17\36\373')" \
          -e "$(printf '\146\17\37\1')" $TEXT_BIN
-fi | $AWK -F':' '{printf "%s%x\n", "'$vma_hi'", int(0x'$vma_lo') + $1}' > $ALL
+fi | $AWK -F':' '{printf "%s%x\n", "'$vma_hi'", int('$((0x$vma_lo))') + $1}' > $ALL
 
 # Wait for $VALID to become complete
 wait
-- 
2.11.0


