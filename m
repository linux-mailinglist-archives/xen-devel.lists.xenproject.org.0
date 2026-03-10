Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPRKES5QsGnFhgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:02 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E41ED255450
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:09:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250308.1547808 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00Cc-0003Zq-4a; Tue, 10 Mar 2026 16:45:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250308.1547808; Tue, 10 Mar 2026 16:45:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00Cc-0003Vh-0S; Tue, 10 Mar 2026 16:45:02 +0000
Received: by outflank-mailman (input) for mailman id 1250308;
 Tue, 10 Mar 2026 16:45:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lmps=BK=bounce.vates.tech=bounce-md_30504962.69b04a86.v1-0562b25a3dc94e9d99b134cfb4b7fefe@srs-se1.protection.inumbo.net>)
 id 1w00Ca-000397-NC
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 16:45:00 +0000
Received: from mail133-21.atl131.mandrillapp.com
 (mail133-21.atl131.mandrillapp.com [198.2.133.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78c2238b-1ca0-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 17:44:58 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fVfqp6mX4z1XLF5C
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 16:44:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0562b25a3dc94e9d99b134cfb4b7fefe; Tue, 10 Mar 2026 16:44:54 +0000
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
X-Inumbo-ID: 78c2238b-1ca0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773161094; x=1773431094;
	bh=feLmUaztYuUh2fFzuOxUOsSPIeQAriCM6y3WlsJDI3Y=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cPfLADyHXB7i4QDSOQMdwDF/yoyMj0lMubt4jvYERR/4ZY+bGnMDb+XqvLzH+vk8Q
	 hl8sq/c0+JZWoa7NkdlJv1xxpBujLvrgyeSthhgzzKqOnp1yiXK7v7gIzsYCkr62QX
	 ihi1hC8fPnEXnr8gN8xMr9ACCyqO8vp5HfY1QxCV4S24Ck3X3rJe/pHgwaghacF+U+
	 2VBPILB7Ipd5Q3UqpkQDO6tPl9NGBo3A2DKdeIlhel2vfw5XjkjZywjHwDuCnJ9aQW
	 f0So/kDViO/3JY21X+NhIVQB8sNj4XZDNiRq07Axpd+oIyvNvsgyyjHLA4pD2IY1MX
	 ArTRTabGKvbtA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773161094; x=1773421594; i=teddy.astie@vates.tech;
	bh=feLmUaztYuUh2fFzuOxUOsSPIeQAriCM6y3WlsJDI3Y=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=MVZr07ljRao5Y85v4CvBX/wDJZ9FZuvMdFMBeG4oyPzpZU0ZrvuLDPOB7Yzr+KWUy
	 BI8llkDDBfAwoW3lnse3iKpXLbFKM8+EA9dBClcFX5QQo5pCkAJOiA3La5RHXJCxva
	 +AUNCFLRJHgROC5MXv3x2NyS35lkoYm7EzdChGWpqSnk6t22CDstNFyDqDCUX3KtTQ
	 7Abowyr+Tbw+MKteihirFvarGoqh9luWmrmiqhoG7dHIvyQ6kg1WUTOijGMhL3hI/Q
	 yJey2tuIGX9vaGBrFBEcWSBUDzBDSXzdZZWoEf6GHN2Rkg2C7bYP0yeBO1n3AsQYZy
	 VzpetchOaLenQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=204/6]=20x86/vpmu:=20Sanitise=20Intel=20PMU=20version?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773161094185
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <dcd278658139976d1af92b4d201c17e12cf7eb2b.1773160025.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1773160025.git.teddy.astie@vates.tech>
References: <cover.1773160025.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0562b25a3dc94e9d99b134cfb4b7fefe?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260310:md
Date: Tue, 10 Mar 2026 16:44:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E41ED255450
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	NEURAL_HAM(-0.00)[-0.928];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Currently, Xen exposes the host CPUID as-is, which is not correct on hardware
that implements PMU features that are not supported by Xen (e.g AnyThread bit
of PMU version 3, IA32_PERF_GLOBAL_INUSE of PMU version 4, and many other
things).

As we're actually virtualizing PMU version 2 (as version 3 is the same as
version 2 with the addition to AnyThread bit, which is we don't support since
[1]), adjust the messages related to PMU emulation to account that.

