Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE33B1209A
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 17:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058070.1425848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK1A-0005ot-Kw; Fri, 25 Jul 2025 15:07:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058070.1425848; Fri, 25 Jul 2025 15:07:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufK1A-0005jV-AV; Fri, 25 Jul 2025 15:07:28 +0000
Received: by outflank-mailman (input) for mailman id 1058070;
 Fri, 25 Jul 2025 15:07:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DJoT=2G=cloud.com=edwin.torok@srs-se1.protection.inumbo.net>)
 id 1ufK17-0002MQ-VN
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 15:07:25 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 113f549f-6969-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 17:07:23 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-608acb0a27fso3685337a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 08:07:23 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0f730fsm2194208a12.22.2025.07.25.08.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 08:07:19 -0700 (PDT)
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
X-Inumbo-ID: 113f549f-6969-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1753456042; x=1754060842; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eees8l7HYHFwD1RvaaoHSAMU8I8IDqz7LF2ScnBEH/o=;
        b=LOsMqoHEo2gUxzqYyrvXw8T2oCMa/M/qoSV4kKoqOrBVP+FQmOukKTopbLKxzW5qK/
         Sgim8nbQRX5OiC2OKk6XeSITaPSshMuTR04qtPH+uEemlwKylTmELPCUePiIQfwohcy6
         7YLre7DPspp2JiXwfTIxi/FX0mGttwkQuR2zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456042; x=1754060842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eees8l7HYHFwD1RvaaoHSAMU8I8IDqz7LF2ScnBEH/o=;
        b=gNjozB/SZ5jBycCkcYcbXEt8Y2MSFKWT8R8cXZA8AkB8u3NRV9/P+y17H37l3wh7WA
         UB2SsEQBPJdgr0V/OD6ZAulC6fGSRQ1603uc7q36QQITWrJDws5BAaPGHvWk//Pq5qBF
         YrQYN044/c+rmzzmdS0nnltneOV0/1Fd3bNP6YAsjS/1th9k0S9nMH6UBlWs9WXjmtzO
         5Jd0aVVnTjtvUf8Huxn3mge2rZtdQM86LHbwiwCFMXVBwaIYuTMfu1OvAxs8FM0LtNbJ
         fNUVDjVnSolXorSzYhzLKK7A4Cq1pB+J4BF6Wv/BgbBl/fHXNd8zVA6xudwu3XjkvtuP
         oX1Q==
X-Gm-Message-State: AOJu0YyKdBuaaajabfh92i7T/E7bXcYhxMUB32yrXjT0Y9InBTxfv2E/
	iNUiUtDTMyMNPXIRl7ZHq9nSUdZCDg/t9LxwSfUwW9Mc1bi3R1/jIMdqDKcBg1y5CX6/6MznMP9
	YFvxvq4E=
X-Gm-Gg: ASbGncsDcDkRNi9IEQ17lCobAMPGM45bg7Z5Nr0PHkUtEW4OZaAvwnBXz/m0feHxeNV
	/ruCmEAljKHXjsHOEx48ISi9fEtWHWMShlCR8Xd8CrQQ4o/UnItyOV+C7Qq6J40Hk83yjt//wIA
	iquqMgHEVde4ziEFrGM4xj59dgopp3WIEk9cTgtxe7fsSrnlpwTOofnrT8ZZ/gM6a73yfiPVMgP
	qtESVoeFrc3Je83G2qJAhystc9NTHf2HSumj/h5iH6hSUxX8WXFSrTjXReT4elSaOYHbeAYuVHk
	b5cBlJ276pg/uy2+6SBm+rg+9hitWGv+s9ZO9Hf+ZMplwUqMysdQeMOh/jNw010dkQxTP77CcDf
	GcahWA9r6doTm8IckFRLhB6t0HeQJXz5zsEel
X-Google-Smtp-Source: AGHT+IGS405VXxW1EPdupffOjwjXEufOUvMG1R4Zwk95ZKFsAjWD0uSJlXHO9E6I0o/Tw2TQqyFbMA==
X-Received: by 2002:a05:6402:354e:b0:606:fef3:7c3e with SMTP id 4fb4d7f45d1cf-614f1b98612mr2222567a12.3.1753456040127;
        Fri, 25 Jul 2025 08:07:20 -0700 (PDT)
From: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: =?UTF-8?q?Edwin=20T=C3=B6r=C3=B6k?= <edwin.torok@cloud.com>
Subject: [RFC LINUX PATCH v1 1/3] perf kvm: introduce a hypervisor_callchain callback
Date: Fri, 25 Jul 2025 16:06:47 +0100
Message-ID: <20250725150719.472782-1-edwin.torok@cloud.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1753372928.git.edwin.torok@cloud.com>
References: <cover.1753372928.git.edwin.torok@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

`perf kvm` currently assumes that it can construct a stacktrace by
looking up stack pointer addresses in the current kernel's address
space.
That only works if the hypervisor is the same as the kernel (i.e. KVM),
but doesn't work if the hypervisor is separate from the kernel (Xen,
with Linux as Dom0).

Introduce a callback to enable Xen to retrieve the stacktrace from Xen
instead when a sample is inside the hypervisor (domid == DOMID_XEN
instead of DOMID_SELF).

The callback can replace the registers with the guest kernel's registers
upon return when domid == DOMID_SELF, so that we can continue with the
kernel stacktrace.

