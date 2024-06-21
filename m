Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41650912DBF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 21:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745497.1152634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKjj1-0004qK-5I; Fri, 21 Jun 2024 19:15:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745497.1152634; Fri, 21 Jun 2024 19:15:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKjj1-0004oE-2R; Fri, 21 Jun 2024 19:15:07 +0000
Received: by outflank-mailman (input) for mailman id 745497;
 Fri, 21 Jun 2024 19:15:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DyDD=NX=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sKjiy-0004Zs-V3
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 19:15:04 +0000
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f6ce7f0-3002-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 21:15:04 +0200 (CEST)
Delivered-To: tamas@tklengyel.com
Received: by mx.zohomail.com with SMTPS id 1718997294380168.4349606052541;
 Fri, 21 Jun 2024 12:14:54 -0700 (PDT)
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
X-Inumbo-ID: 8f6ce7f0-3002-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; t=1718997296; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f0GGN2wPkxoNdUdauBNAYzKCDO2IKvPkY+1VkdH/SMtHDFTJ3K2MuiB0uF2eTAIajjNn9xoLASUhJkq8tJRQmEKkvoGx5z9kk0ummam/PwRTKSoQ2zBA83irqfUsyUL5W0Z8AwApmu9b4y2k/1bjA8MeuozfWHTCLoYk1eg/9Y4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1718997296; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=tf78nJzAnYuw/IQmW4aPCL35F7SvB2Dnwn2xVGuwziQ=; 
	b=EUgMRdN0JwK65zlcVvYPIFoTD1coq0QvIjy3kX+66DzQWqbt+e+jCWlINGdRWLQ6ntb6AtA1hBrIaMhvvGLgRFHGz2NIsiCkrDNpdZOMvuIDpS6Qtd+6ErkBE8VQsIgKswosrK/hnaH3zlaIRgDXBKSOnmcPLEdJvLXbt7sbd+w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1718997296;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=tf78nJzAnYuw/IQmW4aPCL35F7SvB2Dnwn2xVGuwziQ=;
	b=i7JzvkFtyJTIkE7UG+R4PD7GRW6ROMuQuH8+KS8ofCPr6Ck9WFN7l5HxPIM17cka
	+mkQifs7YN2rxkb8Gq26NmCV0epvS4zNDF4dDePw0aioZCK5lA14qE5Lr35UqAdHu9Z
	0id9QOdRAZe42xoJxo+Z3Q/dTN20pPMe7SK2YltU=
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
Date: Fri, 21 Jun 2024 15:14:33 -0400
Message-Id: <20240621191434.5046-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This target enables integration into oss-fuzz.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 tools/fuzz/x86_instruction_emulator/Makefile    | 10 ++++++++--
 tools/fuzz/x86_instruction_emulator/fuzz-emul.c |  6 ++----
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/tools/fuzz/x86_instruction_emulator/Makefile b/tools/fuzz/x86_instruction_emulator/Makefile
index 1e4c6b37f5..de5f1e7e30 100644
--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
@@ -3,7 +3,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 
 .PHONY: x86-insn-fuzz-all
 ifeq ($(CONFIG_X86_64),y)
-x86-insn-fuzz-all: x86-insn-fuzzer.a fuzz-emul.o afl
+x86-insn-fuzz-all: x86-insn-fuzzer.a fuzz-emul.o afl libfuzzer
 else
 x86-insn-fuzz-all:
 endif
@@ -58,6 +58,9 @@ afl-harness: afl-harness.o $(OBJS) cpuid.o wrappers.o
 afl-harness-cov: afl-harness-cov.o $(patsubst %.o,%-cov.o,$(OBJS)) cpuid.o wrappers.o
 	$(CC) $(CFLAGS) $(GCOV_FLAGS) $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
 
+libfuzzer-harness: $(OBJS) cpuid.o
+	$(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=fuzzer $^ -o $@
+
 # Common targets
 .PHONY: all
 all: x86-insn-fuzz-all
@@ -67,7 +70,7 @@ distclean: clean
 
 .PHONY: clean
 clean:
-	rm -f *.a *.o $(DEPS_RM) afl-harness afl-harness-cov *.gcda *.gcno *.gcov
+	rm -f *.a *.o $(DEPS_RM) afl-harness afl-harness-cov *.gcda *.gcno *.gcov libfuzzer-harness
 	rm -rf x86_emulate x86-emulate.c x86-emulate.h wrappers.c cpuid.c
 
 .PHONY: install
@@ -81,4 +84,7 @@ afl: afl-harness
 .PHONY: afl-cov
 afl-cov: afl-harness-cov
 
+.PHONY: libfuzzer
+libfuzzer: libfuzzer-harness
+
 -include $(DEPS_INCLUDE)
diff --git a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
index eeeb6931f4..2ba9ca9e0b 100644
--- a/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
+++ b/tools/fuzz/x86_instruction_emulator/fuzz-emul.c
@@ -906,14 +906,12 @@ int LLVMFuzzerTestOneInput(const uint8_t *data_p, size_t size)
 
     if ( size <= DATA_OFFSET )
     {
-        printf("Input too small\n");
-        return 1;
+        return -1;
     }
 
     if ( size > FUZZ_CORPUS_SIZE )
     {
-        printf("Input too large\n");
-        return 1;
+        return -1;
     }
 
     memcpy(&input, data_p, size);
-- 
2.34.1


