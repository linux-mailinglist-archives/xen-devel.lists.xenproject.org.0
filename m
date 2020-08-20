Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB0A24C176
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 17:10:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8mCR-0003zE-K9; Thu, 20 Aug 2020 15:09:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=00F7=B6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k8mCQ-0003lg-2a
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 15:09:54 +0000
X-Inumbo-ID: 9b9d86af-17a7-4d72-a21f-c75d8547d178
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9b9d86af-17a7-4d72-a21f-c75d8547d178;
 Thu, 20 Aug 2020 15:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597936180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=u63m2tXhuuAu/gd/zkG4g8sb+Z+3RgZGzbLxlSgXxBo=;
 b=FLLQf6MNAmDy3kbMwrc49GPRFtRK+OR72K5NZ5F/l1fXmfNDEpeRGPny
 0euUCjH34cNgfmpDBoKqLo0L3T7JkrLVoOPm0KInOF01uRGJTF6x1c1AA
 bTdZEM9QZwxSPoGd0n6G6OeKdT9MihoF+KKJ4nj6TVuIY9caxPc1UFaOq E=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: UE5O4/bvrPO/wv6B7XMDrVbV0sbAZ/kXCKUsOfw6/1lDaYcLKz2Sdy4k5yZr/ZSMdlcWtOl4iV
 qKor7pxl+zI/EYgrSrH7XTRTJ9w8bgZJvitq8wWnyxZQ0w0GKupz0kBuGAhELMASFCmp9G9KhT
 EOTfkpPKrzb5aGcxj1A2fQhMYmcAZBpwKSNY4Pt30sNbjG2qqj902Uo4RLUN6vlRqwGKInbdZ1
 dZIThQ07DymCgvxh1PB6J5xHBE2zoqZjPAl1T5bJur2LwF3T79vbIJM3Hjqc3qw0ktsh2mOgEM
 yBI=
X-SBRS: 2.7
X-MesageID: 25108129
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,333,1592884800"; d="scan'208";a="25108129"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 8/8] x86/msr: Drop compatibility #GP handling in guest_{rd,
 wr}msr()
Date: Thu, 20 Aug 2020 17:08:35 +0200
Message-ID: <20200820150835.27440-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200820150835.27440-1-roger.pau@citrix.com>
References: <20200820150835.27440-1-roger.pau@citrix.com>
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
index bb0dd5ff0a..560719c2aa 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -159,29 +159,6 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
 
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
@@ -349,29 +326,6 @@ int guest_wrmsr(struct vcpu *v, uint32_t msr, uint64_t val)
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


