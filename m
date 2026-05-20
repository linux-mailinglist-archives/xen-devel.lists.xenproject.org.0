Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LYJC1TJDWo33QUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:46:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD1F58FFB4
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 16:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314051.1584075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPiBv-0004Io-5s; Wed, 20 May 2026 14:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314051.1584075; Wed, 20 May 2026 14:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPiBv-0004Fp-2V; Wed, 20 May 2026 14:46:35 +0000
Received: by outflank-mailman (input) for mailman id 1314051;
 Wed, 20 May 2026 14:46:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wPiBu-0004Fh-F4
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 14:46:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPiBt-004SpS-RR
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:46:33 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dc939-e002-0a2a0a5209dd-0a2a4503e3f2-30
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:46:33 +0200
Received: from [209.85.128.41] (helo=mail-wm1-f41.google.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a0dc949-672d-0a2a45030019-d1558029c930-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 16:46:33 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so29462145e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 07:46:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4c8d39esm400931785e9.7.2026.05.20.07.46.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2026 07:46:32 -0700 (PDT)
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
        d=suse.com; s=google; t=1779288393; x=1779893193; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=m6/z6mQH97SLM9utUeJW3NmikHD9BAdeol1rvf0NTA0=;
        b=eBF8JHzDFJ2N+mz9sqBItemyRZGfha/Vd8HrB0OynbFEa/1eQhGSPTTfDGVhqOvNKF
         r3+HLLDKvPYI8obcAk908uyDyOJ3AVhceN7wTbJNIHdf5wIU57mY05KvFwH2QuqZ8MR4
         tAct1gNxwB9MnXX/ZKLmkzDRIU1kM+RyCLzmn3Ks3wxLG6VD0l2gxJAsWcv0miwCj3Sp
         LdjvgaKmd/Kafz2tyDtvOeROuFc3iV6BRrXA6ngG3FygEAYoB4mUD/QGICIHG6CWXoDA
         aIBEuDukxS5t5cPU3Pfdqo77NLIvD681D+7UBN3PVoFJewPuH6lqRr608wEgso4lq+Xq
         G+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779288393; x=1779893193;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6/z6mQH97SLM9utUeJW3NmikHD9BAdeol1rvf0NTA0=;
        b=qxm/uAh4tOR2/fbJLo7/9gNBcjsB2bcWmBRY8RyuYcYBU4mNowmjx/9ItzZDlLppkp
         Xbsg2GhE4zoXGPWixGRE/udosZCd3mUA1byildtN+hbKqI3BZ27WCL6fvWRArM//dqb/
         5vaq26lQ1HHWHJhUy7O6jY+98RpZxeb2IkhzociY4y1+A3nbiHAzu2ZOAXSCAFTP4kMV
         5lA+4ITQ0cNIUetSkuGgXJc23P4X5LJIhKnj8N7byeNjqDXUpjx+ZNWbhbvfan3qVEJL
         CdxqqqdCehEN83ZfK0VFjkb5QyFuCuB0k4IOUxOubUgAAoA8b/OEd0BwPPWEphQ5nGBN
         MHog==
X-Gm-Message-State: AOJu0YwFUcH3kzqEiHroUcnnlzG5CwFUsSQ+xrS/ovTgzJiuPCfjafrk
	/VzMSZTkxhN9He1LtrDa70c4NEcWQmoNTqDa9uNgTysslsNenZpJfVdbXS7s33j0q6JF3OBAF8Z
	SuEg=
X-Gm-Gg: Acq92OHDjS6M5x7H1vl/T8YYy63QVNggTClWQplySm0pzaQKPjY7Hdt5ReiBB920KQ5
	4Q9ekSRUk5ZIuj4HEandxrSIc+rm5HT6/I6vH6kcPKtnukI4lPMHDQJsZ4junM5XYa6sRZTPi3y
	BBtHqYixCKBEyTLcrEg3eZ3xhFdMi3ZJU226BLhXwU8M10rYFlJBCd+mInDw6OH9Ms7ZnkCe7HP
	RYLh8dTf6kpnICzNViP92GO33TAEYzbMUQCAdhsUpBBFSUbkdgMX/Fg5GOvNayj60wzuZMaORtq
	MLZ4DPBNT7vYUXmfbqywLkfnZHQRzm9UlIU+JbYhIV0mPCnEkIGRUX8sPBDy1yyrfxek1sH0KGN
	C7k+ye+V2GYiLno3W/vL21fwOMjqaIrJlDMYD/VT4//UlwO3eOUvUZpQOxLl9wIwhN7eS+ddmgB
	yIm2K8QtLl3GbyFh+VFNK25xyPFIefXDHiX6yKqckWPFkLqQD+375Dt+XYZTjKYxZnlj7UqIF+V
	zQBVv/ohdw7fTyA0Asz4kuagw==
X-Received: by 2002:a05:600c:3b27:b0:48e:7854:1608 with SMTP id 5b1f17b1804b1-48fe6516b54mr350190015e9.25.1779288393115;
        Wed, 20 May 2026 07:46:33 -0700 (PDT)
Message-ID: <7d59c238-4ff4-40aa-a050-37446bd3973f@suse.com>
Date: Wed, 20 May 2026 16:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH RFC v3 3/3] x86/time: avoid early uses of NOW() to return zero
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <a3e034a4-621a-45ad-9b96-9a85cbe5eafd@suse.com>
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
In-Reply-To: <a3e034a4-621a-45ad-9b96-9a85cbe5eafd@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-33051d/1779288393-3794D938-983638CA/0/0
X-purgate-type: clean
X-purgate-size: 6188
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo];
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
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8BD1F58FFB4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Waiting loops like the one in flush_command_buffer() will degenerate to
infinite ones when used early enough for NOW() to still return constant
zero. Make sure the returned value at least monotonically increases. When
available, use nominal frequency values as initial approximation.

