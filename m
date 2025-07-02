Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E54BAF622E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 21:00:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031480.1405301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2gi-0006IT-Gm; Wed, 02 Jul 2025 19:00:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031480.1405301; Wed, 02 Jul 2025 19:00:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX2gi-0006Gi-DI; Wed, 02 Jul 2025 19:00:08 +0000
Received: by outflank-mailman (input) for mailman id 1031480;
 Wed, 02 Jul 2025 19:00:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cCzP=ZP=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uX2gh-0004a7-4S
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 19:00:07 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3f1d202-5776-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 21:00:05 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-450cf0120cdso49488965e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 12:00:05 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7ec69dsm16541953f8f.6.2025.07.02.12.00.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 02 Jul 2025 12:00:04 -0700 (PDT)
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
X-Inumbo-ID: c3f1d202-5776-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751482805; x=1752087605; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a9AALSKsiWp+fyxrwu3Q2lSvTY3F2dydfTXpwq/TdYI=;
        b=nsTZDooMBDJnKEUHAjfsJO7MomsJNNtmmcP2x1EMuiQCmjjIlWYIuvYHPrhIiFeokc
         bJV/qF2JUgiJhaod1aUqGyXZDT61Q6K8jlf97pQ5RPByuYefMlQwyt1ZvcuuCt5p7VzJ
         vMJXNXWzPgzvqyBCvzATDC0RGYPJwdI0dlzWO3WeqDe5x5APYOA9TDw88g37pNIM/mte
         8GuLGhMrWxIPAZDe/ghabSdxdPm5J5Egyv/ZMQt+WGAchSqBgnBv8sZ9FR2QJmSY84QL
         PhUcUFzjV6NAt4PKfCeL4ICcW2U95CWe6/A+J5qnfj3hZH5mWcqcPBjX58nA5PFGQZQz
         yT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751482805; x=1752087605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a9AALSKsiWp+fyxrwu3Q2lSvTY3F2dydfTXpwq/TdYI=;
        b=KAia0b2QYVG6tLQvmQ/Ee6/6/3n2+yhjC9S9+TzeFdHJg8YAYdoh1l4c7/c2sF7jrA
         a8tudx2qbgq//S/zzTojvoAmkwgURkuP17Iz51RoJXdPJKnNJ1ZxM5LxsV2eZcWQ6eEu
         B5ZPzZgkSI8jPpOiGG/Qo8UoqC3TvB9PPNaGC8AeMWORP4wnPGfpOJt1zfj3r+MX74H7
         xmuZodukD2OEaaDa72IeGiB9kPUyo46e4pIX6cJwhvSkApxyHBh3HLaj0meGhIsHyZSR
         5Qn8zbr3zUnlE2aTShtUDelBUG9KDc4GkteRlb+RDZAEmfBkzSIRQYZzNB1MBnlPWEm8
         Oa1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWBf7rvT68UqOMqr7I4Z+doEDl9oMWBaKV9+/dvGxIPsXMhTo/L52Ob7L2lKKgFDQcgcmf8UiaJRE=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywtp15Ry0uledFgTkAgkVzimnSry2bJ/BDSIt9nooMNZeUxYvMP
	nkmktXvaJ7d8OTp8JTB0/4JIWN4JtcqcvW3biVWd1RRUAYzlzTnOw+YxXsU7aO9bPT8=
X-Gm-Gg: ASbGncsQD3yo5xQkfEXpH0iZhLlxqIOVj4ie4ppLMMXhMb4cpD1PdAObCAtdwaou6SM
	74zpPoZUsCM11bgoOFWUlOgILyzSS/I4Fnn32dcvQaCUKK9Lcki3hsZQe0+hVO5t01Noqy6ItJS
	oHeeBb1m2sof6sgDrZm8jKt32KJ1dlH8smYY0X87WrIiEInfazv5u35wS+Af5TjXC8mK6lYmZyB
	DoRnvYXFHQpaOJQopltv8HtfYqY3kiTalxDR4eEnj84uagc8bx1hZcpQKlm0CO58c6aIAOvlMUf
	CQbumT3L/pIZ2zcIfatcgbjwzB3AxgXr2LXAnvKdC6bHlbfu9RLqP4ywLrzY4tJB/apTqhGMDYq
	z24jhzMYAf3lZTlNUQkzAeZUKY64bBVdLfoej
X-Google-Smtp-Source: AGHT+IHuTxwhhaxfDXpwsGGicEITW9gtMOvw6Tfvz+5/juL51xTCIjaJfAoPglR1/D0PNXoYflj/XQ==
X-Received: by 2002:a05:600c:1c1c:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-454a562a89fmr36055635e9.31.1751482804732;
        Wed, 02 Jul 2025 12:00:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
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
	kvm@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v4 56/65] accel: Expose and register generic_handle_interrupt()
Date: Wed,  2 Jul 2025 20:53:18 +0200
Message-ID: <20250702185332.43650-57-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702185332.43650-1-philmd@linaro.org>
References: <20250702185332.43650-1-philmd@linaro.org>
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


