Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SDoABQpJA2pU2wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:36:42 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA7C523C95
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:36:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307004.1578741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMp9s-0003nf-N7; Tue, 12 May 2026 15:36:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307004.1578741; Tue, 12 May 2026 15:36:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMp9s-0003lc-Jb; Tue, 12 May 2026 15:36:32 +0000
Received: by outflank-mailman (input) for mailman id 1307004;
 Tue, 12 May 2026 15:36:30 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMp9q-0003lF-NC
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:36:30 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMp9q-00AQbz-47
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:36:30 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0348fa-bab6-0a2a0a5309dd-0a2a4501acb2-8
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:36:30 +0200
Received: from [209.85.128.50] (helo=mail-wm1-f50.google.com)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0348fd-c1f2-0a2a45010019-d1558032d188-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:36:30 +0200
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48d146705b4so69766415e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:36:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d15e09sm5644885e9.3.2026.05.12.08.36.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:36:29 -0700 (PDT)
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
        d=suse.com; s=google; t=1778600189; x=1779204989; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+p/Ij2CgQ3Fd9f/uexuTOqD95AbabIMcKqaBQDpzCqU=;
        b=KvNEsXF1uAgYhkqcMYcyThaf1izdepbk4naGvQxLb57cyuU9sm5dDY8RTnLU9Dw/zP
         xT7Nma28BGCWIO1Qv/T6GtARH6RuSNGOVy3Wlz9dwvtPSReMVENN/zJWFDwVGreQ48+6
         3GclYMYPU7QYRdu5ToKu85OsEWZgW/L0cAazVr1XzX6NzwuTY7OdaBjU6c+vGJdBlli3
         TtZqyXCGp7ctxCowTqPRiDTCT4cG8cXdDwZ+e+/MshQh/vgpctjBkPSiceonrw9zxrpW
         bB8VyAgdOybuheHfT6TNjgEQzQoYfV86pQmssW8gAv9fB2aGHF7IWuAqsz99NIw1XtTd
         POlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600189; x=1779204989;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+p/Ij2CgQ3Fd9f/uexuTOqD95AbabIMcKqaBQDpzCqU=;
        b=dVxXUvM5X8x/dMNFXVV9P8Zah6TSWhd1NtWGMdgUcS2Yl02AXrl7RlW491AIYypSQz
         xi1E9XSQV7sgCS75H4LeMNpd5gQuQ4OmiozG922gNwVVzm+wtQl6vW3LRFhvQUU7LJww
         qm2PluVgw0JhqC5GKvMYHVDOH5bCmPvxqNHtZR2kwuJn0BYlB/EXtRYNSVu3LM7S94By
         wxgPvYL0qFIk3bcf7WJZgE9Y9NNNfGd81rd26G6Q+gyElI4YtuAl9vfAzMNVgdaRchRt
         254vGkIaeHxaxLayTQYWkQdIy0XneSDVL3Dg43b7lw8My5o5rdauBfDyH8RiqFt29YVy
         S/Sw==
X-Gm-Message-State: AOJu0YzOzC65rb1ScutTyfBT9xm2xqKwQp0Ag0Kca3vYD5WmZfWsBH2p
	d5hMJTHO9mBKXY3a0Jb+lICKngdJvyY7HwvHLiSFo+Va3AUbsvuSUOYo/Sly/1MnqjhQhiQWW1g
	cAno=
X-Gm-Gg: Acq92OF6pDSVNM4JNsUzhA8JFpTDRuzw5s8J7MlLb/nFf4uRsdzLv0zLbqdAeqUsIjS
	Pvk1oMsQg6nN+x2RZd5Etg6rDOBiOKffJCdmXFpGnt3zl/hBthZMLcFBUpqOCocFC3us1SfPEtH
	+AMItInbLDf2jWq2peRHkxpulUYOOmsdQA4YTL48jq1SIfpxEt4YtAb5Ifj5tIX8jiwOrkzxsq8
	T7hWX+JA5hn2y+NbLjqUttHe1stpCFUDtzGuz4LsvXx7psSyRyhoy3CH67KqfzsxRF88Zkkyrje
	bBdhQjSyXiMnV2Ss1dYc1elf0JnjCqxhzC7VvFuFRF8Mc5U/96ilHMQezMu5h6UojisS+ClU0Qk
	6KcnGZFxIR8hLB4pWAeyhOUDdWX059uRdSnCIRz/2GSoY58DQ5ZbqZKr/UQaOJO2EmarR2pBY4Y
	ope6ShIYQ39bDgC6I66Una+saOwJiuzMcU328ds0Dj5kNopC4kP8dXdA1O6ukRaJma7egVRLmSc
	+FiPWr23eHFqDNWh4l2rII5IA==
