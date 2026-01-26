Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF7TNlGqd2lAkAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:25 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909688BC77
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213830.1524281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmh-0004UV-Gu; Mon, 26 Jan 2026 17:53:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213830.1524281; Mon, 26 Jan 2026 17:53:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmh-0004Qj-9u; Mon, 26 Jan 2026 17:53:55 +0000
Received: by outflank-mailman (input) for mailman id 1213830;
 Mon, 26 Jan 2026 17:53:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmf-0004HX-JH
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:53:53 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f95da1ba-fadf-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 18:53:51 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47ee301a06aso55313185e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:51 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:50 -0800 (PST)
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
X-Inumbo-ID: f95da1ba-fadf-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450031; x=1770054831; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPbCiqCcqf0/NbE9zeJiJem+K34lkoRlbsFPYopIEac=;
        b=uKXW59LQ+j6pC//HqjWHvCbuP2qjKwXraAW7xOlMuOCZIJrrj3m3FEdcVN/3+o9YML
         BSRDecAih92Sf8W+IL0CHtXVK3sgxM69+eRPUn3wuIJM4r2nINEp+P8ez7dYUb9daqBz
         TYgXIPsXZyCbxYD+JkrJ9i+YCyjEKLgSx2RbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450031; x=1770054831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPbCiqCcqf0/NbE9zeJiJem+K34lkoRlbsFPYopIEac=;
        b=Cqv2cQzygRi/xZdgCjteKk3385jSajPtRHYU+2mwrz1sYp/nzSYtPrrvx0CXhIEFet
         MgN7DDQjCXBzZmrn3tVvJpmwZjLPSMVTWstjyMDj2N5fr1F5vrEYLJo5a7P7HoJ2//BQ
         Fah1sLkza91nOUvs8v2K49Tl8Io/u9ebrY/8/awRaBPctC8JwWEhMRCn9WAWmYGktEMt
         5T0Qn23mrpgdWIt+iW6kj3FFev2tSP0Q958cvbqdSNZ+ZF3e75aZl5LbIll9jkgn6B27
         DCkML4t0CELVF++e65fyk3b9pTSILF4ftN40sgbbzaOOHiP63YQRbLrXp9Apc/6OU2Qq
         6Z3Q==
X-Gm-Message-State: AOJu0YwZ8tfzxiQ0uAaxY0qaN51Q3a+/Eq2Sg527MZu3T7lEMh6sAOfs
	+coc14dyxS7WxSVlzrvK095l1WwcRvKHauhVuzswCMkVsuNPHgVMMQR6flBtcc05UlmLraqJrBr
	urReF
X-Gm-Gg: AZuq6aL3ohplvANNSvzSYoD8NdqTfJvrIw2RtPeonE+Z624sxeX7kIrHjQjCnpPd2v7
	XUJgryDlnA0n+AuFj5leTYfCu2TBOVEowEgZrxkgCdUZP8j0boGQQEcrUJYLWh5gmjfTeOjaMpD
	p1EOgiAysmfZLxKRULWwPnW1XXwKkfQEAf4R4AK+yGvtybv6IrwZDyLgznYszTEvsQSEpz9uhZW
	wf2JEvUbywuqObmNx4zXBtmYBZ9yzwo74RHnwURUTzYQ41i6C5Gigluvyd0cy/pqkYXfI8JQ38x
	GdP/YbxseLeGndrVeASFYGehZponJgOpJChocO5iiMALq8d81merU2pOzYoLRtLk0+rbqzuc/on
	T/jZwxRhQPi9BrtWS5WBF3LnbkPfJGKz44IwRgF7hV0LRPkCK2ymAzFalde54zGHditCW34FI31
	0mVBO4tF2YfV47VgSnGhxHujOkVBsBDOz4CePbwXE2o/0V5fRk/DZ/ZgQV3yq+rA==
X-Received: by 2002:a05:600c:444c:b0:47e:e779:36e with SMTP id 5b1f17b1804b1-4805cf67274mr86300515e9.19.1769450030306;
        Mon, 26 Jan 2026 09:53:50 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 02/16] x86/cpu: Drop cpuid_level adjustment from generic_identify()
Date: Mon, 26 Jan 2026 17:53:31 +0000
Message-Id: <20260126175345.2078371-3-andrew.cooper3@citrix.com>
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
X-Rspamd-Queue-Id: 909688BC77
X-Rspamd-Action: no action

early_cpu_init() calls intel_unlock_cpuid_leaves(), which arranges for the
boot trampoline to make the adjustment for all APs, meaning the call from
early_init_intel() is a no-op.  Drop it, allowing intel_unlock_cpuid_leaves()
to become __init code.

In turn, the adjustments in generic_identify() were a no-op too.  Nothing in
the c_early_init() hooks modifies the 1c/1d features, so their values in
c->x86_capability[] are still good from just above.

The ebx variable used to calculate c->x86_clflush_size is still good too, but
move the logic earlier so it's more obviously correct.

Fixes: fa4d026737a4 ("x86/Intel: unlock CPUID earlier for the BSP")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/common.c | 10 +---------
 xen/arch/x86/cpu/intel.c  |  4 +---
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index f8c80db6eb1d..dda0d5d39c92 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -479,6 +479,7 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	cpuid(1, &eax, &ebx, &ecx, &edx);
 	c->x86 = get_cpu_family(eax, &c->x86_model, &c->x86_mask);
 	c->apicid = phys_pkg_id((ebx >> 24) & 0xFF, 0);
+	c->x86_clflush_size = ((ebx >> 8) & 0xff) * 8;
 	c->phys_proc_id = c->apicid;
 
 	/*
@@ -502,15 +503,6 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	if (actual_cpu.c_early_init)
 		alternative_vcall(actual_cpu.c_early_init, c);
 
-	/* c_early_init() may have adjusted cpuid levels/features.  Reread. */
-	c->cpuid_level = cpuid_eax(0);
-	cpuid(1, &eax, &ebx,
-	      &c->x86_capability[FEATURESET_1c],
-	      &c->x86_capability[FEATURESET_1d]);
-
-	if ( cpu_has(c, X86_FEATURE_CLFLUSH) )
-		c->x86_clflush_size = ((ebx >> 8) & 0xff) * 8;
-
 	/* AMD-defined flags: level 0x80000001 */
 	if (c->extended_cpuid_level >= 0x80000001)
 		cpuid(0x80000001, &tmp, &tmp,
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 584588e406f2..d585161dd32f 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -310,7 +310,7 @@ static void __init noinline intel_init_levelling(void)
 }
 
 /* Unmask CPUID levels if masked. */
-void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c)
+void __init intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c)
 {
 	uint64_t misc_enable, disable;
 
@@ -335,8 +335,6 @@ static void cf_check early_init_intel(struct cpuinfo_x86 *c)
 	    bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE)
 		printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
 
-	intel_unlock_cpuid_leaves(c);
-
 	/* CPUID workaround for Intel 0F33/0F34 CPU */
 	if (boot_cpu_data.x86 == 0xF && boot_cpu_data.x86_model == 3 &&
 	    (boot_cpu_data.x86_mask == 3 || boot_cpu_data.x86_mask == 4))
-- 
2.39.5


