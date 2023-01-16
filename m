Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C0D66BD71
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 13:02:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478588.741848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHOBr-0008GB-Rr; Mon, 16 Jan 2023 12:02:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478588.741848; Mon, 16 Jan 2023 12:02:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHOBr-0008Dq-OW; Mon, 16 Jan 2023 12:02:15 +0000
Received: by outflank-mailman (input) for mailman id 478588;
 Mon, 16 Jan 2023 12:02:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbzH=5N=citrix.com=prvs=37389537a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pHOBq-0008Da-R0
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 12:02:14 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9aed3b76-9595-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 13:02:12 +0100 (CET)
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
X-Inumbo-ID: 9aed3b76-9595-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1673870532;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=95Vm59aOWK3yQFoHi4NAE+fawDfJISzzNS+lSYwNb3g=;
  b=Vy+WJZIUvZecYysnudguxq6DYOvBsWY23eWnCcHuUm7jydu6ZKEYdxr8
   WZ54J0K2iTQnKrufec5u973KnnLllFTxIO1WubqooyYIkOIxbuJo2CxSZ
   zlOCD8PhTaxkymdGX8jenf/DGRt78M+XtDnpbzp+7NQhmK95HJa+nsOtR
   s=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 93230991
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:iEbtzqCqP8dgshVW/1Ljw5YqxClBgxIJ4kV8jS/XYbTApDJz0GcDx
 jYeXT/UafiKYjb8ftkgbdvn8UhV7MPRyYAxQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nNHuCnYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbyRFtMpvlDs15K6p4GpB4ARnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwwMMnAjkXr
 fkhM3MTRBDcpOmk36u7Y7w57igjBJGD0II3v3hhyXfSDOo8QICFSKLPjTNa9G5u3IYUR6+YP
 pdHL2M1N3wsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9K4fQHp0Ezx/wS
 mTu+EKpGSsIa4Sj2TO0r1yqnOnxxhn+R9dHfFG/3qEz2wDCroAJMzUJUXOrrP//jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJSwCOnx7fQ4g2ZLnMZVTMHY9sj3PLaXhRzi
 AXPxYmwQ2Uy7vvMEyn1GqqoQS2aAw1FLjdbPSo9Vkgbydm8g4ohkQvPZ4M2eEKqteEZCQ0c0
 hjT8ndl2upN0ZVSv0mo1QuZ2mzx//AlWiZwv1yKBTz9s2uVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwYnY1RfHNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0MvQnO93vUJVwlvaI+THZuhf8N4omX3SMXFXfoHEGibC4gggBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreegvu+eZD+8zK/kuKHcqT503+gdKjiIu9Fe9t3K2mMrpos8tpYWz9r
 75iCid9404CCbOmMnGOodd7wJJjBSFTOK0aYvd/LoarSjeK0kl7YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:2z/mB6r3zR+z9qIOnrmMq78aV5rdeYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VAssRQb8+xoV5PufZqxz/BICMwqTNWftWrdyQyVxeNZnOjfKlTbckWTygce79
 YET0EXMrbN5DNB/KLHCWeDcurJwLO8gd+VbeW19QYScem9AZsQnjuQCWygYz1LrBEtP+tBKH
 IFjPA32gZJfx4sH7yGL0hAZcfvjfvRmqnrZBYXbiRXlDVn3VuTmcXH+wHz5GZlbw9y
X-IronPort-AV: E=Sophos;i="5.97,220,1669093200"; 
   d="scan'208";a="93230991"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hvm: Drop pat_entry_2_pte_flags
Date: Mon, 16 Jan 2023 12:02:01 +0000
Message-ID: <20230116120201.2829-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Converting from PAT to PTE is trivial, and shorter to encode with bitwise
logic than the space taken by a table counting from 0 to 7 in non-adjacent
bits.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

Noticed while reviewing other shadow patches
---
 xen/arch/x86/hvm/mtrr.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/xen/arch/x86/hvm/mtrr.c b/xen/arch/x86/hvm/mtrr.c
index 093103f6c768..344edc2d6a96 100644
--- a/xen/arch/x86/hvm/mtrr.c
+++ b/xen/arch/x86/hvm/mtrr.c
@@ -29,13 +29,6 @@
 /* Get page attribute fields (PAn) from PAT MSR. */
 #define pat_cr_2_paf(pat_cr,n)  ((((uint64_t)pat_cr) >> ((n)<<3)) & 0xff)
 
-/* PAT entry to PTE flags (PAT, PCD, PWT bits). */
-static const uint8_t pat_entry_2_pte_flags[8] = {
-    0,           _PAGE_PWT,
-    _PAGE_PCD,   _PAGE_PCD | _PAGE_PWT,
-    _PAGE_PAT,   _PAGE_PAT | _PAGE_PWT,
-    _PAGE_PAT | _PAGE_PCD, _PAGE_PAT | _PAGE_PCD | _PAGE_PWT };
-
 /* Effective mm type lookup table, according to MTRR and PAT. */
 static const uint8_t mm_type_tbl[MTRR_NUM_TYPES][X86_NUM_MT] = {
 #define RS MEMORY_NUM_TYPES
@@ -117,7 +110,7 @@ uint8_t pat_type_2_pte_flags(uint8_t pat_type)
     if ( unlikely(pat_entry == INVALID_MEM_TYPE) )
         pat_entry = pat_entry_tbl[X86_MT_UC];
 
-    return pat_entry_2_pte_flags[pat_entry];
+    return cacheattr_to_pte_flags(pat_entry);
 }
 
 int hvm_vcpu_cacheattr_init(struct vcpu *v)
-- 
2.11.0


