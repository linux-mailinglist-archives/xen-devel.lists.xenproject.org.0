Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CrGN4VJA2pU2wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:38:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70933523D12
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2026 17:38:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307041.1578786 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpBt-00070n-1H; Tue, 12 May 2026 15:38:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307041.1578786; Tue, 12 May 2026 15:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMpBs-0006xs-U3; Tue, 12 May 2026 15:38:36 +0000
Received: by outflank-mailman (input) for mailman id 1307041;
 Tue, 12 May 2026 15:38:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wMpBr-0006ve-1f
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 15:38:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMpBq-004MKj-Eh
 for xen-devel@lists.xenproject.org; Tue, 12 May 2026 17:38:34 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a03495d-5cb7-0a2a0a5109dd-0a2a4505e454-42
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:38:34 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a03497a-aaa8-0a2a45050019-d1558034dc9f-3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 17:38:34 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-48909558b3aso58479815e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 08:38:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fc8d624fbsm13356605e9.10.2026.05.12.08.38.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 08:38:33 -0700 (PDT)
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
        d=suse.com; s=google; t=1778600314; x=1779205114; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WzBd3MuuDBK0yJ9aRas8h0fwt5fLexFcIS7F696osWI=;
        b=DQI62Jfa+Khb/WlloCeKmxta1Hm9KDkNjkG+laZ84Oje+rI7RZJFZuiQ9u/zpGsmHQ
         L52D6TTSMAJhbWjMA0VGzHgsRxLjFMqwfMoUKOakjFfoW/FsifnlBO9UZaiNdcvf3C84
         9khpFIXy6L4Ppm4sraA8z2x+tRfBFrcVBnjW2O1YLK07Qz6+OrBpkuO/xVdhBa9RfkR2
         uJgkO3L1oYCzt52p8RJxK2ATKMiPLAZFIzp677URNEHoaYpWOskD2Tt4WDnnsAWdXt/O
         IjKC3+UxWiDwrEwYcaArMcFjEcUEOwB7+s+T8ZDU6AuLIiUh6NTTNUDmGxZHy0YT9F+I
         ABFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600314; x=1779205114;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzBd3MuuDBK0yJ9aRas8h0fwt5fLexFcIS7F696osWI=;
        b=F5BVthsC4F9qEkECefiSW1Uv/wqyP/V8LX9biqy3C5LiPdM4LZsEXVV65qSwAXkqqS
         C8UIn46CHwc1WNXO5bpLCf8M5NbgU89wONj4SC731U+4a0TNkDeu3d+5+ftrZh5/hbJz
         6+wcrOJqc94aX+NvZWVDu9HqaS2g7h7gRdJG1GQSANyiMr/053r/LlAwBzD1NvNyh4nF
         TXEdA9JmsFHM46fQy9Dr7DOsArlvFSc5tN5Q39FCp5C6UPGISB5Xk0Q9b/p9YHDQk+I+
         gvSP5XWfi7JOEQJeX9+/seOOU2TXPLa8se3gzHoW5UUwjdj0rNzdNQOa/6i9px0vNl4U
         SXEA==
X-Gm-Message-State: AOJu0YwcESzmK20jOtRpRlvZ7zkHm62BmX4DvWRZzZ9atbzpT3cK5teH
	tsyBuycQSuAf0/xJHiBW3Vvg6gOEFBLyj/gSTNKfHcEIZG6WqFueMhI/NO0EJtztQAMGoolaPfl
	mnJ4=
X-Gm-Gg: Acq92OHISxxLp0VGvxBHufzxYfIaOhMYWG7tZMT7czpDxcFNCPZpHjgLC5hgZXigmsV
	E1m0o35fJyLUQp0idWupFjLuQlTpmnTQpUDDj2CAHUPgkMGbHvAGNuD864r/BIlBfw049qhnqNy
	nURFxDT1Gq7SVI0TVK+wfw7Km/8LFyGCbLNSzVlGRG2Lx04c99eRyt/qa52qkVN38l970JLPM16
	Bm1NFLkJWSmAjos1rtQm9wCPiXhMe9nXqByRzYzKoO1XVACy7GaU53ekA/I6zjLiug0pCuc4vhZ
	Hi63e4NeVzPsklMcK99I3osmMQUwE4N1DPEP62GQSrwvrMDP3QtXP4q8501Acpccd8jFJ3QSbRQ
	SAWrJpJSkt7xiqMo/p8nRTvwB78VDum5ehvoE2gSH6xI0cW75ZikUY6vugtWo+Xx2YzDTqzM0cH
	TPVwJzR6K9Co0gRBLcd2idc9h7BaMol5pZMh3bRCPrPB9koicnDITVZwYWMiP3sBDsCLm85e2Hk
	EpD6AMzWuGaefHlJFmMazcnUw==
