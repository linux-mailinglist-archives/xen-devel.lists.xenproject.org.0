Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0AF98FED5
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 10:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810085.1222724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVF-0005sK-1j; Fri, 04 Oct 2024 08:17:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810085.1222724; Fri, 04 Oct 2024 08:17:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swdVE-0005oB-SI; Fri, 04 Oct 2024 08:17:32 +0000
Received: by outflank-mailman (input) for mailman id 810085;
 Fri, 04 Oct 2024 08:17:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=njpt=RA=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1swdVD-0005Vm-7m
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 08:17:31 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 182a8205-8229-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 10:17:28 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2fad784e304so23629411fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 01:17:28 -0700 (PDT)
Received: from fziglio-desktop.. ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a99102858a4sm189829366b.49.2024.10.04.01.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 01:17:26 -0700 (PDT)
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
X-Inumbo-ID: 182a8205-8229-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1728029847; x=1728634647; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pxANqrtnn+Jr20AColkGK04OoedxN3PRTLF8D5KxOTk=;
        b=ciWD8DALsebQajqAEg8hxd0nG53uFnJCYirh5e38auBe9FQSeNawOv6Pb4hRTLkJXw
         IrLMLwWUxSGPq7sVQVahntwMD9MxpudAuYIbBJfZDpzwnlxjtsmRvyxZXSzywEUee0Q3
         rYaH43MdNpFx02FCWDpYNKsN0t/mXNZd1SR9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728029847; x=1728634647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pxANqrtnn+Jr20AColkGK04OoedxN3PRTLF8D5KxOTk=;
        b=iW6cMVIXZpZKZPFYDO3CQG4Qb9AtkAoY7B0gRD2MAd9+R0TSsQ87azZyepoAFVYsI+
         K4vogYiAKyELGWpqa2z4Cyb3LH9WnXMcAVpiCpK9T5/xoXxZNqVAp/6QcIV4nR5TG9AK
         UlqCYRz38vAp46NWT87hhX8kLCSyXxxVk2mltfktoSi5ElM1EnXvHhHunBNfENWDz4kK
         4sCRaC3ZSOd0DdBcTzZr05kUoSJfJl5EbGbOPmwvrJXOqUw4A58yHQFN4eV6V3OeaRgy
         DueFFfhyAOMFkwujoZy3TUqVkyUPfE1CXi210LuLpuTuyZNrI82G1d87eUyUxD2B3ueg
         I9Qw==
X-Gm-Message-State: AOJu0YyvGYpZgMtjeS+qK7MelwoHQdPz7jIbzKXvJzi1c+fP7RUZS8Xy
	Ff5MH6dB5gJt4neQ5RK5pkqGm9AolOq4/+xNATxUVuD4ljyqRi4lZs3IuxobvwHlGhO8Mqb0u6k
	0
X-Google-Smtp-Source: AGHT+IFTuTJa8dFDcCu0qANbNDY613R1eUcHlzI9sgDMr36tI6Fo+izBjlc5thFJCzDgCF9QwZoUxQ==
X-Received: by 2002:a05:6512:104b:b0:530:aa3e:f3c with SMTP id 2adb3069b0e04-539ab87476dmr1074034e87.14.1728029847268;
        Fri, 04 Oct 2024 01:17:27 -0700 (PDT)
