Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A774737328
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 19:47:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552167.862090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfRv-0000OT-Vs; Tue, 20 Jun 2023 17:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552167.862090; Tue, 20 Jun 2023 17:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBfRv-0000L9-SQ; Tue, 20 Jun 2023 17:47:27 +0000
Received: by outflank-mailman (input) for mailman id 552167;
 Tue, 20 Jun 2023 17:47:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qnc8=CI=citrix.com=prvs=5286b1552=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qBfRu-0000Ki-OH
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 17:47:26 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81a9881c-0f92-11ee-8611-37d641c3527e;
 Tue, 20 Jun 2023 19:47:22 +0200 (CEST)
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
X-Inumbo-ID: 81a9881c-0f92-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1687283242;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=S9OCrltF7kAE9VaLowAPv00GEEs/amWFwY5c9PbQ2OY=;
  b=IkE7noqPtBn9Rr54BYCJjIex29DwrnBTL4mZKo3wB6lkUwI+94qWZGEg
   vetbJ40Y17eiG7Nm83orzq2ZEBSJEPSyMyko8xivslGAlKLGWwh1G7eOZ
   GgGlkrlN6Y7U9Z4AFZy2N+vUN0DCAsIvd0lCjoDPT4gWsrWIBtcIp2ad2
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112250688
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:LfxGjKu2T/XwUQgJ8mwHdYM4PefnVEpeMUV32f8akzHdYApBsoF/q
 tZmKW6PO6ncNzb0c9gjaIS/9ENSupHUmIQ1TlduqXs9FXgS+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AGEzyFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwGhofNE6GvfiMmPG2bdRVxZkKCfTqBdZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zucpTmhXEFKXDCZ4SjdyCiL3tXyoS/YB9lVKP7jr/VP21LGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8UYwgyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvBJTFpqqzTdnub+Z+dtzb0Mi8QRVLufgddE1FDuYO65thu0FSWFI0L/LOJYsPdKxvim
 W6PljIE3/YeqvMylPiS2G3Gumf5znTWdTLZ9jk7T0r8sFMmPt7/PdXzgbTIxa0eddjEFzFtq
 FBBwpHDt75WUPlhgQTXGI0w8KeVC+Fp2dE2qXpmBNEf+juk4BZPlqgAsWgldC+F3ivpEAIFg
 XM/WisLvve/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwNRHJjjGwwBhxzf9X1
 XKnnSCEVyty5UNPlmDeegvg+eVzmnBWKZ37GPgXMChLIZLBPSXIGN/pwXOFb/wj7bPsnekm2
 483Cid+8D0GCLeWSnCOoeYuwaUicSBT6Wbe95YGKYZu42NORAkcNhMm6elwJ9Y5z/oLx48lP
 BiVAydl9bY2vlWfQS3iV5ypQOm1NXqjhRrX5RARAGs=
IronPort-HdrOrdr: A9a23:Kwy3A6hlVOPL3u6FwZ7IjBYlh3BQXuAji2hC6mlwRA09TyX4ra
 yTdZEgviMc5wx/ZJhNo7690dC7MBXhHPxOgbX5TI3CYOCOggLBRuxfBODZsl7d8kPFh4pg/J
 YlX69iCMDhSXhW5PyKhzVQyuxQouVvJprY4Nvj8w==
X-Talos-CUID: =?us-ascii?q?9a23=3AfxIhp2jFjrie1hqonVJsEJFj3zJuQFfPlinVGVW?=
 =?us-ascii?q?CUSVkb4CsCgK53Z5lqp87?=
X-Talos-MUID: 9a23:NSgBYgblz+O6M+BTpWfW3hY6DvpU74fxUwcx0s5fsOzfOnkl
X-IronPort-AV: E=Sophos;i="6.00,257,1681185600"; 
   d="scan'208";a="112250688"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH] x86: Drop opt_pku entirely
Date: Tue, 20 Jun 2023 18:47:04 +0100
Message-ID: <20230620174704.3907275-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

This option is particularly dubious as Xen does not use Protection Keys, owing
to the sharing of pagetables with PV guests.  All this option does is hide PKU
by default from HVM guests, and is therefore redundant with the more generic
cpuid=no-pku.

The variable ought to be in __initdata given it's single user, but deleting it
entirely looks to be a better course of action.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Henry Wang <Henry.Wang@arm.com>
---
 CHANGELOG.md                      |  3 +++
 docs/misc/xen-command-line.pandoc | 10 ----------
 xen/arch/x86/cpu/common.c         |  7 -------
 3 files changed, 3 insertions(+), 17 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 7d7e0590f8c6..43f15dc34cbf 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -25,6 +25,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
  - Add support for AVX512-FP16 on x86.
  - On Arm, Xen supports guests running SVE/SVE2 instructions. (Tech Preview)
 
+### Removed
+ - On x86, the "pku" command line option has been removed.  It has never
+   behaved precisely as described, and redundant with "cpuid=no-pku".
 
 ## [4.17.0](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.17.0) - 2022-12-12
 
diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 4060ebdc5d76..9d66688bd1ff 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1950,16 +1950,6 @@ for all of them (`true`), only for those subject to XPTI (`xpti`) or for
 those not subject to XPTI (`no-xpti`). The feature is used only in case
 INVPCID is supported and not disabled via `invpcid=false`.
 
-### pku (x86)
-> `= <boolean>`
-
-> Default: `true`
-
-Flag to enable Memory Protection Keys.
-
-The protection-key feature provides an additional mechanism by which IA-32e
-paging controls access to usermode addresses.
-
 ### ple_gap
 > `= <integer>`
 
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index cfcdaace125b..14021ffc66d8 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -29,10 +29,6 @@ bool __read_mostly opt_dom0_cpuid_faulting = true;
 bool_t opt_arat = 1;
 boolean_param("arat", opt_arat);
 
-/* pku: Flag to enable Memory Protection Keys (default on). */
-static bool_t opt_pku = 1;
-boolean_param("pku", opt_pku);
-
 unsigned int opt_cpuid_mask_ecx = ~0u;
 integer_param("cpuid_mask_ecx", opt_cpuid_mask_ecx);
 unsigned int opt_cpuid_mask_edx = ~0u;
@@ -522,9 +518,6 @@ void identify_cpu(struct cpuinfo_x86 *c)
 		this_cpu->c_init(c);
 
 
-   	if (c == &boot_cpu_data && !opt_pku)
-		setup_clear_cpu_cap(X86_FEATURE_PKU);
-
 	/*
 	 * The vendor-specific functions might have changed features.  Now
 	 * we do "generic changes."
-- 
2.30.2


