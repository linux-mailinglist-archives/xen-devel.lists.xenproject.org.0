Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B6A3F91CC
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 03:01:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173322.316288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQFK-00067t-Tg; Fri, 27 Aug 2021 01:01:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173322.316288; Fri, 27 Aug 2021 01:01:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJQFK-00062M-Kv; Fri, 27 Aug 2021 01:01:26 +0000
Received: by outflank-mailman (input) for mailman id 173322;
 Fri, 27 Aug 2021 01:01:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l01l=NS=flex--seanjc.bounces.google.com=3mDgoYQYKCbkrdZmibfnnfkd.bnlwdm-cdudkkhrsr.wdmoqnidbs.nqf@srs-us1.protection.inumbo.net>)
 id 1mJQCf-0001Ok-Ie
 for xen-devel@lists.xenproject.org; Fri, 27 Aug 2021 00:58:41 +0000
Received: from mail-qt1-x849.google.com (unknown [2607:f8b0:4864:20::849])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d9ce02b-092c-43e6-8011-918f834f98c3;
 Fri, 27 Aug 2021 00:58:01 +0000 (UTC)
Received: by mail-qt1-x849.google.com with SMTP id
 k4-20020ac85fc4000000b0029e6247e3edso207920qta.19
 for <xen-devel@lists.xenproject.org>; Thu, 26 Aug 2021 17:58:01 -0700 (PDT)
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
X-Inumbo-ID: 4d9ce02b-092c-43e6-8011-918f834f98c3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=2c1oAfv2K1kK887vDwje5mKOKCy671YkzEKzr6O0AXU=;
        b=dPpwJxjFAEvKqBeQTsJ+sGnKoHCUDoZpaVXefCBRLWJYEAXtYCk1jNkAx1AH1WF/eG
         KIy8x+/4sLPr4zdnDE2egBaEDODhNuwDeZz/fiGkGQbMwDhPfxlGMgiZv4nxwzKTONNP
         w48weamcMEaBWOvZvU5f0I92nygzL+xaBLQUBWTiwbOYY93Mwf2WxDnJ3W/MWHuZSFBN
         ySHOeq9MvFBM04dVoDNrkz77+gPtaH+dN9os6JcQtf1EK0v/gyWblqEXuz9BFALfpRnH
         6isQHkETZn28aDBmE0AV+m14demqlHfQTlvzBRY5XUHPrqkELuVFpgUnkCWViVAkwntu
         hboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=2c1oAfv2K1kK887vDwje5mKOKCy671YkzEKzr6O0AXU=;
        b=dNtY+I4d1RHHK8Xwi1lVVtkJGkudqzX5mVhzSXek5J1fgYnsuWYlN5OlUgDIjfpVu1
         m8bNP8yT/vh0N5mtBkUM263c6EbIohh2Yn4iJF8lLTbxof0XZUfFbUyOgAvl9Nvmjxsn
         xhVZOpXe5krP4r0v2KFPsAHAbbxGNUUTh5PZXk9uCU4FRbhbl6prLViOwO6LmqgR/xed
         1ga3of5gaWIItmbWcA43t2WyNvGMC+IApAQriwD0xDqqRD85pt0uG1406+SKmNL6PTqh
         NuvZhnLdCsMb2Kae6Ec/7wXti/9yTnW1FVrTyz/rmWkJsf1e8lf642bUsGAbTEwqEEKK
         8hug==
X-Gm-Message-State: AOAM532trkzbN/nhptl+3EjiMhwhN4sMZm3Hm7r0+GzSQL7kjl41fLYt
	imJQ/sMY8V5tWkw3P5nYpcczm/33SmI=
X-Google-Smtp-Source: ABdhPJyRfoK4Sj+uUxToLmh3g94becc3It6jH8S/y/rUNMio/2OXitmqg6SKQMU8b0uN77qihKZhErMmOqs=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:c16c:db05:96b2:1475])
 (user=seanjc job=sendgmr) by 2002:a0c:aa55:: with SMTP id e21mr7179445qvb.41.1630025880952;
 Thu, 26 Aug 2021 17:58:00 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 26 Aug 2021 17:57:17 -0700
In-Reply-To: <20210827005718.585190-1-seanjc@google.com>
Message-Id: <20210827005718.585190-15-seanjc@google.com>
Mime-Version: 1.0
References: <20210827005718.585190-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.259.gc128427fd7-goog
Subject: [PATCH 14/15] perf: Disallow bulk unregistering of guest callbacks
 and do cleanup
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

