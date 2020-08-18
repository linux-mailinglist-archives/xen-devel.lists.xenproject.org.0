Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F045248693
	for <lists+xen-devel@lfdr.de>; Tue, 18 Aug 2020 15:59:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k828J-000182-87; Tue, 18 Aug 2020 13:58:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gypu=B4=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k828I-00017v-3j
 for xen-devel@lists.xenproject.org; Tue, 18 Aug 2020 13:58:34 +0000
X-Inumbo-ID: de53b5a7-4677-4c2a-a2a7-d878cebc38df
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id de53b5a7-4677-4c2a-a2a7-d878cebc38df;
 Tue, 18 Aug 2020 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597759112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=K7j5MgZD0Ar4B+vyr2acjpW6kqvR/sR8VIbMWkF+Zjc=;
 b=IGbFqqMF4j6EYZ2Pn8pTonqc3iV4n5ZlxCozNK2Pz5nOZcxddjgJMczc
 UnYq/kayaewKo/yV/1UOqvnKJOkfPbhQw8nwjNi7Vy9Spi+LWnsNcXhVK
 OAKuoxzXCwhtJV/MtFtGAniHSjwnkdPYE/S091fXiCcNE9QwRvTmVRPsb M=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9x79DGqCrnevw4LGMfWDUI2iBaTQ+pkXPFoyVz5q2tZhuRQ/BTrzHxAM+yHqNE8Ja1YeQfx9+4
 y70ZWzHQSqntqIeXbi6jg4yJ6YvNC+PFfKFOV9cJo0L9yvwiFzN02pKC84vaHJOSSO5Voodh2e
 YdJP10fWxgy3WBr7wu+8dYTk2HSvBtxEcACNVX7ETiW4DLNzTRJYnJ4cz1VS8NEpNeAW9mDw8K
 Sz23O8BWlnbAtlLg2PUeAD13gxIEDQLAsP4D1ehJ3q1hJOBM2E6TIYdLL9Ka6A+i5CHaKLmW9u
 PbQ=
X-SBRS: 2.7
X-MesageID: 25696712
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,327,1592884800"; d="scan'208";a="25696712"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 9/8] x86/msr: Drop compatibility #GP handling in guest_{rd,
 wr}msr()
Date: Tue, 18 Aug 2020 14:58:12 +0100
Message-ID: <20200818135812.22420-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200817155757.3372-1-roger.pau@citrix.com>
References: <20200817155757.3372-1-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Now that the main PV/HVM MSR handlers raise #GP for all unknown MSRs, there is
no need to special case these MSRs any more.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/msr.c | 46 ----------------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index ca4307e19f..a79c6ae718 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -158,29 +158,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 
     switch ( msr )
     {
-    case MSR_AMD_PATCHLOADER:
-    case MSR_IA32_UCODE_WRITE:
-    case MSR_PRED_CMD:
-    case MSR_FLUSH_CMD:
-        /* Write-only */
-    case MSR_TEST_CTRL:
-    case MSR_CORE_CAPABILITIES:
-    case MSR_TSX_FORCE_ABORT:
-    case MSR_TSX_CTRL:
-    case MSR_MCU_OPT_CTRL:
-    case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
-    case MSR_U_CET:
-    case MSR_S_CET:
-    case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
-    case MSR_AMD64_LWP_CFG:
-    case MSR_AMD64_LWP_CBADDR:
-    case MSR_PPIN_CTL:
-    case MSR_PPIN:
-    case MSR_AMD_PPIN_CTL:
-    case MSR_AMD_PPIN:
-        /* Not offered to guests. */
-        goto gp_fault;
-
     case MSR_IA32_PLATFORM_ID:
         if ( !(cp->x86_vendor & X86_VENDOR_INTEL) ||
              !(boot_cpu_data.x86_vendor & X86_VENDOR_INTEL) )
@@ -328,29 +305,6 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
     {
         uint64_t rsvd;
 
-    case MSR_IA32_PLATFORM_ID:
-    case MSR_CORE_CAPABILITIES:
-    case MSR_INTEL_CORE_THREAD_COUNT:
-    case MSR_INTEL_PLATFORM_INFO:
-    case MSR_ARCH_CAPABILITIES:
-        /* Read-only */
-    case MSR_TEST_CTRL:
-    case MSR_TSX_FORCE_ABORT:
-    case MSR_TSX_CTRL:
-    case MSR_MCU_OPT_CTRL:
-    case MSR_RTIT_OUTPUT_BASE ... MSR_RTIT_ADDR_B(7):
-    case MSR_U_CET:
-    case MSR_S_CET:
-    case MSR_PL0_SSP ... MSR_INTERRUPT_SSP_TABLE:
-    case MSR_AMD64_LWP_CFG:
-    case MSR_AMD64_LWP_CBADDR:
-    case MSR_PPIN_CTL:
-    case MSR_PPIN:
-    case MSR_AMD_PPIN_CTL:
-    case MSR_AMD_PPIN:
-        /* Not offered to guests. */
-        goto gp_fault;
-
     case MSR_AMD_PATCHLEVEL:
         BUILD_BUG_ON(MSR_IA32_UCODE_REV != MSR_AMD_PATCHLEVEL);
         /*
-- 
2.11.0


