Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1613CA373C6
	for <lists+xen-devel@lfdr.de>; Sun, 16 Feb 2025 11:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889525.1298608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjbm1-0006P1-Cd; Sun, 16 Feb 2025 10:21:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889525.1298608; Sun, 16 Feb 2025 10:21:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjbm1-0006NY-8q; Sun, 16 Feb 2025 10:21:17 +0000
Received: by outflank-mailman (input) for mailman id 889525;
 Sun, 16 Feb 2025 10:21:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xtIa=VH=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1tjbm0-0006NS-CC
 for xen-devel@lists.xenproject.org; Sun, 16 Feb 2025 10:21:16 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf9550c5-ec4f-11ef-9896-31a8f345e629;
 Sun, 16 Feb 2025 11:21:13 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-30795988ebeso35981171fa.3
 for <xen-devel@lists.xenproject.org>; Sun, 16 Feb 2025 02:21:13 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30922dc69bdsm8474771fa.12.2025.02.16.02.21.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2025 02:21:10 -0800 (PST)
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
X-Inumbo-ID: bf9550c5-ec4f-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739701272; x=1740306072; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/BPeHi6Hz/TKNDs0Wgqfff3xOedQ81gzCR/Z3HgdHWc=;
        b=ZfDeGt6OG6T8pSq64uD3hYKvypynFE2Y1uphwV1mVomu/ahLYCPp5RbwwD/ZF2tD+n
         5C0AGU0zuXqvjKPMydZHvTtuHlvqfOK7UeCufc0THOjLZg/j7QwttWJGG00w00boy+Ri
         7IZTnHuvbaHj9tbJi/v4bTSRt/OQs6CmEOJ+EB/KbqR1jQkf6HrMzDppJBd7cbi9IVk8
         o/MsC/4hfBimcGbvwSFS7pK1olNLDJMPNW696mBXxj+IESFUuxBWxCASpp0X2eqoIAlL
         x+70p0P810vOUNceluBfXgfNDHm5jfD71JwE3SBMlHczJUfWUfWY5dJUxoh8ep5yzfMp
         h4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739701272; x=1740306072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BPeHi6Hz/TKNDs0Wgqfff3xOedQ81gzCR/Z3HgdHWc=;
        b=Fq3JbLHckbPJmXfEDWjdxHQ89mZ1qW82o9AymWNgJOYoIPV/iJyAvcc4Gh1pZDPoRT
         2mbW9ITHYhymvOsY4EdntfsfyUgmE6WLjRtzL1ntr2mpbUij2lCzrYdHKurlqMfrRHcA
         RgGrF7Vj2F1+0/cx7UMhFLDA5Ybj3IvoXJy1wrE6BS4NmriNEYFLm6LrrZ2yPaIhP39z
         v1liFInZVVilONcu9WZ0MHAWUkF3jMJV3KL1jRQttQrR38LIk83I6XyJHOzQ1WZZ/+KB
         WS30lAJinL4IuTF77FQTzi5TpWTrTDy6ThSkbjhfpT8/+6bKwHeXnQAzuAmTOAMV0ZGL
         d+0g==
X-Gm-Message-State: AOJu0YxsMJbBWu8rV6gNTCZuK9Q1yY8OxnZQzw+T3O/F1Pt72D4WFtaW
	HnshNhXOVvVRuIUKtVAixnGRw4zOjze9SWF+u1poxVGz5ls4QwcM49mKoQ==
X-Gm-Gg: ASbGncuiroSFfJflEYyaQxT2oBKsCI/6hNvnQCFv5Y+2gp31+i5UURUXdG23Vhj4Kfu
	jO0p+haNMeZmfWIbHf1wHS8F5Ygr6TSQ00h0pk7xWfeoFiv4PkUhjmY6m1WWMWD98FYRUXQ6OSF
	mCDLsPfW7xMsimcrSGbvJkVM4/SAPLZsTwpkM+WE95cmIb70h9UPQxA5uegoXWEDRUAuMKi3NIb
	/Lgl0PejRQFV/R8nJPuv0CpxOhMVyfRWeiFB0nGSAPPriW/VDGc9SfCO7ji4g5e/YuLbDbs2J7T
	NElXR70P6cTpNmfUJUQdN8Cu