X-Received: by 2002:a05:600c:3e0e:b0:48a:52f2:a0f1 with SMTP id 5b1f17b1804b1-48e8fe73355mr58352175e9.18.1778600189596;
        Tue, 12 May 2026 08:36:29 -0700 (PDT)
Message-ID: <696b4fe5-d8a5-4768-9b24-5c2d2975e686@suse.com>
Date: Tue, 12 May 2026 17:36:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22 v2 3/8] x86/mwait-idle: latch struct idle_cpu
 contents
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
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d62444/1778600190-B695FFF4-1EE8C1D0/0/0
X-purgate-type: clean
X-purgate-size: 5850
X-Rspamd-Queue-Id: 7EA7C523C95
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim];
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

Rather than storing a pointer (and needing to keep all struct instances in
memory post-init), and rather than (like the Linux counterpart has it)
keeping individual variables, simply copy the respective structure
instance. By implication, subsequent updates now need doing to the copy.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Roger Pau Monné <roger.pau@citrix.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -106,14 +106,14 @@ struct idle_cpu {
 	enum c1e_promotion c1e_promotion;
 };
 
-static const struct idle_cpu *__ro_after_init icpu;
+static struct idle_cpu __ro_after_init icpu;
 
-static const struct cpuidle_state {
+struct cpuidle_state {
 	char		name[16];
 	unsigned int	flags;
 	unsigned int	exit_latency; /* in US */
 	unsigned int	target_residency; /* in US */
-} *__ro_after_init cpuidle_state_table;
+};
 
 #define CPUIDLE_FLAG_DISABLED		0x1
 /*
@@ -1097,7 +1097,7 @@ static void cf_check mwait_idle(void)
 	 * leave_mm() to avoid costly and often unnecessary wakeups
 	 * for flushing the user TLB's associated with the active mm.
 	 */
-	if (cpuidle_state_table[].flags & CPUIDLE_FLAG_TLB_FLUSHED)
+	if (icpu.state_table[].flags & CPUIDLE_FLAG_TLB_FLUSHED)
 		leave_mm(cpu);
 #endif
 
@@ -1139,7 +1139,7 @@ static void cf_check auto_demotion_disab
 	u64 msr_bits;
 
 	rdmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr_bits);
-	msr_bits &= ~(icpu->auto_demotion_disable_flags);
+	msr_bits &= ~icpu.auto_demotion_disable_flags;
 	wrmsrl(MSR_PKG_CST_CONFIG_CONTROL, msr_bits);
 }
 
@@ -1371,10 +1371,10 @@ static void __init ivt_idle_state_table_
 		/* 1 and 2 socket systems use default ivt_cstates */
 		break;
 	case 2: case 3:
-		cpuidle_state_table = ivt_cstates_4s;
+		icpu.state_table = ivt_cstates_4s;
 		break;
 	default:
-		cpuidle_state_table = ivt_cstates_8s;
+		icpu.state_table = ivt_cstates_8s;
 		break;
 	}
 }
@@ -1525,14 +1525,12 @@ static void __init adl_idle_state_table_
 		adl_l_cstates[1].flags |= CPUIDLE_FLAG_DISABLED;
 
 		/* Disable C1E by clearing the "C1E promotion" bit. */
-		idle_cpu_adl.c1e_promotion = C1E_PROMOTION_DISABLE;
-		idle_cpu_adl_l.c1e_promotion = C1E_PROMOTION_DISABLE;
+		icpu.c1e_promotion = C1E_PROMOTION_DISABLE;
 		return;
 	}
 
 	/* Make sure C1E is enabled by default */
