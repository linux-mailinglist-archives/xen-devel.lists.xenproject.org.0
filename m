Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEE7938E0C
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:28:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761717.1171728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrDE-0000uQ-E9; Mon, 22 Jul 2024 11:28:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761717.1171728; Mon, 22 Jul 2024 11:28:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrDE-0000sv-AX; Mon, 22 Jul 2024 11:28:16 +0000
Received: by outflank-mailman (input) for mailman id 761717;
 Mon, 22 Jul 2024 11:28:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NZPk=OW=tklengyel.com=tamas@srs-se1.protection.inumbo.net>)
 id 1sVrDD-0000sp-6Z
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:28:15 +0000
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a2bd883-481d-11ef-8776-851b0ebba9a2;
 Mon, 22 Jul 2024 13:28:12 +0200 (CEST)
Delivered-To: tamas@tklengyel.com
Received: by mx.zohomail.com with SMTPS id 1721647686831665.0341236552222;
 Mon, 22 Jul 2024 04:28:06 -0700 (PDT)
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
X-Inumbo-ID: 7a2bd883-481d-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; t=1721647687; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j10/goW7RN7eCvke70GqEfnK0rXTWCncxuQs9C25KDmRCZaKBYaTVmdTz3rypheWfsacrPUJVC7FfaTDW740SNXeRZeljFMga8aQetwhuDiQkxiUTramlZsZ+C/svJTLQCEWFwoNhF9QschqvbDpmq8Q55idx0Ief2xpN0d8rxM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1721647687; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HieetjExu5I7xoXlEGqeRNpSpjg7l1g9QmXoFqXatYs=; 
	b=TUgYQOwkyTPagoACQb96yuM8f5SfuvpRSj3DmTj1BgELmvpHSoOrUTj8xBfMGyJ8EdlWxmN4vKKlftWEF/ohVBV5HO8Itb0Gt7i2I3HHGfu9nrCBbyc58rerLLFUvzNw2wwyr6ym+iSh8X/8UroKmjVCnyK0oTY5mHQo2NQLy+4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=tklengyel.com;
	spf=pass  smtp.mailfrom=tamas@tklengyel.com;
	dmarc=pass header.from=<tamas@tklengyel.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1721647687;
	s=zmail; d=tklengyel.com; i=tamas@tklengyel.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=HieetjExu5I7xoXlEGqeRNpSpjg7l1g9QmXoFqXatYs=;
	b=k3mW3v5tzdvHKqGExbvaMIrM8iWpiQUwhyfnihyJ4NgwBsIz2SOUx1O1MEwAJund
	Ix/fJYKX0fR0+VtOZIMMCNE4xy1meh4p7lOh9wB1JrTkLWa+hZaI9Dy5JtKi+yKsr4m
	Wmb9H5QfwogNuqx0/EbIG/+Pk7raSwKjF6zN+o64=
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Anthony PERARD <anthony@xenproject.org>
Subject: [PATCH v3 1/2] Add libfuzzer target to fuzz/x86_instruction_emulator
Date: Mon, 22 Jul 2024 07:27:51 -0400
Message-Id: <20240722112752.4981-1-tamas@tklengyel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This target enables integration into oss-fuzz. Changing invalid input return
to -1 as values other then 0/-1 are reserved by libfuzzer. Also adding the
missing __wrap_vsnprintf wrapper which is required for successful oss-fuzz
build.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
v3: don't include libfuzzer-harness in target 'all' as it requires specific cc
---
 tools/fuzz/x86_instruction_emulator/Makefile    |  6 +++++-
 tools/fuzz/x86_instruction_emulator/fuzz-emul.c |  6 ++----
 tools/tests/x86_emulator/wrappers.c             | 11 +++++++++++
 3 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/tools/fuzz/x86_instruction_emulator/Makefile b/tools/fuzz/x86_instruction_emulator/Makefile
index 1e4c6b37f5..459743f4d9 100644
--- a/tools/fuzz/x86_instruction_emulator/Makefile
+++ b/tools/fuzz/x86_instruction_emulator/Makefile
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
+	rm -f *.a *.o $(DEPS_RM) *.gcda *.gcno *.gcov
+	rm -f afl-harness afl-harness-cov libfuzzer-harness
 	rm -rf x86_emulate x86-emulate.c x86-emulate.h wrappers.c cpuid.c
 
 .PHONY: install
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