X-Google-Smtp-Source: AGHT+IFFxy28fbCaNwRiDrmdx5rvCeDY9MgQRd80QPKN5UfDWlJN6jIqn6P90trj3nujA8Do8Tvx1A==
X-Received: by 2002:a2e:9490:0:b0:309:2ed:7331 with SMTP id 38308e7fff4ca-30927a62d05mr19968001fa.18.1739701272112;
        Sun, 16 Feb 2025 02:21:12 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andr2000@gmail.com,
	sstabellini@kernel.org,
	Artem_Mygaiev@epam.com,
	jbeulich@suse.com,
	Luca.Fancellu@arm.com,
	roger.pau@citrix.com,
	marmarek@invisiblethingslab.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech
Subject: [PATCH 0/2] code style exercise: Drivers folder samples
Date: Sun, 16 Feb 2025 12:21:06 +0200
Message-Id: <20250216102108.2665222-1-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello, everybody!

As agreed before [1] I am sending a series to show two samples of the
formatting done with clang-format. The clang-format configuration can be
found at [2]. It already has some notes on previous discussions when
Luca presented his version of that configuration and which I used to
start from.

There are two diff files which show what happens in case the same is
applied to the whole xen/drivers directory:
- first one is the result of the "git diff" command, 1.2M [3]
- the second one is for "git diff --ignire-all-space", 600K [4]

This is not to limit the reviewers from seeing a bigger picture and not
only the files in this series.
N.B. xen/drivers uses tabs a lot, so this is no surprise the size
difference is big enough: roughly space conversion is half of the changes.

While reviewing the changes I have collected some of the unexpected things
done by clang-format and some interesting pieces. You can find those
below. For some of those I have filed an issue on clang-format and hope the
community will lead me in resolving those. Of course what I collected is
not the complete list of such changes, so I hope we can discuss missed
ones here.

From this exercise I can definitely tell that clang-format does help a
lot and has potential to be employed as a code formatting tool for Xen.
Of course it cannot be used as is now and will require discussions on the
Xen coding style and possibly submitting patches to clang-format to
satisfy those which cannot be handled by the tool now.

Stay safe,
Oleksandr Andrushchenko

1. Const string arrays reformatting
In case the length of items change we might need to introduce a bigger
change wrt new formatting of unaffected lines
==============================================================================

--- a/xen/drivers/acpi/tables.c
+++ b/xen/drivers/acpi/tables.c
@@ -38,10 +38,10 @@
-static const char *__initdata
-mps_inti_flags_polarity[] = { "dfl", "high", "res", "low" };
-static const char *__initdata
-mps_inti_flags_trigger[] = { "dfl", "edge", "res", "level" };
+static const char *__initdata mps_inti_flags_polarity[] = { "dfl", "high",
+                                                            "res", "low" };
+static const char *__initdata mps_inti_flags_trigger[] = { "dfl", "edge", "res",

--- a/xen/drivers/acpi/utilities/utglobal.c
+++ b/xen/drivers/acpi/utilities/utglobal.c
 static const char *const acpi_gbl_region_types[ACPI_NUM_PREDEFINED_REGIONS] = {
-	"SystemMemory",
-	"SystemIO",
-	"PCI_Config",
-	"EmbeddedControl",
-	"SMBus",
-	"CMOS",
-	"PCIBARTarget",
-	"DataTable"
+    "SystemMemory", "SystemIO", "PCI_Config",   "EmbeddedControl",
+    "SMBus",        "CMOS",     "PCIBARTarget", "DataTable"
 };

2. Long strings in ptintk violations
I filed an issue on printk format strings [5]
==============================================================================
@@ -225,9 +231,9 @@ void __init acpi_table_print_madt_entry(struct acpi_subtable_header *header)
         printk(KERN_DEBUG PREFIX
-			       "GIC Distributor (gic_id[0x%04x] address[0x%"PRIx64"] gsi_base[%d])\n",
-			       p->gic_id, p->base_address,
-			       p->global_irq_base);
+               "GIC Distributor (gic_id[0x%04x] address[0x%" PRIx64
+               "] gsi_base[%d])\n",
+               p->gic_id, p->base_address, p->global_irq_base);

