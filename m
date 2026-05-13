Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHXzCPMdBGpyEAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 08:45:07 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 859FE52E35B
	for <lists+xen-devel@lfdr.de>; Wed, 13 May 2026 08:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1307616.1579217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN3Ks-0004k2-ER; Wed, 13 May 2026 06:44:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1307616.1579217; Wed, 13 May 2026 06:44:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wN3Ks-0004hT-Bi; Wed, 13 May 2026 06:44:50 +0000
Received: by outflank-mailman (input) for mailman id 1307616;
 Wed, 13 May 2026 06:44:49 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1wN3Kr-0004hL-Dx
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 06:44:49 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wN3Kq-001RW2-CS
 for xen-devel@lists.xenproject.org; Wed, 13 May 2026 08:44:48 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a041dd4-2eae-0a2a0a5409dd-0a2a450c9570-48
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 08:44:48 +0200
Received: from [209.85.128.52] (helo=mail-wm1-f52.google.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a041de0-62f1-0a2a450c0019-d1558034e181-3
 for <xen-devel@lists.xenproject.org>; Wed, 13 May 2026 08:44:48 +0200
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso57796565e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 May 2026 23:44:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fcdf6408bsm29081335e9.3.2026.05.12.23.44.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 May 2026 23:44:47 -0700 (PDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=google header.d=suse.com header.i="@suse.com" header.h="Content-Transfer-Encoding:Autocrypt:Content-Language:Cc:To:Subject:From:User-Agent:MIME-Version:Date:Message-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1778654688; x=1779259488; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZUrH8i/YVTA1yhjN7VVQDsPDHU1txiZ6leU/AQLk+WA=;
        b=auMjt5Z3H3LYAK3irQq1Fxjq6qFNb0ef5GtxP8nDjvOC90Ddx5gyviCAxq7Y/XB0c/
         oacaH57TB02ML2lv/ZP0Ta17aTqC2oVRUXBqlkHJvAhyRxrARjLropbPEJnnnLzTe8+1
         9hhZK5sCwXk5MRFv3reVupJpKVuQs20pBnCUeDhSJbxa1WJZv/XzjYCjQfrfvour54CL
         O0VLntkpJr29SojPri5rAF6O+YAXvCY0qhKw5lpg3/+4d+J2yr0dNHp5Nix2XxVUf/Nv
         HkFhF5AMCveBYsP73g2Pr8zicBrjS+UJ1ewd9dfD/EooD2FVhB5zXm5Zs6Rl4Gz5Jm4l
         LTiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778654688; x=1779259488;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZUrH8i/YVTA1yhjN7VVQDsPDHU1txiZ6leU/AQLk+WA=;
        b=Ch9Q4CO7X5djI3eAu40Rl41HoYHYQ7kgWQWjEi/6420KvwxJMwjc8XWNo8dEXw6DjP
         XiISG4m/ilg9GsldWDSr0ngLW4rq6aYPvmbx/9ULI9mBHwSF7T6LMKBTZa4LgVD5ir4l
         sW7GAdjZ4QXWVXKLeUHtwcJlp0udgEtJJYI0HZJEhvEhySFKXPRtrB24NG5jt7jrrmRS
         59dmfD5lEltNW4k+KOjKG2SVttVH0qEOe3lkYK4mm/9WSy4kw7Iey6qB7NSY7jYFlHQ7
         RteN/KWN8FrkmJBVRiqh1jDF9RVvI0GbfDGOHvngVJHsqEescHwmBRoJIc35Gup0NucX
         cGXQ==
X-Gm-Message-State: AOJu0YxSJPatc4LZ6Twdhu1THr0JAJ/zM06hbhPCeENAGwhImtYy8Fhk
	MdzkbFSJGRp545Ft4QeE/HQOf+GjntJR6m++VQf6auep0/S7MK4wwD9unyNi3G+S3gYa4s/zZ/9
	Hrac=
X-Gm-Gg: Acq92OHnemjy6UVj7RUJpbYM8KPVU15rVI1lUVT8K47PeSvanKo3dPe8ojyNCnV9SRy
	90bS8iy9/wet//sF4kfLWkC44LsFWCIKVISAuqsS8Y6l473uBMPmTcM6+VAuispCA98Ic+stg5f
	tX9Zjn4KTJNOV/riIsZxBjPBeECSmOzDHn3uDBUY7COBfhZSl252Z0s1K4L86IHT+zWMrlRb0y0
	eUvHDLSgsWNWKg+FaNrtIRWPXmCc6YDikf5vvMFGlNc1BS2j+YB4Y38NvChs4yb31jBsUPfaIzK
	gpivo8y/mU4YhukZP1Ij6VxdRITkV95n4gD8Pg8OgV8JVOKPsmNZbGwLeUYRCOqkjggoHKBlXRx
	Gs+SQu+ttBNdB/c9drIcbiMpsGwCjUZxP0ihcM8aI5RSh7JytAJ5UUo8l+1fPYacjTtqpaCY9RM
	mvweGUQPWqwIMBCUe9Bjb63XfFcrcX/BymQogCjQydJshAcnOID0MfZEOq2W39eV7+7viFT9XVk
	4ZZZzOwP3/vhSU=
X-Received: by 2002:a05:600d:4:b0:488:a2ac:a34c with SMTP id 5b1f17b1804b1-48fce9d6283mr15741225e9.12.1778654687560;
        Tue, 12 May 2026 23:44:47 -0700 (PDT)
Message-ID: <68b1607a-f2a1-4f53-84c5-43c61eeb1869@suse.com>
Date: Wed, 13 May 2026 08:44:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 RFC] x86/time: avoid early uses of NOW() to return zero
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-d25034/1778654688-DA368CF5-9A085F9D/0/0
X-purgate-type: clean
X-purgate-size: 5826
X-Rspamd-Queue-Id: 859FE52E35B
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
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,citrix.com:email];
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
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

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
RFC: This breaks at least the TSM_BOOT case printk_start_of_line(), which
     checks for NOW() returning 0 (falling back to TSM_RAW in this case).
     For now I have no idea how to avoid this; perhaps that's tolerable at
     least in the case where we put in place an early estimate? Should we
     maybe weaken the fallback condition to take effect for any value
     below 1μs?

