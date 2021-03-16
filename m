Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C879F33D904
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 17:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98383.186618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMCPZ-0002nF-HB; Tue, 16 Mar 2021 16:19:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98383.186618; Tue, 16 Mar 2021 16:19:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMCPZ-0002mf-CU; Tue, 16 Mar 2021 16:19:13 +0000
Received: by outflank-mailman (input) for mailman id 98383;
 Tue, 16 Mar 2021 16:19:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kyr7=IO=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lMCPX-0002kv-Rr
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 16:19:11 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7caab44e-cc54-404a-acd4-d8a0b92f7b51;
 Tue, 16 Mar 2021 16:19:07 +0000 (UTC)
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
X-Inumbo-ID: 7caab44e-cc54-404a-acd4-d8a0b92f7b51
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615911547;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rf/HGM31QWHWGX+1+ToUsMdeOvi8pCwabBY2/qPrlZY=;
  b=ULucW+b2UFs5Cgm97eEvPEVkAJHOhn5OAJWdHEmx1RGezMBoZOUjhFgt
   sz4x7ruozuvmq+khkV574ZVQw3UVQlvMf7rCQX6WPTpE0NLJ3AB5Wby3R
   zb69rXoENhnt+GdrYd0trT9R+qkQhjjXtbhYe9wG1dcJWz78rwStPfxo7
   A=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 3iUKy1CtPOjR9xr4a/YNZQvVPT3nhPYif2nwlxPGZFMEyj9P5yMHvLTvGag8cK8Ak2Zp3uC4JQ
 YOaKh5NqUv7oMhDAeAo/cv3kv/NvK3LJ0rK7hpw1dmds+EffaE1Xrd6IXkctN+Bjn+zeOW3lTv
 6qDkGnDWyjfA1EmnFRef+WF/g4SvVtOMY/nqRu1B6LaR3rkZRQlR7dKPJY1steXu3uL6cwOmfl
 MAEEly3DvbolK6O4gJN2xYZ9P1IAisoCntP0LCuvQ77IJECjwRkN/dn0gbdm/aWK5ImaOQMAZE
 mgg=
X-SBRS: 5.1
X-MesageID: 39773267
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:EtnUN6+GQ0i5cDfOtcpuk+FtcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEm8ybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUPD38Zn/+
 Nbf6B6YeeeMXFTh8z3+RT9Nt4mzsWO/qzAv5ag815GZ2hRGsZdxi1+DRuWFVAzYQFAC4YwGp
 b03Ls4mxOLf3MLYsOnQkQURuSrnayLqLvKQz4jQyQm5g6HkC+y5NfBcySw8x8CX1p0sMwf2E
 fflQiR3NTHj9iazVvm23bX/9BqnrLau6d+LeitruRQFTn2kAavY+1aKv2/lRQ4uvum5lpvsP
 SkmWZbA+1J53ncfn64rHLWsmGKultDmhySq2Owunftrdf0Qzg3EaN69P9kWyHE4EkttswU6t
 Ms40ultoFaBR6FvCPx68mgbWATqmOIoGEvmeNWsnpHUYF2Us4pkaUj+ipuYfM9NRO/zLpiPP
 hlDcna6voTW0iddWrlsm5mx8HpdmgvHz+dK3Jy+fC94nxzpjRU3kEYzMsQkjMr75QmUaRJ4O
 zCL+BBiKxOdMkLdqhwbd1xA/efOyjoe1bhIWiSKVPoGOUsIHTWsaP6570z+aWMdIEXyoAx3L
 DMSklRu2J3W0+GM7zK4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDF80lc+tpOgeH93bV/
 6/NIk+OY6lEULeXaJymyHuUZhbLncTFOcPvMwgZl6IqsXXbo3m39arNsr7Ff7IK3IJS2n/Cn
 wMUHzYP8Nb9H2mXXf+nVzUU3PpcUrv4IJoHMHhjrEu4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66ilLi6q2mw9WPB9H5oJRJZE0ZQ7NzbIjd3jD5PF3mxXacIut2Zd2wX9mCAPAVDQ8TfFx
 Mau0564rutL5ubxTkrDtWuNm7ytQpKmFu6C7Mn3oGT78bsfZ01Sqs8UKtqDAPRClheggBxsl
 pObwcCW27SHj7jkr+ekZQRHe3THuMM2zuDEIpxkzb/vV/ZjdwzTnEbNgTeIPK/sEILfX5ooX
 Fft4UYm6GNnD6zL3BXupVJDHR8LEKNALxHCwyZYp5zgb6DQnArcU6DmSGahxYvemDj6kUVgS
 j7ITeJfOzQa2AtyUxww+Lk9kh5eX6aeF81YndmsZdlHWCDoXpr1/SXD5DDnFe5ex8Gz6UFKz
 fObSEJLg4G/aHA6DeF3DKDH24h3JMgI6jUC6kiaaja3hqWWcC1vLBDG/9f55B+Mt/y9ucNTO
 KEYgeQaDf1Efkg1QDQpnErPkBP2TUZuOKt3B3u926j2nEjRfLUPVR9XrkeZ8iG8HKMfYfB7L
 xpydYu+eegOGT4bdCLjanRcj5YMxvW5Wq7Vfshp5xYtb873YEDUaXzQH/NzjVKzR8+JMD7mA
 cFTKN37KvIN4Vvc8YREhgptGYBhZCKNg8mowb2CugxcRUxlHfdJcqO+KeNprw1AEGNzTGAcG
 W34mlY5bPCUCSC37JBVP51LmRSdUQm6HNtuOmFbJbdDQ22d+dFuFq2W0XNBIN1WeyAA/EXqB
 0//tSD2+mQfCD80BrLvTR6LrlVmlzXCv+aEUaJA6pQ79e+OV6QmaOk7864kSfvRVKAGjElrJ
 wAcVZVc99KhTYjhpAmyyS+SqT4pUQ+jltViAsX4WLFy8yh+2fUHUZPLA3fjNFXRFBoQwq1sf
 g=
