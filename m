Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHsgIqSDwmlneQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:29:24 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205413083A6
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2026 13:29:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1260572.1553839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50sT-0000no-GK; Tue, 24 Mar 2026 12:28:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1260572.1553839; Tue, 24 Mar 2026 12:28:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w50sT-0000kc-Cd; Tue, 24 Mar 2026 12:28:57 +0000
Received: by outflank-mailman (input) for mailman id 1260572;
 Tue, 24 Mar 2026 12:28:56 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <xakep.amatop@gmail.com>) id 1w50sR-0000ij-TD
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 12:28:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1w50sR-00AZEX-8w
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2026 13:28:55 +0100
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c28380-5cb7-0a2a0a5109dd-0a2a4506af42-14
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:28:55 +0100
Received: from [209.85.218.51] (helo=mail-ej1-f51.google.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.55.2)
 (envelope-from <xakep.amatop@gmail.com>)
 id 69c28387-3034-0a2a45060019-d155da33d566-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 13:28:55 +0100
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-b9358dd7f79so639825266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Mar 2026 05:28:55 -0700 (PDT)
Received: from EPUAKYIW02F7.. ([45.12.26.190])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f43ae8sm638180966b.6.2026.03.24.05.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 05:28:53 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774355334; x=1774960134; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/6HJhyhtErbpXXGpZoU8/+KkesjpSkybuifOG8Ybk8=;
        b=WGbybabhSYWkINqbcNakJP9fC67jcffTm0rIyPNI1m52uNjIA91/ysMdGo9SG4p29P
         JkB7sXnE7xTiqxHgX2gciPne8tPIgQOoURsLaZvT61ncsDXWdK+UW8W1KFj1L84ToMd7
         E/rH4wcI9jBGvd+VzXd0m8whIaUd4q2m0cl8Zepy62ulDD1K+i9qq1HFI56plYaTPl30
         Ak9PQ30A1g+ym6vWx8NhjcQnr4giIjmV5QwQuAknmFwDm8CLcDhJtz8QbDMUArc3edXj
         f348+KfDG6KKLG0AK0+vd5mqxFiFk5+vByBm5AHTrwy1DLDcM3Zxf67vV5q5H03OlLJm
         47EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774355334; x=1774960134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7/6HJhyhtErbpXXGpZoU8/+KkesjpSkybuifOG8Ybk8=;
        b=LWm7U2O531FJ2jo6Ask8T9fepC576/p2czZXyNDZSUMzIE41mxG38N/FUNMajicEbI
         vfDiMMjsVMwf/7ZqbC4DcixMf7nL1P1tj5PPYn4qskLuECTGfLoMiQZbUhzsWvk3Tg+T
         T2SzvU4C+WBKtv1beaEtNDQxYeGVLE45PXvMxEudl97YaudvY3ShL/AEMs3ijhK2QRxi
         hmJ/nJAy9MhgEtlTR+NsQr2HI7Kj4rYwWp1cmWVRp2xSvqZM8YUYMf375HuWZ/T/w/Po
         D1OLtCvcBs4kuQuewdhLBlAHfYXY3ClQPpw+vXx3V8TNF99V4/awtuyNZKHWeBrHfT2x
         SMgg==
X-Gm-Message-State: AOJu0YzDApcCw02gRHMJ9Lcxj/lx24x5jIYZi++wov9+ErM/KWCy6hu8
	D7W3SDsacrnuIm7wWoLShNgQbOaD8G3KbaKfwTETE5U5Btn/nRM+roAjATm+cA==
X-Gm-Gg: ATEYQzyhSUakvdPAil1ENSukK1gh/9XbJrI2E08c3El5MPIlTSbisFWDGHeCZk8flK3
	gQVyXQx7kuNCwnqUtVSmTo8EqfFv+VAdW+omugxinyCEu04Q39WoEKNvLi8wCgyJ7K1eMMPUQUJ
	81n2izPL6F+xHDS8LJQ09iL9g5/4rIkhEDECChisadbFaKnZpv4uVZNWWm67hGxQCA5x1vDxWG+
	fk2n0ggvJt/EBOo2eJgFBhflsvWcZzWR3bC1o8KmV6iVBjH8Qr+fPRfnDKTRPsqjfBLFV5q4PxJ
	3r3+PHzFoZjhzC22OMmlCmqJyQyM5shHXk6yOIzoUtsCnOdqW2Xzf+CZ2Csy/HFHba6W9FI+YBF
	ux7sXqDBNPZO8jdXnQJoWqZZj65EB3xopbd1OGpb1849dhGqNPq++MEvCCK7RHW+LN+efcLCNab
	FIEf6AvqRlEpZq+pinvppCCKwjb+Y=
