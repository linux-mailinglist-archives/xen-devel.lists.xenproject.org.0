Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MztOtYCi2kMPQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:05:10 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 722D51195EE
	for <lists+xen-devel@lfdr.de>; Tue, 10 Feb 2026 11:05:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1226172.1532702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpkcB-0004aT-03; Tue, 10 Feb 2026 10:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1226172.1532702; Tue, 10 Feb 2026 10:05:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpkcA-0004Y4-TQ; Tue, 10 Feb 2026 10:05:02 +0000
Received: by outflank-mailman (input) for mailman id 1226172;
 Tue, 10 Feb 2026 10:05:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z/2=AO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vpkc9-00047C-Ha
 for xen-devel@lists.xenproject.org; Tue, 10 Feb 2026 10:05:01 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f61e39b8-0667-11f1-b162-2bf370ae4941;
 Tue, 10 Feb 2026 11:05:00 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-43638a3330dso2145354f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 10 Feb 2026 02:05:00 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4376b62b835sm20189058f8f.12.2026.02.10.02.04.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Feb 2026 02:04:59 -0800 (PST)
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
X-Inumbo-ID: f61e39b8-0667-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770717900; x=1771322700; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeKEnQDPhdS5yYdYpv6E3pVYAeCRb63E7iwSFcUYya0=;
        b=FmTWnH4qMO0s90e68r7Nmylvgo9MzVDMlFaHr9ty56/LMnMKriPNVL6u55Z4R8VLQo
         4pT5YP4GIL8hVE1A60N7XFJI6gXbAwrEl7VdJARsnXVMmDCr02PMEJV5kMLsEH7Q8eNO
         qe0a3dtBRFHh6h4al0OjEGeuUtenrSaaRTavBfEnzV+v8NePzVfWtrNf2NB1kYHmRvic
         mxj9q3hZb4m7hYi+AE/R7s8NQE1+ii445S1bfIK7Sxf8pb0WD946+6xKTglwgIj9/DLM
         4hU650F+uUqr17OGTlDHRLSmiYwSja2pn43cqTgemmKM3UzVPyiJebfE3fHk8DCCIFUr
         ZQFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717900; x=1771322700;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CeKEnQDPhdS5yYdYpv6E3pVYAeCRb63E7iwSFcUYya0=;
        b=XIAP+qeWZx6rdKQ6dYclh5wQLN8WkcMBFmI8lFMgTW1kmacba7eiVgvWw1MxylCQ9n
         f7bEC0xn2+hru6CJf45RgjxfC7taoslu31gynubjiYWOPO3MJHVyaJpkNCdQ1nuD9cej
         kE+t7OJrAa3+UX4SuBQPFCJ55CQJoQ4EVthEqJZMhD2MIM+5OQjZoQRNRifyVehvFjf1
         AGV0v/YKtxeAKhxcdYdhkYcLAWSam3Y+uVGBVPuhiHS8sGo2qsUkY3ft6bfpcOVq062+
         e47fj0Tjzgrz5d9/hnBo0h0F/g1a+0UJoUeQOfU9ZUSJScS1yBkcOz+1KU3xET/ACFP3
         X6aA==
X-Gm-Message-State: AOJu0Yz5M4+9wmVeEsve1z+lrLY4yFZdR7UMVfRJ9uJqQ/x7qDcYQRxv
	N7i4r9K138jUQde2SWmGZu8oKIdga84+keWd8OKsq7kagpAvxuW8aIKSSjilQfBbjxylfwAQV1d
	Fxis=
X-Gm-Gg: AZuq6aJXGYpWcybhSaRsYYp8gaU+YpYBHly0ngOW3Ny0yIanM1Z/esZeiUBzlrxvIGW
	x4qfT6oVgqJK8IYLAN+ampRdoqOKDrlzRolDlhFiDQ895cDPxXmFjAXSofTwuWwDZlpV9o9huij
	Y345qThkO2KKbMBhFiFONRo8nOXexZOCD1NuqpFXUvY8ipQ++Yqiw9ePgqohVd3k8VEIw/i6Kv6
	6MtDYod+Gq8YTTV+P9fgelldNVxIK7MgkbkvQUrJ7Lykuf/9dVuf+uGEpDLCaTAB0w1euHTyjY8
	/00hQHGcVTOfCrI+8llRMJb9fDIqZcUNuCYd+VxavDk0GyuSijmzjUiy9iKj8KjzSA/8RhEozAa
	77jg82gwQhJ19ES6M6c0/NVbRdFgWWCpo3chqSHpxX3QZIA3I2AjQIhuDnMq1C2oA0s1NSIdAsQ
	J6w+ZCtqS7DhnTXArWhuhYFOpeTKGoE15RaHArpVwJpaAgzWPEZJoiFmxqBjVgdXrzgMU3r2uZW
	K3Do3qIPpogczs=
X-Received: by 2002:a05:6000:2411:b0:435:a4a9:6f79 with SMTP id ffacd0b85a97d-4362933bef4mr19281630f8f.8.1770717900039;
        Tue, 10 Feb 2026 02:05:00 -0800 (PST)
Message-ID: <f97bbfb5-389c-4845-84fb-e6f07ba0ade8@suse.com>
Date: Tue, 10 Feb 2026 11:04:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/time: adjust handling of negative delta in stime2tsc()
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
Content-Transfer-Encoding: 7bit
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 722D51195EE
X-Rspamd-Action: no action

When we cap negative values to 0 (see code comment as to why), going
through scale_delta() is pointless - it'll return 0 anyway. Therefore make
the call conditional (and then also the one to scale_reciprocal()), adding
a comment as to why there is this capping.

Modernize types used while there, and switch to usiong initializers for
the local variables.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Adding likely() to the conditional here does make a difference. Question
is whether to do so, seeing that there looks to be a possibility (of
unknown frequency) for the delta to be non-positive.

--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1176,20 +1176,26 @@ uint64_t __init calibrate_apic_timer(voi
     return elapsed * CALIBRATE_FRAC;
 }
 
-u64 stime2tsc(s_time_t stime)
+uint64_t stime2tsc(s_time_t stime)
 {
-    struct cpu_time *t;
-    struct time_scale sys_to_tsc;
-    s_time_t stime_delta;
+    const struct cpu_time *t = &this_cpu(cpu_time);
+    s_time_t stime_delta = stime - t->stamp.local_stime;
+    int64_t delta = 0;
 
-    t = &this_cpu(cpu_time);
-    sys_to_tsc = scale_reciprocal(t->tsc_scale);
+    /*
+     * While for reprogram_timer() the capping at 0 isn't relevant (the returned
+     * value is likely in the past anyway then, by the time it is used), for
+     * cstate_restore_tsc() this is relevant: We need to avoid moving the TSC
+     * backwards (relative to when it may last have been read).
+     */
+    if ( stime_delta > 0 )
+    {
+        struct time_scale sys_to_tsc = scale_reciprocal(t->tsc_scale);
 
-    stime_delta = stime - t->stamp.local_stime;
-    if ( stime_delta < 0 )
-        stime_delta = 0;
+        delta = scale_delta(stime_delta, &sys_to_tsc);
+    }
 
-    return t->stamp.local_tsc + scale_delta(stime_delta, &sys_to_tsc);
+    return t->stamp.local_tsc + delta;
 }
 
 void cstate_restore_tsc(void)

