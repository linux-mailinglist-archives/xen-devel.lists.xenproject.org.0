Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75BD45DB5B
	for <lists+xen-devel@lfdr.de>; Thu, 25 Nov 2021 14:41:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.231205.399923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzB-0007A9-54; Thu, 25 Nov 2021 13:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 231205.399923; Thu, 25 Nov 2021 13:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqEzB-00077c-1o; Thu, 25 Nov 2021 13:40:25 +0000
Received: by outflank-mailman (input) for mailman id 231205;
 Thu, 25 Nov 2021 13:40:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nd7+=QM=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1mqEz9-00076i-Na
 for xen-devel@lists.xenproject.org; Thu, 25 Nov 2021 13:40:23 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bb2965d-4df5-11ec-a9d2-d9f7a1cc8784;
 Thu, 25 Nov 2021 14:40:22 +0100 (CET)
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
X-Inumbo-ID: 3bb2965d-4df5-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637847622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3TQKgoJFKLvb/aD7eyqYNC+fnivFbK5/r2SXs8WsbPs=;
  b=Kje9dQOfQct130uYUl4Ir//S4nQ2kGJ9Il5s5h9FeGO2y+ImNmWEMZbC
   CA539PslonDGF+tHl3Th66OinhXVS1rqpBxml5zl7vKvHu88Qz/oqb8UX
   jdIennNga6ONngXZ8DbZxZzlH+5EUIlnEWE0mordkDn4+dlgZobcYNth1
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: KMIXkhlZhaEdfsEkQIeuQqBHWEH549fyuRTXa4OHmLUSWoU5ue6QN7iEdTafcSHwP6kDAyyebG
 6fu7WqK2HidQJXM583jd8mylgGnKbBLxxxSBiQsAXbkbgy6fBZx5oYmUNz5zYouNFzsPdTzcEW
 MAT3W1DEVKH1oxRN7MTgIcSvHzi8I41gaP2DFX12/lGZn6R7ymEHjwz1JqZAz+5T42Wb0NpAil
 U8rYRS9D8GmDJtrY/x1Q443+zmMk0ENKWIvlGUzNrsyfl8wnMKJJPMWx9Gr9sqbI1Pv+WumPK3
 pA4jmQKiw0RcNTO/AUEhf5RL
X-SBRS: 5.1
X-MesageID: 60634057
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:FEB6h61ZLSIXXSw8MPbD5Xh2kn2cJEfYwER7XKvMYLTBsI5bpzJTm
 2pOUW6BP/aMNDPzf9lzOY6y9klVvMPQyddiSAZopC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wbNh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhgvlui
 4xDq8yJUAZqA6PKh9YFVDh2HHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9u3p4VQa6DO
 KL1bxJtdlPCbkBNAG0wJ6MCjr66g0nyKWJh/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nnd423zDxUeNdqe4TmI6HShgqnIhyyTcIgfDqGi//hmxlia3HUOCQY+XEG+5/K+jyaWZdVbL
 EAF/zs0moI7/kerU9rVUgWxpTiPuRt0c9haHvA+6QqN4rHJ+AvfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaESoIKW4PYwcUQA1D5MPsyKkykRDnXttlCLSyjND+BXf32
 T/ikcQlr+xN14hRjfz9pA2ZxWL3znTUcuIrzhj+QSH84B0pXZekJLGm70fp9fFhAonMGzFto
 0M4s8SZ6ekPC7SEmyqMXPgBEdmV2hqVDNHPqQUxRsd8rlxB71bmJNkNu28meC+FJ+5dIWexC
 HI/rz+983O60JGCSaZsK7y8BM0xpUQLPYS0D6uEBjaij3UYSeNmwM2MTRLPt4wOuBJ1+U3aB
 Xt8WZzxZUv28Yw9kFKLqx41iNfHPBwWy2LJXozcxB+6y7eYb3P9Ye5bawTRMbFpvPLe/lS9H
 zNj2yyikUs3bQEDSnOPrd57wa4icRDX+qwaW+QIL7Xec2KK6UkqCuPLwKNJRmCWt/89qws8x
 VnkAhUw4AOm3RXvcFzWAlg+OOKHdcsu9hoTYH1zVWtELlB+OO5DGo9ELMBpFVTmncQ+pcNJo
 w4tJ5/dX68RE2ufoFzwr/DV9eRfSfhivirWVwLNXdT1V8cIq9Xh9oC2cw3x2jMJCybr58Iyr
 6f5jlHQQIYZRhQkB8HTMar9w1S0tHkbueRzQ0qXfYUDJBSyqNBne37rk/s6A8AQMhGflDGU4
 BmbXEUDru7Xro5rrNSQ3fKYr52kGvdVF1ZBGzWJ9q6/MCTXpzLxwYJJXOuSUyraUWf4pPera
 elPlqmuO/wbhlda9YF7Fu8zn6454tLuoZ5czxhlQyqXPwj6VOs4LyDfj8dVt6BLyrtIgieMW
 xqCqotAJLGEGML5C1pNdgArWfuOiKMPkT7I4PVrfEijvH1r/KCKWFl5NgWXjHAPN6N8NY4oz
 LtzuMMS7ADj2BMmPszf03JR/mWIaHcBT78mptcRB4qy0lgnzVRLYJr9DC7q4c7QN4UQYxdye
 jLE1rDfg7l8x1bZdythHHfA6uNRmJAStU0Y11QFPVmIxoLIi/JfMMe9KtjrotC5Fil67t8=
