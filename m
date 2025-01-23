Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29D9A1AD6B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:45:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876420.1286797 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6sc-0001py-B1; Thu, 23 Jan 2025 23:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876420.1286797; Thu, 23 Jan 2025 23:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6sc-0001o0-7T; Thu, 23 Jan 2025 23:44:58 +0000
Received: by outflank-mailman (input) for mailman id 876420;
 Thu, 23 Jan 2025 23:44:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6sb-0007w9-4x
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:44:57 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0caeff66-d9e4-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 00:44:56 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so10246835e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:44:56 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd48a94asm7141855e9.23.2025.01.23.15.44.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:44:54 -0800 (PST)
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
X-Inumbo-ID: 0caeff66-d9e4-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675895; x=1738280695; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgM0qO1a7TmnAaVr92PdlZQNV8dbDE9Lo8CXyhKvg/4=;
        b=Xq1EpJl+70Py/LtP6EAYoCC+9/lLsp8P1gYlPa+EqzwE5fizFA+Y7N+mEBQCtWYPkr
         gqwqJzAIhswNWNHyN51hTKCDgeZcGxQeMz47g2r/A8Ba4yu0FQNZ4d0eadTJd4F4COih
         JhZyMc9e2IYghSbBBJ5QEYhwdRszjHJkGMZgeycX37kWO35e5a1yLqhgBcZs642vl6wv
         sf8NXp1sFZ4Kn8jWilco3bJIgx/dOjvHs3euwrjfHW8JWbkpjcRIOIimaTbRkZJzAicW
         mTh9/abAYst/DDNgLKE7IpGyQOjXTi52w6QdKHnSfkilNPLVAoiiP1KpXiGqZRCqVdPv
         X9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675895; x=1738280695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zgM0qO1a7TmnAaVr92PdlZQNV8dbDE9Lo8CXyhKvg/4=;
        b=KqTc5zy7BIGyUv59r5i/im8LLnW8ojcDwfcfRQ17mdf2vV7UQt/E7VSQBv0nghwzwp
         POKAVtO0WGBEnTFyvULhjAnp3L2VWycp+OgZJxhgX3AcooGghHHLVo4kL16+SNcaWpFZ
         xuTpeyGL1rXE1WtxKI1z0jc9xGbn31Q+haL6R9MtuxsKNSya3z6+Ue8ar9UKf6jdjQtu
         Fs213pyLgd+O/ofVCCVcRPEVO7wIAsIOQPxkpw/3CMa5X0216eh5DCWQBp5xUqDNvReC
         2JFvUbBK4G+5EPYCr47g45thLSBGn/TKUZsuhOBQML8/GWF23ZkbMUg+Qbr9k6TWLQbn
         flvA==
X-Forwarded-Encrypted: i=1; AJvYcCVjiJOkiUaCBQy4w1Mxtlufd3+niJ9tB+uvzuHVOYkdsTaLCT/QV5GFO5oZRp8u6FgPPdcSeuKuk5U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywvu/CYQ34CbL1UzMv2jqXp3Qq8CzdR0V2++a17wh082aPaRMdg
	sliT35SaTJ9lJ0QT3OE5CJBBf8/n5ow7gy/xNZV/kBvEDWptX2IL7N7T0Y0+ljY=
X-Gm-Gg: ASbGncsPnywYvobWU04a0y7jPZzyoeuQZq6nrmtAGxVgcCPNQndvxUifUBqI8gvErjF
	xUMAAoYPn1gLgVZ5Ud5gidY4WTBPuuF4IB0MLW2RuAkMSnjwIn7dFGi00dP4I0gUIs4h19c6G3X
	5Tbaxa9KMEmbVpc6Rl57f7etXc3Tclc1u1huZN09fvDX1SawlAewDkfhF5cfT7Bz/Obx8EZGzDR
	Cg4YHVGTZDj8oC4J8dIG/9cDaBDFAXItA7E/SDj450GHTmFDZa+qZGvlqvsGXUDrUVXtjk3WnhI
	vi+MrBYZSr7toiKniFjNvh5laNQ01XjSQ552vbM7o3Iv4KnFmpqeFaY=
