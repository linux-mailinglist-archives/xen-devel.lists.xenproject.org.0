Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE5ZNFDxcWlKZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:43:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4181264B5C
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:43:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210627.1522271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virDz-0001w6-GJ; Thu, 22 Jan 2026 09:43:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210627.1522271; Thu, 22 Jan 2026 09:43:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virDz-0001u7-DE; Thu, 22 Jan 2026 09:43:35 +0000
Received: by outflank-mailman (input) for mailman id 1210627;
 Thu, 22 Jan 2026 09:43:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1virDx-0000Cq-Ij
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:43:33 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d00f037f-f776-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 10:43:31 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47eddddcdcfso4122285e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 01:43:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4359f4a7ac7sm10309584f8f.20.2026.01.22.01.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:43:31 -0800 (PST)
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
X-Inumbo-ID: d00f037f-f776-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769075011; x=1769679811; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fLtQAXdQpvWtzRgQd0SjG5ynKciIprq6k8v637TMVBw=;
        b=LzdoENZUScrhFuFxf7Fjc/dTAWkpXES6wuoLMMAQYHVEwzxI+uSjrujMk5E6023rCf
         wlmp5Th0QqT/LjFgPQY/0f2hBhy89wO5U1mMPwh4yK/60aKn/2LXqBZ0mFuJqkw/v8XZ
         tJAHJW3oNgsRo6BfnDQjTJ8JcInIjdxuuxutUbuZsMYu/kR4mKnwtBWpdeGTcNO0bxak
         lXsoCr/HgPEX/oe60Z65PFgiuO8DT9JCYFvub+fBqbRQZuSF0k/3gmIqFzCAkVod7rUw
         tiKOwh9y45fiS3q2dwqT1zzUO4Z37aogiQWy8kgndE92yobVqx2/CrYqgakTrO4Q4gEH
         Oirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769075011; x=1769679811;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLtQAXdQpvWtzRgQd0SjG5ynKciIprq6k8v637TMVBw=;
        b=KPc/L3f1K93oNVNT5KUMf35kOZuOscb/eTfgMfFCfWZWdYEGLU2FTEmniYcL/sfnKh
         YtsSz5kBBKE2DJGZjKN9L0DzHlf1gT73rIpn31mXbKnm3BFFO6OAqhUqtlOp+ZKFZL3N
         RB0Pyaj6/YKgik2zXYqOJGQnmAI86pnfICldVs29iok7EsZ0g6KESSimVrgaxJaGsyJg
         netmr+xgYdR9gBG+HK9GUULYo3Fc3/Lqa6X9rxcFxOpnkm0xz29C/17p7A7Q/AqUG8cq
         TwjjbZVHosODfoIA9akyENHaeT8JJS7gwJi20tiAo/NjaVE+9wrPEDun4fO9YEJWVyyg
         5tcQ==
X-Gm-Message-State: AOJu0YxEG7BUZ4JIxIC+rCRHDZ9A5AprxY+dCA/WboJjVYDHBFHLI45l
	Lb2LdbFBn7ZfQoC85GCHH4xnEROtRTK2gT6FUA3E41cMZBjNez3cm+QLhbajtqmsWaMVpdWtVku
	rxgo=
X-Gm-Gg: AZuq6aLYPk4CTeh28aZF0JeLo7M36Meib01rtsU3kd6CXxiuuHuTYHkRdJk4pq7BCl9
	FqcV0Fcs/PtPFQzVAFbKlWz2rXxdOtDAySodVJj8YsVZ3FZm7H7u3rBERz5hfpFWuO5tuh6617e
	OoyBpSvvZaW1COEDhErTbx5FzpD9cylZ3WwTE8X3G4CApYu3nVYWE9ct1M7TINrMkl4n0B+98gn
	X3TkDvajRp+YhYXB3cxtNOUdtJj25SUGGHzzdK/1iLCDw5PL6fQUy7vG0Jrrh29cqk1H2e3rhvs
	DdnBXfcoVvH43UIlsuZC6GrCOy1bDk84kwVRuOT2cVursCBzBmbLgcKXrdg4rj6brEVKZx/eu7x
	VQxQN6227FLta9uc7GydHzt02UZ3jiL1a8rhwkB17VKH/lVmY1gPuHJ0RPC/ej7LbVXtcpsLKcz
	FyqSVMZbZI40kt0roiPaQWA50fxyYXVGI16lnP1Xlz6FpXNyWX6JjKKmajw5ULr8yzi50aJxXw4
	T8=
X-Received: by 2002:a05:600c:6215:b0:47a:9560:5944 with SMTP id 5b1f17b1804b1-480432c4b7cmr79750625e9.34.1769075011276;
        Thu, 22 Jan 2026 01:43:31 -0800 (PST)
Message-ID: <18639925-4e8f-4d58-a850-291d7ac0e6da@suse.com>
Date: Thu, 22 Jan 2026 10:43:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 4/5] cpufreq/amd-cppc: move epp_init into driver data
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Penny Zheng <Penny.Zheng@amd.com>
References: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
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
In-Reply-To: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
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
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 4181264B5C
X-Rspamd-Action: no action

No reason for it to be a separate per-CPU item; it's connected to a
struct cpufreq_policy instance just like other driver data.

This further reduces the concern over amd_cppc_cpufreq_cpu_init() being
called for all CPUs, or a CPU going offline that's recorded in policy->cpu
(which would result in accesses of per-CPU data of offline CPUs).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -35,7 +35,6 @@
  * for freq-to-perf transition
  */
 static DEFINE_PER_CPU_READ_MOSTLY(unsigned int, pxfreq_mhz);
-static DEFINE_PER_CPU_READ_MOSTLY(uint8_t, epp_init);
 #ifndef NDEBUG
 static bool __ro_after_init opt_active_mode;
 #else
@@ -248,7 +247,7 @@ static int cf_check amd_cppc_cpufreq_tar
     amd_cppc_write_request(policy, data->caps.lowest_nonlinear_perf,
                            des_perf, data->caps.highest_perf,
                            /* Pre-defined BIOS value for passive mode */
-                           per_cpu(epp_init, policy->cpu));
+                           data->epp_init);
     return 0;
 }
 
@@ -326,7 +325,7 @@ static void cf_check amd_cppc_init_msrs(
 
     /* Store pre-defined BIOS value for passive mode */
     rdmsrl(MSR_AMD_CPPC_REQ, val);
-    this_cpu(epp_init) = MASK_EXTR(val, AMD_CPPC_EPP_MASK);
+    data->epp_init = MASK_EXTR(val, AMD_CPPC_EPP_MASK);
 
     return;
 
@@ -465,7 +464,7 @@ static void amd_cppc_prepare_policy(stru
         break;
 
     default:
-        *epp = per_cpu(epp_init, policy->cpu);
+        *epp = data->epp_init;
         break;
     }
 }
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -143,6 +143,8 @@ struct amd_cppc_drv_data {
         };
     } req;
 
+    uint8_t epp_init;
+
     int err;
 };
 


