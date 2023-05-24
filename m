Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6630670F537
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 13:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538968.839409 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcj-0006vr-VU; Wed, 24 May 2023 11:25:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538968.839409; Wed, 24 May 2023 11:25:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcj-0006ta-Rg; Wed, 24 May 2023 11:25:45 +0000
Received: by outflank-mailman (input) for mailman id 538968;
 Wed, 24 May 2023 11:25:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1mci-0006nQ-8i
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 11:25:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b729bd84-fa25-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 13:25:42 +0200 (CEST)
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
X-Inumbo-ID: b729bd84-fa25-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684927542;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A+NR5il01dJbxGEp0G0M8wxuLUYrizJXy1p52xy/KWk=;
  b=JxN82FwO6dKy9lb2+ngbZy6VHUiBdD9QdygBJ1z3pI/fFHM3+knEMRPY
   JW/xM2Ms1JvwDCWrJHUGcZ7S9zqBw6aCH7TKIyB51FznQoJ8IptSI7B/g
   RhLsdMyTkzAJkGGOA0owWEILNalBDZmJFD4vGEXQ621dEhHaQHNN0Gg+4
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110226275
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:ijCp+6sjDkAJa6Kg7YiH+Z138ufnVF5eMUV32f8akzHdYApBsoF/q
 tZmKWCGa6yJYjfyc9snPYi+/UIPv8SHy9ExTFFuqCxjHiNE+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AKEyyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwEW0zKUyqtdmPxp2GbPdwhPkRNYrvI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zuepT6nWE5HXDCZ4SWp8FCWnf3FpADieL0iPqef1dlTmXTGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZTJY3Z6/ibMItxTgc/B9DKyIvMS2HS6ll
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkkfC+F0e5eI1cFh
 XM/XisPjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwNRLAgT69zBNywPtX1
 XKnnSGEVCxyNEia5GDuG7d1PUEDnUjSOl8/tbiklk/6gNJylVaeSKsfMUvmU93VGJis+V2Pm
 /4Gbpvi9vmqeLGmCsUh2dJJfA9iwLlSLcyelvG7gcbcf1M5QTh9WqC5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:3mGHUK0SBdDGszx9Qs00IQqjBHYkLtp133Aq2lEZdPU0SKGlfq
 GV7ZEmPHrP4gr5N0tOpTntAse9qBDnhPxICOsqXYtKNTOO0AeVxelZhrcKqAeQeBEWmNQ96U
 9hGZIOcuEZDzJB/LvHCN/TKadd/DGFmprY+ts31x1WPGVXgzkL1XYANu6ceHcGIzVuNN4CO7
 e3wNFInDakcWR/VLXBOpFUN9KzweEijfjdEGc7OyI=
X-Talos-CUID: 9a23:MW32G2AlI/WX9Yj6ExA6yglIM/IeS3vy8VHOP02FO38qTKLAHA==
X-Talos-MUID: 9a23:RwS9AgtXTfBb2hWyZ82nmx1gFv1z8a6XK1ktrqUsoe6nEhVpEmLI
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="110226275"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 02/10] x86/boot: Adjust MSR_ARCH_CAPS handling for the Host policy
Date: Wed, 24 May 2023 12:25:18 +0100
Message-ID: <20230524112526.3475200-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

We are about to move MSR_ARCH_CAPS into featureset, but the order of
operations (copy raw policy, then copy x86_capabilitiles[] in) will end up
clobbering the ARCH_CAPS value.

Some toolstacks use this information to handle TSX compatibility across the
CPUs and microcode versions where support was removed.

To avoid this transient breakage, read from raw_cpu_policy rather than
modifying it in place.  This logic will be removed entirely in due course.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 5e7e19fbcda8..49f5465ec445 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -411,7 +411,7 @@ static void __init calculate_host_policy(void)
     p->platform_info.cpuid_faulting = cpu_has_cpuid_faulting;
 
     /* Temporary, until we have known_features[] for feature bits in MSRs. */
-    p->arch_caps.raw &=
+    p->arch_caps.raw = raw_cpu_policy.arch_caps.raw &
         (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
          ARCH_CAPS_SKIP_L1DFL | ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO |
          ARCH_CAPS_IF_PSCHANGE_MC_NO | ARCH_CAPS_TSX_CTRL | ARCH_CAPS_TAA_NO |
-- 
2.30.2