Do this only in get_s_time(), as producing a sane value in
get_s_time_fixed() for non-zero inputs won't be reasonably possible.
Put an assertion there.

Reported-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
RFC: While generally the mentioned waiting loops will take longer to time
     out, on a very fast CPU tight loops may time out too early.

RFC: On the 2nd pass through early_cpu_init() it may be okay to skip the
     new additions.

With "x86/time: set AP's TSC scale estimate earlier" the counter update
may not need to be atomic anymore, as then only the BSP can reasonably hit
that path.

I don't think Fixes: tags should be put here. If we did, we'd have to
enumerate all introductions of early uses of NOW() (or get_s_time()), with
the exception of those dealing with getting back 0 (which I expect is only
printk_start_of_line()). Will want backporting nevertheless (unless deemed
too risky).
---
v3: Use "high" / "max" freq if "nominal" isn't available. Set NOW_good.
v2: Add assertion to get_s_time_fixed(). Use nominal frequencies for very
    early setting, if available.

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -19,6 +19,7 @@
 #include <asm/random.h>
 #include <asm/setup.h>
 #include <asm/shstk.h>
+#include <asm/time.h>
 #include <asm/xstate.h>
 
 #include <public/sysctl.h>
@@ -403,6 +404,36 @@ void __init early_cpu_init(bool verbose)
 				    &c->x86_capability[FEATURESET_7d1]);
 	}
 
