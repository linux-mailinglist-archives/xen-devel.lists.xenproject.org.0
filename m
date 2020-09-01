Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AE9258D3A
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 13:10:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD4Bf-0000ca-3y; Tue, 01 Sep 2020 11:10:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD4Bd-0000VB-Ef
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 11:10:49 +0000
X-Inumbo-ID: af246697-e068-45e2-be8b-515ad49f064f
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id af246697-e068-45e2-be8b-515ad49f064f;
 Tue, 01 Sep 2020 11:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598958644;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BMnRreRW+++9kfh3egHsOAJKzSNN/TeOyxU8V9BYfgQ=;
 b=U7/HLyV96dAXwwSPMaEOKTVHSCVzqjDU5gWRYSkBmkGGDORFb3+Kyyec
 xbKmSg1hUH8nMp/mb0DuIBeQXPi1vIzbmwRj1O8vu948CvEiGf+PkgGyP
 7OIPsPEV3pBPrWV8TZwP4wKugGI5n2J6Yv9woYgOZrosp5Vwigu5yAR5i 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: n4tkfPQ9WS11cDUSwwbxf6JXeWpSpobbzFPEnDYn1ddNg0gElB6ucVlj9pGb1EjVSPXGJCgCRS
 8PTvH2SlWtsCCZgZpfi0j4RG84+hxFqGj3abcVH9fMN06KCoppXQvf9S1/mZnCvDEBiqZAW8FY
 2fbtlon4kCUz+rcZAHBM1nTm8/g6xRdCvMy5tEiIS/YF9XgdE+iSTD0EXWaj6lEH0U0X8ST1am
 yi6Sg6N7+T9m1qycq774GO66PrTzGH5+ME83vhLbIIrbi6ifaTvNqfJLS0g+WcxRLXzDKwmfc2
 3/U=
X-SBRS: 2.7
X-MesageID: 25738160
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="25738160"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v3 8/8] x86/msr: Drop compatibility #GP handling in guest_{rd,
 wr}msr()
Date: Tue, 1 Sep 2020 12:54:45 +0200
Message-ID: <20200901105445.22277-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901105445.22277-1-roger.pau@citrix.com>
References: <20200901105445.22277-1-roger.pau@citrix.com>
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

From: Andrew Cooper <andrew.cooper3@citrix.com>

Now that the main PV/HVM MSR handlers raise #GP for all unknown MSRs, there is
no need to special case these MSRs any more.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/msr.c | 46 ----------------------------------------------
 1 file changed, 46 deletions(-)

diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index cc2f111a90..ab11e3b73c 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -175,29 +175,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 
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
     case MSR_IA32_FEATURE_CONTROL:
         if ( !(cp->x86_vendor & X86_VENDOR_INTEL) )
             goto gp_fault;
@@ -365,29 +342,6 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
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
2.28.0


