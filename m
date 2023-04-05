Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB746D7986
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 12:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518406.804941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0EM-0005Ok-UX; Wed, 05 Apr 2023 10:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518406.804941; Wed, 05 Apr 2023 10:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pk0EM-0005NI-Pw; Wed, 05 Apr 2023 10:19:06 +0000
Received: by outflank-mailman (input) for mailman id 518406;
 Wed, 05 Apr 2023 10:19:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gFET=74=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1pk0EL-00024X-5R
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 10:19:05 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a6f4b4b-d39b-11ed-85db-49a42c6b2330;
 Wed, 05 Apr 2023 12:19:04 +0200 (CEST)
Received: by mail-wm1-x32a.google.com with SMTP id
 l10-20020a05600c1d0a00b003f04bd3691eso6765085wms.5
 for <xen-devel@lists.xenproject.org>; Wed, 05 Apr 2023 03:19:04 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a7bcd17000000b003eb966d39desm1762763wmj.2.2023.04.05.03.19.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 03:19:03 -0700 (PDT)
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
X-Inumbo-ID: 4a6f4b4b-d39b-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680689944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bXZGRuYaUWuS+waIlKd8VQv2t6ejAS6CfkyaECLnt0=;
        b=LIHJIKyuI7acMvt8rBrVg6eWFKgBkrJ3/b0arkph/DUHa0BLbU93H3b1GIwH92R4Zy
         +uvzlTCyUDlYf/j4al5z+wQUHx97GbeXdG9kBiFdMAHyviECH6MqzuY0CNALDN8Ap5Kl
         ApXLzY1U62e1horWK6Vt/U+csJdBfLpJs0pQHuzAzmEZEThhQrNbsPj75PM04Up7HqEo
         3/73NqiS9NmRAA8IVw8pYFlfJUzbpOMYXpCwDL0opeM+q2GUARMOBu22yoM5Hh8oWG8N
         qONWesA/cQ68zjyXExg7MhsK0M/t5sPv8yhjX2pllIkZYpVHgJWQ2hcKuv9wWGPJXdDK
         ogxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bXZGRuYaUWuS+waIlKd8VQv2t6ejAS6CfkyaECLnt0=;
        b=WF0c0ek4QkPZ8AQoRDWY3zdt98WsSNb0Trd+pbXRgem+gdY/6mFFCD4sGD3FQutWQF
         hPfG5hVNX5ayeDIL321OzbKXi5sUhKW3xudxoQEXAm0xCdFDchAthvCsZ1tk2zyVM8Fn
         Yyv+B86xJyeK6GR6beAHwJ8is7HIdGV+slxP0xvDqE2YWJ4PoPTHfcGJqFgywxlFNFkt
         1+rg0boZy8bn4wo1aaK2PuCcPTdCyp+ow/qalK93j0pqHKgp0+wcXzuW/NtG3bzGFW7H
         AM1OrlIQCEaBqwpb8aiynMKKklkUuVoDXqnmny0SlHVrff3TxkqkO59O/L86KLCG0JB8
         /hig==
X-Gm-Message-State: AAQBX9eEnmHpVNebFr7b2XZbQqYQhPscrSQPgaiuihRa9wFuCjr7X65E
	T29VFWxEbVcQddLhUuGUbnu2jwan/K7RUk0AvaY=
X-Google-Smtp-Source: AKy350aOrY2Jw4wGetHTWaGkqVDR1/1hOaALytcr5CxarBrtXg4uhD0qN6hOdWeu8PVqJ7zVJHPs0g==
X-Received: by 2002:a7b:ca48:0:b0:3ee:ed5:6115 with SMTP id m8-20020a7bca48000000b003ee0ed56115mr4226349wml.19.1680689943740;
        Wed, 05 Apr 2023 03:19:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Yanan Wang <wangyanan55@huawei.com>,
	Reinoud Zandijk <reinoud@netbsd.org>,
	Sunil Muthuswamy <sunilmut@microsoft.com>
