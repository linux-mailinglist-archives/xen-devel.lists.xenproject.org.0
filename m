Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB0ECC1ADE
	for <lists+xen-devel@lfdr.de>; Tue, 16 Dec 2025 10:00:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187686.1509027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVQvK-0007o2-KR; Tue, 16 Dec 2025 09:00:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187686.1509027; Tue, 16 Dec 2025 09:00:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVQvK-0007mD-Gr; Tue, 16 Dec 2025 09:00:50 +0000
Received: by outflank-mailman (input) for mailman id 1187686;
 Tue, 16 Dec 2025 09:00:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t3Kb=6W=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vVQvJ-0007Zr-AQ
 for xen-devel@lists.xenproject.org; Tue, 16 Dec 2025 09:00:49 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b61e41ef-da5d-11f0-9cce-f158ae23cfc8;
 Tue, 16 Dec 2025 10:00:47 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so31421065e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 16 Dec 2025 01:00:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47bd9916e2fsm4597785e9.5.2025.12.16.01.00.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Dec 2025 01:00:46 -0800 (PST)
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
X-Inumbo-ID: b61e41ef-da5d-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765875646; x=1766480446; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=d4tQcge0hF7MWF0aMXeEVsKhmfL0PvFJFpDgzrjSnCU=;
        b=RLQ2jya3Z97dPpBroM6VAAyyCyJFKzKK8rgpnDLnNIs+fbnh3wAYlraWKjq9lRpkEm
         Hd9KHUtmgZD1TtqWlXX0H2xkwH8d6o6QDOyZ+WUlgEbO0jX1FbWt/AtIqTi6zOizN75B
         W2bjFZnp6gvPqlbg47FFp8YlFKxIgBpvhvn+QE/pYnnqomvlxMu6lgBKriypbsKq9Du6
         Hok4ClTkXT8Qvv2kGmYlsX3WDMKZgH2R0iLjvWAw7YF5KML1V73zj/KN3LYooNFjlVwZ
         r/M7vr3cuHv1fnnXTHOLjYp9vzayjdb9zm0ZCiT/cVp+K3VuruwRLj78GnJr8FlH11k8
         R7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765875647; x=1766480447;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d4tQcge0hF7MWF0aMXeEVsKhmfL0PvFJFpDgzrjSnCU=;
        b=w1fk8GdKe3jb5awki204KKlxcyY9gYSXCv4Ks2i8JGARjRRT7LrbzupSnxyzFG+CE2
         GHBBYjqcDDHxUigo5wcN3sMVwXgnxC/OlTA86R5u/4biEnHNrJ/1C0jHfF+QmPPAL4KA
         ohZ+OFUv1PIf3BwWNmG0+fD3gmZzV7mqphiECrse52Z5qKaGA/Y1KA9+whPsIN3K+th7
         RWIYvStTvGrLC05G/H8932atW3JiRVjSUQLtOr+n8s/OhMeHoF5TFikfukxqV0JtFhFa
         uwtv3c/Mmu7yzAjwJgAJXjynfr8dM3VFw3JPIVPZwnn+tke0Y1td4r/ZuF9QeavrldZT
         XKWw==
X-Gm-Message-State: AOJu0YzJlF4gLq/+rpEmknN58Z8YibEXwmfqqdiQ+O4j96j7hli3BVgi
	rDvvxVgCzUcLIYEjXv1hAcyhn447lTNmAomoTjnWVDFy3iNnWfA//W+nSvBhBDns/5HBPpc2guv
	jOhQ=
X-Gm-Gg: AY/fxX6RDldowu3qvJO3NROqNezLE+s2SOGtfrAyKjFna0NX7QD8m7NawqOlNW3oRUs
	9KFBA23L2Ma5vGJvWUm29FawEY3twdlWDlk9aKljcykGpyQuSwaa9PcD15dsrGDyCyXJG3Qeeu6
	Wrh8d+YPVeIAlHNuGYajpCJqtmNZxHp6LO6BbXy/u7UoqHacsRWpmo3rgS0Nx1Z7wCUyUocakWL
	H8Rr0xlhIW1gWiy/h2EVuM2/3MB89B547fJmt/7UAY85VdlktruVQ57J0lEo/OYHuvuNbBy575e
	JbaOS3rSJBF2abW7115Zka21RQ1wVgVw/Nzqo85ujUIamnY7IpNdxbzDrgp7It3dQJIm2LP0UaT
	balaI87/9ifSdwa1STy/1ilkw2Mo8Juss8sfRmR8iPwWL7+PoEiDxs0Cfyg3xEU7Or5B5V3IdPu
	4KYJ2LrMVHzs+f9GKarqg/ZpqnfO19zwiVHbQdSjBOaJgNLCPuFlHiJH+yrH+sdZSe0mfFK2Sq/
	eY=
