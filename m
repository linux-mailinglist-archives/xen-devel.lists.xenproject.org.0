Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F8FAF6228
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 20:59:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031472.1405292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2fy-0004jg-9X; Wed, 02 Jul 2025 18:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031472.1405292; Wed, 02 Jul 2025 18:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2fy-0004iG-5s; Wed, 02 Jul 2025 18:59:22 +0000
Received: by outflank-mailman (input) for mailman id 1031472;
 Wed, 02 Jul 2025 18:59:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cCzP=ZP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uX2fw-0004Hv-OZ
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 18:59:20 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8eb4233-5776-11f0-a314-13f23c93f187;
 Wed, 02 Jul 2025 20:59:20 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-451ebd3d149so26700565e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 11:59:20 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a999c8cdsm5790005e9.24.2025.07.02.11.59.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Jul 2025 11:59:19 -0700 (PDT)
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
X-Inumbo-ID: a8eb4233-5776-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751482759; x=1752087559; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hJXngZXoNb3ayqx8JesLlBPxtZzFSrHUe1FnH3EcOyc=;
        b=YBE1XnRpVK3dWCS1YzlnZVw7XWjWX0mLv3sVD1YZgq/QDkfGykbums4cl6CrgzT/fN
         DpkcGdXCInSi+wRj0BR46B9XMJzD1M0nSw4fHQHMuR13Eiqykf8W/warKQ6hS+t9wf7m
         L933xvsdnny5g5LyhBfX7xj78lXieovcWlyg9pUtT94Yqq43OwLhaGpNt2Zvue4ZzZkd
         q5oPtRG/2Uhsd1zdCh0FUG1We/PaaeSQS/+rB2oNlssUtPkQn14DX+CTFyAHrEjlSxdL
         yqd5gEALD3GBuKXJ0WsVmmBkU0iHjphglnrHwksUavbFwYnSmCg/E1NGmgDhNebFFFmx
         hmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482759; x=1752087559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hJXngZXoNb3ayqx8JesLlBPxtZzFSrHUe1FnH3EcOyc=;
        b=au/sgLdlFOVdPE3loeBLYr40KeIORrQfCZVouMl1OxBr1P0SvBQ+eUoGbO0rSE3FiV
         LEK1vfv9Tv0ae+t8HcPHiLJVp2h6X+6NhXKiANNhB+DvaTTyw6AKgi67oXfwMKzHkEtU
         Gu3Yln3Yc/wGIsA289F9OuPfDzIvqYz+PPAlptZysX1jpNe++Y7tvPQe0iCVcbynpL6Q
         Cra0pSPueedUNBywWyUdl541PM/AqgzUXU8xsswPudim1t+cqGCk/bML3N/eRfsypd1n
         Gg+3Ay/I0sjWiXcWxihaptt0EmPOEgaR79Gx3G49sZEooParrXu1m8hy5jSrG9yJYbsq
         pmHA==
X-Forwarded-Encrypted: i=1; AJvYcCX1IQDf3/pm+jy1t4NFEQvpM2z140IVutkZz39v4wAeLsY6vs/qJRr8+lqxT+z7XvdIvNHnQxAxJJ8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzA9E41+/rkPZ6R8nXTFhwkpUClJssso0FxRMlx+DanNF76HsK2
	6qwMowQa61Qm0z34niYWD/JZnxZxALHqTknvBluZqXqDFHoYdJYmQbD0qYWmrhLYgGA=
X-Gm-Gg: ASbGncsHxq5KuIKmzTHFCmX6bYN4y5/+La3UzAAY4z3EMF7/P5svqXNMXIuILjcXq3P
	tH7WuErhZgaKxFypPVJ7/b1NoAKmwwmWnLs1I2irW3HwEPEJ80/FOw63OnmMPpoS7080MaWe89w
	NB0SMKj8X5acAVDrt/a8g3U8ClDD4JS6wWO1o6yfpVTR6u4UlIqjz7fmjht+NgY3cnaUe9Gcwn9
	Qu7+D53HWSKhaObcwbkV52MayBPgG83SW0pACSl9BzhbsOc2hiG7tA56k2OQDgt509j+sphfdxP
	fkRghcApoqBsplB9V0GaVlDbRDvl/irC5Ymg9IH/TypZq5WgoM3WXk78DU1RE5tAH8x7GNeENb6
	Be95LyFVP+lU/OQV7dOT4IrFf4ndyVQxYfWLh
X-Google-Smtp-Source: AGHT+IE3WTlBrg79f8JEGuLCHU0UFZS44rNmXX17pQSMB1LxsBRr6tiIwSkJPMQ9jDC7VsiDr5lFPQ==
X-Received: by 2002:a05:600c:a086:b0:450:d568:909b with SMTP id 5b1f17b1804b1-454a36fbdd6mr44010245e9.14.1751482759507;
        Wed, 02 Jul 2025 11:59:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 48/65] accel/dummy: Convert to AccelOpsClass::cpu_thread_routine
Date: Wed,  2 Jul 2025 20:53:10 +0200
Message-ID: <20250702185332.43650-49-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702185332.43650-1-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

By converting to AccelOpsClass::cpu_thread_routine we can
let the common accel_create_vcpu_thread() create the thread.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


