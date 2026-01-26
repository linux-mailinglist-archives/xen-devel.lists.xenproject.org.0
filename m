Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN1uFFOqd2lBkAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 057708BC9A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213834.1524323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmj-0005U9-VA; Mon, 26 Jan 2026 17:53:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213834.1524323; Mon, 26 Jan 2026 17:53:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmj-0005Pv-QU; Mon, 26 Jan 2026 17:53:57 +0000
Received: by outflank-mailman (input) for mailman id 1213834;
 Mon, 26 Jan 2026 17:53:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmi-0004HX-Ja
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:53:56 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fada5a50-fadf-11f0-9ccf-f158ae23cfc8;
 Mon, 26 Jan 2026 18:53:54 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-47ff94b46afso41469725e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:54 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.52
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
X-Inumbo-ID: fada5a50-fadf-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450033; x=1770054833; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t6MpUKLCLKO3nERYaHJXRPiOdgAVGABSBDex8VMPnrc=;
        b=n+em5QK2h2wfDH+FC5a1Nfxh5YXfsF6upNPqqPXfCiculxY0HY7ZkJW5kfpOHNeecp
         QMv8RFxBCu4jcd6T14gt+5Oild1shHzTGBszYW28PWIsCLoI/VYtQ6USxIwMAq67I6Fb
         /5yOs6xmWOl8NGmban23vGZ0MmJBkcpEza7Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450033; x=1770054833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t6MpUKLCLKO3nERYaHJXRPiOdgAVGABSBDex8VMPnrc=;
        b=HNG+/xsMCg8QCR2RWAZaFWEVUgCfQl1fApPfWJmOts31ld1pPfOL2Gvtr5U2diMV73
         AjmkTrmXrJpC5PbGbqUzT1/HY5I1G0LdZykCC5Ae7YUN2eiy64Ks9rlBSaTSJXK0+Ko+
         XrrGri50CWYSBurNZnMDDc05ZncQtu2qJaBPwtSpyXD6aKEi2JxRFyJif81uUqbapqzi
         7foDANcv9ylKPT/ggFP1XZljpdab+xpCEfzPoIiKUPT7DAbhdvVZDz9d6kj85d6anFKC
         MbPmrLBDxVQZAUJpn/WwbtvdGZ+K5n5KTjezqMH5m+Cl13VF2WvlKweC+5fY6KUpn2Xq
         gSig==
X-Gm-Message-State: AOJu0Yz1DLzH92NhP3FKYDmkhHr4TJ4VZPXrjM1dPbYggVWLQsoZ98XJ
	Y4JmkqnAjRPhodrld0AwPOckmQ8T/TDO9FFt7p+YadgIIM5i/Xm3h9gUW9OAQ2bQZB+BpPvCyE+
	8wJAu
X-Gm-Gg: AZuq6aLwAEzn6DySUzm17FzeMdD09MPBlb1bBl3sKpOokZvr//yRUoOoEH+7bWdb/ah
	WPeI7igxPgQwY9q4sJPbuj9rbh8c721JFlj5a8czPEZqX+LxpYI8feSTtbr268raVkQ2bWBUA4y
	u960h5pasSnmBbHvDEXBT+IyMh8YS0wkwjAl7G2ZxRc1FoRajbFdu2o7SK/TXFbSirAQ+7dSxVg
	9y8jJDKstidXfrUNrjfamW83LNwuKTgAsGmxIhtr8q5AAdQDp2e11/4LteKtWGNtOnUd/X+mdPf
	uhma9opxuiajaTxDXNjz2yB/GBK851lKBPxVWkccfGiMlSMlQrZyGYuY9KnUiAXi0j6gvlW+W6v
	9N5pwyFT+EyhiORK26ajnYfXlJ6GojEoUjuwd2reFNBvEfFwNeBpfZE1Ojh+FGXKtUHVkGZ2sqh
	eqIwQ6m8KM7Y/RtA7M8TP+x8x9JiXVXIr52F3Ic4V7cHGF2jy/kI0o8HdwqHgyLQ==
X-Received: by 2002:a05:600c:681b:b0:47b:deb9:163d with SMTP id 5b1f17b1804b1-4805dd41a1cmr77379775e9.7.1769450033429;
        Mon, 26 Jan 2026 09:53:53 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 06/16] x86/cpu: Rework the vendor early_init() hooks to be __init
Date: Mon, 26 Jan 2026 17:53:35 +0000
Message-Id: <20260126175345.2078371-7-andrew.cooper3@citrix.com>
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
X-Rspamd-Queue-Id: 057708BC9A
X-Rspamd-Action: no action

All interior actions are now conditional on c == &boot_cpu_data, so rearrange
it to the caller in identify_cpu() and drop the hook parameter.

This allows early_init_$VENDOR() to become __init, which in turn allows
$VENDOR_init_levelling() to cease being noinline.

