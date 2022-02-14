Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247D04B517D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:18:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272107.466933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbFM-00082P-Vy; Mon, 14 Feb 2022 13:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272107.466933; Mon, 14 Feb 2022 13:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbFM-0007y0-Rp; Mon, 14 Feb 2022 13:18:28 +0000
Received: by outflank-mailman (input) for mailman id 272107;
 Mon, 14 Feb 2022 13:18:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb4f-0008IH-Jp
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:07:25 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0c8203ae-8d97-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:07:23 +0100 (CET)
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
X-Inumbo-ID: 0c8203ae-8d97-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644844043;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=50D+xAeRBi7l/rNYWw5qNsHZx6AmOYhKRxvgdKe98Q8=;
  b=P1qPBZ2pQj1qm6Yuqkb3kIQYKWRRcUf2y3LTX3T4gcfMsjOOx0FNM0C0
   O1cVFn2+thdotBF1TJhbd21K1o5Ejr1ibzYYQ94JyPH1ixxtEcIkamXrb
   EXNkPBhd5wDfvPpDIiyK15wW1RM0zOoJmVqaFUQBPnaFj8lXt5Elqu3WR
   E=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: mF2LEJABfwpSZn+t5sRoqTFHKf4A3rR44KKUo4Fj0EjvfnHaFz4SSMewpxCSkTqa+zh7fvzDrM
 AACnTSUqyHo693ghBv5CDbgw4jq/IGSLvuErrDz13pu68/VdgG5AYRarcx7v2ldDI2C0NM+ytw
 NVt4mNVwn1xBQRSNm0HSlq0WtpLeXmzi547Fk/xjrupKgsfjVkoT8codK8OqxXpqKB33afzWt2
 7zO/+S1o20N8gyOnYLffrQeJYwlbE9PaL6cPGl20yOpSrX+lo+dHUAzpMYvh1Pw48u26+kp4k9
 6Wug2SjvCovvG3aGfTj9i+SR
X-SBRS: 5.1
X-MesageID: 64554431
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:GHuABKlxs0zTCM0Sbv1HJYXo5gyZIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKWzuOafuINGL8eNgga4+19BsHu5eAz9RjTQtu/i41FiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh2Nc02YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OcRqLLubDouApLJnd9eQTxRHA9kOKITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBODtMJkSpTdLyjbBAOx9aZvCX7/L9ZlT2zJYasVmQ6qDO
 pZFMmMHgBLoMh1wGVYwGp4Hkfq6gCXxfDxgt2mVuv9ii4TU5FMoi+W8WDbPQfSaSMMQkkuGq
 2bu+2XiHgpcJNGZ0SCC8H+nmqnIhyyTZW4JPOTmrLgw2gTVnzFNTk1NPbemnRWnonziRvwBD
 nETxhUrqJNx5mmiQffnWhLt9RZooSUgc9ZXFuQ77iSExazV/xuVCwA4c9JRVDA1nJRoHGJ3j
 zdli/usXGUy6+PNFRpx45/J9WvaBMQDEYMVicbopyMh6sKrnow8hwmnoj1LQP/s1Y2d9d0dL
 lm3QMkCa1c70JRjO0aTpwmvb9eQSn/hFFBd2+kvdjj5hj6Vnab8D2BS1XDV7OxbMKGSRUSbs
 X4PlqC2tb5SUc7dxHHQGLxWRtlFAspp1xWG3zZS82QJrWzxqxZPg6gMiN2BGKuZGpldImK4C
 KMikQhQ+IVSLBOXgVxfOOqM5zAR5fG4T7zND6mMBvIXO8QZXFLXrUlGOB/Lt0iwwRdErE3KE
 crCGSpaJS1BUvoPIfvfb7p17ILHMQhgmTKNFcijlUzPPHj3TCf9dIrp+WCmNogRhJ5oai2Mr
 4k32xKix0oNXevgTDPQ9IJPf1kGIWJiXcL9qtBNd/7FKQ1jQTlzB/jUyLInWopkg6UKybuYo
 iDjAhdVmAjlmHnKCQSWcXQ/Ornhaoly8CAgNis2MFf2h3V6OdSz7L0SfoccdKU88LAx1uZ9S
 vQIIp3SAvlGRjnd1S4aaJ3x8N5reBix3FrcNCu5ejkvOZVnQlWRqNPjewLu8ggIDza26pRi8
 +HxiFuDTMNaFQp4DcvQZPa+9H+LvCAQyLBoQk/FAthPY0GwooJkHDP8060sKMYWJBSdmjbDj
 1SKAQ0VrPXmqpMu9IWbnriNqoqkHrcsHkdeGGWHv7+6OTODozimyI5EFu2JYSrcRCX//6D7P
 bdZyPT1MfsmmldWstUjT+Y3nPxmv9a/9aVHyglEHWnQawX5A7xtFXCKwM1Tu/Af3bReowa3B
 hqC99Qy1W9l4y85/Ir9/DYYU9k=
