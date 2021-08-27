Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 921D53F91CE
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 03:01:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173326.316303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQFM-0006Te-3X; Fri, 27 Aug 2021 01:01:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173326.316303; Fri, 27 Aug 2021 01:01:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQFL-0006IU-OT; Fri, 27 Aug 2021 01:01:27 +0000
Received: by outflank-mailman (input) for mailman id 173326;
 Fri, 27 Aug 2021 01:01:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XOs5=NS=flex--seanjc.bounces.google.com=3lDgoYQYKCbUnZVieXbjjbgZ.XjhsZi-YZqZggdnon.sZikmjeZXo.jmb@srs-us1.protection.inumbo.net>)
 id 1mJQCV-0001Ok-IH
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:58:31 +0000
Received: from mail-yb1-xb49.google.com (unknown [2607:f8b0:4864:20::b49])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 088e1afc-753d-4854-89db-59c307bda96a;
 Fri, 27 Aug 2021 00:57:56 +0000 (UTC)
Received: by mail-yb1-xb49.google.com with SMTP id
 q13-20020a25820d000000b0059a84a55d89so4875182ybk.23
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 17:57:56 -0700 (PDT)
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
X-Inumbo-ID: 088e1afc-753d-4854-89db-59c307bda96a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=O3P/C2+r50j2qd2oZl4HIFqUJ1Gm6eQIurE1pthLu88=;
        b=KoGI0t2ANmOACIY8bQhuBH4FJbrSHsRwhYJXWmn01ufiEJZVk4tPOEhaZ6T1MAQL+U
         jhUGDn7yZArl2k29+8gFqfCF2DSg2n6fTQ6je+tOvHWwtuk6IOGhYE1XQmYmAQV0Z6yb
         UcRXDhGukzYa0e3OogJgHIniy20AUzkgcDYnuJ9TMbdSfPm19k9DAbSEVKXLmzcP7bku
         dkqNoqFL3rJ6iAJ27Dy3HXfxWITTJ68h7TnziapcFth9ZxiSCsQJGqvRdjvidglqsZgx
         4yCjuWco92qzMYV8AJs3vnXk8sqdZ/Z/v4yFDjKSCTqWPBnhz4PL5zWola/ctdZ9nHLd
         axcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=O3P/C2+r50j2qd2oZl4HIFqUJ1Gm6eQIurE1pthLu88=;
        b=jAa7CjAotafGOYa7DgUbmtYwgPWapVsV8Cj0qJUiPbZ0ucSw8u6XnOOKHkQpRR3+1L
         uhNhqNeUQj3Mvri1h9pbW7ite9kRuJdWA+qF3WgGpsGmMq1LFOS9vfPOw05YIqW6JVKp
         iSCs/82XFXdGzcD37fZsloL5tByayL1TT4zNf0XzygT5G3mWID0ZurSGK0mRBPz8+uKa
         VLuR/n2QxaE/TkadpaqRaXx7Xuor3x0gUkkGcIeC5F9Xoe/gtCHEaimOzr67tcJttyMq
         xjEbsB1e9zb1Ctwok8TJQngE5YK/25sXXNEm8WePefzblf1N+pIAE1UoqDV2+ky5A7vJ
         o1wQ==
X-Gm-Message-State: AOAM533LO19GVR+N4L1wp4HMSp+IHPXl/Gr4PuiI7tDSOotyMobG3dGL
	cKTFEZA+XxTHXZsELAvpFQ1bB4s8xTs=
X-Google-Smtp-Source: ABdhPJyKjk6geoVg3b6/+yDfPSeW/L1PMiXY41SolyC47I84TPxrPvrL+bKgY05p4LEuynGQ+EFAFv5UkSk=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a25:dcd3:: with SMTP id y202mr2039489ybe.161.1630025876285;
 Thu, 26 Aug 2021 17:57:56 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Aug 2021 17:57:15 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-13-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 12/15] KVM: arm64: Convert to the generic perf callbacks
From: Sean Christopherson <seanjc@google.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>, 
	Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Borislav Petkov <bp@alien8.de>, x86@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
	Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Artem Kashkanov <artem.kashkanov@intel.com>, 
	Like Xu <like.xu.linux@gmail.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Drop arm64's version of the callbacks in favor of the callbacks provided
by generic KVM, which are semantically identical.  Implement the "get ip"
hook as needed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h |  6 +----
 arch/arm64/kvm/arm.c              |  5 ++++
 arch/arm64/kvm/perf.c             | 38 -------------------------------
 3 files changed, 6 insertions(+), 43 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 007c38d77fd9..12e8d789e1ac 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -673,11 +673,7 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa);
 void kvm_perf_init(void);
 
 #ifdef CONFIG_PERF_EVENTS
-void kvm_register_perf_callbacks(void);
-static inline void kvm_unregister_perf_callbacks(void)
-{
-	__perf_unregister_guest_info_callbacks();
-}
+#define __KVM_WANT_PERF_CALLBACKS
 #else
 static inline void kvm_register_perf_callbacks(void) {}
 static inline void kvm_unregister_perf_callbacks(void) {}
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index ec386971030d..dfc8078dd4f9 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -503,6 +503,11 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 	return vcpu_mode_priv(vcpu);
 }
 
+unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
+{
+	return *vcpu_pc(vcpu);
+}
+
 /* Just ensure a guest exit from a particular CPU */
 static void exit_vm_noop(void *info)
 {
diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
index 2556b0a3b096..ad9fdc2f2f70 100644
--- a/arch/arm64/kvm/perf.c
+++ b/arch/arm64/kvm/perf.c
@@ -13,44 +13,6 @@
 
 DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
 
-#ifdef CONFIG_PERF_EVENTS
-static int kvm_is_in_guest(void)
-{
-	return true;
-}
-
-static int kvm_is_user_mode(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	if (WARN_ON_ONCE(!vcpu))
-		return 0;
-
-	return !vcpu_mode_priv(vcpu);
-}
-
-static unsigned long kvm_get_guest_ip(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	if (WARN_ON_ONCE(!vcpu))
-		return 0;
-
-	return *vcpu_pc(vcpu);
-}
-
-static struct perf_guest_info_callbacks kvm_guest_cbs = {
-	.is_in_guest	= kvm_is_in_guest,
-	.is_user_mode	= kvm_is_user_mode,
-	.get_guest_ip	= kvm_get_guest_ip,
-};
-
-void kvm_register_perf_callbacks(void)
-{
-	__perf_register_guest_info_callbacks(&kvm_guest_cbs);
-}
-#endif /* CONFIG_PERF_EVENTS*/
-
 void kvm_perf_init(void)
 {
 	if (kvm_pmu_probe_pmuver() != 0xf && !is_protected_kvm_enabled())
-- 
2.33.0.259.gc128427fd7-goog


