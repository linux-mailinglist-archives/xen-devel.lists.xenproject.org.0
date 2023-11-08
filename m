Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C714D7E5FEF
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 22:27:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629416.981665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0q3U-0007sT-8F; Wed, 08 Nov 2023 21:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629416.981665; Wed, 08 Nov 2023 21:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0q3U-0007pm-5D; Wed, 08 Nov 2023 21:25:44 +0000
Received: by outflank-mailman (input) for mailman id 629416;
 Wed, 08 Nov 2023 21:25:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EIED=GV=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1r0q3T-0007pg-Im
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 21:25:43 +0000
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com
 [2607:f8b0:4864:20::832])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e2fd722-7e7d-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 22:25:41 +0100 (CET)
Received: by mail-qt1-x832.google.com with SMTP id
 d75a77b69052e-41cd4cc515fso1154981cf.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Nov 2023 13:25:41 -0800 (PST)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 j14-20020ac85c4e000000b004181138e0c0sm1299644qtj.31.2023.11.08.13.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Nov 2023 13:25:39 -0800 (PST)
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
X-Inumbo-ID: 5e2fd722-7e7d-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699478740; x=1700083540; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RZ7VQVWmywUCJj8m+Y7uBiNQefyfO/uFLoxjMz4m8no=;
        b=JutHv2t7rYU7EGbsVJYIlV/DcQWaz2GlhonL+g3IkqKS5cKTiin93xuzV1I/iwVWSp
         OjNnSldo+d6IfZXjJbNmhUDqVjgt3K1G/dPw8v0GZP91heqnlGXqAc6SgwNdpdOEMN9i
         k8p/WXf/JEb0H6Lg+l682bdD8WAZh9Oh6M6X1dp4XN5n9TgAfJgmvrwQ7KaSNJf7JztR
         ftrZafHnJRRzF4VX7Fr0hWIWOqA63IF3hisuir8avbVRaN7FUj5CGVPe3SYmrneSf738
         Gif/482sIZs/M96rhIneJor0UPNZyR1ztpEVL5RR4Ohi4W/oUucBVxV7yjKivoVafPci
         2pDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699478740; x=1700083540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZ7VQVWmywUCJj8m+Y7uBiNQefyfO/uFLoxjMz4m8no=;
        b=qqrWsQX6l9U3A0H+nK1OAtqf4bzpy/oEuoyPJyAlizN+4gwT0AqTOZMEeIam1V6pfk
         Cqtp1r9jWDm0xKmTqTSJq/+n38d6PLI0sRaW2y9BWu8PjZUL2z66e50JcQz7JdZyiC9q
         kx+MTDzFoUZiUP2jYlvi9mnIzTD3AQ5pB2z7KIUzKP9WJiCv8Na2dW0ln6KLgzCXp9Ij
         BPVD6t+yiVxLhVTALDxEj24iiDFe6DsQe7Jl8qhgff/6aUnwb1Av0hid9c7c8w8dU/ho
         f6liWl1QzKyJHEpJwqDM9UG0vAboRe9IivfRO8pbI7xbh+VLW9Z2QATykBBG8GZZFbBE
         S5eg==
X-Gm-Message-State: AOJu0YzBukt7SzcBQBa02dSZfOsS3j4yJD5j29OAPqpmPNZNRX4Xq7b5
	clttUT+1IEoxTEs8McN5+Vk=
X-Google-Smtp-Source: AGHT+IGjh5dBkGk6kw7u8KR2u2/K+crTHBl7T3vYG8QHmAVbTYadRWnd6zJ87hdm9CvDrMW6i+kbAg==
X-Received: by 2002:a05:622a:170a:b0:418:1084:1e1 with SMTP id h10-20020a05622a170a00b00418108401e1mr3687242qtk.57.1699478740620;
        Wed, 08 Nov 2023 13:25:40 -0800 (PST)
From: Jason Andryuk <jandryuk@gmail.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: michal.wilczynski@intel.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	stable@vger.kernel.org,
	Jason Andryuk <jandryuk@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Subject: [PATCH v5] acpi/processor: sanitize _OSC/_PDC capabilities for Xen dom0
Date: Wed,  8 Nov 2023 16:25:15 -0500
Message-ID: <20231108212517.72279-1-jandryuk@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Roger Pau Monne <roger.pau@citrix.com>

The Processor capability bits notify ACPI of the OS capabilities, and
so ACPI can adjust the return of other Processor methods taking the OS
capabilities into account.

When Linux is running as a Xen dom0, the hypervisor is the entity
in charge of processor power management, and hence Xen needs to make
sure the capabilities reported by _OSC/_PDC match the capabilities of
the driver in Xen.

