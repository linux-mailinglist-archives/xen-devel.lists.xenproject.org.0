Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF4345EEC3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:08:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232885.404120 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxY-0003Gh-9W; Fri, 26 Nov 2021 13:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232885.404120; Fri, 26 Nov 2021 13:08:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqaxX-00035W-K2; Fri, 26 Nov 2021 13:08:11 +0000
Received: by outflank-mailman (input) for mailman id 232885;
 Fri, 26 Nov 2021 13:08:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqavr-0002zD-Qh
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:06:27 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8fd2f83-4eb9-11ec-9787-a32c541c8605;
 Fri, 26 Nov 2021 14:06:26 +0100 (CET)
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
X-Inumbo-ID: a8fd2f83-4eb9-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mCzjaOkn5BbOoEcopUe7WTJn31Et1DKHCsnFeiI7nEk=;
  b=c63xE59rmRwkgBgSnzCSydDt09D9EqApNKEbZs+foyyNRTtIE2x7A4Tv
   E8UGTz5FjqLF/RzCqIOiOy6jdivWdfjviwHY2BG5Jx2spl/2yC4hCYAHc
   tGUj2jh5DBsNExzuKPMkoUjW92XQ+ZAOMhm5nVs3X0R5YC1+mb8HX9Jlp
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: CTBTXSicJyP10PojeuUE/4iFSsYI4LUQxEqKPWHbFG5/tCPVhOKDv8jc0MBfADjZBwKs5uPIGZ
 0FpDcsOxngyrsk3RJuJci5aipK+bmI3B2abPVwUEyv4l7BCHABJnkUzP64Uwiqvi/zD1/MB9x4
 009SpuOsCZ0iSfdVo9EMK72L5ozWdCnv9k8hnH8UcQXcMDQs96pChbd4+o0zc0uH0kS5tPQKAZ
 bNsClq33TkEL6PY9p5lkgQ/XaFO9+UVXXD63m1Xhg+W06SE+QoOz/uUJNX7COrqoeUn4+qVoUH
 OH4Dax9hvGU36zVb84LcTsbD
X-SBRS: 5.1
X-MesageID: 60695367
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:J5RZXquvqRJMrAh2x7OgLh7rTefnVJtZMUV32f8akzHdYApBsoF/q
 tZmKWzUbPiDYWHzetslb43np0kB6JSDzN8xTwFkqH01Hy1H+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHhJZS5LwbZj29cx24bhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplv4KcWDwmG4H3qOkCVB5IVB5xEp9dweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DFYUToHx/ixreCu4rW8vrSKTW/95Imjw3g6iiGN6AP
 5RINGExM3wsZTVVOno9B54Dgd6woXjad2UHjGmz4pc4tj27IAtZj+G2bYu9lsaxbdpRtlaVo
 CTB5WuRKjMwOcGbyDGF2mmxneKJliT+MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+ckxBC2xY/42DaUGW8DXnl+Z/MUr/ZjEFTGy
 WS1t9/uADVutpicRnSc6qqYoFuOBMQFEYMRTXRaFFVYurEPtKl210uSFYg7TMZZm/WsQWmoq
 w1muhTSkFn6YSQj86ygtW7KjDu3znQiZl5kv16HNo5JA+4QWWJEW2BKwQSEhRqjBNzAJrVkg
 JTis5PFhAzpJcvQ/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43aZlUJ2K2M
 RON5Vg5CHpv0J2CNvQfj2WZUZlC8EQdPY69CqC8giRmPvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/rdROcAtUdCdjXvgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:ro6YL6Po0936JcBcTvujsMiBIKoaSvp037Eqv3oRdfUzSL3hqy
 nOpoVj6faaskdzZJhNo7+90ey7MBfhHP1OkO8s1NWZLWvbUQKTRekIh+aP/9SjIVyYygc079
 YaT0EUMr3N5DZB4/oSmDPIduod/A==
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="60695367"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 37/65] x86/quirks: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:18 +0000
Message-ID: <20211126123446.32324-38-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
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


