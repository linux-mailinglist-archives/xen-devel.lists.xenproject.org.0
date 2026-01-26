Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 5pIzKlKqd2lBkAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618688BC8C
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213831.1524286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmh-0004aK-Og; Mon, 26 Jan 2026 17:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213831.1524286; Mon, 26 Jan 2026 17:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmh-0004Tl-Hw; Mon, 26 Jan 2026 17:53:55 +0000
Received: by outflank-mailman (input) for mailman id 1213831;
 Mon, 26 Jan 2026 17:53:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmf-0004HW-Mq
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:53:53 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa6536aa-fadf-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 18:53:53 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso55313495e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:53 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:52 -0800 (PST)
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
X-Inumbo-ID: fa6536aa-fadf-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450032; x=1770054832; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVFZKPX+rQ8GQmkwaOmVq1QfQ8v/dwJRo6+jPX9Dkm8=;
        b=P5S1xDUJCNyQG6IbahEYbDcJgsxRGwxBQ6SKXjhtDSpPesxnWhaY4T00BJQtND38Mk
         E5uDTW5eDbo2BNhmyD7EvTdGrOHHdrKLITE+3UAH8mGCAVOCxSp/K8Ncf8JrRE1mJQ/H
         r2hCebZoFt88ndlyphl/ZNjPYFrkMDpRPRF7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450032; x=1770054832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SVFZKPX+rQ8GQmkwaOmVq1QfQ8v/dwJRo6+jPX9Dkm8=;
        b=BOGTLRcph9WgxQqQk3o5MjcsVx8HIKWbdCOVfDf+0x50JkOr4CZuBO1LkLL+SfPz94
         g3QG7yAFsfq992ShOd1AuVpjtxEJ6K7TT47ljFgDwnSfqTzGobYaOoTtjuIJ7sfSZG5b
         8/he8eBfIYLeH9PjAGBSu8nnYz6op90cJ/A+QVrxf8xnYvwSw4EYPi0kzUSGrUChtkI6
         ZPP5IvAeb2dBv5OtcIIIfiZXlZZpG70QUXr/rHqCPXh/3iXrvCjrMUGqI6SJIvqRfidX
         Jrly2E9hT5WDNRbLBKTYvmOZ1QErVv+jwn0yS0n9wxXPr7ZeQjsSxsBkd6ZB5jvzn4xr
         qOVw==
X-Gm-Message-State: AOJu0Yw+QEvZy9w2bsrF4U/5vlXsAQE12I8p+Ln+FojK+E6oNJFsvWkK
	O37qipBNkCljwbpNlm26rJjWS3T+xZvXlTMLbWJj++ESSlS3OdHVJv9jtpVoTzFkHVa1+13K0w1
	jR1Nq
X-Gm-Gg: AZuq6aLImjM8Uae1dH94byu1ln6wTch/kOKuD+hR2ZK64fktNy7d3a3mXuxtzh2zJzE
	w1hc5ST+U0AzJfZse3VcAlAj+S3g3/ys2ZsyUTxoVe+d1TEqs97JN5NQUeiJDtPMOQxPiFJKhYf
	tcwh7Js2Pp5ezzNI+p4/zpXl56te1uWwAVWGtVvCerEa/BJewYNw+xc3GntnnyBTOXv2N6Fhrmt
	JNymRnmmj6wv4hR3GAztg/RushXEHYe4Rbjx6GpRfMT5Q3y/q+3AilHAfRX6wY5nb9h2VDLitS2
	ALcHpgn4dBviFFUE2zkJTcXHQ6TlWo53BF1wuqtHxJGqymXtU08bK2G5UTeQJ9yJHVg1oHPmT8l
	MSxXWxlLDt9mSuqj7rSkhvTNpOrWUiKY5DDdFyi1u9L2WxvjWiXwlDOFlAkj4hYVLV9t9Xp+R69
	z1x4g4fBa5Rb1FdfIQjPuYy4BW2EEJdYKRArk088Pood/KCoPp82Fv34YVrPtjfQ==
X-Received: by 2002:a05:600c:35ce:b0:47d:3ead:7440 with SMTP id 5b1f17b1804b1-4805d06c428mr85483385e9.32.1769450032374;
        Mon, 26 Jan 2026 09:53:52 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 05/16] x86/cpu: Move per-CPU actions out of the vendor early_init() hook
Date: Mon, 26 Jan 2026 17:53:34 +0000
Message-Id: <20260126175345.2078371-6-andrew.cooper3@citrix.com>
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
X-Rspamd-Queue-Id: 618688BC8C
X-Rspamd-Action: no action

cpu_dev.c_early_init() and .c_init() is a spilt we inherited from Linux.

In Xen, these are called moments apart in identify_cpu().  The only logic
between the two calls is filling part of c->x86_capability[] and collecting
the the long model name.

We are going to want to repurpose .c_early_init() somewhat, so move the logic
wanting running on all CPUs to the .c_init() hook, which is only marginally
later.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/amd.c   |  4 ++--
 xen/arch/x86/cpu/hygon.c |  2 ++
 xen/arch/x86/cpu/intel.c | 12 ++++++------
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index fc496dc43e08..970cb42e9e0b 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -621,8 +621,6 @@ void cf_check early_init_amd(struct cpuinfo_x86 *c)
 {
 	if (c == &boot_cpu_data)
 		amd_init_levelling();
-
-	ctxt_switch_levelling(NULL);
 }
 
 void amd_log_freq(const struct cpuinfo_x86 *c)
@@ -1018,6 +1016,8 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	u32 l, h;
 	uint64_t value;
 
+	ctxt_switch_levelling(NULL);
+
 	amd_init_de_cfg(c);
 
 	if (c == &boot_cpu_data)
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index b99d83ed4d75..bb1624882499 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -32,6 +32,8 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
 {
 	unsigned long long value;
 
+	ctxt_switch_levelling(NULL);
+
 	amd_init_de_cfg(c);
 
 	if (c == &boot_cpu_data)
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index eec6ee763040..141dc2368143 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -327,10 +327,6 @@ void __init intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c)
 
 static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 {
-	/* Netburst reports 64 bytes clflush size, but does IO in 128 bytes */
-	if (c->x86 == 15 && c->x86_cache_alignment == 64)
-		c->x86_cache_alignment = 128;
-
 	if (c == &boot_cpu_data &&
 	    bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE)
 		printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
@@ -350,8 +346,6 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 
 		intel_init_levelling();
 	}
-
-	ctxt_switch_levelling(NULL);
 }
 
 /*
@@ -615,6 +609,12 @@ static void init_intel_perf(struct cpuinfo_x86 *c)
 
 static void cf_check init_intel(struct cpuinfo_x86 *c)
 {
+	/* Netburst reports 64 bytes clflush size, but does IO in 128 bytes */
+	if (c->x86 == 15 && c->x86_cache_alignment == 64)
+		c->x86_cache_alignment = 128;
+
+	ctxt_switch_levelling(NULL);
+
 	/* Detect the extended topology information if available */
 	detect_extended_topology(c);
 
-- 
2.39.5


