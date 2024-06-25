Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C991745F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 00:48:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748149.1155749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMExB-0005jr-Gx; Tue, 25 Jun 2024 22:47:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748149.1155749; Tue, 25 Jun 2024 22:47:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMExB-0005iE-D3; Tue, 25 Jun 2024 22:47:57 +0000
Received: by outflank-mailman (input) for mailman id 748149;
 Tue, 25 Jun 2024 22:47:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v2rz=N3=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sMExA-0004yN-JF
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 22:47:56 +0000
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5182c98-3344-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 00:47:54 +0200 (CEST)
Delivered-To: tamas@tklengyel.com
Received: by mx.zohomail.com with SMTPS id 1719355664606766.5793368921854;
 Tue, 25 Jun 2024 15:47:44 -0700 (PDT)
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
X-Inumbo-ID: f5182c98-3344-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; t=1719355667; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PvDuhUDEeeXYf9z/d2613UB5JA43tWWErWouIeAzXSv5/94atUwO44i/n35SrQ5oDa0av1mz8aMiAhLyBEyRORSFiT7CFj9L5j5gcQt4X6gXNXRthijHqwm830wgb1hw2PzzImWKVh8clVwyy9OCv86LOO5DwpxhrE5PCwGbe8o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1719355667; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HEbFI6t/UgSyN5s43KHHTKJdc0crQlrYCdNUwyv5erM=; 
	b=giWstThJaxPbwO2wsoJ15ajKNj64vSj5Nz5mFA3vL6XRRmwTWx1ylRP/AXYXXfGa+Agg5arQxAMlKPvSEJCGdabxcHkup2NYqTrYXtieWWUZndQBVw/uX09TNoZvDcmSNmNXON1lNKd5Eb/rGAImcEpxlRkqG2moaH8e9r5LpZA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1719355667;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=HEbFI6t/UgSyN5s43KHHTKJdc0crQlrYCdNUwyv5erM=;
	b=aBQg6UNgAAyY1PFrljUnEs/iDGKul2vf9fW7vmu5TDywyzDMX8e9mpJi28Dh5wzK
	WIE4qAt0n5kpn6D/qIEpbydzDanZiVyNK8Ppcvg7xRe3oqdSgkhZoqoPbW1TvWd3NBp
	hTeRTQprKeJm3du7OIRBaaQRxWdiwK8kMDuEKWs8=
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v2 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
Date: Tue, 25 Jun 2024 18:47:37 -0400
Message-Id: <d14436e64c650b388936a921837b984772a4fceb.1719355322.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This target enables integration into oss-fuzz. Changing invalid input return
to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding the
missing __wrap_vsnprintf wrapper which is required for successful oss-fuzz
build.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 tools/fuzz/x86_instruction_emulator/Makefile    | 11 +++++++++--
 tools/fuzz/x86_instruction_emulator/fuzz-emul.c |  6 ++----
 tools/tests/x86_emulator/wrappers.c             | 11 +++++++++++
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/tools/fuzz/x86_instruction_emulator/Makefile b/tools/fuzz/x86_instruction_emulator/Makefile
index 1e4c6b37f5..7b6655805f 100644
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
 
+libfuzzer-harness: $(OBJS) cpuid.o wrappers.o
+	$(CC) $(CFLAGS) $(LIB_FUZZING_ENGINE) -fsanitize=fuzzer $(addprefix -Wl$(comma)--wrap=,$(WRAPPED)) $^ -o $@
+
 # Common targets
 .PHONY: all
 all: x86-insn-fuzz-all
@@ -67,7 +70,8 @@ distclean: clean
 
 .PHONY: clean
 clean:
-	rm -f *.a *.o $(DEPS_RM) afl-harness afl-harness-cov *.gcda *.gcno *.gcov
+	rm -f *.a *.o $(DEPS_RM) *.gcda *.gcno *.gcov \
+        afl-harness afl-harness-cov libfuzzer-harness
 	rm -rf x86_emulate x86-emulate.c x86-emulate.h wrappers.c cpuid.c
 
 .PHONY: install
@@ -81,4 +85,7 @@ afl: afl-harness
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
diff --git a/tools/tests/x86_emulator/wrappers.c b/tools/tests/x86_emulator/wrappers.c
index 3829a6f416..8f3bd1656f 100644
--- a/tools/tests/x86_emulator/wrappers.c
+++ b/tools/tests/x86_emulator/wrappers.c
@@ -91,6 +91,17 @@ int __wrap_snprintf(char *buf, size_t n, const char *fmt, ...)
     return rc;
 }
 
+int __wrap_vsnprintf(char *buf, size_t n, const char *fmt, va_list varg)
+{
+    int rc;
+
+    emul_save_fpu_state();
+    rc = __real_vsnprintf(buf, n, fmt, varg);
+    emul_restore_fpu_state();
+
+    return rc;
+}
+
 char *__wrap_strstr(const char *s1, const char *s2)
 {
     char *s;
-- 
2.34.1