X-Google-Smtp-Source: AGHT+IFu3bGh+dR4gXvA0Xd23GoBCnM+yfw+G3EPNj4Vc2jg+fj1VnlHOFgKCDXygKj5XAozIyeBjA==
X-Received: by 2002:a05:600c:a09:b0:435:9ed3:5688 with SMTP id 5b1f17b1804b1-438913f86dcmr267603485e9.18.1737675895459;
        Thu, 23 Jan 2025 15:44:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	qemu-ppc@nongnu.org,
	qemu-riscv@nongnu.org,
	David Hildenbrand <david@redhat.com>,
	qemu-s390x@nongnu.org,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 07/20] accel/tcg: Build tcg_flags helpers as common code
Date: Fri, 24 Jan 2025 00:44:01 +0100
Message-ID: <20250123234415.59850-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While cpu-exec.c is build for each target,tcg_flags helpers
aren't target specific. Move them to cpu-exec-common.c to
build them once.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cpu-exec-common.c | 33 +++++++++++++++++++++++++++++++++
 accel/tcg/cpu-exec.c        | 32 --------------------------------
 2 files changed, 33 insertions(+), 32 deletions(-)

diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index 6ecfc4e7c21..100746d555a 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "exec/log.h"
 #include "system/cpus.h"
 #include "system/tcg.h"
 #include "qemu/plugin.h"
@@ -25,6 +26,38 @@
 
 bool tcg_allowed;
 
+bool tcg_cflags_has(CPUState *cpu, uint32_t flags)
+{
+    return cpu->tcg_cflags & flags;
+}
+
+void tcg_cflags_set(CPUState *cpu, uint32_t flags)
+{
+    cpu->tcg_cflags |= flags;
+}
+
+uint32_t curr_cflags(CPUState *cpu)
+{
+    uint32_t cflags = cpu->tcg_cflags;
+
+    /*
+     * Record gdb single-step.  We should be exiting the TB by raising
+     * EXCP_DEBUG, but to simplify other tests, disable chaining too.
+     *
+     * For singlestep and -d nochain, suppress goto_tb so that
+     * we can log -d cpu,exec after every TB.
+     */
+    if (unlikely(cpu->singlestep_enabled)) {
+        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP | 1;
+    } else if (qatomic_read(&one_insn_per_tb)) {
+        cflags |= CF_NO_GOTO_TB | 1;
+    } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
+        cflags |= CF_NO_GOTO_TB;
+    }
+
+    return cflags;
+}
+
 /* exit the current TB, but without causing any exception to be raised */
 void cpu_loop_exit_noexc(CPUState *cpu)
 {
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8b773d88478..be2ba199d3d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -148,38 +148,6 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 }
 #endif /* CONFIG USER ONLY */
 
-bool tcg_cflags_has(CPUState *cpu, uint32_t flags)
-{
-    return cpu->tcg_cflags & flags;
-}
-
-void tcg_cflags_set(CPUState *cpu, uint32_t flags)
-{
-    cpu->tcg_cflags |= flags;
-}
-
-uint32_t curr_cflags(CPUState *cpu)
-{
-    uint32_t cflags = cpu->tcg_cflags;
-
-    /*
-     * Record gdb single-step.  We should be exiting the TB by raising
-     * EXCP_DEBUG, but to simplify other tests, disable chaining too.
-     *
-     * For singlestep and -d nochain, suppress goto_tb so that
-     * we can log -d cpu,exec after every TB.
-     */
-    if (unlikely(cpu->singlestep_enabled)) {
-        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP | 1;
-    } else if (qatomic_read(&one_insn_per_tb)) {
-        cflags |= CF_NO_GOTO_TB | 1;
-    } else if (qemu_loglevel_mask(CPU_LOG_TB_NOCHAIN)) {
-        cflags |= CF_NO_GOTO_TB;
-    }
-
-    return cflags;
-}
-
 struct tb_desc {
     vaddr pc;
     uint64_t cs_base;
-- 
2.47.1


