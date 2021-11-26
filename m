Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB9545EE09
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 13:35:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232669.403479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRV-0002Jo-Pc; Fri, 26 Nov 2021 12:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232669.403479; Fri, 26 Nov 2021 12:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaRV-00028x-77; Fri, 26 Nov 2021 12:35:05 +0000
Received: by outflank-mailman (input) for mailman id 232669;
 Fri, 26 Nov 2021 12:35:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaRT-0001F5-2f
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 12:35:03 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4573f90b-4eb5-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 13:35:00 +0100 (CET)
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
X-Inumbo-ID: 4573f90b-4eb5-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637930101;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s5eMYscCP90nHplpIvN4kyBrObzvO7RFLbbwLJlbTOM=;
  b=RhUGJwdnQml5TmdXKLIOktgf6tRg8baBWfCLrqCwQ8RK4VneXT0AyJ3L
   VZs3OMSYJBYZjjYQpGPz4Qg40a+weL39fEkfUKz3GkM/KTpgw6zyjfPua
   JmpSdUPDlSV/LbPBmYANovKO+Vu0qu97zJfU4NwxPSpZrGYtaWOQ9VT4/
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: EbDdcOCaG8WfQ7csQtJWO+naDXPjJu0Ngdud4/gHiziS/lQcasq4bQAgbMK4mwNJ9+YvD+qg7J
 48D1Yfr8cVYhiVY38xvtchwSBGH2AHM2LS5kYFOEPi6rRBuNMTywE17npUJ7siZoWhw4BW2fIh
 Mr8mFKk6Jih7kGPafuiFVQfYwUft1qbIN0oSdZVzGWQ3+qEpLh0VKk+Yy0XXSNyZkvIUKRXvBu
 tZF9shOAxy4T1LkEXRPaYQRso7iD7l4x+Ltepo/wO7CMg05KktlilZRpjrDIs86upBhMoktAWp
 7bOEylVDOJizCtfyGq9haNUj
X-SBRS: 5.1
X-MesageID: 59062303
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2mGyGKJGLgCkNfRsFE+RJJIlxSXFcZb7ZxGr2PjKsXjdYENS0T0Ey
 GpOWzvQOviOYjPyeth3O9uzoUtQsJ+EzYVhTgBlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUZUideSc+EH140Es5xbZg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2Rzopw5
 /RKhKatdhwCN7zptM4eWCVxRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gph3p4URq6FD
 yYfQSRrPQvObTJmAXg0Oc8kmcG62H3DfAQN/Tp5ooJoujOOnWSdyoPFL979atGMA8JPkS6wp
 H/C/mn/KgEXMpqY0zXt2mm3mubFkCf/WYQTPL617PhnhBuU3GN7IA0bUx63rOe0jma6WslDM
 AoE9yw2t68w+Ue3CN7nUHWQglSJoxodUNp4CPAh5UeGza+83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LSQ+6ry6aHWszKqrthi7KA05B2wJWQZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnM/
 tyakMQtr+5N1JBWjs1X6XiC2mvx/caREmbZ8y2OBjr9hj6VcrJJcGBBBbLzyf9bZLiUQVCa1
 JTvs5jPtbteZX1hecHkfQnsIF1Lz6raWNE/qQQ2d3XEy9hL0yX4FWy3yGsjTHqFyu5eJVfUj
 Lb74Gu9HqN7MnqwdrNQaImsEcksxqWIPY27Da+EMIcRM8QvKFTvEMRSiai4hDuFfK8Ey/xXB
 HtmWZz0USZy5VpPkFJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYextDbd6VchgtPnsiFyMq
 753bpLWoz0CALyWSnSGquY7cAFVRUXX8Lir8qS7gMbYeVE4cIzgYteMqY4cl3tNw/4Iy7yWp
 y7lASe1CjPX3BX6FOlDUVg7AJuHYHq1hStT0fUEMQn61n49T5yo6atDJZI7caN+rL5ozOJuT
 ulDcMKFW6wdRjPC8jUbTJ/8sI09K0j72VPQZ3KoMGolYpptZw3V4du4LAHhwzYDU3isvswkr
 rz+ig6CGcgfRx5vBdr9Ye60yw/jpmAUne9/BhOaItRadEj23pJtLij90q0+L80WcE2RzTqGz
 QeGRxwfoLCV8YMy9dDIg4GCrpuoTLQiThYLQTGD4O/vZyfA/2elzYtRa8qyfGjQBDHu5aGvR
 eRJ1PWgYvcJq0lH7thnGLFxwKNgu9a2/+1Gzh5pFWngZkiwDu8yOWGP2MRCu/EfxrJdvgfqC
 EuD9sMDZOeMMcLhVlUQOBAkfqKI0vRNwmve6vE8IUPb4i5r/eXYDRUObkfU0CENfqFoNI4Fw
 Ps6vJ9E4gOyvRMmL9Kag30G7G+LNHEBD/0qu5xy7FUHUeb3JoWuuaDhNxI=
