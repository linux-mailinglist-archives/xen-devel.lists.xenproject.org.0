Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA17C413E59
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 02:06:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.191999.342253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpmS-00045u-A6; Wed, 22 Sep 2021 00:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 191999.342253; Wed, 22 Sep 2021 00:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSpmS-00042H-6D; Wed, 22 Sep 2021 00:06:32 +0000
Received: by outflank-mailman (input) for mailman id 191999;
 Wed, 22 Sep 2021 00:06:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JH5Q=OM=flex--seanjc.bounces.google.com=3ZnNKYQYKCYc3plyunrzzrwp.nzx8py-op6pwwt343.8py02zupn4.z2r@srs-us1.protection.inumbo.net>)
 id 1mSpmP-0000pt-QR
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 00:06:29 +0000
Received: from mail-qk1-x74a.google.com (unknown [2607:f8b0:4864:20::74a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 63694b28-5d99-4911-bead-3bf7c454f1d3;
 Wed, 22 Sep 2021 00:05:59 +0000 (UTC)
Received: by mail-qk1-x74a.google.com with SMTP id
 ay30-20020a05620a179e00b00433294fbf97so6204076qkb.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Sep 2021 17:05:59 -0700 (PDT)
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
X-Inumbo-ID: 63694b28-5d99-4911-bead-3bf7c454f1d3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=sNDCyCpfsN1q6fRIAZGHe8t08fZK9DQU77lycxeDgvE=;
        b=VfPFQTi2H68Pv6JmEb/KQ6WY/Mh3+l2kbL2XaDfVNNRWtfkT0wPW7iSQgW51WR5Ixu
         QaVgL8eDvDPLryj3vrQdNZbcnETMB9dGrhIzgmphuyjNlSU7aoy32NJ7ZHdZp0tssaUn
         WmTaDF7tt5GMvqHs/f51AneClTfDU4/Qx1Y7bh13Y1mJ7NTIjpZczmD07Ifh3YHzj8to
         lJYiaCZYA+JZO1GYoyMeT2BFWYalqIN+pUd4yUi7DujNd/X/ujswoWs0DebayZIqAv/y
         Meqb7X4l8tyF48vYwj84msbYaRs7+6wgTa49v9X0jrHAK7tmUtVCOQiRYMjdbLlI0bf9
         COSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=sNDCyCpfsN1q6fRIAZGHe8t08fZK9DQU77lycxeDgvE=;
        b=TxVY+vK+qfnUBplcTcyuv7sRCGjQ2f9BsLIcsXnhGM7SQ1hMqkbmEYxpjP7Ltb48Y9
         XyfTo63RqsgAAuV9CuD9I1A3tb5meS1VGwkBOBS6iiOy82UWlAlQMdv6AFtyyKR2K+aV
         LbClEY0zGwdjNUJGuTkk1RrPu7aWL8s5grnurXqERlY6cp6Q6aT8LBMjv/ih85skUebx
         zAtEZuj7fZSn9UWbcLBuNK6/Zl6gpn8OoyLj7K2Eq9d9EEGyeXM91ocWmU6aST+4rKB8
         mAuQTrv0s3RooIspSw0UT9uRsDKFiho9oLmajuOIJQF3FCuVE0FMX9uNKSTgYHY9Dd6E
         IhEg==
X-Gm-Message-State: AOAM532y1IpTvWGK1KHcjQ/48iNf7Cb1PsZ2lghbQhFXg0GAs18g4GDa
	ZhWbWGs3Nzsi18WcuyLoe3cKudBtL08=
X-Google-Smtp-Source: ABdhPJzkQ+TPTNghaiyjopK2Q9UXHXirkFCk7bz7Y2wHOEucRILtEQweuapuUXRwLMTZlbJ4rzpjCo5gfvs=
X-Received: from seanjc798194.pdx.corp.google.com ([2620:15c:90:200:b022:92d6:d37b:686c])
 (user=seanjc job=sendgmr) by 2002:a25:1884:: with SMTP id 126mr25006798yby.114.1632269158936;
 Tue, 21 Sep 2021 17:05:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 21 Sep 2021 17:05:24 -0700
In-Reply-To: <20210922000533.713300-1-seanjc@google.com>
Message-Id: <20210922000533.713300-8-seanjc@google.com>
Mime-Version: 1.0
References: <20210922000533.713300-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v3 07/16] perf: Add wrappers for invoking guest callbacks
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Guo Ren <guoren@kernel.org>, Nick Hu <nickhu@andestech.com>, 
	Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@redhat.com>, 
	Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Wanpeng Li <wanpengli@tencent.com>, Jim Mattson <jmattson@google.com>, 
	Joerg Roedel <joro@8bytes.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvmarm@lists.cs.columbia.edu, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Artem Kashkanov <artem.kashkanov@intel.com>, Like Xu <like.xu.linux@gmail.com>, 
	Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Add helpers for the guest callbacks to prepare for burying the callbacks
behind a Kconfig (it's a lot easier to provide a few stubs than to #ifdef
piles of code), and also to prepare for converting the callbacks to
static_call().  perf_instruction_pointer() in particular will have subtle
semantics with static_call(), as the "no callbacks" case will return 0 if
the callbacks are unregistered between querying guest state and getting
the IP.  Implement the change now to avoid a functional change when adding
static_call() support, and because the new helper needs to return
_something_ in this case.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kernel/perf_callchain.c | 16 +++++-----------
 arch/x86/events/core.c             | 15 +++++----------
 arch/x86/events/intel/core.c       |  5 +----
 include/linux/perf_event.h         | 24 ++++++++++++++++++++++++
 4 files changed, 35 insertions(+), 25 deletions(-)

diff --git a/arch/arm64/kernel/perf_callchain.c b/arch/arm64/kernel/perf_callchain.c
index 274dc3e11b6d..db04a55cee7e 100644
--- a/arch/arm64/kernel/perf_callchain.c
+++ b/arch/arm64/kernel/perf_callchain.c
@@ -102,9 +102,7 @@ compat_user_backtrace(struct compat_frame_tail __user *tail,
 void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 			 struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	if (guest_cbs && guest_cbs->state()) {
+	if (perf_guest_state()) {
 		/* We don't support guest os callchain now */
 		return;
 	}
@@ -149,10 +147,9 @@ static bool callchain_trace(void *data, unsigned long pc)
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct stackframe frame;
 
-	if (guest_cbs && guest_cbs->state()) {
+	if (perf_guest_state()) {
 		/* We don't support guest os callchain now */
 		return;
 	}
@@ -163,18 +160,15 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	if (guest_cbs && guest_cbs->state())
-		return guest_cbs->get_ip();
+	if (perf_guest_state())
+		return perf_guest_get_ip();
 
 	return instruction_pointer(regs);
 }
 
 unsigned long perf_misc_flags(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-	unsigned int guest_state = guest_cbs ? guest_cbs->state() : 0;
+	unsigned int guest_state = perf_guest_state();
 	int misc = 0;
 
 	if (guest_state) {
diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index 3a7630fdd340..d20e4f8d1aef 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2761,11 +2761,10 @@ static bool perf_hw_regs(struct pt_regs *regs)
 void
 perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct unwind_state state;
 	unsigned long addr;
 
-	if (guest_cbs && guest_cbs->state()) {
+	if (perf_guest_state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
 	}
@@ -2865,11 +2864,10 @@ perf_callchain_user32(struct pt_regs *regs, struct perf_callchain_entry_ctx *ent
 void
 perf_callchain_user(struct perf_callchain_entry_ctx *entry, struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
 	struct stack_frame frame;
 	const struct stack_frame __user *fp;
 
-	if (guest_cbs && guest_cbs->state()) {
+	if (perf_guest_state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
 	}
@@ -2946,18 +2944,15 @@ static unsigned long code_segment_base(struct pt_regs *regs)
 
 unsigned long perf_instruction_pointer(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	if (guest_cbs && guest_cbs->state())
-		return guest_cbs->get_ip();
+	if (perf_guest_state())
+		return perf_guest_get_ip();
 
 	return regs->ip + code_segment_base(regs);
 }
 
 unsigned long perf_misc_flags(struct pt_regs *regs)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-	unsigned int guest_state = guest_cbs ? guest_cbs->state() : 0;
+	unsigned int guest_state = perf_guest_state();
 	int misc = 0;
 
 	if (guest_state) {
diff --git a/arch/x86/events/intel/core.c b/arch/x86/events/intel/core.c
index 524ad1f747bd..f5b02017ba16 100644
--- a/arch/x86/events/intel/core.c
+++ b/arch/x86/events/intel/core.c
@@ -2786,7 +2786,6 @@ static int handle_pmi_common(struct pt_regs *regs, u64 status)
 {
 	struct perf_sample_data data;
 	struct cpu_hw_events *cpuc = this_cpu_ptr(&cpu_hw_events);
-	struct perf_guest_info_callbacks *guest_cbs;
 	int bit;
 	int handled = 0;
 	u64 intel_ctrl = hybrid(cpuc->pmu, intel_ctrl);
@@ -2853,9 +2852,7 @@ static int handle_pmi_common(struct pt_regs *regs, u64 status)
 	 */
 	if (__test_and_clear_bit(GLOBAL_STATUS_TRACE_TOPAPMI_BIT, (unsigned long *)&status)) {
 		handled++;
-
-		guest_cbs = perf_get_guest_cbs();
-		if (likely(!guest_cbs || !guest_cbs->handle_intel_pt_intr()))
+		if (!perf_guest_handle_intel_pt_intr())
 			intel_pt_interrupt();
 	}
 
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index f9be88a47434..c0a6eaf55fb1 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1247,6 +1247,30 @@ static inline struct perf_guest_info_callbacks *perf_get_guest_cbs(void)
 	/* Prevent reloading between a !NULL check and dereferences. */
 	return READ_ONCE(perf_guest_cbs);
 }
+static inline unsigned int perf_guest_state(void)
+{
+	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
+
+	return guest_cbs ? guest_cbs->state() : 0;
+}
+static inline unsigned long perf_guest_get_ip(void)
+{
+	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
+
+	/*
+	 * Arbitrarily return '0' in the unlikely scenario that the callbacks
+	 * are unregistered between checking guest state and getting the IP.
+	 */
+	return guest_cbs ? guest_cbs->get_ip() : 0;
+}
+static inline unsigned int perf_guest_handle_intel_pt_intr(void)
+{
+	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
+
+	if (guest_cbs && guest_cbs->handle_intel_pt_intr)
+		return guest_cbs->handle_intel_pt_intr();
+	return 0;
+}
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 
-- 
2.33.0.464.g1972c5931b-goog


