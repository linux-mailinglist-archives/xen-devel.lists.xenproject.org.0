Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E015AA1AD9D
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jan 2025 00:50:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876451.1286831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yH-0004wA-P8; Thu, 23 Jan 2025 23:50:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876451.1286831; Thu, 23 Jan 2025 23:50:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tb6yH-0004qs-L7; Thu, 23 Jan 2025 23:50:49 +0000
Received: by outflank-mailman (input) for mailman id 876451;
 Thu, 23 Jan 2025 23:50:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QxCy=UP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1tb6tc-0007w9-F1
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 23:46:00 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32930e61-d9e4-11ef-a0e5-8be0dac302b0;
 Fri, 24 Jan 2025 00:45:59 +0100 (CET)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361f664af5so17051845e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 Jan 2025 15:45:59 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a17d79csm1009152f8f.39.2025.01.23.15.45.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Jan 2025 15:45:58 -0800 (PST)
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
X-Inumbo-ID: 32930e61-d9e4-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737675959; x=1738280759; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gXZ2pCmpp3MBAsW4Hnbi8sV5bqYGRAr8w/4hsc1kvQ=;
        b=HBR0Uj+vFlsxRlHxJ5Lq/faMJg7NLpYiRNmRyKvYVs/IeUEAcvQvWXWESC+ZhN2Cv9
         F4tmBDzFpFGfjTEq2Ok7O+LWcAnJfoR2vCLsdh3MfPzHg1QVNqkfPXNLbzx1XdwcRzxf
         WG36fc3dnSER1bmmsQUDvFKstxjqiSOkaH81xSU516EXKACL9IZKQeEujiLGxF1EcnT0
         IzAjdbogNFprKSwoUV277n3U4g2M2dMj52nZqy/NmWqMKTNt6ADpQl/tS5la76crbt2r
         0nNUNNa0iFR69OelfmMAKXeUufRk2GtcV8wh6L3OpD/hK8d/3MErL+HurTWlKVKhHMqY
         CEYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737675959; x=1738280759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gXZ2pCmpp3MBAsW4Hnbi8sV5bqYGRAr8w/4hsc1kvQ=;
        b=tkMAHEJLZlpUik3bWkZeQZX7Q0RB4AvjnbUjn+EA5dE78Ep1Fx0jqXRX7mgbFh6lrA
         UhlziAHsxQYMqczGJ4OqqQ+QUpVGQ6DNquBsd3Jy/zTLwCuPuO9iLKUAPLW/mFjbzXD/
         ZL+24NleJ2Wy2uPsPa4rnSc9Ourcret7oNyy8lxxhf7MXXD7C4Tcd7GumqE45n30loHr
         30JRJpe6jngHgNa+R0SzCGC8uGfIw6t+1Qnq1p0B98hn6eGxIpKG2xudUPkAJ01JZ6e7
         z30x1ulGdVfwDeiPAOWvAI3X9tU3ERPWQ/Kh/37ASU3wSV/3qsd7YS4J5HGL5De97Jrm
         ndDg==
X-Forwarded-Encrypted: i=1; AJvYcCXaRLF5katSSRRwjMm7LUxzX4kN2EuwxXsHCDcjkPw0OQHN5cfz8ojlvnD/T+i2/daVysRZVfcRUB8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YziqVhUdaaYRjEM3ATAWgfkWLMu6HDkIrcFZB9DFaHiUtrM5OkJ
	WmQHFH5A8cF273C+2v7JCpIFIPdkuuU0lFp3rpvqLNUMNEwwpUGIwgJa+F+QbmM=
X-Gm-Gg: ASbGncsmGOW0yh79hnpgw4lX1rUKMglqhVV40xtGDu99Tgxr8qs7LkbrZshq0y53quj
	fqOBDs5cV7HlP0M7GjcWXHGo6l26BtxrwtwhLe1FFFiTifAZcn3yCfx0L8QVKM0RzS8V78G5SWs
	Dw3cBIwoXAdJHRAN/cgrcgsx61N3B9CQfXX5Eub8XePXEnJZQb3ypqX0nQ7iAagFNOHzmBCcdPA
	+lLMWS5h+Ye03zuIc20yF6+6hsSOmUOKADKe2MTZQYfRNl5UDiPQ5P8DEjPr61Fq60JAD+6TNA4
	1t0nSrf6XL8VR1RbUnSWSLaGsBXPj70WzdFvnM27gVHBueOBUkvEtFE=
X-Google-Smtp-Source: AGHT+IFkrF3nSiyRp86eT1OfDhljZaIiOgfPlVgQgIeU90j7M027ZvrIkgirhKCWekxtCJUAZQHWLg==
X-Received: by 2002:a05:600c:4f48:b0:434:fd15:3adc with SMTP id 5b1f17b1804b1-43891431319mr209632555e9.25.1737675959187;
        Thu, 23 Jan 2025 15:45:59 -0800 (PST)
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
Subject: [PATCH 18/20] cpus: Have cpu_exec_initfn() per user / system emulation
Date: Fri, 24 Jan 2025 00:44:12 +0100
Message-ID: <20250123234415.59850-19-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250123234415.59850-1-philmd@linaro.org>
References: <20250123234415.59850-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Slighly simplify cpu-target.c again by extracting cpu_exec_initfn()
to cpu-{system,user}.c, adding an empty stub for user emulation.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Good enough for now...
---
 cpu-target.c         | 9 ---------
 hw/core/cpu-system.c | 7 +++++++
 hw/core/cpu-user.c   | 5 +++++
 3 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/cpu-target.c b/cpu-target.c
index dff8c0747f9..3d33d20b8c8 100644
--- a/cpu-target.c
+++ b/cpu-target.c
@@ -24,7 +24,6 @@
 #include "migration/vmstate.h"
 #ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
-#include "exec/address-spaces.h"
 #endif
 #include "system/accel-ops.h"
 #include "system/cpus.h"
@@ -176,14 +175,6 @@ void cpu_exec_unrealizefn(CPUState *cpu)
     accel_cpu_common_unrealize(cpu);
 }
 
-void cpu_exec_initfn(CPUState *cpu)
-{
-#ifndef CONFIG_USER_ONLY
-    cpu->memory = get_system_memory();
-    object_ref(OBJECT(cpu->memory));
-#endif
-}
-
 char *cpu_model_from_type(const char *typename)
 {
     const char *suffix = "-" CPU_RESOLVING_TYPE;
diff --git a/hw/core/cpu-system.c b/hw/core/cpu-system.c
index c63c984a803..0520c362db4 100644
--- a/hw/core/cpu-system.c
+++ b/hw/core/cpu-system.c
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "exec/address-spaces.h"
 #include "exec/memory.h"
 #include "exec/tswap.h"
 #include "hw/qdev-core.h"
@@ -182,3 +183,9 @@ void cpu_class_init_props(DeviceClass *dc)
 
     device_class_set_props(dc, cpu_system_props);
 }
+
+void cpu_exec_initfn(CPUState *cpu)
+{
+    cpu->memory = get_system_memory();
+    object_ref(OBJECT(cpu->memory));
+}
diff --git a/hw/core/cpu-user.c b/hw/core/cpu-user.c
index e5ccf6bf13a..cdd8de2fefa 100644
--- a/hw/core/cpu-user.c
+++ b/hw/core/cpu-user.c
@@ -25,3 +25,8 @@ void cpu_class_init_props(DeviceClass *dc)
 {
     device_class_set_props(dc, cpu_user_props);
 }
+
+void cpu_exec_initfn(CPUState *cpu)
+{
+    /* nothing to do */
+}
-- 
2.47.1


