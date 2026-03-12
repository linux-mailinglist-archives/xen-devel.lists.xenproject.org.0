Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHQNAe7vsmnAQwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:55:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F6B2760C9
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:55:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252755.1549319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jJO-0008Sw-BT; Thu, 12 Mar 2026 16:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252755.1549319; Thu, 12 Mar 2026 16:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jJO-0008Q6-87; Thu, 12 Mar 2026 16:55:02 +0000
Received: by outflank-mailman (input) for mailman id 1252755;
 Thu, 12 Mar 2026 16:55:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0jJN-0007oX-5H
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:55:01 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3469e879-1e34-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 17:54:59 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-439b9cf8cb5so1397636f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 09:54:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe2187aasm8766001f8f.30.2026.03.12.09.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 09:54:57 -0700 (PDT)
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
X-Inumbo-ID: 3469e879-1e34-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773334499; x=1773939299; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R5UX7rhqlDYYvqPxFRQg96W4qwOAL8dxcHZMY3uLDNc=;
        b=a7VUtB1184aqabHp4Dvm4UelGYdqdKthkAQxEm4OFy+hrAEU0VuE0ADfYvscDLVLzK
         A4gxMD/C/QVQfFYLm1dJ9lVjT+CGpmFLmo59VKohcWPLk2+OUnh3Sx8FmAWCKbWZEmIT
         nGKlp8NLHKZevqrlIbdsT86wnpMquJM7gWIyoItrEThgOPajAJqHKa+Fu2ai9WPdf6ES
         KLAQDHDIK2z5VIk2L5UWyRUYlF+aY/ydxlFB6MuJYCf9OiWG6iEDbgSjQDX5aK89vUoU
         LRry9HX7JRalhHxDXFHl50uQIiLRZAh8J/p6dc0AowaM9nLoe6Pjinrp2lEcwtWbtaQU
         NZ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334499; x=1773939299;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5UX7rhqlDYYvqPxFRQg96W4qwOAL8dxcHZMY3uLDNc=;
        b=lqIWjhbsNMvVDG8Sq8Z7dtXl/Lj9sO7b05jdF6IDAtH6fMoGwseGDLpB9Kc2Xyadop
         5WMTRzSwcam+TbQgBz9JdWdGAi793H62RwC4VMUDYeTUiGhy4vKcmPKKPGgAJqBv6RtB
         BHACIHErDXrG1zT+AEER7qnuykKirW/7IRkCeYJQ3oM5m5M6rmcq10Uq/z0d8oOGQ/GT
         GGIHcOHmkgA0jj0b8A78RH6NXjBYPeGb9QWPqx5B1Hwo5nH3kM/zU8ci8maJAFWr0CLR
         EjgFzoIkUw55SBIjNPrUtX8+86KAqs93U0cP5xQkFffyGIWxkYpdfcnCpzBWlCAd21vP
         SHuA==
X-Gm-Message-State: AOJu0YzDqNy+t9u8Sm9jWtwLop23zf8QF0nH14kXjgLv0SY+r0FH+diu
	TOvc2N2lFkzmP8LLlMe+N1vVMsDhmhvgEhyDPLWx3RAE5yrhDEEidAf/DsIdZSN1t5uiXOJhPGC
	2pe4=
X-Gm-Gg: ATEYQzyM13wVHweRjUb3Noo0GW0gFierL4CkLNpTuuVYPVt0figM2wQGLIVRCQARnG/
	t/AvnnTD9qmLx7njUm3d0aKT7mgks7qaWyjrQXogQ3PflwOx8+tINQ7k65mGXtbFZJ+LHYaeg71
	c2e2wNkjPW+ApDx+1MvF/OtA7WVwynxwitL3WuHPRHuaAztfCCROH+LLrt7kQd4evVEyF/okzDH
	LVKjISBe8DZ/xlTXStr4g9vIavQgonB7OJiQLmb1Rfb8VOmibrKYYWOv8/cY9R+owAdovoU1uvq
	1ILBUySmJyHR1biakhYjFys8+inQLkAr+kClN0coKpPo8ZlMXCM7eZ52LtaJtdsQMA3LxhSY8Fw
	KD4hnFojGCjK39q0Ar9Mg+JOpadgalHsObDlm7QGfKvzlOPd/hmyVHhsIQOlpzSEbH3hX1nRF2h
	HxGV0SDnWX+QUrG4um1kzBRprgv05+ZGHDIqG5uC+ia4w80+Lz2dN03mmUsvCKoTkuI4dQwPkdt
	oMSLlt39CJhxt4=
X-Received: by 2002:a05:6000:240e:b0:439:a95b:3c44 with SMTP id ffacd0b85a97d-43a04db618cmr685748f8f.30.1773334498673;
        Thu, 12 Mar 2026 09:54:58 -0700 (PDT)
Message-ID: <b906c3d5-5256-4ddf-9186-b52d8280e2ec@suse.com>
Date: Thu, 12 Mar 2026 17:54:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/9] x86/mwait-idle: clean up BYT/CHT auto demotion disable
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
X-Rspamd-Queue-Id: 67F6B2760C9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -104,7 +104,6 @@ struct idle_cpu {
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
@@ -1680,14 +1677,11 @@ static int __init mwait_idle_probe(void)
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
@@ -1700,12 +1694,24 @@ static void mwait_idle_cpu_tweak(unsigne
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
+	static bool first;
 	struct acpi_processor_power *dev = processor_powers[cpu];
 
 	switch (action) {
@@ -1784,7 +1790,8 @@ static int cf_check mwait_idle_cpu_init(
 		dev->count++;
 	}
 
-	mwait_idle_cpu_tweak(cpu);
+	mwait_idle_cpu_tweak(cpu, first);
+	first = false;
 
 	return NOTIFY_DONE;
 }
@@ -1821,7 +1828,7 @@ void mwait_idle_resume(void)
 	if (!icpu)
 		return;
 
-	mwait_idle_cpu_tweak(smp_processor_id());
+	mwait_idle_cpu_tweak(smp_processor_id(), true);
 }
 
 /* Helper function for HPET. */


