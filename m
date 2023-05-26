Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2E9712542
	for <lists+xen-devel@lfdr.de>; Fri, 26 May 2023 13:08:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540062.841549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VIN-0007qE-Np; Fri, 26 May 2023 11:07:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540062.841549; Fri, 26 May 2023 11:07:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2VIN-0007j7-IY; Fri, 26 May 2023 11:07:43 +0000
Received: by outflank-mailman (input) for mailman id 540062;
 Fri, 26 May 2023 11:07:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gDTS=BP=citrix.com=prvs=5031e17c9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q2VIK-0006sm-4j
 for xen-devel@lists.xenproject.org; Fri, 26 May 2023 11:07:40 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86c738e5-fbb5-11ed-b230-6b7b168915f2;
 Fri, 26 May 2023 13:07:39 +0200 (CEST)
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
X-Inumbo-ID: 86c738e5-fbb5-11ed-b230-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685099258;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EimvUEFnHc9YAG/yN5Pgzk9rUwYKNv9peudeFTVu77c=;
  b=PvKL+afdQnaNWhiSZ5B9SnzxTg7o+V21zHDXathmm1JiN3DJLKq+t8Pk
   LaKKELoh0eF9Hy0JZaEmLyvkTkvz0kdOF7cECWLpJ0AORxlfxB8Pd6vKe
   0+ZNHWmngystJIpGpggQ9nxaA6GoeOChk0MIKxca+ABvWuKtFqhrppCER
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109294593
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:l5hXo6yNE+lXeo8WdSx6t+cnxirEfRIJ4+MujC+fZmUNrF6WrkVUn
 DMZDWyHOa7ZN2H0e4t1PoWz8E0Ovp7XndRlTQQ/rSAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRjP64T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUpBr
 NInKmE8VwiK37O2462dVOYrj9t2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKZOUYn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwNzxzJ+
 j+XpAwVBDkibNWklxuq20uioeXTkQTXYLAyN7q3o6sCbFq7mTVIVUx+uUGAiea9ol6zXZRYM
 UN80jojq+0++VKmSvH5XgakuziUsxgEQd1SHuYmrgaXxcL8wSyUG2wFRT5pc8E9uYk9QjlC6
 7OSt4q3X3o16uTTEC/DsO7O9lteJBT5M0cpanYqcglU0uD7qdlijjHQaMhsV6eq24id9S7L/
 xiGqy03hrM2hMEN1rmm8V2vvw9AtqQlXSZuuFyJAzvNAhdRIdf8Otf2sQSzAeNodt7xc7WXg
 JQTdyFyBsgqBIrFqiGCSf5l8FqBt6fca220bbKC8vAcG9WRF5yLJ9g4DNJWfh0B3iM4ldjBP
 ifuVft5vsM7AZdTRfYfj3iNI8or17P8Mt/uS+rZaNFDCrAoKl/apHo/ORLJgTG3+KTJrU3ZE
 c3HGSpLJS9AYZmLMRLsH7tNuVPV7nxWKZzvqWDTkE38jOv2iI+9QrYZKlqeBt0EAFe/iFyNq
 b53bpLaoyizpcWiOkE7B6ZPdwFVRZX6bLiqw/FqmhmreFc+Qz15UKaAmNvMueVNxsxoqwsBx
 VnlMmcw9bY1rSGeQelWQhiPsI/SYKs=
IronPort-HdrOrdr: A9a23:SC0f8Kufta02ZhVw7QSW8kU07skDhtV00zEX/kB9WHVpm6yj+v
 xG/c5rsSMc7Qx6ZJhOo7+90cW7L080lqQFhLX5X43SPzUO0VHARO1fBO3ZogEIcxeUygc379
 YDT0ERMr3N5CNB/KHHCAnTKadd/DGEmprY+ts3GR1WPH9Xg6IL1XYJNu6CeHcGIjWvnfACZe
 ChDswsnUvYRV0nKv6VK1MiROb5q9jChPvdEGM7705O0nj3sduwgoSKaCSl4g==
X-Talos-CUID: 9a23:baL6FGBHnqecSeb6EwJorWArGJEUS2XUlCbQAFCeF2kuQaLAHA==
X-Talos-MUID: 9a23:fcjH6ggysa07Z57y66MR+cMpDJ9h2PqPJ2k0n7IMp8WjGRRCGxSag2Hi
X-IronPort-AV: E=Sophos;i="6.00,194,1681185600"; 
   d="scan'208";a="109294593"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 3/4] x86/cpu-policy: Rearrange guest_common_default_feature_adjustments()
Date: Fri, 26 May 2023 12:06:55 +0100
Message-ID: <20230526110656.4018711-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
References: <20230526110656.4018711-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This is prep work, split out to simply the diff on the following change.

 * Split the INTEL check out of the IvyBridge RDRAND check, as the former will
   be reused.
 * Use asm/intel-family.h to remove a raw 0x3a model number.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 74266d30b551..bdbc5660acd4 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -10,6 +10,7 @@
 #include <asm/cpu-policy.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/svm/svm.h>
+#include <asm/intel-family.h>
 #include <asm/msr-index.h>
 #include <asm/paging.h>
 #include <asm/setup.h>
@@ -429,21 +430,24 @@ static void __init guest_common_max_feature_adjustments(uint32_t *fs)
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
 {
-    /*
-     * IvyBridge client parts suffer from leakage of RDRAND data due to SRBDS
-     * (XSA-320 / CVE-2020-0543), and won't be receiving microcode to
-     * compensate.
-     *
-     * Mitigate by hiding RDRAND from guests by default, unless explicitly
-     * overridden on the Xen command line (cpuid=rdrand).  Irrespective of the
-     * default setting, guests can use RDRAND if explicitly enabled
-     * (cpuid="host,rdrand=1") in the VM's config file, and VMs which were
-     * previously using RDRAND can migrate in.
-     */
-    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
-         boot_cpu_data.x86 == 6 && boot_cpu_data.x86_model == 0x3a &&
-         cpu_has_rdrand && !is_forced_cpu_cap(X86_FEATURE_RDRAND) )
-        __clear_bit(X86_FEATURE_RDRAND, fs);
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    {
+        /*
+         * IvyBridge client parts suffer from leakage of RDRAND data due to SRBDS
+         * (XSA-320 / CVE-2020-0543), and won't be receiving microcode to
+         * compensate.
+         *
+         * Mitigate by hiding RDRAND from guests by default, unless explicitly
+         * overridden on the Xen command line (cpuid=rdrand).  Irrespective of the
+         * default setting, guests can use RDRAND if explicitly enabled
+         * (cpuid="host,rdrand=1") in the VM's config file, and VMs which were
+         * previously using RDRAND can migrate in.
+         */
+        if ( boot_cpu_data.x86 == 6 &&
+             boot_cpu_data.x86_model == INTEL_FAM6_IVYBRIDGE &&
+             cpu_has_rdrand && !is_forced_cpu_cap(X86_FEATURE_RDRAND) )
+            __clear_bit(X86_FEATURE_RDRAND, fs);
+    }
 
     /*
      * On certain hardware, speculative or errata workarounds can result in
-- 
2.30.2


