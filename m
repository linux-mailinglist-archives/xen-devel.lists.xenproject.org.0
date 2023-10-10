Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB5E7C02DC
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 19:40:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615138.956364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqGhy-0006wR-1K; Tue, 10 Oct 2023 17:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615138.956364; Tue, 10 Oct 2023 17:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqGhx-0006u5-Ul; Tue, 10 Oct 2023 17:39:49 +0000
Received: by outflank-mailman (input) for mailman id 615138;
 Tue, 10 Oct 2023 17:39:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6vZW=FY=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qqGhw-0006tz-64
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 17:39:48 +0000
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [2607:f8b0:4864:20::b2d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ffd1852f-6793-11ee-9b0d-b553b5be7939;
 Tue, 10 Oct 2023 19:39:45 +0200 (CEST)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-d81f079fe73so6918908276.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Oct 2023 10:39:45 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 y8-20020a0cf148000000b00655d711180dsm4930073qvl.17.2023.10.10.10.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 10:39:43 -0700 (PDT)
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
X-Inumbo-ID: ffd1852f-6793-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696959584; x=1697564384; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/yA30J39p3R+cEj+Qw2hre1tLrE/L7D+ruLEDIk3qM=;
        b=Afmt1xi1btPRr5v9DbzTDcbJIPAmL4HsP5M59dg+FA65TughyXv4hmLSo0AVejZREn
         ziz1hJLQ2b3AjqVCqgP7ydFtUKcCyVbonChUy9YJSXkKagdp7541A3U4UCWVs2VcX6dI
         m1Nu41FV1IeIoV1vnpBZhd81/G3DosbjfbJjQz/v6PO9wPFvcmO0vKRbX+akMCHkuqyz
         LgVHCaS9OiocABxQfmlMedD08NQWhgvnN2pH1U74H2gQeQUmPWXDjRh71c2K2ROkPCZY
         7BHKix/W8lO3F5+rgOBw6nNjwK3pOXkjhVFFtdLeN6i+Poedd1DkVsTPoRqpKsDY4+Wh
         HRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696959584; x=1697564384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/yA30J39p3R+cEj+Qw2hre1tLrE/L7D+ruLEDIk3qM=;
        b=hGvXzLvgFTi+e82l8MZ5s1NNnjCP6XODtd1HLAsbymUJ6CSeHDhYBccHjhRf5Y1GCk
         XXA2SKJWbvDAXiRD4uSDktcGwNNClaZLqKF6suiIpxgnuC/d6l8r0cQpLsTzEdPiMWf4
         DZUvVN34U7jRXtsDanCq39/b2c1eKWpctqf8t0dkuY9DYXhtx9xrczinpsG0l8qq+nSY
         iBkVyaB/h5LzMGeTfPhXhGvSn37R45kwTVHimw845ai6fARgIkd7b3UHUP1/uBNnA/5d
         Iob3Fu3ZZ21/Ku4VO+v62DAcsK9IMo3jFDOtHZ4fAZPQBLshs4VGocD8MmlM2yEgbvom
         WOmA==
X-Gm-Message-State: AOJu0YygsIjkj+TCfdYQt18LlQKLP2Voysk20e/syyjz9pNd61Lr83m3
	NnkElLQVSTGB8SuecGtqXQ8=
X-Google-Smtp-Source: AGHT+IH2Qw4C8iG+DuwqBgGLWMpC8w2kEty6i3xOSJxBWfFTL8DaOHH5TvMD6QyQeRt0Ruy2GjA4Ww==
X-Received: by 2002:a5b:a50:0:b0:d97:213b:4775 with SMTP id z16-20020a5b0a50000000b00d97213b4775mr10865311ybq.34.1696959583666;
        Tue, 10 Oct 2023 10:39:43 -0700 (PDT)
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
Subject: [PATCH v3] acpi/processor: sanitize _OSC/_PDC capabilities for Xen dom0
Date: Tue, 10 Oct 2023 13:39:22 -0400
Message-ID: <20231010173924.44167-1-jandryuk@gmail.com>
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
---
v3:
Move xen_sanitize_pdc() call to arch_acpi_set_proc_cap_bits() to cover
_OSC and _PDC.
drivers/xen/pcpu.c is CONFIG_DOM0 && CONFIG_X86

v2:
Move local variables in acpi_processor_eval_pdc() to reuse in both conditions.
---
 arch/x86/include/asm/acpi.h           | 13 +++++++++++++
 arch/x86/include/asm/xen/hypervisor.h |  9 +++++++++
 drivers/xen/pcpu.c                    | 21 +++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/x86/include/asm/acpi.h b/arch/x86/include/asm/acpi.h
index c8a7fc23f63c..cc8d1669d6e8 100644
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
@@ -127,6 +130,16 @@ static inline void arch_acpi_set_proc_cap_bits(u32 *cap)
 	if (!cpu_has(c, X86_FEATURE_MWAIT) ||
 	    boot_option_idle_override == IDLE_NOMWAIT)
 		*cap &= ~(ACPI_PROC_CAP_C_C1_FFH | ACPI_PROC_CAP_C_C2C3_FFH);
+
+	if (xen_initial_domain()) {
+		/*
+		 * When Linux is running as Xen dom0, the hypervisor is the
+		 * entity in charge of the processor power management, and so
+		 * Xen needs to check the OS capabilities reported in the _PDC
+		 * buffer matches what the hypervisor driver supports.
+		 */
+		xen_sanitize_pdc(cap);
+	}
 }
 
 static inline bool acpi_has_cpu_in_madt(void)
diff --git a/arch/x86/include/asm/xen/hypervisor.h b/arch/x86/include/asm/xen/hypervisor.h
index 7048dfacc04b..c6c2f174fa30 100644
--- a/arch/x86/include/asm/xen/hypervisor.h
+++ b/arch/x86/include/asm/xen/hypervisor.h
@@ -100,4 +100,13 @@ static inline void leave_lazy(enum xen_lazy_mode mode)
 
 enum xen_lazy_mode xen_get_lazy_mode(void);
 
+#if defined(CONFIG_XEN_DOM0) && defined(CONFIG_ACPI)
+void xen_sanitize_pdc(uint32_t *buf);
+#else
+static inline void xen_sanitize_pdc(uint32_t *buf)
+{
+	BUG();
+}
+#endif
+
 #endif /* _ASM_X86_XEN_HYPERVISOR_H */
diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
index b3e3d1bb37f3..859bb6027105 100644
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
@@ -400,4 +403,22 @@ bool __init xen_processor_present(uint32_t acpi_id)
 
 	return online;
 }
+
+void xen_sanitize_pdc(uint32_t *cap)
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
+		pr_info("sanitize of _PDC buffer bits from Xen failed: %d\n",
+			ret);
+	*cap = buf[2];
+}
 #endif
-- 
2.41.0


