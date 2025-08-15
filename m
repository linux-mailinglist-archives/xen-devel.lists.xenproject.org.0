Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1D8B2873E
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083889.1443372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ev-0006Rr-Ak; Fri, 15 Aug 2025 20:41:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083889.1443372; Fri, 15 Aug 2025 20:41:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Ev-0006PA-05; Fri, 15 Aug 2025 20:41:29 +0000
Received: by outflank-mailman (input) for mailman id 1083889;
 Fri, 15 Aug 2025 20:41:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Et-0005Rl-SM
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:27 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36814a16-7a18-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 22:41:26 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b9a342e8ffso1689975f8f.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:26 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:24 -0700 (PDT)
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
X-Inumbo-ID: 36814a16-7a18-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290485; x=1755895285; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9vb1ykp1WCFZixE3MBqEFa5gu4OAlJWE3J2pPtkp/g=;
        b=TPeB+JEzab2G4CDBFksRWlWlfX7EX0d6qI/mQqX1jhO8YxZgKkoo5ggt+S2yiLz2Su
         1eMxx/BZBv1AT/HmNhw079TdW6qe+LcceF33YD8gaCCrsFbdWN+6RP7isBsi3bwMSAQr
         0eNJ1OWyyqZ378LjUKXKgFyKcvtsL7wUMnJcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290485; x=1755895285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9vb1ykp1WCFZixE3MBqEFa5gu4OAlJWE3J2pPtkp/g=;
        b=iiijvnYay7i0HJ9w7PknstUOHL0n3+oInK/asbQ+JBZkRr4GDI+m/+ErlgU1LHc6YI
         2FZIW/+jRy8RhToytZR4cQIKWqcqufs0PX15hzhAgN0E9H9OhMPqUXyxT28IxzKzAicn
         rR9vyjs7PbyuWX+Vdb0KB3+v3Cgsdm2WfqRsDyiYjCt8+DRkXuG4UHH14d84skdWHkt7
         kTfFbiTBRfhm93M4y3pOJVc0yECm/+fm+0P8l9hHWGQktYwfRHi0BxtdvWPnRRvQiy1T
         GDY7juaod6YWfi9kkRrRgS3z7JxGLT9b8owxaTkOOK39JQxtXTBr7xHI0RbJku0P+nMH
         hERQ==
X-Gm-Message-State: AOJu0Yw8FFYaKxBR2f8GJqJbcBqL6A6Z6K84LEbFMn2dOrXdS24sLX9e
	pYZdeFP1RZvmAvNNLNsxKqNJd2tnK3sW2DiDZPoR5C6KV2XIjpVpcHoRD2/hFflxalmD2PA6kbx
	zu6CL
X-Gm-Gg: ASbGncuT4LHEx4zirWgM5kllfPcrjMpzFtTIhhmDYVVA3coVO9fr+Q4a6EWCZamMmWV
	yFEIltEsdjoNg3K1HnW2SsDeP7uxXT1pYU65HxSDNPEJYnukpuDaLaGIudRi5i4gXyvltFEKmiX
	kQKN6zxB2WlkmZehILOGWQw7yncRVFkm4W6aT3+YhHu8vswbYCOC7U+LTfaCO+9ViZ6t4ts6huH
	FNvVBMcKU33TGfnkqBYPhlpvhW9HUGop0guaR00MpxRaGZDfTSvMA0atnhM4DYie6VgT3JNpGwo
	mvcN85xmMuaGVIoji7BIjuypHbfJjaD2kjhC4Cefg2OCys9F3DB/EzDZxB2hCVyD9a0hn+SkcBk
	r87DFscyJvdaWRzNXV4lbxsg1lHHzTY+WdOdnGmFt4tXQS8MTrGGBCzTfDijwl/2sqGaoq5L8a5
	F3
X-Google-Smtp-Source: AGHT+IEfLzdav0QEeJA3iq738WkJCVQpfAhf2z0YY0EDkCnOb2synwzTcDgFsBifp87gCjD10c9Ohw==
X-Received: by 2002:a05:6000:2405:b0:3b7:590d:ac7d with SMTP id ffacd0b85a97d-3bb4a1fa053mr3127627f8f.1.1755290485246;
        Fri, 15 Aug 2025 13:41:25 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 06/16] x86/msr: Split out tsc.h
Date: Fri, 15 Aug 2025 21:41:07 +0100
Message-Id: <20250815204117.3312742-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The TSC functionality is only related to MSRs by write_tsc(), and this really
does not want to be available as widely as is currently is.

