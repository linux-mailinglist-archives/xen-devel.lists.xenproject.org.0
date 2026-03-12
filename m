Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBkzIcjwsmlaRAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:58:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F41927630F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252815.1549373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jMs-0003Ca-14; Thu, 12 Mar 2026 16:58:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252815.1549373; Thu, 12 Mar 2026 16:58:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jMr-0003At-Tg; Thu, 12 Mar 2026 16:58:37 +0000
Received: by outflank-mailman (input) for mailman id 1252815;
 Thu, 12 Mar 2026 16:58:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0jLH-0000EC-Dk
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:56:59 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b72d5c6-1e34-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 17:56:58 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-439bcec8613so1030894f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 09:56:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fe22529csm9002078f8f.31.2026.03.12.09.56.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 09:56:56 -0700 (PDT)
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
X-Inumbo-ID: 7b72d5c6-1e34-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773334618; x=1773939418; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4O5ib0lx1V0XU83S5mr85hWtGtQTwPLl/vPSyc15n5c=;
        b=fL1NxqKmO58LBqrG7Lzs744fEAmR/LX8aG1J2QpcX0+9R/fwwhWl4pkbBLQoCc/WQI
         ZZL98FRev1asaKcToPiRLC/FPRumF4KK86cu7zKtA8w7ioYagfdMCPW6FhJO7aZ1Cb1B
         9DxAnZTZgLOvx7i0JynvicsfcgsjNzGSDksUF68qfd7LY/i1M4QMyOfB++hdXXTI9g0x
         Oib4xiur/evG7M2/CVV7q+9Vphtw6UBNPhRVPW8gAuawrlAKPUjODRYVkEGueT7v5dZ+
         XN+fi2Qh8b2O93azIYNeq/YW160HmGNkwZ/woLu2yAD1d85BYdoCLXG5cRgbPQczDYXV
         Gn1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334618; x=1773939418;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4O5ib0lx1V0XU83S5mr85hWtGtQTwPLl/vPSyc15n5c=;
        b=w1j3fIcysj3ej/frRYNibT3G7VB3n1CXZCVY2J8BrpiRQOoVTuw/vC+am40ujCRpne
         SHnB9cwmFaXUl3GZOOtnwV7ROP/OinoEb+JJoLA2V2d6kZR6/xk5E7CdfUOXnF2gSg0y
         5iZVVeoGdpeSY1zuOAsj49BQIOb/MJu0AOAf5FN4c6LyCaGplmQJCweWUgXjAFAnyvZP
         wrlIOZ5lM7NV1tj0eapjmm2ljc17HrWU8XD6FD4jHI9sryvOeiIETjw6+JqS958yYj9e
         RWS6x3EjRmvInRpwgbWjHVqwixVAOdjdZ6P56V/OCKkDCxUEEYLvGFPdS6oZ8CEXc7TY
         UNrA==
X-Gm-Message-State: AOJu0YzgySWnPd17+LMcA8AvrnbRNmSgqYZJVkt35Zao3x5lqQmWovc3
	c28CmQk5VbtCEGfwuUoKuIzAU8qagOiIDB+yRUCnMTGzkNxGNm2CQ9mZJBvseD1pYODhKpgxD8D
	QxL0=
X-Gm-Gg: ATEYQzyuk+UJcIY1nf5TOfucFAW2OWimIRPQoCNk77Z5CqmBsOz2k+8FjMr/wusDpgN
	UFhAbRf8RtXUHMkI+LNZlpIMi7e9076wewoPFR1c0tRfJZLeD/bI1+CPDeNbhiI3oRCF886r3ys
	VHb3/rpo1G3yrgwIAl+6u6FvHunyzbVRxyxo+aEJUx4oQQ7ZM3QwESJRXXQApfIMPdnFBzLY6CX
	wbwSqfHn7N91ox64w7aVJTkWfWBek2EN+z+n+Hv0O71F+h0x3ouqDcDhwTh0sRwLVsmD/AtT7lI
	7hD7wIl+veGJFmDapmpqduTSEA5R21i4/n5CcmjwAK315PW/NJISqadbhWlNFuoJmhYQf5qja+7
	7kv7oOuZvOTCC+p9UcdH4opkVQTzz0hQVbhIg5EgbEpi47TfrI/8iYrV6hcnsaiOqB3hlIWeWJz
	decrO9zxuEItknP3mKo3csjOxo15RRjCFTTtvzwZ+/JjCKCdRWyQJgpDpdHOtPJUvJfuSWWjW7q
	j9CgCI6BtUMpMY=
X-Received: by 2002:a05:6000:2003:b0:439:ca85:8848 with SMTP id ffacd0b85a97d-43a04d895ecmr837918f8f.16.1773334617801;
        Thu, 12 Mar 2026 09:56:57 -0700 (PDT)
Message-ID: <62702a0e-a43f-4a15-90c7-e5778bbefb4f@suse.com>
Date: Thu, 12 Mar 2026 17:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 6/9] x86/mwait-idle: Remove the 'preferred_cstates' parameter
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
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,msgid.link:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid];
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
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0F41927630F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Remove the 'preferred_cstates' module parameter as it is not really useful.

The parameter currently only affects Alder Lake, where it controls C1/C1E
preference, with C1E being the default. The parameter does not support any
other platform. For example, Meteor Lake has a similar C1/C1E limitation,
but the parameter does not support Meteor Lake. This indicates that the
parameter is not very useful.

