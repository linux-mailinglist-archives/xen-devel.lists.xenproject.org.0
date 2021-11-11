Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9431E44CFA4
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 03:08:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224515.387915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkzVR-0006zb-UG; Thu, 11 Nov 2021 02:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224515.387915; Thu, 11 Nov 2021 02:08:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkzVR-0006uc-PH; Thu, 11 Nov 2021 02:08:01 +0000
Received: by outflank-mailman (input) for mailman id 224515;
 Thu, 11 Nov 2021 02:07:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4H9A=P6=flex--seanjc.bounces.google.com=3-3qMYQYKCTYkWSfbUYggYdW.UgepWf-VWnWddaklk.pWfhjgbWUl.gjY@srs-se1.protection.inumbo.net>)
 id 1mkzVP-0004E5-Aq
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 02:07:59 +0000
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [2607:f8b0:4864:20::549])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2f906369-4294-11ec-9787-a32c541c8605;
 Thu, 11 Nov 2021 03:07:58 +0100 (CET)
Received: by mail-pg1-x549.google.com with SMTP id
 w5-20020a654105000000b002692534afceso2500457pgp.8
 for <xen-devel@lists.xenproject.org>; Wed, 10 Nov 2021 18:07:58 -0800 (PST)
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
X-Inumbo-ID: 2f906369-4294-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=reply-to:date:in-reply-to:message-id:mime-version:references
         :subject:from:to:cc;
        bh=JkXBJDHAhyFHU3BMn5TxNvn1UhPk279A0oNuAvxWjCs=;
        b=V/Erh1076Wrysqbzd52oPttVcTj86MAahPnKpcTJq7syNcKb6Hfbc1a/qLHtW2aZzM
         ntU7/qAt53ZYhWpyQtDgus9kIEsKyCBHC9Oor9JVcDSlMaafDjmyIjCdZpzvQ66yq2bF
         4Ln7yitJs7J3vTj08rGLJxl/XgscQixibexw/j2isHouYrE3KN5luTSwIyyiHohqB2oM
         DOWc3gmIU3WsnyehgpVge5vIjiQslJURYz13x/vyJ7eIHnvpBJAi8Es5msfqjvngRBal
         GfU5K5lWZJ/c/IOjpQl51jUxu8wnvx5XYX1lWsqsltJUovOqyoHi492zQ3HRq67UjhCi
         YKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:date:in-reply-to:message-id
         :mime-version:references:subject:from:to:cc;
        bh=JkXBJDHAhyFHU3BMn5TxNvn1UhPk279A0oNuAvxWjCs=;
        b=YhyB5MES68FvaIhNxiygoJ8s/Uu7OTLw2or1QaC96D529GbMhZo6FaBxcSaDKtoT22
         NQRaL4AVwMOBS0FwORv/snqO8d/cgZr8wnYf4iHgA0MR/TxZT6n2SVVj45VNzS6sCGD7
         yiwBYKD7batZFY5lK7HxmSJTv70DmUXe96PiFGEiwvh9hRDFQVywxwhuzSYCwlDGKW45
         FthophLjRfjzTTsJtYEQvVY1nAPLIYJANAWx/hORnbh+KDKiuI80JwiHOcNO943HrBb9
         e7Z69CTLXlNUJTvdXjcuEZ2KBauyt8zvAobm0LyVovu6jv6/tXam6YumHAT5G6+zYZOC
         0Fbg==
X-Gm-Message-State: AOAM531//oRoYh82TTF+uMYaA63yXUaPPvPKlwM+nrhjGXarNvaxGfej
	wk8dnqniUwddRT4kQu5M7ZXxylT5lx0=
X-Google-Smtp-Source: ABdhPJzZG6X7/rhXMvPOUNuiqnAPcfgQCLc1mXz6MzBC0EQ6fiOGWNnuouHOzuVVQb9cOW5lIf9DSbIQyKk=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:a8b:b0:44d:ef7c:94b9 with SMTP id
 b11-20020a056a000a8b00b0044def7c94b9mr3606208pfl.36.1636596475642; Wed, 10
 Nov 2021 18:07:55 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 11 Nov 2021 02:07:30 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-10-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 09/17] perf/core: Use static_call to optimize perf_guest_info_callbacks
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Russell King <linux@armlinux.org.uk>, Marc Zyngier <maz@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
	Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Juergen Gross <jgross@suse.com>
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
	Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>, 
	Zhu Lingshan <lingshan.zhu@intel.com>
Content-Type: text/plain; charset="UTF-8"

