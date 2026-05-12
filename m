Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNR1IHZJA2pU2wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:38:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2517523CFC
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:38:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307035.1578777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpBT-0006Rr-PV; Tue, 12 May 2026 15:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307035.1578777; Tue, 12 May 2026 15:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpBT-0006PF-MT; Tue, 12 May 2026 15:38:11 +0000
Received: by outflank-mailman (input) for mailman id 1307035;
 Tue, 12 May 2026 15:38:10 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMpBS-0006Ni-GJ
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:38:10 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpBR-00F2s1-TJ
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:38:09 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a03495f-2eae-0a2a0a5409dd-0a2a45048ee0-10
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:38:09 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a034961-1dec-0a2a45040019-d1558029ad43-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:38:09 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-4891c0620bcso40444275e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:38:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d1f669sm5321055e9.4.2026.05.12.08.38.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:38:08 -0700 (PDT)
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
        d=suse.com; s=google; t=1778600289; x=1779205089; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h9wUOSHCkf5lnhgbGUcgfm3/6j74fw4Q/KRVFYcRtW4=;
        b=cLAvyYBmOb7ukEJtmSwWtAWeOhvmFQcVIb+xdJEi1898IqK8ob1j5lWF0yItfMhLPI
         5DoRsnPhfwmLHfoC9hf47T5CNfpMlLpCrLIw7H6mk7SCG5UJ0SB40VxP9P7dhZ8f3Vbm
         3xZenzr6pCOx2qmddfUG9Qa6lo25VglXNYLZNjASItyU2IXAViGvKgcnVEYRpMdbWIE3
         6WX/ecwKJ5Ize1Y845CUxfKz0qbMmXi8mcBJ+V0hcnzfSgQd8ojckJ9oLdBth7YyIJl5
         82RoJGQjR2oTwmBJUmkyYtyk588FWBIFwPpFWWoLCmYFTdFm0awlVnFGhuayq+5oDiFV
         YTSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600289; x=1779205089;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9wUOSHCkf5lnhgbGUcgfm3/6j74fw4Q/KRVFYcRtW4=;
        b=gq5oshrLWfwrYi31lKzXiTKqU4NIVXC/nd1FVaYIB6nVT9d0EnK6tV7kfWP6/RnGu1
         fpkFweheIp6TbLELk4dgjwQoki4OG2iQ7Etz7AN4SZhzNbqg1AoKugjM8gcznDqqQEzk
         V8WCytXgxs8dTvSB87rbvUr68WBu3t+GwaWybSISVlSFIljqRksAAg7He4cRqi0/JSbw
         gxTrbdKx/s8rREAJnIeOBDAqdhKs2PFppmLIQDcOPAEp33PlJC9Dj6GlnkYMuDX6uRzh
         IUlELJKENj5am7Lveqh8kbtCZp33czd/xo72UOTnOi5KKbqkkO+QaLCvfAEPzmdQHCwl
         Uz8Q==
X-Gm-Message-State: AOJu0YwYaFFwZIcExL8hbSJWfEmjvHNJJ2OeaM0/0T95IbXKxSr8vq84
	tb6MP+WQgAi9eGPi+nOafpuSPCP0W6FSq4e96s5tWf3CF2zof+4yc1n4ttzurSG79N4y+IsRvct
	GuS0=
X-Gm-Gg: Acq92OFP3MZBVJpLYIGS/2rsu7WEdzJpDwBNrwts8SL/96LYscEcqz+bE00GunT5YIS
	qQ9tedrSewW9sYkXwQhf18S5oD3N9BtPEZJqL7+SDxBWEmxqrKowj2PMLMwBqk7cCb1K3pNwGpF
	ReEd+VqYSL+OKCsvdiDj+Hyk9v+GEscPSsi2gOZordgEUhtI1TVQHpK+xmFL0cO367FafE/wHXq
	Wpc0j9CjOfZk5iaG0fyefcRRgY5cC1UiWAnHJlqffyiSGnnZmeh3EwIv/9OicHIuud8GANXObpV
	r016vnVIlZG8OI/oRNiMvpj5NPFyjgOPLJgFORH9HKohdv4Pflt/GmOLDRfXl18kV3tZeBoi3yJ
	6rnGg2RcXVBBrOe75sCoEYgKRL52ol2WPGezAvx5FxdWiolG1ujomgg6RScPOIq6i8f16yjDHv7
	K6M61Dvwhd1dkPtYt2r/t01ISzY+5S468R+lAD6ej1DyWzB0mXlm7MvqmaHjV6Qy9FMaEpu34HD
	j66aNfR2Zlf4doEuJ/lA+4ZtQ==
X-Received: by 2002:a05:600c:a412:b0:48a:525b:e148 with SMTP id 5b1f17b1804b1-48e6748a724mr195782845e9.4.1778600289165;
        Tue, 12 May 2026 08:38:09 -0700 (PDT)