+	if (c->cpuid_level >= 0x15) {
+		cpuid(0x15, &eax, &ebx, &ecx, &edx);
+
+		if (ecx && ebx && eax)
+			preset_tsc_scale(DIV_ROUND_UP(ecx * 1UL * ebx, eax));
+		else if (c->cpuid_level >= 0x16) {
+			/* Assume CPU base freq ≈ TSC freq. */
+			cpuid(0x16, &eax, &ebx, &ecx, &edx);
+			if (eax)
+				preset_tsc_scale(eax * 1000000UL);
+			else if (ebx) /* See preset_tsc_scale() for why. */
+				preset_tsc_scale(ebx * 1000000UL);
+		}
+	} else if (c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) {
+		unsigned int nom_mhz = 0, hi_mhz = 0;
+
+		amd_process_freq(c, NULL, &nom_mhz, &hi_mhz);
+		if (nom_mhz)
+			preset_tsc_scale(nom_mhz * 1000000UL);
+		else if (hi_mhz) /* See preset_tsc_scale() for why. */
+			preset_tsc_scale(hi_mhz * 1000000UL);
+	} else if (c->vendor & X86_VENDOR_INTEL) {
+		unsigned int hi_mhz = 0;
+
+		/* See preset_tsc_scale() for why. */
+		intel_process_freq(c, NULL, &hi_mhz);
+		if (hi_mhz)
+			preset_tsc_scale(hi_mhz * 1000000UL);
+	}
+
 	eax = cpuid_eax(0x80000000);
 	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
 		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -21,6 +21,7 @@ mktime (unsigned int year, unsigned int
 int time_suspend(void);
 int time_resume(void);
 
+void preset_tsc_scale(unsigned long freq);
 void init_percpu_time(void);
 void time_latch_stamps(void);
 
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -476,8 +476,8 @@ static int num_cpu_cores(struct cpuinfo_
 		return 1;
 }
 
-static void intel_process_freq(const struct cpuinfo_x86 *c,
-                               unsigned int *min_mhz, unsigned int *max_mhz)
+void intel_process_freq(const struct cpuinfo_x86 *c,
+                        unsigned int *min_mhz, unsigned int *max_mhz)
 {
     uint64_t msrval;
     uint8_t max_ratio, min_ratio;
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -414,6 +414,9 @@ static inline uint8_t get_cpu_family(uin
     return fam;
 }
 
+void intel_process_freq(const struct cpuinfo_x86 *c,
+                        unsigned int *min_mhz, unsigned int *max_mhz);
+
 #ifdef CONFIG_INTEL
 extern int8_t opt_tsx;
 extern bool rtm_disabled;
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -1661,6 +1661,9 @@ s_time_t get_s_time_fixed(u64 at_tsc)
     const struct cpu_time *t = &this_cpu(cpu_time);
     u64 tsc, delta;
 
+    /* scale_delta() degenerates when the scale wasn't set yet. */
+    ASSERT(t->tsc_scale.mul_frac);
+
     if ( at_tsc )
         tsc = at_tsc;
     else
@@ -1676,6 +1679,20 @@ s_time_t get_s_time_fixed(u64 at_tsc)
 
 s_time_t get_s_time(void)
 {
+    /*
+     * Before the TSC scale is set, avoid returning constant 0 (or whatever
+     * this_cpu(cpu_time).stamp.local_stime is set to).  While the returned
+     * value is in no way representing time, it at least increases
+     * monotonically, thus avoiding e.g. waiting loops to degenerate to
+     * entirely infinite ones.
+     */
+    if ( unlikely(!this_cpu(cpu_time).tsc_scale.mul_frac) )
+    {
+        static s_time_t counter;
+
+        return arch_fetch_and_add(&counter, 1);
+    }
+
     return get_s_time_fixed(0);
 }
 
@@ -2629,6 +2646,22 @@ int __init init_xen_time(void)
     return 0;
 }
 
+/* BSP-only function to pre-set an approximate TSC scale. */
+void __init preset_tsc_scale(unsigned long freq)
+{
+    struct cpu_time *t = &this_cpu(cpu_time);
+
+    /*
+     * The incoming frequency is only approximate (nominal).  Increase it by
+     * 1% to make NOW() output rather a little too slow than too fast, thus
+     * avoiding a possible backwards jump once the final scale is set.
+     */
+    freq += DIV_ROUND_UP(freq, 100);
+
+    set_time_scale(&t->tsc_scale, freq);
+    t->stamp.local_tsc = boot_tsc_stamp;
+    NOW_good = true;
+}
 
 /* Early init function. */
 void __init early_time_init(void)
@@ -2646,6 +2679,9 @@ void __init early_time_init(void)
                    "TSC ADJUST set to %lx on boot CPU - clearing\n", tmp);
             wrmsrl(MSR_IA32_TSC_ADJUST, 0);
             boot_tsc_stamp -= tmp;
+
+            if ( t->stamp.local_tsc )
+                t->stamp.local_tsc -= tmp;
         }
     }
 


