Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4B47942FE
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 20:22:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596777.930814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdx9p-0004up-HZ; Wed, 06 Sep 2023 18:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596777.930814; Wed, 06 Sep 2023 18:21:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdx9p-0004sP-EB; Wed, 06 Sep 2023 18:21:41 +0000
Received: by outflank-mailman (input) for mailman id 596777;
 Wed, 06 Sep 2023 18:21:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ftD0=EW=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qdx9n-0004sJ-Hs
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 18:21:39 +0000
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [2607:f8b0:4864:20::72e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 370b9ea3-4ce2-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 20:21:37 +0200 (CEST)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-76ef6d98d7eso9345985a.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Sep 2023 11:21:37 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 f9-20020a05620a15a900b0076ee82f7726sm5090024qkk.132.2023.09.06.11.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 11:21:34 -0700 (PDT)
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
X-Inumbo-ID: 370b9ea3-4ce2-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694024496; x=1694629296; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zklSHdsI2UWJPNn1ecr8Eo6vQMjVOJa/0zR4bl3TAqc=;
        b=aKu/OGszcXsXLXfev865o5AHWj930QG2IPNZyM2yVoXlCVgKosUZqtZ7lL2puZ8BtF
         d8e5l8hVLuQ9/VPvchceRUJQF91jlLTdVc7GLgle4aoKuxzjAWaV5NT/6o6TdO7YqC0J
         KgaMSWh53eb0jXUjT47t0D6Z+ep207dWiCrBeziOBbLCR4Yq30OgLAu/6HV9yICdKZxo
         EUKqNRGmqNFm9l1pQz97WgCQrPPI5pBp2ErDThAAIY/ZLnZ6PK9ViwAF6S474DtXl1iM
         6BdvFOzSS6MV3c4VvhX6NvTbG710q3pzyiFpfGS2WdcLdqzHP7AmA4EixbZSAhaQLwEi
         KmIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694024496; x=1694629296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zklSHdsI2UWJPNn1ecr8Eo6vQMjVOJa/0zR4bl3TAqc=;
        b=DcBb5/TyIozkhsfZPjN16IsV8MjxU8PkKqevNpSNfN6gRgQtMZjDtiTx+AAacAzpyF
         Ntqqb5Hfb7Ybi8g5dm0TCzSIt2uJQ/D+9fkhuLCRinW6X6skbTEEq5ms9IGHB5+Djhhe
         I/J2seyIooAzt+6+CHdMjMezi3P1XeLWBk7EwEOqtsud/94nPUvk0Y0zkY6jRKyL2o3q
         ddNowhlWMcnEsGWdh129zSqMAxqgXeibhSmyI2s+ZPVUXlIYgnFBLyO/1QgFAgLHlebR
         JSlRctT5V+6dEvySUz34moyyLEri0L+ERZfPZfjHH5dvst/HJ67V921a8+kR+vKtIBvo
         qe0g==
X-Gm-Message-State: AOJu0YyOKOvUibew7NwZauVncD/dlVDqR4FKpYlrJkU0yA5kVkVEJT2o
	680KEI6tOmVUa5y2s5yplBg=
X-Google-Smtp-Source: AGHT+IGHLnABm96FdDRUcT50m1IX58j6HqwLhDE/W1lxdQtnCSL26QzqbxI+re/ZCl4UzGIAe5nrRQ==
X-Received: by 2002:a05:620a:248a:b0:76e:f5c5:1bac with SMTP id i10-20020a05620a248a00b0076ef5c51bacmr19230155qkn.48.1694024495823;
        Wed, 06 Sep 2023 11:21:35 -0700 (PDT)
From: Jason Andryuk <jandryuk@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	stable@vger.kernel.org,
	Jason Andryuk <jandryuk@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2] acpi/processor: sanitize _PDC buffer bits when running as Xen dom0
Date: Wed,  6 Sep 2023 14:21:23 -0400
Message-ID: <20230906182125.48642-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monne <roger.pau@citrix.com>

The Processor _PDC buffer bits notify ACPI of the OS capabilities, and
so ACPI can adjust the return of other Processor methods taking the OS
capabilities into account.

When Linux is running as a Xen dom0, it's the hypervisor the entity
in charge of processor power management, and hence Xen needs to make
sure the capabilities reported in the _PDC buffer match the
capabilities of the driver in Xen.