Generally, independent C1 and C1E are important for server platforms where
low latency is key. However, they are not as important for client platforms,
like Alder Lake, where C1E providing better energy savings is generally
preferred.

The parameter was originally introduced for Sapphire Rapids Xeon:
da0e58c038e6 intel_idle: add 'preferred_cstates' module argument

Later it was added to Alder Lake:
d1cf8bbfed1ed ("intel_idle: Add AlderLake support")

But it was removed from Sapphire Rapids when firmware fixed the C1/C1E
limitation:
1548fac47a114 ("intel_idle: make SPR C1 and C1E be independent")

So Alder Lake is the only platform left where this parameter has any effect.
Remove this parameter to simplify the driver and reduce maintenance burden.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Link: https://patch.msgid.link/20251215111300.132803-1-dedekind1@gmail.com
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git a36dc37b5672
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2083,12 +2083,6 @@ compression is selected at build time fr
 ### ple_window (Intel)
 > `= <integer>`
 
-### preferred-cstates (x86)
-> `= ( <integer> | List of ( C1 | C1E | C2 | ... )`
-
-This is a mask of C-states which are to be used preferably.  This option is
-applicable only on hardware were certain C-states are exclusive of one another.
-
 ### probe-port-aliases (x86)
 > `= <boolean>`
 
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -72,19 +72,6 @@ boolean_param("mwait-idle", opt_mwait_id
 
 static unsigned int mwait_substates;
 
-/*
- * Some platforms come with mutually exclusive C-states, so that if one is
- * enabled, the other C-states must not be used. Example: C1 and C1E on
- * Sapphire Rapids platform. This parameter allows for selecting the
- * preferred C-states among the groups of mutually exclusive C-states - the
- * selected C-states will be registered, the other C-states from the mutually
- * exclusive group won't be registered. If the platform has no mutually
- * exclusive C-states, this parameter has no effect.
- */
-static unsigned int __ro_after_init preferred_states_mask;
-static char __initdata preferred_states[64];
-string_param("preferred-cstates", preferred_states);
-
 #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
 /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C1. */
 static unsigned int lapic_timer_reliable_states = (1 << 1);
@@ -1511,28 +1498,6 @@ static void __init skx_idle_state_table_
 }
 
 /*
- * adl_idle_state_table_update - Adjust AlderLake idle states table.
- */
-static void __init adl_idle_state_table_update(void)
-{
-	/* Check if user prefers C1 over C1E. */
-	if ((preferred_states_mask & BIT(1, U)) &&
-	    !(preferred_states_mask & BIT(2, U))) {
-		adl_cstates[0].flags &= ~CPUIDLE_FLAG_DISABLED;
-		adl_cstates[1].flags |= CPUIDLE_FLAG_DISABLED;
-		adl_l_cstates[0].flags &= ~CPUIDLE_FLAG_DISABLED;
-		adl_l_cstates[1].flags |= CPUIDLE_FLAG_DISABLED;
-
-		/* Disable C1E by clearing the "C1E promotion" bit. */
-		icpu.c1e_promotion = C1E_PROMOTION_DISABLE;
-		return;
-	}
-
-	/* Make sure C1E is enabled by default */
-	icpu.c1e_promotion = C1E_PROMOTION_ENABLE;
-}
-
-/*
  * spr_idle_state_table_update - Adjust Sapphire Rapids idle states table.
  */
 static void __init spr_idle_state_table_update(void)
@@ -1578,11 +1543,6 @@ static void __init mwait_idle_state_tabl
 	case INTEL_EMERALDRAPIDS_X:
 		spr_idle_state_table_update();
 		break;
-	case INTEL_ALDERLAKE:
-	case INTEL_ALDERLAKE_L:
-	case INTEL_ATOM_GRACEMONT:
-		adl_idle_state_table_update();
-		break;
 	}
 }
 
@@ -1591,7 +1551,6 @@ static int __init mwait_idle_probe(void)
 	unsigned int eax, ebx, ecx;
 	const struct x86_cpu_id *id;
 	const struct idle_cpu *idle_cpu;
-	const char *str;
 
 	if (boot_cpu_data.vendor != X86_VENDOR_INTEL)
 		return -ENODEV;
@@ -1634,39 +1593,6 @@ static int __init mwait_idle_probe(void)
 	pr_debug(PREFIX "lapic_timer_reliable_states %#x\n",
 		 lapic_timer_reliable_states);
 
-	str = preferred_states;
-	if (isdigit(str[0]))
-		preferred_states_mask = simple_strtoul(str, &str, 0);
-	else if (str[0])
-	{
-		const char *ss;
-
-		do {
-			const struct cpuidle_state *state = idle_cpu->state_table;
-			unsigned int bit = 1;
-
-			ss = strchr(str, ',');
-			if (!ss)
-				ss = strchr(str, '\0');
-
-			for (; state->name[0]; ++state) {
-				bit <<= 1;
-				if (!cmdline_strcmp(str, state->name)) {
-					preferred_states_mask |= bit;
-					break;
-				}
-			}
-			if (!state->name[0])
-				break;
-
-			str = ss + 1;
-		} while (*ss);
-
-		str -= str == ss + 1;
-	}
-	if (str[0])
-		printk("unrecognized \"preferred-cstates=%s\"\n", str);
-
 	mwait_idle_state_table_update();
 
 	return 0;


