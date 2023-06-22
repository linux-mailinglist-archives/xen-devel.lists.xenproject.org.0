Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D9173A5E8
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:19:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553771.864554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCN1p-0006xQ-MW; Thu, 22 Jun 2023 16:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553771.864554; Thu, 22 Jun 2023 16:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCN1p-0006qL-F6; Thu, 22 Jun 2023 16:19:25 +0000
Received: by outflank-mailman (input) for mailman id 553771;
 Thu, 22 Jun 2023 16:19:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4GDZ=CK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qCMtZ-0001Yq-1U
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:10:53 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b7d2135-1117-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 18:10:51 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3113675d582so4941043f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 09:10:51 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net.
 [88.28.3.230]) by smtp.gmail.com with ESMTPSA id
 z17-20020a5d6551000000b00307bc4e39e5sm7314320wrv.117.2023.06.22.09.10.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Jun 2023 09:10:50 -0700 (PDT)
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
X-Inumbo-ID: 5b7d2135-1117-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450251; x=1690042251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1vRGyzu8+XqKaMgtN/nMAkP8vtjVhpBIfkdPMVYyfg=;
        b=SzgUJ/3O2JDLimh3+Agd51LJmZaiaEI8ZFwaKFU+xUs5N8igbv+HWLrxj9PAtNvt2P
         tWlCEtAkV4Akr6+YlAN8K0+yYGd8sx7dWoQtnO9KdQzwhhCQld65/SzWP89kgi87B8eh
         lKMQC9nQ2o/IYRKSQG/yO9HtB3B5uhxSrJ9JhYdyhuNC01KDTA0mRGksU/fOnTci3VcF
         eTy0N5FdKs+2ao4NC9iyl73k4WTq5YyQZ/JcjaHtorbZwzW7L3xdvwCsUkTmug4AIfdv
         WLk3g3kHwPWZQJTJwWN7mJvQlvPyRQSzb5+sWK5ic1pU1dfvlbmGNaZyANDyv6I1Adx6
         w5kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450251; x=1690042251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1vRGyzu8+XqKaMgtN/nMAkP8vtjVhpBIfkdPMVYyfg=;
        b=PF9RV3bz1mwzj08MPI6YVS9HLRHaNC0GxYx3IQW0zHSDSBCNZUlvf51Ced/4AkvY0U
         75z1z50r8YUp7XzpI+NwPyui0hz8MDq+8oLBubu7YNWQP+l5ZuF05i8kPSIzcM3855su
         2Y5rCjU7rsfY7bVCiGQMimO5Yep5/vP5aVTT6N0wLN2+6r+RgKtOB2id4F+YCM7TyIKK
         Eh628JbyD3g4qD7Asp9yVVG3qO8e2On6myX0PNwMkdl9LabbPu9RyLvT6iLk4tdPYl5B
         LOKl7/tL0BBMWGXxBf4efXgn9SFZkXvEO/wI5ZhYBBB3YIwaSDZEDJPJylB3ZvbaJkFr
         anfQ==
X-Gm-Message-State: AC+VfDy/0uk1WaAdUPBM/MVHIo5bzSgsSDMbZQF/LGUWQKKJsscbmg4v
	hP29R1DcrdnqU2dFfD3xU4TAWA==
X-Google-Smtp-Source: ACHHUZ6Zvkg+/2pI/zQv1tCUfVDDfB62uZn7snk8J9Qv86AyAfhXfm7jju4fWwybVTRViGAkVekuMA==
X-Received: by 2002:a5d:4cc2:0:b0:309:5068:9ebe with SMTP id c2-20020a5d4cc2000000b0030950689ebemr12061202wrt.50.1687450250976;
        Thu, 22 Jun 2023 09:10:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Reinoud Zandijk <reinoud@netbsd.org>,
	qemu-arm@nongnu.org,
	kvm@vger.kernel.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Roman Bolshakov <rbolshakov@ddn.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>,
	Alexander Graf <agraf@csgraf.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 14/16] accel: Inline WHPX get_whpx_vcpu()
Date: Thu, 22 Jun 2023 18:08:21 +0200
Message-Id: <20230622160823.71851-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230622160823.71851-1-philmd@linaro.org>
References: <20230622160823.71851-1-philmd@linaro.org>
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
index 107b731d3f..fdac13c7c1 100644
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


