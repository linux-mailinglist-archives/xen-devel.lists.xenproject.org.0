Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFCUGFSqd2lAkAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111758BCA8
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213839.1524372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmo-0006fT-UL; Mon, 26 Jan 2026 17:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213839.1524372; Mon, 26 Jan 2026 17:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmo-0006Wp-CA; Mon, 26 Jan 2026 17:54:02 +0000
Received: by outflank-mailman (input) for mailman id 1213839;
 Mon, 26 Jan 2026 17:53:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQml-0004HX-RH
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:53:59 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd21385e-fadf-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 18:53:58 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4801c1ad878so53448725e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:58 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:56 -0800 (PST)
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
X-Inumbo-ID: fd21385e-fadf-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450037; x=1770054837; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DXHoMP2m1S668fp9KXBejADon30ms3RX1/2RyOl2CwM=;
        b=WuQQ57ZEGI+gtoEiAaalhftBAy7Ivd9p3IShdzs65a0YwgV4vZwM939Fkw8IDDyDKx
         RZB6zbkUqc94dB1hcu77FZo0gwAvGLTB/i8QHCJzT/xtI4I4Ni6KgKY2YDHCGZgzwSC2
         EkAjB8jFEu4dBHzgAzxYwmh0/n8jvbYr685o4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450037; x=1770054837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DXHoMP2m1S668fp9KXBejADon30ms3RX1/2RyOl2CwM=;
        b=ZVekbiz02nGMJca2TRH2nUfX+YKVDe227yVCzdPORt4tCEgYJh/06LI9yO0HtWsGkr
         tgLqe7nWcDBWUxM+X1b6YCzI+8Qd4b7w1cGJ5j/bwYQNzMOgwcYQkZV6DHfqWYeV52ng
         869jsfVaB5ekASlUxutib6Lo1hh+lywKFEYkzDRPpQqPmuc0cePsY3w/TOiXUmnT8twe
         dzwRUP9kTAZP9xdAVjaRcTSr/jwghZEAa7AUCdp1gl+NHr1pL64qRsmlhJSbl1KZcJC6
         Om5VhtoRvbRzS4I4A/RMA/w5BcPZhs90IoAkhhZ5nQbv1TxXkKN8mCRRhabveUX8imTk
         UsFg==
X-Gm-Message-State: AOJu0Yy0DuIZhwfurOMA1NDSzK5bpXwrOgJdBfUSgf1BO74M2YUugnwU
	cRyUyE9O7/8xuzUHEHAAXW+MC1DXnzWsN0xsoz2PnBdj4MD4hUk1MaO1F/gJdL7dBPr/6Z7aWjw
	GJ+xG
X-Gm-Gg: AZuq6aLIvFLlUER7duZOKDm5woiEijXcWUEYCeYlftby026ryEg6W+jpMo9Ux2G90+k
	ZmT6lrRFVaXoe8rv3n6IRViq1N9NGu8QwUa1ir0z0B3KuDgMNfE5zwS2yc8WoCAfSi5k9fjK6IM
	GRm/Aory82vL1lIGR3Mt+2lkT2A6Z9x4xP+dlQnFvzK7JfhH/GI7f1rPn2KRje587+trjkIVHjh
	G0u0jlbkbH14jemr3z7vmjTpTzEs1bguXNnoUaMUBGajR3zUUVPo2n3YSYy5Mrh8U7FnHUghlfo
	anOUt8n07rgjpc45CY6QsL5ptKA5TPTX73MOXoOBXoJ8BxnzD5XV3bdMEO1cVtbGyfT4vFLuHxR
	6Kw7nPQRAzV6fd9UiZhAWHYCv0Bt2rHAZuZ1C4hyt9tc+WjJF0skZ37IMLGWtsXzq8FZ85nrQkK
	3rrEbb1QC0CflF/h/Pn+87hZQujZ6XQcYN5pGXizX822Tv8RT4TN2pHPuHtmDi7A==
X-Received: by 2002:a05:600c:c4a5:b0:477:9cdb:e32e with SMTP id 5b1f17b1804b1-4805ce4e578mr91498405e9.9.1769450036624;
        Mon, 26 Jan 2026 09:53:56 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 10/16] x86/amd: Always probe and configure the masking MSRs
Date: Mon, 26 Jan 2026 17:53:39 +0000
Message-Id: <20260126175345.2078371-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 111758BCA8
X-Rspamd-Action: no action

This allows the infrastructure to reused for system-wide quirk/errata
adjustments.

Replace the call to ctxt_switch_levelling() with amd_ctxt_switch_masking()
instead.  The CPUID Faulting aspect is not interesting at this point in boot,
and we want to explicitly propagate the masking MSR defaults into APs.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/amd.c   | 15 +++++++++++----
 xen/arch/x86/cpu/cpu.h   |  1 +
 xen/arch/x86/cpu/hygon.c |  2 +-
 3 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 36fea2e0a299..e8daf7415bb0 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -162,7 +162,7 @@ static void __init noinline probe_masking_msrs(void)
  * parameter of NULL is used to context switch to the default host state (by
  * the cpu bringup-code, crash path, etc).
  */
-static void cf_check amd_ctxt_switch_masking(const struct vcpu *next)
+void cf_check amd_ctxt_switch_masking(const struct vcpu *next)
 {
 	struct cpuidmasks *these_masks = &this_cpu(cpuidmasks);
 	const struct domain *nextd = next ? next->domain : NULL;
@@ -242,9 +242,12 @@ static void __init amd_init_levelling(void)
 	    boot_cpu_has(X86_FEATURE_CPUID_USER_DIS)) {
 		expected_levelling_cap |= LCAP_faulting;
 		levelling_caps |= LCAP_faulting;
-		return;
 	}
 
+	/*
+	 * Always probe for the MSRs too.  We reuse the infrastruture for
+	 * quirks/errata/etc during boot.
+	 */
 	probe_masking_msrs();
 
 	if ((levelling_caps & LCAP_1cd) == LCAP_1cd) {
@@ -299,7 +302,7 @@ static void __init amd_init_levelling(void)
 		       (uint32_t)cpuidmask_defaults._6c);
 	}
 
-	if (levelling_caps)
+	if (levelling_caps && !(levelling_caps & LCAP_faulting))
 		ctxt_switch_masking = amd_ctxt_switch_masking;
 }
 
@@ -1015,7 +1018,11 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	u32 l, h;
 	uint64_t value;
 
-	ctxt_switch_levelling(NULL);
+	/*
+	 * Reuse amd_ctxt_switch_masking() explicitly.  This propagates
+	 * quirk/errata adjustments made duing early_init_amd() into the APs.
+	 */
+	amd_ctxt_switch_masking(NULL);
 
 	amd_init_de_cfg(c);
 
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index d2d37d1d5eec..cd93e51755af 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -20,6 +20,7 @@ extern void detect_ht(struct cpuinfo_x86 *c);
 extern bool detect_extended_topology(struct cpuinfo_x86 *c);
 
 void cf_check early_init_amd(void);
+void cf_check amd_ctxt_switch_masking(const struct vcpu *next);
 void amd_log_freq(const struct cpuinfo_x86 *c);
 void amd_init_de_cfg(const struct cpuinfo_x86 *c);
 void amd_init_lfence_dispatch(void);
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index bb1624882499..3a04efef5028 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -32,7 +32,7 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
 {
 	unsigned long long value;
 
-	ctxt_switch_levelling(NULL);
+	amd_ctxt_switch_masking(NULL);
 
 	amd_init_de_cfg(c);
 
-- 
2.39.5