X-Received: by 2002:a17:906:8a68:b0:b98:1214:1376 with SMTP id a640c23a62f3a-b982f3e6d8dmr872300866b.49.1774355334169;
        Tue, 24 Mar 2026 05:28:54 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v17 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for guests
Date: Tue, 24 Mar 2026 14:26:34 +0200
Message-ID: <581179709977ce4cebb22597411048dc93b11167.1774353053.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774353053.git.mykola_kvach@epam.com>
References: <cover.1774353053.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-16d1c6/1774355335-82F941C2-A0D50685/0/0
X-purgate-type: clean
X-purgate-size: 18144
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:mykola_kvach@epam.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epam.com:email,epam.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[xakepamatop@gmail.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 205413083A6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mykola Kvach <mykola_kvach@epam.com>

Add support for the PSCI SYSTEM_SUSPEND function in the vPSCI interface,
allowing guests to request suspend via the PSCI v1.0+ SYSTEM_SUSPEND call
(both 32-bit and 64-bit variants).

Implementation details:
- Add SYSTEM_SUSPEND function IDs to PSCI definitions
- Trap and handle SYSTEM_SUSPEND in vPSCI
- Reject SYSTEM_SUSPEND for the hardware domain to avoid host shutdown
- Require all secondary VCPUs to be offline before suspend
- Split arch_set_info_guest() into arch_vcpu_validate_guest_context() and
  arch_vcpu_apply_guest_context() for reuse by vPSCI
- Add vpsci_build_guest_context() helper and store prevalidated context in
  resume_ctx; resume applies it and frees it
- Add arch_domain_resume() function is an architecture-specific hook that
  is invoked during domain resume to perform any necessary setup or
  restoration steps required by the platform.

Usage:

For Linux-based guests, suspend can be initiated with:
    echo mem > /sys/power/state
or via:
    systemctl suspend

Resume from control domain:
      xl resume <domain>

Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
Changes in V17:
- PSCI SYSTEM_SUSPEND is no longer advertised to the hardware domain via
  PSCI_FEATURES.
- Split arch_set_info_guest() into validate/apply helpers; keep full PSR
  validation on the public path.
- Build and validate PSCI vCPU context at SYSTEM_SUSPEND time, store it
  in resume_ctx.
- Make resume path apply only the prevalidated context and free it; add
  resume_ctx_reset() and cleanup in arch_domain_destroy().
- Rework vPSCI CPU_ON to use build/apply/free path; resume_ctx now
  carries a vcpu_guest_context pointer (no ep/cid).
- Make arch_domain_resume() void and remove the error branch from
  domain_resume().

Changes in V16:
- Refactor error handling in domain_resume: move logging to generic code,
  use explicit return code checking.
- Make context clearing conditional on success in arch_domain_resume.
- The 'int' return type is retained for arch_domain_resume for consistency
  with other arch hooks and to allow for specific negative error codes.
---
 xen/arch/arm/domain.c                 |  86 ++++++++++++---
 xen/arch/arm/include/asm/domain.h     |   7 ++
 xen/arch/arm/include/asm/perfc_defn.h |   1 +
 xen/arch/arm/include/asm/psci.h       |   2 +
 xen/arch/arm/include/asm/suspend.h    |  27 +++++
 xen/arch/arm/include/asm/vpsci.h      |   2 +-
 xen/arch/arm/vpsci.c                  | 146 +++++++++++++++++++++-----
 xen/common/domain.c                   |   4 +
 xen/include/xen/suspend.h             |  25 +++++
 9 files changed, 258 insertions(+), 42 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/suspend.h
 create mode 100644 xen/include/xen/suspend.h

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 94b9858ad2..581f82bddd 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -12,6 +12,8 @@
 #include <xen/softirq.h>
 #include <xen/wait.h>
 
+#include <public/sched.h>
+
 #include <asm/arm64/sve.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
@@ -24,10 +26,12 @@
 #include <asm/platform.h>
 #include <asm/procinfo.h>
 #include <asm/regs.h>
+#include <asm/suspend.h>
 #include <asm/firmware/sci.h>
 #include <asm/tee/tee.h>
 #include <asm/vfp.h>
 #include <asm/vgic.h>
+#include <asm/vpsci.h>
 #include <asm/vtimer.h>
 
 #include "vpci.h"
@@ -770,8 +774,18 @@ int arch_domain_teardown(struct domain *d)
     return 0;
 }
 
