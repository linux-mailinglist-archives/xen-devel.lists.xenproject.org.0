Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPwCAR+JmGlKJgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:17:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D1A1693DD
	for <lists+xen-devel@lfdr.de>; Fri, 20 Feb 2026 17:17:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1237314.1539672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtSpF-0004uu-UE; Fri, 20 Feb 2026 15:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1237314.1539672; Fri, 20 Feb 2026 15:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vtSpF-0004sF-Qu; Fri, 20 Feb 2026 15:53:53 +0000
Received: by outflank-mailman (input) for mailman id 1237314;
 Fri, 20 Feb 2026 15:53:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kOmB=AY=bounce.vates.tech=bounce-md_30504962.6998838d.v1-e51af2fa70da414fa001341687f854fc@srs-se1.protection.inumbo.net>)
 id 1vtSpD-0004ri-Ps
 for xen-devel@lists.xenproject.org; Fri, 20 Feb 2026 15:53:52 +0000
Received: from mail186-12.suw21.mandrillapp.com
 (mail186-12.suw21.mandrillapp.com [198.2.186.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 590cbd79-0e74-11f1-b164-2bf370ae4941;
 Fri, 20 Feb 2026 16:53:50 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-12.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4fHZY90ttDz705b3m
 for <xen-devel@lists.xenproject.org>; Fri, 20 Feb 2026 15:53:49 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 e51af2fa70da414fa001341687f854fc; Fri, 20 Feb 2026 15:53:49 +0000
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
X-Inumbo-ID: 590cbd79-0e74-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771602829; x=1771872829;
	bh=fCUBpXi2ECBGejIhZTvDzf6iYF6WB1nBD+u/P8GLLAQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=xO/GeWlt/9NCO4z4Ge11zKyrbH8vbZqmOanQRT1jYG2Yr27nOwO2kZ4jptkFoorwq
	 A71j0f/NcO3CbdEFRAfZrPFVIgNMwE6nMGMUvvWfGC4mMPTJ1/YqUINzW3DyJNrnzJ
	 gTWq5gCyNuWsjtEx6xL9lQb9MzoWavQ3muArx+oHkPaWy6rsq+Q3U0pqhs2RTlmnzq
	 MU8ElFQMjrFR7iaEEeXX1QMnP/gbFyPgU8eioIHKi2JStfIRH+Wn2CzYTedz1tAw7o
	 P+m45FVd0s7M8kUepZPio5I0MA8yYETNK5G00N+ADMNjua2IE1JEv9zreLplMbJ6R5
	 P77YkaJJu2FfA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771602829; x=1771863329; i=teddy.astie@vates.tech;
	bh=fCUBpXi2ECBGejIhZTvDzf6iYF6WB1nBD+u/P8GLLAQ=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=HNWmI5SCPGMKNIAkqCmLwBPavGOgSRDST84Fv9Zgt4n42HGHUOkES0Uqzi+x/Bm0X
	 2ib9EGnuUuno4CWfdVx7GNEtSPQUVYz2+813zP3UseStSZN4+HHHHIGspwfhYGzY7R
	 FdhJVD+zsLrpFO6EBF9oksJ2sXOT6EZd37u9cm9hYvfJksRRBcgG/g1kjlQaujRIwO
	 t2zDnPc5p3MoKcSfPBDN3kIAoJTPfVBrGzJpkcCFOrUFsWc3KYbddyhz97X5cxWlte
	 ATjtjugYHxSuPJ1b57hyJA4y0u32JShaOSo/0GQ8DSfDIkhZ8vPdbfKcqTSD33DC9X
	 XRJZkm3bIPB7g==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2]=20x86/platform:=20Adjust=20temperature=20sensors=20MSRs?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771602828211
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Tu Dinh" <ngoc-tu.dinh@vates.tech>
Message-Id: <08370f3b8b224493b8e66e8503a2fe0d07b73c33.1771600155.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.e51af2fa70da414fa001341687f854fc?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260220:md
Date: Fri, 20 Feb 2026 15:53:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:teddy.astie@vates.tech,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:ngoc-tu.dinh@vates.tech,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:mid,vates.tech:dkim,vates.tech:url,vates.tech:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.573];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A5D1A1693DD
X-Rspamd-Action: no action

Temperature sensors MSR were previously assumed to be available when "DTS"
CPUID bit is set. This is not really the case :
 * MSR_IA32_THERM_STATUS is gated behind ACPI CPUID bit, only DTS-related bits
of this MSR are gated behind the DTS CPUID
 * MSR_PACKAGE_THERM_STATUS is gated behind "PTM" CPUID

Also adjust the MSR_TEMPERATURE_TARGET which is not architectural, but stable
in practice, and required to be exposed for reliably querying CPU temperature.

Fixes: 615c9f3f820 ("x86/platform: Expose DTS sensors MSR")
Reported-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
since v1:
 * use acpi CPUID bit for MSR_IA32_THERM_STATUS
 * use pkg_therm_mgmt CPUID bit for MSR_PACKAGE_THERM_STATUS
 * review MSR_TEMPERATURE_TARGET MSR

 xen/arch/x86/platform_hypercall.c    | 19 ++++++++++++++++++-
 xen/include/xen/lib/x86/cpu-policy.h |  2 +-
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index c6c5135806..711427144e 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -89,9 +89,26 @@ static bool msr_read_allowed(unsigned int msr)
         return cpu_has_srbds_ctrl;
 
     case MSR_IA32_THERM_STATUS:
+        return host_cpu_policy.basic.acpi;
+
+    /*
+     * This MSR is present on most Intel Core-family CPUs since Nehalem but is not an
+     * architectural MSR. No CPUID bit enumerates this MSR.
+     *
+     * This MSR exposes "temperature target" that is needed to compute the CPU
+     * temperature. The "temperature target" is a model specific value, and this MSR is
+     * the only known method of getting the one used for the CPU. On some CPU models with
+     * Intel SST-PP, the "temperature target" can vary over time.
+     *
+     * We assume all Intel CPUs with DTS may support this MSR; but reads can fail in case
+     * the platform doesn't actually support this MSR.
+     */
     case MSR_TEMPERATURE_TARGET:
+        return boot_cpu_data.x86_vendor == X86_VENDOR_INTEL &&
+            host_cpu_policy.basic.digital_temp_sensor;
+
     case MSR_PACKAGE_THERM_STATUS:
-        return host_cpu_policy.basic.digital_temp_sensor;
+        return host_cpu_policy.basic.pkg_therm_mgmt;
     }
 
     if ( ppin_msr && msr == ppin_msr )
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index db8d035589..d29e380359 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -132,7 +132,7 @@ struct cpu_policy
                         :1,
                         :1,
                         :1,
-                        :1,
+                        pkg_therm_mgmt:1,
                         hwp:1,
                         hwp_interrupt:1,
                         hwp_activity_window:1,
-- 
2.53.0



--
 | Vates

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