asm/time.h shouldn't be including asm/msr.h, but this turns out to be
sufficiently tangled that I've chosen to break it out into it's own patch.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/include/asm/msr.h  | 39 ----------------------------
 xen/arch/x86/include/asm/time.h |  1 +
 xen/arch/x86/include/asm/tsc.h  | 46 +++++++++++++++++++++++++++++++++
 3 files changed, 47 insertions(+), 39 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/tsc.h

diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index 4a35cd0fdff6..1c0e768d9123 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -124,45 +124,6 @@ static inline void msr_split(struct cpu_user_regs *regs, uint64_t val)
     regs->rax = (uint32_t)val;
 }
 
-static inline uint64_t rdtsc(void)
-{
-    uint64_t low, high;
-
-    __asm__ __volatile__("rdtsc" : "=a" (low), "=d" (high));
-
-    return (high << 32) | low;
-}
-
-static inline uint64_t rdtsc_ordered(void)
-{
-    uint64_t low, high, aux;
-
-    /*
-     * The RDTSC instruction is not serializing.  Make it dispatch serializing
-     * for the purposes here by issuing LFENCE (or MFENCE if necessary) ahead
-     * of it.
-     *
-     * RDTSCP, otoh, "does wait until all previous instructions have executed
-     * and all previous loads are globally visible" (SDM) / "forces all older
-     * instructions to retire before reading the timestamp counter" (APM).
-     */
-    alternative_io_2("lfence; rdtsc",
-                     "mfence; rdtsc", X86_FEATURE_MFENCE_RDTSC,
-                     "rdtscp",        X86_FEATURE_RDTSCP,
-                     ASM_OUTPUT2("=a" (low), "=d" (high), "=c" (aux)),
-                     /* no inputs */);
-
-    return (high << 32) | low;
-}
-
-#define __write_tsc(val) wrmsrl(MSR_IA32_TSC, val)
-#define write_tsc(val) ({                                       \
-    /* Reliable TSCs are in lockstep across all CPUs. We should \
-     * never write to them. */                                  \
-    ASSERT(!boot_cpu_has(X86_FEATURE_TSC_RELIABLE));            \
-    __write_tsc(val);                                           \
-})
-
 #define rdpmc(counter,low,high) \
      __asm__ __volatile__("rdpmc" \
 			  : "=a" (low), "=d" (high) \
diff --git a/xen/arch/x86/include/asm/time.h b/xen/arch/x86/include/asm/time.h
index 3dfbb5297a25..c55b69831448 100644
--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -3,6 +3,7 @@
 #define __X86_TIME_H__
 
 #include <asm/msr.h>
+#include <asm/tsc.h>
 
 typedef u64 cycles_t;
 
diff --git a/xen/arch/x86/include/asm/tsc.h b/xen/arch/x86/include/asm/tsc.h
new file mode 100644
index 000000000000..5f48fed26c23
--- /dev/null
+++ b/xen/arch/x86/include/asm/tsc.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef X86_TSC_H
+#define X86_TSC_H
+
+#include <asm/alternative.h>
+
+static inline uint64_t rdtsc(void)
+{
+    uint64_t low, high;
+
+    asm volatile ( "rdtsc" : "=a" (low), "=d" (high) );
+
+    return (high << 32) | low;
+}
+
+static inline uint64_t rdtsc_ordered(void)
+{
+    uint64_t low, high, aux;
+
+    /*
+     * The RDTSC instruction is not serializing.  Make it dispatch serializing
+     * for the purposes here by issuing LFENCE (or MFENCE if necessary) ahead
+     * of it.
+     *
+     * RDTSCP, otoh, "does wait until all previous instructions have executed
+     * and all previous loads are globally visible" (SDM) / "forces all older
+     * instructions to retire before reading the timestamp counter" (APM).
+     */
+    alternative_io_2("lfence; rdtsc",
+                     "mfence; rdtsc", X86_FEATURE_MFENCE_RDTSC,
+                     "rdtscp",        X86_FEATURE_RDTSCP,
+                     ASM_OUTPUT2("=a" (low), "=d" (high), "=c" (aux)),
+                     /* no inputs */);
+
+    return (high << 32) | low;
+}
+
+#define __write_tsc(val) wrmsrl(MSR_IA32_TSC, val)
+#define write_tsc(val) ({                                       \
+    /* Reliable TSCs are in lockstep across all CPUs. We should \
+     * never write to them. */                                  \
+    ASSERT(!boot_cpu_has(X86_FEATURE_TSC_RELIABLE));            \
+    __write_tsc(val);                                           \
+})
+
+#endif /* X86_TSC_H */
-- 
2.39.5