Introduce a small helper to sanitize the buffer when running as Xen
dom0.

When Xen supports HWP, this serves as the equivalent of commit
a21211672c9a ("ACPI / processor: Request native thermal interrupt
handling via _OSC") to avoid SMM crashes.  Xen will set bit
ACPI_PROC_CAP_COLLAB_PROC_PERF (bit 12) in the capability bits and the
_OSC/_PDC call will apply it.

[ jandryuk: Mention Xen HWP's need.  Support _OSC & _PDC ]
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Cc: stable@vger.kernel.org
Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
Reviewed-by: Michal Wilczynski <michal.wilczynski@intel.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v5:
Only update caps on hypercall success - Roger
Add Juergen & Michal Reviewed-by: - hopefully okay with above change

v4:
Use xen_santize_proc_cap_bits() name - Michal
Rephrase comment - Michal

v3:
Move xen_sanitize_pdc() call to arch_acpi_set_proc_cap_bits() to cover
_OSC and _PDC.
drivers/xen/pcpu.c is CONFIG_DOM0 && CONFIG_X86

v2:
Move local variables in acpi_processor_eval_pdc() to reuse in both conditions.
---
 arch/x86/include/asm/acpi.h           | 14 ++++++++++++++
 arch/x86/include/asm/xen/hypervisor.h |  9 +++++++++
 drivers/xen/pcpu.c                    | 22 ++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index c8a7fc23f63c..f896eed4516c 100644
--- a/arch/x86/include/asm/acpi.h
+++ b/arch/x86/include/asm/acpi.h
@@ -16,6 +16,9 @@
 #include <asm/x86_init.h>
 #include <asm/cpufeature.h>
 #include <asm/irq_vectors.h>
+#include <asm/xen/hypervisor.h>
+
+#include <xen/xen.h>
 
 #ifdef CONFIG_ACPI_APEI
 # include <asm/pgtable_types.h>
@@ -127,6 +130,17 @@ static inline void arch_acpi_set_proc_cap_bits(u32 *cap)
 	if (!cpu_has(c, X86_FEATURE_MWAIT) ||
 	    boot_option_idle_override == IDLE_NOMWAIT)
 		*cap &= ~(ACPI_PROC_CAP_C_C1_FFH | ACPI_PROC_CAP_C_C2C3_FFH);
+
+	if (xen_initial_domain()) {
+		/*
+		 * When Linux is running as Xen dom0, the hypervisor is the
+		 * entity in charge of the processor power management, and so
+		 * Xen needs to check the OS capabilities reported in the
+		 * processor capabilities buffer matches what the hypervisor
+		 * driver supports.
+		 */
+		xen_sanitize_proc_cap_bits(cap);
+	}
 }
 
 static inline bool acpi_has_cpu_in_madt(void)
diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index 7048dfacc04b..a9088250770f 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -100,4 +100,13 @@ static inline void leave_lazy(enum xen_lazy_mode mode)
 
 enum xen_lazy_mode xen_get_lazy_mode(void);
 
+#if defined(CONFIG_XEN_DOM0) && defined(CONFIG_ACPI)
+void xen_sanitize_proc_cap_bits(uint32_t *buf);
+#else
+static inline void xen_sanitize_proc_cap_bits(uint32_t *buf)
+{
+	BUG();
+}
+#endif
+
 #endif /* _ASM_X86_XEN_HYPERVISOR_H */
diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
index b3e3d1bb37f3..508655273145 100644
--- a/drivers/xen/pcpu.c
+++ b/drivers/xen/pcpu.c
@@ -47,6 +47,9 @@
 #include <asm/xen/hypervisor.h>
 #include <asm/xen/hypercall.h>
 
+#ifdef CONFIG_ACPI
+#include <acpi/processor.h>
+#endif
 
 /*
  * @cpu_id: Xen physical cpu logic number
@@ -400,4 +403,23 @@ bool __init xen_processor_present(uint32_t acpi_id)
 
 	return online;
 }
+
+void xen_sanitize_proc_cap_bits(uint32_t *cap)
+{
+	struct xen_platform_op op = {
+		.cmd			= XENPF_set_processor_pminfo,
+		.u.set_pminfo.id	= -1,
+		.u.set_pminfo.type	= XEN_PM_PDC,
+	};
+	u32 buf[3] = { ACPI_PDC_REVISION_ID, 1, *cap };
+	int ret;
+
+	set_xen_guest_handle(op.u.set_pminfo.pdc, buf);
+	ret = HYPERVISOR_platform_op(&op);
+	if (ret)
+		pr_err("sanitize of _PDC buffer bits from Xen failed: %d\n",
+		       ret);
+	else
+		*cap = buf[2];
+}
 #endif
-- 
2.41.0


