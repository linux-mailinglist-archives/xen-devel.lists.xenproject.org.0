Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086F345DB78
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:47:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231234.400070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5S-000654-1x; Thu, 25 Nov 2021 13:46:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231234.400070; Thu, 25 Nov 2021 13:46:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqF5R-00063D-Uo; Thu, 25 Nov 2021 13:46:53 +0000
Received: by outflank-mailman (input) for mailman id 231234;
 Thu, 25 Nov 2021 13:46:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqF03-00076i-MS
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:41:19 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d8200b7-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:41:18 +0100 (CET)
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
X-Inumbo-ID: 5d8200b7-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5TWrEHNuNLFROz3IyERYFp+CoH2z9NcBZf52JXIU9Zw=;
  b=OxaSsMKuzrPIsRZNm1xSDw7YyruEdOv241n+BjGMXSVYxAA7gR1bBwd1
   1MSCXjp/RrQ+vDJlBJRDEK8UFQ7/j1HXecWTqXVnUbcEcO+FvuBf95y1s
   b45bE7AkNoUP5GhIft9nj2Ncxs+bRuetAOah0EaGF5wcUPBZq3hLFLbwv
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RVJ7aAuQBHjZzqUlN7p4V1rdCRaDfIEJlzz8d/c0C8arvfBn/HNxit/kNlsINYx6LsUPqaP9TQ
 BgnaggibGTylRaa8+lZ7Tj0c6n5WTwdW4YS9RqcjIMeZHXSsOAYBY6YKyEJ7QClXSQRKv7Y2Ip
 4bGyZ/RllGZZ48cnjfgvFCjDsbxRyiJezD453YtfaGuBAEHtOZ0IAySYpIZDa9USk0kCg9kuxr
 ya4qJ3Ug4R3FQgQ85mKuYDSBhFbcxyQPp0dxpgDYJpuPaOKOdxy4oizaF3LOeZDhDNAAle4/Aj
 Spg1svLVHGs38fgEfaip5jYc
X-SBRS: 5.1
X-MesageID: 59006026
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fcA6BKLtsTbQAWS6FE+R6JIlxSXFcZb7ZxGr2PjKsXjdYENSgWAAz
 DNKXT/SOPjZZGv3f9hyOo3j901UvZDUyNBnSARlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xrZj6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Lndt30
 cd3r6buCi1wIPPVxO8AVENXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFlgNgjK8/6epsSoHh6wRnSDOo8QICFSKLPjTNd9Gph3pgQRayAD
 yYfQQU+XTTEbw19Bmo4A5hunsa2qHn9cwQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 GjL4mD4CREyL8GExHyO9XfErv/Cm2b3VZwfEJW89+V2mxuDy2oLEhoUWFCn5/6jhSaDt8l3c
 hJOvHB09O5rqRLtHoKVswCETGCsvBwXXcNCKfcAtkKnk7SK+lqSG29eQWsUADA5j/MeSTsv3
 16PutrmAz1zrbGYIU6gGqeoQSCaYnZMczJbDcMQZU5cuoS4/tlv5v7aZo87SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFRONHNi2+AswGzARN8wGGxFATpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmr2pCH8LNAAsWsgdS+F1/ronhezP
 ifuVf55vscPbBNGk4crC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6ENJGPiatM5TWuBF0y8kXY
 M7DGe71VCpyIfk3nVKeGrZGuZd2l39W+I8mbc2ip/hR+eHFPyD9pHZsGAbmU93VG4vY+liIq
 IgGaJPRo/idOcWnChTqHUcoBQhiBRAG6Vre8qS7r8aPfVhrHn8PEfjUze9zcoBphf0NxOzJ4
 mu8SglTz1+m3S/LLgCDa3ZCbrLzXMkg8SJnbHJ0ZVv4iWI+ZYuP7bsEc8dld7cQ6+E+n+V/S
 OMIepvcD60XGCjH4TkUcbL0sJdmKEawnQuLMif8OGo/cpdsShbn4NjhegezpiACAjDu7Zk1o
 qG61xOdSp0GHlwwAMHTYfOp7lWwoXlCx74iAxqWeoFeIRy+/pJrJir9iu4MD/sNcRiTlCGH0
 wu2AAsDobWfqYEC79SU17uPqJ2kErUiExMCTXXb97u/KQLT4nGnnd1bSO+NcD3QCDH09aGla
 bkHxv3wKqRazlNDso46GLd316MuodDoouYCnAhjGXzKaXWtC69hfSbajZUe6PUVy+8LoxayV
 2KO5sJeaOeAN87SGVIMIBYoM7aY3vYOlziOtfk4LS0WPsOsEGZrhamKAySxtQ==