Subject: [PATCH 07/14] accel: Rename struct hax_vcpu_state -> struct AccelvCPUState
Date: Wed,  5 Apr 2023 12:18:04 +0200
Message-Id: <20230405101811.76663-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405101811.76663-1-philmd@linaro.org>
References: <20230405101811.76663-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We want all accelerators to share the same opaque pointer in
CPUState. Start with the HAX context, renaming its forward
declarated structure 'hax_vcpu_state' as 'AccelvCPUState'.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/core/cpu.h       | 7 +++----
 target/i386/hax/hax-i386.h  | 3 ++-
 target/i386/nvmm/nvmm-all.c | 2 +-
 target/i386/whpx/whpx-all.c | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 193494cde4..173f47d24e 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -235,8 +235,7 @@ typedef struct SavedIOTLB {
 
 struct KVMState;
 struct kvm_run;
-
-struct hax_vcpu_state;
+struct AccelvCPUState;
 struct hvf_vcpu_state;
 
 /* work queue */
@@ -305,6 +304,7 @@ struct qemu_work_item;
  * @next_cpu: Next CPU sharing TB cache.
  * @opaque: User data.
  * @mem_io_pc: Host Program Counter at which the memory was accessed.
+ * @accel: Pointer to accelerator specific state.
  * @kvm_fd: vCPU file descriptor for KVM.
  * @work_mutex: Lock to prevent multiple access to @work_list.
  * @work_list: List of pending asynchronous work.
@@ -423,6 +423,7 @@ struct CPUState {
     uint32_t can_do_io;
     int32_t exception_index;
 
+    struct AccelvCPUState *accel;
     /* shared by kvm, hax and hvf */
     bool vcpu_dirty;
 
@@ -442,8 +443,6 @@ struct CPUState {
     /* Used for user-only emulation of prctl(PR_SET_UNALIGN). */
     bool prctl_unalign_sigbus;
 
-    struct hax_vcpu_state *accel;
-
     struct hvf_vcpu_state *hvf;
 
     /* track IOMMUs whose translations we've cached in the TCG TLB */
diff --git a/target/i386/hax/hax-i386.h b/target/i386/hax/hax-i386.h
index 3cb3b9bbd0..d11d43e857 100644
--- a/target/i386/hax/hax-i386.h
+++ b/target/i386/hax/hax-i386.h
@@ -25,7 +25,8 @@ typedef HANDLE hax_fd;
 #endif
 
 extern struct hax_state hax_global;
-typedef struct hax_vcpu_state {
+
+typedef struct AccelvCPUState {
     hax_fd fd;
     int vcpu_id;
     struct hax_tunnel *tunnel;
diff --git a/target/i386/nvmm/nvmm-all.c b/target/i386/nvmm/nvmm-all.c
index cf4f0af24b..3c7bdd560f 100644
--- a/target/i386/nvmm/nvmm-all.c
+++ b/target/i386/nvmm/nvmm-all.c
@@ -995,7 +995,7 @@ nvmm_init_vcpu(CPUState *cpu)
     }
 
     cpu->vcpu_dirty = true;
-    cpu->accel = (struct hax_vcpu_state *)qcpu;
+    cpu->accel = (struct AccelvCPUState *)qcpu;
 
     return 0;
 }
diff --git a/target/i386/whpx/whpx-all.c b/target/i386/whpx/whpx-all.c
index d1ad6f156a..70eadb7f05 100644
--- a/target/i386/whpx/whpx-all.c
+++ b/target/i386/whpx/whpx-all.c
@@ -2258,7 +2258,7 @@ int whpx_init_vcpu(CPUState *cpu)
 
     vcpu->interruptable = true;
     cpu->vcpu_dirty = true;
-    cpu->accel = (struct hax_vcpu_state *)vcpu;
+    cpu->accel = (struct AccelvCPUState *)vcpu;
     max_vcpu_index = max(max_vcpu_index, cpu->cpu_index);
     qemu_add_vm_change_state_handler(whpx_cpu_update_state, cpu->env_ptr);
 
-- 
2.38.1