From: Frediano Ziglio <frediano.ziglio@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 03/19] xen: Update header guards - ACPI
Date: Fri,  4 Oct 2024 09:16:57 +0100
Message-Id: <20241004081713.749031-4-frediano.ziglio@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241004081713.749031-1-frediano.ziglio@cloud.com>
References: <20241004081713.749031-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated headers related to ACPI.

Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
---
 xen/drivers/acpi/apei/apei-internal.h     | 4 ++--
 xen/include/acpi/acconfig.h               | 6 +++---
 xen/include/acpi/acexcep.h                | 6 +++---
 xen/include/acpi/acglobal.h               | 6 +++---
 xen/include/acpi/achware.h                | 6 +++---
 xen/include/acpi/aclocal.h                | 6 +++---
 xen/include/acpi/acmacros.h               | 4 ++--
 xen/include/acpi/acnames.h                | 6 +++---
 xen/include/acpi/acoutput.h               | 6 +++---
 xen/include/acpi/acpi.h                   | 6 +++---
 xen/include/acpi/acpiosxf.h               | 6 +++---
 xen/include/acpi/acpixf.h                 | 6 +++---
 xen/include/acpi/actables.h               | 6 +++---
 xen/include/acpi/actbl.h                  | 6 +++---
 xen/include/acpi/actbl1.h                 | 6 +++---
 xen/include/acpi/actbl2.h                 | 6 +++---
 xen/include/acpi/actbl3.h                 | 6 +++---
 xen/include/acpi/actypes.h                | 6 +++---
 xen/include/acpi/acutils.h                | 6 +++---
 xen/include/acpi/apei.h                   | 4 ++--
 xen/include/acpi/cpufreq/cpufreq.h        | 6 +++---
 xen/include/acpi/cpufreq/processor_perf.h | 6 +++---
 xen/include/acpi/pdc_intel.h              | 6 +++---
 xen/include/acpi/platform/acenv.h         | 6 +++---
 xen/include/acpi/platform/acgcc.h         | 6 +++---
 xen/include/acpi/platform/aclinux.h       | 6 +++---
 26 files changed, 75 insertions(+), 75 deletions(-)

diff --git a/xen/drivers/acpi/apei/apei-internal.h b/xen/drivers/acpi/apei/apei-internal.h
index 90233077b7..8a5ed3fc33 100644
--- a/xen/drivers/acpi/apei/apei-internal.h
+++ b/xen/drivers/acpi/apei/apei-internal.h
@@ -3,8 +3,8 @@
  * definations.
  */
 
-#ifndef APEI_INTERNAL_H
-#define APEI_INTERNAL_H
+#ifndef DRIVERS__ACPI__APEI__APEI_INTERNAL_H
+#define DRIVERS__ACPI__APEI__APEI_INTERNAL_H
 
 struct apei_exec_context;
 
diff --git a/xen/include/acpi/acconfig.h b/xen/include/acpi/acconfig.h
index 422f29c06c..f5b5192c46 100644
--- a/xen/include/acpi/acconfig.h
+++ b/xen/include/acpi/acconfig.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef _ACCONFIG_H
-#define _ACCONFIG_H
+#ifndef ACPI__ACCONFIG_H
+#define ACPI__ACCONFIG_H
 
 /******************************************************************************
  *
@@ -203,4 +203,4 @@
 #define ACPI_DEBUGGER_COMMAND_PROMPT    '-'
 #define ACPI_DEBUGGER_EXECUTE_PROMPT    '%'
 
-#endif				/* _ACCONFIG_H */
+#endif				/* ACPI__ACCONFIG_H */
diff --git a/xen/include/acpi/acexcep.h b/xen/include/acpi/acexcep.h
index 5d9f4841d2..455c4fe982 100644
--- a/xen/include/acpi/acexcep.h
+++ b/xen/include/acpi/acexcep.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACEXCEP_H__
-#define __ACEXCEP_H__
+#ifndef ACPI__ACEXCEP_H
+#define ACPI__ACEXCEP_H
 
 /*
  * Exceptions returned by external ACPI interfaces
@@ -300,4 +300,4 @@ char const *__initdata acpi_gbl_exception_names_ctrl[] = {
 
 #endif				/* ACPI GLOBALS */
 
