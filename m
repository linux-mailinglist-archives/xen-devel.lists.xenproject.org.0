Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 535C073CC46
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 19:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554669.866016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7O2-0004UL-5F; Sat, 24 Jun 2023 17:49:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554669.866016; Sat, 24 Jun 2023 17:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7O1-0004R8-Uz; Sat, 24 Jun 2023 17:49:25 +0000
Received: by outflank-mailman (input) for mailman id 554669;
 Sat, 24 Jun 2023 17:49:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIr0=CM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qD7Hr-0000wd-P3
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 17:43:03 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90d7094b-12b6-11ee-8611-37d641c3527e;
 Sat, 24 Jun 2023 19:43:02 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fa0253b9e7so15570345e9.1
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 10:43:02 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
 by smtp.gmail.com with ESMTPSA id
 x24-20020a05600c21d800b003f858ae8f9dsm5627374wmj.31.2023.06.24.10.42.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 24 Jun 2023 10:43:00 -0700 (PDT)
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
X-Inumbo-ID: 90d7094b-12b6-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628581; x=1690220581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3YC9GFHrwXVDf1ItgmDmu2S/mgeY2SHKESPMbekbhg=;
        b=ISbZ7BY9b4/Aq+EjBk8eGpZlBPuqZIMbCL1Z2KOFPMZz5ox8oBaCrkDc4FubFKawGY
         1tL2W1BGOVdUJvioaccKvPFxa0fEaw7zU/sU/n+FO2BpC/1IPS2fD/EtnxEeMc5v/tPg
         VwJX1jKjSp14BD9fIrvVzF/tQyR/m/xhTXl78ZfsDcfFUGIsFaXjG37CDoNuPmVipyz6
         TINz55AJXSQbJ3aFJm4lg1dDwZMk2T/PkUao90+jkPyulQ+K2D88yQgTzzMeJPYQvf8G
         3ti4QnkgoEQLWxpgFzIGE6kJzwKx6tnpeaUv8ETipQZdlWQyYpmoT8rKxNFuLXCiunZb
         t+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628581; x=1690220581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3YC9GFHrwXVDf1ItgmDmu2S/mgeY2SHKESPMbekbhg=;
        b=EUm00phO5wtn3YKF+lLo+oAMsbgXZMrLnvIyO/xdT1l+1Ej3qPttW7xS+CTuRwIoE0
         yunhRnY02fKiVqoIBhV2xv9iB/V9mqCndWDYM4meLYy7qJ875kkfpbs18C2mh8WdHNiK
         wqDOuaF0KzvhMaOPlZx5nAZOVqYqhqOURtosjuT8ncmex+LIl2gZnXilgxFX/KVLDn8S
         w01mZKWvat5jxCu6X2r5Kiph/ZmbhOa6Ps/h00gqcWagX/mcTyJkgG1QAO2Udi6yEmJr
         qSrOHZDJngkKWmR0xf/ZEvmHXpovJbcwE3WiAXEHblBKHBg7VU8z+r4uOMKLVlcL8zMM
         72Kg==
X-Gm-Message-State: AC+VfDyHSGWvFmFq2TIT9GPegRhxCgxChxAf7jZCqSw6L/2TndSyYhxk
	N1IXEcTgonNaCHt+jksw5VvrdA==
X-Google-Smtp-Source: ACHHUZ6x1kJtmnLWyDej5xX9yS3xNdJXqxD8xkB+g+E8OEa6HcSaTMV73YfM1pIWCauIJs3hjcdCpQ==
X-Received: by 2002:a7b:cb04:0:b0:3f7:ecdf:ab2d with SMTP id u4-20020a7bcb04000000b003f7ecdfab2dmr24480622wmj.20.1687628581315;
        Sat, 24 Jun 2023 10:43:01 -0700 (PDT)
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
Subject: [PATCH v3 13/16] accel: Rename WHPX 'struct whpx_vcpu' -> AccelCPUState
Date: Sat, 24 Jun 2023 19:41:18 +0200
Message-Id: <20230624174121.11508-14-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230624174121.11508-1-philmd@linaro.org>
References: <20230624174121.11508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We want all accelerators to share the same opaque pointer in
CPUState. Rename WHPX 'whpx_vcpu' as 'AccelCPUState'; use
the typedef.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/whpx/whpx-all.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index cad7bd0f88..4ddd2d076a 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -229,7 +229,7 @@ typedef enum WhpxStepMode {
     WHPX_STEP_EXCLUSIVE,
 } WhpxStepMode;
 
