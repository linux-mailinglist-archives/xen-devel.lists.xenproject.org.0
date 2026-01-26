Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MqFFlGqd2kZkAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EECC38BC4D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213835.1524336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQml-0005ri-AT; Mon, 26 Jan 2026 17:53:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213835.1524336; Mon, 26 Jan 2026 17:53:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQml-0005na-3l; Mon, 26 Jan 2026 17:53:59 +0000
Received: by outflank-mailman (input) for mailman id 1213835;
 Mon, 26 Jan 2026 17:53:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmj-0004HX-Ji
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:53:57 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbb7a6fe-fadf-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 18:53:55 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4801eb2c0a5so47916475e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:55 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:53 -0800 (PST)
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
X-Inumbo-ID: fbb7a6fe-fadf-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450035; x=1770054835; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wd9T6LoaSruhHAOhpkCe8Gt28xOELGHhuvCSdvapew=;
        b=Us8fo0QRFyEldxIlsunrIgIR5nFIxed7o3TXza1Ty80L982vmxOA6dLxSgtNbNLpv5
         i/YwqVGueNFMnxdpDY5O7rfTX62tln7fhHvLU54fh5qm4fTInJWiAEmGwI5pGgwcAHaF
         zjaNu47wwWWGt86EN/rEFB548h/6JNGWfc5h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450035; x=1770054835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+wd9T6LoaSruhHAOhpkCe8Gt28xOELGHhuvCSdvapew=;
        b=ihAVghvFLcYQnNOi6G+2ret7I4IdLEU0NwjAuIP4R67/5umZFgGd2LYAhnIgElxp7j
         5nJ3iDssTdqjBumPCnhdx3hdFJIBATswD7WdTiSk4PC+CV6L0CE1VOQxO5TGBu/CZOzt
         WIWxjN05BgxK2IzKI9igttKaMnQ3FuTh2eoaemPfpkaDwb0+vRznVLFHuEjrc+2lHfo0
         NtW30bvCeF7MtuvLG6zkVWZYNGBdGM7u5qu8na7wMgs1tRVx1pPhEAbto6j7HgogVn0f
         v5dOzPO2D6ZwaPGUnQzjZBv08mncGK+3i/OQtM6AVUieKrcsjWx/hIxVetLXmI5Ry2qm
         wy5g==
X-Gm-Message-State: AOJu0Yx+wnOg1t6zlNHur4r0hIQaQmd5glCZlWBZ+Jb1n5QPej61ETf7
	loweWQAu7i8Qg7RKb/O5WMaR2l4rNVk2lvUwyXO5B7Gu5TL8/ynDlIqiLBeKdqmcvZ064+L5wba
	74hF6
X-Gm-Gg: AZuq6aKEe/SluhXSwPuJxVORUZY6RIc8f4kOrCFNF4LreG9hZD5F3wrOZxrAN30zX6I
	uux+ZNI6oU0K8alOKol8Yw7QcxteYJ43uhpY+D/Q+IGQVot9Fwm2nk3OswLPbpd97qGFrp5b+RF
	0eTLv6+PiB/D+pZCpNPflYGXkwc3DyQamFHwuCwKPOF6udu0+sZIY2S0rUwTDOkS47G7AbgXln8
	DVTT++EcfAYAldSEybAAb2+wIDfAZrATlmOPzcVLQMGFsvgfAnVhUiDC+vBTuexDQD1fhhH0sc0
	YD2CkfIivDbByoFOA5HL4QksNMysxSY7q8KBtjznS8K6sAFMjWIN1qvxK2Qn5AICDPs6XBiEmEj
	Czp3LwZwleGZ/TQfRtkeZv8oP9vZx8KBDWwzkBLR2Wu5gbhgB+61ICyPWaAniJkJUuhe8Msq8Eq
	Eyy1EBtp4M+r1wE/d7f86z51/aaBfMKUL6oH6kItQRLswf7rvAUwrhTtrltvFuo7IBHZzFGBAf
X-Received: by 2002:a05:600c:4684:b0:477:63b5:7148 with SMTP id 5b1f17b1804b1-4805cd40fc4mr89474625e9.6.1769450034271;
        Mon, 26 Jan 2026 09:53:54 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 07/16] x86/cpu: Call the vendor early_init() hook in early_cpu_init()
Date: Mon, 26 Jan 2026 17:53:36 +0000
Message-Id: <20260126175345.2078371-8-andrew.cooper3@citrix.com>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email,citrix.com:dkim,citrix.com:mid];
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
X-Rspamd-Queue-Id: EECC38BC4D
X-Rspamd-Action: no action

... which is in practice much earlier on boot.

Currently, beyond basic vendor family and model information, the Intel hook
needs the SELF_SNOOP CPUID bit which is collected by early_cpu_init() already.
The AMD hook needs CPUID_USER_DIS, so the collection of leaf e21a needs to
move too.  (identify_cpu() has a second collection of this leaf, which
remains.)

In order to facilitate this, have early_cpu_init() calculate
c->extended_cpuid_level in the usual way.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/common.c | 35 +++++++++++++++++++----------------
 1 file changed, 19 insertions(+), 16 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 39e64f3a5f88..d70f9cf87dc8 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -413,8 +413,12 @@ void __init early_cpu_init(bool verbose)
 	}
 
 	eax = cpuid_eax(0x80000000);
-	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
-		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
+	if ((eax >> 16) == 0x8000)
+		c->extended_cpuid_level = eax;
+
+	if (c->extended_cpuid_level >= 0x80000008) {
+		ebx = c->extended_cpuid_level >= 0x8000001f
+			? cpuid_ebx(0x8000001f) : 0;
 		eax = cpuid_eax(0x80000008);
 
 		paddr_bits = eax & 0xff;
@@ -433,6 +437,19 @@ void __init early_cpu_init(bool verbose)
 		paddr_bits -= (ebx >> 6) & 0x3f;
 	}
 
+	if (c->extended_cpuid_level >= 0x80000021)
+		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
+
+	/*
+	 * Abuse 'verbose' to signal the first pass thought this function.
+	 *
+	 * Besides basic vendor, family and model information, the hooks need
+	 * certain words of x86_capability[] already scanned, as they may take
+	 * action to cause features to reappear.
+	 */
+	if (verbose && actual_cpu.c_early_init)
+		actual_cpu.c_early_init();
+
 	if (!(c->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)))
 		park_offline_cpus = opt_mce;
 
@@ -485,10 +502,6 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	c->x86_clflush_size = ((ebx >> 8) & 0xff) * 8;
 	c->phys_proc_id = c->apicid;
 
-	/*
-	 * Early init of Self Snoop support requires 0x1.edx, while there also
-	 * set 0x1.ecx as the value is in context.
-	 */
 	c->x86_capability[FEATURESET_1c] = ecx;
 	c->x86_capability[FEATURESET_1d] = edx;
 
@@ -496,16 +509,6 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	if ((eax >> 16) == 0x8000)
 		c->extended_cpuid_level = eax;
 
-	/*
-	 * These AMD-defined flags are out of place, but we need
-	 * them early for the CPUID faulting probe code
-	 */
-	if (c->extended_cpuid_level >= 0x80000021)
-		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
-
-	if (c == &boot_cpu_data && actual_cpu.c_early_init)
-		alternative_vcall(actual_cpu.c_early_init);
-
 	/* AMD-defined flags: level 0x80000001 */
 	if (c->extended_cpuid_level >= 0x80000001)
 		cpuid(0x80000001, &tmp, &tmp,
-- 
2.39.5


