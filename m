Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D929A35C3C2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 12:23:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.108911.207814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVtie-0005Wg-MV; Mon, 12 Apr 2021 10:23:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 108911.207814; Mon, 12 Apr 2021 10:23:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVtie-0005WH-J5; Mon, 12 Apr 2021 10:23:00 +0000
Received: by outflank-mailman (input) for mailman id 108911;
 Mon, 12 Apr 2021 10:22:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lFJS=JJ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lVtid-0005WC-Rq
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 10:22:59 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e3b67369-f7c6-4f16-9735-837ae0ecc95b;
 Mon, 12 Apr 2021 10:22:58 +0000 (UTC)
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
X-Inumbo-ID: e3b67369-f7c6-4f16-9735-837ae0ecc95b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618222978;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9Ykt4fl1TU7I0tNEaI0oDsD7aBf/mH93g2h6yqeOZEw=;
  b=f4bLe33KLTngYeIDykveHVHuSYRZK+/OLCx8kLClXBUAEWkMNsnQW16v
   drQuJ/prXq87I7s12voqRYeOWHpYBafP1pXNtCXqE0DUp5A742FfpxgMc
   Pnt12+DGFwE1KMjRbscVmL9UvAnCRoBPYPF1Wz0RFOBeJJltW7o0XCDGo
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: oCoPzgyU4geQ4nhVe6gXDq+E2jiLmHxEV5r7+iR9PQA3VOQin2+iZ//W8BXLA9/ipx3UA4Bifp
 Aej1HZ+638OXOXiQYELqoPUiH8AUe5cGzA5VfE5TfZNSsaZe5MOwbXayMUllkQFTGWweJDjy6D
 sh+10cqkWFAVSWROW598N/zMEEAinr8rRdcTxTFTsU0Law+4N8IVEIGFaXaggNo8iHL4hfzqRS
 UBCHEOpE8f1DAdNsH4B67Z89jNqChr+Uq+2V4/kMBGUzjxpW2R9f7RbZM1obHSXTDxu+bR7n1n
 J7A=
X-SBRS: 5.1
X-MesageID: 41371793
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:9vhcj61qBBrN+p+7J7mEjAqjBFokLtp033Aq2lEZdDV/eMbwrb
 HLoN0w0xjohDENHEwxgNzoAsW9aF7/1bow24keOr++QBLr0VHCEKhO5ZbvqgeOJwTQ7ehYvJ
 0PT4FbBMfrBVZ3yebWiTPZL/8FwN2KtJ+lnv3fyXAFd2BXQppt5Qt4FQqXe3ceLGMqObMCCJ
 Ge6sBbzgDQGkg/U8LTPAhhY8Hz4/HNiZL6cVonKnccmW6zpALt0pC/Pzi0ty1uMQ9y/Q==
X-IronPort-AV: E=Sophos;i="5.82,216,1613451600"; 
   d="scan'208";a="41371793"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cpuid: Advertise no-lmsle unilaterally to hvm guests
Date: Mon, 12 Apr 2021 11:22:47 +0100
Message-ID: <20210412102247.2118-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

While part of the original AMD64 spec, Long Mode Segment Limit Enable was a
feature not picked up by Intel, and therefore didn't see much adoption in
software.  AMD have finally dropped the feature from hardware, and allocated a
CPUID bit to indicate its absence.

Xen has never supported the feature for guests, even when running on capable
hardware, so advertise the feature's absence unilaterally.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

There is nothing specifically wrong with exposing this bit to PV guests, but
the PV ABI doesn't include a working concept of MSR_EFER in the first place,
so exposing it to PV guests seems somewhat out-of-place.
---
 tools/libs/light/libxl_cpuid.c              | 1 +
 tools/misc/xen-cpuid.c                      | 1 +
 xen/arch/x86/cpuid.c                        | 6 ++++++
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 4 files changed, 9 insertions(+)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 289c59c742..be0bd81a9b 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -270,6 +270,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"rstr-fp-err-ptrs", 0x80000008, NA, CPUID_REG_EBX, 2, 1},
         {"wbnoinvd",     0x80000008, NA, CPUID_REG_EBX,  9,  1},
         {"ibpb",         0x80000008, NA, CPUID_REG_EBX, 12,  1},
+        {"no-lmsle",     0x80000008, NA, CPUID_REG_EBX, 20,  1},
         {"ppin",         0x80000008, NA, CPUID_REG_EBX, 23,  1},
 
         {"nc",           0x80000008, NA, CPUID_REG_ECX,  0,  8},
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 2d04162d8d..1a82089463 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -152,6 +152,7 @@ static const char *const str_e8b[32] =
 
     [12] = "ibpb",
 
+    [20] = "no-lmsle",
     /* [22] */                 [23] = "ppin",
 };
 
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 18b08d9b87..3ed0feac4a 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -456,6 +456,12 @@ static void __init calculate_hvm_max_policy(void)
     __set_bit(X86_FEATURE_X2APIC, hvm_featureset);
 
     /*
+     * We don't support EFER.LMSLE at all.  AMD has dropped the feature from
+     * hardware and allocated a CPUID bit to indicate its absence.
+     */
+    __set_bit(X86_FEATURE_NO_LMSLE, hvm_featureset);
+
+    /*
      * On AMD, PV guests are entirely unable to use SYSENTER as Xen runs in
      * long mode (and init_amd() has cleared it out of host capabilities), but
      * HVM guests are able if running in protected mode.
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index a501479820..0a4690decc 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -255,6 +255,7 @@ XEN_CPUFEATURE(CLZERO,        8*32+ 0) /*A  CLZERO instruction */
 XEN_CPUFEATURE(RSTR_FP_ERR_PTRS, 8*32+ 2) /*A  (F)X{SAVE,RSTOR} always saves/restores FPU Error pointers */
 XEN_CPUFEATURE(WBNOINVD,      8*32+ 9) /*   WBNOINVD instruction */
 XEN_CPUFEATURE(IBPB,          8*32+12) /*A  IBPB support only (no IBRS, used by AMD) */
+XEN_CPUFEATURE(NO_LMSLE,      8*32+20) /*S  EFER.LMSLE no longer supported. */
 XEN_CPUFEATURE(AMD_PPIN,      8*32+23) /*   Protected Processor Inventory Number */
 
 /* Intel-defined CPU features, CPUID level 0x00000007:0.edx, word 9 */
-- 
2.11.0