Drop the helper that allows bulk unregistering of the per-CPU callbacks
now that KVM, the only entity that actually unregisters callbacks, uses
the per-CPU helpers.  Bulk unregistering is inherently unsafe as there
are no protections against nullifying a pointer for a CPU that is using
said pointer in a PMI handler.

Opportunistically tweak names to better reflect reality.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/xen/pmu.c         |  2 +-
 include/linux/kvm_host.h   |  2 +-
 include/linux/perf_event.h |  9 +++------
 kernel/events/core.c       | 31 +++++++++++--------------------
 virt/kvm/kvm_main.c        |  2 +-
 5 files changed, 17 insertions(+), 29 deletions(-)

diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index e13b0b49fcdf..57834de043c3 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -548,7 +548,7 @@ void xen_pmu_init(int cpu)
 	per_cpu(xenpmu_shared, cpu).flags = 0;
 
 	if (cpu == 0) {
-		perf_register_guest_info_callbacks(&xen_guest_cbs);
+		perf_register_guest_info_callbacks_all_cpus(&xen_guest_cbs);
 		xen_pmu_arch_init();
 	}
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 0db9af0b628c..d68a49d5fc53 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1171,7 +1171,7 @@ unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu);
 void kvm_register_perf_callbacks(void);
 static inline void kvm_unregister_perf_callbacks(void)
 {
-	__perf_unregister_guest_info_callbacks();
+	perf_unregister_guest_info_callbacks();
 }
 #endif
 
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 7a367bf1b78d..db701409a62f 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1238,10 +1238,9 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 DECLARE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
-extern void __perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
-extern void __perf_unregister_guest_info_callbacks(void);
-extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *callbacks);
+extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 extern void perf_unregister_guest_info_callbacks(void);
+extern void perf_register_guest_info_callbacks_all_cpus(struct perf_guest_info_callbacks *cbs);
 #endif /* CONFIG_HAVE_GUEST_PERF_EVENTS */
 
 extern void perf_event_exec(void);
@@ -1486,9 +1485,7 @@ static inline void
 perf_bp_event(struct perf_event *event, void *data)			{ }
 
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
-static inline void perf_register_guest_info_callbacks
-(struct perf_guest_info_callbacks *callbacks)				{ }
-static inline void perf_unregister_guest_info_callbacks(void)		{ }
+extern void perf_register_guest_info_callbacks_all_cpus(struct perf_guest_info_callbacks *cbs);
 #endif
 
 static inline void perf_event_mmap(struct vm_area_struct *vma)		{ }
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 2f28d9d8dc94..f1964096c4c2 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6485,35 +6485,26 @@ static void perf_pending_event(struct irq_work *entry)
 #ifdef CONFIG_HAVE_GUEST_PERF_EVENTS
 DEFINE_PER_CPU(struct perf_guest_info_callbacks *, perf_guest_cbs);
 
-void __perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
-{
-	__this_cpu_write(perf_guest_cbs, cbs);
-}
-EXPORT_SYMBOL_GPL(__perf_register_guest_info_callbacks);
-
-void __perf_unregister_guest_info_callbacks(void)
-{
-	__this_cpu_write(perf_guest_cbs, NULL);
-}
-EXPORT_SYMBOL_GPL(__perf_unregister_guest_info_callbacks);
-
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
-	int cpu;
-
-	for_each_possible_cpu(cpu)
-		per_cpu(perf_guest_cbs, cpu) = cbs;
+	__this_cpu_write(perf_guest_cbs, cbs);
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 
 void perf_unregister_guest_info_callbacks(void)
 {
-	int cpu;
-
-	for_each_possible_cpu(cpu)
-		per_cpu(perf_guest_cbs, cpu) = NULL;
+	__this_cpu_write(perf_guest_cbs, NULL);
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
+
+void perf_register_guest_info_callbacks_all_cpus(struct perf_guest_info_callbacks *cbs)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		per_cpu(perf_guest_cbs, cpu) = cbs;
+}
+EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks_all_cpus);
 #endif
 
 static void
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index e0b1c9386926..1bcc3eab510b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5502,7 +5502,7 @@ EXPORT_SYMBOL_GPL(kvm_set_intel_pt_intr_handler);
 
 void kvm_register_perf_callbacks(void)
 {
-	__perf_register_guest_info_callbacks(&kvm_guest_cbs);
+	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 }
 EXPORT_SYMBOL_GPL(kvm_register_perf_callbacks);
 #endif
-- 
2.33.0.259.gc128427fd7-goog


