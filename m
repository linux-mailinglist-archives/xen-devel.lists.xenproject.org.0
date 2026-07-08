Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nzCrCgJlTmp6LwIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 16:56:02 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 801E6727A69
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 16:56:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=VBfzoQYO;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357135.1611626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whTgg-00082T-R8; Wed, 08 Jul 2026 14:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357135.1611626; Wed, 08 Jul 2026 14:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whTgg-00080D-OU; Wed, 08 Jul 2026 14:55:46 +0000
Received: by outflank-mailman (input) for mailman id 1357135;
 Wed, 08 Jul 2026 14:55:45 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1whTgf-000807-85
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 14:55:45 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whTge-0007NS-LI
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 16:55:44 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4e64dd-bab6-0a2a0a5309dd-0a2a4505dc9a-48
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 16:55:44 +0200
Received: from [209.85.221.49] (helo=mail-wr1-f49.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4e64f0-3cb2-0a2a45050019-d155dd31a486-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 16:55:44 +0200
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-4758bd3731bso605109f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 07:55:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47aa039b126sm43066599f8f.24.2026.07.08.07.55.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jul 2026 07:55:43 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783522544; x=1784127344; darn=lists.xenproject.org;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=bFF/1aIEUZe7ClGY7L9LcVeNotxS1viNd9h5I3egz24=;
        b=VBfzoQYOaaJgmDu4zOXkIfeMNXWUwWtG5FZ8QHHvGBYp6HEvdW58mBR/KZW+38p5Is
         DT50gC8BJZh+DKkuBt/S4uxNLEDWjIEVcAhzue1dKlzJyWYBBf4LCheKfye8bkrc7OOW
         UKf4I6K/gLbJqXmJCeiDD5cWUp+LqFJns8mdVTkjxvSA/+QxHGra2eGVW2kHuu1Y1r5a
         G6/rHH+EUuiQKiw5S58XxwL6OI+eArWJbsgNAJs5NPsOMPzU1Ro29P16KKgORJRZxRPn
         JT6vqGaAZswvT8T/Qtz7clCxA7GJCt1FvH039wrYcYUIR1k+ytxb4oxoMzy/3n9f21Fv
         wsUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783522544; x=1784127344;
        h=content-transfer-encoding:content-type:autocrypt:content-language
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bFF/1aIEUZe7ClGY7L9LcVeNotxS1viNd9h5I3egz24=;
        b=FftNpRb0OJQCkdrXimYzc5OvuBYkqNod782ciJrCgoxv5zLioQeDP53xvJXNuLXQuj
         VXXFqWlCUcZha5dBnvPBRXZUUuT7MjXVscLUYR4Ems6jCoTiT6J8JRz0Ja3gwV5JgLPL
         fjjm4UTmVOnRTLzd3e5axaJ0RZMTYdd0qLLEiuitPsEO5SX4O8ZxenvCA7U/xjgfuFz/
         7CZU4+dtbD0227sS80Z9aRg1BGn2JRkfHqYJqcurgQLnaEcrLLDJIFioxwQPZ144al/i
         2BfCkOCpDWlG75VG7N6TAeLDcQA7oTsWH7H1l2dLbwL65Ura0shU2Ux7oGKR7IIli/Gt
         dQHA==
X-Gm-Message-State: AOJu0YyoNdQq/KGHJOqPhao5w8pzxqZN7pCVrlWdWiq5df3zTXVowvlt
	RY4oehHwqQGKf+uvFRfybQro6H+i2QtBWNmky/AJXiI+iP4EAiSBG0iiFalmvL4wkfJwkjTgRcu
	EO4mCLQ==
X-Gm-Gg: AfdE7ckWn9Oex862e7kNJtN23MoOh2/BaENMWU4kjaVlX9ZZ9qsstqV+MS7rdbpYSFc
	QrI/t4aHGom6AQcCa3IExFoTd6RYD5hn52TEIont0VP89suebvVagD8/Eog9X/qocrVJQ1F+Dxk
	4fa2lwyv4K9VR3ygmHYPkWOWI/Y3pidP3qKEvhO+Q/GpohuVLlhN+Lw3UGXgAzwr7H6KQpBT2Dj
	wcpOsxz7hlZ5r2VFsP++x3WrG7YKHx8QlZFI44U0246Q1fpo+XK8cM7eS9WYf0wdGIPlYahQYw8
	qeDwxAr0EKpDtSCyMg2k4KOqk22gjqfU8CJXxzuJkSXhXBMidr7RL/VyfTvON7VKB5pzJwW1AMq
	EHC4COFIQb2s2fpr39zWICTzyooMedcRVUQwwLg6BcA20u45W/FoT+BAfJ28qtdNThsBOuy7Iv4
	ojIIiCZ5jrsXFxzkomU5YeUpm2rIw2/T7m7UsGdz9Px4NLk6WvefqMCCTtNufflhRdyjctwjqa8
	Gbu
X-Received: by 2002:a05:6000:387:b0:460:6b12:1783 with SMTP id ffacd0b85a97d-47df02459b8mr3564130f8f.4.1783522543946;
        Wed, 08 Jul 2026 07:55:43 -0700 (PDT)
Message-ID: <da502f31-17fa-4b2d-90e3-1f6988717454@suse.com>
Date: Wed, 8 Jul 2026 16:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 for-4.22] x86/cpu-policy: set up host policy earlier
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>,
 Teddy Astie <teddy.astie@vates.tech>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-c201ff/1783522544-17B192B8-0BD7AB3F/10/73395122804
