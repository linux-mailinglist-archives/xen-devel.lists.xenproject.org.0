Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ubwcARdWR2q/WQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 08:26:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A76FF116
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 08:26:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=JhsZ66IH;
	dmarc=pass (policy=quarantine) header.from=suse.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1352856.1609170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfXLk-00060H-7T; Fri, 03 Jul 2026 06:26:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1352856.1609170; Fri, 03 Jul 2026 06:26:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfXLk-0005yT-4A; Fri, 03 Jul 2026 06:26:08 +0000
Received: by outflank-mailman (input) for mailman id 1352856;
 Fri, 03 Jul 2026 06:26:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wfXLi-0005yM-3D
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 06:26:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfXLg-00H54x-Nj
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 08:26:04 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4755e0-bab6-0a2a0a5309dd-0a2a4505e232-36
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 08:26:04 +0200
Received: from [209.85.221.45] (helo=mail-wr1-f45.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a4755fc-3cb2-0a2a45050019-d155dd2dbdc8-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 08:26:04 +0200
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-4798bea72f9so123583f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 23:26:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-477de3dd53fsm14981470f8f.37.2026.07.02.23.26.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jul 2026 23:26:03 -0700 (PDT)
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
        d=suse.com; s=google; t=1783059964; x=1783664764; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Osy0sYEvcEVc3wSdb+rsl4BwKV2b8jJ9NOV+BOqJ2/M=;
        b=JhsZ66IHs7razkBPCBqxKrm2z13cwm1yKuThK02Hjkj0veJcbWRGtGT2eRbdmqQc+n
         YIovpar/WfTZjUURimhV1xOiBep82Y2AlFs2EvqpWKYIpspce2UDe70Iop/Dr33qb6CC
         WkwJBHdUKFbcTxKgaTE87gwT2ZFXQ4MYV10rmii03ZZnsl9jXimganjIVNr6G8xTMTG+
         0aTpqW78RwZ706j8hfcnTlHXvsFA+giAdJJBAd7gf0gfCxeYI8QG7MT6dLV1obilepsA
         8h5eTqIUgv4nGWhZn/aiTxw3avnL/LtS5R4x7QYCVeu8EuGDRRzrmJsgnaYCtdgrNbuN
         4qeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783059964; x=1783664764;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Osy0sYEvcEVc3wSdb+rsl4BwKV2b8jJ9NOV+BOqJ2/M=;
        b=Or94vcgSk+fVb3h7WgJT/YSzxadka8TkshuwF4bwCwqYnpR0Ew6N2UN1mLDyVA/z3R
         ekA7kZ1H5RUWCYEhC2HDRo9PoUEO1ekdkzZgHcsm3p3ta+bTAa+P/Dm+ldsjd1+b2kH/
         WZ+WBTlOv3O7EAPvBuR8HL6GGUpwK1rLTNQD3pptuUWSgTvVTfD0b1CZZsX6qzhSrAIf
         zu0uDe6p1iFr4GO2e7T0MQLaYGt0LyHR7TlGwoiOjzpozvjASBhfknMXIt6T9GUKIBo8
         kVoeftfv+geavYijufPRzJlxmSCtz691qR6JgD6uFEVh8lS4ye24G6eoYWTirSdSEnnm
         LmPA==
X-Gm-Message-State: AOJu0YxheNfh01oh15OckPwtyKynFWLSpXft9IO9vQTJBoWaMnrN+xMk
	El7ZT19D7ocV54SqgDeZ87JZ/6aB3AaodYVlZDi2L+/HiHzB7GdZ7rT55cReuhbIaLorLk1LLnR
	dzhST0Q==
X-Gm-Gg: AfdE7cnG6GwkptKqXpx+fYHLx8DE14YRE3kFeOwhLI4/nPWrMsVOjtftw3R0G/uBDe4
	xRoFciK3YJxCfH1dDq34gimGjqqhklqMVoJ+tmhDolcYR3wF2PjSUJK1Or0LWMZxYXQUlIk4FQW
	SDiOCtcldjAo0XDK38wvF0rgD9Nmbt9G7yf6PaZlaSBjmwytuOsM8djJSpjy0tPaTarL8l+eeDB
	SMkKY7sDRCxwuk8ITt+chQSY8z00ElFC5IiSK3JKXF0Ejwylw+vZok0LQeg94eDsWtKzhVGBye8
	IXGYXa3rL6aNAjWZn0CrypsRYH2Jnd9rtTFm6H4NWFgh9324MYpOYBbmKKVMKOrn5pQsL0XqrUY
	BSCTEx3e0eLFTeHwyF/K24ihzJFf8+4j7ZQDdlbLjB9sI4DnVYT4k6qydHPIu7VlCc/q45YoJPX
	PptUB9pjEZvH/sk9XhdKCxJbmdyDh9soaZZpjtDXoBsRvWKz04NqhAWJ8ucM/RfrDjC4zyBVpVY
	bj0
X-Received: by 2002:adf:e001:0:10b0:46d:9871:1a44 with SMTP id ffacd0b85a97d-4775a0fcd6dmr9531248f8f.32.1783059963849;
        Thu, 02 Jul 2026 23:26:03 -0700 (PDT)
Message-ID: <b329e8d1-5f6b-445d-acbd-d60a2d644c1a@suse.com>
Date: Fri, 3 Jul 2026 08:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 for-4.22] x86/cpu-policy: set up host policy earlier
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
X-purgate-ID: tlsNG-c201ff/1783059964-15F0F2B8-52C46047/0/0
X-purgate-type: clean
X-purgate-size: 3274
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:from_mime,suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: DC7A76FF116

In order to use cpu_has_* expanding to host_cpu_policy.*, the host policy
needs setting up alongside boot_cpu_data.x86_capability[]. Arrange for
that towards the end of identify_cpu(). Then make sure .x86_capability[]
and host policy remain in sync when setup_{force,clear}_cpu_cap() are
used.

Rename the function now it's no longer static.

Fixes: 894bd7617924 ("x86/Intel: use host CPU policy for ARAT checking")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
This really was part of one of the XSTATE cleanup patches at the head of
the AMX series. This explains the specific placement ahead of the call to
xstate_init()). Likely anything from there downwards shouldn't really
live in identify_cpu() anyway.
---
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
@@ -92,6 +96,8 @@ void __init setup_force_cpu_cap(unsigned
 	}
 
 	__set_bit(cap, boot_cpu_data.x86_capability);
+
+	calculate_host_cpu_policy();
 }
 
 bool __init is_forced_cpu_cap(unsigned int cap)
@@ -586,6 +590,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
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

