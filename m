Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2034B511C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271723.466432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3o-0002r6-4k; Mon, 14 Feb 2022 13:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271723.466432; Mon, 14 Feb 2022 13:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJb3n-0002dA-Be; Mon, 14 Feb 2022 13:06:31 +0000
Received: by outflank-mailman (input) for mailman id 271723;
 Mon, 14 Feb 2022 13:06:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb2h-00023t-4r
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:05:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c2e7a5a7-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:05:21 +0100 (CET)
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
X-Inumbo-ID: c2e7a5a7-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843922;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=QPTLA3fxBXu+aWVC9A50VpUZzEOTsG18u0DPp6i34Rw=;
  b=GSed5NuU4e7fyLn0FMMiVRKkmFUBsHkcWiGsNsy0ZBSaAUBGdEl/TjYZ
   f4G2yyGAFgMANxZ/q07xVsOUoMOE03VS61qJjgZMiRoQpRjKAuqGROqR/
   CNBQoC9SPSvTC7g1lfAoQGSnlcCHdEYuOrSXQYE+YGWH7HkLENkK32xB1
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: c2M73LM69pIwwg1qbCGadoc2ajN9nWF7fZKXxFINZQUIpiechXqiAM9dhGJRicOlH0lNnjKFUQ
 uRNM54fdc3VLddtTFmb1I3uw+xRbmLH+N3tsIZZyCG2VaLCTQ1miqgwmvPZ0J0RSYQLeqINKjW
 /iAsNvjfnQFuzqBsvL97tC4RpaIEBEJU8jaIgQGLTVsvmmofbjewZ/5gnQklSp9gPvcsDymhVj
 GBu4iqutX8ozgWDIl5uHZJfmxUzlIdtgsuPl5sUCoEYq4uaNcVzAeioK2v+5Cg16zFWHUa5uMy
 MyI7uxoZD3JGT23iz1kxgoLg
X-SBRS: 5.1
X-MesageID: 64149399
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:NrpN56M6BtRU0fbvrR27kMFynXyQoLVcMsEvi/4bfWQNrUon1jAEy
 zRNCj2Da/+IZ2unetwiPN7j9U8F6pPRyt5gGQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500s/w7dRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYo2WQrs8ux
 5IQjIyPFAwXObWTwuENXzANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmtp2pEVTKe2i
 8wxZytwSyqZTx1zak4uM5U9oqCL2mLEbGgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3EuwPUtXqlAsRITuT+r6M0xg3IroAONPEIfQuikObmhQnjYsJgd
 kcq/TJx960i+GX+G7ERQCaEiHKDuxcdXf9ZHOs79ByBx8Lo3uqJOoQXZmUfMYJ77afaURRvj
 wbUxI2xWVSDpZXIESr1y1uCkd+l1cH5x0cmbDRMcwYK6sKLTGob3kOWFYYL/EJYY7TI9dDML
 9Ki8XJWa1Y715djO0CHEbfv2WzEm3QxZlRpjjg7p0r8hu+DWKarZpaz9X/Q5utaIYCSQzGp5
 SZYx5fOvL1TVcjWzkRhpdnh+5nzuZ643MD02wYzT/HNCRzxk5JcQWygyG4nfxo4Wir1UTTof
 FXSqWtsCGx7ZxOXgVtMS9vpUawClPG4ffy8D6y8RoceM/BZKV7clAkzNBH44owYuBV1+U3JE
 czAKpjE4LdzIfkP8QdasM9Dje51lnhmnzu7qFKS503P7IdyrUW9Ed8tWGZipMhghE9diAmKo
 dtZKeWQzBBTDL/3biXNqNZBJlEWN3krQ5vxrpUPJOKEJwNnHkAnCuPQnux9K9A0wfwNm7ea5
 Gy5V29Z1EH72S/NJzKVZy0xc7joR5t+8y42ZHR+IVay1nE/So+z96NDJYAvdLwq+bU7n/55R
 vUIYeuaBfFLRmiV8jgRd8Cl/odjaA6qlUSFOC/8OGozeJtpRgro/N74f1SwqHlSX3Tv7cZn+
 u+uzALWR5YHVj9ONseOZaL91U61sFgchPl2AxnCLO5MdRi+64NtMSHw0KM6epleNRXZyzKG/
 A+KGhNE9/LVqoo4/dSV16CJq4ClT7l3EkZARjSJ6L+3MW/R/3a5wJ8GW+GNJGiPWGTx8aSkR
 ONU0/Cjb6FXwAcU69JxQ+Rx0KYzx9rzvLsLnA1rEULCY0mvFr49cGKN2tNCt/EVy7JU0edst
 pljJjWO1W21Bf7Y
