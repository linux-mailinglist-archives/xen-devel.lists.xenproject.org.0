Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B471E3F5C9B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170964.312099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBJ-0004Hj-FR; Tue, 24 Aug 2021 11:01:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170964.312099; Tue, 24 Aug 2021 11:01:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBJ-0004Ce-AR; Tue, 24 Aug 2021 11:01:25 +0000
Received: by outflank-mailman (input) for mailman id 170964;
 Tue, 24 Aug 2021 11:01:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU48-0001EC-EX
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:54:00 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 40e21d5a-37bb-40ae-96b4-b3fcbf82905b;
 Tue, 24 Aug 2021 10:52:02 +0000 (UTC)
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
X-Inumbo-ID: 40e21d5a-37bb-40ae-96b4-b3fcbf82905b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802321;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xRhF1EY/QRtV5cyAdngF/J6PljqQGZ9sLSwIGFFQ1do=;
  b=hBcBdXy9FfJCzsd/e5/GhnBBMA/1WIzrNPOnGm8ls/IdHeFrBf0dsRcq
   FTycmRIfhKasIDeRJMj+xITzM00Gcq0uqYTCIR2mccMVxryn114XeLHfC
   EHnVKxjwVsQv7CYMN/04mc/Tjt3oIhD3LQxxCR2bIfKVrFrPPz+jfdtrc
   I=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 8Pi9jibUCalk3QDJxoRQbBzIKB1rsgoQSyCyx3jEvp1739Chw+CAKXsS3nPyLTQKi4lJ2LJmlp
 ZED/8KyRElYy3zq537iHhcTJO9oIdkk5E3yUbVKXYbibAtjI2JwIHKdGYeUOAiV1Ho84xcR8fj
 g0xo7Ob5FBREY+1Rq8gHnw0R3XmftwqbcT5Z0pLSAQUhVjPEPBPLsv3NXxY5POZq2qprAa7xtS
 73YaBvjVIRq4yCB36xskESOZpDX4e+I7x47rwpbyQrcpBxiQncYV+l5F2p4zNNIcYJsYhqPjkH
 SOBNCWP+kpCWGGGu23ZJtHOc
X-SBRS: 5.1
X-MesageID: 51153594
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:fMZf2arIimsxEIPcRlDuP6YaV5uXL9V00zEX/kB9WHVpm5Oj+v
 xGzc5w6farsl0ssSkb6La90KnpexPhHO1OkPAs1NaZLULbUQSTXeVfBOfZrQEIeBeOvNK1t5
 0QFJSWYeeYZTQUsS+Q2njaLz9U+qjjzEnev5a9854Cd2BXQpAlyz08JheQE0VwSgUDL4E+Do
 Cg6s1OoCflUWgLb+ygb0N1E9TrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P+7E/6m
 LI+jaJqZlL8svLhCM05VWjr6i+q+GRieerw/b8yPT9Hw+cyzpAor4RHoFq8gpF5N1Ho2xa6O
 Uk6y1QRPibrUmhM11d6CGdoTXIwXIg7WTvxkSfhmamqcvlRCgiA84Eno5BdADFgnBQyu2U/Z
 g7q15xjaAnei8oXR6NluTgRlVvjA65sHAimekcgzhWVpYfcqZYqcga8FlOGJkNESrm4MR/ed
 MeRP309bJTaxeXfnrZtm5gzJilWWkyBA6PRgwHttaO2zZbkXhlxw8TxdAZnH0H6JUhIqM0rt
 jsI+BtjvVDX8UWZaVyCKMIRta2EHXERVbWPGebMT3cZdQ60rL22uzKCZAOlZ+XkbAzvecPca
 X6ISBlXDQJCj/T4OW1reJ22wGIW2OgQDio0d1a6/FCy83BeIY=
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51153594"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v7 36/51] build: generate x86's asm-macros.h with filechk
Date: Tue, 24 Aug 2021 11:50:23 +0100
Message-ID: <20210824105038.1257926-37-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
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
---
 xen/arch/x86/Makefile | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 05f1d12065a0..1ef2536ece26 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -233,18 +233,21 @@ include: $(BASEDIR)/arch/x86/include/asm/asm-macros.h
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
@@ -258,7 +261,7 @@ $(obj)/efi/mkreloc: $(src)/efi/mkreloc.c
 
 .PHONY: clean
 clean::
-	rm -f *.lds *.new boot/*.o boot/*~ boot/core boot/mkelf32
+	rm -f *.lds boot/*.o boot/*~ boot/core boot/mkelf32
 	rm -f asm-macros.i $(BASEDIR)/arch/x86/include/asm/asm-macros.*
 	rm -f $(BASEDIR)/.xen-syms.[0-9]* boot/.*.d $(BASEDIR)/.xen.elf32
 	rm -f $(BASEDIR)/.xen.efi.[0-9]* efi/*.efi efi/mkreloc
-- 
Anthony PERARD


