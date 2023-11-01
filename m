Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C85657DE1B8
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 14:42:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626500.976773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyBTz-0000BF-Fw; Wed, 01 Nov 2023 13:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626500.976773; Wed, 01 Nov 2023 13:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyBTz-00008g-Ce; Wed, 01 Nov 2023 13:42:07 +0000
Received: by outflank-mailman (input) for mailman id 626500;
 Wed, 01 Nov 2023 13:42:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=R8ij=GO=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1qyBTx-00008a-UL
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 13:42:05 +0000
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [2607:f8b0:4864:20::735])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 70e6cac0-78bc-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 14:42:04 +0100 (CET)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-778af1b5b1eso465201085a.2
 for <xen-devel@lists.xenproject.org>; Wed, 01 Nov 2023 06:42:04 -0700 (PDT)
Received: from pm2-ws13.praxislan02.com
 (207-172-141-204.s8906.c3-0.slvr-cbr1.lnh-slvr.md.cable.rcncustomer.com.
 [207.172.141.204]) by smtp.gmail.com with ESMTPSA id
 y24-20020a37e318000000b00767d6ec578csm1435758qki.20.2023.11.01.06.42.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 06:42:02 -0700 (PDT)
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
X-Inumbo-ID: 70e6cac0-78bc-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698846123; x=1699450923; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5nQo5QAmg18pLngnuIRNmy7fqh3tLqP/m6ROg4gk6+E=;
        b=JC+bGT9FqHyJl9ejZrLZdRe8CLQY5Mw/pm86XRBHkTrqICUTWum6IsiDBA6enMEs64
         rzgMg4RLu+vuSN4RaF2KMO7kZXY+x3XOorxOd990yKNeHTsWHFzkZfg1a/wYs6QWESCt
         1C2xr1BtKz5CltCC1kVx43xdRm55VOs7TVyXymzaDtbJejic0kfBx/dZ9nRXE8er8ttu
         lRmY0y5AOPEscT5Orjlb/39xiG0FFekD5TWQSZoQa1aGCnF0hYv2BD8fSKdy7VB0nLAC
         IEfw0jMwgilh+ygaeqXZhv0fMclMJHXl57+zx8lDZMy9oqBrPQf6XvTQ4CM+Z8Y2A3VF
         e1hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698846123; x=1699450923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nQo5QAmg18pLngnuIRNmy7fqh3tLqP/m6ROg4gk6+E=;
        b=M3EuuzqitP0g84a2+2prdiyIZGI7EtBoRzndQfZwCHIpQCaM0hwBypD4udxMe1IG4q
         YBqhmCCPjDS4Me8Fk/qaXA0jjaJU0p1Og6H+2KZAvlg4Cmj4HXpq1wj9TkwSrbxLyIsp
         WM4sT6j1bUiq687Pu8bmwma1AiVYeKVRgg6BzB1aCP3y1zbX7yPu00abhtxvjtI/rzvA
         vUp2Umewi6bsx2Cwr70rWaJbtr5jL+6QbqeGHfxXW9BOSOkGcbcYso5LCEe8xRgPhyEo
         oDS+99TB0u/TWB2tdZqjBUCjESuAgPv0S7Fw5Oa76NDEE7Uveyco8TJGqHsU/qKy/j9k
         l+iw==
X-Gm-Message-State: AOJu0YzB6/kas7uA9dTfUdIhNejIfIaiNRHTKInezLklmdp6X3LYzvw6
	eNtgM6TFXoRNUpnTsWxqS1Y=
X-Google-Smtp-Source: AGHT+IGFKvgB4JFJWNM7MuiXcvAJMvG91K9x/Ey1AKCZT8LeTf2DTYrE5N72zByeJa9VrrfrODcTxQ==
X-Received: by 2002:a05:620a:2687:b0:76f:2214:e2c3 with SMTP id c7-20020a05620a268700b0076f2214e2c3mr17147730qkp.64.1698846123326;
        Wed, 01 Nov 2023 06:42:03 -0700 (PDT)
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
Subject: [PATCH v4] acpi/processor: sanitize _OSC/_PDC capabilities for Xen dom0
Date: Wed,  1 Nov 2023 09:41:52 -0400
Message-ID: <20231101134154.18336-1-jandryuk@gmail.com>
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
 drivers/xen/pcpu.c                    | 21 +++++++++++++++++++++
 3 files changed, 44 insertions(+)

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
index b3e3d1bb37f3..7000701dff8f 100644
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
+	*cap = buf[2];
+}
 #endif
-- 
2.41.0