Both KVM and Xen define this as NULL, a followup commit will implement
the callback for Xen (KVM doesn't need a callback implementation).

No functional change.

Signed-off-by: Edwin Török <edwin.torok@cloud.com>
---
 arch/x86/xen/pmu.c         |  2 ++
 include/linux/perf_event.h | 12 ++++++++++++
 kernel/events/core.c       |  5 +++++
 virt/kvm/kvm_main.c        |  1 +
 4 files changed, 20 insertions(+)

diff --git a/arch/x86/xen/pmu.c b/arch/x86/xen/pmu.c
index 246d67dab510..b92dc739fdfb 100644
--- a/arch/x86/xen/pmu.c
+++ b/arch/x86/xen/pmu.c
@@ -466,6 +466,7 @@ static unsigned long xen_get_guest_ip(void)
 static struct perf_guest_info_callbacks xen_guest_cbs = {
 	.state                  = xen_guest_state,
 	.get_ip			= xen_get_guest_ip,
+	.hypervisor_callchain   = NULL
 };
 
 /* Convert registers from Xen's format to Linux' */
@@ -489,6 +490,7 @@ static void xen_convert_regs(const struct xen_pmu_regs *xen_regs,
 	}
 }
 
+
 irqreturn_t xen_pmu_irq_handler(int irq, void *dev_id)
 {
 	int err, ret = IRQ_NONE;
diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
index 90c782749b05..d82aeaddadb8 100644
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -29,10 +29,14 @@
 #define PERF_GUEST_ACTIVE	0x01
 #define PERF_GUEST_USER	0x02
 
+struct perf_callchain_entry_ctx;
+
 struct perf_guest_info_callbacks {
 	unsigned int			(*state)(void);
 	unsigned long			(*get_ip)(void);
 	unsigned int			(*handle_intel_pt_intr)(void);
+	void				(*hypervisor_callchain)(struct perf_callchain_entry_ctx *pc,
+								struct pt_regs *regs);
 };
 
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
@@ -1514,6 +1518,7 @@ extern struct perf_guest_info_callbacks __rcu *perf_guest_cbs;
 DECLARE_STATIC_CALL(__perf_guest_state, *perf_guest_cbs->state);
 DECLARE_STATIC_CALL(__perf_guest_get_ip, *perf_guest_cbs->get_ip);
 DECLARE_STATIC_CALL(__perf_guest_handle_intel_pt_intr, *perf_guest_cbs->handle_intel_pt_intr);
+DECLARE_STATIC_CALL(__perf_hypervisor_callchain, *perf_guest_cbs->hypervisor_callchain);
 
 static inline unsigned int perf_guest_state(void)
 {
@@ -1527,12 +1532,19 @@ static inline unsigned int perf_guest_handle_intel_pt_intr(void)
 {
 	return static_call(__perf_guest_handle_intel_pt_intr)();
 }
+static inline void
+perf_hypervisor_callchain(struct perf_callchain_entry_ctx *entry,
+			  struct pt_regs *regs)
+{
+	static_call(__perf_hypervisor_callchain)(entry, regs);
+}
 extern void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 extern void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs);
 #else
 static inline unsigned int perf_guest_state(void)		 { return 0; }
 static inline unsigned long perf_guest_get_ip(void)		 { return 0; }
 static inline unsigned int perf_guest_handle_intel_pt_intr(void) { return 0; }
+static inline void perf_hypervisor_callchain(struct perf_callchain_entry_ctx *) { return; }
 #endif /* CONFIG_GUEST_PERF_EVENTS */
 
 extern void perf_event_exec(void);
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 3a33d9c1b1b2..a8535294018b 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -6917,6 +6917,7 @@ struct perf_guest_info_callbacks __rcu *perf_guest_cbs;
 DEFINE_STATIC_CALL_RET0(__perf_guest_state, *perf_guest_cbs->state);
 DEFINE_STATIC_CALL_RET0(__perf_guest_get_ip, *perf_guest_cbs->get_ip);
 DEFINE_STATIC_CALL_RET0(__perf_guest_handle_intel_pt_intr, *perf_guest_cbs->handle_intel_pt_intr);
+DEFINE_STATIC_CALL_NULL(__perf_hypervisor_callchain, *perf_guest_cbs->hypervisor_callchain);
 
 void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 {
@@ -6931,6 +6932,9 @@ void perf_register_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 	if (cbs->handle_intel_pt_intr)
 		static_call_update(__perf_guest_handle_intel_pt_intr,
 				   cbs->handle_intel_pt_intr);
+	if (cbs->hypervisor_callchain)
+		static_call_update(__perf_hypervisor_callchain,
+				   cbs->hypervisor_callchain);
 }
 EXPORT_SYMBOL_GPL(perf_register_guest_info_callbacks);
 
@@ -6944,6 +6948,7 @@ void perf_unregister_guest_info_callbacks(struct perf_guest_info_callbacks *cbs)
 	static_call_update(__perf_guest_get_ip, (void *)&__static_call_return0);
 	static_call_update(__perf_guest_handle_intel_pt_intr,
 			   (void *)&__static_call_return0);
+	static_call_update(__perf_hypervisor_callchain, (void *)&__static_call_return0);
 	synchronize_rcu();
 }
 EXPORT_SYMBOL_GPL(perf_unregister_guest_info_callbacks);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 44c228bcd699..20a03dd9cc42 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -6038,6 +6038,7 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.state			= kvm_guest_state,
 	.get_ip			= kvm_guest_get_ip,
 	.handle_intel_pt_intr	= NULL,
+	.hypervisor_callchain   = NULL
 };
 
 void kvm_register_perf_callbacks(unsigned int (*pt_intr_handler)(void))

base-commit: dbcb8d8e4163e46066f43e2bd9a6779e594ec900
-- 
2.47.1