Message-ID: <8c46fedd-f1f3-4cad-91fb-1b3b8d58db50@suse.com>
Date: Tue, 12 May 2026 17:38:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22 v2 7/8] x86/mwait-idle: Add cmdline option to adjust
 C-states table
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
X-purgate-ID: tlsNG-ebf023/1778600289-4217E3FF-6158878D/0/0
X-purgate-type: clean
X-purgate-size: 8619
X-Rspamd-Queue-Id: E2517523CFC
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim,intel.com:email];
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
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Add a new module parameter that allows adjusting the C-states table used by
the driver.

Currently, the C-states table is hardcoded in the driver based on the CPU
model. The goal is to have good enough defaults for most users.

However, C-state characteristics, such as exit latency and residency, can
vary between different variants of the same CPU model and BIOS settings.
Moreover, different platform usage models and user preferences may benefit
from different C-state target_residency values.

Provide a way for users to adjust the C-states table via a module parameter
"table". The general format is:
"state1:latency1:target_residency1,state2:latency2:target_residency2,..."

In other words, represent each C-state by its name, exit latency (in
microseconds), and target residency (in microseconds), separated by colons.
Separate multiple C-states by commas.

For example, suppose a CPU has 3 C-states with the following
characteristics:
  C1:  exit_latency=1, target_residency=2
  C1E: exit_latency=10, target_residency=10
  C6:  exit_latency=100, target_residency=500

Users can specify a custom C-states table as follows:

1. intel_idle.table="C1:2:2,C1E:5:20,C6:150:600"
   Result: C1:  exit_latency=2, target_residency=2
           C1E: exit_latency=5, target_residency=20
           C6:  exit_latency=150, target_residency=600
2. intel_idle.table="C6::400"
   Result: C1:  exit_latency=1, target_residency=2 (unchanged)
           C1E: exit_latency=10, target_residency=10 (unchanged)
           C6:  exit_latency=100, target_residency=400
                (only target_residency changed)

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Link: https://patch.msgid.link/20251216080402.156988-3-dedekind1@gmail.com
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 111f77a23348

Add __init to get_cmdline_field(). Put cmdline_table_str[] in .init.data.
Other adjustments to fit our env.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
For the initial attempt, I've left the new option as a standalone one. It
may be worth integrating with "mwait-idle", but I think much of the
parsing would then want doing differently. It'll then likely be much
harder to apply future Linux changes there.
---
v2: Correct example in cmdline doc.

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1916,6 +1916,23 @@ Print boot time MTRR state.
 Use the MWAIT idle driver (with model specific C-state knowledge) instead
 of the ACPI based one.
 
+### mwait-idle.table (x86)
+> `= <string>`
+
+ Define the C-states table from a user input string. Expected format is
+ 'name:latency:residency', where:
+ - name: The C-state name.
+ - latency: The C-state exit latency in us.
+ - residency: The C-state target residency in us.
+
+ Multiple C-states can be defined by separating them with commas:
+ 'name1:latency1:residency1,name2:latency2:residency2'
+
+ Example: mwait-idle.table=C1:1:1,C1E:5:10,C6:100:600
+
+ To leave latency or residency unchanged, use an empty field, for example:
+ 'C1:1:1,C1E::10' - leaves C1E latency unchanged.
+
 ### nmi (x86)
 > `= ignore | dom0 | fatal`
 
--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -70,6 +70,11 @@
 static __initdata bool opt_mwait_idle = true;
 boolean_param("mwait-idle", opt_mwait_idle);
 
+/* The maximum allowed length for the 'table' module parameter  */
+#define MAX_CMDLINE_TABLE_LEN 256
+static char cmdline_table_str[MAX_CMDLINE_TABLE_LEN] __initdata;
+string_param("mwait-idle.table", cmdline_table_str);
+
 static unsigned int mwait_substates;
 
 #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