IronPort-HdrOrdr: A9a23:KjzVs6GjUYJIyzndpLqE7seALOsnbusQ8zAXP0AYc3Nom6uj5q
 eTdZUgpGbJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7BZmnbUQKTRekIh7cKgQeQfhEWntQts5
 uIGJIRNDSfNzRHZL7BkWqFL+o=
X-IronPort-AV: E=Sophos;i="5.87,263,1631592000"; 
   d="scan'208";a="60634057"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH v8 01/47] build: factorise generation of the linker scripts
Date: Thu, 25 Nov 2021 13:39:20 +0000
Message-ID: <20211125134006.1076646-2-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211125134006.1076646-1-anthony.perard@citrix.com>
References: <20211125134006.1076646-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

In Arm and X86 makefile, generating the linker script is the same, so
we can simply have both call the same macro.

We need to add *.lds files into extra-y so that Rules.mk can find the
.*.cmd dependency file and load it.

Change made to the command line:
- Use cpp_flags macro which simply filter -Wa,% options from $(a_flags).
- Added -D__LINKER__ even it is only used by Arm's lds.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---

Notes:
    v6:
    - CPP already used instead of CC -E
    - -Ui386 already removed
    - cpp_flags is now a macro
    - rebased
    
    v5:
    - rename cc_lds_S to cpp_lds_S as the binary runned is now CPP
    - Use new cpp_flags instead of the open-coded filter of a_flags.
    
    v4:
    - fix rebuild by adding FORCE as dependency
    - Use $(CPP)
    - remove -Ui386
    - avoid using "define" for cmd_cc_lds_S, as adding '; \' on each line is
      still mandatory for if_changed (or cmd) macro to work.

 xen/Rules.mk          | 4 ++++
 xen/arch/arm/Makefile | 6 ++++--
 xen/arch/x86/Makefile | 6 ++++--
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/Rules.mk b/xen/Rules.mk
index 5e0699e58b2b..d21930a7bf71 100644
--- a/xen/Rules.mk
+++ b/xen/Rules.mk
@@ -238,6 +238,10 @@ cmd_cpp_s_S = $(CPP) $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
 %.s: %.S FORCE
 	$(call if_changed,cpp_s_S)
 
+# Linker scripts, .lds.S -> .lds
+quiet_cmd_cpp_lds_S = LDS     $@
+cmd_cpp_lds_S = $(CPP) -P $(call cpp_flags,$(a_flags)) -D__LINKER__ -MQ $@ -o $@ $<
+
 # Add intermediate targets:
 # When building objects with specific suffix patterns, add intermediate
 # targets that the final targets are derived from.
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 07f634508eee..a3a497bafe89 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -67,6 +67,8 @@ obj-y += vsmc.o
 obj-y += vpsci.o
 obj-y += vuart.o
 
+extra-y += xen.lds
+
 #obj-bin-y += ....o
 
 ifneq ($(CONFIG_DTB_FILE),"")
@@ -132,8 +134,8 @@ $(TARGET)-syms: prelink.o xen.lds
 .PHONY: include
 include:
 
-xen.lds: xen.lds.S
-	$(CPP) -P $(a_flags) -D__LINKER__ -MQ $@ -o $@ $<
+xen.lds: xen.lds.S FORCE
+	$(call if_changed,cpp_lds_S)
 
 dtb.o: $(patsubst "%",%,$(CONFIG_DTB_FILE))
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 69b6cfaded25..669e16e72690 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -78,6 +78,7 @@ obj-y += sysctl.o
 endif
 
 extra-y += asm-macros.i
+extra-y += xen.lds
 
 ifneq ($(CONFIG_HVM),y)
 x86_emulate.o: CFLAGS-y += -Wno-unused-label
@@ -238,6 +239,7 @@ endif
 note_file_option ?= $(note_file)
 
 ifeq ($(XEN_BUILD_PE),y)
+extra-y += efi.lds
 $(TARGET).efi: prelink.o $(note_file) efi.lds efi/relocs-dummy.o efi/mkreloc
 ifeq ($(CONFIG_DEBUG_INFO),y)
 	$(if $(filter --strip-debug,$(EFI_LDFLAGS)),echo,:) "Will strip debug info from $(@F)"
@@ -290,8 +292,8 @@ $(BASEDIR)/include/asm-x86/asm-macros.h: asm-macros.i Makefile
 	$(call move-if-changed,$@.new,$@)
 
 efi.lds: AFLAGS-y += -DEFI
-xen.lds efi.lds: xen.lds.S
-	$(CPP) -P $(call cpp_flags,$(a_flags)) -MQ $@ -o $@ $<
+xen.lds efi.lds: xen.lds.S FORCE
+	$(call if_changed,cpp_lds_S)
 
 boot/mkelf32: boot/mkelf32.c
 	$(HOSTCC) $(HOSTCFLAGS) -o $@ $<
-- 
Anthony PERARD


