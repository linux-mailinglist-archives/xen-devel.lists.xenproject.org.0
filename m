Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D5E73A5EC
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:19:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553767.864543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCN1p-0006oT-2n; Thu, 22 Jun 2023 16:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553767.864543; Thu, 22 Jun 2023 16:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCN1o-0006nP-WF; Thu, 22 Jun 2023 16:19:25 +0000
Received: by outflank-mailman (input) for mailman id 553767;
 Thu, 22 Jun 2023 16:19:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4GDZ=CK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qCMsu-0001Gi-06
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:10:12 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43a5c48f-1117-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 18:10:11 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-311099fac92so8483997f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 09:10:11 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net.
 [88.28.3.230]) by smtp.gmail.com with ESMTPSA id
 p1-20020adfcc81000000b0030ada01ca78sm7404978wrj.10.2023.06.22.09.10.06
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Jun 2023 09:10:10 -0700 (PDT)
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
X-Inumbo-ID: 43a5c48f-1117-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450211; x=1690042211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DKJxOwJmFtwOPAoIICT6M4A+Kzh99mIVYxe/d/9G77Y=;
        b=eg02hjlfgcDaH24aEbjvIFOFqry3t+y3ca6mONxnjQGWPL1Jdtwu4KdzlrO2pncUEm
         v2uAXFNtaqYiIggOc18WWF8JNx7doFAbVKyL4i5VvjAKuJTrn61jQREqSGuH7wbxPOHB
         SQl9lpmkdOY2I8TmvPTRmSHTV/xdmaBelLgPfNn9zpSA2OubeWfB677UATrlvOYIbcR5
         Xd77M5NfRhzJ8nLGIWLXvPckfbvl62BDfMBhKFdJDV8OUDdGPmWJ81CYWWuuNJVbGqz8
         ykGAHRraJs8kr5Nc/YT6E4MagkrdbYLZbwKyQ84h9/BoPe+M9i29JT/WKZ3nt6qAzCaS
         onVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450211; x=1690042211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DKJxOwJmFtwOPAoIICT6M4A+Kzh99mIVYxe/d/9G77Y=;
        b=bqiCUCahgK0jod2/eb7EVwiCOGBQMKi0H5GCCrBg7thzKhRckNr+68+w5pDPw+3vs0
         hG79fcJSJdYpuifPJnkR5VLhI6045xVGBcGfQxVknKxYNsI8nerEO4AtCHDP+VyaDF14
         vpCd7NmocMGV8n1rvwin1NOIfyM5MDlf3VUHrbSoEkX4H/xVybT0YK2trmO1er/BTBwg
         knK5yxgde2BnFa6HBnAu3THEp0E4Ewxqz6UyFmd8d6KKxg2/mBwnTPgJIHlvkYP4HkP+
         ukootCgXHC+10oM3Va+Sg7nH0OsVNXPYQ6Wfz2R0gRCdT73ONv03KNHBMA4lMTKM7PBg
         JlUA==
X-Gm-Message-State: AC+VfDxuXmCwwHI8ajShmri9ZIPKMSfRWTnXI7BWmiRzCvI29JzKu4Ej
	1q/6kLxybi4Yb9EZZK+yRNOrjw==
X-Google-Smtp-Source: ACHHUZ4UJwkfw8UWBY57D2hqCgPl1JN/hvtysVX8WTPHmCC0zEYaJGE4bKrnhQf98VbpMbWrM/7XNw==
X-Received: by 2002:a5d:5751:0:b0:30f:c943:f925 with SMTP id q17-20020a5d5751000000b0030fc943f925mr15315373wrw.49.1687450210926;
        Thu, 22 Jun 2023 09:10:10 -0700 (PDT)
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
Subject: [PATCH v2 10/16] accel: Rename NVMM 'struct qemu_vcpu' -> AccelCPUState
Date: Thu, 22 Jun 2023 18:08:17 +0200
Message-Id: <20230622160823.71851-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230622160823.71851-1-philmd@linaro.org>
References: <20230622160823.71851-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We want all accelerators to share the same opaque pointer in
CPUState. Rename NVMM 'qemu_vcpu' as 'AccelCPUState'; directly
use the typedef, remove unnecessary casts.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/nvmm/nvmm-all.c | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 0588a328ae..e5ee4af084 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -26,7 +26,7 @@
 
 #include <nvmm.h>
 