X-purgate-type: spam
X-purgate-size: 3498
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,m:teddy.astie@vates.tech,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[citrix.com,invisiblethingslab.com,vates.tech,gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[suse.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 801E6727A69

In order to use cpu_has_* expanding to host_cpu_policy.*, the host policy
needs setting up alongside boot_cpu_data.x86_capability[]. Arrange for
that towards the end of identify_cpu(). Then make sure .x86_capability[]
and host policy remain in sync when setup_{force,clear}_cpu_cap() are
used.

Rename the function now it's no longer static.

Fixes: 894bd7617924 ("x86/Intel: use host CPU policy for ARAT checking")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
This really was part of one of the XSTATE cleanup patches at the head of
the AMX series. This explains the specific placement ahead of the call to
xstate_init()). Likely anything from there downwards shouldn't really
live in identify_cpu() anyway.
---
v3: Make call from setup_force_cpu_cap() conditional.
v2: Call calculate_host_cpu_policy() from setup_{force,clear}_cpu_cap()
    instead of from init_guest_cpu_policies().

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -66,8 +66,10 @@ void __init setup_clear_cpu_cap(unsigned
 	__clear_bit(cap, boot_cpu_data.x86_capability);
 	dfs = x86_cpu_policy_lookup_deep_deps(cap);
 
-	if (!dfs)
+	if (!dfs) {
+		calculate_host_cpu_policy();
 		return;
+	}
 
 	for (i = 0; i < FSCAPINTS; ++i) {
 		cleared_caps[i] |= dfs[i];
@@ -78,6 +80,8 @@ void __init setup_clear_cpu_cap(unsigned
 		       __builtin_return_address(0),
 		       i, forced_caps[i] & dfs[i]);
 	}
+
+	calculate_host_cpu_policy();
 }
 
 void __init setup_force_cpu_cap(unsigned int cap)
@@ -92,6 +96,10 @@ void __init setup_force_cpu_cap(unsigned
 	}
 
 	__set_bit(cap, boot_cpu_data.x86_capability);
+
+	/* Don't recalculate when the bit isn't represented in the policy. */
+	if (cap < FSCAPINTS * 32)
+		calculate_host_cpu_policy();
 }
 
 bool __init is_forced_cpu_cap(unsigned int cap)
@@ -586,6 +594,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	}
 
 	/* Now the feature flags better reflect actual CPU features! */
+	if (c == &boot_cpu_data)
+		calculate_host_cpu_policy();
 
 	xstate_init(c);
 
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -359,11 +359,18 @@ void calculate_raw_cpu_policy(void)
     /* Was already added by probe_cpuid_faulting() */
 }
 
-static void __init calculate_host_policy(void)
+void __init calculate_host_cpu_policy(void)
 {
     struct cpu_policy *p = &host_cpu_policy;
     unsigned int max_extd_leaf;
 
+    /*
+     * Bail if the raw policy wasn't set up yet. At least recalculate_xstate()
+     * can't be used yet in that case.
+     */
+    if ( !raw_cpu_policy.basic.max_leaf )
+        return;
+
     *p = raw_cpu_policy;
 
     p->basic.max_leaf =
@@ -904,8 +911,6 @@ static void __init calculate_hvm_def_pol
 
 void __init init_guest_cpu_policies(void)
 {
-    calculate_host_policy();
-
     if ( IS_ENABLED(CONFIG_PV) )
     {
         calculate_pv_max_policy();
--- a/xen/arch/x86/include/asm/cpu-policy.h
+++ b/xen/arch/x86/include/asm/cpu-policy.h
@@ -30,4 +30,10 @@ void recalculate_cpuid_policy(struct dom
  */
 void calculate_raw_cpu_policy(void);
 
+/*
+ * Collect the host CPU policy.  Called after collecting enough CPUID output,
+ * and again after all feature overrides have been put in place.
+ */
+void calculate_host_cpu_policy(void);
+
 #endif /* X86_CPU_POLICY_H */

