Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F7AAF7144
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 13:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031994.1405760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHg1-0005IC-I9; Thu, 03 Jul 2025 11:00:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031994.1405760; Thu, 03 Jul 2025 11:00:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHg1-0005FQ-ET; Thu, 03 Jul 2025 11:00:25 +0000
Received: by outflank-mailman (input) for mailman id 1031994;
 Thu, 03 Jul 2025 11:00:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rGZt=ZQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXHg0-0003ud-Du
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 11:00:24 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea78c86e-57fc-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 13:00:22 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a4f72cba73so538986f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 04:00:22 -0700 (PDT)
Received: from localhost.localdomain ([83.247.137.20])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52c99sm18125528f8f.49.2025.07.03.04.00.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Jul 2025 04:00:21 -0700 (PDT)
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
X-Inumbo-ID: ea78c86e-57fc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540422; x=1752145222; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtcgYIv7cyhzlknrW2Wv+nYV1/8CFpZnM220DOT3U/s=;
        b=khcwu2nnw9a9W/zeXNsNnAumIC3GMXChtYBOBY7tGVejkwhfPUs0kfcylxBVBtMCZp
         y+wEO50sx5nK4ZbzKaDg9TdP89jdU7L1eeKDM404Fevmm7WaymCv1xfTotkhJTFR6mQN
         fpMllunf8ag6zKbd0rnOPC0/a+7e1tntpC82wH09/4bUgtP0kzqVfx0uFJDHoRRujnDc
         EkNk7yvwP9fWYDrO/pbrNLkE+Dejizc70lzGFIOblP5176J51QfE39L41PkbRJvSe0ax
         abgV3bEqu40EJRNq7Rh9LgEO1241T1ICQtb64la6X+QQyX/xP1+nNAjpZAPibzZvvzzc
         f+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540422; x=1752145222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtcgYIv7cyhzlknrW2Wv+nYV1/8CFpZnM220DOT3U/s=;
        b=dZ9yBQEHirqXg9Sck0nDzSy8orzrI2flFTFvUWj3foExQiyQLWPe5Gd+wDBrAlScR+
         AvSCb0TMLscRooIXxjcaqrUs3d88yqVGC4WgzmOisuwc0OnSjGLAkUZuu8VWblpgVQnx
         SJlEm3uOHBiPDLhTGeuOet0fW5J2fnG4p8XZDfaN560oJlVrqzU48HmNwhpqTM68fQ0G
         xPtQYXQN+GYS6dLHRWlyCox34FOHfuHq55aNVIu8Fkz8wwjXmumFb5L4N9SLPqFzSaqE
         uNM276DpabbYLvFnGZfgxe1LM6g64gcgKxwJOWP12pmJgWmgCIuAgR1kjhkxTchzZBav
         ahGw==
X-Forwarded-Encrypted: i=1; AJvYcCV9mnRq0eCJ+LMxd3RrpMTQ4bLOPhl9Gf9VNKrKsdVeRAFFeJVQ0SGUVOXLG6G/Z1DYt2uur2Z6ojU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZngExfqdms382kJneSUzhnhYr50eAI/EFkRrdRyomWJbYfMJr
	dHu9ZEqv9TUbzrvb/rG+aTD7Xbcpthwlypq4My4Sk0sVOK1WQN0ATho02vwJ98fVRoU=
X-Gm-Gg: ASbGncs1lsyaijPL7KcqkttTs+CMLc8RQWHxOadpSc6ELShLZp2Zd3wixQrhiMTicPW
	xUG/PRhnUAkFkii/5plKPgHFQ8q44wiAwNF4ARLltNowrmQINMgS0zJZOIrlnqf12Cwmv4JsNY1
	vsAEIAeZVvIg7ZRmhdgsbVKsuYsQG0l+iEMX9O1H8S089lxXA3Afj3H+F0AzuzAnnlCo99eBdnU
	FlAS8sKDXffuVxuvUplzONDmc4U4zSZORI+Aa3uNcQ/xYmJKHmZfCVrhi63lRmFx9CnzT1x+IF7
	TpdEwO7nO/7lwdCgoAYqjlx8Xaq+lIQBGplJ+JNbgYof6XVwc3aef9h17VaE0e6dRi/4jNeEnDE
	aQaHP29NN6so=