Introduce a small helper to sanitize the buffer when running as Xen
dom0.

When Xen supports HWP, this serves as the equivalent of commit
a21211672c9a ("ACPI / processor: Request native thermal interrupt
handling via _OSC") to avoid SMM crashes.  Xen will set bit 12 in the
_PDC bits and the _PDC call will apply it.

[ jandryuk: Mention Xen HWP's need.  Move local variables ]
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Cc: stable@vger.kernel.org
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
---
v2:
Move local variables in acpi_processor_eval_pdc() to reuse in both conditions.
---
 arch/x86/include/asm/xen/hypervisor.h |  6 ++++++
 arch/x86/xen/enlighten.c              | 19 +++++++++++++++++++
 drivers/acpi/processor_pdc.c          | 22 ++++++++++++++++------
 3 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index 5fc35f889cd1..0f88a7e450d3 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -63,4 +63,10 @@ void __init xen_pvh_init(struct boot_params *boot_params);
 void __init mem_map_via_hcall(struct boot_params *boot_params_p);
 #endif
 
+#ifdef CONFIG_XEN_DOM0
+void xen_sanitize_pdc(uint32_t *buf);
+#else
+static inline void xen_sanitize_pdc(uint32_t *buf) { BUG(); }
+#endif
+
 #endif /* _ASM_X86_XEN_HYPERVISOR_H */
diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index b8db2148c07d..9f7fc11330a3 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -346,3 +346,22 @@ void xen_arch_unregister_cpu(int num)
 }
 EXPORT_SYMBOL(xen_arch_unregister_cpu);
 #endif
+
+#ifdef CONFIG_XEN_DOM0
+void xen_sanitize_pdc(uint32_t *buf)
+{
+	struct xen_platform_op op = {
+		.cmd			= XENPF_set_processor_pminfo,
+		.interface_version	= XENPF_INTERFACE_VERSION,
+		.u.set_pminfo.id	= -1,
+		.u.set_pminfo.type	= XEN_PM_PDC,
+	};
+	int ret;
+
+	set_xen_guest_handle(op.u.set_pminfo.pdc, buf);
+	ret = HYPERVISOR_platform_op(&op);
+	if (ret)
+		pr_info("sanitize of _PDC buffer bits from Xen failed: %d\n",
+		        ret);
+}
+#endif
diff --git a/drivers/acpi/processor_pdc.c b/drivers/acpi/processor_pdc.c
index 18fb04523f93..9393dd4a3158 100644
--- a/drivers/acpi/processor_pdc.c
+++ b/drivers/acpi/processor_pdc.c
@@ -122,6 +122,11 @@ static acpi_status
 acpi_processor_eval_pdc(acpi_handle handle, struct acpi_object_list *pdc_in)
 {
 	acpi_status status = AE_OK;
+	union acpi_object *obj;
+	u32 *buffer = NULL;
+
+	obj = pdc_in->pointer;
+	buffer = (u32 *)(obj->buffer.pointer);
 
 	if (boot_option_idle_override == IDLE_NOMWAIT) {
 		/*
@@ -129,14 +134,19 @@ acpi_processor_eval_pdc(acpi_handle handle, struct acpi_object_list *pdc_in)
 		 * mode will be disabled in the parameter of _PDC object.
 		 * Of course C1_FFH access mode will also be disabled.
 		 */
-		union acpi_object *obj;
-		u32 *buffer = NULL;
-
-		obj = pdc_in->pointer;
-		buffer = (u32 *)(obj->buffer.pointer);
 		buffer[2] &= ~(ACPI_PDC_C_C2C3_FFH | ACPI_PDC_C_C1_FFH);
-
 	}
+
+	if (xen_initial_domain()) {
+		/*
+		 * When Linux is running as Xen dom0, the hypervisor is the
+		 * entity in charge of the processor power management, and so
+		 * Xen needs to check the OS capabilities reported in the _PDC
+		 * buffer matches what the hypervisor driver supports.
+		 */
+		xen_sanitize_pdc(buffer);
+	}
+
 	status = acpi_evaluate_object(handle, "_PDC", pdc_in, NULL);
 
 	if (ACPI_FAILURE(status))
-- 
2.41.0


