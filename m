Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B23239DCB6
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 14:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137912.255431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqEZm-0008Un-4u; Mon, 07 Jun 2021 12:41:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137912.255431; Mon, 07 Jun 2021 12:41:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqEZl-0008Sk-W5; Mon, 07 Jun 2021 12:41:53 +0000
Received: by outflank-mailman (input) for mailman id 137912;
 Mon, 07 Jun 2021 12:41:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Idvh=LB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lqEZk-0008S7-Dj
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 12:41:52 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9eec02b0-0cd6-421a-9f54-20416ddf6819;
 Mon, 07 Jun 2021 12:41:50 +0000 (UTC)
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
X-Inumbo-ID: 9eec02b0-0cd6-421a-9f54-20416ddf6819
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623069710;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=EUwbdajHIb7nM1V7Gjn97DWAT7BmqdvqQvlEjPG/Z2Y=;
  b=ZKP7x2uCOoyYTnlcJQ5pMu5u+vsPeSa+4nQGwNdacgMP5hVmCuU2Ip/3
   Y9HJVFYPG82NTPceCDCe2P6px/+kDm7pzbaucYt0Y8kuw1CRH4ShvEck0
   BWRHVEGw9wHOOFi5dKAfcyZ0LWPogmyFqw5iTesBMmowmuI9R/kX2JSP4
   k=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: guttQGPz8nEHEQjTupV9J5xNhv7wfSkU2bHCoZrjwXn00aVzSKEtZ5mBWWbdJCQrR8KObli2Gj
 plOXehOeDxlelB/UY2zTuO6gcKTnT28nJySc9ljk/o/pV8oaa2/CjOCJ0iZZhpNFo9mHBI+lDe
 Fmi2rTT/btERcYAR5IDsd8lSCN9zTygN06aafpZ7LDXBucyKM1ZnsBmGr1718ryypj9xjdNZSF
 CZwpvOWA2IOnoWqb21kBVCeo6nyMW3mFoWSw37VObCz3ZXsxqVRmLIMK7AuJRL3dT0nhSnktbz
 HHk=
X-SBRS: 5.1
X-MesageID: 45600744
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:giySK6PPkqMYcsBcTuajsMiBIKoaSvp037BL7TETdfU7SKGlfq
 yV88jztiWVtN9yYhsdcLm7UcG9qBXnm6KdibN7AV7IZmXbUQWTTb1K3M/O+nnEIAHQn9Qtt5
 tIQuxSBMfzNGNdye3n4Ay0euxQpOWvweSEif3d9kxKCSVncbtp4QtDBgnzKDwSeDV7
X-IronPort-AV: E=Sophos;i="5.83,255,1616472000"; 
   d="scan'208";a="45600744"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/cpuid: Drop special_features[]
Date: Mon, 7 Jun 2021 13:41:41 +0100
Message-ID: <20210607124141.24767-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

While the ! annotation is useful to indicate that something special is
happening, an array of bits is not.  Drop it, to prevent mistakes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpuid.c        | 2 --
 xen/include/asm-x86/cpuid.h | 1 -
 xen/tools/gen-cpuid.py      | 3 ---
 3 files changed, 6 deletions(-)

diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index 958caf35da..2079a30ae4 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -14,7 +14,6 @@
 #include <asm/xstate.h>
 
 const uint32_t known_features[] = INIT_KNOWN_FEATURES;
-const uint32_t special_features[] = INIT_SPECIAL_FEATURES;
 
 static const uint32_t __initconst pv_max_featuremask[] = INIT_PV_MAX_FEATURES;
 static const uint32_t hvm_shadow_max_featuremask[] = INIT_HVM_SHADOW_MAX_FEATURES;
@@ -1132,7 +1131,6 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
 static void __init __maybe_unused build_assertions(void)
 {
     BUILD_BUG_ON(ARRAY_SIZE(known_features) != FSCAPINTS);
-    BUILD_BUG_ON(ARRAY_SIZE(special_features) != FSCAPINTS);
     BUILD_BUG_ON(ARRAY_SIZE(pv_max_featuremask) != FSCAPINTS);
     BUILD_BUG_ON(ARRAY_SIZE(hvm_shadow_max_featuremask) != FSCAPINTS);
     BUILD_BUG_ON(ARRAY_SIZE(hvm_hap_max_featuremask) != FSCAPINTS);
diff --git a/xen/include/asm-x86/cpuid.h b/xen/include/asm-x86/cpuid.h
index 7baf6c9628..46904061d0 100644
--- a/xen/include/asm-x86/cpuid.h
+++ b/xen/include/asm-x86/cpuid.h
@@ -14,7 +14,6 @@
 #include <public/sysctl.h>
 
 extern const uint32_t known_features[FSCAPINTS];
-extern const uint32_t special_features[FSCAPINTS];
 
 void init_guest_cpuid(void);
 
diff --git a/xen/tools/gen-cpuid.py b/xen/tools/gen-cpuid.py
index b953648b65..c6b5056a8d 100755
--- a/xen/tools/gen-cpuid.py
+++ b/xen/tools/gen-cpuid.py
@@ -362,8 +362,6 @@ def write_results(state):
 
 #define INIT_KNOWN_FEATURES { \\\n%s\n}
 
-#define INIT_SPECIAL_FEATURES { \\\n%s\n}
-
 #define INIT_PV_DEF_FEATURES { \\\n%s\n}
 
 #define INIT_PV_MAX_FEATURES { \\\n%s\n}
@@ -384,7 +382,6 @@ def write_results(state):
 """ % (state.nr_entries,
        next(featureset_to_uint32s(state.common_1d, 1)),
        format_uint32s(state, state.names.keys(), 4),
-       format_uint32s(state, state.raw['!'], 4),
        format_uint32s(state, state.pv_def, 4),
        format_uint32s(state, state.pv_max, 4),
        format_uint32s(state, state.hvm_shadow_def, 4),
-- 
2.11.0