@@ -122,6 +127,9 @@ struct cpuidle_state {
  */
 #define CPUIDLE_FLAG_IBRS		0x20000
 
+/* C-states data from the 'mwait-idle.table' cmdline parameter */
+static struct cpuidle_state cmdline_states[ACPI_PROCESSOR_MAX_POWER] __initdata;
+
 /*
  * MWAIT takes an 8-bit "hint" in EAX "suggesting"
  * the C-state (top nibble) and sub-state (bottom nibble)
@@ -1547,6 +1555,161 @@ static void __init mwait_idle_state_tabl
 	}
 }
 
+ /**
+  * get_cmdline_field - Get the current field from a cmdline string.
+  * @args: The cmdline string to get the current field from.
+  * @field: Pointer to the current field upon return.
+  * @sep: The fields separator character.
+  *
+  * Examples:
+  *   Input: args="C1:1:1,C1E:2:10", sep=':'
+  *   Output: field="C1", return "1:1,C1E:2:10"
+  *   Input: args="C1:1:1,C1E:2:10", sep=','
+  *   Output: field="C1:1:1", return "C1E:2:10"
+  *   Ipnut: args="::", sep=':'
+  *   Output: field="", return ":"
+  *
+  * Return: The continuation of the cmdline string after the field or NULL.
+  */
+static char *__init get_cmdline_field(char *args, char **field, char sep)
+{
+	unsigned int i;
+
+	for (i = 0; args[i] && !isspace(args[i]); i++) {
+		if (args[i] == sep)
+			break;
+	}
+
+	*field = args;
+
+	if (args[i] != sep)
+		return NULL;
+
+	args[i] = '\0';
+	return args + i + 1;
+}
+
+/**
+ * cmdline_table_adjust - Adjust the C-states table with data from cmdline.
+ *
+ * Adjust the C-states table with data from the 'mwait-idle.table' parameter
+ * (if specified).
+ */
+static void __init cmdline_table_adjust(void)
+{
+	char *args = cmdline_table_str;
+	struct cpuidle_state *state;
+	unsigned int i, state_count;
+
+	if (args[0] == '\0')
+		/* The 'mwait-idle.table' module parameter was not specified */
+		return;
+
+	/* Create a copy of the C-states table */
+	for (i = 0;
+	     i < ARRAY_SIZE(cmdline_states) && icpu.state_table[i].name[0];
+	     i++)
+		cmdline_states[i] = icpu.state_table[i];
+
+	state_count = i;
+
+	/*
+	 * Adjust the C-states table copy with data from the 'mwait-idle.table'
+	 * module parameter.
+	 */
+	while (args) {
+		char *fields, *name, *val;
+
+		/*
+		 * Get the next C-state definition, which is expected to be
+		 * '<name>:<latency_us>:<target_residency_us>'. Treat "empty"
+		 * fields as unchanged. For example,
+		 * '<name>::<target_residency_us>' leaves the latency unchanged.
+		 */
+		args = get_cmdline_field(args, &fields, ',');
+
+		/* name */
+		fields = get_cmdline_field(fields, &name, ':');
+		if (!fields)
+			goto error;
+
+		/* Find the C-state by its name */
+		state = NULL;
+		for (i = 0; i < state_count; i++) {
+			if (!strcmp(name, cmdline_states[i].name)) {
+				state = &cmdline_states[i];
+				break;
+			}
+		}
+
+		if (!state) {
+			printk(XENLOG_ERR PREFIX "C-state '%s' was not found\n",
+			       name);
+			continue;
+		}
+
+		/* Latency */
+		fields = get_cmdline_field(fields, &val, ':');
+		if (!fields)
+			goto error;
+
+		if (*val) {
+			const char *end;
+			unsigned long n = simple_strtoul(val, &end, 0);
+
+			state->exit_latency = n;
+			if (*end || state->exit_latency != n)
+				goto error;
+		}
+
+		/* Target residency */
+		fields = get_cmdline_field(fields, &val, ':');
+
+		if (*val) {
+			const char *end;
+			unsigned long n = simple_strtoul(val, &end, 0);
+
+			state->target_residency = n;
+			if (*end || state->target_residency != n)
+				goto error;
+		}
+
+		/*
+		 * Allow for 3 more fields, but ignore them. Helps to make
+		 * possible future extensions of the cmdline format backward
+		 * compatible.
+		 */
+		for (i = 0; fields && i < 3; i++) {
+			fields = get_cmdline_field(fields, &val, ':');
+			if (!fields)
+				break;
+		}
+
+		if (fields) {
+			printk(XENLOG_ERR PREFIX
+			       "Too many fields for C-state '%s'\n",
+			       state->name);
+			goto error;
+		}
+
+		printk(XENLOG_INFO PREFIX
+		       "C-state from cmdline: name=%s, latency=%u, residency=%u\n",
+		       state->name, state->exit_latency, state->target_residency);
+	}
+
+	/* Copy the adjusted C-states table back */
+	for (i = 0; i < state_count; i++)
+		icpu.state_table[i] = cmdline_states[i];
+
+	printk(XENLOG_INFO PREFIX
+	       "Adjusted C-states with data from 'mwait-idle.table'\n");
+	return;
+
+ error:
+	printk(PREFIX
+	       "Failed to adjust C-states with data from 'mwait-idle.table'\n");
+}
+
 static int __init mwait_idle_probe(void)
 {
 	unsigned int eax, ebx, ecx;
@@ -1596,6 +1759,8 @@ static int __init mwait_idle_probe(void)
 
 	mwait_idle_state_table_update();
 
+	cmdline_table_adjust();
+
 	return 0;
 }
 


