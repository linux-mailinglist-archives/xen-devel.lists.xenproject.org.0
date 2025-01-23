Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 621DCA1AD63
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:45:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876393.1286767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6sH-0000BF-GF; Thu, 23 Jan 2025 23:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876393.1286767; Thu, 23 Jan 2025 23:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6sH-00008v-AQ; Thu, 23 Jan 2025 23:44:37 +0000
Received: by outflank-mailman (input) for mailman id 876393;
 Thu, 23 Jan 2025 23:44:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6sF-0007hN-GI
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:44:35 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ff707947-d9e3-11ef-99a4-01e77a169b0f;
 Fri, 24 Jan 2025 00:44:34 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso1403875f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:44:33 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1c4006sm982952f8f.94.2025.01.23.15.44.30
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:44:32 -0800 (PST)
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
X-Inumbo-ID: ff707947-d9e3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675873; x=1738280673; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ce4xXqVbqUUJ3kwtGZLdz75HP+CS3yxZeowyzQLM8Ns=;
        b=M8MSYh4FA1WGZl6q5/sHZkYMUsiSlL9TI4NfXSXSADnqsjqXJyDzwMZCV8YNc+HXe6
         U+UfbMytymvLkOfask9hVv6sbCCt6DtOQNhFrVesllxTs0wAEDlj0NVo0lTVvQ6XI1VA
         +3KOIk1xq7252WaZvJZDpj7Qr4dWMVeDEnGnWqNUwhN1nsYw2DZO1z/cB5SvRP/0S5Bb
         geWiYAcEuoR++jg6hL8wIT3B8uWX74L8Z41TsOR4Ud2Tl+o3WItgF7sWtHYN/3zLRUVp
         oVUhfUHmLXmVBbxz1pci90Yf15VJhplSMgCFgeJ26LjzlLP5+x+2HOLPw5thKopI9viQ
         M/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675873; x=1738280673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ce4xXqVbqUUJ3kwtGZLdz75HP+CS3yxZeowyzQLM8Ns=;
        b=ZccKH5rkaOKFpnABW+QiEUa42BED/tZ8OdNN5bBm8SEfEHxUy2ZvxbXSzJ4s5SW+G3
         AX53+mmpZalUiDi2awPis8YELnhr4vVePJjfSwetJ7HCcWBtQEAfzXSHY+TQHBU6hbq0
         gG5BlWdSEzLNCSxGQoJ8ikaLQuXUNfIehwMK2PoP4+OLNQ7KLdF+5VqVw8LqscOQBM+9
         +BgSGRozhRB3kJ9aEjDiVj0MLopaJufzo4HeUNf/Xp7LdKiDNjCoSvkmkXEXUCBzpxEJ
         C38k6R3K3g3yI6KkAkW1GrpHQSO1eWMWAHYH3MyxKvQD+gnu6NQ2409/LNsWNt8D+qlr
         AHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBqGKJd49irVuEE+czPmnZbidXts5wSzp7bdDekE015ciEC6Q1dqR/vyei+OGrXAdxwKh3Hdp8Jzk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxuur7aGUPwh4EGL1ENFXQqt7fnS55ghshPmnqLcaXiDTlxuwov
	WECuH4zJfJd5OjTJKMglP0SbdDq0r91s3M6waYYfe+F9lTTCqI7X0z9qpIcc6gI=
X-Gm-Gg: ASbGnctac+rmcBQtDUZDA9l3OI3TPZC+wBUcaynefeGr2mFQcErlj6+Wu+hnkSgWmJl
	+xyru4P1kMabHWahoFieHE/gM7eDaP8IupcPlGqG2k/AARjbd7Fz/CmRNm4do51wk/qUWt5PV46
	6l/d8saN5Akrh9NGeTruyTyN7eXXfQy4YGss7RqGe2eJmlU/CbIk3VG5YhOwH9yYDy5sWuMtOaW
	A9P9fG2IreQ1vWiFaBxynbEIn+jj1Uk+YYtxZRL6FQI48xbdJ42JFr77l3oRGkckLs0+U+V90SW
	F3Qwm0Hx5nOqeYjEPuONjyQUdh8L6xCiMI4lzc0n22qn3FNOCNkAUW6RAtliERmesQ==
X-Google-Smtp-Source: AGHT+IF2OW+qflIazHPgiEcST7oe1qZGT6aj/Hik/HFfGWbVcOJj4aFV8515DLdGfzbOF2nObYCMQg==
X-Received: by 2002:a05:6000:144a:b0:38a:9c1b:df5b with SMTP id ffacd0b85a97d-38bf566a279mr25563799f8f.30.1737675873434;
        Thu, 23 Jan 2025 15:44:33 -0800 (PST)
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
Subject: [PATCH 03/20] gdbstub: Check for TCG before calling tb_flush()
Date: Fri, 24 Jan 2025 00:43:57 +0100
Message-ID: <20250123234415.59850-4-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Use the tcg_enabled() check so the compiler can elide
the call when TCG isn't available, allowing to remove
the tb_flush() stub.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/stubs/tcg-stub.c | 4 ----
 gdbstub/system.c       | 5 ++++-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 7f4208fddf2..b2b9881bdfb 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -14,10 +14,6 @@
 #include "exec/tb-flush.h"
 #include "exec/exec-all.h"
 
-void tb_flush(CPUState *cpu)
-{
-}
-
 G_NORETURN void cpu_loop_exit(CPUState *cpu)
 {
     g_assert_not_reached();
diff --git a/gdbstub/system.c b/gdbstub/system.c
index 8ce79fa88cf..7f047a285c8 100644
--- a/gdbstub/system.c
+++ b/gdbstub/system.c
@@ -22,6 +22,7 @@
 #include "system/cpus.h"
 #include "system/runstate.h"
 #include "system/replay.h"
+#include "system/tcg.h"
 #include "hw/core/cpu.h"
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
@@ -171,7 +172,9 @@ static void gdb_vm_state_change(void *opaque, bool running, RunState state)
         } else {
             trace_gdbstub_hit_break();
         }
-        tb_flush(cpu);
+        if (tcg_enabled()) {
+            tb_flush(cpu);
+        }
         ret = GDB_SIGNAL_TRAP;
         break;
     case RUN_STATE_PAUSED:
-- 
2.47.1