+static void resume_ctx_reset(struct resume_info *ctx)
+{
+    if ( ctx->ctxt )
+        free_vcpu_guest_context(ctx->ctxt);
+
+    memset(ctx, 0, sizeof(*ctx));
+}
+
 void arch_domain_destroy(struct domain *d)
 {
+    resume_ctx_reset(&d->arch.resume_ctx);
+
     tee_free_domain_ctx(d);
     /* IOMMU page table is shared with P2M, always call
      * iommu_domain_destroy() before p2m_final_teardown().
@@ -806,6 +820,28 @@ void arch_domain_creation_finished(struct domain *d)
     p2m_domain_creation_finished(d);
 }
 
+void arch_domain_resume(struct domain *d)
+{
+    struct resume_info *ctx = &d->arch.resume_ctx;
+
+    /*
+     * It is still possible to call domain_shutdown() with a suspend reason
+     * via some hypercalls, such as SCHEDOP_shutdown or SCHEDOP_remote_shutdown.
+     * In these cases, the resume context will be empty, so there is no
+     * suspend-specific state to restore.
+     */
+    if ( !ctx->wake_cpu )
+        return;
+
+    ASSERT(d->shutdown_code == SHUTDOWN_suspend);
+
+    domain_lock(d);
+    arch_vcpu_apply_guest_context(ctx->wake_cpu, ctx->ctxt);
+    domain_unlock(d);
+
+    resume_ctx_reset(ctx);
+}
+
 static int is_guest_pv32_psr(uint32_t psr)
 {
     switch (psr & PSR_MODE_MASK)
@@ -848,15 +884,32 @@ static int is_guest_pv64_psr(uint64_t psr)
 }
 #endif
 
+void arch_vcpu_apply_guest_context(struct vcpu *v,
+                                   const struct vcpu_guest_context *ctxt)
+{
+    vcpu_regs_user_to_hyp(v, &ctxt->user_regs);
+
+    v->arch.sctlr = ctxt->sctlr;
+    v->arch.ttbr0 = ctxt->ttbr0;
+    v->arch.ttbr1 = ctxt->ttbr1;
+    v->arch.ttbcr = ctxt->ttbcr;
+
+    v->is_initialised = 1;
+
+    if ( ctxt->flags & VGCF_online )
+        clear_bit(_VPF_down, &v->pause_flags);
+    else
+        set_bit(_VPF_down, &v->pause_flags);
+}
+
 /*
  * Initialise vCPU state. The context may be supplied by an external entity, so
  * we need to validate it.
  */
-int arch_set_info_guest(
-    struct vcpu *v, vcpu_guest_context_u c)
+int arch_vcpu_validate_guest_context(const struct vcpu *v,
+                                     const struct vcpu_guest_context *ctxt)
 {
-    struct vcpu_guest_context *ctxt = c.nat;
-    struct vcpu_guest_core_regs *regs = &c.nat->user_regs;
+    const struct vcpu_guest_core_regs *regs = &ctxt->user_regs;
 
     if ( is_32bit_domain(v->domain) )
     {
@@ -885,19 +938,24 @@ int arch_set_info_guest(
     }
 #endif
 
-    vcpu_regs_user_to_hyp(v, regs);
+    return 0;
+}
 
-    v->arch.sctlr = ctxt->sctlr;
-    v->arch.ttbr0 = ctxt->ttbr0;
-    v->arch.ttbr1 = ctxt->ttbr1;
-    v->arch.ttbcr = ctxt->ttbcr;
+/*
+ * Initialise vCPU state. The context may be supplied by an external entity, so
+ * we need to validate it.
+ */
+int arch_set_info_guest(
+    struct vcpu *v, vcpu_guest_context_u c)
+{
+    struct vcpu_guest_context *ctxt = c.nat;
+    int rc;
 
-    v->is_initialised = 1;
+    rc = arch_vcpu_validate_guest_context(v, ctxt);
+    if ( rc )
+        return rc;
 
-    if ( ctxt->flags & VGCF_online )
-        clear_bit(_VPF_down, &v->pause_flags);
-    else
-        set_bit(_VPF_down, &v->pause_flags);
+    arch_vcpu_apply_guest_context(v, ctxt);
 
     return 0;
 }
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index 758ad807e4..ffe5d0d9f0 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -5,6 +5,7 @@
 #include <xen/timer.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
+#include <asm/suspend.h>
 #include <asm/vfp.h>
 #include <asm/mmio.h>
 #include <asm/gic.h>
@@ -126,6 +127,7 @@ struct arch_domain
     void *sci_data;
 #endif
 
+    struct resume_info resume_ctx;
 }  __cacheline_aligned;
 
 struct arch_vcpu
