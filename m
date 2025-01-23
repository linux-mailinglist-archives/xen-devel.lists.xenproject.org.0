Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D07A1ADA7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:51:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876499.1286917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yv-0000fA-BU; Thu, 23 Jan 2025 23:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876499.1286917; Thu, 23 Jan 2025 23:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yv-0000cI-6i; Thu, 23 Jan 2025 23:51:29 +0000
Received: by outflank-mailman (input) for mailman id 876499;
 Thu, 23 Jan 2025 23:51:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6sh-0007w9-Aj
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:45:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1079a1c2-d9e4-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 00:45:02 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43618283d48so10963145e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:45:02 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd54c0ecsm6510925e9.30.2025.01.23.15.44.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:00 -0800 (PST)
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
X-Inumbo-ID: 1079a1c2-d9e4-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675902; x=1738280702; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b+Ptx+X+/4qytTYw1NRizSw3Es7j283R5duCMBs45So=;
        b=mSzCu3lsl75ZqdOh0twGW/TNRGMSM3RWoRNV4JR7lgge4dQNaPn5y+lgv85xHieIAc
         XoMD7CRZ15lQ6ahBDwRmoQc1GOYISZy+b9temlutfQp6sHmAGHYF5qIHqjmRtdXjpH4d
         7wKBRHsK6C5C0azG6HyFsDXToFnIIdk70V/yNIspNp8dcRDheMUn1tpMWiVHiH1EoWRH
         TBq7a268T/izZqClkzGfCUmTPKvXDJTJ6JUmUYOQ1NCGuRhNKKJyicYhApq87VNra0QT
         AppVm8Cn2Snvo8raY7f8t7ZqDE86mqk7sAEwTaEOnxC0lmrJav/DVacwIc9jTd0afizo
         xI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675902; x=1738280702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b+Ptx+X+/4qytTYw1NRizSw3Es7j283R5duCMBs45So=;
        b=BAdAP0vXXlhcKr5K38O1NexrgGgxQtLK9Zob78jnZlq9Ps9sVrebzh6StSlnKY1COv
         Y8ulVYyCTvzfAXuXi5SiQdJ/Kn9VMzK6p/mz8zDBXnBTSPKHL7ZtF7s2ABeuWyXp2zv2
         3/GcKvTvguYML7nMbcdFLNT6A0dvvNJVPPdwY18fs+TZaSbkNmUARCH780SkyofSLmvB
         uepSKETOKzgRLyJ3jwZNdi1svde3Tw7mh6Zbkcnot1ly70C+9GuAVWY8NqfUODzm51Tj
         jBzU6ExuHeXJsFj9AS8GF6j/Fkyns2T0/MUqdrP1r+UooyLuoWCaaP6fZzA2Mslt6yL2
         ww3w==
X-Forwarded-Encrypted: i=1; AJvYcCWX7O+4S+DHF0408oNgYdSI6mN7k1Hg0isovkswvNRQOY3im69UORYF7K+/AGQvFEH7CrQlhF909xM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzYD7QHxNdJYIQ6KfaD5Tghc9AvDIVzfiQ8RnJ15hFzGI2UW7r1
	vvRk8M40JKgvheiL8QQIxqqV4uDsVnC9J82+fWlwbbUGPT71EY/voIobyrpi298=
X-Gm-Gg: ASbGncttx/aYY87k5B5GnUqRZpG/wPWHZBo5qGr2M2Jb532UagM5o39/OgWha5QZCUh
	R3WEsAk6uVmuPmmuzbvCRiJ+tk3+Dsm2MfJwxRtck2FW5sQzArjxySUiOqVfOzPxBK0bre1MyAn
	MPcAwMdiwl+dHNSWFZfmGggy96x4L7tcRoQDVy1+JIG+Yk6s8vT4tka3SDphvU/rRptc/9D9ak+
	siwuLJ0hqQNEx9mQBv6NRkXk2koiE9vfqFJotZwakFsF0FkcFRLJWU5dfL59KMmR9LhjAF9F1nr
	vaZresfuzXr7Z9jNv/1mNEE99zHfyc1xlnZIsmJ0Cx1ZNIUzxen1GqU=