X-Google-Smtp-Source: AGHT+IGD7TC9O4oxqN4AXMXx4fT0V4Qtg0hQBWZhDby2s+AzbNTf4+ZNgcj1dYa/jzmx9avOyZc4UA==
X-Received: by 2002:a05:6000:987:b0:3a3:7ba5:9a68 with SMTP id ffacd0b85a97d-3b343889c82mr1880924f8f.18.1751540421981;
        Thu, 03 Jul 2025 04:00:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	kvm@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 53/69] accel/dummy: Convert to AccelOpsClass::cpu_thread_routine
Date: Thu,  3 Jul 2025 12:55:19 +0200
Message-ID: <20250703105540.67664-54-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703105540.67664-1-philmd@linaro.org>
References: <20250703105540.67664-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

By converting to AccelOpsClass::cpu_thread_routine we can
let the common accel_create_vcpu_thread() create the thread.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Fabiano Rosas <farosas@suse.de>
---
 accel/dummy-cpus.h  |  2 +-
 accel/dummy-cpus.c  | 14 +-------------
 accel/qtest/qtest.c |  3 ++-
 accel/xen/xen-all.c |  3 ++-
 4 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/accel/dummy-cpus.h b/accel/dummy-cpus.h
index c3af710ee8c..c2f9fee164c 100644
--- a/accel/dummy-cpus.h
+++ b/accel/dummy-cpus.h
@@ -10,6 +10,6 @@
 #define ACCEL_DUMMY_CPUS_H
 
 void dummy_thread_precreate(CPUState *cpu);
-void dummy_start_vcpu_thread(CPUState *cpu);
+void *dummy_cpu_thread_routine(void *arg);
 
 #endif
diff --git a/accel/dummy-cpus.c b/accel/dummy-cpus.c
index 2cbc3fecc93..f637ab05e32 100644
--- a/accel/dummy-cpus.c
+++ b/accel/dummy-cpus.c
@@ -19,7 +19,7 @@
 #include "hw/core/cpu.h"
 #include "accel/dummy-cpus.h"
 
-static void *dummy_cpu_thread_fn(void *arg)
+void *dummy_cpu_thread_routine(void *arg)
 {
     CPUState *cpu = arg;
 
@@ -71,15 +71,3 @@ void dummy_thread_precreate(CPUState *cpu)
     qemu_sem_init(&cpu->sem, 0);
 #endif
 }
-
-void dummy_start_vcpu_thread(CPUState *cpu)
-{
-    char thread_name[VCPU_THREAD_NAME_SIZE];
-
-    dummy_thread_precreate(cpu);
-
-    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/DUMMY",
-             cpu->cpu_index);
-    qemu_thread_create(cpu->thread, thread_name, dummy_cpu_thread_fn, cpu,
-                       QEMU_THREAD_JOINABLE);
-}
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 2606fe97b49..9f30098d133 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -64,7 +64,8 @@ static void qtest_accel_ops_class_init(ObjectClass *oc, const void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
-    ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->thread_precreate = dummy_thread_precreate;
+    ops->cpu_thread_routine = dummy_cpu_thread_routine;
     ops->get_virtual_clock = qtest_get_virtual_clock;
     ops->set_virtual_clock = qtest_set_virtual_clock;
 };
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index f412ea346bb..e2ad42c0d18 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -152,7 +152,8 @@ static void xen_accel_ops_class_init(ObjectClass *oc, const void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
-    ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->thread_precreate = dummy_thread_precreate;
+    ops->cpu_thread_routine = dummy_cpu_thread_routine;
 }
 
 static const TypeInfo xen_accel_ops_type = {
-- 
2.49.0