IronPort-HdrOrdr: A9a23:/DRNAK04LvYOHONEZngSwAqjBLQkLtp133Aq2lEZdPRUGvb2qy
 nIpoV96faUskdpZJhOo7G90cW7LE80sKQFg7X5Xo3SODUO2lHJEGgK1+KLqFfd8m/Fh4tgPM
 9bAs5D4bbLY2SS4/yX3ODBKadC/OW6
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="59006026"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v8 21/47] build: generate x86's asm-macros.h with filechk
Date: Thu, 25 Nov 2021 13:39:40 +0000
Message-ID: <20211125134006.1076646-22-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

When we will build out-of-tree, make is going to try to generate
"asm-macros.h" before the directories "arch/x86/include/asm" exist,
thus we would need to call `mkdir` explicitly. We will use "filechk"
for that as it does everything that the current recipe does and does
call `mkdir`.

Also, they are no more "*.new" files generated in this directory.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/Makefile | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 456b7eed7536..873b32cc6945 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -230,18 +230,21 @@ include: $(BASEDIR)/arch/x86/include/asm/asm-macros.h
 $(obj)/asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
 
 $(BASEDIR)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
-	echo '#if 0' >$@.new
-	echo '.if 0' >>$@.new
-	echo '#endif' >>$@.new
-	echo '#ifndef __ASM_MACROS_H__' >>$@.new
-	echo '#define __ASM_MACROS_H__' >>$@.new
-	echo 'asm ( ".include \"$@\"" );' >>$@.new
-	echo '#endif /* __ASM_MACROS_H__ */' >>$@.new
-	echo '#if 0' >>$@.new
-	echo '.endif' >>$@.new
-	cat $< >>$@.new
-	echo '#endif' >>$@.new
-	$(call move-if-changed,$@.new,$@)
+	$(call filechk,asm-macros.h)
+
+define filechk_asm-macros.h
+    echo '#if 0'; \
+    echo '.if 0'; \
+    echo '#endif'; \
+    echo '#ifndef __ASM_MACROS_H__'; \
+    echo '#define __ASM_MACROS_H__'; \
+    echo 'asm ( ".include \"$@\"" );'; \
+    echo '#endif /* __ASM_MACROS_H__ */'; \
+    echo '#if 0'; \
+    echo '.endif'; \
+    cat $<; \
+    echo '#endif'
+endef
 
 $(obj)/efi.lds: AFLAGS-y += -DEFI
 $(obj)/xen.lds $(obj)/efi.lds: $(src)/xen.lds.S FORCE
@@ -255,7 +258,7 @@ $(obj)/efi/mkreloc: $(src)/efi/mkreloc.c
 
 .PHONY: clean
 clean::
-	rm -f *.lds *.new boot/*.o boot/*~ boot/core boot/mkelf32
+	rm -f *.lds boot/*.o boot/*~ boot/core boot/mkelf32
 	rm -f asm-macros.i $(BASEDIR)/arch/x86/include/asm/asm-macros.*
 	rm -f $(BASEDIR)/.xen-syms.[0-9]* boot/.*.d $(BASEDIR)/.xen.elf32
 	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc
-- 
Anthony PERARD


