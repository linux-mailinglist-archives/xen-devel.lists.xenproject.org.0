Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 270FEACED7D
	for <lists+xen-devel@lfdr.de>; Thu,  5 Jun 2025 12:24:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1006542.1385741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7m8-0003n2-BW; Thu, 05 Jun 2025 10:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1006542.1385741; Thu, 05 Jun 2025 10:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uN7m8-0003lJ-70; Thu, 05 Jun 2025 10:24:44 +0000
Received: by outflank-mailman (input) for mailman id 1006542;
 Thu, 05 Jun 2025 10:24:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qREP=YU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uN7m7-0003lD-FF
 for xen-devel@lists.xenproject.org; Thu, 05 Jun 2025 10:24:43 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b46800b-41f7-11f0-a300-13f23c93f187;
 Thu, 05 Jun 2025 12:24:42 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-442ea341570so4983345e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 05 Jun 2025 03:24:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afff70b5sm12562346b3a.160.2025.06.05.03.24.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jun 2025 03:24:41 -0700 (PDT)
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
X-Inumbo-ID: 4b46800b-41f7-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749119082; x=1749723882; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CCGJJ+18Hx71qZ1BImD3aJBlrhNSiedNN3y6oo5smPU=;
        b=GF7X7+tlnFvyN8NA1zazfNKkCmtE8tJXNwAtEl/ikNEwstsyrDmJyO2gkW/mfHaZ07
         uvaznPONxsOeoasAiT0Rg0Gc01edBALulSUGNmokdMiHnsPVusu53HQ3LAjuj8vCksko
         w/oFolNP6wwlXQIKz46qo5/HQcMd5Evu3aJ0/PbabpsW+nGRQuRb8g90EEQ1BFhnRLUP
         nMRZgpGAPqkUVAekfIJJ7xUCxH8sxnlIs7FRNiFQFHcLrCgOTGDENt4lfmYdNjXa0jss
         fYKkSi852ee0UrmSenUERpG5mQQsrspSKSPmWXtaDmxQiy0tHfG/2x5Hrdic7fBUz/Os
         bVZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749119082; x=1749723882;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CCGJJ+18Hx71qZ1BImD3aJBlrhNSiedNN3y6oo5smPU=;
        b=q8dOjvKBBfB6q7g+diJ3CdleyFGv8+S4gAOoriK1LwhNdxrM+scXkozW2jKbTWVT//
         b7nKmlrOfevl+GFAJDQN/UQ7DgXCySl2gRhYKQBLzo0mGswjxVDJlAUZ3FWq+UaY9h3P
         ocjZMtRtQt0Oi4357gX0o4ujQ84QrdIhBSM9teGhvZb6A9IA8U+zrAo9QcQ/HnrU0Pvy
         FlGoFvsWb5bYUtY8JHHgfDbREX59YwuB2nnNdIwR/LqiI0JGf45E5SE/3wLxbLznVmSh
         HXKbiR3FkcKmKw5kdv5Ndr4KxP4CnI4E1UN+CbpG4tR8rl8F1g0r+ua+X857dNLIDFul
         GUig==
X-Gm-Message-State: AOJu0YzXTVmAgOBTmQkYcbvmlpPK/Jz8dQihSkne5akcOuNg9T86AKBS
	2tRhMJF38E9uTZ92tP+3wc2Rqqvc6v3GI+h4YvLYCANcdoEpXWnoFkaak1O54RCtVoqDhnXYENv
	h5bw=
X-Gm-Gg: ASbGnctjKS1XuUg9/E/4T1jLEG+XTuoPPVYpl0dVAjKsTttkQdQIx/tsgz96vwZPn85
	VtG52AF6QWBPzz0i0G4CUL+m6ExYve2e7pZ7LdLLpiMvrk+q9HVPwuv72TAqXo9PXQWE9xIogQu
	KV8YOUKhNAXmDL8qFWROnU61ggbqhvvmqJsBjZa77c8SEHP6+2YnK4AwqRBrshtxZBRXhBnndH1
	Cttlc5RzZTj3jiiqSjPuZIwntAKId2HRrR88KeYkut2tAoZtz//Mmeu8k/OzSVU6mCq4lG72tn1
	G0xIa6cGoUoYGOq/pAKSD6CtyXlXykAjyzMncELJtHCDVCaGl9SxUW3T3nKfXaxBnrObbQlE6PV
	2pknlUH3mq7snQFF2QgKCk/9l8BZd8J1ySraEWXTX+aIOX18=
X-Google-Smtp-Source: AGHT+IHCcgv3vgC11pIaE8euNozBhtxqfc142zYW33hG7ykrV9v+UuFD9NqILRK4vpfVAlbQsyjLkA==
X-Received: by 2002:a05:6000:250f:b0:3a4:edad:2a59 with SMTP id ffacd0b85a97d-3a51d8f6a3bmr5700565f8f.1.1749119081922;
        Thu, 05 Jun 2025 03:24:41 -0700 (PDT)
Message-ID: <d292df93-eddb-4bad-b369-6035959a0095@suse.com>
Date: Thu, 5 Jun 2025 12:24:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v5 1/6] x86: suppress ERMS for internal use when
 MISC_ENABLE.FAST_STRING is clear
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
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
In-Reply-To: <73481cbf-337f-4e85-81d2-3487366cd822@suse.com>
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
v5: Correct guest_common_max_feature_adjustments() addition.
v4: Also adjust guest_common_max_feature_adjustments().
v3: New.

--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -366,8 +366,18 @@ static void cf_check early_init_intel(st
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
@@ -487,6 +487,12 @@ static void __init guest_common_max_feat
      */
     if ( test_bit(X86_FEATURE_RTM, fs) )
         __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
+
+    /*
+     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
+     * FAST_STRING is not set should not affect the view of migrating-in guests.
+     */
+    __set_bit(X86_FEATURE_ERMS, fs);
 }
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
@@ -567,6 +573,16 @@ static void __init guest_common_default_
         __clear_bit(X86_FEATURE_RTM, fs);
         __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
     }
+
+    /*
+     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
+     * FAST_STRING is not set should not propagate to guest view.  Guests can
+     * judge on their own whether to ignore the CPUID bit when the MSR bit is
+     * clear.  The bit being uniformly set in the max policies, we only need
+     * to clear it here (if hardware doesn't have it).
+     */
+    if ( !raw_cpu_policy.feat.erms )
+        __clear_bit(X86_FEATURE_ERMS, fs);
 }
 
 static void __init guest_common_feature_adjustments(uint32_t *fs)
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -493,6 +493,7 @@
 #define MSR_IA32_THERM_INTERRUPT	0x0000019b
 #define MSR_IA32_THERM_STATUS		0x0000019c
 #define MSR_IA32_MISC_ENABLE		0x000001a0
+#define MSR_IA32_MISC_ENABLE_FAST_STRING  (1<<0)
 #define MSR_IA32_MISC_ENABLE_PERF_AVAIL   (1<<7)
 #define MSR_IA32_MISC_ENABLE_BTS_UNAVAIL  (1<<11)
 #define MSR_IA32_MISC_ENABLE_PEBS_UNAVAIL (1<<12)


