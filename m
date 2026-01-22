Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKNeCGfycWmvZwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:48:23 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A8A64C6D
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 10:48:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1210640.1522281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virIR-0002vW-0H; Thu, 22 Jan 2026 09:48:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1210640.1522281; Thu, 22 Jan 2026 09:48:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1virIQ-0002u4-Tn; Thu, 22 Jan 2026 09:48:10 +0000
Received: by outflank-mailman (input) for mailman id 1210640;
 Thu, 22 Jan 2026 09:48:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1virEI-0000Cq-UU
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 09:43:54 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dcbeb970-f776-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 10:43:53 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso7544205e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jan 2026 01:43:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48042b6a3e2sm51107065e9.1.2026.01.22.01.43.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:43:52 -0800 (PST)
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
X-Inumbo-ID: dcbeb970-f776-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769075032; x=1769679832; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=b6ZgQHfjrDjWEfMOq63jsxR+PhNdjaZ5C3nYexbwyrk=;
        b=WWPRZnDyYKIE6CYBNkSihkY4kPKFBzzPCPIKO99ioJ12UwC0rZ5GGoe/CnD+gPMCZS
         ZkDssxYdhW1FE3jIaF+B6LNsdkKhtF8JuA7+1WvQDb1E4pHT4B5Cg9ZVWZzeDBcRJt/F
         J7HvuX4OvorlZZZpMux6ukRpWaj4O0qcUbgONu+ggNt7qk4qBfYROCFeEuegvDhQvtFh
         8+0VFOsNVGI7J2HPeJSp6IfUvDWZup2zD+QxNBzVV2M4Jgjjemr61m5fl6lomsF4yl4F
         Q3YGeVnzKIUybE/bfW3YmG/7vk5s8nNSBaYBQIBTkEt1+m4I4Q9dQ5/0xBuyw74ag6tO
         rc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769075032; x=1769679832;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6ZgQHfjrDjWEfMOq63jsxR+PhNdjaZ5C3nYexbwyrk=;
        b=shoruM9WxfBJoGC+qj74RzGegsm4LSnwuixmqDGn1RvpQ9/DmNVaNUiNdj0PMUd3+y
         soy/81DFC37tfsxaqoI0rSbwhwk1HtEH0Z93NSJVMyIIy0XdtFjJqhPZnmpzG/FpnSek
         kaw0ZWd+PcpGjHZIiCfWOM9YBbvYX/6YWDunUMGBC5JOXZS6vB4Ajyy48Qq/QXwtMYbp
         Xvl5MeX+ScCV9tanqhtLjtjL/lQ1ZML022OKQ47IlPNToBv+6resxu5Zgm4BV8G27BJ4
         eboQeRxk9eRi7fwb0qtJZYpY4HG2SQtNRbnbakLhqaRpQ7Ur2IfJvwf4wi5Cr1HjtpUO
         gt4A==
X-Gm-Message-State: AOJu0Yw+uEuTnh7STHF6Pg6vf5/QroX+Q7BpjnOQ28A4qp3zTEeZ0kaO
	7QbWLoN/cT1C3TU0VWU40sX9dGQzEERnweJ+CkMfQ34KIYg8AQ40EqeSuojBxjsEubUe8LzXbKh
	XF+k=
X-Gm-Gg: AZuq6aLkNToiUNYWiYUEi3+S1YRgY5c396sOYo/T7Nc7a/NxYAEI71ARL0SS/ghAg85
	kqLbhkauvpMmMELsW/OqXY7X2dO1NaGocPigHMlaDdabUU3Fi5xpAVZIaofH0IxazKT+cTNMLF/
	v1fMo2rKF2ZWAc1m7vG2pVva9b+l1qwqQ7UHSiXufBntTufONTu0TYeoKsNfYYmbzz1rOgQErPl
	lxUrAMNLtC2CNll0b+u+nOFeiPg5JCXnzbHiiWBo1x4PCo/AgohcXvAn5jc/ckgNJXMZxaCLz31
	5IT6rUwgFOHo1hz9FWrWCndMyibv6d+xK0TN2YJy0nfHvkhaOIL7iAUEoV0tZDLqvms82UYhD8W
	4MyfJOtPWjGg4wz1q7+lKUobQ+GxNxnCkW6FcOgU0IDab1gUlIV9DTXyq6/2Nrk+AkJvd7H14yT
	XVzkhFirQk18NgPGA45Jl/08veEO4Ro/N1uPpFfrzBFAyU3zQp/nS6Xo6vkIOgYbB1GN4eSL+wP
	Kc=
X-Received: by 2002:a05:600c:8b67:b0:47d:3ffb:16c9 with SMTP id 5b1f17b1804b1-4801e342091mr235179655e9.23.1769075032572;
        Thu, 22 Jan 2026 01:43:52 -0800 (PST)
Message-ID: <715604a8-265b-4832-8001-1a2dbdc870bb@suse.com>
Date: Thu, 22 Jan 2026 10:43:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/5] cpufreq/amd-cppc: move pxfreq_mhz into driver data
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
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:Penny.Zheng@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid];
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
	RCPT_COUNT_THREE(0.00)[4];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 80A8A64C6D
X-Rspamd-Action: no action

No reason for it to be a separate per-CPU item; it's connected to a
struct cpufreq_policy instance just like other driver data.

This also eliminates the concern over amd_cppc_cpufreq_cpu_init() being
called for all CPUs, or a CPU going offline that's recorded in policy->cpu
(which would result in accesses of per-CPU data of offline CPUs).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/acpi/cpufreq/amd-cppc.c
+++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
@@ -30,11 +30,6 @@
         printk(XENLOG_DEBUG "AMD-CPPC: CPU%u " fmt, cpu, ## args);  \
 })
 
-/*
- * Core max frequency read from PstateDef as anchor point
- * for freq-to-perf transition
- */
-static DEFINE_PER_CPU_READ_MOSTLY(unsigned int, pxfreq_mhz);
 #ifndef NDEBUG
 static bool __ro_after_init opt_active_mode;
 #else
@@ -117,7 +112,7 @@ static int amd_cppc_khz_to_perf(const st
     {
         /* Read Processor Max Speed(MHz) as anchor point */
         mul = data->caps.highest_perf;
-        div = this_cpu(pxfreq_mhz);
+        div = data->pxfreq_mhz;
         if ( !div )
             return -EOPNOTSUPP;
     }
@@ -160,7 +155,7 @@ static int amd_get_cpc_freq(const struct
     }
 
     /* Read Processor Max Speed(MHz) as anchor point */
-    mul = this_cpu(pxfreq_mhz);
+    mul = data->pxfreq_mhz;
     if ( !mul )
         return -EOPNOTSUPP;
     div = data->caps.highest_perf;
@@ -287,7 +282,7 @@ static void cf_check amd_cppc_init_msrs(
     }
 
     amd_process_freq(&cpu_data[policy->cpu],
-                     NULL, NULL, &this_cpu(pxfreq_mhz));
+                     NULL, NULL, &data->pxfreq_mhz);
 
     data->err = amd_get_cpc_freq(data, data->cppc_data->cpc.lowest_mhz,
                                  data->caps.lowest_perf, &min_freq);
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -145,6 +145,12 @@ struct amd_cppc_drv_data {
 
     uint8_t epp_init;
 
+    /*
+     * Core max frequency read from PstateDef as anchor point
+     * for freq-to-perf transition
+     */
+    unsigned int pxfreq_mhz;
+
     int err;
 };
 