RFC: While generally the mentioned waiting loops will take longer to time
     out, on a very fast CPU tight loops may time out too early.

RFC: For the AMD/Hygon case, if the "nominal" value isn't available, we
     could use the "high" one. That would cause NOW() to run too slowly
     (until the scale is properly set), but maybe that's still better than
     it returning 0? (As it stands, I can't really test the new code
     there, as my Rome system only supplies the lo/hi pair of values.)

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
v2: Add assertion to get_s_time_fixed(). Use nominal frequencies for very
    early setting, if available.

--- unstable.orig/xen/arch/x86/cpu/common.c	2026-05-13 08:35:28.640503356 +0200
+++ unstable/xen/arch/x86/cpu/common.c	2026-05-12 12:30:35.475284195 +0200
@@ -19,6 +19,7 @@
 #include <asm/random.h>
 #include <asm/setup.h>
 #include <asm/shstk.h>
+#include <asm/time.h>
 #include <asm/xstate.h>
 
 #include <public/sysctl.h>
@@ -403,6 +404,25 @@ void __init early_cpu_init(bool verbose)
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
+		}
+	} else if (c->vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) {
+		unsigned int nom_mhz = 0;
+
+		amd_process_freq(c, NULL, &nom_mhz, NULL);
+		if (nom_mhz)
+			preset_tsc_scale(nom_mhz * 1000000UL);
+	}
+
 	eax = cpuid_eax(0x80000000);
 	if ((eax >> 16) == 0x8000 && eax >= 0x80000008) {
 		ebx = eax >= 0x8000001f ? cpuid_ebx(0x8000001f) : 0;
--- unstable.orig/xen/arch/x86/include/asm/time.h	2026-05-13 08:35:28.640503356 +0200
+++ unstable/xen/arch/x86/include/asm/time.h	2026-05-12 12:25:14.435489339 +0200
@@ -23,6 +23,7 @@ mktime (unsigned int year, unsigned int
 int time_suspend(void);
 int time_resume(void);
 
+void preset_tsc_scale(unsigned long freq);
 void init_percpu_time(void);
 void time_latch_stamps(void);
 
--- unstable.orig/xen/arch/x86/time.c	2026-05-13 08:35:28.640503356 +0200
+++ unstable/xen/arch/x86/time.c	2026-05-13 08:33:54.000000000 +0200
@@ -1655,6 +1655,9 @@ s_time_t get_s_time_fixed(u64 at_tsc)
     const struct cpu_time *t = &this_cpu(cpu_time);
     u64 tsc, delta;
 
+    /* scale_delta() degenerates when the scale wasn't set yet. */
+    ASSERT(t->tsc_scale.mul_frac);
+
     if ( at_tsc )
         tsc = at_tsc;
     else
@@ -1670,6 +1673,20 @@ s_time_t get_s_time_fixed(u64 at_tsc)
 
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
 
@@ -2623,6 +2640,21 @@ int __init init_xen_time(void)
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
+}
 
 /* Early init function. */
 void __init early_time_init(void)
@@ -2640,6 +2672,9 @@ void __init early_time_init(void)
                    "TSC ADJUST set to %lx on boot CPU - clearing\n", tmp);
             wrmsrl(MSR_IA32_TSC_ADJUST, 0);
             boot_tsc_stamp -= tmp;
+
+            if ( t->stamp.local_tsc )
+                t->stamp.local_tsc -= tmp;
         }
     }
 

