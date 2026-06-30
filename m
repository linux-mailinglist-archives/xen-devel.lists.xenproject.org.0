Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XJkQFYDNQ2p3igoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 16:06:56 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B42FE6E5398
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jun 2026 16:06:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=suse.com header.s=google header.b=FX5sGYet;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=suse.com
Received: from list by lists.xenproject.org with outflank-mailman.1349012.1606806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZ6s-0006gZ-4T; Tue, 30 Jun 2026 14:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349012.1606806; Tue, 30 Jun 2026 14:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1weZ6s-0006e9-0B; Tue, 30 Jun 2026 14:06:46 +0000
Received: by outflank-mailman (input) for mailman id 1349012;
 Tue, 30 Jun 2026 14:06:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <jbeulich@suse.com>) id 1weZ6q-0006dU-1Q
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 14:06:44 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1weZ6p-001DQy-Ec
 for xen-devel@lists.xenproject.org; Tue, 30 Jun 2026 16:06:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43cd6c-2eae-0a2a0a5409dd-0a2a450bb082-38
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:06:43 +0200
Received: from [209.85.221.53] (helo=mail-wr1-f53.google.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <jbeulich@suse.com>)
 id 6a43cd73-ac48-0a2a450b0019-d155dd35c005-3
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 16:06:43 +0200
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4758b2a9e2aso514502f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 30 Jun 2026 07:06:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-475641e4659sm8380977f8f.12.2026.06.30.07.06.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 07:06:41 -0700 (PDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782828403; x=1783433203; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VjQBjU4tlaZc2czbe1uHDpNUNQT539ySugQmprLUVZ0=;
        b=FX5sGYet1vTEYctxXEU2pCrtRAitNGkUGHovGjbOab4mRCErDpnbsUnvW8jZbpDwJr
         8lLHDYfFBvWsSjFp7bVjLqX/3Gx0QrDQo7BtT83HOaT7KpmW/f1wE2OYpX/vMcuR6vFe
         7mIrW+/Oa5D41lJaTuGhnPKYvUBQfYlKAJ3XU+i2Bd0j4w3+7uSaNmYo+gdtOSszg40Y
         HB0LTJa0IOb1rViCtA8w7JCXFw3aP4+mpBIP23Y+D6zZSgc1U7/PL2hkTilWHX+jvBqP
         iesxEohz+cJEmMflKF9YvWq8x0+jUZNI+Iy+7WidK1HKI0gFeESoeCIuXyWywJdVo3NA
         DX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828403; x=1783433203;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjQBjU4tlaZc2czbe1uHDpNUNQT539ySugQmprLUVZ0=;
        b=bgCZVFz35VkYE2fh5fwP6ktEx7XaIpPUzOt4CsoT+co9WxvvnVQ9WdBvdtU7DI1acc
         dKCQlSG/GzyUpV+6ePAG637t8U7k26vnNSh09cs33fccsefFmtseXZm8emqx1tupGUaA
         w9SbHWX51U5vpcZJfeEr+3M1jjtbeYaILrO9ulaKAB4MwbW0RUuhlJXvVMs0VNLm+Nkq
         ImG7AJ4ctZlN9hpyPjDuG2uaq6jGiUi0ov5UgvMbY/8vzA+LDrS0UtC5hTU4R3bzbcVm
         sWu5wEYaAcnobGhC2Nt8JdysYuupwcYEArVX6MxiYnz/FC7CdfvQrazyFuSsa/+Dk3LJ
         0ChQ==
X-Gm-Message-State: AOJu0YxIjzN5owLcz2PIRh+BiCDQqQHsAm6BaH4fYuqo+QQbtzctTlt7
	Mv1p0G78SGafO2E7J5UcB47a2j+QHQ9cJ+miMsnpV2b4ewEho7Ky0Ckoe0nU6mpKXvqIj+fZ7oX
	d1rD2SQ==
X-Gm-Gg: AfdE7ckqSzPhOmnFi+x27C19YZh4PCBN5QguSbpu8W9gbUSjJLU23QCRqKcbrk65zWj
	Y8+ct9r/ZGowuZFXjXWqMST6Z02jO03KrZOS1sPdOH2VucXjW+ZslhRLGnDhZM3i731qJZJrnm+
	kDFeASDCdhDrhEzeClocKLeriuRNTJZU4e92zz4AG1qaeBdyoSQ8gae16yqYgvmtZ7Ijj5yQ79S
	8gGFCmWaFbQQiLN2QOpE07ZRz+6VE2V9G9PmT+l7Uc+7JTbZKn7rU9WvTE1k7m6NdznAiVGsKhs
	iFFwsK0AoEwKgTgCx4MzoH9rTc7a41eUdwxyPa5NWLZppFsOVPu5z+8VtVkzm3h0VOnAUzwXTCu
	MUA680amg/WT9EEc8SdIktHcOSqvdLWGenSly6pyeYCz00LHN/hXJsR10UlqVfEeGMAYMDyR9tT
	08ay4zoyP6Ed4aYfoyxbKGj6b6i/g59GHqKbghJp0zpY9HI4c22EnMxnmUTMA78a8eW5LfWiFmN
	V/D
X-Received: by 2002:a05:6000:248a:b0:46b:7f57:7109 with SMTP id ffacd0b85a97d-47550f8e22cmr5238707f8f.20.1782828402457;
        Tue, 30 Jun 2026 07:06:42 -0700 (PDT)
Message-ID: <a53601c4-dab7-4d75-9cf0-323acc980ede@suse.com>
Date: Tue, 30 Jun 2026 16:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 3/3] x86/time: avoid early uses of NOW() to return zero
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Teddy Astie <teddy.astie@vates.tech>
References: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
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
In-Reply-To: <f5040939-b166-4050-9a27-117b772547d4@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1782828403-39D27220-25993D5B/0/0
X-purgate-type: clean
X-purgate-size: 6199
X-Rspamd-Action: no action
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:dkim,suse.com:email,suse.com:mid,suse.com:from_mime,citrix.com:email];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
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
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B42FE6E5398

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
@@ -23,6 +23,7 @@ mktime (unsigned int year, unsigned int
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
@@ -417,6 +417,9 @@ static inline uint8_t get_cpu_family(uin
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
@@ -1664,6 +1664,9 @@ s_time_t get_s_time_fixed(uint64_t at_ts
     const struct cpu_time *t = &this_cpu(cpu_time);
     uint64_t tsc, delta;
 
+    /* scale_delta() degenerates when the scale wasn't set yet. */
+    ASSERT(t->tsc_scale.mul_frac);
+
     if ( at_tsc )
         tsc = at_tsc;
     else
@@ -1679,6 +1682,20 @@ s_time_t get_s_time_fixed(uint64_t at_ts
 
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
 
@@ -2632,6 +2649,22 @@ int __init init_xen_time(void)
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
@@ -2649,6 +2682,9 @@ void __init early_time_init(void)
                    "TSC ADJUST set to %lx on boot CPU - clearing\n", tmp);
             wrmsrl(MSR_IA32_TSC_ADJUST, 0);
             boot_tsc_stamp -= tmp;
+
+            if ( t->stamp.local_tsc )
+                t->stamp.local_tsc -= tmp;
         }
     }
 