-struct qemu_vcpu {
+struct AccelCPUState {
     struct nvmm_vcpu vcpu;
     uint8_t tpr;
     bool stop;
@@ -49,10 +49,10 @@ struct qemu_machine {
 static bool nvmm_allowed;
 static struct qemu_machine qemu_mach;
 
-static struct qemu_vcpu *
+static AccelCPUState *
 get_qemu_vcpu(CPUState *cpu)
 {
-    return (struct qemu_vcpu *)cpu->accel;
+    return cpu->accel;
 }
 
 static struct nvmm_machine *
@@ -86,7 +86,7 @@ nvmm_set_registers(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_x64_state *state = vcpu->state;
     uint64_t bitmap;
@@ -223,7 +223,7 @@ nvmm_get_registers(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -347,7 +347,7 @@ static bool
 nvmm_can_take_int(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_machine *mach = get_nvmm_mach();
 
@@ -372,7 +372,7 @@ nvmm_can_take_int(CPUState *cpu)
 static bool
 nvmm_can_take_nmi(CPUState *cpu)
 {
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
 
     /*
      * Contrary to INTs, NMIs always schedule an exit when they are
@@ -395,7 +395,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -478,7 +478,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)
 static void
 nvmm_vcpu_post_run(CPUState *cpu, struct nvmm_vcpu_exit *exit)
 {
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     uint64_t tpr;
@@ -565,7 +565,7 @@ static int
 nvmm_handle_rdmsr(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -610,7 +610,7 @@ static int
 nvmm_handle_wrmsr(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -686,7 +686,7 @@ nvmm_vcpu_loop(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_vcpu_exit *exit = vcpu->exit;
@@ -892,7 +892,7 @@ static void
 nvmm_ipi_signal(int sigcpu)
 {
     if (current_cpu) {
-        struct qemu_vcpu *qcpu = get_qemu_vcpu(current_cpu);
+        AccelCPUState *qcpu = get_qemu_vcpu(current_cpu);
 #if NVMM_USER_VERSION >= 2
         struct nvmm_vcpu *vcpu = &qcpu->vcpu;
         nvmm_vcpu_stop(vcpu);
@@ -926,7 +926,7 @@ nvmm_init_vcpu(CPUState *cpu)
     struct nvmm_vcpu_conf_cpuid cpuid;
     struct nvmm_vcpu_conf_tpr tpr;
     Error *local_error = NULL;
-    struct qemu_vcpu *qcpu;
+    AccelCPUState *qcpu;
     int ret, err;
 
     nvmm_init_cpu_signals();
@@ -942,7 +942,7 @@ nvmm_init_vcpu(CPUState *cpu)
         }
     }
 
-    qcpu = g_malloc0(sizeof(*qcpu));
+    qcpu = g_new0(AccelCPUState, 1);
 
     ret = nvmm_vcpu_create(mach, cpu->cpu_index, &qcpu->vcpu);
     if (ret == -1) {
@@ -991,7 +991,7 @@ nvmm_init_vcpu(CPUState *cpu)
     }
 
     cpu->vcpu_dirty = true;
-    cpu->accel = (struct AccelCPUState *)qcpu;
+    cpu->accel = qcpu;
 
     return 0;
 }
@@ -1023,7 +1023,7 @@ void
 nvmm_destroy_vcpu(CPUState *cpu)
 {
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct qemu_vcpu *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
 
     nvmm_vcpu_destroy(mach, &qcpu->vcpu);
     g_free(cpu->accel);
-- 
2.38.1


