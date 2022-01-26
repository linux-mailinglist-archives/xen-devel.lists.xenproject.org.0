Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B66049C57B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jan 2022 09:45:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260716.450675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvW-0000QF-EE; Wed, 26 Jan 2022 08:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260716.450675; Wed, 26 Jan 2022 08:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCdvW-0000KQ-8x; Wed, 26 Jan 2022 08:45:14 +0000
Received: by outflank-mailman (input) for mailman id 260716;
 Wed, 26 Jan 2022 08:45:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DU/T=SK=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nCdvV-000088-0k
 for xen-devel@lists.xenproject.org; Wed, 26 Jan 2022 08:45:13 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 460c27e0-7e84-11ec-8eb8-a37418f5ba1a;
 Wed, 26 Jan 2022 09:45:12 +0100 (CET)
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
X-Inumbo-ID: 460c27e0-7e84-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643186711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GrQTjmANh8UZabUWhSSvNr7vTaRzKEVUsBsn2eUeX+c=;
  b=g1t9akpiaCWMezcCR19Q/Qq7EgkDkyLBX9BMLHUzQaw4DAlZZPcwc+E2
   46mFmaaxO4rX+MiTAaMQ4TSPkO+6jKWjvzZIjqZA3iaW6r2fo7znCAjNx
   ni7FgHOHG83NwOYSrh7QPbyXKIQpx8Glfu1T6HU4y80GvZbKC3lGfmgl3
   c=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: URKlWtNEx2vmIBHwWfZSPJeolnlGSKon28GiMVExP3rFLkBqi4vykSppC3LFyYm23Rsnas6ABP
 dskmSwvfJtDSIkdF1FokylUyo/t/Ne7RevIfgTdo2taSSWKR2hB/DU2btYLGdbaVsP0jA6oXP8
 05gr4Ecsl8AV0zYs8SIur6jdi4GCokpTXfTeESRc/aL5kP+fRq4+dwED4MnWJz1EEeQucAofXx
 zSV9KupVFmB2TmERhWQhyW63w9TYYOEo0GaaMyIfCUCnQ8PzQRxqu3qWTbgvocK0kSZmUGpHuA
 lpQq7aDZK6Y5oyAh2n93Q7jP
X-SBRS: 5.2
X-MesageID: 62700208
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZiU0k6yFeHWYO12CxWF6t+fjwSrEfRIJ4+MujC+fZmUNrF6WrkUDx
 zBKWGmCP/qIYWH1eYxxOt/l8U4H7MPTydNlGQE6pCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnvopW1TYhSEUOZugH9IQM8aZfHAhLeNYYH1500g7wrRn2tcAbeWRWGthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9VfrzEZqZPXrgKrS4K8bhL
 wr1IBNVyUuCl/slIovNfr8W6STmSJaKVeSFoiI+t6RPHnGuD8H9u0o2HKN0VKtZt9mGt9Yu9
 4hOqrX3cCY0NajQveE6fiREGj4raMWq+JefSZS+mcmazkmAeHrw2fR+SkoxOOX0+M4uXzsIr
 6ZBbmlQMFbT3Ipaw5riIgVoru0lINPmI8U0vXZ4wCuCJf0nXYrCU+PB4towMDIY2JoRRa6EP
 5pxhTxHaDDDYjJJAA4uL60TzKD5qHD/cjNXpwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krk1WnkBhARNPSE1CGItHmrg4fnjS79HY4fCrC83vprm0GIgHweDgUMUlm2quX/jVSxM++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDYaBOUNEPITrzis16HR/yOcIUU5UjdePYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOczZcOHZsoR8tpoC6/dpt1k6nosNLTfbt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+bTNL0D2BLwQKChRqlEGp/ZgPQ1
 JTjs5PGhN3i9bnXyESwrBwlRdlFHcqtPjzGmkJIFJI87Tmr8HPLVdkOvGonfxo3bppZKWCBj
 KrvVeV5vs470JyCNvcfXm5MI55ykfiI+SrNC5g4keaikrAuLVTarUmClGab3nz3kVhErE3ME
 czzTCpYNl5DUf4P5GPvH481iOZ3rghjmz+7bc2lnnyPjOrPDFbIGOxtGAbfMYgEAFas/V+9H
 yB3bZXakn2ykYTWP0HqzGLkBQladCdgXcGv9ZU/myzqClMOJVzNwsT5mdsJE7GJVYwL/gsR1
 n3iCEJe1nTlgnjLdVeDZnx5Meu9Vpdjt3MreycrOA/wiXQkZI+u6oYZdoc2IuZ7pLAyk6YsQ
 qlXYdiED9ROVi/Dp2YXY67iodEwbx+snw+PYXaoOWBtY556SgXV0db4ZQ+zpjIWBy+6uJJm8
 b2t3w/WW7QZQAFmAJqEYf6j1Qrp73MchPhzTw3DJdwKIBfg941jKirQiP4rIp5TdUWfl2XCj
 wvPWEUWv+jApYMx4eLlv6Hcotf7CfZ6E2pbA3LfseS8Ox7F8zfx2oRHSuuJI2zQDTum5KW4a
 OxJ5PjgK/lbzk1Suo9xHrs3n6Iz49zj++1Twgh+RSiZal2qDvVrI2Wc3NkJvapIn+cLtQyzU
 0OJ299bJbTWZ5+1TA9PfFIoPraZyPUZujjO9vBkckz16Rh+8KeDTUgPbQKHjzZQLectPY4oq
 Qv7VBX6N+BrZsIWD+u7
IronPort-HdrOrdr: A9a23:Fc++0qjx9an3AlvQHX9JtfF1l3BQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.88,317,1635220800"; 
   d="scan'208";a="62700208"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 2/8] x86/boot: Collect AMD speculative features earlier during boot
Date: Wed, 26 Jan 2022 08:44:46 +0000
Message-ID: <20220126084452.28975-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220126084452.28975-1-andrew.cooper3@citrix.com>
References: <20220126084452.28975-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

All AMD IBRS-related features are in CPUID.0x80000008.ebx.  Collect them in
early_cpu_init() so init_speculative_mitigations() can use them.

Rework the existing logic structure to fill in c->extended_cpuid_level and
separate out the ambiguous use of ebx in an otherwise 0x80000008-specific
logic block.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu/common.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 4a163afbfc7e..866f1a516447 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -348,9 +348,13 @@ void __init early_cpu_init(void)
 	}
 
 	eax = cpuid_eax(0x80000000);
-	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
-		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
-		eax = cpuid_eax(0x80000008);
+	if ((eax >> 16) == 0x8000)
+		c->extended_cpuid_level = eax;
+
+	if (c->extended_cpuid_level >= 0x80000008) {
+		cpuid(0x80000008, &eax,
+		      &c->x86_capability[cpufeat_word(X86_FEATURE_CLZERO)],
+		      &ecx, &edx);
 
 		paddr_bits = eax & 0xff;
 		if (paddr_bits > PADDR_BITS)
@@ -363,10 +367,11 @@ void __init early_cpu_init(void)
 		hap_paddr_bits = ((eax >> 16) & 0xff) ?: paddr_bits;
 		if (hap_paddr_bits > PADDR_BITS)
 			hap_paddr_bits = PADDR_BITS;
+	}
 
+	if (c->extended_cpuid_level >= 0x8000001f)
 		/* Account for SME's physical address space reduction. */
-		paddr_bits -= (ebx >> 6) & 0x3f;
-	}
+		paddr_bits -= (cpuid_ebx(0x8000001f) >> 6) & 0x3f;
 
 	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
 		park_offline_cpus = opt_mce;
-- 
2.11.0


