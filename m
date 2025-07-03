Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C01BAF7151
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 13:01:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032004.1405769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHgi-00068L-Sp; Thu, 03 Jul 2025 11:01:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032004.1405769; Thu, 03 Jul 2025 11:01:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHgi-00065a-Pq; Thu, 03 Jul 2025 11:01:08 +0000
Received: by outflank-mailman (input) for mailman id 1032004;
 Thu, 03 Jul 2025 11:01:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rGZt=ZQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXHgh-0003ud-0W
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 11:01:07 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03981579-57fd-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 13:01:04 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-45348bff79fso55591625e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 04:01:04 -0700 (PDT)
Received: from localhost.localdomain ([83.247.137.20])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bcebd4sm23536465e9.26.2025.07.03.04.01.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Jul 2025 04:01:03 -0700 (PDT)
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
X-Inumbo-ID: 03981579-57fd-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751540464; x=1752145264; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wspTc+l3MR08+xJCCFDeyBx7BUrOtzx13ywN/0VFZp4=;
        b=mTGSsOB1nuRfKpj4mx5grFKk6excvarqmHB2n237KYJ/vRr/CiC8ean7TtQ3jz3g9I
         TCi53+dKHqlEHCE8gunsIHPJiACoLtFNi1h19NVsvZvO5Hy3bx0KfFCvFXnUWE94zxor
         6+8mPm8XBQ6QAkkvhK02uLnv40WyDeiv5Fow8jM+Umuu+YE6tcUszEzV+ec+SEGcaGy9
         sNIweSZH5HLxP5gwU/BW5RddiAQXf1QV30Ks/ZNKzOw9PXz5XdCtU7yMNO74CEoy+iA3
         OBcQ3Eg/WifH7Vk70GMXd4Avw8jq+yJlwJRLLrR8zZv5DlSP4w3oGyqO93SI5kNQtsH+
         qSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751540464; x=1752145264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wspTc+l3MR08+xJCCFDeyBx7BUrOtzx13ywN/0VFZp4=;
        b=fAQ8vj3DalgTS9ACL1E52t98ITkT8G6JGdV19ZsRbbt0I5CZWVszmnrPpYQfortI7n
         RyDOPTiLzAv5QTzCeC5dsXyfi0XkrcrKMcbc5+Nil919EJgnu6gVZ5NP47KkQVsA4Ht4
         lnkv32QspHj8qwWj2TSzMUZu88dN+dEF7CVCJNmVgeNR/52nSFA8auCt68U9LTIw+SMf
         gz3D9BQXnKiFYY20ZKZYLGMO53jk+zXo/FwiJ3sZKWtSYgf2CQCgRaCeZo3J414k8jlX
         1727bKuK/q0b9wfE+aiDZW47AmEuIBYFsHCyvHNxW8I0/UYNkYcAI2lAnujWXnC/7b7F
         G3wg==
X-Forwarded-Encrypted: i=1; AJvYcCXehDundYQqI1EWE72gaSG4ruDQUAWFH+H/7swR/Te8nbQ/Vj5+3t0Uf4is50ySW/Mn+2S3O/A/FbM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1FTaiDVJpZxf679KmRJgdxBvsqwuyu2nExNXNEHtVcVoCf5No
	KSqzAXB6UEeyaYsU3s9mntJQUQXMWIJXyYntSimREdMapz3OxQKckPiTF7RsoOK4EPI=
X-Gm-Gg: ASbGncs9CLeTPGiesGE1T/bUPk1Yrhslwst5WHR7VWef3MrYhcWifROfbHifzrnBxbZ
	QGeGXvIdHcy4bKOGpp0kvJCPhBifBHI0OlWVRXT48JhA9yOVpIqLp+DZ2kA3GD/FTOg0DUMalvD
	f+X9A/F5nrdXQJrgO7Ax4BF2JXLshA1tQOE/9RTegb3DdZR8317O9+vPqbXrsvAJYJLjUsVqIYf
	gSOp7I34KnKLKq2qr5V5wDMQdCWSucwDR4zwyiJSvHit3zx92SiXP9xAqUtuBaTOel+Y7n6wwsF
	gtrqsXIDNKnBSbWkrF8pzC2XUgqMK7JmXSCLG9dcngO/P1pohyk8op7YXHQPzYNxYB/x+bUekk9
	kCfQjl6qkf7o=
X-Google-Smtp-Source: AGHT+IHAZ1QJQAR/SkCmpVyP5d+/RVl33yWqBUHoBvJQia/1ayRud+BeMI+m9TmrFuVOLmZ8hctUPQ==
X-Received: by 2002:a05:600c:3504:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-454a36e7842mr54691115e9.7.1751540464162;
        Thu, 03 Jul 2025 04:01:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	kvm@vger.kernel.org,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>,
	Cameron Esfahani <dirty@apple.com>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Phil Dennis-Jordan <phil@philjordan.eu>,
	Mads Ynddal <mads@ynddal.dk>,
	Fabiano Rosas <farosas@suse.de>,
	Laurent Vivier <lvivier@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony@xenproject.org>,
	Paul Durrant <paul@xen.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5 61/69] accel: Expose and register generic_handle_interrupt()