X-IronPort-AV: E=Sophos;i="5.81,251,1610427600"; 
   d="scan'208";a="39773267"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Ian Jackson <iwj@xenproject.org>
Subject: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in guest_{rd,wr}msr()"
Date: Tue, 16 Mar 2021 16:18:42 +0000
Message-ID: <20210316161844.1658-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210316161844.1658-1-andrew.cooper3@citrix.com>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

In hindsight, this was a poor move.  Some of these MSRs require probing for,
causing unhelpful spew into xl dmesg, as well as spew from unit tests
explicitly checking behaviour.

This restores behaviour close to that of Xen 4.14.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Boris Ostrovsky <boris.ostrovsky@oracle.com>
CC: Ian Jackson <iwj@xenproject.org>

For 4.15.  Restoring behaviour closer to 4.14, and prereq for a bugfix needing
backporting.
---
 xen/arch/x86/msr.c | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 0ebcb04259..c3a988bd11 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -175,6 +175,30 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 
     switch ( msr )
     {
+        /* Write-only */
+    case MSR_AMD_PATCHLOADER:
+    case MSR_IA32_UCODE_WRITE:
+    case MSR_PRED_CMD:
+    case MSR_FLUSH_CMD:
+
+        /* Not offered to guests. */
+    case MSR_TEST_CTRL:
+    case MSR_CORE_CAPABILITIES:
+    case MSR_TSX_FORCE_ABORT:
+    case MSR_TSX_CTRL:
+    case MSR_MCU_OPT_CTRL:
+    case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
+    case MSR_U_CET:
+    case MSR_S_CET:
+    case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
+    case MSR_AMD64_LWP_CFG:
+    case MSR_AMD64_LWP_CBADDR:
+    case MSR_PPIN_CTL:
+    case MSR_PPIN:
+    case MSR_AMD_PPIN_CTL:
+    case MSR_AMD_PPIN:
+        goto gp_fault;
+
     case MSR_IA32_FEATURE_CONTROL:
         /*
          * Architecturally, availability of this MSR is enumerated by the
@@ -382,6 +406,30 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     {
         uint64_t rsvd;
 
+        /* Read-only */
+    case MSR_IA32_PLATFORM_ID:
+    case MSR_CORE_CAPABILITIES:
+    case MSR_INTEL_CORE_THREAD_COUNT:
+    case MSR_INTEL_PLATFORM_INFO:
+    case MSR_ARCH_CAPABILITIES:
+
+        /* Not offered to guests. */
+    case MSR_TEST_CTRL:
+    case MSR_TSX_FORCE_ABORT:
+    case MSR_TSX_CTRL:
+    case MSR_MCU_OPT_CTRL:
+    case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
+    case MSR_U_CET:
+    case MSR_S_CET:
+    case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
+    case MSR_AMD64_LWP_CFG:
+    case MSR_AMD64_LWP_CBADDR:
+    case MSR_PPIN_CTL:
+    case MSR_PPIN:
+    case MSR_AMD_PPIN_CTL:
+    case MSR_AMD_PPIN:
+        goto gp_fault;
+
     case MSR_AMD_PATCHLEVEL:
         BUILD_BUG_ON(MSR_IA32_UCODE_REV != MSR_AMD_PATCHLEVEL);
         /*
-- 
2.11.0


