Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJF/LfFIA2pU2wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:36:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B743523C6C
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:36:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306999.1578731 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMp9W-0003OT-F9; Tue, 12 May 2026 15:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306999.1578731; Tue, 12 May 2026 15:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMp9W-0003NV-CJ; Tue, 12 May 2026 15:36:10 +0000
Received: by outflank-mailman (input) for mailman id 1306999;
 Tue, 12 May 2026 15:36:08 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMp9U-0003NH-QH
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:36:08 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMp9U-00AQXI-6u
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:36:08 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0348dc-bab6-0a2a0a5309dd-0a2a4503a70c-40
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:36:08 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0348e8-672d-0a2a45030019-d1558032c526-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:36:08 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-488af9fdaa7so32813645e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:36:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f410558sm41030815e9.5.2026.05.12.08.36.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:36:07 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:In-Reply-To:Autocrypt:Content-Language:References:Cc:To:From:Subject:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778600167; x=1779204967; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9ZzX9y9DzM/pf6lRtwdmKQ1uBuLJ5k1HbTo5s1srMNQ=;
        b=O5yNjw6fI55+fKspXzZ/e+w7J1NmeGG8U48oFiwJSM6Caejs5QX4IN/qWtOLdQSbBa
         5ROnXXrVgMzrqUl9TWEsmwADvA44QZr16xQCuFgYqXH6wkm8qUHLhPV6G/T/KjCgezw7
         Acm6TC2CuOH7WAKMbhPLkdd8xmgYBt/w4R1ktKX76yDOHDkoFewTREcqxgvXGGDKBque
         0irBF2D+Dt4Vwoz+0xrMFL/GQvcOPCLeeseEM9O4+lb3xRl33tjMYI/amKzmJDMkKh17
         yPaBiIlkE0CJvhWp5Y6BzSl3i7YlMO7YMP27xCim3m1O9DcB+TodBHLoxc07Nc1OZFMA
         ELlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600167; x=1779204967;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZzX9y9DzM/pf6lRtwdmKQ1uBuLJ5k1HbTo5s1srMNQ=;
        b=ZYZXXT3hfMhYbKgL8LdTQArA6jUnOcmgc33QFfBvV2dp7qCjNkoVWpLJnW1dB2NXec
         r0wElmH9bKcIfaPbJh8CW34X9r8uQWXp41DuuDgrWbGLd0rBSm540E9ISZk/decqsuij
         jKUEzRS6vbftJUkaCjCR6RhRXwz75ahe9mkcgvifGXq+SzcxmU0ejb6/IT5wrj7E6J92
         jYA8tPoyLRyPtnImvlPHIVRdISkqET7vNrJeWhMVW6Ogjj00OuaMg/sdvfGiUnb8jjmV
         VxcvoiQHly6eBskQE5zscXmuv8ZJKp86rihpBcUZoAWwlTkkVUg8/LVGDRBtIJ3ed5hs
         8x8Q==
X-Gm-Message-State: AOJu0Yx78e7x68lknRzLHQ/MuSSyIW9nonEf65N+UUuh98cFeFKPVmrO
	95KQGsSvDhNkcDu6IM9jOpUAPqlQOBKwPBKlKTdYrsx3f4YCpZd6jxGbkEoM+RURtID8b4HRTZL
	Vzcw=
X-Gm-Gg: Acq92OHEii2EF9xfHLw3m5hHD0zQFl1Co9ATmHvYK4cmn0fRZMh07Q2DK2XL0Wx30jD
	Mbnrlv2ujerRAaIWqMh1U0WtwNjpNZ8h0reGRJsjCMuHK3WqM11M+fom4TJiDgTA8h/M6/D4NdO
	4XTjzWiytd6xmvgeFNSDeoXMjvTc+kRHuhcg4jvOEZR3IDCJap4czdgkR3VjHk30CihkiKA0W+U
	A/mwcVRrSKzW3DHcQJtcCiAG9AMHiLJSrBTcr968ah/wLKe76Lhfss0MJARmKokw4VzP2ldoN4f
	mRVUqUZiuLokYvPo/RPvfuQ8VvVhuSv/B7tZwcWdmWglhc7neouLU6TjknobSqHMiqk2juhlma8
	Qx23rj/eS/TBdOznuHkuHRf4uxAvagVL84SkWztD2nm0apXB3wrdqdZifxXUn4zyv8UU7xIirer
	fQhfcg4HYAh1t9NgROCXACy5Ir+kDl//a6AWE5oTsYFLQN/eu2OtRh5ZCkBGc5jOs8+zJGuXmAn
	zo/PoLZAJt47VQ=
X-Received: by 2002:a05:600c:3e88:b0:48a:55d8:7882 with SMTP id 5b1f17b1804b1-48e8fe5494bmr53983685e9.9.1778600167550;
        Tue, 12 May 2026 08:36:07 -0700 (PDT)