-#endif				/* __ACEXCEP_H__ */
+#endif				/* ACPI__ACEXCEP_H */
diff --git a/xen/include/acpi/acglobal.h b/xen/include/acpi/acglobal.h
index c2a96097b9..96fb14d793 100644
--- a/xen/include/acpi/acglobal.h
+++ b/xen/include/acpi/acglobal.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACGLOBAL_H__
-#define __ACGLOBAL_H__
+#ifndef ACPI__ACGLOBAL_H
+#define ACPI__ACGLOBAL_H
 
 /*
  * Ensure that the globals are actually defined and initialized only once.
@@ -110,4 +110,4 @@ extern char const *acpi_gbl_exception_names_ctrl[];
 extern struct acpi_bit_register_info
     acpi_gbl_bit_register_info[ACPI_NUM_BITREG];
 
-#endif				/* __ACGLOBAL_H__ */
+#endif				/* ACPI__ACGLOBAL_H */
diff --git a/xen/include/acpi/achware.h b/xen/include/acpi/achware.h
index 7433fb47ac..6257ae4cd4 100644
--- a/xen/include/acpi/achware.h
+++ b/xen/include/acpi/achware.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACHWARE_H__
-#define __ACHWARE_H__
+#ifndef ACPI__ACHWARE_H
+#define ACPI__ACHWARE_H
 
 /*
  * hwregs - ACPI Register I/O
@@ -59,4 +59,4 @@ acpi_hw_low_level_read(u32 width,
 acpi_status
 acpi_hw_low_level_write(u32 width, u32 value, struct acpi_generic_address *reg);
 
-#endif				/* __ACHWARE_H__ */
+#endif				/* ACPI__ACHWARE_H */
diff --git a/xen/include/acpi/aclocal.h b/xen/include/acpi/aclocal.h
index 16e234f0de..38369db497 100644
--- a/xen/include/acpi/aclocal.h
+++ b/xen/include/acpi/aclocal.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACLOCAL_H__
-#define __ACLOCAL_H__
+#ifndef ACPI__ACLOCAL_H
+#define ACPI__ACLOCAL_H
 
 /* acpisrc:struct_defs -- for acpisrc conversion */
 
