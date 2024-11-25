Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5469D87E8
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 15:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842620.1258296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa45-0001vl-HE; Mon, 25 Nov 2024 14:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842620.1258296; Mon, 25 Nov 2024 14:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa45-0001uH-Di; Mon, 25 Nov 2024 14:27:49 +0000
Received: by outflank-mailman (input) for mailman id 842620;
 Mon, 25 Nov 2024 14:27:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFa44-0001uB-DI
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 14:27:48 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fc3251b-ab39-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 15:27:45 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-382296631f1so3581378f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 06:27:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349ef99e7dsm45167965e9.2.2024.11.25.06.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 06:27:44 -0800 (PST)
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
X-Inumbo-ID: 6fc3251b-ab39-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MzYiLCJoZWxvIjoibWFpbC13cjEteDQzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjZmYzMyNTFiLWFiMzktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTQ0ODY1LjAyNzUxNywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732544864; x=1733149664; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NRReWrcJj5Da4Nc3bL9CexPuuLrnGBxMVpXbGbnV/ww=;
        b=TLh8nSy0YZK9xc2iIT7vmX/J4LPc+X2OPTIjvMtb8KZNaIHyPnOebwbGwZd4NMkDRo
         hliHPB5Z3yDkvpFkxBjeJf8KkTwQ4FfwPMDPQkEGbzT1D+NZTHQ6+NRsPg//dl+eosJc
         3ks3Lo9x57A4LJlJ9QJeQAZ7NNhlMyTwegG076Hn27965E7Wwt1vtS4bNH0fnK0EeAhq
         Y+IIG7LA+rcMW64tLcmuMl40Y+MysKfuWRLbFA3XU+FOJn9a5Jr5/RrzQR21KN1cBjTr
         Z22S9xra9xq+iuMCp1qH4Ak1mds9ITDS7RpqGmkOYaN6zFoNLg87mQvwuwQAsE4paAzt
         p6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732544864; x=1733149664;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRReWrcJj5Da4Nc3bL9CexPuuLrnGBxMVpXbGbnV/ww=;
        b=elFb8X5/xPFKwCwB9JKY5XE0wVAqf8QJJYn8BDVqjeSYeICA+AJi8yqNWX3B3aqIwo
         m33j242kTPE0yvSGq8uP9eVN6gA51tQASOJ6S0Eks1s3UjOO4Aipn8iZkI/M0UQrXMgu
         TcGDDBnd6u8ehk1peC/6gh3Bi8pzxTREUx/I7hgGkUSs3Fi8If0CsjOYj1geE0RTfIdg
         +c8wOU+cJGJAbfxlbmEx03ID6CcKIKIpk0L6cqK3VSP0W+8t12aeuW4GKQe1UksprsDq
         OMXnz3tyCpmoXQFfhGrPPdRFWjRONNrWoM9sTW2zFHj/JwgjcDstePQqdnqQXVZTe+sU
         VxxA==
X-Gm-Message-State: AOJu0YyCtuTXMedya1ztvRQvT0V4+1WXKvMCGqkEP4wv6rqCt3EKBJRy
	wFmQ/9Vxyb9udtUXAq6CC8ncu7DN8s3t94OWMu2Exb7URKT0W++KQ58gfO6qsvla1p+eD5HUlfk
	=
X-Gm-Gg: ASbGncsCvoHS4wOrm/kMazwj5+TNuNeLMFc4ZHqZBaH2BRiDAhI8yD3/RG7pUQlieaS
	Yy4z7D8wOYdfRW8hCYi9NBQxcPNicef5pHSPBpoBOTpbQzxuvF/gCfNTRGRLAcKRZYTR6WQ6Sht
	OhwKGG7raX31mmRzZUWYFGTks1flMdVLs0+8lyfkTTz4kBnupi36RxlZotv3fRbKnPYsOgQHPMy
	5pApfzNTQAJGZF6rJEbgDZlEt8B8SpHduvRiek1o07OBJ5zPAtF9K+H+hT6Yb2OjyAegFvcq3ma
	At96ZMtEq2ldpDDE5vgpmefoiSvbFs7NiRY=
X-Google-Smtp-Source: AGHT+IE6gt4wT+roPSloQYVmoFkwiASYMWeOV0KJOla1Cq94LDvTW82s8b6OaaAN+L3KINOG478PmQ==
X-Received: by 2002:a05:6000:1a85:b0:382:4f34:ef7f with SMTP id ffacd0b85a97d-38260b8070amr10286575f8f.31.1732544864395;
        Mon, 25 Nov 2024 06:27:44 -0800 (PST)
Message-ID: <66aa8b0c-c811-483b-839e-49ca817a4672@suse.com>
Date: Mon, 25 Nov 2024 15:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/7] x86: suppress ERMS for internal use when
 MISC_ENABLE.FAST_STRING is clear
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
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
In-Reply-To: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Before we start actually adjusting behavior when ERMS is available,
follow Linux commit 161ec53c702c ("x86, mem, intel: Initialize Enhanced
REP MOVSB/STOSB") and zap the CPUID-derived feature flag when the MSR
bit is clear. Don't extend the artificial clearing to guest view,
though: Guests can take their own decision in this regard, as they can
read (most of) MISC_ENABLE.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
TBD: Would be nice if "cpuid=no-erms" propagated to guest view (for
     "cpuid=" generally meaning to affect guests as well as Xen), but
     since both disabling paths use setup_clear_cpu_cap() they're
     indistinguishable in guest_common_feature_adjustments(). A separate
     boolean could take care of this, but would look clumsy to me.
---
v3: New.

--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -337,8 +337,18 @@ static void cf_check early_init_intel(st
 		paddr_bits = 36;
 
 	if (c == &boot_cpu_data) {
+		uint64_t misc_enable;
+
 		check_memory_type_self_snoop_errata();
 
+		/*
+		 * If fast string is not enabled in IA32_MISC_ENABLE for any reason,
+		 * clear the enhanced fast string CPU capability.
+		 */
+		rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
+		if (!(misc_enable & MSR_IA32_MISC_ENABLE_FAST_STRING))
+			setup_clear_cpu_cap(X86_FEATURE_ERMS);
+
 		intel_init_levelling();
 	}
 
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -590,6 +590,15 @@ static void __init guest_common_feature_
      */
     if ( host_cpu_policy.feat.ibrsb )
         __set_bit(X86_FEATURE_IBPB, fs);
+
+    /*
+     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
+     * FAST_STRING is not set should not propagate to guest view.  Guests can
+     * judge on their own whether to ignore the CPUID bit when the MSR bit is
+     * clear.
+     */
+    if ( raw_cpu_policy.feat.erms )
+        __set_bit(X86_FEATURE_ERMS, fs);
 }
 
 static void __init calculate_pv_max_policy(void)
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -489,6 +489,7 @@
 #define MSR_IA32_THERM_INTERRUPT	0x0000019b
 #define MSR_IA32_THERM_STATUS		0x0000019c
 #define MSR_IA32_MISC_ENABLE		0x000001a0
+#define MSR_IA32_MISC_ENABLE_FAST_STRING  (1<<0)
 #define MSR_IA32_MISC_ENABLE_PERF_AVAIL   (1<<7)
 #define MSR_IA32_MISC_ENABLE_BTS_UNAVAIL  (1<<11)
 #define MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL (1<<12)


