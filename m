Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C87EB12092
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058067.1425834 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK18-0005GZ-BC; Fri, 25 Jul 2025 15:07:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058067.1425834; Fri, 25 Jul 2025 15:07:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK17-000594-Rg; Fri, 25 Jul 2025 15:07:25 +0000
Received: by outflank-mailman (input) for mailman id 1058067;
 Fri, 25 Jul 2025 15:07:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK15-0002MQ-Uk
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:23 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10a4df44-6969-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 17:07:22 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-607cf70b00aso4372661a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:22 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:21 -0700 (PDT)
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
X-Inumbo-ID: 10a4df44-6969-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456041; x=1754060841; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2apShFwR46Beomu8PA+jY3aycyZQMB8hT+3xioaatM=;
        b=CB9cZ043cVDiQR7VWQZSZoEJ/GN8koFEtyDEAJ7DjQ6slR3HVhiyJdqCs3kofo8hR6
         McoxAUEmx8r7LUUwgcDSPuV0kBM2Y34j9YV3vtZX+CdCHwlGG5VAbA/Xu38mFhutXllS
         Wb/aMtS7UxnfgUPCZiqlVZuWoOJzU4RYg658U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456041; x=1754060841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l2apShFwR46Beomu8PA+jY3aycyZQMB8hT+3xioaatM=;
        b=Dad0yg3x9CqRPZUVEu9g+OkzxQkkWiyJbFjhvmr/VBbH3lok58y3EZvsz+5yT0cho7
         URkDMtHaiLQrp1H5PutBnfBCqizyZrlgPSayiPGU60HxlFtE/WFBOUaCA+ivNexEU/XQ
         HN5USuoItdaVInVM+2Vo6YXZhNHmutCSE+AG8kUXIEzvpM2r9oPXnTG8FcE1WZO02stH
         AvQqD34OGBzgoKonzXOSxKdTxWv/nyc7nMA+VNud2VCDubbk/r2bWyEycGSpwtfdnUgv
         vjTtvHydBeZ6MrDNqg/SV2sOTWCP0UIZxchDdIudtNhwQzzlGGbmWbGOojilc49qN6jV
         rnOA==
X-Gm-Message-State: AOJu0YyQbX5FVGF0Z12PyBtK7z0BOUKcJdA4iwsCxSYzBF5EozqEVGyK
	pWsSBczGYdWBZ1kl87bi80Xkg1DveHG1EJYlSRGgyGYa0SrZZL9lkwLdMXjIP+aHk8Vnpyy9ygj
	HL3Gg2MU=
X-Gm-Gg: ASbGnct+KUagY5SlRZD50fWVUdhSvFo9NEYvRiUhhfo/DLcOTFDaCU0luzIUa1sDspj
	PSiw9Umw2BY0HdO/1kfWv+ZlGDaMv+cwCpkYHiLpGRyj8CKt+/56FWo2uCRWaPT6VPDePkcEwP8
	pfNhDTuWVHhIF/H9lAARJ1Igp8b7deNQlLzULUkW3QBUfK1wouNCC7QU5kWxX+xRQE9cRE6sfoW
	WgNgFlF1vokLnkjgHdRhcgtIaWiDg/X2lP+3phpGL6zl4qljjASe6YkCwlQLO9U3oDLQd4f6B2C
	+u7l5hQfnIXQARO6FH8p+sC4fOCKcH9ENcc8wGju/2Shrtbp9PnJQckdxOcU4FpOyQe77ODtRh7
	HpIpfJyZ2Tij3epTI78oYuqQ78+p8k4jByBjHB7iQhMllKq4=
X-Google-Smtp-Source: AGHT+IFlClga9zdb0mqz4kAT4vlSkIUpH4lY4DIuGqB2I8twj25k6WbdynM8YuKiO0Mc2iuVyYXOnA==
X-Received: by 2002:a05:6402:3495:b0:612:c2a3:6b5e with SMTP id 4fb4d7f45d1cf-614f1df644cmr2162573a12.20.1753456041507;
        Fri, 25 Jul 2025 08:07:21 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Subject: [RFC LINUX PATCH v1 3/3] perf kvm: implement Xen hypervisor stacktraces
Date: Fri, 25 Jul 2025 16:06:49 +0100
Message-ID: <20250725150719.472782-3-edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Using the new VPMU 0.2 interface.
This is backwards compatible with VPMU 0.1:
the new 'struct xen_pmu_hv_stacktrace` is stored at the end of the page,
and stacktrace_nr would be 0 on old hypervisors.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 arch/x86/events/core.c |  4 ++-
 arch/x86/xen/pmu.c     | 73 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 70 insertions(+), 7 deletions(-)

diff --git a/arch/x86/events/core.c b/arch/x86/events/core.c
index ad63bd408cd9..1fca4a77f353 100644
--- a/arch/x86/events/core.c
+++ b/arch/x86/events/core.c
@@ -2764,12 +2764,14 @@ perf_callchain_kernel(struct perf_callchain_entry_ctx *entry, struct pt_regs *re
 	struct unwind_state state;
 	unsigned long addr;
 
+	perf_hypervisor_callchain(entry, regs);
+
 	if (perf_guest_state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
 	}
 
-	if (perf_callchain_store(entry, regs->ip))
+	if (!regs->ip || perf_callchain_store(entry, regs->ip))
 		return;
 
 	if (perf_hw_regs(regs))
diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index b92dc739fdfb..4996b6904e0b 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -19,11 +19,13 @@
 struct xenpmu {
 	/* Shared page between hypervisor and domain */
 	struct xen_pmu_data *xenpmu_data;
+	const struct xen_pmu_hv_stacktrace *xenpmu_hv_stacktrace;
 
 	uint8_t flags;
 };
 static DEFINE_PER_CPU(struct xenpmu, xenpmu_shared);
 #define get_xenpmu_data()    (this_cpu_ptr(&xenpmu_shared)->xenpmu_data)
+#define get_xenpmu_hv_stacktrace()    (this_cpu_ptr(&xenpmu_shared)->xenpmu_hv_stacktrace)
 #define get_xenpmu_flags()   (this_cpu_ptr(&xenpmu_shared)->flags)
 
 /* Macro for computing address of a PMU MSR bank */
@@ -436,8 +438,19 @@ static unsigned int xen_guest_state(void)
 		return state;
 	}
 
