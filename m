Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABmxCBBQsGnFhgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:08:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EAF25541A
	for <lists+xen-devel@lfdr.de>; Tue, 10 Mar 2026 18:08:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1250309.1547822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00Cd-0003yk-Fq; Tue, 10 Mar 2026 16:45:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1250309.1547822; Tue, 10 Mar 2026 16:45:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w00Cd-0003u2-AR; Tue, 10 Mar 2026 16:45:03 +0000
Received: by outflank-mailman (input) for mailman id 1250309;
 Tue, 10 Mar 2026 16:45:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bYBk=BK=bounce.vates.tech=bounce-md_30504962.69b04a86.v1-c7ef4ba09d5f46b69712cc53bcc0a6d4@srs-se1.protection.inumbo.net>)
 id 1w00Cb-000397-NT
 for xen-devel@lists.xenproject.org; Tue, 10 Mar 2026 16:45:01 +0000
Received: from mail133-21.atl131.mandrillapp.com
 (mail133-21.atl131.mandrillapp.com [198.2.133.21])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 778c4381-1ca0-11f1-9ccf-f158ae23cfc8;
 Tue, 10 Mar 2026 17:44:55 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-21.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4fVfqp2xqRz1XLF3j
 for <xen-devel@lists.xenproject.org>; Tue, 10 Mar 2026 16:44:54 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c7ef4ba09d5f46b69712cc53bcc0a6d4; Tue, 10 Mar 2026 16:44:54 +0000
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
X-Inumbo-ID: 778c4381-1ca0-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773161094; x=1773431094;
	bh=eqSCrcSKmBLhF87BI+hUSczC6Ih5ZDFON3mh4aw5Ni4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=e02g2aN6mbhbK5LuxMvOVTDizZIErWmSbE0COLnw9mdA7aflFGidiVL2Y0QASXDl4
	 FFADotGlrrvN8ETNvZJW7iBb1YZo04vKItdkFtK7DyHwmuOTQFqgf8quvWrZClLsi9
	 zs2zgKVBc7nkHWEAh9hJAN4BOC7s0IHL6+lREMctUhWvhMGyEYp9IvxGT1Wle4ffXn
	 WNGzmqOYbAfFcWWxH2eNobDD665DR+SoorgKRAt+IHRCa5Ffy2o+9q+awlDoaGGb3R
	 1fxrLOHr5AyKHJqZDaWpW/rFoVMTxirvQRFCIbPUDW7kqKGc1chDEy0Pn0KxEnG/Xl
	 mZxpiUKdmJadg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773161094; x=1773421594; i=teddy.astie@vates.tech;
	bh=eqSCrcSKmBLhF87BI+hUSczC6Ih5ZDFON3mh4aw5Ni4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=U4TOixaMNpMTv96wYDgKiJTVULXYPM/iYIV9N9zZp70sCSaeawf+P0LslXK0l8Ccg
	 i+r81qno3t/uASUo6InT6FIL6/Dr4SrktI7LvBHj2O2AiU0dB/yiYiCg2ww9sHUPlJ
	 LNucsBf3GYlL8RSyCJ+MrylLEbVJnC7+uQFhx4wdEWj3ATWz5j/7Z1sUdUt60rtDkR
	 Tif8Fj4XTO5viC2W7vilVskuUlZAOJcSUM1q6zLbtfU2FD5Oya/liNnCuH3o/xY4dm
	 so/T5vYaYTw3sxuz0zgkjtTXnaqzPOKEQlQ/+k6lK7H+4nr8/xwfLTa36l4/GYE1N2
	 iFlhtvK+m8LdQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=201/6]=20x86/vpmu:=20Expose=20up=20to=208=20Intel=20event=20selectors=20in=20PV=20Dom0?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773161093473
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <715834969eb198850e1fe0d1e66046f929c8d658.1773160025.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1773160025.git.teddy.astie@vates.tech>
References: <cover.1773160025.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c7ef4ba09d5f46b69712cc53bcc0a6d4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260310:md
Date: Tue, 10 Mar 2026 16:44:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C7EAF25541A
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
	GREYLIST(0.00)[pass,meta];
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
	NEURAL_HAM(-0.00)[-0.946];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

Most (if not all) Intel CPUs starting from Sandy Bridge have up to 8
event selectors per core, which could be halved per hyperthread.

However, current PV emulation logic doesn't support up to 8 event selector,
leading to errors when trying to access them, hence, preventing Linux from
driving the vPMU correctly.

Make sure up to MSR_P6_EVNTSEL(7) is usable, which is the same upper bound as
used in VMX code.

The check if the event selector actually exist for the hardware is done in
core2_vpmu_do_{rdmsr,wrmsr}, hence we're not allowing to access non-existent
MSRs.

Fixes: 27c554198666 ("x86/VPMU: add support for PMU register handling on PV guests")
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/pv/emul-priv-op.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index 64d47ab677..b2556f9213 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -990,7 +990,7 @@ static int cf_check read_msr(
         return X86EMUL_OKAY;
 
     case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR(7):
-    case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
+    case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(7):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
         if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
@@ -1167,7 +1167,7 @@ static int cf_check write_msr(
         break;
 
     case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR(7):
-    case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
+    case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(7):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
     case MSR_CORE_PERF_FIXED_CTR_CTRL ... MSR_CORE_PERF_GLOBAL_OVF_CTRL:
         if ( boot_cpu_data.vendor == X86_VENDOR_INTEL )
-- 
2.53.0



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


