Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9028BCF8A69
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 15:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196182.1514058 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7bn-0003a2-Ip; Tue, 06 Jan 2026 14:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196182.1514058; Tue, 06 Jan 2026 14:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd7bn-0003YA-GC; Tue, 06 Jan 2026 14:00:27 +0000
Received: by outflank-mailman (input) for mailman id 1196182;
 Tue, 06 Jan 2026 14:00:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd7bl-0003Y4-R2
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 14:00:25 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0b86e8b6-eb08-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 15:00:23 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4779adb38d3so7683695e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 06:00:23 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dad8bsm4656713f8f.8.2026.01.06.06.00.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 06:00:22 -0800 (PST)
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
X-Inumbo-ID: 0b86e8b6-eb08-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767708023; x=1768312823; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mUKumA/eSvAXgzYPa6wZCvrzBSQf3BW7uOlRVhXEMGg=;
        b=ahGHzP6DLUcqQ7fs25W/EqeQt8s4MfqXr5yVHiWDwPYM1mQ16CfwqP4UO6O9kAke1A
         GystfiFUnFSsbcHraFm7EJ397l6yBNIkgVQL+Bb5xCfe377huKN0jzosuz5xHn33NAs/
         bbzqdd+UWCV3LOvGGD+JwUjU7P9jTSV+XwVz6XKvbwNPU15FOGYG5M5xaxspmEvEKj2U
         oIubnZF1Jtqydi5abVw4455pbyrdUyQbnlbvzX48V2/uCC2l8a0vFXYFUlZud+H+ttTz
         wzhLQszQxf6winYCzO8cyXFRQSe24nHuhNydcLFhFB6HcA8YL4ck7Jl8prkhqMoHbI3D
         oWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767708023; x=1768312823;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mUKumA/eSvAXgzYPa6wZCvrzBSQf3BW7uOlRVhXEMGg=;
        b=T2JKVOd81wwq69GpQKYcAWcHRkSFiMc1k3diVUYsCmkzX2bs8ieTfl6Yg0N2HCfb7h
         LJ1EXXsVe2nUR+sHq1I7Foh3pYKB4EojRyIBjgakz2m90ZNurbi74N58BAeIvJogba7z
         RZyeQMaPothzY/0FXTOY31ki9F8FEcsMfQSYD646KrJyFKIW5p1wEyEIe47A1U8K8AjX
         EsEngZX2D18pZur4R1o2ADBo4orVonVGhmtvFeHIW0mERuBBiGyquC7sA3TY+euchaXF
         ClwBCCRxzOK9hzZOJO/8CFJlYBH9h+Rf8LMWQEBlgaUH4nHfbbXNXkJvjpJpiOttHsfs
         iZXw==
X-Gm-Message-State: AOJu0YzkV+ZMVqbhc18Ddg0a0RtBxNlM3JhjNpOeP6Nb6tYLF5M8p2aO
	gWg7eRXcli3MM9nCnTkMKHu2DL9PMCTS8acV0oCuPMAOgccC0BVzwjDknEoxaORrI9OwxbYkb47
	QR80=
X-Gm-Gg: AY/fxX5UMPjB7uNTOr2L9SbuSJDNSOvadfhPJe7SWtw/VctI/up1rxKvTusl1RDBh5s
	65y9QPR7Rszi3yZMTmhq7Vdv0Fq/upNU9B31YRNavRrOU9kQm1CL33XyOVtVdqf2g+povb69b8Z
	gfgBvI8f70bA8n86z2hJc1glIMwR2V7bRpUM6gM1kS0Zgb4r4kF/rsIwAgx7LwQB57UFD8dj/iO
	AvwdS57VtnzUwK9CB1jPDU8NHsmvBfKlzQvgDuEdvZBErNXk0JjyUcIN+Lv70OdYMUU3cqUG3N/
	s7NB/W8ZHFzjkHui+gs6kvIiyOYUHQ6IUwumRPHdUcQXX2cs2CiaUCHXNRTzW4ptxtupPvudOTS
	WTcHyy3nSA6lrWVpRX7XfZhQmY7bevOTu3ZqL8HYFAsdRyrrXn+QVuF1li9F3+jErCvHLm4wpVr
	Y8sboNNzLrc+Lmqxis8CC+lGJvzCexL3V3pxJyl9mpwTWSl3pJRDeQQFmNjh8ThXq82bpgSIDEz
	hY=