@@ -629,12 +628,14 @@ acpi_parse_one_rmrr(struct acpi_dmar_header *header)
-           printk(XENLOG_ERR VTDPREFIX
-                  "Overlapping RMRRs [%"PRIx64",%"PRIx64"] and [%"PRIx64",%"PRIx64"]\n",
-                  rmrru->base_address, rmrru->end_address,
-                  base_addr, end_addr);
+            printk(XENLOG_ERR VTDPREFIX "Overlapping RMRRs [%" PRIx64
+                                        ",%" PRIx64 "] and [%" PRIx64
+                                        ",%" PRIx64 "]\n",
+                   rmrru->base_address, rmrru->end_address, base_addr,
+                   end_addr);

3. String concatenation after clang - needs manual work to fix
==============================================================================
--- a/xen/drivers/acpi/apei/apei-base.c
+++ b/xen/drivers/acpi/apei/apei-base.c
@@ -171,16 +169,19 @@ int __apei_exec_run(struct apei_exec_context *ctx, u8 action,
                 printk(KERN_WARNING
-                               "Invalid action table, unknown instruction "
-                               "type: %d\n", entry->instruction);
+                       "Invalid action table, unknown instruction " "type: %d\n",
+                       entry->instruction);

4. Looks a bit weird, but correct
==============================================================================
--- a/xen/drivers/acpi/apei/apei-io.c
+++ b/xen/drivers/acpi/apei/apei-io.c
@@ -80,13 +78,15 @@ static void __iomem *__init apei_range_map(paddr_t paddr, unsigned long size)
-       pg = ((((paddr + size -1) & PAGE_MASK)
-                - (paddr & PAGE_MASK)) >> PAGE_SHIFT) + 1;
+    pg = ((((paddr + size - 1) & PAGE_MASK) - (paddr & PAGE_MASK)) >>
+          PAGE_SHIFT) +
+         1;

5. Long line tables mess, think it can be manually reformated before applying clang-format
==============================================================================
--- a/xen/drivers/acpi/tables/tbfadt.c
+++ b/xen/drivers/acpi/tables/tbfadt.c
@@ -74,12 +74,12 @@ typedef struct acpi_fadt_info {
-        ACPI_FADT_OFFSET(pm1a_event_block),
-        ACPI_FADT_OFFSET(pm1_event_length), ACPI_FADT_REQUIRED},
+     ACPI_FADT_OFFSET(pm1a_event_block),                                                       ACPI_FADT_OFFSET(pm1_event_length),
+     ACPI_FADT_REQUIRED                                                                                                                                        },