-	idle_cpu_adl.c1e_promotion = C1E_PROMOTION_ENABLE;
-	idle_cpu_adl_l.c1e_promotion = C1E_PROMOTION_ENABLE;
+	icpu.c1e_promotion = C1E_PROMOTION_ENABLE;
 }
 
 /*
@@ -1593,6 +1591,7 @@ static int __init mwait_idle_probe(void)
 {
 	unsigned int eax, ebx, ecx;
 	const struct x86_cpu_id *id;
+	const struct idle_cpu *idle_cpu;
 	const char *str;
 
 	if (boot_cpu_data.vendor != X86_VENDOR_INTEL)
@@ -1627,8 +1626,8 @@ static int __init mwait_idle_probe(void)
 
 	pr_debug(PREFIX "MWAIT substates: %#x\n", mwait_substates);
 
-	icpu = id->driver_data;
-	cpuidle_state_table = icpu->state_table;
+	idle_cpu = id->driver_data;
+	icpu = *idle_cpu;
 
 	if (boot_cpu_has(X86_FEATURE_XEN_ARAT))
 		lapic_timer_reliable_states = LAPIC_TIMER_ALWAYS_RELIABLE;
@@ -1644,7 +1643,7 @@ static int __init mwait_idle_probe(void)
 		const char *ss;
 
 		do {
-			const struct cpuidle_state *state = icpu->state_table;
+			const struct cpuidle_state *state = idle_cpu->state_table;
 			unsigned int bit = 1;
 
 			ss = strchr(str, ',');
@@ -1676,10 +1675,10 @@ static int __init mwait_idle_probe(void)
 
 static void mwait_idle_cpu_tweak(unsigned int cpu, bool bsp)
 {
-	if (icpu->auto_demotion_disable_flags)
+	if (icpu.auto_demotion_disable_flags)
 		on_selected_cpus(cpumask_of(cpu), auto_demotion_disable, NULL, 1);
 
-	switch (icpu->c1e_promotion) {
+	switch (icpu.c1e_promotion) {
 	case C1E_PROMOTION_DISABLE:
 		on_selected_cpus(cpumask_of(cpu), c1e_promotion_disable, NULL, 1);
 		break;
@@ -1732,11 +1731,11 @@ static int cf_check mwait_idle_cpu_init(
 
 	dev->count = 1;
 
-	for (cstate = 0; cpuidle_state_table[cstate].target_residency; ++cstate) {
+	for (cstate = 0; icpu.state_table[cstate].target_residency; ++cstate) {
 		unsigned int num_substates, hint, state;
 		struct acpi_processor_cx *cx;
 
-		hint = flg2MWAIT(cpuidle_state_table[cstate].flags);
+		hint = flg2MWAIT(icpu.state_table[cstate].flags);
 		state = MWAIT_HINT2CSTATE(hint) + 1;
 
 		if (state > max_cstate()) {
@@ -1752,10 +1751,10 @@ static int cf_check mwait_idle_cpu_init(
 			continue;
 
 		/* if state marked as disabled, skip it */
-		if (cpuidle_state_table[cstate].flags &
+		if (icpu.state_table[cstate].flags &
 		    CPUIDLE_FLAG_DISABLED) {
 			printk(XENLOG_DEBUG PREFIX "state %s is disabled\n",
-			       cpuidle_state_table[cstate].name);
+			       icpu.state_table[cstate].name);
 			continue;
 		}
 
@@ -1773,15 +1772,15 @@ static int cf_check mwait_idle_cpu_init(
 		cx->type = state;
 		cx->address = hint;
 		cx->entry_method = ACPI_CSTATE_EM_FFH;
-		cx->latency = cpuidle_state_table[cstate].exit_latency;
+		cx->latency = icpu.state_table[cstate].exit_latency;
 		cx->target_residency =
-			cpuidle_state_table[cstate].target_residency;
-		if ((cpuidle_state_table[cstate].flags &
+			icpu.state_table[cstate].target_residency;
+		if ((icpu.state_table[cstate].flags &
 		     CPUIDLE_FLAG_IRQ_ENABLE) &&
 		    /* cstate_restore_tsc() needs to be a no-op */
 		    boot_cpu_has(X86_FEATURE_NONSTOP_TSC))
 			cx->irq_enable_early = true;
-		if (cpuidle_state_table[cstate].flags & CPUIDLE_FLAG_IBRS)
+		if (icpu.state_table[cstate].flags & CPUIDLE_FLAG_IBRS)
 			cx->ibrs_disable = true;
 
 		dev->count++;
@@ -1822,7 +1821,7 @@ int __init mwait_idle_init(struct notifi
 
 void mwait_idle_resume(void)
 {
-	if (!icpu)
+	if (!icpu.state_table)
 		return;
 
 	mwait_idle_cpu_tweak(smp_processor_id(), true);


