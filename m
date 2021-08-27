Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFD73F9184
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 02:59:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173264.316213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCl-0003Jd-Hi; Fri, 27 Aug 2021 00:58:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173264.316213; Fri, 27 Aug 2021 00:58:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQCl-000323-1T; Fri, 27 Aug 2021 00:58:47 +0000
Received: by outflank-mailman (input) for mailman id 173264;
 Fri, 27 Aug 2021 00:58:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hx6M=NS=flex--seanjc.bounces.google.com=3izgoYQYKCaweQMZVOSaaSXQ.OaYjQZ-PQhQXXUefe.jQZbdaVQOf.adS@srs-us1.protection.inumbo.net>)
 id 1mJQCB-0001Ok-HP
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:58:11 +0000
Received: from mail-yb1-xb4a.google.com (unknown [2607:f8b0:4864:20::b4a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30c2a8e9-38ca-437e-89eb-aac336800573;
 Fri, 27 Aug 2021 00:57:47 +0000 (UTC)
Received: by mail-yb1-xb4a.google.com with SMTP id
 b198-20020a2534cf000000b0059bae206c16so4867016yba.18
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 17:57:47 -0700 (PDT)
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
X-Inumbo-ID: 30c2a8e9-38ca-437e-89eb-aac336800573
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=AFHcFLQ8Zudn3D234yQQ371MlX0hPffSTnop5clNbU4=;
        b=ehODs2sAzX4fmqGdkUXhOCuacyAsZ5WG5XMN79bjP+xq4RU4v9fT+sBLKRTlQqGWyX
         q30luLe7UbUT+k5DL/N9U4aU2TEa+qPeGqAJxEBE/FVgE0CuiF3raXC1RXOK3ImBGaQ4
         XbKMz4w/DkAC9W9hss3rUtWCAWdzbERpB661AM+dQQmPgaw7Ftx+tH6bG8AYsTaZ9CDU
         e02FAinIj3+x9EA64fOdiwehQIAyNOzTqpYk8MnCh+cFqm78JcgPcKiioGpdAXvwto5l
         kIPH0qjJWMM4k2bYrS2zDHxLCqBbRaCfrumPTD8MLrYqYErmy2b3iS7uHQauGeKAtamE
         EuYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=AFHcFLQ8Zudn3D234yQQ371MlX0hPffSTnop5clNbU4=;
        b=cp9oALrxQ5kNgw3ObTQYWw43TrufM28Mn8dSQ0buydOq3I1XVpp88Fp6IArsYt3HwV
         /SOm3mSeAnSCdNLdhlD6sTIWVa3Yw+Y5RdfBSE2XDq58sumpyOQIgF1c6hHC7E3m44bU
         xJI2+xFWCvTH0PmDEJbH29AacQuR6N1IL6xpXBJ4D4dP/QqMlBrTySx61Mxdg7NxMH1j
         87mdSEbjG3Io2B+J2bPRucXW6/dQLeKuON0qhMU2uJkd2P1uysNPOxEVbdFU/iJjzma2
         EAAxAf6ISW6a7CEptEmrn5H9og9DNNBn3GUINgPgF8WlVGRS22K+9GWnghFcw8Wki9xv
         vqQw==
X-Gm-Message-State: AOAM5315qO9iEOA1h04z5urRd5GOI0cbkcRHoHVyusHsyM8WkxIGsXCd
	DYEj67ZaUapwT37Hpo7KgQwjWN8HkWA=
X-Google-Smtp-Source: ABdhPJxdtTMoWPCFq9FJTrWuwV5L/MyoyJcLiUL8JKOdEyDnebSuapnzs9qVktMCvhy616hB+yWZoBPXnlo=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a25:7a03:: with SMTP id v3mr2037918ybc.202.1630025867497;
 Thu, 26 Aug 2021 17:57:47 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Aug 2021 17:57:11 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-9-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 08/15] KVM: x86: Drop current_vcpu in favor of kvm_running_vcpu
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

Now that KVM registers perf callbacks only when the CPU is "in guest",
use kvm_running_vcpu instead of current_vcpu to retrieve the associated
vCPU and drop current_vcpu.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 12 +++++-------
 arch/x86/kvm/x86.h |  4 ----
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index d4d91944fde7..e337aef60793 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8264,17 +8264,15 @@ static void kvm_timer_init(void)
 			  kvmclock_cpu_online, kvmclock_cpu_down_prep);
 }
 
-DEFINE_PER_CPU(struct kvm_vcpu *, current_vcpu);
-EXPORT_PER_CPU_SYMBOL_GPL(current_vcpu);
-
 static int kvm_is_in_guest(void)
 {
-	return __this_cpu_read(current_vcpu) != NULL;
+	/* x86's callbacks are registered only when handling a guest NMI. */
+	return true;
 }
 
 static int kvm_is_user_mode(void)
 {
-	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
 	if (WARN_ON_ONCE(!vcpu))
 		return 0;
@@ -8284,7 +8282,7 @@ static int kvm_is_user_mode(void)
 
 static unsigned long kvm_get_guest_ip(void)
 {
-	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
 	if (WARN_ON_ONCE(!vcpu))
 		return 0;
@@ -8294,7 +8292,7 @@ static unsigned long kvm_get_guest_ip(void)
 
 static void kvm_handle_intel_pt_intr(void)
 {
-	struct kvm_vcpu *vcpu = __this_cpu_read(current_vcpu);
+	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
 
 	if (WARN_ON_ONCE(!vcpu))
 		return;
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 4c5ba4128b38..f13f15d2fab8 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -393,11 +393,8 @@ static inline void kvm_unregister_perf_callbacks(void)
 	__perf_unregister_guest_info_callbacks();
 }
 
-DECLARE_PER_CPU(struct kvm_vcpu *, current_vcpu);
-
 static inline void kvm_before_interrupt(struct kvm_vcpu *vcpu, bool is_nmi)
 {
-	__this_cpu_write(current_vcpu, vcpu);
 	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, is_nmi);
 
 	kvm_register_perf_callbacks();
@@ -408,7 +405,6 @@ static inline void kvm_after_interrupt(struct kvm_vcpu *vcpu)
 	kvm_unregister_perf_callbacks();
 
 	WRITE_ONCE(vcpu->arch.handling_nmi_from_guest, false);
-	__this_cpu_write(current_vcpu, NULL);
 }
 
 
-- 
2.33.0.259.gc128427fd7-goog