Reposition the early_init_intel() function simply to make diff legible.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/amd.c    |  7 +++----
 xen/arch/x86/cpu/common.c |  4 ++--
 xen/arch/x86/cpu/cpu.h    |  4 ++--
 xen/arch/x86/cpu/intel.c  | 42 +++++++++++++++++----------------------
 4 files changed, 25 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 970cb42e9e0b..36fea2e0a299 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -224,7 +224,7 @@ static const typeof(ctxt_switch_masking) __initconst_cf_clobber __used csm =
  * avoid this, as the accidentally-advertised features will not actually
  * function.
  */
-static void __init noinline amd_init_levelling(void)
+static void __init amd_init_levelling(void)
 {
 	/*
 	 * If there's support for CpuidUserDis or CPUID faulting then
@@ -617,10 +617,9 @@ void amd_process_freq(const struct cpuinfo_x86 *c,
 		*low_mhz = amd_parse_freq(c->x86, lo);
 }
 
-void cf_check early_init_amd(struct cpuinfo_x86 *c)
+void __init cf_check early_init_amd(void)
 {
-	if (c == &boot_cpu_data)
-		amd_init_levelling();
+    amd_init_levelling();
 }
 
 void amd_log_freq(const struct cpuinfo_x86 *c)
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 89b58e6182b9..39e64f3a5f88 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -503,8 +503,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	if (c->extended_cpuid_level >= 0x80000021)
 		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
 
-	if (actual_cpu.c_early_init)
-		alternative_vcall(actual_cpu.c_early_init, c);
+	if (c == &boot_cpu_data && actual_cpu.c_early_init)
+		alternative_vcall(actual_cpu.c_early_init);
 
 	/* AMD-defined flags: level 0x80000001 */
 	if (c->extended_cpuid_level >= 0x80000001)
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index bbede57ab00d..0fc6370edb13 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -4,7 +4,7 @@
 #define X86_CPU_H
 
 struct cpu_dev {
-	void		(*c_early_init)(struct cpuinfo_x86 *c);
+	void		(*c_early_init)(void);
 	void		(*c_init)(struct cpuinfo_x86 * c);
 };
 
@@ -19,7 +19,7 @@ extern void display_cacheinfo(struct cpuinfo_x86 *c);
 extern void detect_ht(struct cpuinfo_x86 *c);
 extern bool detect_extended_topology(struct cpuinfo_x86 *c);
 
-void cf_check early_init_amd(struct cpuinfo_x86 *c);
+void cf_check early_init_amd(void);
 void amd_log_freq(const struct cpuinfo_x86 *c);
 void amd_init_de_cfg(const struct cpuinfo_x86 *c);
 void amd_init_lfence_dispatch(void);
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 141dc2368143..2aeeb2f5bf55 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -251,7 +251,7 @@ static const typeof(ctxt_switch_masking) __initconst_cf_clobber __used csm =
     intel_ctxt_switch_masking;
 #endif
 
-static void __init noinline intel_init_levelling(void)
+static void __init intel_init_levelling(void)
 {
 	uint32_t eax, ecx, edx, tmp;
 
@@ -325,29 +325,6 @@ void __init intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c)
 	}
 }
 
-static void cf_check early_init_intel(struct cpuinfo_x86 *c)
-{
-	if (c == &boot_cpu_data &&
-	    bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE)
-		printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
-
-	if (c == &boot_cpu_data) {
-		uint64_t misc_enable;
-
-		check_memory_type_self_snoop_errata();
-
-		/*
-		 * If fast string is not enabled in IA32_MISC_ENABLE for any reason,
-		 * clear the enhanced fast string CPU capability.
-		 */
-		rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
-		if (!(misc_enable & MSR_IA32_MISC_ENABLE_FAST_STRING))
-			setup_clear_cpu_cap(X86_FEATURE_ERMS);
-
-		intel_init_levelling();
-	}
-}
-
 /*
  * Errata BA80, AAK120, AAM108, AAO67, BD59, AAY54: Rapid Core C3/C6 Transition
  * May Cause Unpredictable System Behavior
@@ -413,6 +390,23 @@ static void __init probe_mwait_errata(void)
     }
 }
 
+static void __init cf_check early_init_intel(void)
+{
+    if ( bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE )
+        printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
+
+    check_memory_type_self_snoop_errata();
+
+    /*
+     * If fast string is not enabled in IA32_MISC_ENABLE for any reason,
+     * clear the enhanced fast string CPU capability.
+     */
+    if ( !(rdmsr(MSR_IA32_MISC_ENABLE) & MSR_IA32_MISC_ENABLE_FAST_STRING) )
+        setup_clear_cpu_cap(X86_FEATURE_ERMS);
+
+    intel_init_levelling();
+}
+
 /*
  * P4 Xeon errata 037 workaround.
  * Hardware prefetcher may cause stale data to be loaded into the cache.
-- 
2.39.5


