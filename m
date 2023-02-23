Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DEA6A128C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 23:05:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500718.772197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVJhR-0002Ud-UP; Thu, 23 Feb 2023 22:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500718.772197; Thu, 23 Feb 2023 22:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVJhR-0002SU-RR; Thu, 23 Feb 2023 22:04:25 +0000
Received: by outflank-mailman (input) for mailman id 500718;
 Thu, 23 Feb 2023 22:04:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fv/5=6T=citrix.com=prvs=411d40f12=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVJhP-0002SO-UQ
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 22:04:24 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 044619af-b3c6-11ed-a82a-c9ca1d2f71af;
 Thu, 23 Feb 2023 23:04:19 +0100 (CET)
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
X-Inumbo-ID: 044619af-b3c6-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677189859;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=E4KXqTbBtzEm7GtNIUTntvH9tKT1e6wGunp75/m7oHw=;
  b=RD3Ui4a8WPSXmp3h7jBslwSOl0W/4HKWorxtQKzkxOA5kbfnz6Wv8fwZ
   JLna1VznF9x32VPGjRLdq5t0K2Sk9KK40BA4DH89uXQBPooQMy6LMRmLU
   vqeQlyWHVPoJw86ZhEaiCNEVmK1zUguqAC29QfIZ4rlyySt6kw5I16MNP
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100719643
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:hQ6xgqxzn6y+aGgr1Bt6t+chxirEfRIJ4+MujC+fZmUNrF6WrkVVn
 WUbWjrSOa6DMWKjKdAnOoyy9k8AsMCGyIIxHgNuqCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRkP6sT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUwTr
 KAZOhk0Uk+ehsKs5JexSOBgutt2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwNxhnB9
 zyapAwVBDkdDfKe5xalrEijm9SSmCyiQropKIWno6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiFFQMwrsokxXzNC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0cvOHZYTBks2uW8vYATlDbqRNRqHJKq24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ904DNJWfh0B3iM4ldjBM
 SfuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKlDYpX4xPxHNjjC8+KTJrU3YE
 c3GGftA8F5AUfg3pNZIb7p1PUAXKtAWmjqIGMGTI+WP2ruCfn+FIYrpw3PXBt3VGJis+V2Pm
 /4Gbpvi9vmqeLGmCsUh2dJJfA9iwLlSLcyelvG7gcbfe1A6QD98UKWPqV7jEqQ895loei7z1
 inVcidlJJDX3xUr9S3ihqhfVY7S
IronPort-HdrOrdr: A9a23:LElF16pd793uSovlcEymnBsaV5o8eYIsimQD101hICG9Ffbo9P
 xG/c566faQsl16ZJhOo7690da7MBbhHPJOjbX5Xo3OYOCFghrLEGgK1+KL/9SKIUzDH4Bmup
 uIepIObOHNMQ==
X-IronPort-AV: E=Sophos;i="5.97,322,1669093200"; 
   d="scan'208";a="100719643"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [PATCH] xen: Work around Clang -E vs -Wunicode bug
Date: Thu, 23 Feb 2023 22:03:58 +0000
Message-ID: <20230223220358.2611252-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

https://github.com/llvm/llvm-project/issues/60958

While trying to work around a different Clang-IAS bug, I stubled onto

  In file included from arch/x86/asm-macros.c:3:
  ./arch/x86/include/asm/spec_ctrl_asm.h:144:19: error: \u used with
  no following hex digits; treating as '\' followed by identifier [-Werror,-Wunicode]
  .L\@_fill_rsb_loop\uniq:
                    ^

It turns out that Clang -E is sensitive to the file extension of the source
file it is processing.

asm-macros should really have been .S from the outset, as it is ultimately
generating assembly, not C.  Rename it, which causes Clang not to complain.

We need to introduce rules for generating a .i file from .S, and substituting
c_flags for a_flags lets us drop the now-redundant -D__ASSEMBLY__.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/Rules.mk                                | 6 ++++++
 xen/arch/x86/Makefile                       | 2 +-
 xen/arch/x86/{asm-macros.c => asm-macros.S} | 0
 3 files changed, 7 insertions(+), 1 deletion(-)
 rename xen/arch/x86/{asm-macros.c => asm-macros.S} (100%)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index d6b7cec0a882..59072ae8dff2 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -273,6 +273,9 @@ $(filter %.init.o,$(obj-y) $(obj-bin-y) $(extra-y)): $(obj)/%.init.o: $(obj)/%.o
 quiet_cmd_cpp_i_c = CPP     $@
 cmd_cpp_i_c = $(CPP) $(call cpp_flags,$(c_flags)) -MQ $@ -o $@ $<
 
+quiet_cmd_cpp_i_S = CPP     $@
+cmd_cpp_i_S = $(CPP) $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
+
 quiet_cmd_cc_s_c = CC      $@
 cmd_cc_s_c = $(CC) $(filter-out -Wa$(comma)%,$(c_flags)) -S $< -o $@
 
@@ -282,6 +285,9 @@ cmd_cpp_s_S = $(CPP) $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
 $(obj)/%.i: $(src)/%.c FORCE
 	$(call if_changed_dep,cpp_i_c)
 
+$(obj)/%.i: $(src)/%.S FORCE
+	$(call if_changed_dep,cpp_i_S)
+
 $(obj)/%.s: $(src)/%.c FORCE
 	$(call if_changed_dep,cc_s_c)
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 177a2ff74272..5accbe4c6746 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -240,7 +240,7 @@ $(obj)/efi/buildid.o $(obj)/efi/relocs-dummy.o: ;
 .PHONY: include
 include: $(objtree)/arch/x86/include/asm/asm-macros.h
 
-$(obj)/asm-macros.i: CFLAGS-y += -D__ASSEMBLY__ -P
+$(obj)/asm-macros.i: CFLAGS-y += -P
 
 $(objtree)/arch/x86/include/asm/asm-macros.h: $(obj)/asm-macros.i $(src)/Makefile
 	$(call filechk,asm-macros.h)
diff --git a/xen/arch/x86/asm-macros.c b/xen/arch/x86/asm-macros.S
similarity index 100%
rename from xen/arch/x86/asm-macros.c
rename to xen/arch/x86/asm-macros.S
-- 
2.30.2