X-Received: by 2002:a05:600c:c094:b0:488:b14f:b8ed with SMTP id 5b1f17b1804b1-48e51dd89ffmr336736725e9.0.1778600313756;
        Tue, 12 May 2026 08:38:33 -0700 (PDT)
Message-ID: <d8c66d85-59c1-4107-b283-a03f92f6eab1@suse.com>
Date: Tue, 12 May 2026 17:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH for-4.22 v2 8/8] x86/mwait-idle: Add C-states validation
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
X-purgate-ID: tlsNG-c201ff/1778600314-DAD6F443-93512BCA/0/0
X-purgate-type: clean
X-purgate-size: 3148
X-Rspamd-Queue-Id: 70933523D12
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[msgid.link:url,intel.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:mid,suse.com:dkim];
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

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Add validation for C-states specified via the "table=" module parameter.
Treat this module parameter as untrusted input and validate it thoroughly.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Link: https://patch.msgid.link/20251216080402.156988-4-dedekind1@gmail.com
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git be6a150829b3

Add __init to validate_cmdline_cstate(). Other adjustments to fit our env.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Const-ify validate_cmdline_cstate()'s parameters.

--- a/xen/arch/x86/cpu/mwait-idle.c
+++ b/xen/arch/x86/cpu/mwait-idle.c
@@ -72,6 +72,11 @@ boolean_param("mwait-idle", opt_mwait_id
 
 /* The maximum allowed length for the 'table' module parameter  */
 #define MAX_CMDLINE_TABLE_LEN 256
+/* Maximum allowed C-state latency */
+#define MAX_CMDLINE_LATENCY_US (5 * 1000 /* USEC_PER_MSEC */)
+/* Maximum allowed C-state target residency */
+#define MAX_CMDLINE_RESIDENCY_US (100 * 1000 /* USEC_PER_MSEC */)
+
 static char cmdline_table_str[MAX_CMDLINE_TABLE_LEN] __initdata;
 string_param("mwait-idle.table", cmdline_table_str);
 
@@ -1590,6 +1595,41 @@ static char *__init get_cmdline_field(ch
 }
 
 /**
+ * validate_cmdline_cstate - Validate a C-state from cmdline.
+ * @state: The C-state to validate.
+ * @prev_state: The previous C-state in the table or NULL.
+ *
+ * Return: 0 if the C-state is valid or -EINVAL otherwise.
+ */
+static int __init validate_cmdline_cstate(const struct cpuidle_state *state,
+					  const struct cpuidle_state *prev_state)
+{
+	if (state->exit_latency == 0)
+		/* Exit latency 0 can only be used for the POLL state */
+		return -EINVAL;
+
+	if (state->exit_latency > MAX_CMDLINE_LATENCY_US)
+		return -EINVAL;
+
+	if (state->target_residency > MAX_CMDLINE_RESIDENCY_US)
+		return -EINVAL;
+
+	if (state->target_residency < state->exit_latency)
+		return -EINVAL;
+
+	if (!prev_state)
+		return 0;
+
+	if (state->exit_latency <= prev_state->exit_latency)
+		return -EINVAL;
+
+	if (state->target_residency <= prev_state->target_residency)
+		return -EINVAL;
+
+	return 0;
+}
+
+/**
  * cmdline_table_adjust - Adjust the C-states table with data from cmdline.
  *
  * Adjust the C-states table with data from the 'mwait-idle.table' parameter
@@ -1697,6 +1737,21 @@ static void __init cmdline_table_adjust(
 		       state->name, state->exit_latency, state->target_residency);
 	}
 
+	/* Validate the adjusted C-states */
+	for (i = 0; i < state_count; i++) {
+		struct cpuidle_state *prev_state;
+
+		state = &cmdline_states[i];
+		prev_state = i ? &cmdline_states[i - 1] : NULL;
+
+		if (validate_cmdline_cstate(state, prev_state)) {
+			printk(XENLOG_ERR PREFIX
+			       "C-state '%s' validation failed\n",
+			       state->name);
+			goto error;
+		}
+	}
+
 	/* Copy the adjusted C-states table back */
 	for (i = 0; i < state_count; i++)
 		icpu.state_table[i] = cmdline_states[i];