-	if (!xen_initial_domain() || (xenpmu_data->domain_id >= DOMID_SELF))
-		return state;
+	if (!xen_initial_domain() || (xenpmu_data->domain_id >= DOMID_SELF)) {
+		if (xenpmu_data->domain_id == DOMID_XEN) {
+			/* when inside Xen we output the hypervisor stacktrace if available,
+			 * but only look at guest stacktrace if this is our domid
+			 */
+			const struct xen_pmu_hv_stacktrace *xenpmu_hv_stacktrace =
+				get_xenpmu_hv_stacktrace();
+			if (!xenpmu_hv_stacktrace ||
+			    xenpmu_hv_stacktrace->guest_domain_id == DOMID_SELF)
+				return state;
+		} else
+			return state;
+	}
 
 	state |= PERF_GUEST_ACTIVE;
 
@@ -463,10 +476,54 @@ static unsigned long xen_get_guest_ip(void)
 	return xenpmu_data->pmu.r.regs.ip;
 }
 
+static void xen_convert_regs(const struct xen_pmu_regs *xen_regs,
+			     struct pt_regs *regs, uint64_t pmu_flags);
+
+static void xen_hypervisor_callchain(struct perf_callchain_entry_ctx *entry,
+				     struct pt_regs *regs)
+{
+	if (!entry)
+		return;
+
+	const struct xen_pmu_data *xenpmu_data = get_xenpmu_data();
+
+	if (!xenpmu_data) {
+		pr_warn_once("%s: pmudata not initialized\n", __func__);
+		return;
+	}
+
+	if (xenpmu_data->domain_id != DOMID_XEN)
+		return;
+
+	if (!regs->ip || perf_callchain_store(entry, regs->ip))
+		return;
+
+	const struct xen_pmu_hv_stacktrace *pmu_stack =
+		get_xenpmu_hv_stacktrace();
+
+	const unsigned int stacktrace_nr = pmu_stack->stacktrace_nr;
+
+	if (stacktrace_nr > ARRAY_SIZE(pmu_stack->stacktrace)) {
+		pr_warn_once("%s: stacktrace_nr out of bounds: %d", __func__,
+			     stacktrace_nr);
+		return;
+	}
+
+	for (unsigned int i = 0; i < stacktrace_nr; i++) {
+		uint64_t addr =
+			pmu_stack->stacktrace[PMU_MAX_STACKTRACE - 1 - i];
+		if (!addr || perf_callchain_store(entry, addr))
+			break;
+	}
+
+	xen_convert_regs(&pmu_stack->guest.r.regs, regs,
+			 xenpmu_data->pmu.pmu_flags);
+}
+
 static struct perf_guest_info_callbacks xen_guest_cbs = {
 	.state                  = xen_guest_state,
 	.get_ip			= xen_get_guest_ip,
-	.hypervisor_callchain   = NULL
+	.hypervisor_callchain   = xen_hypervisor_callchain
 };
 
 /* Convert registers from Xen's format to Linux' */
@@ -490,7 +547,6 @@ static void xen_convert_regs(const struct xen_pmu_regs *xen_regs,
 	}
 }
 
-
 irqreturn_t xen_pmu_irq_handler(int irq, void *dev_id)
 {
 	int err, ret = IRQ_NONE;
@@ -527,7 +583,7 @@ void xen_pmu_init(int cpu)
 {
 	int err;
 	struct xen_pmu_params xp;
-	unsigned long pfn;
+	unsigned long pfn, pmu_page;
 	struct xen_pmu_data *xenpmu_data;
 
 	BUILD_BUG_ON(sizeof(struct xen_pmu_data) > PAGE_SIZE);
@@ -535,7 +591,8 @@ void xen_pmu_init(int cpu)
 	if (xen_hvm_domain() || (cpu != 0 && !is_xen_pmu))
 		return;
 
-	xenpmu_data = (struct xen_pmu_data *)get_zeroed_page(GFP_KERNEL);
+	pmu_page = get_zeroed_page(GFP_KERNEL);
+	xenpmu_data = (struct xen_pmu_data *)pmu_page;
 	if (!xenpmu_data) {
 		pr_err("VPMU init: No memory\n");
 		return;
@@ -551,6 +608,10 @@ void xen_pmu_init(int cpu)
 		goto fail;
 
 	per_cpu(xenpmu_shared, cpu).xenpmu_data = xenpmu_data;
+	per_cpu(xenpmu_shared, cpu).xenpmu_hv_stacktrace =
+		(const struct xen_pmu_hv_stacktrace *)
+			    (pmu_page + PAGE_SIZE -
+			    sizeof(struct xen_pmu_hv_stacktrace));
 	per_cpu(xenpmu_shared, cpu).flags = 0;
 
 	if (!is_xen_pmu) {
-- 
2.47.1


