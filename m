Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1DC1BF4BC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 12:00:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU5z8-0003It-1Y; Thu, 30 Apr 2020 10:00:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rLHY=6O=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jU5z6-0003Io-2o
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 10:00:00 +0000
X-Inumbo-ID: 5922d6a4-8ac9-11ea-9a1a-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5922d6a4-8ac9-11ea-9a1a-12813bfff9fa;
 Thu, 30 Apr 2020 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1588240798;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JNA2EqtL+1PvxFWyMchGBptIJFGtuDtjmUmW4f6lunw=;
 b=FxlSxna6K0BieRCQmkbok9T7uD1A4x9jRFAqRQnnV7faGsXTxG3OjSIj
 I4luP8ZlSzg2IJAcizy+0SsTlh3irsujLzOCiCf4n/NTjlOh9+fz7p9+c
 ynmMXjX/Ax9k7AFfsCXG49yxc9OK2IsyV662SykmpDKUxRbMa1uhiTqv2 8=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa1.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa1.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa1.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: T7+UfYGJ/hxUYpCQq/cbrS/bkyROfMxy9vZZJrlt2dc7LtHJgzXW09coTpnq1Wgnp2ogL7sFDK
 AIz7kQicSgNcj8wba6nnskG4kPmq0lxHc9vOkmv1Wt2Yondis6IBep/ijqcT1sbqwkk1FQ5ded
 LpAysGfoc11SNdW87j/NcLXe826Lci2RcxC9WOcMXUaE2DYB71ldwdctLVMb57L8QsSM29FPEg
 SsL2G1tRFWYj2URId9/Uxq7eJ/Tfkop5iWxaV4qQPSEoAzdha7PMf2XKAZaS/11c2AedoqIeU1
 Y9I=
X-SBRS: 2.7
X-MesageID: 16749621
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,334,1583211600"; d="scan'208";a="16749621"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/amd: Initial support for Fam19h processors
Date: Thu, 30 Apr 2020 10:59:47 +0100
Message-ID: <20200430095947.31958-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Fam19h is very similar to Fam17h in these regards.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/cpu_idle.c     | 1 +
 xen/arch/x86/cpu/microcode/amd.c | 1 +
 xen/arch/x86/cpu/vpmu_amd.c      | 1 +
 xen/arch/x86/nmi.c               | 2 +-
 xen/arch/x86/traps.c             | 2 +-
 5 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/acpi/cpu_idle.c b/xen/arch/x86/acpi/cpu_idle.c
index e00f2a82de..b83446e77d 100644
--- a/xen/arch/x86/acpi/cpu_idle.c
+++ b/xen/arch/x86/acpi/cpu_idle.c
@@ -1356,6 +1356,7 @@ static void amd_cpuidle_init(struct acpi_processor_power *power)
 
     switch ( c->x86 )
     {
+    case 0x19:
     case 0x18:
         if ( boot_cpu_data.x86_vendor != X86_VENDOR_HYGON )
         {
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index 13bf9f4dee..89b656bd2b 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -125,6 +125,7 @@ static bool_t verify_patch_size(uint32_t patch_size)
         max_size = F16H_MPB_MAX_SIZE;
         break;
     case 0x17:
+    case 0x19:
         max_size = F17H_MPB_MAX_SIZE;
         break;
     default:
diff --git a/xen/arch/x86/cpu/vpmu_amd.c b/xen/arch/x86/cpu/vpmu_amd.c
index 3c6799b42c..eba47cd2a0 100644
--- a/xen/arch/x86/cpu/vpmu_amd.c
+++ b/xen/arch/x86/cpu/vpmu_amd.c
@@ -576,6 +576,7 @@ int __init amd_vpmu_init(void)
     {
     case 0x15:
     case 0x17:
+    case 0x19:
         num_counters = F15H_NUM_COUNTERS;
         counters = AMD_F15H_COUNTERS;
         ctrls = AMD_F15H_CTRLS;
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index c3f92ed231..014524486f 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -398,7 +398,7 @@ void setup_apic_nmi_watchdog(void)
     case X86_VENDOR_AMD:
         switch (boot_cpu_data.x86) {
         case 6:
-        case 0xf ... 0x17:
+        case 0xf ... 0x19:
             setup_k7_watchdog();
             break;
         default:
diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 0bcf554e93..33e5d21ece 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1939,7 +1939,7 @@ static unsigned int calc_ler_msr(void)
         switch ( boot_cpu_data.x86 )
         {
         case 6:
-        case 0xf ... 0x17:
+        case 0xf ... 0x19:
             return MSR_IA32_LASTINTFROMIP;
         }
         break;
-- 
2.11.0


