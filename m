Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFNbF73wsmlaRAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:58:37 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FBF2762F8
	for <lists+xen-devel@lfdr.de>; Thu, 12 Mar 2026 17:58:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1252806.1549363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jMh-0002qI-PX; Thu, 12 Mar 2026 16:58:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1252806.1549363; Thu, 12 Mar 2026 16:58:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w0jMh-0002os-Mo; Thu, 12 Mar 2026 16:58:27 +0000
Received: by outflank-mailman (input) for mailman id 1252806;
 Thu, 12 Mar 2026 16:58:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jTts=BM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1w0jMg-0002Yf-51
 for xen-devel@lists.xenproject.org; Thu, 12 Mar 2026 16:58:26 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae87bdf4-1e34-11f1-9ccf-f158ae23cfc8;
 Thu, 12 Mar 2026 17:58:24 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4853e1ce427so14015765e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 12 Mar 2026 09:58:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b6f708sm342809325e9.11.2026.03.12.09.58.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 09:58:22 -0700 (PDT)
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
X-Inumbo-ID: ae87bdf4-1e34-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773334703; x=1773939503; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vVYFfqfJHLEO9z5Th4OdzRW5ThSuFwagPEe2uUt1u9I=;
        b=fckAaDC8XWNt1oby6kWMJtv+EKjtz+eyidP04x5bb2UEKsn/FkFjYl73bYkt1SbSvQ
         MO5nQ0vC2GDGUqe0emxCs6ZMictVbTfPozj7Fsi4YgKlOPeOOw8mWYjcekyTfD8/8rIn
         nfzzydd/CmI0CNVdFJWyBpssc12i6GZUvA8ZY8YV+xSPW9aHg+DQCrmrmmZZETsDNiWb
         Y0DNDBs27YAqvwaAm248gD0v0xQfc/3/lEXm1aHVQRy4koSXUk/qQDv/be/VyERHOh3S
         MbokkLPbqV2xamUjJNHj1+fmtfDOBNr8L9hV/NxGGZiDb+KOzFdCb0dm9TJeb6bi+eC2
         lq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334703; x=1773939503;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVYFfqfJHLEO9z5Th4OdzRW5ThSuFwagPEe2uUt1u9I=;
        b=C0Na1srSV5OvY5KhHfbWrK2ya91fRo3MjfnWUKVYXHZ2xfBDgJaiP3KgGOMygiDnOm
         BXfyZufDAAn0iUDWpBNyFDAHRoFD0rCMZYhcIFzJvzU5ZJ6LZchNL0dX60+5tWaQVICz
         6xHtGTZ6yZWCQbrLSjzarF2DJXx+ocgxlGG1b7tzbr3Zypl2G4jqM2nULqvOd3TS+eX2
         UfVQEvbhm/KrtQRFpGbiVjYbd5l8+Q8pAdeBq+U2EyHHSmoXePR12knaLx+wflramjzk
         y4lSzRm1/AzE0GXYDeREJ6GmTb7D9qZ0KSeGRoIuj++FBhw6CTUFPyv8kDo+1PpP8gGM
         rAPA==
X-Gm-Message-State: AOJu0YygwCO7PZDcs7QBckNRN22VsOYbVHK6JQq9fBCV0zAgOdHlGUce
	Bg0h1cHC429BxOwex8fgqH9At6AWjDJN/fzD/IqhdyzsgmZBkz73lFSF7EH7A3wAxi73pJWXjye
	yKvQ=
X-Gm-Gg: ATEYQzzDT8IvxpjBSBOZIqowFjGgoL8Zp7wY0ATmSOJMpWlkZ6fScYsZaGLkEth0MQT
	yKXw3MEI9+Dky4WmYK5Gk4E5rRglYtPDpqFYEv2T8GzONSr+bE0kGsNLBENsnJVP+gD2259ixRe
	jlulxCzn5fm7rENxt/1EB7kn49jEj76dkOtas7i6ldfN0dLHXTCRiccwVTpvekhmVqOLsvfD4xe
	3ikycEGnaH7SfLXyFFEIzHzUfy90kieEHjw6IgzbhYcEjpSWrwKZ5lgdIesCUA7n/TGkQ9HeNTP
	A0OxQCmQ3CmaOgYxayaPJ3X9/k1oqbE3thacXlxY042241JAe4lAKUru5M14zb8cbq+5kM1ZFae
	r3EqQOEAa+guUMnBWmHjPWoorl64RJD4+FcWEFtUG/ELqRxBI4TeaBJU5tEHiqhsE/0QOnBafG4
	y0Ea8Kxy7NNhps0jTe8bNHtYr+BOX34QQH7v4A1b45vCplRWLUWujye5RKb2ME3AxgiZ92P0SYZ
	iEYjZUAkF2Q1Eg=
X-Received: by 2002:a05:600c:c3cc:10b0:485:54cc:2e7c with SMTP id 5b1f17b1804b1-48554cc2e8cmr25076595e9.24.1773334703593;
        Thu, 12 Mar 2026 09:58:23 -0700 (PDT)
Message-ID: <d13912c9-8820-44e7-8aad-d8ee9ea17980@suse.com>
Date: Thu, 12 Mar 2026 17:58:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 9/9] x86/mwait-idle: Add C-states validation
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
X-Rspamd-Queue-Id: C4FBF2762F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Add validation for C-states specified via the "table=" module parameter.
Treat this module parameter as untrusted input and validate it thoroughly.

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Link: https://patch.msgid.link/20251216080402.156988-4-dedekind1@gmail.com
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git be6a150829b3

Add __init to validate_cmdline_cstate(). Other adjustments to fit our env.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
 
@@ -1589,6 +1594,41 @@ static char *__init get_cmdline_field(ch
 }
 
 /**
+ * validate_cmdline_cstate - Validate a C-state from cmdline.
+ * @state: The C-state to validate.
+ * @prev_state: The previous C-state in the table or NULL.
+ *
+ * Return: 0 if the C-state is valid or -EINVAL otherwise.
+ */
+static int __init validate_cmdline_cstate(struct cpuidle_state *state,
+					  struct cpuidle_state *prev_state)
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
@@ -1696,6 +1736,21 @@ static void __init cmdline_table_adjust(
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


