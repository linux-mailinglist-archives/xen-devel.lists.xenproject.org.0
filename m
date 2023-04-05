Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D3C6D79B4
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:29:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518431.805013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0O4-0001Rl-Hj; Wed, 05 Apr 2023 10:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518431.805013; Wed, 05 Apr 2023 10:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0O4-0001Ng-80; Wed, 05 Apr 2023 10:29:08 +0000
Received: by outflank-mailman (input) for mailman id 518431;
 Wed, 05 Apr 2023 10:29:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gFET=74=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pk0Ex-0002Na-A1
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:19:43 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60c82f71-d39b-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 12:19:41 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 l10-20020a05600c1d0a00b003f04bd3691eso6766053wms.5
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 03:19:41 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b003ee9c8cc631sm1780821wmq.23.2023.04.05.03.19.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:40 -0700 (PDT)
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
X-Inumbo-ID: 60c82f71-d39b-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680689981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/MtLkEvv/mpFG8xdDJ5UGIDl6QuLPsc27INO07zRJs=;
        b=j3hNNVtnFSkeMmMMmVP7MwKIlYYAEqbhDpfKTMInG3a+9K0+YXceoJPZJ4jZAHCBFI
         VPa6eMgi/+9TXCgyr86xjuKK9t4zNhPlw7CAX0fvenTdKFSa3t+eBYp0hgH6m98d3/lR
         jnJJMwWe2cN5PCDDRMn3ZiOfvLvOx0KgfKGPNgpITrxaoDPAOFx1uqGJJWFNIk4jpdv7
         NGGSO2xZQkFpOwy7mhzr21QREPPwjCH42qXvKwpRx5Hf1PwrV8q3x4WiQL9Zq/cJZpvA
         +TtnCQgltM297hRRmytaXGZhpTBrxwBYRmMmPEjntzUo7iHBOLTSWiIxfEFT8knJMWNo
         rgog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S/MtLkEvv/mpFG8xdDJ5UGIDl6QuLPsc27INO07zRJs=;
        b=ENxCQpKaZ/vJYYVAI/pNkWj5blaiw0Y3P01s+6CN3vcTM/wnO5KzZqAqqOxAsyFpie
         QfnEX4I1aWEWKrME2hatZaUin5d2tLTPrXy2j53kEEXCM0U8G5wLqJOODKrPQ29r0ZPb
         dqdceKwV/3insS9Sz3Gkw7sg2oLuBMdT4SbEMa9QRXXJF1Q0n1kr6SeHc6rANMz4ZWQA
         Zub2EHnAYv/TpLWsAPUVM2rFO+mBeZlDci4tSaQOKALtsLWi09g7qnC80CfNfopgY+bx
         KjW7byf3VkBTyx/FtdgyvGefna0HHurow6rJEbnGHgyTa5KGVHp7JQ6/WaI7VUxsQ7xd
         xMzA==
X-Gm-Message-State: AAQBX9ee/CrNb48v9z13d39+WMgzcsZNjSDBQDTBlr7XhRNqq1gqFiLe
	foFpC3UFDFZ8uIL3qxhgYhTy9A==
X-Google-Smtp-Source: AKy350ZceuduIKjGNIdlkcOLlYLJL5KbbisXjbggRXGoX4b3J2s4uJbs/AyE+v9R+USsxTJSDNjt2g==
X-Received: by 2002:a1c:f707:0:b0:3ee:9909:acc8 with SMTP id v7-20020a1cf707000000b003ee9909acc8mr4174177wmh.32.1680689981231;
        Wed, 05 Apr 2023 03:19:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: [PATCH 12/14] accel: Rename WHPX struct whpx_vcpu -> struct AccelvCPUState
Date: Wed,  5 Apr 2023 12:18:09 +0200
Message-Id: <20230405101811.76663-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We want all accelerators to share the same opaque pointer in
CPUState. Rename WHPX 'whpx_vcpu' as 'AccelvCPUState'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/whpx/whpx-all.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 70eadb7f05..2372c4227a 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -229,7 +229,7 @@ typedef enum WhpxStepMode {
     WHPX_STEP_EXCLUSIVE,
 } WhpxStepMode;
 
