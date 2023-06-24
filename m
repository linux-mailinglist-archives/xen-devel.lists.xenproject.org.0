Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 345AA73CC45
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 19:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554671.866026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7O2-0004jg-OW; Sat, 24 Jun 2023 17:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554671.866026; Sat, 24 Jun 2023 17:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7O2-0004bP-Hh; Sat, 24 Jun 2023 17:49:26 +0000
Received: by outflank-mailman (input) for mailman id 554671;
 Sat, 24 Jun 2023 17:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIr0=CM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qD7Hy-0008Gp-F5
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 17:43:10 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95773427-12b6-11ee-b237-6b7b168915f2;
 Sat, 24 Jun 2023 19:43:09 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f918922954so17425315e9.2
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 10:43:09 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c0b5500b003fa88f4c0f5sm339874wmr.21.2023.06.24.10.43.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 24 Jun 2023 10:43:09 -0700 (PDT)
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
X-Inumbo-ID: 95773427-12b6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628589; x=1690220589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAPkMuMtNtRM9NXu99LXesVy8JoKNyay4INBIgU8fUM=;
        b=pDVczrLfie0P29Z7uCw5tOy4PEx87NBQoCGG3m0psbZUusSwEfLQ61OZL6TJ2kB1dJ
         tATN6G8yFgnC5O7/RtL7/IHp8luOuI9a0CAQzgEMx9UDPTQXlvR8sbrOYZG8bJrmUNQg
         /3FBzLpY41RnRaYP2NB0XTbSnaGO4aPWfsRV67qdMMOJR8x1sXQNb8tfR8/K7nF4Lssa
         0KusLp2BM/Iws8Bzl7b9wq8cOsydsbBlEYgdjHb92A4e1Ui8CCXvSdCXeW32PC8Pi/zU
         qYoeGCSAHTqFSWULi9I7GFgtd8QD3Ykjh8zHuYSguFeSZJas3CSglD3lc6I5XkKu7nti
         YLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628589; x=1690220589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AAPkMuMtNtRM9NXu99LXesVy8JoKNyay4INBIgU8fUM=;
        b=dbaJu7Wd53h+8tWFVQ0mz5s2jmivSJOBbtO5WFc+vA8E1uKpDKn3EG1b/caNgXptaL
         YCKzwaOXKVNAfdq0oUMedpxUEZ1bICIv2SKqrVdIk+r8u8JgTJiDDfz9womu5L7u3su9
         z9lDAnKanf1oEh5dmdInG7csyYOSTpGZQ0pL6A6ljv+DSj6s5IIAeU5Lrsaex+Ej05lB
         LV9LOxtOqWrXVfdonAFEIkHntIkXW9W9Jy4owrVPurR+iMkjENFfw1Gcj/lOHVO6BLJ+
         p7y5hT1gWtsGNd+kbpRfY6nOo4+cEui3jmcbYVuAon6LzdnuScFyYLdVsPbXNlDbg76s
         Er6A==
X-Gm-Message-State: AC+VfDynknpFOR77GRdj4H9/8bQOPLV8FYXS/NBNL8aPTgRChkAnHMR3
	vngWYggHhlkOsV96u0Diaz/N8w==
X-Google-Smtp-Source: ACHHUZ4238DSm93lZDXfUQaXb230UfiIqG/QwG8MlbO96c7eSEYZDPLm8Y7CfJuFqwRBJ3ZTi98IIA==
X-Received: by 2002:a05:600c:2158:b0:3f9:aaa:37e7 with SMTP id v24-20020a05600c215800b003f90aaa37e7mr13332459wml.0.1687628589383;
        Sat, 24 Jun 2023 10:43:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexander Graf <agraf@csgraf.de>,
	xen-devel@lists.xenproject.org,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Cameron Esfahani <dirty@apple.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v3 14/16] accel: Inline WHPX get_whpx_vcpu()
Date: Sat, 24 Jun 2023 19:41:19 +0200
Message-Id: <20230624174121.11508-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
References: <20230624174121.11508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No need for this helper to access the CPUState::accel field.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/whpx/whpx-all.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 4ddd2d076a..0903327ac5 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -256,15 +256,6 @@ static bool whpx_has_xsave(void)
     return whpx_xsave_cap.XsaveSupport;
 }
 
-/*
- * VP support
- */
-
-static AccelCPUState *get_whpx_vcpu(CPUState *cpu)
-{
-    return (AccelCPUState *)cpu->accel;
-}
-
 static WHV_X64_SEGMENT_REGISTER whpx_seg_q2h(const SegmentCache *qs, int v86,
                                              int r86)
 {
@@ -390,7 +381,7 @@ static uint64_t whpx_cr8_to_apic_tpr(uint64_t cr8)
 static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -609,7 +600,7 @@ static void whpx_get_xcrs(CPUState *cpu)
 static void whpx_get_registers(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -892,7 +883,7 @@ static const WHV_EMULATOR_CALLBACKS whpx_emu_callbacks = {
 static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryMmioEmulation(
@@ -917,7 +908,7 @@ static int whpx_handle_portio(CPUState *cpu,
                               WHV_X64_IO_PORT_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryIoEmulation(
@@ -1417,7 +1408,7 @@ static vaddr whpx_vcpu_get_pc(CPUState *cpu, bool exit_context_valid)
          * of QEMU, nor this port by calling WHvSetVirtualProcessorRegisters().
          * This is the most common case.
          */
-        AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+        AccelCPUState *vcpu = cpu->accel;
         return vcpu->exit_ctx.VpContext.Rip;
     } else {
         /*
@@ -1468,7 +1459,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     int irq;
@@ -1590,7 +1581,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 
 static void whpx_vcpu_post_run(CPUState *cpu)
 {
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
 
@@ -1617,7 +1608,7 @@ static void whpx_vcpu_process_async_events(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
 
     if ((cpu->interrupt_request & CPU_INTERRUPT_INIT) &&
         !(env->hflags & HF_SMM_MASK)) {
@@ -1656,7 +1647,7 @@ static int whpx_vcpu_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
     struct whpx_breakpoint *stepped_over_bp = NULL;
     WhpxStepMode exclusive_step_mode = WHPX_STEP_NONE;
     int ret;
@@ -2290,7 +2281,7 @@ int whpx_vcpu_exec(CPUState *cpu)
 void whpx_destroy_vcpu(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = cpu->accel;
 
     whp_dispatch.WHvDeleteVirtualProcessor(whpx->partition, cpu->cpu_index);
     whp_dispatch.WHvEmulatorDestroyEmulator(vcpu->emulator);
-- 
2.38.1


