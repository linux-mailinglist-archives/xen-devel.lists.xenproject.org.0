Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A7B73A59F
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553752.864523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMsH-00042i-U0; Thu, 22 Jun 2023 16:09:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553752.864523; Thu, 22 Jun 2023 16:09:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCMsH-00040E-Pl; Thu, 22 Jun 2023 16:09:33 +0000
Received: by outflank-mailman (input) for mailman id 553752;
 Thu, 22 Jun 2023 16:09:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4GDZ=CK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qCMsF-0001Gi-Sn
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:09:31 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2bb0fa60-1117-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 18:09:31 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3113675d582so4939160f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 09:09:31 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net.
 [88.28.3.230]) by smtp.gmail.com with ESMTPSA id
 w8-20020adfcd08000000b00301a351a8d6sm7484316wrm.84.2023.06.22.09.09.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Jun 2023 09:09:30 -0700 (PDT)
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
X-Inumbo-ID: 2bb0fa60-1117-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450170; x=1690042170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UX7A/4NpufAJKKWp2HGkO2gs63RM9WYyIFTo3iDzXaM=;
        b=DdtbSfGB9fIFn73hC/ZN2gzhWDEsS0lqTX8dZb/if6XVyDDbwZBazG7bXEfDnHcBjo
         cR4ajzbr27l+07b6XnE3TAUOrrAaPlT5xkF/l909nBh4qbPQ3Le8z4WnnFM4pKME0MKi
         NbK3/ZqKbBUkNEXH8RgWgsGDDqMpx3luPpSpi46OqkCh5VXZM0ZX6MHWsmyWZfMOlGLK
         UOr3ih8YC2upaRjqD7yvc8ALouWGlaOZAhU+QIMbyyOMXRFGVh8hLC4KGkyCuxUS6QeS
         3FzJNs97K48LpXVOdGHAYg8xBBpXfCsgZVqYjpH6rIQumcZxeMkew5aWBuVSu56hmwO5
         pLgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450170; x=1690042170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UX7A/4NpufAJKKWp2HGkO2gs63RM9WYyIFTo3iDzXaM=;
        b=Ayhxtn89x+3VqiKe5EGf6xVmfj82km98dDERrkhccgyhD4c2NsRRNTDj//i85auRlb
         NeAIxHT5xMpxf7Z9sQLBu4ba4HSQChxNjJvwWeXIbXQKxgYqVqQQofZArYOy/yQU3bkN
         u2DsLhFprsir55gcZ4Q32rQBJpE3Vy/Bw6zh6F0bysyuxea58joz0p4XMafU52IEc/a3
         HwGw/UaCcLaNOJOuNO4d2V4Fpb/QrcCav72nisQhpPAqZItzYs06M/md/ooR+q2xnm6S
         EqtqJ/F3zxNZLVxiDwRJueDNf6maYnB4wUwsVb08s36bjpF/2LuccUlX6Nlz/HAzD9yt
         O21A==
X-Gm-Message-State: AC+VfDwMNm+dGoZyk45hItBq7X/dOBUKvP+Lbj85LtWNwiO+vLvSoN59
	54fp1RacfSWo2p0CuxcxuzNM0A==
X-Google-Smtp-Source: ACHHUZ6397oLn+9xHpt22BhUSP9QEJUubmRRJRV5VKiXD/mQbPJbeDrcgDPjDy71BF2ku+M1ZHsSsw==
X-Received: by 2002:adf:f78a:0:b0:311:1cbd:800a with SMTP id q10-20020adff78a000000b003111cbd800amr13110914wrp.12.1687450170751;
        Thu, 22 Jun 2023 09:09:30 -0700 (PDT)
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
Subject: [PATCH v2 06/16] accel: Rename 'hax_vcpu' as 'accel' in CPUState
Date: Thu, 22 Jun 2023 18:08:13 +0200
Message-Id: <20230622160823.71851-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230622160823.71851-1-philmd@linaro.org>
References: <20230622160823.71851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

