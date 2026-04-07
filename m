Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLs7FGmo1GmkwAcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:47:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B05B13AA719
	for <lists+xen-devel@lfdr.de>; Tue, 07 Apr 2026 08:47:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1274476.1560579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA0Cs-0008N5-8n; Tue, 07 Apr 2026 06:46:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1274476.1560579; Tue, 07 Apr 2026 06:46:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wA0Cs-0008Lc-5Y; Tue, 07 Apr 2026 06:46:38 +0000
Received: by outflank-mailman (input) for mailman id 1274476;
 Tue, 07 Apr 2026 06:46:37 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wA0Cq-0008LD-TH
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 06:46:37 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wA0Cp-0043PZ-QC
 for xen-devel@lists.xenproject.org; Tue, 07 Apr 2026 08:46:35 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 69d4a837-2eae-0a2a0a5409dd-0a2a45038568-48
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:46:35 +0200
Received: from [209.85.128.53] (helo=mail-wm1-f53.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <jbeulich@suse.com>)
 id 69d4a84b-02b3-0a2a45030019-d1558035b54a-3
 for <xen-devel@lists.xenproject.org>; Tue, 07 Apr 2026 08:46:35 +0200
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-488b150559bso12177915e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 Apr 2026 23:46:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488b6ff70bcsm185497615e9.14.2026.04.06.23.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2026 23:46:34 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Subject:From:Cc:To:Content-Language:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1775544395; x=1776149195; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaxfKa6gBRWbn+idURq+P+8t8PRpQz10PVpiC6aYltc=;
        b=bKCcSi+kx1j1DpKKeXc6Biw33JKo+hqtFYj0ZP1Ud62i9Eg/kI5sAvd4ahNqXjZUQq
         NAHixxNHTwClT1Qzgi4+trgxo8ZJX02HnNMYJ3vj3STnoXG0L9c6WZ5thXRU1TyXlppm
         FrNoBMyYZyGowFuHErFAlZt/SBA+RL35glzACgFNuQ3ZlKVs0OmhRWM01V1s3FgW+1Fj
         s0US53YwbfEsqtnI4TxMWqEW43NiOH5Ba2d+6M9j0bgoeh0W3fdlbcZuRnS/AZhZE9/N
         UtFX7yKfEqFJsmzKEJvg95xSLKKL47ZK/SZ5CfylnXxCpKCrFoQyuhB283me2q3Ls+ol
         pNmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775544395; x=1776149195;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AaxfKa6gBRWbn+idURq+P+8t8PRpQz10PVpiC6aYltc=;
        b=cW+i0HtcrAteLc/stc9vsrtLBHErh+yBUBF1/+KWd94+GPmmIlGUi3KiZ3UgWUovH8
         UgSxEuPJbyVUQTrHtl0HBWbZ2d94NJF12Ri07KPC8lLp2Js6ZAjJTrOM0Xm/Ne5BKegy
         rZIiSt4v3zDcDqWd3SEldTbsCs28YvWzbsCXmfRANgQBbFVAIwB3HPAtzs2yEIzbRpbw
         kmO0Q4xs1WXR5WM4vkuXhsJ0xvLB9Jf/aij+6iUDpQieNZJ6htGd5k6doed7hIbaIOG9
         2JGowo+glvsX1RIkKthmrMxOkb0N6YfIBQzoxyewNflIQ/KSjRxfZ6/sH/sfcY4e3oRf
         5Ubw==
X-Gm-Message-State: AOJu0YxEaFWljdmnFUji/GWd47ABkuc0h/yAk8VYsKFOWxfiFv6ql1Nk
	0ET+jg6o5Z2akHsqQOwdvhHdC+dL6/+gJFKlrgBcKeQn0YtVwbqBsiLtIVQIOzXCs55WgXJZCBa
	VAslgCQ==
