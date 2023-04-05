Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F26D79B1
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:29:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518420.804971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Ny-0000EA-F9; Wed, 05 Apr 2023 10:29:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518420.804971; Wed, 05 Apr 2023 10:29:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Ny-0000C6-A2; Wed, 05 Apr 2023 10:29:02 +0000
Received: by outflank-mailman (input) for mailman id 518420;
 Wed, 05 Apr 2023 10:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gFET=74=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pk0F5-0002Na-8w
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:19:51 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6587ef62-d39b-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 12:19:49 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id l27so35663873wrb.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 03:19:49 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 o7-20020adfe807000000b002e4cd2ec5c7sm14692347wrm.86.2023.04.05.03.19.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:48 -0700 (PDT)
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
X-Inumbo-ID: 6587ef62-d39b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680689989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jksVpkvUC0Cd0t39UFdIwyYip+p/HLpViupo0kEzavo=;
        b=M14p41XBeC2pDOXONWRmVPh/g0bgtOaeo2kq2u+TWuJbxjfFyLRtQYnT6xjEliAwSd
         Gmn7vgNMSmnVxfuYpWs2aBjugNVuv4EcJIwJLGMmyZg0QDYfH3i/sc7Kh/q/3WK7qsdn
         F60Wv7glyCGVMo3BOtpHfdZkvOyzxwN+gH3+Hex9JK/WUrdLUi4yf74vk34hUq78UiYb
         AORBP6ycIQAo33OBYSJhlzh69AqqlN5KQ4LDwsQpdYmaxHN8h7YoC/jYUnRSJ6PAS/Fc
         moP7c9mQFfmYCYIySXHMkSb6ncs0eKD1DYTa0llVPqgHxXnFQBGyNcDmOUOFGwExmveQ
         mqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jksVpkvUC0Cd0t39UFdIwyYip+p/HLpViupo0kEzavo=;
        b=PyjYiXx1JJHfIZA4kAOC7EGN/KhQdJgM+jxnxOevm8EaxJq8pfi1I3LIt4a64ed2CE
         SocZ7t+5OUQ5xI4Ov4aXPhbjPeAKnRu5sfYilbjbhhfebQDQA9jwpy+kmYLsr8LQ1SO0
         hfphUE01mzcoGzCFq9MfO5nUdQk5dLjHZdOOmEuLboCiFieO5jg29rr8h5hkW8rxrePQ
         zSR3+XK0mnRCcV0Jhc0RNr+p3Ryf+MyDu8kKpsdl7QiaPd2TnldNhW5glKpouOAbU/Ti
         fbRMxuQb6H6tudjURYBaEov9K/RQO9GgEmjMwL5WyH0JUJWIAcLIjzJagAwMPEiRzOSM
         l8Iw==
X-Gm-Message-State: AAQBX9eNp0L/5Ld5yV5Vf/S1Je1qYZpd3piRuN2u82Za2nXXoK2oQVVr
	AzUdNGqo2CYG5fqj7RPATd3SBg==
X-Google-Smtp-Source: AKy350ab1egrbimBmhajh9GEqufBtAURJQuxG6H/Hs7JpaNOdz6mu7HJAmIyOPKcGGllVT4MOOnVWA==
X-Received: by 2002:adf:df85:0:b0:2ce:a85f:1313 with SMTP id z5-20020adfdf85000000b002cea85f1313mr3358628wrl.35.1680689989199;
        Wed, 05 Apr 2023 03:19:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: [PATCH 13/14] accel: Inline WHPX get_whpx_vcpu()
Date: Wed,  5 Apr 2023 12:18:10 +0200
Message-Id: <20230405101811.76663-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No need for this helper to access the CPUState::accel field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/whpx/whpx-all.c | 29 ++++++++++-------------------
 1 file changed, 10 insertions(+), 19 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 2372c4227a..2cca6bc004 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -256,15 +256,6 @@ static bool whpx_has_xsave(void)
     return whpx_xsave_cap.XsaveSupport;
 }
 
-/*
- * VP support
- */
-
-static struct AccelvCPUState *get_whpx_vcpu(CPUState *cpu)
-{
-    return (struct AccelvCPUState *)cpu->accel;
-}
-
 static WHV_X64_SEGMENT_REGISTER whpx_seg_q2h(const SegmentCache *qs, int v86,
                                              int r86)
 {
@@ -390,7 +381,7 @@ static uint64_t whpx_cr8_to_apic_tpr(uint64_t cr8)
 static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -609,7 +600,7 @@ static void whpx_get_xcrs(CPUState *cpu)
 static void whpx_get_registers(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -892,7 +883,7 @@ static const WHV_EMULATOR_CALLBACKS whpx_emu_callbacks = {
 static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryMmioEmulation(
@@ -917,7 +908,7 @@ static int whpx_handle_portio(CPUState *cpu,
                               WHV_X64_IO_PORT_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryIoEmulation(
@@ -1417,7 +1408,7 @@ static vaddr whpx_vcpu_get_pc(CPUState *cpu, bool exit_context_valid)
          * of QEMU, nor this port by calling WHvSetVirtualProcessorRegisters().
          * This is the most common case.
          */
-        struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+        struct AccelvCPUState *vcpu = cpu->accel;
         return vcpu->exit_ctx.VpContext.Rip;
     } else {
         /*
@@ -1468,7 +1459,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     int irq;
@@ -1590,7 +1581,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 
 static void whpx_vcpu_post_run(CPUState *cpu)
 {
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
 
@@ -1617,7 +1608,7 @@ static void whpx_vcpu_process_async_events(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
 
     if ((cpu->interrupt_request & CPU_INTERRUPT_INIT) &&
         !(env->hflags & HF_SMM_MASK)) {
@@ -1656,7 +1647,7 @@ static int whpx_vcpu_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
     struct whpx_breakpoint *stepped_over_bp = NULL;
     WhpxStepMode exclusive_step_mode = WHPX_STEP_NONE;
     int ret;
@@ -2296,7 +2287,7 @@ int whpx_vcpu_exec(CPUState *cpu)
 void whpx_destroy_vcpu(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = cpu->accel;
 
     whp_dispatch.WHvDeleteVirtualProcessor(whpx->partition, cpu->cpu_index);
     whp_dispatch.WHvEmulatorDestroyEmulator(vcpu->emulator);
-- 
2.38.1