-struct whpx_vcpu {
+struct AccelCPUState {
     WHV_EMULATOR_HANDLE emulator;
     bool window_registered;
     bool interruptable;
@@ -260,9 +260,9 @@ static bool whpx_has_xsave(void)
  * VP support
  */
 
-static struct whpx_vcpu *get_whpx_vcpu(CPUState *cpu)
+static AccelCPUState *get_whpx_vcpu(CPUState *cpu)
 {
-    return (struct whpx_vcpu *)cpu->accel;
+    return (AccelCPUState *)cpu->accel;
 }
 
 static WHV_X64_SEGMENT_REGISTER whpx_seg_q2h(const SegmentCache *qs, int v86,
@@ -390,7 +390,7 @@ static uint64_t whpx_cr8_to_apic_tpr(uint64_t cr8)
 static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -609,7 +609,7 @@ static void whpx_get_xcrs(CPUState *cpu)
 static void whpx_get_registers(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -892,7 +892,7 @@ static const WHV_EMULATOR_CALLBACKS whpx_emu_callbacks = {
 static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryMmioEmulation(
@@ -917,7 +917,7 @@ static int whpx_handle_portio(CPUState *cpu,
                               WHV_X64_IO_PORT_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryIoEmulation(
@@ -1417,7 +1417,7 @@ static vaddr whpx_vcpu_get_pc(CPUState *cpu, bool exit_context_valid)
          * of QEMU, nor this port by calling WHvSetVirtualProcessorRegisters().
          * This is the most common case.
          */
-        struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+        AccelCPUState *vcpu = get_whpx_vcpu(cpu);
         return vcpu->exit_ctx.VpContext.Rip;
     } else {
         /*
@@ -1468,7 +1468,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     int irq;
@@ -1590,7 +1590,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 
 static void whpx_vcpu_post_run(CPUState *cpu)
 {
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
 
@@ -1617,7 +1617,7 @@ static void whpx_vcpu_process_async_events(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
 
     if ((cpu->interrupt_request & CPU_INTERRUPT_INIT) &&
         !(env->hflags & HF_SMM_MASK)) {
@@ -1656,7 +1656,7 @@ static int whpx_vcpu_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
     struct whpx_breakpoint *stepped_over_bp = NULL;
     WhpxStepMode exclusive_step_mode = WHPX_STEP_NONE;
     int ret;
@@ -2154,7 +2154,7 @@ int whpx_init_vcpu(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = NULL;
+    AccelCPUState *vcpu = NULL;
     Error *local_error = NULL;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
@@ -2177,7 +2177,7 @@ int whpx_init_vcpu(CPUState *cpu)
         }
     }
 
-    vcpu = g_new0(struct whpx_vcpu, 1);
+    vcpu = g_new0(AccelCPUState, 1);
 
     hr = whp_dispatch.WHvEmulatorCreateEmulator(
         &whpx_emu_callbacks,
@@ -2290,7 +2290,7 @@ int whpx_vcpu_exec(CPUState *cpu)
 void whpx_destroy_vcpu(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    AccelCPUState *vcpu = get_whpx_vcpu(cpu);
 
     whp_dispatch.WHvDeleteVirtualProcessor(whpx->partition, cpu->cpu_index);
     whp_dispatch.WHvEmulatorDestroyEmulator(vcpu->emulator);
-- 
2.38.1