-struct whpx_vcpu {
+struct AccelvCPUState {
     WHV_EMULATOR_HANDLE emulator;
     bool window_registered;
     bool interruptable;
@@ -260,9 +260,9 @@ static bool whpx_has_xsave(void)
  * VP support
  */
 
-static struct whpx_vcpu *get_whpx_vcpu(CPUState *cpu)
+static struct AccelvCPUState *get_whpx_vcpu(CPUState *cpu)
 {
-    return (struct whpx_vcpu *)cpu->accel;
+    return (struct AccelvCPUState *)cpu->accel;
 }
 
 static WHV_X64_SEGMENT_REGISTER whpx_seg_q2h(const SegmentCache *qs, int v86,
@@ -390,7 +390,7 @@ static uint64_t whpx_cr8_to_apic_tpr(uint64_t cr8)
 static void whpx_set_registers(CPUState *cpu, int level)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -609,7 +609,7 @@ static void whpx_get_xcrs(CPUState *cpu)
 static void whpx_get_registers(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct whpx_register_set vcxt;
@@ -892,7 +892,7 @@ static const WHV_EMULATOR_CALLBACKS whpx_emu_callbacks = {
 static int whpx_handle_mmio(CPUState *cpu, WHV_MEMORY_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryMmioEmulation(
@@ -917,7 +917,7 @@ static int whpx_handle_portio(CPUState *cpu,
                               WHV_X64_IO_PORT_ACCESS_CONTEXT *ctx)
 {
     HRESULT hr;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     WHV_EMULATOR_STATUS emu_status;
 
     hr = whp_dispatch.WHvEmulatorTryIoEmulation(
@@ -1417,7 +1417,7 @@ static vaddr whpx_vcpu_get_pc(CPUState *cpu, bool exit_context_valid)
          * of QEMU, nor this port by calling WHvSetVirtualProcessorRegisters().
          * This is the most common case.
          */
-        struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+        struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
         return vcpu->exit_ctx.VpContext.Rip;
     } else {
         /*
@@ -1468,7 +1468,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     int irq;
@@ -1590,7 +1590,7 @@ static void whpx_vcpu_pre_run(CPUState *cpu)
 
 static void whpx_vcpu_post_run(CPUState *cpu)
 {
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
 
@@ -1617,7 +1617,7 @@ static void whpx_vcpu_process_async_events(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
 
     if ((cpu->interrupt_request & CPU_INTERRUPT_INIT) &&
         !(env->hflags & HF_SMM_MASK)) {
@@ -1656,7 +1656,7 @@ static int whpx_vcpu_run(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
     struct whpx_breakpoint *stepped_over_bp = NULL;
     WhpxStepMode exclusive_step_mode = WHPX_STEP_NONE;
     int ret;
@@ -2154,7 +2154,7 @@ int whpx_init_vcpu(CPUState *cpu)
 {
     HRESULT hr;
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = NULL;
+    struct AccelvCPUState *vcpu = NULL;
     Error *local_error = NULL;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
@@ -2177,7 +2177,7 @@ int whpx_init_vcpu(CPUState *cpu)
         }
     }
 
-    vcpu = g_new0(struct whpx_vcpu, 1);
+    vcpu = g_new0(struct AccelvCPUState, 1);
 
     if (!vcpu) {
         error_report("WHPX: Failed to allocte VCPU context.");
@@ -2296,7 +2296,7 @@ int whpx_vcpu_exec(CPUState *cpu)
 void whpx_destroy_vcpu(CPUState *cpu)
 {
     struct whpx_state *whpx = &whpx_global;
-    struct whpx_vcpu *vcpu = get_whpx_vcpu(cpu);
+    struct AccelvCPUState *vcpu = get_whpx_vcpu(cpu);
 
     whp_dispatch.WHvDeleteVirtualProcessor(whpx->partition, cpu->cpu_index);
     whp_dispatch.WHvEmulatorDestroyEmulator(vcpu->emulator);
-- 
2.38.1