X-Google-Smtp-Source: AGHT+IGJHL5RLd30zf0JSbGYinJ6vL5i0Ozc8VdPFHpxIIiHs/t4bj/S/D6w9NJT4fiiOfTueJnCjw==
X-Received: by 2002:a05:600c:64ce:b0:479:1348:c61e with SMTP id 5b1f17b1804b1-47a8f907f4amr129494445e9.20.1765875646501;
        Tue, 16 Dec 2025 01:00:46 -0800 (PST)
Message-ID: <87fb2107-d1f7-4cca-8efa-0b0c685f3e4c@suse.com>
Date: Tue, 16 Dec 2025 10:00:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/2] x86/AMD: disable RDSEED on Fam17 model 47 stepping 0
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <0b15a3fb-6ce4-4bf7-a235-073742fff35d@suse.com>
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
In-Reply-To: <0b15a3fb-6ce4-4bf7-a235-073742fff35d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This particular variant has an error that causes RDSEED to always return
0xffffffff, while RDRAND works correctly.

Inspired by Linux commit 5b937a1ed64ebeba8876e398110a5790ad77407c
("x86/rdrand: Disable RDSEED on AMD Cyan Skillfish").

Like for RDRAND, permit a command line override to be used to keep
RDSEED enabled.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Teddy Astie <teddy.astie@vates.tech>
---
Considering how it is described, I didn't think probing RDSEED (like we
do for RDRAND) would be necessary.

Am I going too far in also updating cpuidmask_defaults here, or is us
not doing so for the RDRAND disabling actually an oversight?

Using warning_add() may not be quite appropriate, as we don't really
mean the admin to possibly override this with "cpuid=rdseed" (that's
only a last resort, in case the issue is yet more limited in scope). But
mere printk() would feel like hiding the information in the middle of
lots of other output.
---
v2: Correctly check model, not (again) family.

--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1102,6 +1102,24 @@ static void cf_check init_amd(struct cpu
 		}
 		break;
 
+	case 0x17:
+		/*
+		 * Fam17 model 47 stepping 0 has an error that causes RDSEED to
+		 * always return 0xffffffff (while RDRAND works correctly).
+		 */
+		if (c == &boot_cpu_data &&
+		    c->model == 0x47 && c->stepping == 0 &&
+		    cpu_has(c, X86_FEATURE_RDSEED) &&
+		    !is_forced_cpu_cap(X86_FEATURE_RDSEED)) {
+			static const char __initconst text[] =
+				"RDSEED is unreliable on this hardware; disabling its exposure\n";
+
+			setup_clear_cpu_cap(X86_FEATURE_RDSEED);
+			cpuidmask_defaults._7ab0 &= ~cpufeat_mask(X86_FEATURE_RDSEED);
+			warning_add(text);
+		}
+		break;
+
 	case 0x19:
 		/*
 		 * Zen3 (Fam19h model < 0x10) parts are not susceptible to
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -123,6 +123,10 @@ static void __init cf_check _parse_xen_c
     else if ( feat == X86_FEATURE_RDRAND &&
               (cpuid_ecx(1) & cpufeat_mask(X86_FEATURE_RDRAND)) )
         setup_force_cpu_cap(X86_FEATURE_RDRAND);
+    else if ( feat == X86_FEATURE_RDSEED &&
+              cpuid_eax(0) >= 7 &&
+              (cpuid_count_ebx(7, 0) & cpufeat_mask(X86_FEATURE_RDSEED)) )
+        setup_force_cpu_cap(X86_FEATURE_RDSEED);
 }
 
 static int __init cf_check parse_xen_cpuid(const char *s)