[1] 9f5390441a6e ("x86/vpmu_intel: handle SMT consistently for programmable and fixed counters")

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
It could sound weird that we're now exposing version 2, while we were previously
(wrongly) exposing version 3. Version 3 mostly works because the guest is not
aware of hyperthreads, hence is not expected to try using AnyThread bit (which
currently faults due to consistency checks). But we were still actually virtualizing
PMU version 2.

 xen/arch/x86/cpu-policy.c     | 33 ++++++++++++++++++++++++++++++++-
 xen/arch/x86/cpu/vpmu_intel.c |  4 ++--
 2 files changed, 34 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index 5273fe0ae4..7f4456d5a2 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -253,6 +253,33 @@ static void recalculate_xstate(struct cpu_policy *p)
     }
 }
 
+static void sanitise_vpmu(struct cpu_policy *p)
+{
+switch ( p->x86_vendor )
+    {
+    case X86_VENDOR_INTEL:
+        if ( !p->basic.pmu.version )
+            return;
+
+        /*
+         * Expose up to PMU version 2 
+         *
+         * PMU version 3 introduced the AnyThread bit we don't want
+         * to support (see "AnyThread Counting and Software Evolution"
+         * regarding notes with virtualization). This is the only known
+         * feature introduced in PMU version 3.
+         *
+         * PMU version 5 deprecated AnyThread, and introduced a CPUID
+         * bit (ANYTHREAD_DEPRECATION) to indicate that this bit isn't supported.
+         * That CPUID bit should be set for PMU version 5.
+         */
+        if ( p->basic.pmu.version > 2 )
+            p->basic.pmu.version = 2;
+
+        break;
+    }
+}
+
 /*
  * Misc adjustments to the policy.  Mostly clobbering reserved fields and
  * duplicating shared fields.  Intentionally hidden fields are annotated.
@@ -391,6 +418,8 @@ static void __init calculate_host_policy(void)
     /* When vPMU is disabled, drop it from the host policy. */
     if ( vpmu_mode == XENPMU_MODE_OFF )
         p->basic.raw[0xa] = EMPTY_LEAF;
+    else
+        sanitise_vpmu(p);
 
     /* 0x000000ce  MSR_INTEL_PLATFORM_INFO */
     /* probe_cpuid_faulting() sanity checks presence of MISC_FEATURES_ENABLES */
@@ -841,7 +870,7 @@ static void __init calculate_hvm_max_policy(void)
         /* Enable features which are always emulated. */
         p->extd.raw[0xa].d |= (1u << SVM_FEATURE_VMCBCLEAN);
     }
-    
+
     guest_common_max_feature_adjustments(fs);
     guest_common_feature_adjustments(fs);
 
@@ -1054,6 +1083,8 @@ void recalculate_cpuid_policy(struct domain *d)
     if ( vpmu_mode == XENPMU_MODE_OFF ||
          ((vpmu_mode & XENPMU_MODE_ALL) && !is_hardware_domain(d)) )
         p->basic.raw[0xa] = EMPTY_LEAF;
+    else
+        sanitise_vpmu(p);
 
     if ( !p->extd.svm )
         p->extd.raw[0xa] = EMPTY_LEAF;
diff --git a/xen/arch/x86/cpu/vpmu_intel.c b/xen/arch/x86/cpu/vpmu_intel.c
index f43faf9567..85539ce6c5 100644
--- a/xen/arch/x86/cpu/vpmu_intel.c
+++ b/xen/arch/x86/cpu/vpmu_intel.c
@@ -901,14 +901,14 @@ const struct arch_vpmu_ops *__init core2_vpmu_init(void)
 
     switch ( version )
     {
+    case 3:
     case 4:
     case 5:
         printk(XENLOG_INFO "VPMU: PMU version %u is not fully supported. "
-               "Emulating version 3\n", version);
+               "Emulating version 2\n", version);
         /* FALLTHROUGH */
 
     case 2:
-    case 3:
         break;
 
     default:
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


