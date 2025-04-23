Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19FA97BF1
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 03:03:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963777.1354716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVl-00013k-HE; Wed, 23 Apr 2025 01:02:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963777.1354716; Wed, 23 Apr 2025 01:02:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7OVl-000122-EM; Wed, 23 Apr 2025 01:02:49 +0000
Received: by outflank-mailman (input) for mailman id 963777;
 Wed, 23 Apr 2025 01:02:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dLR5=XJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7OVk-0000oH-Dg
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 01:02:48 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id abab4d9f-1fde-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 03:02:47 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-43edecbfb94so60201785e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 18:02:47 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-44092d2326dsm6707635e9.15.2025.04.22.18.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 18:02:45 -0700 (PDT)
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
X-Inumbo-ID: abab4d9f-1fde-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745370166; x=1745974966; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBk2Bkks19S53TDx+/MMHfe9z/s9WQXhsbPDXWcJ6Gk=;
        b=UMwEaKw68htl2NZxRZCqHqyz5XU1JLqQmCWbhQGsW/fDSibnA9Gp/cIls2vDMLEz2c
         72s+8aewG3PmAHdZCffpfkE110N7d6vOfyY77Kys5mXMlRKD4v85oXPg6SzutPfr5SBG
         IcJM1G8woGvnuRzPNEi0LgE9SblLHWV+u4/gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745370166; x=1745974966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBk2Bkks19S53TDx+/MMHfe9z/s9WQXhsbPDXWcJ6Gk=;
        b=iqoUWaOPgdLUNlDLyNAs+QGv5xmQqtTgaCux70X902Jt3mYsIIhskuG423nE6dNYvR
         kggoNBNIrotSnv4b2VObVlxZvRGYT0S3RY90ujYXIHu0UmauWug6J8I6vGLW8KrxKNoZ
         +hzZ+qGu2fBYna+TgKwakyJj366iwM1DTJKIHVLJITpK7wrGdNwu9rMqoey/WqaDUqEq
         +wNhMIZvdjBLmYHY3fGOpU9IMxwa8GEzBu1fPW6yfY43PSi+n+UiwTlBNjFaXcOqjCfE
         NvDbeFocVYvjvX6WKxUrkW4ZHzmGDjZQttoUc46+p+UzSX7dYRIrLHK28MiJqr24T/TQ
         OQCw==
X-Gm-Message-State: AOJu0YyTjmQcR7nSjtLso+uDnrcshs6LzahY700bwoBCqchWTWf1LtSz
	xE4Qq699G+4Gdy880vaTiREUOa1G/2KRjmmQ/kTuzQR6BjOM21kXPfpqcvR6mwTLVzQ218NZdYc
	1
X-Gm-Gg: ASbGncsvj/q3Pe1mPpgSGqHC0ky9jarxXiWmQRzcaXtCyG+NGzQ+XOp4pbXuWPgpgF5
	b3g2uR5xsAb6jZ9QvQsbZn2zeNljmjWjUGdwKulENoWOwXrioJoqt7/qykqTFlNiHtGWRdqaJyi
	6SUb1FcGmRM0Nz0d2xo57D+xiFOvp4i50HvkDdC7fWrPjjJflpW39DY8e/PuxHJxBPRWNE8xbcj
	c7PfgYRzgp9wzSbMuj8h7+Oi13WYTb5mVt9nJ5N9GujdzcG4c/Zl86Ch7Nk2QnH55FfnzhusvOR
	2TN5JTCRNh4wyEHiEa0Jh2ZRJLQ6AqFWYSATlBgKHmTiNzpmdloCMBf9DiTmoA==
X-Google-Smtp-Source: AGHT+IECRcenPSj7qe5KMmpxDDkvujUjR3cZAXi+zIeQHDXnn5RCoe4eX1JvNdayYhnQ/L4lk0wKIQ==
X-Received: by 2002:a05:600c:cc4:b0:43b:ce3c:19d0 with SMTP id 5b1f17b1804b1-4406ac176ecmr146769205e9.29.1745370166523;
        Tue, 22 Apr 2025 18:02:46 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/8] x86/altcall: Rename alternative_branches() to boot_apply_alt_calls()
Date: Wed, 23 Apr 2025 02:02:31 +0100
Message-Id: <20250423010237.1528582-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
References: <20250423010237.1528582-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The alternatives APIs are not great; rename alternative_branches() to be more
precise.  Centralise the declaration in xen/alternative-call.h, in the
expectation that x86 won't be the only user in the long term.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/alternative.c             |  2 +-
 xen/arch/x86/include/asm/alternative.h |  1 -
 xen/arch/x86/setup.c                   |  3 ++-
 xen/include/xen/alternative-call.h     | 10 +++++++++-
 4 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 1ba35cb9ede9..d1a3b7ea7ca6 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -493,7 +493,7 @@ void __init alternative_instructions(void)
     _alternative_instructions(false);
 }
 
-void __init alternative_branches(void)
+void __init boot_apply_alt_calls(void)
 {
     local_irq_disable();
     _alternative_instructions(true);
diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index 2d2ace97f794..29c3d724b07f 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -29,7 +29,6 @@ extern void add_nops(void *insns, unsigned int len);
 /* Similar to alternative_instructions except it can be run with IRQs enabled. */
 extern int apply_alternatives(struct alt_instr *start, struct alt_instr *end);
 extern void alternative_instructions(void);
-extern void alternative_branches(void);
 
 #define alt_orig_len       "(.LXEN%=_orig_e - .LXEN%=_orig_s)"
 #define alt_pad_len        "(.LXEN%=_orig_p - .LXEN%=_orig_e)"
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index cf1ea040dd90..25189541244d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1,4 +1,5 @@
 #include <xen/acpi.h>
+#include <xen/alternative-call.h>
 #include <xen/bitops.h>
 #include <xen/console.h>
 #include <xen/cpu.h>
@@ -2082,7 +2083,7 @@ void asmlinkage __init noreturn __start_xen(void)
 
     do_presmp_initcalls();
 
-    alternative_branches();
+    boot_apply_alt_calls();
 
     /*
      * NB: when running as a PV shim VCPUOP_up/down is wired to the shim
diff --git a/xen/include/xen/alternative-call.h b/xen/include/xen/alternative-call.h
index 39339c3f0f76..3c855bfa44f5 100644
--- a/xen/include/xen/alternative-call.h
+++ b/xen/include/xen/alternative-call.h
@@ -17,6 +17,8 @@
  *   generation requirements are to emit a function pointer call at build
  *   time, and stash enough metadata to simplify the call at boot once the
  *   implementation has been resolved.
+ * - Implement boot_apply_alt_calls() to convert the function pointer calls
+ *   into direct calls on boot.
  * - Select ALTERNATIVE_CALL in Kconfig.
  *
  * To use:
@@ -57,7 +59,13 @@
 # define __alt_call_maybe_initdata __initdata
 #endif
 
-#else
+/*
+ * Devirtualise the alternative_{,v}call()'s on boot.  Convert still-NULL
+ * function pointers into traps.
+ */
+void boot_apply_alt_calls(void);
+
+#else /* CONFIG_ALTERNATIVE_CALL */
 
 #define alternative_call(func, args...)  (func)(args)
 #define alternative_vcall(func, args...) (func)(args)
-- 
2.39.5