Date: Thu,  3 Jul 2025 12:55:27 +0200
Message-ID: <20250703105540.67664-62-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703105540.67664-1-philmd@linaro.org>
References: <20250703105540.67664-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to dispatch over AccelOpsClass::handle_interrupt(),
we need it always defined, not calling a hidden handler under
the hood. Make AccelOpsClass::handle_interrupt() mandatory.
Expose generic_handle_interrupt() prototype and register it
for each accelerator.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
---
 include/system/accel-ops.h        | 3 +++
 accel/hvf/hvf-accel-ops.c         | 1 +
 accel/kvm/kvm-accel-ops.c         | 1 +
 accel/qtest/qtest.c               | 1 +
 accel/xen/xen-all.c               | 1 +
 system/cpus.c                     | 9 +++------
 target/i386/nvmm/nvmm-accel-ops.c | 1 +
 target/i386/whpx/whpx-accel-ops.c | 1 +
 8 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index 6d0791d73a4..dc8df9ba7dd 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -67,6 +67,7 @@ struct AccelOpsClass {
     void (*synchronize_state)(CPUState *cpu);
     void (*synchronize_pre_loadvm)(CPUState *cpu);
 
+    /* handle_interrupt is mandatory. */
     void (*handle_interrupt)(CPUState *cpu, int old_mask, int new_mask);
 
     /* get_vcpu_stats: Append statistics of this @cpu to @buf */
@@ -93,4 +94,6 @@ struct AccelOpsClass {
     void (*remove_all_breakpoints)(CPUState *cpu);
 };
 
+void generic_handle_interrupt(CPUState *cpu, int old_mask, int new_mask);
+
 #endif /* ACCEL_OPS_H */
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index b61f08330f1..420630773c8 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -355,6 +355,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, const void *data)
 
     ops->cpu_thread_routine = hvf_cpu_thread_fn,
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
+    ops->handle_interrupt = generic_handle_interrupt;
 
     ops->synchronize_post_reset = hvf_cpu_synchronize_post_reset;
     ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 841024148e1..b79c04b6267 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -85,6 +85,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
     ops->synchronize_state = kvm_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm;
+    ops->handle_interrupt = generic_handle_interrupt;
 
 #ifdef TARGET_KVM_HAVE_GUEST_DEBUG
     ops->update_guest_debug = kvm_update_guest_debug_ops;
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 9f30098d133..47fa9e38ce3 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -68,6 +68,7 @@ static void qtest_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->cpu_thread_routine = dummy_cpu_thread_routine;
     ops->get_virtual_clock = qtest_get_virtual_clock;
     ops->set_virtual_clock = qtest_set_virtual_clock;
+    ops->handle_interrupt = generic_handle_interrupt;
 };
 
 static const TypeInfo qtest_accel_ops_type = {
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index e2ad42c0d18..a51f4c5b2ad 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -154,6 +154,7 @@ static void xen_accel_ops_class_init(ObjectClass *oc, const void *data)
 
     ops->thread_precreate = dummy_thread_precreate;
     ops->cpu_thread_routine = dummy_cpu_thread_routine;
+    ops->handle_interrupt = generic_handle_interrupt;
 }
 
 static const TypeInfo xen_accel_ops_type = {
diff --git a/system/cpus.c b/system/cpus.c
index 8c2647f5f19..efe1a5e211b 100644
--- a/system/cpus.c
+++ b/system/cpus.c
@@ -246,7 +246,7 @@ int64_t cpus_get_elapsed_ticks(void)
     return cpu_get_ticks();
 }
 
-static void generic_handle_interrupt(CPUState *cpu, int old_mask, int new_mask)
+void generic_handle_interrupt(CPUState *cpu, int old_mask, int new_mask)
 {
     if (!qemu_cpu_is_self(cpu)) {
         qemu_cpu_kick(cpu);
@@ -261,11 +261,7 @@ void cpu_interrupt(CPUState *cpu, int mask)
 
     cpu->interrupt_request |= mask;
 
-    if (cpus_accel->handle_interrupt) {
-        cpus_accel->handle_interrupt(cpu, old_mask, cpu->interrupt_request);
-    } else {
-        generic_handle_interrupt(cpu, old_mask, cpu->interrupt_request);
-    }
+    cpus_accel->handle_interrupt(cpu, old_mask, cpu->interrupt_request);
 }
 
 /*
@@ -674,6 +670,7 @@ void cpus_register_accel(const AccelOpsClass *ops)
 {
     assert(ops != NULL);
     assert(ops->create_vcpu_thread || ops->cpu_thread_routine);
+    assert(ops->handle_interrupt);
     cpus_accel = ops;
 }
 
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index bef6f61b776..d568cc737b1 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -77,6 +77,7 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, const void *data)
 
     ops->cpu_thread_routine = qemu_nvmm_cpu_thread_fn;
     ops->kick_vcpu_thread = nvmm_kick_vcpu_thread;
+    ops->handle_interrupt = generic_handle_interrupt;
 
     ops->synchronize_post_reset = nvmm_cpu_synchronize_post_reset;
     ops->synchronize_post_init = nvmm_cpu_synchronize_post_init;
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index 8cbc6f4e2d8..fbffd952ac4 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -80,6 +80,7 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->cpu_thread_routine = whpx_cpu_thread_fn;
     ops->kick_vcpu_thread = whpx_kick_vcpu_thread;
     ops->cpu_thread_is_idle = whpx_vcpu_thread_is_idle;
+    ops->handle_interrupt = generic_handle_interrupt;
 
     ops->synchronize_post_reset = whpx_cpu_synchronize_post_reset;
     ops->synchronize_post_init = whpx_cpu_synchronize_post_init;
-- 
2.49.0


