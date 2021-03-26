Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A6E34AAF8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 16:09:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101897.195195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPo4p-0002kz-AB; Fri, 26 Mar 2021 15:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101897.195195; Fri, 26 Mar 2021 15:08:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPo4p-0002ka-6N; Fri, 26 Mar 2021 15:08:43 +0000
Received: by outflank-mailman (input) for mailman id 101897;
 Fri, 26 Mar 2021 15:08:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G+eI=IY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPo4n-0002kV-HS
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 15:08:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id efc78848-211b-49c9-ae4c-c99aae012304;
 Fri, 26 Mar 2021 15:08:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CAE40ADFB;
 Fri, 26 Mar 2021 15:08:39 +0000 (UTC)
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
X-Inumbo-ID: efc78848-211b-49c9-ae4c-c99aae012304
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616771319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bxwBoGm/HtY2XjH6TUAwMmPqJZhSB5i77uC61meo8AE=;
	b=GmBfnL4hwNGpnb7yMgLiLDucVuLqnIV+72oVJLz8hcMkr4WwvoJ5Szkm1179gbw2b1s9E2
	IuOfbuWr+0yM91qurByFdkxzl7UiabdSrgpwghsNVx8bLHZK0SltX+QMioUPdhEYAJL200
	V/9qgB53KFNz6gdq/ah1G+YzDwhnz3g=
Subject: [PATCH for-4.15 v1.1 1/3] Revert "x86/msr: drop compatibility #GP
 handling in guest_{rd,wr}msr()"
To: Ian Jackson <iwj@xenproject.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b5858e08-627e-742a-055e-84d6768d93f5@suse.com>
Date: Fri, 26 Mar 2021 16:08:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210316161844.1658-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

From: Andrew Cooper <andrew.cooper3@citrix.com>

In hindsight, this was a poor move.  Some of these MSRs require probing for,
cause unhelpful spew into xl dmesg, or cause spew from unit tests explicitly
checking behaviour.

This restores behaviour close to that of Xen 4.14, meaning in particular
that for all of the MSRs getting re-added explicitly a #GP fault will get
raised irrespective of the new "msr_relaxed" setting.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Ian Jackson <iwj@xenproject.org>
---
v1.1: Fold in suggested description adjustments.
---
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