All accelerators will share a single opaque context
in CPUState. Start by renaming 'hax_vcpu' as 'accel'.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h           |  2 +-
 target/i386/hax/hax-accel-ops.c |  2 +-
 target/i386/hax/hax-all.c       | 18 +++++++++---------
 target/i386/nvmm/nvmm-all.c     |  6 +++---
 target/i386/whpx/whpx-all.c     |  6 +++---
 5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 4871ad85f0..84b5a866e7 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -441,7 +441,7 @@ struct CPUState {
     /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
     bool prctl_unalign_sigbus;
 
-    struct hax_vcpu_state *hax_vcpu;
+    struct hax_vcpu_state *accel;
 
     struct hvf_vcpu_state *hvf;
 
diff --git a/target/i386/hax/hax-accel-ops.c b/target/i386/hax/hax-accel-ops.c
index 0157a628a3..a8512efcd5 100644
--- a/target/i386/hax/hax-accel-ops.c
+++ b/target/i386/hax/hax-accel-ops.c
@@ -71,7 +71,7 @@ static void hax_start_vcpu_thread(CPUState *cpu)
              cpu->cpu_index);
     qemu_thread_create(cpu->thread, thread_name, hax_cpu_thread_fn,
                        cpu, QEMU_THREAD_JOINABLE);
-    assert(cpu->hax_vcpu);
+    assert(cpu->accel);
 #ifdef _WIN32
     cpu->hThread = qemu_thread_get_handle(cpu->thread);
 #endif