IronPort-HdrOrdr: A9a23:rKG69Kmd15tfHxegMbj0J+OFyRXpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE8Qr5OUtQ/+xoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCBHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.87,265,1631592000"; 
   d="scan'208";a="59062303"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 08/65] xen: Annotate fnptr targets from acpi_table_parse()
Date: Fri, 26 Nov 2021 12:33:49 +0000
Message-ID: <20211126123446.32324-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/boot.c                 | 24 ++++++++++++------------
 xen/arch/x86/hvm/dom0_build.c            | 16 ++++++++--------
 xen/arch/x86/srat.c                      |  4 ++--
 xen/arch/x86/tboot.c                     |  2 +-
 xen/arch/x86/x86_64/acpi_mmcfg.c         |  2 +-
 xen/arch/x86/x86_64/mmconfig.h           |  2 +-
 xen/drivers/acpi/apei/hest.c             |  4 ++--
 xen/drivers/acpi/numa.c                  | 10 +++++-----
 xen/drivers/passthrough/amd/iommu_acpi.c |  9 +++++----
 xen/drivers/passthrough/pci.c            |  3 ++-
 xen/drivers/passthrough/vtd/dmar.c       |  2 +-
 xen/include/asm-x86/tboot.h              |  2 +-
 xen/include/xen/acpi.h                   |  2 +-
 13 files changed, 42 insertions(+), 40 deletions(-)

diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
index 24702d041c9c..43953b385533 100644
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
index 43e1bf12488a..a3c47de3c7e5 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -737,15 +737,15 @@ static int __init pvh_setup_cpus(struct domain *d, paddr_t entry,
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
@@ -756,15 +756,15 @@ static int __init acpi_set_intr_ovr(struct acpi_subtable_header *header,
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
index 036f5c2b1ffa..e75c82d11bd6 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1218,7 +1218,8 @@ static bool_t hest_source_is_pcie_aer(const struct acpi_hest_header *hest_hdr)
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
diff --git a/xen/include/asm-x86/tboot.h b/xen/include/asm-x86/tboot.h
index bfeed1542fa3..818d5fa45132 100644
--- a/xen/include/asm-x86/tboot.h
+++ b/xen/include/asm-x86/tboot.h
@@ -124,7 +124,7 @@ void tboot_probe(void);
 void tboot_shutdown(uint32_t shutdown_type);
 int tboot_in_measured_env(void);
 int tboot_protect_mem_regions(void);
-int tboot_parse_dmar_table(acpi_table_handler dmar_handler);
+int cf_check tboot_parse_dmar_table(acpi_table_handler dmar_handler);
 int tboot_s3_resume(void);
 void tboot_s3_error(int error);
 int tboot_wake_ap(int apicid, unsigned long sipi_vec);
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 088c238a504a..c82d5367bfb5 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -90,7 +90,7 @@ struct acpi_subtable_header *acpi_table_get_entry_madt(enum acpi_madt_type id,
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


