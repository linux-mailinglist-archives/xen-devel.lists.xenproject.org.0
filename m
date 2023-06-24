Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E0B73CC47
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jun 2023 19:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554672.866035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7O3-0004rN-JR; Sat, 24 Jun 2023 17:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554672.866035; Sat, 24 Jun 2023 17:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qD7O2-0004jv-WB; Sat, 24 Jun 2023 17:49:27 +0000
Received: by outflank-mailman (input) for mailman id 554672;
 Sat, 24 Jun 2023 17:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BIr0=CM=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qD7Hb-0008Gp-U6
 for xen-devel@lists.xenproject.org; Sat, 24 Jun 2023 17:42:47 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88180299-12b6-11ee-b237-6b7b168915f2;
 Sat, 24 Jun 2023 19:42:47 +0200 (CEST)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f90b4ac529so22662505e9.0
 for <xen-devel@lists.xenproject.org>; Sat, 24 Jun 2023 10:42:47 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.150])
 by smtp.gmail.com with ESMTPSA id
 q6-20020a7bce86000000b003f7ea771b5dsm2752650wmj.1.2023.06.24.10.42.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 24 Jun 2023 10:42:46 -0700 (PDT)
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
X-Inumbo-ID: 88180299-12b6-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687628567; x=1690220567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=op05vfUAX1M3Sv7qs3sw3v39U7zORQkGDmdogVHbS1k=;
        b=RJYQmK2dluQ/bCElwZXIIY1LD41h1/XaVwvVg8wSWNXJc07PlWVevXeiJ5aPZpO0Y7
         Z1Mav2iYe3ECYz2tzxRgxo3JHBRfUe20wng9r7Jiv8QfuJqPhx5ajypQ6zgsMeF3mFkE
         8Sed9QNqt76GTSbZefh09JZpTjZaNzBhq4efS73Y5DvzVgnD4Qp9rhbnnQXBGUxuvEaq
         yy7qUcr+89Nv63DXeB02W+9ylYZGNB3FEpFjatx5uZMbKoAxNYWa1O+176v+JwPcDjfv
         kOBlKV4J96Zi0Gf3gwB1AnoxdGSP6r699mTBZ4haMqN6ZHOlLTbnMhTspiaCics4jkjW
         rhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687628567; x=1690220567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=op05vfUAX1M3Sv7qs3sw3v39U7zORQkGDmdogVHbS1k=;
        b=k90ZLJLmRRs4h3YAOe4QUactXXKMockSkO/ka8TwD02/xInbuevKfprNF1Y4g1ptOS
         9ZUj6Sc/6oBxO2plTq14kz7LMr3GynCR+515HQjKLJ9R+GTlXzf4pD6aWcGntpi27pky
         k1k1GdqSYXQCpJvGnAgdYKkWehNIOUh3dMItT8nXNhUIWeIbxiVwysIr9hF7JZIUyzvz
         dNIEeCE1I3cDtvFMLEiJT2X8BebIY46m8LBl1bgCGYcHHAwM9qN/94IOjqPOmO8dJWtl
         JpP21CSat/9IWYWCdA/GxpNctfNPPLzB0WvubHJ1XDcL7wNW08S7TkahdxtX27sIZDlF
         xYIQ==
X-Gm-Message-State: AC+VfDzNWeZ1njhpnK/fB8Kc9f1glN4pfCvzOk7JNnekpkSkuOrtP2ja
	NsN4/lAsYV7qLzHVAaVkEp4UnA==
X-Google-Smtp-Source: ACHHUZ7X7jLi/v3awNWluzxBZUhpVWl7iOZemFneJv8KElxp32UetPs7a+ASZHGCEDVytT3X67X+6Q==
X-Received: by 2002:a05:600c:231a:b0:3f9:b430:199b with SMTP id 26-20020a05600c231a00b003f9b430199bmr12673550wmo.15.1687628566856;
        Sat, 24 Jun 2023 10:42:46 -0700 (PDT)
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
Subject: [PATCH v3 11/16] accel: Inline NVMM get_qemu_vcpu()
Date: Sat, 24 Jun 2023 19:41:16 +0200
Message-Id: <20230624174121.11508-12-philmd@linaro.org>
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
 target/i386/nvmm/nvmm-all.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index e5ee4af084..72a3a9e3ae 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -49,12 +49,6 @@ struct qemu_machine {
 static bool nvmm_allowed;
 static struct qemu_machine qemu_mach;
 
-static AccelCPUState *
-get_qemu_vcpu(CPUState *cpu)
-{
-    return cpu->accel;
-}
-
 static struct nvmm_machine *
 get_nvmm_mach(void)
 {
@@ -86,7 +80,7 @@ nvmm_set_registers(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_x64_state *state = vcpu->state;
     uint64_t bitmap;
@@ -223,7 +217,7 @@ nvmm_get_registers(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -347,7 +341,7 @@ static bool
 nvmm_can_take_int(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
-    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_machine *mach = get_nvmm_mach();
 
@@ -372,7 +366,7 @@ nvmm_can_take_int(CPUState *cpu)
 static bool
 nvmm_can_take_nmi(CPUState *cpu)
 {
-    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = cpu->accel;
 
     /*
      * Contrary to INTs, NMIs always schedule an exit when they are
@@ -395,7 +389,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -478,7 +472,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)
 static void
 nvmm_vcpu_post_run(CPUState *cpu, struct nvmm_vcpu_exit *exit)
 {
-    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     uint64_t tpr;
@@ -565,7 +559,7 @@ static int
 nvmm_handle_rdmsr(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -610,7 +604,7 @@ static int
 nvmm_handle_wrmsr(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -686,7 +680,7 @@ nvmm_vcpu_loop(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_vcpu_exit *exit = vcpu->exit;
@@ -892,7 +886,7 @@ static void
 nvmm_ipi_signal(int sigcpu)
 {
     if (current_cpu) {
-        AccelCPUState *qcpu = get_qemu_vcpu(current_cpu);
+        AccelCPUState *qcpu = current_cpu->accel;
 #if NVMM_USER_VERSION >= 2
         struct nvmm_vcpu *vcpu = &qcpu->vcpu;
         nvmm_vcpu_stop(vcpu);
@@ -1023,7 +1017,7 @@ void
 nvmm_destroy_vcpu(CPUState *cpu)
 {
     struct nvmm_machine *mach = get_nvmm_mach();
-    AccelCPUState *qcpu = get_qemu_vcpu(cpu);
+    AccelCPUState *qcpu = cpu->accel;
 
     nvmm_vcpu_destroy(mach, &qcpu->vcpu);
     g_free(cpu->accel);
-- 
2.38.1


