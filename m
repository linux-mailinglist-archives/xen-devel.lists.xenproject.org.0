Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E708849B29F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 12:07:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260096.449250 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJff-0006R4-B5; Tue, 25 Jan 2022 11:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260096.449250; Tue, 25 Jan 2022 11:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCJff-0006Di-1E; Tue, 25 Jan 2022 11:07:31 +0000
Received: by outflank-mailman (input) for mailman id 260096;
 Tue, 25 Jan 2022 11:07:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rP4T=SJ=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nCJaF-0006t5-Bu
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 11:01:55 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3438a97b-7dce-11ec-bc18-3156f6d857e4;
 Tue, 25 Jan 2022 12:01:53 +0100 (CET)
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
X-Inumbo-ID: 3438a97b-7dce-11ec-bc18-3156f6d857e4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643108513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MlVc33IS7S+4kuvMZHec69OzaPEt83rbtePEqH7p84k=;
  b=fFXhLPNIzvWGdpgtnL+ujm5cmAM02ss0XMgGzoaYNfCOdIso0w7CfAWH
   iXu6TLUr6V6wkAG31NlJZ00fokpEjfrDnI1ZeYFCiHTDV9Lbe5uVPviEg
   +V+tq5cMCavAJXDpfF2plcazd0Dvi1Zm8Eqav1FqZGWtBXvTgzrAcoNpQ
   s=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 7fGqrx5EqigVo8VPPv8hW0O3oga3EzqSXc7oSh0+frN88561YQBOGlbVvj+yNhwxDcEsmHTHLR
 x8FzdloCYOOpZRKMfJ0BFqJPaVAqMhh7dhpB/TbYGkaM2FsyztmPCsnHdFYOjmtVZVL5H6HB1k
 Iw9zthguv2nUwPI7UU+mGC7bV7TJE8iXPU1GrzS4jfHCAJRRUPR9Y4Buf3EBKxwkF1Fsho1uNC
 6+L8jwo2eTwMx3WyYHQ3iz9uk6PMVk/cdVufv/iXE/AW/1wvvXnFlNCVEtt551PEG7T5Rc5dPW
 ZlHLArGNkMc0ctMOiTKOKBs2
X-SBRS: 5.2
X-MesageID: 62699895
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XG8o/q4yz+kns/m5TAqCvwxRtOzAchMFZxGqfqrLsTDasY5as4F+v
 mocX2jVOquNZ2Ogetx/Ody28kkB6MWAn95iTQA9rCk2Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FV8MpBsJ00o5wbZg2NMw2LBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zz
 +kRkIGUV1cVGKjGpu45AwdbEjFfIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQR6iPN
 ppINFKDajzkUQBFBHMOKKtmws2LniP5VSV9s3G88P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u12bzDwweNdef4SGY6X/qjejK9QvrVYRXGLCm+/pChFyI2ndVGBAQTUG8o/Sylgi5Qd03F
 qAP0nNw9+5orhXtF4SjGU3jyJKZgvICc91sT8gnzB/d9ozR6TiTIjgaTT9RScNz4afaWgcW/
 lOOmtroAxlmv7uUVW+R+9+okN+iBcQGBTRcPHFZFGPp9/Gm+dhu1UyXEr6PBYbo1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNOtTABbvzt68owGOlor+p5
 iRsdy+2t7hmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8ifx81Y5lbJ264O
 Cc/XD+9ArcJYBNGiocsO+qM5zkCl/C8RbwJqNiKBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6NGfjTkkr2uZLDNC/9YepUazOmM7FmhJ5oVS2Iq
 b6zwePQlUUGOAA/CwGKmbMuwacidChiWsuu+pUJL4Zu4GNOQQkcNhMY+pt5E6QNokifvr2gE
 qiVVhAKxVzhq2fALAnWOHlvZKm2BcR0rG4hPDxqNlGtgiBxbYGq5aYZVp02Ybh4q7Azka8qF
 6EIK5eaH/BCajXb4DBBP5Pzm5NvKUawjgWUMiv7PDVmJ8x8RxbE88PPdxf08HVcFTK+sMYz+
 uXy1g7STZcZaR5lCcLaNKCmw1+r5CBPk+NuRUrYZNJUfRy0ooRtLiXwiN4xIt0NdkqflmfLi
 V7ODE5B9+fXooIz/N3Yvoy+rt+kQ7lkA05XP2jH9rLqZyPUyXWunN1bW+GScDGDCG6toPe+Z
 f9Yxu3XOeEcmAoYqJJ1FrtmwP5s59broLMGnA1oEG+SMgauA7JkZHKHwdNOputGwboA4Vm6X
 UeG+997P7SVOZy6TA5NdVR9NunTh+sJnjTy7OguJBSo7SB6y7OLTEFOMkTekydaNrZ0bNsoz
 OpJVBT6MOBjZs7G6uq7sx0=
IronPort-HdrOrdr: A9a23:0dA1jqmZ+JUcYZTIlQZZYGMAQ3npDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.88,314,1635220800"; 
   d="scan'208";a="62699895"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v9 18/30] build: generate x86's asm-macros.h with filechk
Date: Tue, 25 Jan 2022 11:00:51 +0000
Message-ID: <20220125110103.3527686-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125110103.3527686-1-anthony.perard@citrix.com>
References: <20220125110103.3527686-1-anthony.perard@citrix.com>
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
index 9494e4a3df79..de7f7ce07b98 100644
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


