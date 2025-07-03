Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B9BAF7EFD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 19:35:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032339.1406010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNqG-0001ph-EF; Thu, 03 Jul 2025 17:35:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032339.1406010; Thu, 03 Jul 2025 17:35:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXNqG-0001mq-Ar; Thu, 03 Jul 2025 17:35:24 +0000
Received: by outflank-mailman (input) for mailman id 1032339;
 Thu, 03 Jul 2025 17:35:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rGZt=ZQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1uXNqF-0001VU-Jt
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 17:35:23 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18422179-5834-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 19:35:21 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45310223677so861425e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 10:35:21 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b161e8fcsm3703765e9.7.2025.07.03.10.35.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Jul 2025 10:35:20 -0700 (PDT)
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
X-Inumbo-ID: 18422179-5834-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751564121; x=1752168921; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8Y0CRVizP1zJqDvu7p6UAH96w8jBU8Dg5EX+XjEepo=;
        b=eZPhyoify/pomMDUqlarnMtJjCFqlwZETHRmc5JAxkZeLdmO4+eYCy8rMnnEjKS/aU
         6FqjmmEhJAEYTKD+KGAh6X+yQ5O0vZCAS151VetRIh2vK9WZ4xyCYgCQ4rziVim2fA2v
         0AjwNAjy1YMeu37p/U6gDHhECl1ScKqfX3pCOi4InK8kgBOHs2nAgSPFVt+lEQAX4RNf
         R3pgctpxt3AGIINgiOrku8pfQikohNK2e6iIKpEHXNVxkjwdHZJnAnfC2urlJiz6muAN
         KE0R17fUWlwYd82/pmOg3MTS0o8GK4NAEaN5wGGgMTwPM0IrIeqI9lBOvLtFI8UhAtKP
         xs4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751564121; x=1752168921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8Y0CRVizP1zJqDvu7p6UAH96w8jBU8Dg5EX+XjEepo=;
        b=JmN1Tl6hE9ExvcudyeeOlajFm+iOtL3cZPKKW1ax12Ph8iXBVWaQZkxldysc/OKRTD
         Vftp1UxP/Z+muY4suFiLTi5UeOuSJsl+DNsxwJO1f5V2JL7rB9Q6tA7x/8ykqC/+GSKH
         jKCKnm8BauOmc1eROhAZW3ZF+5oTwjJHejis4DVKeki7FtW/wB7Ph8rzpQbf6/X909B4
         5wl7HDETPVVp7bxKSXn0suGj5R98Tl2EdrjuR+clMAeGEvy5aDu0iSjiCZ2r353K1oeP
         g1hqKVYj3ftxR5B5BGs0op1ueVtxnuu+/4gqHNFfOIozq8+hHWdi4hw6xVXXQ9kdusaK
         C/SA==
X-Forwarded-Encrypted: i=1; AJvYcCUFPI2pvlDuSVaemi9x7iRyOlKswBOaVTH6xKtkrFLxkBwBkOfk3H5LuB+jLleE/48u19Z0gMG3W9w=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz7hR5ia6moIBJ2DcPwCPPYR54+77/Ws1FfaSKS0TtJ3Emtq3ZJ
	IXOVOQLDDeCQ2EizJs/rItTdAXFQFO+5+qGzgfrbOCxIxzoWegHl06TNkArNm2ZZCTk=
X-Gm-Gg: ASbGnctPSVju9LDZa2jot+FyYKRWhehsoRb7UAh5TyJpEHC7I5uK8aO0ngKLLO3r+uH
	eHU4PJG/H2n37Bm9MjV+IA5ScPXV7syjWK+gplaZA0PqrKQHq+z19jKDWGM531x7GURNVzl6UXV
	79dIpurg6w1+lEN9NttnBjxpzCEemptRwKW5aUnmrksPD5fwZ/TeHpOCclzBFq/NeAa3mHNKmbb
	21sKaQOfUzowpuOpq49MltTr1aA1TV8qg9JeQl3lpCuGRvmZ8JyIiPJvws0jY2EryQcX3r4qF1n
	PMe+zxPR/QQX96UMwXSTXq7/YpMKBF/cPzzsqVV3EosDjtDKqnjeZ8pPrWiS71mnq95bJxMiRxh
	BvTWgxEZKs3OXNAxOuLUjcw3YmKBzM/jk5q6zSSjFztJtico=
X-Google-Smtp-Source: AGHT+IGUIGmRkNOsoFJDwtp7VUBuEXsARIcb9sOIxx6CN5f0AbT6nqsmy0amztwXgQM0zaIcj6KsKw==
X-Received: by 2002:a05:600c:4509:b0:441:ac58:eb31 with SMTP id 5b1f17b1804b1-454a3705065mr72661285e9.20.1751564121250;
        Thu, 03 Jul 2025 10:35:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Zhao Liu <zhao1.liu@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
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
Subject: [PATCH v6 28/39] accel: Expose and register generic_handle_interrupt()
Date: Thu,  3 Jul 2025 19:32:34 +0200
Message-ID: <20250703173248.44995-29-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703173248.44995-1-philmd@linaro.org>
References: <20250703173248.44995-1-philmd@linaro.org>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/system/accel-ops.h        |  3 +++
 accel/hvf/hvf-accel-ops.c         |  1 +
 accel/kvm/kvm-accel-ops.c         |  1 +
 accel/qtest/qtest.c               |  1 +
 accel/xen/xen-all.c               |  1 +
 system/cpus.c                     | 10 ++++------
 target/i386/nvmm/nvmm-accel-ops.c |  1 +
 target/i386/whpx/whpx-accel-ops.c |  1 +
 8 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/system/accel-ops.h b/include/system/accel-ops.h