Message-ID: <aa14f45e-44fa-4cfc-8c51-d48548d55f3a@suse.com>
Date: Tue, 12 May 2026 17:36:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22 v2 2/8] x86/mwait-idle: clean up BYT/CHT auto
 demotion disable
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
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
In-Reply-To: <178739fe-fa41-4ff7-b16e-67c4b2a99b38@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-33051d/1778600168-3B96D938-1DFE7A89/0/0
X-purgate-type: clean
X-purgate-size: 3850
X-Rspamd-Queue-Id: 2B743523C6C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,suse.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Bay Trail (BYT) and Cherry Trail (CHT) platforms have a very specific way
of disabling auto-demotion via specific MSR bits. Clean up the code so that
BYT/CHT-specifics do not show up in the common 'struct idle_cpu' data
structure.

Remove the 'byt_auto_demotion_disable_flag' flag from 'struct idle_cpu',
because a better coding pattern is to avoid very case-specific fields like
'bool byt_auto_demotion_disable_flag' in a common data structure, which is
used for all platforms, not only BYT/CHT. The code is just more readable
when common data structures contain only commonly used fields.

Instead, match BYT/CHT in the 'intel_idle_init_cstates_icpu()' function,
and introduce a small helper to take care of BYT/CHT auto-demotion. This
is consistent with how platform-specific things are done for other
platforms.

No intended functional changes.

Inspired by (and description largely taken from) Linux'es c93d13b661a6
("intel_idle: clean up BYT/CHT auto demotion disable").

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Init "first" to "true" in mwait_idle_cpu_init().

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -103,7 +103,6 @@ struct idle_cpu {
 	 * Indicate which enable bits to clear here.
 	 */
 	unsigned long auto_demotion_disable_flags;
-	bool byt_auto_demotion_disable_flag;
 	enum c1e_promotion c1e_promotion;
 };
 
@@ -1144,7 +1143,7 @@ static void cf_check auto_demotion_disab
 	wrmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr_bits);
 }
 
-static void cf_check byt_auto_demotion_disable(void *dummy)
+static void byt_cht_auto_demotion_disable(void)
 {
 	wrmsrl(MSR_CC6_DEMOTION_POLICY_CONFIG, 0);
 	wrmsrl(MSR_MC6_DEMOTION_POLICY_CONFIG, 0);
@@ -1195,13 +1194,11 @@ static const struct idle_cpu idle_cpu_sn
 static const struct idle_cpu idle_cpu_byt = {
 	.state_table = byt_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
-	.byt_auto_demotion_disable_flag = true,
 };
 
 static const struct idle_cpu idle_cpu_cht = {
 	.state_table = cht_cstates,
 	.c1e_promotion = C1E_PROMOTION_DISABLE,
-	.byt_auto_demotion_disable_flag = true,
 };
 
 static const struct idle_cpu idle_cpu_ivb = {
@@ -1677,14 +1674,11 @@ static int __init mwait_idle_probe(void)
 	return 0;
 }
 
-static void mwait_idle_cpu_tweak(unsigned int cpu)
+static void mwait_idle_cpu_tweak(unsigned int cpu, bool bsp)
 {
 	if (icpu->auto_demotion_disable_flags)
 		on_selected_cpus(cpumask_of(cpu), auto_demotion_disable, NULL, 1);
 
-	if (icpu->byt_auto_demotion_disable_flag)
-		on_selected_cpus(cpumask_of(cpu), byt_auto_demotion_disable, NULL, 1);
-
 	switch (icpu->c1e_promotion) {
 	case C1E_PROMOTION_DISABLE:
 		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
@@ -1697,12 +1691,24 @@ static void mwait_idle_cpu_tweak(unsigne
 	case C1E_PROMOTION_PRESERVE:
 		break;
 	}
+
+	/* Pkg-scope MSRs on 1-socket-only systems need writing only once. */
+	if (!bsp)
+		return;
+
+	switch (boot_cpu_data.vfm) {
+	case INTEL_ATOM_SILVERMONT:
+	case INTEL_ATOM_AIRMONT:
+		byt_cht_auto_demotion_disable();
+		break;
+	}
 }
 
 static int cf_check mwait_idle_cpu_init(
     struct notifier_block *nfb, unsigned long action, void *hcpu)
 {
 	unsigned int cpu = (unsigned long)hcpu, cstate;
+	static bool first = true;
 	struct acpi_processor_power *dev = processor_powers[cpu];
 
 	switch (action) {
@@ -1781,7 +1787,8 @@ static int cf_check mwait_idle_cpu_init(
 		dev->count++;
 	}
 
-	mwait_idle_cpu_tweak(cpu);
+	mwait_idle_cpu_tweak(cpu, first);
+	first = false;
 
 	return NOTIFY_DONE;
 }
@@ -1818,7 +1825,7 @@ void mwait_idle_resume(void)
 	if (!icpu)
 		return;
 
-	mwait_idle_cpu_tweak(smp_processor_id());
+	mwait_idle_cpu_tweak(smp_processor_id(), true);
 }
 
 /* Helper function for HPET. */