@@ -204,4 +204,4 @@ struct acpi_bit_register_info {
 #define ACPI_ADDRESS_TYPE_IO_RANGE              1
 #define ACPI_ADDRESS_TYPE_BUS_NUMBER_RANGE      2
 
-#endif				/* __ACLOCAL_H__ */
+#endif				/* ACPI__ACLOCAL_H */
diff --git a/xen/include/acpi/acmacros.h b/xen/include/acpi/acmacros.h
index 86c503c20f..0f60a07594 100644
--- a/xen/include/acpi/acmacros.h
+++ b/xen/include/acpi/acmacros.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACMACROS_H__
-#define __ACMACROS_H__
+#ifndef ACPI__ACMACROS_H
+#define ACPI__ACMACROS_H
 
 /*
  * Data manipulation macros
diff --git a/xen/include/acpi/acnames.h b/xen/include/acpi/acnames.h
index 34bfae8a05..f85d3341fb 100644
--- a/xen/include/acpi/acnames.h
+++ b/xen/include/acpi/acnames.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACNAMES_H__
-#define __ACNAMES_H__
+#ifndef ACPI__ACNAMES_H
+#define ACPI__ACNAMES_H
 
 /* Method names - these methods can appear anywhere in the namespace */
 
@@ -80,4 +80,4 @@
 #define ACPI_NS_ROOT_PATH       "\\"
 #define ACPI_NS_SYSTEM_BUS      "_SB_"
 
-#endif				/* __ACNAMES_H__  */
+#endif				/* ACPI__ACNAMES_H  */
diff --git a/xen/include/acpi/acoutput.h b/xen/include/acpi/acoutput.h
index c090a8b0bc..7a0283894b 100644
--- a/xen/include/acpi/acoutput.h
+++ b/xen/include/acpi/acoutput.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACOUTPUT_H__
-#define __ACOUTPUT_H__
+#ifndef ACPI__ACOUTPUT_H
+#define ACPI__ACOUTPUT_H
 
 /*
  * Debug levels and component IDs.  These are used to control the
@@ -182,4 +182,4 @@
 #define ACPI_NORMAL_DEFAULT         (ACPI_LV_INIT | ACPI_LV_WARN | ACPI_LV_ERROR)
 #define ACPI_DEBUG_ALL              (ACPI_LV_AML_DISASSEMBLE | ACPI_LV_ALL_EXCEPTIONS | ACPI_LV_ALL)
 
-#endif				/* __ACOUTPUT_H__ */
+#endif				/* ACPI__ACOUTPUT_H */
diff --git a/xen/include/acpi/acpi.h b/xen/include/acpi/acpi.h
index c852701ff2..f922fd8556 100644
--- a/xen/include/acpi/acpi.h
+++ b/xen/include/acpi/acpi.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACPI_H__
-#define __ACPI_H__
+#ifndef ACPI__ACPI_H
+#define ACPI__ACPI_H
 
 #define PREFIX			"ACPI: "
 
@@ -66,4 +66,4 @@
 #include "achware.h"		/* Hardware defines and interfaces */
 #include "acutils.h"		/* Utility interfaces */
 
-#endif				/* __ACPI_H__ */
+#endif				/* ACPI__ACPI_H */
diff --git a/xen/include/acpi/acpiosxf.h b/xen/include/acpi/acpiosxf.h
index de83ea38c4..6264a727d3 100644
--- a/xen/include/acpi/acpiosxf.h
+++ b/xen/include/acpi/acpiosxf.h
@@ -44,8 +44,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACPIOSXF_H__
-#define __ACPIOSXF_H__
+#ifndef ACPI__ACPIOSXF_H
+#define ACPI__ACPIOSXF_H
 
 #include "platform/acenv.h"
 #include "actypes.h"
@@ -86,4 +86,4 @@ void ACPI_INTERNAL_VAR_XFACE acpi_os_printf(const char *format, ...);
 
 void acpi_os_vprintf(const char *format, va_list args);
 
-#endif				/* __ACPIOSXF_H__ */
+#endif				/* ACPI__ACPIOSXF_H */
diff --git a/xen/include/acpi/acpixf.h b/xen/include/acpi/acpixf.h
index 8b70154b8f..64373a3472 100644
--- a/xen/include/acpi/acpixf.h
+++ b/xen/include/acpi/acpixf.h
@@ -42,8 +42,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACXFACE_H__
-#define __ACXFACE_H__
+#ifndef ACPI__ACPIXF_H
+#define ACPI__ACPIXF_H
 
 #include "actypes.h"
 #include "actbl.h"
@@ -116,4 +116,4 @@ acpi_status acpi_leave_sleep_state_prep(u8 sleep_state);
 
 acpi_status acpi_leave_sleep_state(u8 sleep_state);
 
-#endif				/* __ACXFACE_H__ */
+#endif				/* ACPI__ACPIXF_H */
diff --git a/xen/include/acpi/actables.h b/xen/include/acpi/actables.h
index 527e1c9f9b..45a1e0c634 100644
--- a/xen/include/acpi/actables.h
+++ b/xen/include/acpi/actables.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACTABLES_H__
-#define __ACTABLES_H__
+#ifndef ACPI__ACTABLES_H
+#define ACPI__ACTABLES_H
 
 acpi_status acpi_allocate_root_table(u32 initial_table_count);
 
@@ -104,4 +104,4 @@ acpi_tb_install_table(acpi_physical_address address,
 acpi_status
 acpi_tb_parse_root_table(acpi_physical_address rsdp_address, u8 flags);
 
-#endif				/* __ACTABLES_H__ */
+#endif				/* ACPI__ACTABLES_H */
diff --git a/xen/include/acpi/actbl.h b/xen/include/acpi/actbl.h
index 3079176992..b022403359 100644
--- a/xen/include/acpi/actbl.h
+++ b/xen/include/acpi/actbl.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACTBL_H__
-#define __ACTBL_H__
+#ifndef ACPI__ACTBL_H
+#define ACPI__ACTBL_H
 
 /*******************************************************************************
  *
@@ -358,4 +358,4 @@ enum acpi_prefered_pm_profiles {
 #define ACPI_FADT_V5_SIZE       (u32) (ACPI_FADT_OFFSET (hypervisor_id))
 #define ACPI_FADT_V6_SIZE       (u32) (sizeof (struct acpi_table_fadt))
 
-#endif				/* __ACTBL_H__ */
+#endif				/* ACPI__ACTBL_H */
diff --git a/xen/include/acpi/actbl1.h b/xen/include/acpi/actbl1.h
index 923641fc9e..1b333399ca 100644
--- a/xen/include/acpi/actbl1.h
+++ b/xen/include/acpi/actbl1.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACTBL1_H__
-#define __ACTBL1_H__
+#ifndef ACPI__ACTBL1_H
+#define ACPI__ACTBL1_H
 
 /*******************************************************************************
  *
@@ -1012,4 +1012,4 @@ struct acpi_srat_x2apic_cpu_affinity {
 
 #pragma pack()
 
-#endif				/* __ACTBL1_H__ */
+#endif				/* ACPI__ACTBL1_H */
diff --git a/xen/include/acpi/actbl2.h b/xen/include/acpi/actbl2.h
index ee96e990d6..7eb4e51b72 100644
--- a/xen/include/acpi/actbl2.h
+++ b/xen/include/acpi/actbl2.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACTBL2_H__
-#define __ACTBL2_H__
+#ifndef ACPI__ACTBL2_H
+#define ACPI__ACTBL2_H
 
 /*******************************************************************************
  *
@@ -1268,4 +1268,4 @@ struct acpi_table_wdrt {
 
 #pragma pack()
 
-#endif				/* __ACTBL2_H__ */
+#endif				/* ACPI__ACTBL2_H */
diff --git a/xen/include/acpi/actbl3.h b/xen/include/acpi/actbl3.h
index 6858d3e60f..2407455102 100644
--- a/xen/include/acpi/actbl3.h
+++ b/xen/include/acpi/actbl3.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACTBL3_H__
-#define __ACTBL3_H__
+#ifndef ACPI__ACTBL3_H
+#define ACPI__ACTBL3_H
 
 /*******************************************************************************
  *
@@ -639,4 +639,4 @@ struct acpi_table_stao {
 
 #pragma pack()
 
-#endif				/* __ACTBL3_H__ */
+#endif				/* ACPI__ACTBL3_H */
diff --git a/xen/include/acpi/actypes.h b/xen/include/acpi/actypes.h
index 49e0ab9bb4..17464f5a65 100644
--- a/xen/include/acpi/actypes.h
+++ b/xen/include/acpi/actypes.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACTYPES_H__
-#define __ACTYPES_H__
+#ifndef ACPI__ACTYPES_H
+#define ACPI__ACTYPES_H
 
 /* acpisrc:struct_defs -- for acpisrc conversion */
 
@@ -724,4 +724,4 @@ struct acpi_buffer {
 #define ACPI_PRODUCER                   (u8) 0x00
 #define ACPI_CONSUMER                   (u8) 0x01
 
-#endif				/* __ACTYPES_H__ */
+#endif				/* ACPI__ACTYPES_H */
diff --git a/xen/include/acpi/acutils.h b/xen/include/acpi/acutils.h
index ac54adaa8c..7b0a8c677d 100644
--- a/xen/include/acpi/acutils.h
+++ b/xen/include/acpi/acutils.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef _ACUTILS_H
-#define _ACUTILS_H
+#ifndef ACPI__ACUTILS_H
+#define ACPI__ACUTILS_H
 
 /* Types for Resource descriptor entries */
 
@@ -196,4 +196,4 @@ acpi_ut_info(const char *module_name,
  */
 const char *acpi_ut_validate_exception(acpi_status status);
 
-#endif				/* _ACUTILS_H */
+#endif				/* ACPI__ACUTILS_H */
diff --git a/xen/include/acpi/apei.h b/xen/include/acpi/apei.h
index 495819e362..6aed603745 100644
--- a/xen/include/acpi/apei.h
+++ b/xen/include/acpi/apei.h
@@ -2,8 +2,8 @@
  * apei.h - ACPI Platform Error Interface
  */
 
-#ifndef ACPI_APEI_H
-#define ACPI_APEI_H
+#ifndef ACPI__APEI_H
+#define ACPI__APEI_H
 
 #include <xen/acpi.h>
 #include <xen/cper.h>
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 3f1b05a02e..6764d54f8f 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -11,8 +11,8 @@
  * published by the Free Software Foundation.
  */
 
-#ifndef __XEN_CPUFREQ_PM_H__
-#define __XEN_CPUFREQ_PM_H__
+#ifndef ACPI__CPUFREQ__CPUFREQ_H
+#define ACPI__CPUFREQ__CPUFREQ_H
 
 #include <xen/types.h>
 #include <xen/list.h>
@@ -267,4 +267,4 @@ int set_hwp_para(struct cpufreq_policy *policy,
 
 int acpi_cpufreq_register(void);
 
-#endif /* __XEN_CPUFREQ_PM_H__ */
+#endif /* ACPI__CPUFREQ__CPUFREQ_H */
diff --git a/xen/include/acpi/cpufreq/processor_perf.h b/xen/include/acpi/cpufreq/processor_perf.h
index 301104e16f..2088e5ea67 100644
--- a/xen/include/acpi/cpufreq/processor_perf.h
+++ b/xen/include/acpi/cpufreq/processor_perf.h
@@ -1,5 +1,5 @@
-#ifndef __XEN_PROCESSOR_PM_H__
-#define __XEN_PROCESSOR_PM_H__
+#ifndef ACPI__CPUFREQ__PROCESSOR_PERF_H
+#define ACPI__CPUFREQ__PROCESSOR_PERF_H
 
 #include <public/platform.h>
 #include <public/sysctl.h>
@@ -59,4 +59,4 @@ struct pm_px {
 DECLARE_PER_CPU(struct pm_px *, cpufreq_statistic_data);
 
 int cpufreq_cpu_init(unsigned int cpu);
-#endif /* __XEN_PROCESSOR_PM_H__ */
+#endif /* ACPI__CPUFREQ__PROCESSOR_PERF_H */
diff --git a/xen/include/acpi/pdc_intel.h b/xen/include/acpi/pdc_intel.h
index abaa098b51..a6510b14fe 100644
--- a/xen/include/acpi/pdc_intel.h
+++ b/xen/include/acpi/pdc_intel.h
@@ -1,8 +1,8 @@
 
 /* _PDC bit definition for Intel processors */
 
-#ifndef __PDC_INTEL_H__
-#define __PDC_INTEL_H__
+#ifndef ACPI__PDC_INTEL_H
+#define ACPI__PDC_INTEL_H
 
 #define ACPI_PDC_REVISION_ID		1
 
@@ -48,4 +48,4 @@
 #define ACPI_PDC_T_MASK			(ACPI_PDC_T_FFH | \
 					 ACPI_PDC_SMP_T_SWCOORD)
 
-#endif				/* __PDC_INTEL_H__ */
+#endif				/* ACPI__PDC_INTEL_H */
diff --git a/xen/include/acpi/platform/acenv.h b/xen/include/acpi/platform/acenv.h
index 83cdb77d75..33c253c094 100644
--- a/xen/include/acpi/platform/acenv.h
+++ b/xen/include/acpi/platform/acenv.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACENV_H__
-#define __ACENV_H__
+#ifndef ACPI__PLATFORM__ACENV_H
+#define ACPI__PLATFORM__ACENV_H
 
 /*
  * Configuration for ACPI tools and utilities
@@ -362,4 +362,4 @@ typedef char *va_list;
  * headers.
  *
  *****************************************************************************/
-#endif				/* __ACENV_H__ */
+#endif				/* ACPI__PLATFORM__ACENV_H */
diff --git a/xen/include/acpi/platform/acgcc.h b/xen/include/acpi/platform/acgcc.h
index b355e98eeb..6b32e4eedd 100644
--- a/xen/include/acpi/platform/acgcc.h
+++ b/xen/include/acpi/platform/acgcc.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACGCC_H__
-#define __ACGCC_H__
+#ifndef ACPI__PLATFORM__ACGCC_H
+#define ACPI__PLATFORM__ACGCC_H
 
 /* Function name is used for debug output. Non-ANSI, compiler-dependent */
 
@@ -62,4 +62,4 @@
  */
 #define ACPI_UNUSED_VAR __attribute__ ((unused))
 
-#endif				/* __ACGCC_H__ */
+#endif				/* ACPI__PLATFORM__ACGCC_H */
diff --git a/xen/include/acpi/platform/aclinux.h b/xen/include/acpi/platform/aclinux.h
index a66c2e6d1d..32a853f1bc 100644
--- a/xen/include/acpi/platform/aclinux.h
+++ b/xen/include/acpi/platform/aclinux.h
@@ -41,8 +41,8 @@
  * POSSIBILITY OF SUCH DAMAGES.
  */
 
-#ifndef __ACLINUX_H__
-#define __ACLINUX_H__
+#ifndef ACPI__PLATFORM__ACLINUX_H
+#define ACPI__PLATFORM__ACLINUX_H
 
 #define ACPI_USE_SYSTEM_CLIBRARY
 #define ACPI_USE_DO_WHILE_0
@@ -82,4 +82,4 @@ void acpi_os_free_memory(void *ptr);
 #define ACPI_ALLOCATE_ZEROED(a)	acpi_os_zalloc_memory(a)
 #define ACPI_FREE(a)		acpi_os_free_memory(a)
 
-#endif				/* __ACLINUX_H__ */
+#endif				/* ACPI__PLATFORM__ACLINUX_H */
-- 
2.34.1


