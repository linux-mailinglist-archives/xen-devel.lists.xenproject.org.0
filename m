Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5961F6D79AF
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:29:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518425.804992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0O0-0000iH-46; Wed, 05 Apr 2023 10:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518425.804992; Wed, 05 Apr 2023 10:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0Nz-0000XE-TT; Wed, 05 Apr 2023 10:29:03 +0000
Received: by outflank-mailman (input) for mailman id 518425;
 Wed, 05 Apr 2023 10:29:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gFET=74=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pk0Ep-00024X-Ua
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:19:36 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5cfe3fec-d39b-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 12:19:35 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 n19-20020a05600c501300b003f064936c3eso858463wmr.0
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 03:19:35 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a1c7315000000b003ed1f6878a5sm1770353wmb.5.2023.04.05.03.19.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:34 -0700 (PDT)
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
X-Inumbo-ID: 5cfe3fec-d39b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680689975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reJpuebcoI5BKEfS88SjCkcplXXPmguVbMU9Olmibx0=;
        b=Q2+dqv8HKpPQKTf9cQJSeqsGPGkeqsXxu8v+C2JYWo/wkdpZHobUDc9N35z1UbQyXo
         9C6lndVpWvjoGdquQUathNsJoiIiN7nJn3kgNVvT5T7tc01blota5eXmXHc1hE2a/9ew
         2Wf7CCzhPcSAgNhjaTij8S5PpdLVkajwG2fdrCTckKDaeIUqcPO5ZI4SEhoPCSlpK/xc
         jQRVVytzUEGa2Ydc7bSMmlI+Bj89/EomAs72KzqL8mlaSY0qlyPq25y3stucFF3G2pSS
         /sRRUshA2hioO50En8HSMUOtDGPuoJV66S46OhB8lo7qSEotmJH2F75Zpnda8gdb6yr0
         tHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reJpuebcoI5BKEfS88SjCkcplXXPmguVbMU9Olmibx0=;
        b=5ElheQRINiX2Ygsg/9tU8tpk0LQunD3JUPGDFeZwRYP1TtH8mbnZJmvwLhbfgeHWHk
         +BQ6UkGmVrNTjCsFcIrf60S3VVPZQPZj2wUs7jR37tjZtSTVxbUInqLz75TuCKxtipsx
         uaeEV2avu4/T4+WKR97w3vwbHeThGL2NwhfCdpnHoIb9w4CGbsvBeC/NNSNfwbojrVI4
         ui6UNsBBHjZWaC+0/HlLawEiG7POxUmobF1nDTXrTWd7DiBuflUl6eINn0Z7ziZfE8jP
         GMgrXbrW2tT7rLhcQAc/bD78jYzDQvGJ/1dhvXA6ga/Yk70b5Beq2Fq5IaBNRG/pb+ZE
         FDHw==
X-Gm-Message-State: AAQBX9ces/GWJ5T9bHIDWyxyrMmG9qEtbpkFLhjcJ9/N6dwDkHW6NXBJ
	ugRwI8rpMBt0S/5COyowdsxMLA==
X-Google-Smtp-Source: AKy350ZAz7PsFWbSoWRxQBkCoHp/n/DjoRXVF/1COGNHcX9m4lAa529X6M54U1ZwDgyYhrM/EeN7Fw==
X-Received: by 2002:a1c:7717:0:b0:3f0:48f4:8454 with SMTP id t23-20020a1c7717000000b003f048f48454mr4350332wmi.27.1680689974915;
        Wed, 05 Apr 2023 03:19:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: [PATCH 11/14] accel: Inline NVMM get_qemu_vcpu()
Date: Wed,  5 Apr 2023 12:18:08 +0200
Message-Id: <20230405101811.76663-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No need for this helper to access the CPUState::accel field.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/nvmm/nvmm-all.c | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index 97a7225598..1c0168d83c 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -49,12 +49,6 @@ struct qemu_machine {
 static bool nvmm_allowed;
 static struct qemu_machine qemu_mach;
 
-static struct AccelvCPUState *
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
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_x64_state *state = vcpu->state;
     uint64_t bitmap;
@@ -223,7 +217,7 @@ nvmm_get_registers(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -347,7 +341,7 @@ static bool
 nvmm_can_take_int(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     struct nvmm_machine *mach = get_nvmm_mach();
 
@@ -372,7 +366,7 @@ nvmm_can_take_int(CPUState *cpu)
 static bool
 nvmm_can_take_nmi(CPUState *cpu)
 {
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
 
     /*
      * Contrary to INTs, NMIs always schedule an exit when they are
@@ -395,7 +389,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -478,7 +472,7 @@ nvmm_vcpu_pre_run(CPUState *cpu)
 static void
 nvmm_vcpu_post_run(CPUState *cpu, struct nvmm_vcpu_exit *exit)
 {
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     CPUX86State *env = cpu->env_ptr;
     X86CPU *x86_cpu = X86_CPU(cpu);
     uint64_t tpr;
@@ -565,7 +559,7 @@ static int
 nvmm_handle_rdmsr(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -610,7 +604,7 @@ static int
 nvmm_handle_wrmsr(struct nvmm_machine *mach, CPUState *cpu,
     struct nvmm_vcpu_exit *exit)
 {
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_x64_state *state = vcpu->state;
@@ -686,7 +680,7 @@ nvmm_vcpu_loop(CPUState *cpu)
 {
     CPUX86State *env = cpu->env_ptr;
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
     struct nvmm_vcpu *vcpu = &qcpu->vcpu;
     X86CPU *x86_cpu = X86_CPU(cpu);
     struct nvmm_vcpu_exit *exit = vcpu->exit;
@@ -892,7 +886,7 @@ static void
 nvmm_ipi_signal(int sigcpu)
 {
     if (current_cpu) {
-        struct AccelvCPUState *qcpu = get_qemu_vcpu(current_cpu);
+        struct AccelvCPUState *qcpu = current_cpu->accel;
 #if NVMM_USER_VERSION >= 2
         struct nvmm_vcpu *vcpu = &qcpu->vcpu;
         nvmm_vcpu_stop(vcpu);
@@ -1027,7 +1021,7 @@ void
 nvmm_destroy_vcpu(CPUState *cpu)
 {
     struct nvmm_machine *mach = get_nvmm_mach();
-    struct AccelvCPUState *qcpu = get_qemu_vcpu(cpu);
+    struct AccelvCPUState *qcpu = cpu->accel;
 
     nvmm_vcpu_destroy(mach, &qcpu->vcpu);
     g_free(cpu->accel);
-- 
2.38.1


