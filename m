Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFMYG6DwsmlBRAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:58:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2282762B5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:58:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252793.1549355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jMG-0002FA-H0; Thu, 12 Mar 2026 16:58:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252793.1549355; Thu, 12 Mar 2026 16:58:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jMG-0002CG-Bo; Thu, 12 Mar 2026 16:58:00 +0000
Received: by outflank-mailman (input) for mailman id 1252793;
 Thu, 12 Mar 2026 16:57:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0jME-0001v3-AX
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:57:58 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e78f7eb-1e34-11f1-b164-2bf370ae4941;
 Thu, 12 Mar 2026 17:57:57 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so14010975e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 09:57:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854e2537c3sm131081495e9.15.2026.03.12.09.57.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 09:57:55 -0700 (PDT)
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
X-Inumbo-ID: 9e78f7eb-1e34-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773334677; x=1773939477; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qOP/T1HJZb7a2znFHzhzofDtcxTuReCcTpVKKooOuJM=;
        b=YpdDVmHrUl1fnaN0b7UEfpc2B69zzq4PDWMIVLkSH/OE8f+KUyAoAWj5qwOmxHKOXO
         WIQPbOdi464bN8i5u/QnVdhMxRITYuJiCKC2ZVa2qWepZrhOWDfUUrij873xQx+B2AL0
         HZX5uJkOL2HSjq8gMZedlpPboKvx22K3KzD9a7mZhBHoaArriFUCMNfjgYNWnHyIjszF
         eG178JYq08MK63n1rAQSW4bQSPOOLNystY4V8MAfcB4Ymq8Pl/YZzI6iGVd9LkaW3bLq
         VxB9VdQK4z/tI4eRiP5z5ievC3Ifnj1dl6BdAmV5c1Sx+jXTyaXIWYqXIGeIsgnAQLQN
         /Iww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334677; x=1773939477;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qOP/T1HJZb7a2znFHzhzofDtcxTuReCcTpVKKooOuJM=;
        b=owYw5N7z1YdrYAU7hCeVr+JKRWOOy+EWA6p/RI6UqF3FQlZKlUhCJKZRih66Lolg74
         Pv4M04ZMIbRQj0541XGOu5RCT4wrIZ9Qrj4sBp3HOxyJ2QeNcSlS6g7WHh7nmhwHONLY
         padvp1EwQeWHdaQJGIP7+lEa0MChQKZ0wtPRHDH0ZNqVJFgaeievXi5ex3Km0SnWg48P
         zQXnZbczz8g1+z3V6cko3x1HrMjDihBYINaPOY8BY7+6HHh3MNqgrL1fXs/RCA11Iz+A
         3BV+6bXyVQ3itgUkw4NfQ7J5V4rHTZOzoEZIBBCzfwXiwGHGt6j/ZOKbctVe3A9mzGP8
         AZtQ==
X-Gm-Message-State: AOJu0Yy8ixg6R3HxrvIFNl6ITUpP6fRdrxOyoAdmADQtb7pVWLzPMpAK
	qw3ahf/5xRs+FEWh+NI2MLZvFCJdE6Hi3dAqMjbuM71lHlTBsqvWdTFvf0v2yVJojKw7prP4uM6
	Ob3Q=
X-Gm-Gg: ATEYQzz57WU74fMJ3As8n1t4tvM61WWSqgsxrFRLNH+CARShxddczd6oJK53xY4yhbr
	Awh7pj/nNYeYLrqc7ypBPJVTdfOosPmz7qEQrPlBFcZXIxL5E2I3YhpnF5JzCYs8niNJzG7lr6v
	nfnjUOaEJvqqjur+WUAinOLRT+ZUaz2mJw8PlTuEV+O5KnAnahQ6Sz18YXETDUFNmr+PPLa2zDZ
	iQnaYommdv6UAqJUQHtgTDmkqfYuo0XeTAia1/XkSu+kMJrPSxVJzyAtMEf3lQNKPZ8x54MoHAx
	00jbE0IOEO73BRRwIjEvW9Z44LC1aHuXRWwDploxmjH0cxDlVsixmJ/uyNcRnOL2lieZ8lS/9BC
	mP7ya6NaWOG3IhRnAhwU5YG9ZqqrQVR9pjkJi2eKjaadr+9K5M1ANgHfzH12tNRfKbEzqgy/v5G
	Gf71TTbD8G+WR1ynJov9r6pJdYqq7/qkdHFJdMp6krrbdFU7nvr43WcbiaONmk4RRpr2y/5py8t
	wyJNMNsyxhaKuM=
X-Received: by 2002:a05:600c:3490:b0:477:9b4a:a82 with SMTP id 5b1f17b1804b1-4854b13e5d7mr112510495e9.35.1773334676486;
        Thu, 12 Mar 2026 09:57:56 -0700 (PDT)
Message-ID: <addfdc9f-7f03-4b84-b998-1fdbef2edc78@suse.com>
Date: Thu, 12 Mar 2026 17:57:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 8/9] x86/mwait-idle: Add cmdline option to adjust C-states
 table
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:dkim,suse.com:email,suse.com:mid,intel.com:email,msgid.link:url];
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
X-Rspamd-Queue-Id: CC2282762B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1928,6 +1928,23 @@ Print boot time MTRR state.
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
+ Example: intel_idle.table=C1:1:1,C1E:5:10,C6:100:600
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
@@ -1546,6 +1554,161 @@ static void __init mwait_idle_state_tabl
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
@@ -1595,6 +1758,8 @@ static int __init mwait_idle_probe(void)
 
 	mwait_idle_state_table_update();
 
+	cmdline_table_adjust();
+
 	return 0;
 }
 