IronPort-HdrOrdr: A9a23:lkd4bq46E69fZZnnEwPXwMrXdLJyesId70hD6qhwISY6TiX4rb
 HWoB1173/JYVoqNE3I3OrwXZVoIkmsk6Kdg7NhXotKNTOO0ADDQb2Kr7GSpwEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64554431"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 12/70] xen: CFI hardening for acpi_table_parse()
Date: Mon, 14 Feb 2022 12:50:29 +0000
Message-ID: <20220214125127.17985-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/acpi/boot.c                 | 24 ++++++++++++------------
 xen/arch/x86/hvm/dom0_build.c            | 16 ++++++++--------
 xen/arch/x86/include/asm/tboot.h         |  2 +-
 xen/arch/x86/srat.c                      |  4 ++--
 xen/arch/x86/tboot.c                     |  2 +-
 xen/arch/x86/x86_64/acpi_mmcfg.c         |  2 +-
 xen/arch/x86/x86_64/mmconfig.h           |  2 +-
 xen/drivers/acpi/apei/hest.c             |  4 ++--
 xen/drivers/acpi/numa.c                  | 10 +++++-----
 xen/drivers/passthrough/amd/iommu_acpi.c |  9 +++++----
 xen/drivers/passthrough/pci.c            |  3 ++-
 xen/drivers/passthrough/vtd/dmar.c       |  2 +-
 xen/include/xen/acpi.h                   |  2 +-
 13 files changed, 42 insertions(+), 40 deletions(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index cc4bbc0284fa..54b72d716bed 100644
--- a/xen/arch/x86/acpi/boot.c
+++ b/xen/arch/x86/acpi/boot.c
@@ -60,7 +60,7 @@ static u64 acpi_lapic_addr __initdata = APIC_DEFAULT_PHYS_BASE;
                               Boot-time Configuration
    -------------------------------------------------------------------------- */
 
-static int __init acpi_parse_madt(struct acpi_table_header *table)
+static int __init cf_check acpi_parse_madt(struct acpi_table_header *table)
 {
 	struct acpi_table_madt *madt =
 		container_of(table, struct acpi_table_madt, header);
@@ -77,7 +77,7 @@ static int __init acpi_parse_madt(struct acpi_table_header *table)
 	return 0;
 }
 
-static int __init
+static int __init cf_check
 acpi_parse_x2apic(struct acpi_subtable_header *header, const unsigned long end)
 {
 	struct acpi_madt_local_x2apic *processor =
@@ -133,7 +133,7 @@ acpi_parse_x2apic(struct acpi_subtable_header *header, const unsigned long end)
 	return 0;
 }
 
-static int __init
+static int __init cf_check
 acpi_parse_lapic(struct acpi_subtable_header * header, const unsigned long end)
 {
 	struct acpi_madt_local_apic *processor =
@@ -171,7 +171,7 @@ acpi_parse_lapic(struct acpi_subtable_header * header, const unsigned long end)
 	return 0;
 }
 
-static int __init
+static int __init cf_check
 acpi_parse_lapic_addr_ovr(struct acpi_subtable_header * header,
 			  const unsigned long end)
 {
@@ -187,7 +187,7 @@ acpi_parse_lapic_addr_ovr(struct acpi_subtable_header * header,
 	return 0;
 }
 
-static int __init
+static int __init cf_check
 acpi_parse_x2apic_nmi(struct acpi_subtable_header *header,
 		      const unsigned long end)
 {
@@ -206,7 +206,7 @@ acpi_parse_x2apic_nmi(struct acpi_subtable_header *header,
 	return 0;
 }
 
-static int __init
+static int __init cf_check
 acpi_parse_lapic_nmi(struct acpi_subtable_header * header, const unsigned long end)
 {
 	struct acpi_madt_local_apic_nmi *lapic_nmi =
@@ -223,7 +223,7 @@ acpi_parse_lapic_nmi(struct acpi_subtable_header * header, const unsigned long e
 	return 0;
 }
 
-static int __init
+static int __init cf_check
 acpi_parse_ioapic(struct acpi_subtable_header * header, const unsigned long end)
 {
 	struct acpi_madt_io_apic *ioapic =
@@ -240,7 +240,7 @@ acpi_parse_ioapic(struct acpi_subtable_header * header, const unsigned long end)
 	return 0;
 }
 
-static int __init
+static int __init cf_check
 acpi_parse_int_src_ovr(struct acpi_subtable_header * header,
 		       const unsigned long end)
 {
@@ -267,7 +267,7 @@ acpi_parse_int_src_ovr(struct acpi_subtable_header * header,
 	return 0;
 }
 
-static int __init
+static int __init cf_check
 acpi_parse_nmi_src(struct acpi_subtable_header * header, const unsigned long end)
 {
 	struct acpi_madt_nmi_source *nmi_src =
@@ -283,7 +283,7 @@ acpi_parse_nmi_src(struct acpi_subtable_header * header, const unsigned long end
 	return 0;
 }
 
-static int __init acpi_parse_hpet(struct acpi_table_header *table)
+static int __init cf_check acpi_parse_hpet(struct acpi_table_header *table)
 {
 	const struct acpi_table_hpet *hpet_tbl =
 		container_of(table, const struct acpi_table_hpet, header);
@@ -319,7 +319,7 @@ static int __init acpi_parse_hpet(struct acpi_table_header *table)
 	return 0;
 }
 
-static int __init acpi_invalidate_bgrt(struct acpi_table_header *table)
+static int __init cf_check acpi_invalidate_bgrt(struct acpi_table_header *table)
 {
 	struct acpi_table_bgrt *bgrt_tbl =
 		container_of(table, struct acpi_table_bgrt, header);
@@ -472,7 +472,7 @@ acpi_fadt_parse_sleep_info(const struct acpi_table_fadt *fadt)
 	       acpi_sinfo.wakeup_vector, acpi_sinfo.vector_width);
 }
 
-static int __init acpi_parse_fadt(struct acpi_table_header *table)
+static int __init cf_check acpi_parse_fadt(struct acpi_table_header *table)
 {
 	const struct acpi_table_fadt *fadt =
 		container_of(table, const struct acpi_table_fadt, header);
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index f9e17249dcda..25fb05a389df 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -745,15 +745,15 @@ static int __init pvh_setup_cpus(struct domain *d, paddr_t entry,
     return 0;
 }
 
-static int __init acpi_count_intr_ovr(struct acpi_subtable_header *header,
-                                     const unsigned long end)
+static int __init cf_check acpi_count_intr_ovr(
+    struct acpi_subtable_header *header, const unsigned long end)
 {
     acpi_intr_overrides++;
     return 0;
 }
 
-static int __init acpi_set_intr_ovr(struct acpi_subtable_header *header,
-                                    const unsigned long end)
+static int __init cf_check acpi_set_intr_ovr(
+    struct acpi_subtable_header *header, const unsigned long end)
 {
     const struct acpi_madt_interrupt_override *intr =
         container_of(header, struct acpi_madt_interrupt_override, header);
@@ -764,15 +764,15 @@ static int __init acpi_set_intr_ovr(struct acpi_subtable_header *header,
     return 0;
 }
 
-static int __init acpi_count_nmi_src(struct acpi_subtable_header *header,
-                                     const unsigned long end)
+static int __init cf_check acpi_count_nmi_src(
+    struct acpi_subtable_header *header, const unsigned long end)
 {
     acpi_nmi_sources++;
     return 0;
 }
 
-static int __init acpi_set_nmi_src(struct acpi_subtable_header *header,
-                                   const unsigned long end)
+static int __init cf_check acpi_set_nmi_src(
+    struct acpi_subtable_header *header, const unsigned long end)
 {
     const struct acpi_madt_nmi_source *src =
         container_of(header, struct acpi_madt_nmi_source, header);
diff --git a/xen/arch/x86/include/asm/tboot.h b/xen/arch/x86/include/asm/tboot.h
index bfeed1542fa3..818d5fa45132 100644
--- a/xen/arch/x86/include/asm/tboot.h
+++ b/xen/arch/x86/include/asm/tboot.h
@@ -124,7 +124,7 @@ void tboot_probe(void);
 void tboot_shutdown(uint32_t shutdown_type);
 int tboot_in_measured_env(void);
 int tboot_protect_mem_regions(void);
-int tboot_parse_dmar_table(acpi_table_handler dmar_handler);
+int cf_check tboot_parse_dmar_table(acpi_table_handler dmar_handler);
 int tboot_s3_resume(void);
 void tboot_s3_error(int error);
 int tboot_wake_ap(int apicid, unsigned long sipi_vec);
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 6b77b9820195..cfe24c7e781c 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -407,8 +407,8 @@ void __init acpi_numa_arch_fixup(void) {}
 
 static uint64_t __initdata srat_region_mask;
 
-static int __init srat_parse_region(struct acpi_subtable_header *header,
-				    const unsigned long end)
+static int __init cf_check srat_parse_region(
+    struct acpi_subtable_header *header, const unsigned long end)
 {
 	struct acpi_srat_mem_affinity *ma;
 
diff --git a/xen/arch/x86/tboot.c b/xen/arch/x86/tboot.c
index 529367ed8167..fe1abfdf08ff 100644
--- a/xen/arch/x86/tboot.c
+++ b/xen/arch/x86/tboot.c
@@ -450,7 +450,7 @@ int __init tboot_protect_mem_regions(void)
     return 1;
 }
 
-int __init tboot_parse_dmar_table(acpi_table_handler dmar_handler)
+int __init cf_check tboot_parse_dmar_table(acpi_table_handler dmar_handler)
 {
     int rc;
     uint64_t size;
diff --git a/xen/arch/x86/x86_64/acpi_mmcfg.c b/xen/arch/x86/x86_64/acpi_mmcfg.c
index 0db8f57abbed..2159c68189e4 100644
--- a/xen/arch/x86/x86_64/acpi_mmcfg.c
+++ b/xen/arch/x86/x86_64/acpi_mmcfg.c
@@ -68,7 +68,7 @@ static int __init acpi_mcfg_check_entry(struct acpi_table_mcfg *mcfg,
     return -EINVAL;
 }
 
-int __init acpi_parse_mcfg(struct acpi_table_header *header)
+int __init cf_check acpi_parse_mcfg(struct acpi_table_header *header)
 {
     struct acpi_table_mcfg *mcfg;
     unsigned long i;
diff --git a/xen/arch/x86/x86_64/mmconfig.h b/xen/arch/x86/x86_64/mmconfig.h
index 4d3b9fcbdd3c..433046be663a 100644
--- a/xen/arch/x86/x86_64/mmconfig.h
+++ b/xen/arch/x86/x86_64/mmconfig.h
@@ -76,7 +76,7 @@ static inline void mmio_config_writel(void __iomem *pos, u32 val)
 
 /* function prototypes */
 struct acpi_table_header;
-int acpi_parse_mcfg(struct acpi_table_header *header);
+int cf_check acpi_parse_mcfg(struct acpi_table_header *header);
 int pci_mmcfg_reserved(uint64_t address, unsigned int segment,
                        unsigned int start_bus, unsigned int end_bus,
                        unsigned int flags);
diff --git a/xen/drivers/acpi/apei/hest.c b/xen/drivers/acpi/apei/hest.c
index c5f3aaab7c4e..5881275d2f37 100644
--- a/xen/drivers/acpi/apei/hest.c
+++ b/xen/drivers/acpi/apei/hest.c
@@ -128,8 +128,8 @@ int apei_hest_parse(apei_hest_func_t func, void *data)
  * Check if firmware advertises firmware first mode. We need FF bit to be set
  * along with a set of MC banks which work in FF mode.
  */
-static int __init hest_parse_cmc(const struct acpi_hest_header *hest_hdr,
-				 void *data)
+static int __init cf_check hest_parse_cmc(
+	const struct acpi_hest_header *hest_hdr, void *data)
 {
 #ifdef CONFIG_X86_MCE
 	unsigned int i;
diff --git a/xen/drivers/acpi/numa.c b/xen/drivers/acpi/numa.c
index 85f891757c21..bc6e888234e4 100644
--- a/xen/drivers/acpi/numa.c
+++ b/xen/drivers/acpi/numa.c
@@ -112,14 +112,14 @@ void __init acpi_table_print_srat_entry(struct acpi_subtable_header * header)
 	}
 }
 
-static int __init acpi_parse_slit(struct acpi_table_header *table)
+static int __init cf_check acpi_parse_slit(struct acpi_table_header *table)
 {
 	acpi_numa_slit_init((struct acpi_table_slit *)table);
 
 	return 0;
 }
 
-static int __init
+static int __init cf_check
 acpi_parse_x2apic_affinity(struct acpi_subtable_header *header,
 			   const unsigned long end)
 {
@@ -138,7 +138,7 @@ acpi_parse_x2apic_affinity(struct acpi_subtable_header *header,
 	return 0;
 }
 
-static int __init
+static int __init cf_check
 acpi_parse_processor_affinity(struct acpi_subtable_header *header,
 			      const unsigned long end)
 {
@@ -156,7 +156,7 @@ acpi_parse_processor_affinity(struct acpi_subtable_header *header,
 	return 0;
 }
 
-static int __init
+static int __init cf_check
 acpi_parse_memory_affinity(struct acpi_subtable_header *header,
 			   const unsigned long end)
 {
@@ -174,7 +174,7 @@ acpi_parse_memory_affinity(struct acpi_subtable_header *header,
 	return 0;
 }
 
-int __init acpi_parse_srat(struct acpi_table_header *table)
+int __init cf_check acpi_parse_srat(struct acpi_table_header *table)
 {
 	if (!table)
 		return -EINVAL;
diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 5ea227732821..3a7931458944 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -1078,7 +1078,7 @@ static inline bool_t is_ivmd_block(u8 type)
             type == ACPI_IVRS_TYPE_MEMORY_IOMMU);
 }
 
-static int __init parse_ivrs_table(struct acpi_table_header *table)
+static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
 {
     const struct acpi_ivrs_header *ivrs_block;
     unsigned long length;
@@ -1170,7 +1170,7 @@ static int __init parse_ivrs_table(struct acpi_table_header *table)
     return error;
 }
 
-static int __init detect_iommu_acpi(struct acpi_table_header *table)
+static int __init cf_check detect_iommu_acpi(struct acpi_table_header *table)
 {
     const struct acpi_ivrs_header *ivrs_block;
     unsigned long length = sizeof(struct acpi_table_ivrs);
@@ -1264,7 +1264,8 @@ static int __init get_last_bdf_ivhd(
     return last_bdf;
 }
 
-static int __init get_last_bdf_acpi(struct acpi_table_header *table)
+static int __init cf_check cf_check get_last_bdf_acpi(
+    struct acpi_table_header *table)
 {
     const struct acpi_ivrs_header *ivrs_block;
     unsigned long length = sizeof(struct acpi_table_ivrs);
@@ -1306,7 +1307,7 @@ int __init amd_iommu_update_ivrs_mapping_acpi(void)
     return acpi_table_parse(ACPI_SIG_IVRS, parse_ivrs_table);
 }
 
-static int __init
+static int __init cf_check
 get_supported_ivhd_type(struct acpi_table_header *table)
 {
     size_t length = sizeof(struct acpi_table_ivrs);
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index ed459f6409a8..c170dd06ba51 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1287,7 +1287,8 @@ static bool_t hest_source_is_pcie_aer(const struct acpi_hest_header *hest_hdr)
     return 0;
 }
 
-static int aer_hest_parse(const struct acpi_hest_header *hest_hdr, void *data)
+static int cf_check aer_hest_parse(
+    const struct acpi_hest_header *hest_hdr, void *data)
 {
     struct aer_hest_parse_info *info = data;
     const struct acpi_hest_aer_common *p;
diff --git a/xen/drivers/passthrough/vtd/dmar.c b/xen/drivers/passthrough/vtd/dmar.c
index b152f3da916b..b8e91f5be1ae 100644
--- a/xen/drivers/passthrough/vtd/dmar.c
+++ b/xen/drivers/passthrough/vtd/dmar.c
@@ -767,7 +767,7 @@ acpi_parse_one_rhsa(struct acpi_dmar_header *header)
     return ret;
 }
 
-static int __init acpi_parse_dmar(struct acpi_table_header *table)
+static int __init cf_check acpi_parse_dmar(struct acpi_table_header *table)
 {
     struct acpi_table_dmar *dmar;
     struct acpi_dmar_header *entry_header;
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 08834f140266..39d51fcd01dd 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -91,7 +91,7 @@ struct acpi_subtable_header *acpi_table_get_entry_madt(enum acpi_madt_type id,
 int acpi_table_parse_madt(enum acpi_madt_type id, acpi_table_entry_handler handler, unsigned int max_entries);
 int acpi_table_parse_srat(int id, acpi_madt_entry_handler handler,
 	unsigned int max_entries);
-int acpi_parse_srat(struct acpi_table_header *);
+int cf_check acpi_parse_srat(struct acpi_table_header *);
 void acpi_table_print (struct acpi_table_header *header, unsigned long phys_addr);
 void acpi_table_print_madt_entry (struct acpi_subtable_header *madt);
 void acpi_table_print_srat_entry (struct acpi_subtable_header *srat);
-- 
2.11.0