--- a/xen/drivers/acpi/utilities/utglobal.c
+++ b/xen/drivers/acpi/utilities/utglobal.c
@@ -97,71 +96,71 @@ struct acpi_bit_register_info acpi_gbl_bit_register_info[ACPI_NUM_BITREG] = {
     /* Name                                     Parent Register             Register Bit Position                   Register Bit Mask       */
 
     /* ACPI_BITREG_TIMER_STATUS         */ { ACPI_REGISTER_PM1_STATUS,
-						ACPI_BITPOSITION_TIMER_STATUS,
-						ACPI_BITMASK_TIMER_STATUS},
-	/* ACPI_BITREG_BUS_MASTER_STATUS    */ {ACPI_REGISTER_PM1_STATUS,
-						ACPI_BITPOSITION_BUS_MASTER_STATUS,
+                                            ACPI_BITPOSITION_TIMER_STATUS,                                    ACPI_BITMASK_TIMER_STATUS },
+    /* ACPI_BITREG_BUS_MASTER_STATUS    */
+    { ACPI_REGISTER_PM1_STATUS,  ACPI_BITPOSITION_BUS_MASTER_STATUS,

6. Macro blocks are formatted
==============================================================================
Grygorii mentioned this and I was sure it is properly handled, but
it is not. I have filed an issue on clang-format [6].
--- a/xen/drivers/char/cadence-uart.c
+++ b/xen/drivers/char/cadence-uart.c
@@ -189,16 +192,14 @@ static int __init cuart_init(struct dt_device_node *dev, const void *data)
 DT_DEVICE_START(cuart, "Cadence UART", DEVICE_SERIAL)
-    .dt_match = cuart_dt_match,
-    .init = cuart_init,
+    .dt_match = cuart_dt_match, .init = cuart_init,
 DT_DEVICE_END

7. Parentheses for empty functions
==============================================================================
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1311,7 +1307,9 @@ void panic(const char *fmt, ...)
-static void cf_check suspend_steal_fn(const char *str, size_t nr) { }
+static void cf_check suspend_steal_fn(const char *str, size_t nr)
+{}

8. Const struct reformatting is weird and inconsistent
==============================================================================
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1050,135 +1055,93 @@ static const struct ns16550_config __initconst uart_config[] =
      .param = param_oxford,
      },
     /* Pericom PI7C9X7951 Uno UART */
-    {
-        .vendor_id = PCI_VENDOR_ID_PERICOM,
+    { .vendor_id = PCI_VENDOR_ID_PERICOM,
      .dev_id = 0x7951,
-        .param = param_pericom_1port
-    },
+     .param = param_pericom_1port },

9. Define is longer than 80 chars
==============================================================================
--- a/xen/drivers/cpufreq/cpufreq_ondemand.c
+++ b/xen/drivers/cpufreq/cpufreq_ondemand.c
@@ -27,10 +27,8 @@
-#define MIN_STAT_SAMPLING_RATE                  \
-    (MIN_SAMPLING_MILLISECS * MILLISECS(1))
-#define MIN_SAMPLING_RATE                       \
-    (def_sampling_rate / MIN_SAMPLING_RATE_RATIO)
+#define MIN_STAT_SAMPLING_RATE               (MIN_SAMPLING_MILLISECS * MILLISECS(1))
+#define MIN_SAMPLING_RATE                    (def_sampling_rate / MIN_SAMPLING_RATE_RATIO)

10. Union memebers require an empty line between them
==============================================================================
--- a/xen/drivers/passthrough/amd/iommu-defs.h
+++ b/xen/drivers/passthrough/amd/iommu-defs.h
@@ -289,6 +289,7 @@ struct amd_iommu_dte {
 
 union amd_iommu_control {
     uint64_t raw;
+
     struct {

11. Multiline string alignment for at the first string, not for the function
opening bracket. Depends on the macro before the string?
==============================================================================
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -748,18 +757,18 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
             printk(XENLOG_WARNING "SR-IOV device %pp has its virtual"
-                   " functions already enabled (%04x)\n", &pdev->sbdf, ctrl);
+                                  " functions already enabled (%04x)\n",
+                   &pdev->sbdf, ctrl);


11. const struct initializers are inconsistent
I have filed a bug on clang-format for that [7]
==============================================================================

[snip]
static const struct ns16550_config __initconst uart_config[] = {
[snip]
    /* OXPCIe200 1 Native UART  */
    {
     .vendor_id = PCI_VENDOR_ID_OXSEMI,
     .dev_id = 0xc4cf,
     .param = param_oxford,
     },
    /* Pericom PI7C9X7951 Uno UART */
    { .vendor_id = PCI_VENDOR_ID_PERICOM,
     .dev_id = 0x7951,
     .param = param_pericom_1port },
[snip]

[1] https://lists.xen.org/archives/html/xen-devel/2025-02/msg00430.html
[2] https://github.com/andr2000/xen/blob/clang_ml_drivers_v001/xen/.clang-format
[3] https://github.com/andr2000/xen/blob/clang_ml_drivers_v001/xen/drivers.patch
[4] https://github.com/andr2000/xen/blob/clang_ml_drivers_v001/xen/drivers_ignore_all_space.patch
[5] https://github.com/llvm/llvm-project/issues/127383
[6] https://github.com/llvm/llvm-project/issues/127381
[7] https://github.com/llvm/llvm-project/issues/127380

Oleksandr Andrushchenko (2):
  code style: Format ns16550 driver
  code style: Format ACPI tables

 xen/drivers/acpi/tables.c  | 809 ++++++++++++++++++++-----------------
 xen/drivers/char/ns16550.c | 761 +++++++++++++++++-----------------
 2 files changed, 813 insertions(+), 757 deletions(-)

-- 
2.25.1