IronPort-HdrOrdr: A9a23:qibe6KHniW4PmsTmpLqE6seALOsnbusQ8zAXP0AYc3Jom62j5r
 mTdZsgtSMc5Ax8ZJhko6HkBEDiewK7yXcW2/hzAV7KZmCP0wHEEGgh1/qH/9SJIVyYygc378
 ZdmsZFZ+EYdWIK7/rH3A==
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149399"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 41/70] x86/quirks: CFI hardening
Date: Mon, 14 Feb 2022 12:50:58 +0000
Message-ID: <20220214125127.17985-42-andrew.cooper3@citrix.com>
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
 xen/arch/x86/dmi_scan.c               | 10 +++++-----
 xen/arch/x86/hvm/quirks.c             |  2 +-
 xen/arch/x86/shutdown.c               |  2 +-
 xen/arch/x86/x86_64/mmconfig-shared.c |  8 ++++----
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/dmi_scan.c b/xen/arch/x86/dmi_scan.c
index d27cd3450a29..81f80c053a7a 100644
--- a/xen/arch/x86/dmi_scan.c
+++ b/xen/arch/x86/dmi_scan.c
@@ -476,7 +476,7 @@ static void __init dmi_save_ident(const struct dmi_header *dm, int slot, int str
 #define NO_MATCH	{ DMI_NONE, NULL}
 #define MATCH		DMI_MATCH
 
-static int __init ich10_bios_quirk(const struct dmi_system_id *d)
+static int __init cf_check ich10_bios_quirk(const struct dmi_system_id *d)
 {
     u32 port, smictl;
 
@@ -499,14 +499,14 @@ static int __init ich10_bios_quirk(const struct dmi_system_id *d)
     return 0;
 }
 
-static __init int reset_videomode_after_s3(const struct dmi_blacklist *d)
+static __init int cf_check reset_videomode_after_s3(const struct dmi_blacklist *d)
 {
 	/* See wakeup.S */
 	acpi_video_flags |= 2;
 	return 0;
 }
 
-static __init int dmi_disable_acpi(const struct dmi_blacklist *d)
+static __init int cf_check dmi_disable_acpi(const struct dmi_blacklist *d)
 { 
 	if (!acpi_force) { 
 		printk(KERN_NOTICE "%s detected: acpi off\n",d->ident);
@@ -521,7 +521,7 @@ static __init int dmi_disable_acpi(const struct dmi_blacklist *d)
 /*
  * Limit ACPI to CPU enumeration for HT
  */
-static __init int force_acpi_ht(const struct dmi_blacklist *d)
+static __init int cf_check force_acpi_ht(const struct dmi_blacklist *d)
 { 
 	if (!acpi_force) { 
 		printk(KERN_NOTICE "%s detected: force use of acpi=ht\n", d->ident);
@@ -650,7 +650,7 @@ static const struct dmi_blacklist __initconstrel dmi_blacklist[] = {
  *	out of here.
  */
 
-static void __init dmi_decode(const struct dmi_header *dm)
+static void __init cf_check dmi_decode(const struct dmi_header *dm)
 {
 #ifdef DMI_DEBUG
 	const uint8_t *data = (const void *)dm;
diff --git a/xen/arch/x86/hvm/quirks.c b/xen/arch/x86/hvm/quirks.c
index 917356b1312c..2adab1f4b84b 100644
--- a/xen/arch/x86/hvm/quirks.c
+++ b/xen/arch/x86/hvm/quirks.c
@@ -25,7 +25,7 @@
 s8 __read_mostly hvm_port80_allowed = -1;
 boolean_param("hvm_port80", hvm_port80_allowed);
 
-static int __init dmi_hvm_deny_port80(const struct dmi_system_id *id)
+static int __init cf_check dmi_hvm_deny_port80(const struct dmi_system_id *id)
 {
     printk(XENLOG_WARNING "%s: port 0x80 access %s allowed for HVM guests\n",
            id->ident, hvm_port80_allowed > 0 ? "forcibly" : "not");
diff --git a/xen/arch/x86/shutdown.c b/xen/arch/x86/shutdown.c
index 30985d36a612..7619544d14da 100644
--- a/xen/arch/x86/shutdown.c
+++ b/xen/arch/x86/shutdown.c
@@ -158,7 +158,7 @@ static void default_reboot_type(void)
         reboot_type = BOOT_ACPI;
 }
 
-static int __init override_reboot(const struct dmi_system_id *d)
+static int __init cf_check override_reboot(const struct dmi_system_id *d)
 {
     enum reboot_type type = (long)d->driver_data;
 
diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
index 2fa7f3f0bc4b..74b22b71a19c 100644
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -62,7 +62,7 @@ static int __init cf_check parse_mmcfg(const char *s)
 }
 custom_param("mmcfg", parse_mmcfg);
 
-static const char __init *pci_mmcfg_e7520(void)
+static const char *__init cf_check pci_mmcfg_e7520(void)
 {
     u32 win;
     win = pci_conf_read16(PCI_SBDF(0, 0, 0, 0), 0xce);
@@ -84,7 +84,7 @@ static const char __init *pci_mmcfg_e7520(void)
     return "Intel Corporation E7520 Memory Controller Hub";
 }
 
-static const char __init *pci_mmcfg_intel_945(void)
+static const char *__init cf_check pci_mmcfg_intel_945(void)
 {
     u32 pciexbar, mask = 0, len = 0;
 
@@ -137,7 +137,7 @@ static const char __init *pci_mmcfg_intel_945(void)
     return "Intel Corporation 945G/GZ/P/PL Express Memory Controller Hub";
 }
 
-static const char __init *pci_mmcfg_amd_fam10h(void)
+static const char *__init cf_check pci_mmcfg_amd_fam10h(void)
 {
     uint32_t address;
     uint64_t base, msr_content;
@@ -190,7 +190,7 @@ static const char __init *pci_mmcfg_amd_fam10h(void)
     return "AMD Family 10h NB";
 }
 
-static const char __init *pci_mmcfg_nvidia_mcp55(void)
+static const char *__init cf_check pci_mmcfg_nvidia_mcp55(void)
 {
     static bool_t __initdata mcp55_checked;
     int bus, i;
-- 
2.11.0