diff --git a/target/i386/hax/hax-all.c b/target/i386/hax/hax-all.c
index 38a4323a3c..3865ff9419 100644
--- a/target/i386/hax/hax-all.c
+++ b/target/i386/hax/hax-all.c
@@ -62,7 +62,7 @@ int valid_hax_tunnel_size(uint16_t size)
 
 hax_fd hax_vcpu_get_fd(CPUArchState *env)
 {
-    struct hax_vcpu_state *vcpu = env_cpu(env)->hax_vcpu;
+    struct hax_vcpu_state *vcpu = env_cpu(env)->accel;
     if (!vcpu) {
         return HAX_INVALID_FD;
     }
@@ -188,7 +188,7 @@ int hax_vcpu_create(int id)
 
 int hax_vcpu_destroy(CPUState *cpu)
 {
-    struct hax_vcpu_state *vcpu = cpu->hax_vcpu;
+    struct hax_vcpu_state *vcpu = cpu->accel;
 
     if (!hax_global.vm) {
         fprintf(stderr, "vcpu %x destroy failed, vm is null\n", vcpu->vcpu_id);
@@ -209,7 +209,7 @@ int hax_vcpu_destroy(CPUState *cpu)
     CloseHandle(cpu->hThread);
 #endif
     g_free(vcpu);
-    cpu->hax_vcpu = NULL;
+    cpu->accel = NULL;
     return 0;
 }
 
@@ -223,7 +223,7 @@ int hax_init_vcpu(CPUState *cpu)
         exit(-1);
     }
 
-    cpu->hax_vcpu = hax_global.vm->vcpus[cpu->cpu_index];
+    cpu->accel = hax_global.vm->vcpus[cpu->cpu_index];
     cpu->vcpu_dirty = true;
     qemu_register_reset(hax_reset_vcpu_state, cpu->env_ptr);
 
@@ -415,7 +415,7 @@ static int hax_handle_io(CPUArchState *env, uint32_t df, uint16_t port,
 static int hax_vcpu_interrupt(CPUArchState *env)
 {
     CPUState *cpu = env_cpu(env);
-    struct hax_vcpu_state *vcpu = cpu->hax_vcpu;
+    struct hax_vcpu_state *vcpu = cpu->accel;
     struct hax_tunnel *ht = vcpu->tunnel;
 
     /*
@@ -447,7 +447,7 @@ static int hax_vcpu_interrupt(CPUArchState *env)
 
 void hax_raise_event(CPUState *cpu)
 {
-    struct hax_vcpu_state *vcpu = cpu->hax_vcpu;
+    struct hax_vcpu_state *vcpu = cpu->accel;
 
     if (!vcpu) {
         return;
@@ -468,7 +468,7 @@ static int hax_vcpu_hax_exec(CPUArchState *env)
     int ret = 0;
     CPUState *cpu = env_cpu(env);
     X86CPU *x86_cpu = X86_CPU(cpu);
-    struct hax_vcpu_state *vcpu = cpu->hax_vcpu;
+    struct hax_vcpu_state *vcpu = cpu->accel;
     struct hax_tunnel *ht = vcpu->tunnel;
 
     if (!hax_enabled()) {
@@ -1114,8 +1114,8 @@ void hax_reset_vcpu_state(void *opaque)
 {
     CPUState *cpu;
     for (cpu = first_cpu; cpu != NULL; cpu = CPU_NEXT(cpu)) {
-        cpu->hax_vcpu->tunnel->user_event_pending = 0;
-        cpu->hax_vcpu->tunnel->ready_for_interrupt_injection = 0;
+        cpu->accel->tunnel->user_event_pending = 0;
+        cpu->accel->tunnel->ready_for_interrupt_injection = 0;
     }
 }
 
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index b75738ee9c..cf4f0af24b 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -52,7 +52,7 @@ static struct qemu_machine qemu_mach;
 static struct qemu_vcpu *
 get_qemu_vcpu(CPUState *cpu)
 {
-    return (struct qemu_vcpu *)cpu->hax_vcpu;
+    return (struct qemu_vcpu *)cpu->accel;
 }
 
 static struct nvmm_machine *
@@ -995,7 +995,7 @@ nvmm_init_vcpu(CPUState *cpu)
     }
 
     cpu->vcpu_dirty = true;
-    cpu->hax_vcpu = (struct hax_vcpu_state *)qcpu;
+    cpu->accel = (struct hax_vcpu_state *)qcpu;
 
     return 0;
 }
@@ -1030,7 +1030,7 @@ nvmm_destroy_vcpu(CPUState *cpu)
     struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
 
     nvmm_vcpu_destroy(mach, &qcpu->vcpu);
-    g_free(cpu->hax_vcpu);
+    g_free(cpu->accel);
 }
 
 /* -------------------------------------------------------------------------- */
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index 52af81683c..d1ad6f156a 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -262,7 +262,7 @@ static bool whpx_has_xsave(void)
 
 static struct whpx_vcpu *get_whpx_vcpu(CPUState *cpu)
 {
-    return (struct whpx_vcpu *)cpu->hax_vcpu;
+    return (struct whpx_vcpu *)cpu->accel;
 }
 
 static WHV_X64_SEGMENT_REGISTER whpx_seg_q2h(const SegmentCache *qs, int v86,
@@ -2258,7 +2258,7 @@ int whpx_init_vcpu(CPUState *cpu)
 
     vcpu->interruptable = true;
     cpu->vcpu_dirty = true;
-    cpu->hax_vcpu = (struct hax_vcpu_state *)vcpu;
+    cpu->accel = (struct hax_vcpu_state *)vcpu;
     max_vcpu_index = max(max_vcpu_index, cpu->cpu_index);
     qemu_add_vm_change_state_handler(whpx_cpu_update_state, cpu->env_ptr);
 
@@ -2300,7 +2300,7 @@ void whpx_destroy_vcpu(CPUState *cpu)
 
     whp_dispatch.WHvDeleteVirtualProcessor(whpx->partition, cpu->cpu_index);
     whp_dispatch.WHvEmulatorDestroyEmulator(vcpu->emulator);
-    g_free(cpu->hax_vcpu);
+    g_free(cpu->accel);
     return;
 }
 
-- 
2.38.1