X-Google-Smtp-Source: AGHT+IGYKHSOUWuv3Z35/L1kDcj+xko6P82ABEfwOu6IFt4mwFRNrLSNCMYz6YlSXtAKxKsobnoAmQ==
X-Received: by 2002:a05:600c:46ca:b0:434:a367:2bd9 with SMTP id 5b1f17b1804b1-438913dfd7fmr310320675e9.14.1737675901922;
        Thu, 23 Jan 2025 15:45:01 -0800 (PST)
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
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH 08/20] accel/tcg: Restrict tlb_init() / destroy() to TCG
Date: Fri, 24 Jan 2025 00:44:02 +0100
Message-ID: <20250123234415.59850-9-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Move CPU TLB related methods to accel/tcg/ scope,
in "internal-common.h".

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/internal-common.h | 11 +++++++++++
 include/exec/exec-all.h     | 16 ----------------
 accel/tcg/user-exec-stub.c  | 11 +++++++++++
 3 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/accel/tcg/internal-common.h b/accel/tcg/internal-common.h
index c8d714256cb..d3186721839 100644
--- a/accel/tcg/internal-common.h
+++ b/accel/tcg/internal-common.h
@@ -53,6 +53,17 @@ TranslationBlock *tb_link_page(TranslationBlock *tb);
 void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                                uintptr_t host_pc);
 
+/**
+ * tlb_init - initialize a CPU's TLB
+ * @cpu: CPU whose TLB should be initialized
+ */
+void tlb_init(CPUState *cpu);
+/**
+ * tlb_destroy - destroy a CPU's TLB
+ * @cpu: CPU whose TLB should be destroyed
+ */
+void tlb_destroy(CPUState *cpu);
+
 bool tcg_exec_realizefn(CPUState *cpu, Error **errp);
 void tcg_exec_unrealizefn(CPUState *cpu);
 
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index d9045c9ac4c..8eb0df48f94 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -29,16 +29,6 @@
 
 #if !defined(CONFIG_USER_ONLY) && defined(CONFIG_TCG)
 /* cputlb.c */
-/**
- * tlb_init - initialize a CPU's TLB
- * @cpu: CPU whose TLB should be initialized
- */
-void tlb_init(CPUState *cpu);
-/**
- * tlb_destroy - destroy a CPU's TLB
- * @cpu: CPU whose TLB should be destroyed
- */
-void tlb_destroy(CPUState *cpu);
 /**
  * tlb_flush_page:
  * @cpu: CPU whose TLB should be flushed
@@ -223,12 +213,6 @@ void tlb_set_page(CPUState *cpu, vaddr addr,
                   hwaddr paddr, int prot,
                   int mmu_idx, vaddr size);
 #else
-static inline void tlb_init(CPUState *cpu)
-{
-}
-static inline void tlb_destroy(CPUState *cpu)
-{
-}
 static inline void tlb_flush_page(CPUState *cpu, vaddr addr)
 {
 }
diff --git a/accel/tcg/user-exec-stub.c b/accel/tcg/user-exec-stub.c
index 4fbe2dbdc88..1d52f48226a 100644
--- a/accel/tcg/user-exec-stub.c
+++ b/accel/tcg/user-exec-stub.c
@@ -1,6 +1,7 @@
 #include "qemu/osdep.h"
 #include "hw/core/cpu.h"
 #include "exec/replay-core.h"
+#include "internal-common.h"
 
 void cpu_resume(CPUState *cpu)
 {
@@ -18,6 +19,16 @@ void cpu_exec_reset_hold(CPUState *cpu)
 {
 }
 
+/* User mode emulation does not support softmmu yet.  */
+
+void tlb_init(CPUState *cpu)
+{
+}
+
+void tlb_destroy(CPUState *cpu)
+{
+}
+
 /* User mode emulation does not support record/replay yet.  */
 
 bool replay_exception(void)
-- 
2.47.1