@@ -290,6 +292,11 @@ static inline register_t vcpuid_to_vaffinity(unsigned int vcpuid)
     return vaff;
 }
 
+int arch_vcpu_validate_guest_context(const struct vcpu *v,
+                                     const struct vcpu_guest_context *ctxt);
+void arch_vcpu_apply_guest_context(struct vcpu *v,
+                                   const struct vcpu_guest_context *ctxt);
+
 static inline struct vcpu_guest_context *alloc_vcpu_guest_context(void)
 {
     return xmalloc(struct vcpu_guest_context);
diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
index effd25b69e..8dfcac7e3b 100644
--- a/xen/arch/arm/include/asm/perfc_defn.h
+++ b/xen/arch/arm/include/asm/perfc_defn.h
@@ -33,6 +33,7 @@ PERFCOUNTER(vpsci_system_reset,        "vpsci: system_reset")
 PERFCOUNTER(vpsci_cpu_suspend,         "vpsci: cpu_suspend")
 PERFCOUNTER(vpsci_cpu_affinity_info,   "vpsci: cpu_affinity_info")
 PERFCOUNTER(vpsci_features,            "vpsci: features")
+PERFCOUNTER(vpsci_system_suspend,      "vpsci: system_suspend")
 
 PERFCOUNTER(vcpu_kick,                 "vcpu: notify other vcpu")
 
diff --git a/xen/arch/arm/include/asm/psci.h b/xen/arch/arm/include/asm/psci.h
index 4780972621..48a93e6b79 100644
--- a/xen/arch/arm/include/asm/psci.h
+++ b/xen/arch/arm/include/asm/psci.h
@@ -47,10 +47,12 @@ void call_psci_system_reset(void);
 #define PSCI_0_2_FN32_SYSTEM_OFF          PSCI_0_2_FN32(8)
 #define PSCI_0_2_FN32_SYSTEM_RESET        PSCI_0_2_FN32(9)
 #define PSCI_1_0_FN32_PSCI_FEATURES       PSCI_0_2_FN32(10)
+#define PSCI_1_0_FN32_SYSTEM_SUSPEND      PSCI_0_2_FN32(14)
 
 #define PSCI_0_2_FN64_CPU_SUSPEND         PSCI_0_2_FN64(1)
 #define PSCI_0_2_FN64_CPU_ON              PSCI_0_2_FN64(3)
 #define PSCI_0_2_FN64_AFFINITY_INFO       PSCI_0_2_FN64(4)
+#define PSCI_1_0_FN64_SYSTEM_SUSPEND      PSCI_0_2_FN64(14)
 
 /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
 #define PSCI_0_2_AFFINITY_LEVEL_ON      0
diff --git a/xen/arch/arm/include/asm/suspend.h b/xen/arch/arm/include/asm/suspend.h
new file mode 100644
index 0000000000..31a98a1f1b
--- /dev/null
+++ b/xen/arch/arm/include/asm/suspend.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ARM_SUSPEND_H
+#define ARM_SUSPEND_H
+
+struct domain;
+struct vcpu;
+struct vcpu_guest_context;
+
+struct resume_info {
+    struct vcpu_guest_context *ctxt;
+    struct vcpu *wake_cpu;
+};
+
+void arch_domain_resume(struct domain *d);
+
+#endif /* ARM_SUSPEND_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/vpsci.h b/xen/arch/arm/include/asm/vpsci.h
index 0cca5e6830..69d40f9d7f 100644
--- a/xen/arch/arm/include/asm/vpsci.h
+++ b/xen/arch/arm/include/asm/vpsci.h
@@ -23,7 +23,7 @@
 #include <asm/psci.h>
 
 /* Number of function implemented by virtual PSCI (only 0.2 or later) */
-#define VPSCI_NR_FUNCS  12
+#define VPSCI_NR_FUNCS  14
 
 /* Functions handle PSCI calls from the guests */
 bool do_vpsci_0_1_call(struct cpu_user_regs *regs, uint32_t fid);
diff --git a/xen/arch/arm/vpsci.c b/xen/arch/arm/vpsci.c
index 7ba9ccd94b..bd87ec430d 100644
--- a/xen/arch/arm/vpsci.c
+++ b/xen/arch/arm/vpsci.c
@@ -4,38 +4,24 @@
 #include <xen/types.h>
 
 #include <asm/current.h>
+#include <asm/domain.h>
 #include <asm/vgic.h>
 #include <asm/vpsci.h>
 #include <asm/event.h>
 
 #include <public/sched.h>
 
-static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
-                            register_t context_id)
+static int vpsci_build_guest_context(struct vcpu *v, register_t entry_point,
+                                     register_t context_id,
+                                     struct vcpu_guest_context **out)
 {
-    struct vcpu *v;
-    struct domain *d = current->domain;
+    bool is_thumb = entry_point & 1;
     struct vcpu_guest_context *ctxt;
     int rc;
-    bool is_thumb = entry_point & 1;
-    register_t vcpuid;
-
-    vcpuid = vaffinity_to_vcpuid(target_cpu);
 
-    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
-        return PSCI_INVALID_PARAMETERS;
-
-    /* THUMB set is not allowed with 64-bit domain */
-    if ( is_64bit_domain(d) && is_thumb )
-        return PSCI_INVALID_ADDRESS;
-
-    if ( !test_bit(_VPF_down, &v->pause_flags) )
-        return PSCI_ALREADY_ON;
-
-    if ( (ctxt = alloc_vcpu_guest_context()) == NULL )
-        return PSCI_DENIED;
-
-    vgic_clear_pending_irqs(v);
+    ctxt = alloc_vcpu_guest_context();
+    if ( ctxt == NULL )
+        return -ENOMEM;
 
     memset(ctxt, 0, sizeof(*ctxt));
     ctxt->user_regs.pc64 = (u64) entry_point;
@@ -48,7 +34,7 @@ static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
      * x0/r0_usr are always updated because for PSCI 0.1 the general
      * purpose registers are undefined upon CPU_on.
      */
-    if ( is_32bit_domain(d) )
+    if ( is_32bit_domain(v->domain) )
     {
         ctxt->user_regs.cpsr = PSR_GUEST32_INIT;
         /* Start the VCPU with THUMB set if it's requested by the kernel */
@@ -69,15 +55,51 @@ static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
 #endif
     ctxt->flags = VGCF_online;
 
-    domain_lock(d);
-    rc = arch_set_info_guest(v, ctxt);
-    domain_unlock(d);
+    rc = arch_vcpu_validate_guest_context(v, ctxt);
+    if ( rc )
+    {
+        free_vcpu_guest_context(ctxt);
+        return rc;
+    }
 
-    free_vcpu_guest_context(ctxt);
+    *out = ctxt;
+    return 0;
+}
+
+static int do_common_cpu_on(register_t target_cpu, register_t entry_point,
+                            register_t context_id)
+{
+    struct vcpu *v;
+    struct domain *d = current->domain;
+    struct vcpu_guest_context *ctxt = NULL;
+    int rc;
+    bool is_thumb = entry_point & 1;
+    register_t vcpuid;
+
+    vcpuid = vaffinity_to_vcpuid(target_cpu);
+
+    if ( (v = domain_vcpu(d, vcpuid)) == NULL )
+        return PSCI_INVALID_PARAMETERS;
+
+    /* THUMB set is not allowed with 64-bit domain */
+    if ( is_64bit_domain(d) && is_thumb )
+        return PSCI_INVALID_ADDRESS;
 
+    if ( !test_bit(_VPF_down, &v->pause_flags) )
+        return PSCI_ALREADY_ON;
+
+    rc = vpsci_build_guest_context(v, entry_point, context_id, &ctxt);
     if ( rc < 0 )
         return PSCI_DENIED;
 
+    vgic_clear_pending_irqs(v);
+
+    domain_lock(d);
+    arch_vcpu_apply_guest_context(v, ctxt);
+    domain_unlock(d);
+
+    free_vcpu_guest_context(ctxt);
+
     vcpu_wake(v);
 
     return PSCI_SUCCESS;
@@ -197,6 +219,56 @@ static void do_psci_0_2_system_reset(void)
     domain_shutdown(d,SHUTDOWN_reboot);
 }
 
+static int32_t do_psci_1_0_system_suspend(register_t epoint, register_t cid)
+{
+    int32_t rc;
+    struct vcpu_guest_context *ctxt;
+    struct vcpu *v;
+    struct domain *d = current->domain;
+    bool is_thumb = epoint & 1;
+    struct resume_info *rctx = &d->arch.resume_ctx;
+
+    /* THUMB set is not allowed with 64-bit domain */
+    if ( is_64bit_domain(d) && is_thumb )
+        return PSCI_INVALID_ADDRESS;
+
+    /* SYSTEM_SUSPEND is not supported for the hardware domain yet */
+    if ( is_hardware_domain(d) )
+        return PSCI_NOT_SUPPORTED;
+
+    /* Ensure that all CPUs other than the calling one are offline */
+    domain_lock(d);
+    for_each_vcpu ( d, v )
+    {
+        if ( v != current && is_vcpu_online(v) )
+        {
+            domain_unlock(d);
+            return PSCI_DENIED;
+        }
+    }
+    domain_unlock(d);
+
+    rc = vpsci_build_guest_context(current, epoint, cid, &ctxt);
+    if ( rc )
+        return PSCI_DENIED;
+
+    rc = domain_shutdown(d, SHUTDOWN_suspend);
+    if ( rc )
+    {
+        free_vcpu_guest_context(ctxt);
+        return PSCI_DENIED;
+    }
+
+    rctx->ctxt = ctxt;
+    rctx->wake_cpu = current;
+
+    gprintk(XENLOG_DEBUG,
+            "SYSTEM_SUSPEND requested, epoint=%#"PRIregister", cid=%#"PRIregister"\n",
+            epoint, cid);
+
+    return rc;
+}
+
 static int32_t do_psci_1_0_features(uint32_t psci_func_id)
 {
     /* /!\ Ordered by function ID and not name */
@@ -216,6 +288,9 @@ static int32_t do_psci_1_0_features(uint32_t psci_func_id)
     case PSCI_1_0_FN32_PSCI_FEATURES:
     case ARM_SMCCC_VERSION_FID:
         return 0;
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
+        return is_hardware_domain(current->domain) ? PSCI_NOT_SUPPORTED : 0;
     default:
         return PSCI_NOT_SUPPORTED;
     }
@@ -344,6 +419,23 @@ bool do_vpsci_0_2_call(struct cpu_user_regs *regs, uint32_t fid)
         return true;
     }
 