X-Google-Smtp-Source: AGHT+IHY95kcdHPxzm5HEAVWP8bxzJnA+ZrGdPY3OXpzuMGfiL6929Ime8G2sAWu9aPCN/sb41102g==
X-Received: by 2002:a05:600c:1384:b0:477:fcb:226b with SMTP id 5b1f17b1804b1-47d7f05d468mr31298525e9.2.1767708022953;
        Tue, 06 Jan 2026 06:00:22 -0800 (PST)
Message-ID: <5467f5c4-e752-4d44-bbb7-05e6fa1a672c@suse.com>
Date: Tue, 6 Jan 2026 15:00:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/5] x86/time: pv_soft_rdtsc() is PV-only
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
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
In-Reply-To: <66a53368-9c33-436c-858e-2b2d25ae84b7@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Omit the function when PV=n, by moving it to the sole file using it, thus
allowing it to become static as well.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/time.h
+++ b/xen/arch/x86/include/asm/time.h
@@ -37,8 +37,6 @@ uint64_t cf_check acpi_pm_tick_to_ns(uin
 
 uint64_t tsc_ticks2ns(uint64_t ticks);
 
-struct cpu_user_regs;
-uint64_t pv_soft_rdtsc(const struct vcpu *v, const struct cpu_user_regs *regs);
 uint64_t gtime_to_gtsc(const struct domain *d, uint64_t time);
 uint64_t gtsc_to_gtime(const struct domain *d, uint64_t tsc);
 
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -874,6 +874,20 @@ static uint64_t guest_efer(const struct
     return val;
 }
 
+static uint64_t soft_rdtsc(
+    const struct vcpu *v, const struct cpu_user_regs *regs)
+{
+    s_time_t old, new, now = get_s_time();
+    struct domain *d = v->domain;
+
+    do {
+        old = d->arch.vtsc_last;
+        new = now > d->arch.vtsc_last ? now : old + 1;
+    } while ( cmpxchg(&d->arch.vtsc_last, old, new) != old );
+
+    return gtime_to_gtsc(d, new);
+}
+
 static int cf_check read_msr(
     unsigned int reg, uint64_t *val, struct x86_emulate_ctxt *ctxt)
 {
@@ -920,7 +934,7 @@ static int cf_check read_msr(
         return X86EMUL_OKAY;
 
     case MSR_IA32_TSC:
-        *val = currd->arch.vtsc ? pv_soft_rdtsc(curr, ctxt->regs) : rdtsc();
+        *val = currd->arch.vtsc ? soft_rdtsc(curr, ctxt->regs) : rdtsc();
         return X86EMUL_OKAY;
 
     case MSR_EFER:
--- a/xen/arch/x86/time.c
+++ b/xen/arch/x86/time.c
@@ -2848,19 +2848,6 @@ uint64_t gtsc_to_gtime(const struct doma
 }
 #endif /* CONFIG_HVM */
 
-uint64_t pv_soft_rdtsc(const struct vcpu *v, const struct cpu_user_regs *regs)
-{
-    s_time_t old, new, now = get_s_time();
-    struct domain *d = v->domain;
-
-    do {
-        old = d->arch.vtsc_last;
-        new = now > d->arch.vtsc_last ? now : old + 1;
-    } while ( cmpxchg(&d->arch.vtsc_last, old, new) != old );
-
-    return gtime_to_gtsc(d, new);
-}
-
 bool clocksource_is_tsc(void)
 {
     return plt_src.read_counter == READ_TSC_POISON;