X-Gm-Gg: AeBDievlzkQwO2tg9D9ukGSe2kMWI2PndLVDOiDACaajDgh+/YfinrtAzZ/Bp3p7k16
	m0CVRnwmeHeobzuree7wFxUOlQ74d3Pc1kVYAk6gFjS2MPN/DW4oKEKfN0X9FnojdYo3uy4srNw
	5owie1XZsVNUR0y3gMA8PGCuavL/U1Kd4sTAWlAlRKPJ5rY9E4mFbRjKTA2c8yzB7ZIXuVny9U+
	dNGp7PAiySz2l++ktrjUlfMTrmXwv90MtHA9SQ6swhh02aCjj6PdnQst3IXiP6p+bNzX835F6AN
	MrVzKhccZlzSMfOuIHwIieXVeTKw6sNUpJkniDu8zPi0K1SpDzElFqfNB6JYGft07xbUZiYqRqU
	wGfEQLU+gVIsU3qGRE3tGLMRrvBCe41rGBtYs3TVMJYKwXB8QsmLj7WfTZMmNHFU9zyRxWmLGKZ
	L1vowjfEQG/carearvJB/uedrs4bf6wW1j97maUBjcetN7VxI27Owoh6jhEib633bAYZuS3Ith3
	Y12tIL6/6iHmYjJwAdpWW/zWw==
X-Received: by 2002:a05:600c:3544:b0:485:303b:c50a with SMTP id 5b1f17b1804b1-488997352d3mr213101345e9.13.1775544395090;
        Mon, 06 Apr 2026 23:46:35 -0700 (PDT)
Message-ID: <6dccae5f-fe09-4f35-9e4a-7a38fb21e8d1@suse.com>
Date: Tue, 7 Apr 2026 08:46:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/cpu-policy: set up host policy earlier
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
X-purgate-ID: tlsNG-33051d/1775544395-47B2BC9A-AF9FE16B/0/0
X-purgate-type: clean
X-purgate-size: 2089
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:email,suse.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B05B13AA719
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

In order to use cpu_has_* expanding to host_cpu_policy.*, the host policy
needs setting up alongside boot_cpu_data.x86_capability[]. Arrange for
that towards the end of identify_cpu().

Fixes: 894bd7617924 ("x86/Intel: use host CPU policy for ARAT checking")
Reported-by: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
In the longer run we may need to (also) update the host policy from
setup_{force,clear}_cpu_cap().

This really was part of one of the XSTATE cleanup patches at the head of
the AMX series. This explains the specific placement ahead of the call to
xstate_init()). Likely anything from there downwards shouldn't really
live in identify_cpu() anyway.

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -586,6 +586,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	}
 
 	/* Now the feature flags better reflect actual CPU features! */
+	if (c == &boot_cpu_data)
+		calculate_host_policy();
 
 	xstate_init(c);
 
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -359,7 +359,7 @@ void calculate_raw_cpu_policy(void)
     /* Was already added by probe_cpuid_faulting() */
 }
 
-static void __init calculate_host_policy(void)
+void __init calculate_host_policy(void)
 {
     struct cpu_policy *p = &host_cpu_policy;
     unsigned int max_extd_leaf;
@@ -904,6 +904,7 @@ static void __init calculate_hvm_def_pol
 
 void __init init_guest_cpu_policies(void)
 {
+    /* Do this a 2nd time to account for setup_{clear,force}_cpu_cap() uses. */
     calculate_host_policy();
 
     if ( IS_ENABLED(CONFIG_PV) )
--- a/xen/arch/x86/include/asm/cpu-policy.h
+++ b/xen/arch/x86/include/asm/cpu-policy.h
@@ -30,4 +30,10 @@ void recalculate_cpuid_policy(struct dom
  */
 void calculate_raw_cpu_policy(void);
 
+/*
+ * Collect the host CPU policy.  Called after collecting enough CPUID output,
+ * and again after all feature overrides have been put in place.
+ */
+void calculate_host_policy(void);
+
 #endif /* X86_CPU_POLICY_H */