+    case PSCI_1_0_FN32_SYSTEM_SUSPEND:
+    case PSCI_1_0_FN64_SYSTEM_SUSPEND:
+    {
+        register_t epoint = PSCI_ARG(regs, 1);
+        register_t cid = PSCI_ARG(regs, 2);
+
+        if ( fid == PSCI_1_0_FN32_SYSTEM_SUSPEND )
+        {
+            epoint &= GENMASK(31, 0);
+            cid &= GENMASK(31, 0);
+        }
+
+        perfc_incr(vpsci_system_suspend);
+        PSCI_SET_RESULT(regs, do_psci_1_0_system_suspend(epoint, cid));
+        return true;
+    }
+
     default:
         return false;
     }
diff --git a/xen/common/domain.c b/xen/common/domain.c
index ab910fcf93..c128074e7c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -26,6 +26,7 @@
 #include <xen/hypercall.h>
 #include <xen/delay.h>
 #include <xen/shutdown.h>
+#include <xen/suspend.h>
 #include <xen/percpu.h>
 #include <xen/multicall.h>
 #include <xen/rcupdate.h>
@@ -1435,6 +1436,9 @@ void domain_resume(struct domain *d)
     spin_lock(&d->shutdown_lock);
 
     d->is_shutting_down = d->is_shut_down = 0;
+
+    arch_domain_resume(d);
+
     d->shutdown_code = SHUTDOWN_CODE_INVALID;
 
     for_each_vcpu ( d, v )
diff --git a/xen/include/xen/suspend.h b/xen/include/xen/suspend.h
new file mode 100644
index 0000000000..c6ea7e867c
--- /dev/null
+++ b/xen/include/xen/suspend.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef XEN_SUSPEND_H
+#define XEN_SUSPEND_H
+
+#if __has_include(<asm/suspend.h>)
+#include <asm/suspend.h>
+#else
+static inline void arch_domain_resume(struct domain *d)
+{
+    (void)d;
+}
+#endif
+
+#endif /* XEN_SUSPEND_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


