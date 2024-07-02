Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7183F923BF6
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:02:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752287.1160528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGj-0002Hp-54; Tue, 02 Jul 2024 11:01:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752287.1160528; Tue, 02 Jul 2024 11:01:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGi-0002B7-US; Tue, 02 Jul 2024 11:01:52 +0000
Received: by outflank-mailman (input) for mailman id 752287;
 Tue, 02 Jul 2024 11:01:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObGg-0000Yl-P8
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:01:50 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b7479ea-3862-11ef-92e8-0d9d20120eaa;
 Tue, 02 Jul 2024 13:01:50 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57cf8880f95so1613980a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:01:50 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7516310768sm269306866b.218.2024.07.02.04.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:01:48 -0700 (PDT)
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
X-Inumbo-ID: 7b7479ea-3862-11ef-92e8-0d9d20120eaa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719918109; x=1720522909; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXjBrtu/mn1eJNJdFhT1OrmNKZhkrDBzpy+oMb6YDGA=;
        b=WRU82DuMVuDosncPfJcnZKmpEFDRvDondSvNkQ4Fi81hM0YiKMKMREVzmB4IqNXhgX
         7rau8SS+ASueN8HsuQ4NJ4Z3VTFPmkzzOkiQ0XDqVyl5dMhUq0n7Iavc6ZmoTzeONbu1
         oGCU9SW+GSIvK8rH3lky8+lK/5aGAohMIwmRY7DHt32OekQcBPSzZwh1PiDxOROzlHvF
         /KBbE71J1eRfmlzFmsownVO0Jnm1LZef5WyNf5Qav/tdAGeF9IGEecMy4TUBxRR2HKXk
         FCRE4RLVEKFxwXLs3jsi8Cgt4v4aH+uFpqdtC9Gg2g8xh6vaPW4UmGU0lWCXZo0WgrMo
         dP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719918109; x=1720522909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vXjBrtu/mn1eJNJdFhT1OrmNKZhkrDBzpy+oMb6YDGA=;
        b=uCCNe7EczaBUKJctOTR0dj/r+CQ8ju5rZVpa5rghSWGvy/KhlRNADFh3ZItczDxrfw
         ceMx15ZRaFjSambQyS7C76Fs+s5zoRtNQ5bpPbseC88CtIc3IcjHF9RVUVoriOVolQcX
         PpwMHC9C/aubKonWGVh4tdeDh95wgYPObaSjnBe0PMcVKdyhztpBXaYwKGqfmDn2y3Uy
         nz4AKWpvGqjjyGg3sJ29jwmaxQPzoL9zdtK/W2lVROv+5DhISHZVxan59d0GuPTzSyHL
         0U2cxRJKo5y6WYQIqGtSf+4NCT9Ft1FKrXRdC8OAC+wZXIfVBccdre2wjB2cFWop+jgG
         8Syw==
X-Gm-Message-State: AOJu0YzeJoeVGoSWSRXO8v+GGvJd/xtCxjIUg8B8R4dV4tskioa5bIz3
	N/7veUZjXdrGX5U80HL/+bilH9gXsnFUwGZWViP50gh+cfxPBMjn+Y6bA1wf
X-Google-Smtp-Source: AGHT+IG1ElP8oExQdN2JZHAW7nJhQL+Q2M1vGiJZplWF++xD9hrNbas2UoMVjgjJXs7kodnWkRIKbg==
X-Received: by 2002:a17:906:eece:b0:a75:20f7:2c71 with SMTP id a640c23a62f3a-a7520f733b6mr605166966b.38.1719918109416;
        Tue, 02 Jul 2024 04:01:49 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v14 8/9] xen/riscv: introduce ANDN_INSN
Date: Tue,  2 Jul 2024 13:01:35 +0200
Message-ID: <07c628e8552f6e31a07e4261b273553cb4a3669b.1719917348.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719917348.git.oleksii.kurochko@gmail.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

RISC-V does a conditional toolchain for the Zbb extension
(xen/arch/riscv/rules.mk), but unconditionally uses the
ANDN instruction in emulate_xchg_1_2().

Fixes: 51dabd6312c ("xen/riscv: introduce cmpxchg.h")

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Suggested-By: Jan Beulich <jbeulich@suse.com>
---
Andrew,

Could you please take a look if you are okay with suggested
changes.

Thanks in advance.
---
 Changes in V14:
  - update the commit on top of ANDN definition.
  - use .insn instead of andn to support gas which doesn't understand
    andn instruction.
  - add Suggested-By: Jan Beulich <jbeulich@suse.com>
---
 Changes in V13:
  - new patch
---
 xen/arch/riscv/include/asm/cmpxchg.h | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
index d5e678c036..34d5bd48b3 100644
--- a/xen/arch/riscv/include/asm/cmpxchg.h
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -18,6 +18,19 @@
         : "r" (new) \
         : "memory" );
 
+/*
+ * To not face an issue that gas doesn't understand ANDN instruction
+ * it is encoded using .insn directive.
+ */
+#ifdef __riscv_zbb
+#define ANDN_INSN(rd, rs1, rs2)                 \
+    ".insn r 0x33, 0x7, 0x20, " rd ", " rs1 ", " rs2 "\n"
+#else
+#define ANDN_INSN(rd, rs1, rs2)                 \
+    "not " rd ", " rs2 "\n"                     \
+    "and " rd ", " rs1 ", " rd "\n"
+#endif
+
 /*
  * For LR and SC, the A extension requires that the address held in rs1 be
  * naturally aligned to the size of the operand (i.e., eight-byte aligned
@@ -48,7 +61,7 @@
     \
     asm volatile ( \
         "0: lr.w" lr_sfx " %[old], %[ptr_]\n" \
-        "   andn  %[scratch], %[old], %[mask]\n" \
+        ANDN_INSN("%[scratch]", "%[old]", "%[mask]") \
         "   or   %[scratch], %[scratch], %z[new_]\n" \
         "   sc.w" sc_sfx " %[scratch], %[scratch], %[ptr_]\n" \
         "   bnez %[scratch], 0b\n" \
-- 
2.45.2


