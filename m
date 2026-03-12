Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGYqBgrwsmlBRAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:55:38 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B027611A
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252764.1549328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jJn-0000Tw-Jv; Thu, 12 Mar 2026 16:55:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252764.1549328; Thu, 12 Mar 2026 16:55:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jJn-0000Ql-GH; Thu, 12 Mar 2026 16:55:27 +0000
Received: by outflank-mailman (input) for mailman id 1252764;
 Thu, 12 Mar 2026 16:55:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0jJm-0000EC-CS
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:55:26 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43f8a4e1-1e34-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 17:55:25 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439c56e822eso1282164f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 09:55:25 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe228986sm7866764f8f.35.2026.03.12.09.55.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 09:55:23 -0700 (PDT)
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
X-Inumbo-ID: 43f8a4e1-1e34-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773334525; x=1773939325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YORkC10FLOdP4ZPuyWf26dj7CDdAeRGQhEwwoPkwu48=;
        b=bwiC1ev88ZAmCC54nAdIPSUgd+azdNzx3ds6x8WyxKX3Ax7saCHi20rYp6kDb8/TrY
         hXt5zrd2ojJSutiB7v6exc/iyZeddbYmlr5kcSJCQl93n+lpEatj87+JBYkDhP13VIEb
         Cbv6GlnDpReFYpSeLxzcXcfRpgmgH0KIffll7H3onFFspzWXxuflKt2/tNIi1DuaRN9d
         VnlsScMo7N/CWpt2vjBL5VufYHd3GUIrU0IM4fRPZ5JIYTn41DspDJrYec367fprp8Or
         7i8nZJ173QcRCvuqAZ3/nNu4IA3un/hP7Sn9Fu0n3dv7/AOBCkZl6n5pW6flFg/4uD4s
         +MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334525; x=1773939325;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YORkC10FLOdP4ZPuyWf26dj7CDdAeRGQhEwwoPkwu48=;
        b=w2p3Nik7v6BlayR4kEtIeSQApfsLGHFB0jfvUVsfmWhgYKuqyAb09fBN0unLWt9ygT
         R1P7zLTuXYuuSOIVuE9TG1Wd8akPQCnlgl9HNuJ7GADJbARy1Z9wdL4vP6+2vyf1elTn
         1Q7CRceo1a8PJQ7NKV0SPFhrOJey4M1ND09OOTSCsv369tM7y3Fne94P3o4gN8Su2pOL
         VaR/NVBYKY0qDJHrL11UwKE2DzCFbkLb/PfcZNuiF9XY39hE/VVsgX+KFiCrt33dCcLE
         GFxg8RRdnexzlMcovIZUFgn95kUNhDE4VPRv/4kTRB7MHU0cBTFQb1lsvHqp38YtcK2u
         PmfQ==
X-Gm-Message-State: AOJu0YzoHnYEs0iLXBCsBBnbw946/UBqQvPCI9aDliRGzP+QCdlmz4s4
	GWuR1pQLOacPvrvAZsjGPGQpzilT7NcDqt0PZ/ktPtc/Fv4Sd1yjF0opzeUjzAd6qqOEJX+2+2Z
	lWa4=
X-Gm-Gg: ATEYQzxfgaNc6sK6VbBTGeP0E1ObaeNadbnMnHafZRXJGl0UkSvupVrnfgQHf0bGMiW
	B9dG2ocYER+FV9xmUXsYnJfphBbUHv/6KvwUDceOQ/2u/e6xreF0PeUe3PAbIe9D2DmP5/Lj/If
	Xn/xh8jdLuDaigSIiOa8H5VX51+a6jbJ7wFaQPY/JNuCJZhd8lTtotN717VhkCZVqp945RaNut/
	HFYwThBh0tHEk8kKUvCBNNAwDiPZlqKydXaeMZxkxp9o5piJoTV8sLxgCWHOG0Sw44wVjcOo6af
	uwpPF8SAHJksyhIWAe3TJXbRhVgCuSNqEshCjPiRSqMbCPzTHSpz7WUw9o3fV/NoSrKHh4XJvGR
	7vVw92mgrOH4po1W6FOnU30+DAfrxPcM4NnXAvHDjZDymCbZbJVBltOpJT9wwsiKvE41nuQHbrj
	pyAeA89nNeJkJlXJPI34nCN2/N/DgH8fTxAqQqH7By6NeRFSq5NKwQxpsNh7D0OqBGHyUnjT96i
	CRU+cnQ6iq2fAoxHP0wYPqaDg==
X-Received: by 2002:a05:6000:178b:b0:439:b7c9:2edc with SMTP id ffacd0b85a97d-43a04dc0b96mr751381f8f.48.1773334524773;
        Thu, 12 Mar 2026 09:55:24 -0700 (PDT)
Message-ID: <5d12d537-7c6b-4730-b963-a4a9e13a7413@suse.com>
Date: Thu, 12 Mar 2026 17:55:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/9] x86/mwait-idle: latch struct idle_cpu contents
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
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
In-Reply-To: <7b7a677e-a5b9-42c8-beec-3c506b4eac52@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-1.19 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[jbeulich@suse.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7A2B027611A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Rather than storing a pointer (and needing to keep all struct instances in
memory post-init), and rather than (like the Linux counterpart has it)
keeping individual variables, simply copy the respective structure
instance. By implication, subsequent updates now need doing to the copy.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -107,14 +107,14 @@ struct idle_cpu {
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
@@ -1647,7 +1646,7 @@ static int __init mwait_idle_probe(void)
 		const char *ss;
 
 		do {
-			const struct cpuidle_state *state = icpu->state_table;
+			const struct cpuidle_state *state = idle_cpu->state_table;
 			unsigned int bit = 1;
 
 			ss = strchr(str, ',');
@@ -1679,10 +1678,10 @@ static int __init mwait_idle_probe(void)
 
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
@@ -1735,11 +1734,11 @@ static int cf_check mwait_idle_cpu_init(
 
 	dev->count = 1;
 
-	for (cstate = 0; cpuidle_state_table[cstate].target_residency; ++cstate) {
+	for (cstate = 0; icpu.state_table[cstate].target_residency; ++cstate) {
 		unsigned int num_substates, hint, state;
 		struct acpi_processor_cx *cx;
 
-		hint = flg2MWAIT(cpuidle_state_table[cstate].flags);
+		hint = flg2MWAIT(icpu.state_table[cstate].flags);
 		state = MWAIT_HINT2CSTATE(hint) + 1;
 
 		if (state > max_cstate) {
@@ -1755,10 +1754,10 @@ static int cf_check mwait_idle_cpu_init(
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
 
@@ -1776,15 +1775,15 @@ static int cf_check mwait_idle_cpu_init(
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
@@ -1825,7 +1824,7 @@ int __init mwait_idle_init(struct notifi
 
 void mwait_idle_resume(void)
 {
-	if (!icpu)
+	if (!icpu.state_table)
 		return;
 
 	mwait_idle_cpu_tweak(smp_processor_id(), true);