index d84eaa376c2..95a0f402cde 100644
--- a/include/system/accel-ops.h
+++ b/include/system/accel-ops.h
@@ -61,6 +61,7 @@ struct AccelOpsClass {
     void (*synchronize_pre_loadvm)(CPUState *cpu);
     void (*synchronize_pre_resume)(bool step_pending);
 
+    /* handle_interrupt is mandatory. */
     void (*handle_interrupt)(CPUState *cpu, int old_mask, int new_mask);
 
     /**
@@ -84,4 +85,6 @@ struct AccelOpsClass {
     void (*remove_all_breakpoints)(CPUState *cpu);
 };
 
+void generic_handle_interrupt(CPUState *cpu, int old_mask, int new_mask);
+
 #endif /* ACCEL_OPS_H */
diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 2944e350ca9..a0248942f3a 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -353,6 +353,7 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, const void *data)
 
     ops->create_vcpu_thread = hvf_start_vcpu_thread;
     ops->kick_vcpu_thread = hvf_kick_vcpu_thread;
+    ops->handle_interrupt = generic_handle_interrupt;
 
     ops->synchronize_post_reset = hvf_cpu_synchronize_post_reset;
     ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
diff --git a/accel/kvm/kvm-accel-ops.c b/accel/kvm/kvm-accel-ops.c
index 99f61044da5..2a744092749 100644
--- a/accel/kvm/kvm-accel-ops.c
+++ b/accel/kvm/kvm-accel-ops.c
@@ -95,6 +95,7 @@ static void kvm_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->synchronize_post_init = kvm_cpu_synchronize_post_init;
     ops->synchronize_state = kvm_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = kvm_cpu_synchronize_pre_loadvm;
+    ops->handle_interrupt = generic_handle_interrupt;
 
 #ifdef TARGET_KVM_HAVE_GUEST_DEBUG
     ops->update_guest_debug = kvm_update_guest_debug_ops;
diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
index 612cede160b..5474ce73135 100644
--- a/accel/qtest/qtest.c
+++ b/accel/qtest/qtest.c
@@ -67,6 +67,7 @@ static void qtest_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
     ops->get_virtual_clock = qtest_get_virtual_clock;
     ops->set_virtual_clock = qtest_set_virtual_clock;
+    ops->handle_interrupt = generic_handle_interrupt;
 };
 
 static const TypeInfo qtest_accel_ops_type = {
diff --git a/accel/xen/xen-all.c b/accel/xen/xen-all.c
index c150dd43cab..c12c22de785 100644
--- a/accel/xen/xen-all.c
+++ b/accel/xen/xen-all.c
@@ -153,6 +153,7 @@ static void xen_accel_ops_class_init(ObjectClass *oc, const void *data)
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
 
     ops->create_vcpu_thread = dummy_start_vcpu_thread;
+    ops->handle_interrupt = generic_handle_interrupt;
 }
 
 static const TypeInfo xen_accel_ops_type = {
diff --git a/system/cpus.c b/system/cpus.c
index 13535a74e6f..f90b8be9eee 100644
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
@@ -674,6 +670,8 @@ void cpus_register_accel(const AccelOpsClass *ops)
 {
     assert(ops != NULL);
     assert(ops->create_vcpu_thread != NULL); /* mandatory */
+    assert(ops->handle_interrupt);
+
     cpus_accel = ops;
 }
 
diff --git a/target/i386/nvmm/nvmm-accel-ops.c b/target/i386/nvmm/nvmm-accel-ops.c
index 21443078b72..a5517b0abf3 100644
--- a/target/i386/nvmm/nvmm-accel-ops.c
+++ b/target/i386/nvmm/nvmm-accel-ops.c
@@ -87,6 +87,7 @@ static void nvmm_accel_ops_class_init(ObjectClass *oc, const void *data)
 
     ops->create_vcpu_thread = nvmm_start_vcpu_thread;
     ops->kick_vcpu_thread = nvmm_kick_vcpu_thread;
+    ops->handle_interrupt = generic_handle_interrupt;
 
     ops->synchronize_post_reset = nvmm_cpu_synchronize_post_reset;
     ops->synchronize_post_init = nvmm_cpu_synchronize_post_init;
diff --git a/target/i386/whpx/whpx-accel-ops.c b/target/i386/whpx/whpx-accel-ops.c
index b8bebe403c9..31cf15f0045 100644
--- a/target/i386/whpx/whpx-accel-ops.c
+++ b/target/i386/whpx/whpx-accel-ops.c
@@ -90,6 +90,7 @@ static void whpx_accel_ops_class_init(ObjectClass *oc, const void *data)
     ops->create_vcpu_thread = whpx_start_vcpu_thread;
     ops->kick_vcpu_thread = whpx_kick_vcpu_thread;
     ops->cpu_thread_is_idle = whpx_vcpu_thread_is_idle;
+    ops->handle_interrupt = generic_handle_interrupt;
 
     ops->synchronize_post_reset = whpx_cpu_synchronize_post_reset;
     ops->synchronize_post_init = whpx_cpu_synchronize_post_init;
-- 
2.49.0


