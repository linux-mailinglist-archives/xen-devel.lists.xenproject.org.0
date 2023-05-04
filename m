Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292CC6F7337
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:39:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530041.825299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueni-00076n-Lu; Thu, 04 May 2023 19:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530041.825299; Thu, 04 May 2023 19:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pueni-00075k-Db; Thu, 04 May 2023 19:39:38 +0000
Received: by outflank-mailman (input) for mailman id 530041;
 Thu, 04 May 2023 19:39:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jZxo=AZ=citrix.com=prvs=48139b1ea=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pueng-00069W-U1
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:39:36 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6527462a-eab3-11ed-8611-37d641c3527e;
 Thu, 04 May 2023 21:39:35 +0200 (CEST)
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
X-Inumbo-ID: 6527462a-eab3-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1683229174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zzSgC6HAWJ6nHal+JPSc8THZj+muKjktvIIOzu9Oncs=;
  b=cF83aT6l8/tYaKNgyls/1FiSDoGc3pHbN7ueZNsHgXjfweStpxpGCjNB
   9Grpmg7tQVQrJPgsP20Zp3i3wYVHnpu49BVSF89fePxiD6t0VRn8DbpC+
   LltchoHfx0suwzmsR/SCrKDtZCxHRv8PTg2jjU98cfuc3KHEbEA+VZtft
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 107797746
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:xtR7A6qaSWy9tRyHh+JDUNRPxhxeBmJpZRIvgKrLsJaIsI4StFCzt
 garIBmGOPmMM2XyKNhzaYXkpEwE78ODmoRhSFNqrHs3ES1D85uZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weDzyVNVvrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAHMmVTCFi8aX/Orhe7FXjPoxM8XoDrpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jueoDuoXU5GarRzzxKgzkywvu+MwhrbG5xOMLel79JAkly6kzl75Bo+CgLg/KjRZlSFc8JSL
 QkY9zQjqYA29Ve3VZ/tUhugunmGsxUAHd1KHIUSyiuA167V6AaxHXUfQ3hKb9lOnNAybSwn0
 BmOhdyBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyNGyOLDpo0Xry6XFOc7K6SLnML5GgPJl
 mXiQDcFu1kDsSIa//zlrQuf2mj8+cehoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoKiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPawTo6/CKyNP4IVPfCdkTO6ENxGPxbMjwgBbmB1+U3AB
 XtrWZn1VitLYUiW5DG3W/0cwdcW+8zK/kuKHcqT503+gdKjiIu9Fe9t3K2mMrpos8tpYWz9r
 75iCid9408CC7OjOHOMqdF7wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:P+/wOKvIVTjVFEL5TrabSDgW7skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpGbJYVcqKRcdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyJMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-Talos-CUID: =?us-ascii?q?9a23=3ACHfxhGkBUSk+04PNzU9cOw5MZdHXOT7291fWL2u?=
 =?us-ascii?q?ZNT4zeeWuQ2GC569nofM7zg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AqQyYbA5W6tsc8JvWB0+MugbDxoxN35qyMEBOzqw?=
 =?us-ascii?q?m+NfYESZtIhu3njWeF9o=3D?=
X-IronPort-AV: E=Sophos;i="5.99,250,1677560400"; 
   d="scan'208";a="107797746"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/6] x86/cpu-policy: Drop build time cross-checks of featureset sizes
Date: Thu, 4 May 2023 20:39:19 +0100
Message-ID: <20230504193924.3305496-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
References: <20230504193924.3305496-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

These BUILD_BUG_ON()s exist to cover the curious absence of a diagnostic for
code which looks like:

  uint32_t foo[1] = { 1, 2, 3 };

However, GCC 12 at least does now warn for this:

  foo.c:1:24: error: excess elements in array initializer [-Werror]
    884 | uint32_t foo[1] = { 1, 2, 3 };
        |                        ^
  foo.c:1:24: note: (near initialization for 'foo')

and has found other array length issues which we want to fix.  Drop the cross
check now tools can spot the problem case directly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index ef6a2d0d180a..44c88debf958 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -883,12 +883,6 @@ void __init init_dom0_cpuid_policy(struct domain *d)
 
 static void __init __maybe_unused build_assertions(void)
 {
-    BUILD_BUG_ON(ARRAY_SIZE(known_features) != FSCAPINTS);
-    BUILD_BUG_ON(ARRAY_SIZE(pv_max_featuremask) != FSCAPINTS);
-    BUILD_BUG_ON(ARRAY_SIZE(hvm_shadow_max_featuremask) != FSCAPINTS);
-    BUILD_BUG_ON(ARRAY_SIZE(hvm_hap_max_featuremask) != FSCAPINTS);
-    BUILD_BUG_ON(ARRAY_SIZE(deep_features) != FSCAPINTS);
-
     /* Find some more clever allocation scheme if this trips. */
     BUILD_BUG_ON(sizeof(struct cpu_policy) > PAGE_SIZE);
 
-- 
2.30.2