Use static_call to optimize perf's guest callbacks on arm64 and x86,
which are now the only architectures that define the callbacks.  Use
DEFINE_STATIC_CALL_RET0 as the default/NULL for all guest callbacks, as
the callback semantics are that a return value '0' means "not in guest".

static_call obviously avoids the overhead of CONFIG_RETPOLINE=y, but is
also advantageous versus other solutions, e.g. per-cpu callbacks, in that
a per-cpu memory load is not needed to detect the !guest case.

Based on code from Peter and Like.

Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Like Xu <like.xu.linux@gmail.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/perf_event.h | 34 ++++++++--------------------------
 kernel/events/core.c       | 15 +++++++++++++++
 2 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index ea47ef616ee0..0ac7d867ca0c 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -1244,40 +1244,22 @@ extern void perf_event_bpf_event(struct bpf_prog *prog,
 
 #ifdef CONFIG_GUEST_PERF_EVENTS
 extern struct perf_guest_info_callbacks __rcu *perf_guest_cbs;
-static inline struct perf_guest_info_callbacks *perf_get_guest_cbs(void)
-{
-	/*
-	 * Callbacks are RCU-protected and must be READ_ONCE to avoid reloading
-	 * the callbacks between a !NULL check and dereferences, to ensure
-	 * pending stores/changes to the callback pointers are visible before a
-	 * non-NULL perf_guest_cbs is visible to readers, and to prevent a
-	 * module from unloading callbacks while readers are active.
-	 */
-	return rcu_dereference(perf_guest_cbs);
-}
+
+DECLARE_STATIC_CALL(__perf_guest_state, *perf_guest_cbs->state);
+DECLARE_STATIC_CALL(__perf_guest_get_ip, *perf_guest_cbs->get_ip);
+DECLARE_STATIC_CALL(__perf_guest_handle_intel_pt_intr, *perf_guest_cbs->handle_intel_pt_intr);
+
 static inline unsigned int perf_guest_state(void)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	return guest_cbs ? guest_cbs->state() : 0;
+	return static_call(__perf_guest_state)();
 }
 static inline unsigned long perf_guest_get_ip(void)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	/*
-	 * Arbitrarily return '0' in the unlikely scenario that the callbacks
-	 * are unregistered between checking guest state and getting the IP.
-	 */
-	return guest_cbs ? guest_cbs->get_ip() : 0;
+	return static_call(__perf_guest_get_ip)();
 }
 static inline unsigned int perf_guest_handle_intel_pt_intr(void)
 {
-	struct perf_guest_info_callbacks *guest_cbs = perf_get_guest_cbs();
-
-	if (guest_cbs && guest_cbs->handle_intel_pt_intr)
-		return guest_cbs->handle_intel_pt_intr();
-	return 0;
+	return static_call(__perf_guest_handle_intel_pt_intr)();
 }
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 1c8d341ecc77..b4fd928e4ff8 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6524,12 +6524,23 @@ static void perf_pending_event(struct irq_work *entry)
 #ifdef CONFIG_GUEST_PERF_EVENTS
 struct perf_guest_info_callbacks __rcu *perf_guest_cbs;
 
+DEFINE_STATIC_CALL_RET0(__perf_guest_state, *perf_guest_cbs->state);
+DEFINE_STATIC_CALL_RET0(__perf_guest_get_ip, *perf_guest_cbs->get_ip);
+DEFINE_STATIC_CALL_RET0(__perf_guest_handle_intel_pt_intr, *perf_guest_cbs->handle_intel_pt_intr);
+
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
 	if (WARN_ON_ONCE(rcu_access_pointer(perf_guest_cbs)))
 		return;
 
 	rcu_assign_pointer(perf_guest_cbs, cbs);
+	static_call_update(__perf_guest_state, cbs->state);
+	static_call_update(__perf_guest_get_ip, cbs->get_ip);
+
+	/* Implementing ->handle_intel_pt_intr is optional. */
+	if (cbs->handle_intel_pt_intr)
+		static_call_update(__perf_guest_handle_intel_pt_intr,
+				   cbs->handle_intel_pt_intr);
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 
@@ -6539,6 +6550,10 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 		return;
 
 	rcu_assign_pointer(perf_guest_cbs, NULL);
+	static_call_update(__perf_guest_state, (void *)&__static_call_return0);
+	static_call_update(__perf_guest_get_ip, (void *)&__static_call_return0);
+	static_call_update(__perf_guest_handle_intel_pt_intr,
+			   (void *)&__static_call_return0);
 	synchronize_rcu();
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
-- 
2.34.0.rc0.344.g81b53c2807-goog


