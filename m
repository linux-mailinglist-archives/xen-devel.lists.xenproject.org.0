Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4855A73A5EB
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 18:19:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553776.864594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCN1t-00088s-S8; Thu, 22 Jun 2023 16:19:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553776.864594; Thu, 22 Jun 2023 16:19:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCN1t-00086t-Mv; Thu, 22 Jun 2023 16:19:29 +0000
Received: by outflank-mailman (input) for mailman id 553776;
 Thu, 22 Jun 2023 16:19:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4GDZ=CK=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qCMt4-0001Gi-D5
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 16:10:22 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49d4b16a-1117-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 18:10:21 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3fa79605a3bso2348435e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 09:10:21 -0700 (PDT)
Received: from localhost.localdomain (230.red-88-28-3.dynamicip.rima-tde.net.
 [88.28.3.230]) by smtp.gmail.com with ESMTPSA id
 b10-20020adff24a000000b0030ae901bc54sm7431007wrp.62.2023.06.22.09.10.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 22 Jun 2023 09:10:20 -0700 (PDT)
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
X-Inumbo-ID: 49d4b16a-1117-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687450221; x=1690042221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=op05vfUAX1M3Sv7qs3sw3v39U7zORQkGDmdogVHbS1k=;
        b=CKQGRKk27eSiIm5F19z7Fw+0UvB8mt1EPZLenc8tuPAa4/0aAJ+SnF0zMdupIesuyt
         y+b9HW/Tb6ijXTw+tcPYovJXVtzhbfNQAHL/wbbrJCOYMGhNXzWxJNKlFdQs54AipuBV
         8cK3z0P30nCRdCrWawQrXVeu9fd8c1dzsrKCESqWXQWBZ2c8S9sJc1GYQT088AZSppGP
         tM9c3RZPpYecVoQf4egjUEs3Wad7FFK1rNqFHaM5rarNR1UBzBZNnDECVuKlhKTWdy/n
         Wxo/JJLqZglnWMDLVqm9qi+92fIiIS2+HMnITawdbUIJ6FNynUzzBpy7S6DlXLoEUOiv
         nYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687450221; x=1690042221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=op05vfUAX1M3Sv7qs3sw3v39U7zORQkGDmdogVHbS1k=;
        b=UykNlI3RjJCqSnFIuhHnDo/1dOiTOo+Ynrqda/alh1HTCv/vgYy9V0pTi7lD6AvPIm
         LtN1IQQb0q9j4A28Kb+WJoh8EnxyYWR5HaPsv+Lp+2nTdDqhPLqxXacLc/dLNSJhudPj
         1LYfldrGvG62ORfbfH/yR+k3Y4ukc7Hy3UsEEvbS1so6fHEunEkEAL1dpgKh3Y95cKjh
         WmGAoHqiKJq8qmEPDyrnQCnWED38Ij5eG1OMNfCZQwsT3xRlR152zN823NAZw6nBGRB3
         fHpi46wAWsEaGsCL6wggSg+qLltx23KzZIuN5F9OHGTYVByuV4aEEv8UhPxbA2MOI5yn
         8x3g==
X-Gm-Message-State: AC+VfDxXvu/Dk2GI9WYRaYLInOfjfw2HS1KjdRPDL8tCB1Ee4J5s5C7h
	4pCL5y3sMN5JZawZhU8XKcqDgQ==
X-Google-Smtp-Source: ACHHUZ4x7GzIKnUKtsG2jddWduLXgCTnpycV5f8sqghKDDH0II0u9Om2EL3+2MK2AM5jv0n4wk3OZg==
X-Received: by 2002:a05:600c:228e:b0:3f4:2158:28a0 with SMTP id 14-20020a05600c228e00b003f4215828a0mr17454713wmf.12.1687450221295;
        Thu, 22 Jun 2023 09:10:21 -0700 (PDT)
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
Subject: [PATCH v2 11/16] accel: Inline NVMM get_qemu_vcpu()
Date: Thu, 22 Jun 2023 18:08:18 +0200
Message-Id: <20230622160823.71851-12-philmd@linaro.org>
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


