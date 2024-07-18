Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A5B934B81
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2024 12:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.760356.1170183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUO76-0001Pj-L6; Thu, 18 Jul 2024 10:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 760356.1170183; Thu, 18 Jul 2024 10:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sUO76-0001MY-IK; Thu, 18 Jul 2024 10:11:52 +0000
Received: by outflank-mailman (input) for mailman id 760356;
 Thu, 18 Jul 2024 10:11:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sUO75-0001DW-63
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2024 10:11:51 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 259795a5-44ee-11ef-8776-851b0ebba9a2;
 Thu, 18 Jul 2024 12:11:49 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2eec7e431d9so10205861fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 18 Jul 2024 03:11:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cb778cad11sm250403a91.3.2024.07.18.03.11.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 03:11:48 -0700 (PDT)
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
X-Inumbo-ID: 259795a5-44ee-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721297509; x=1721902309; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dAyS9ay24exWD+CAgeTQLy5cPo5E14zax0ZU9A4i84=;
        b=Q60Kg6e/NF4d2fgssqu4lOO6aHl2R51i/dSpj5+J9qGRFoq0AgS5NlmK4Pr+cMUryD
         FdJdQwqvDbTG7vH8n99F4upvLMiB+1unHi/nR/h9uB86zMQONz3WwoyaP/siTZgW4fDf
         EHKCSpgMIAQvPdV+GOlLXRwS0IUnexqciPGg0gD9SMPUUaiw0ArmmuUa7W2Dso2Rpaxz
         A2r780HqB6d0ixeKkAG1Pjpb6ogiWM87hmSWgbU/wAcIvkbOGtDDSTJNyvj9cRBCOxeI
         LaqFlUz/zbYiuTXZYYQzKg69bBBsRiU/66w6NwMJqKpPS7uwqzyaYRRDedEt0yoWGCrE
         8OlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721297509; x=1721902309;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5dAyS9ay24exWD+CAgeTQLy5cPo5E14zax0ZU9A4i84=;
        b=qO54mkv2AeERVsKJ7QrcyeWBuHcGjIaBx/46w301iko+UIZjhwmH7pJubL1v/+qDAt
         QEE0wtKCTNXVr+6nDP5RVivrNuJmF9wYegtc5VyqfwYNIDJ8Hf/aoN7iD6RM04PfpruF
         nGp3Z/Z5pNoQXsmEdgXqN6XR16eBEdJlA4sD/3MPbrAnquhJo7NtHKES+WXnxQ98eRpO
         eVvWwXGF1YkYQLrhQWBs5phiNioRK/PAjBZL2Jwau2dfy/TRXre/rOSZT2UyLjaGs/RA
         Zja+v2+2yzrPDsyR007hEcHekIX1SE2YE5gKl1lN4qY/tQ68CqCl+11zPyicR4e0f5Ae
         GP1w==
X-Gm-Message-State: AOJu0YzgDYXt4iICaINB3z6ESog+eza4FLHDprj++l+4txGVFLIDH+Tk
	XBf8Y/c9Dl8usadIKjhW/92A7X0DvwNeep777BLzweAz09P484b0QY46+Gsr+8UU6B9g3q0TRRc
	=
X-Google-Smtp-Source: AGHT+IH/pw1hZFkA7AZMyWfqswK9sZVCh5x4GxtzkLc9zUOjvJcKy04YgWsR/LXShwuYHQfEvfUCPg==
X-Received: by 2002:a2e:9b15:0:b0:2ee:44f7:cc74 with SMTP id 38308e7fff4ca-2ef05c53bcemr12842671fa.6.1721297509022;
        Thu, 18 Jul 2024 03:11:49 -0700 (PDT)
Message-ID: <3a6575b4-8b03-41ce-93e3-a874f23d6522@suse.com>
Date: Thu, 18 Jul 2024 12:11:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: don't open-code [gm]fn_to_[gm]addr()
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

At least in pure address calculation use the intended basic construct
instead of opend-coded left-shifting by PAGE_SHIFT. Leave alone page
table entry calculations for now, as those aren't really calculating
addresses.

No functional change.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/guest/xen/xen.c
+++ b/xen/arch/x86/guest/xen/xen.c
@@ -73,7 +73,7 @@ static void map_shared_info(void)
     if ( rc )
         panic("failed to map shared_info page: %ld\n", rc);
 
-    set_fixmap(FIX_XEN_SHARED_INFO, mfn_x(mfn) << PAGE_SHIFT);
+    set_fixmap(FIX_XEN_SHARED_INFO, mfn_to_maddr(mfn));
 
     /* Mask all upcalls */
     for ( i = 0; i < ARRAY_SIZE(XEN_shared_info->evtchn_mask); i++ )
--- a/xen/arch/x86/include/asm/guest_pt.h
+++ b/xen/arch/x86/include/asm/guest_pt.h
@@ -377,7 +377,7 @@ static inline paddr_t guest_walk_to_gpa(
     if ( gfn_eq(gfn, INVALID_GFN) )
         return INVALID_PADDR;
 
-    return (gfn_x(gfn) << PAGE_SHIFT) | (gw->va & ~PAGE_MASK);
+    return gfn_to_gaddr(gfn) | (gw->va & ~PAGE_MASK);
 }
 
 /* Given a walk_t from a successful walk, return the page-order of the
--- a/xen/arch/x86/mm/hap/nested_hap.c
+++ b/xen/arch/x86/mm/hap/nested_hap.c
@@ -134,7 +134,7 @@ static int nestedhap_walk_L0_p2m(
 
     rc = NESTEDHVM_PAGEFAULT_DONE;
 direct_mmio_out:
-    *L0_gpa = (mfn_x(mfn) << PAGE_SHIFT) + (L1_gpa & ~PAGE_MASK);
+    *L0_gpa = mfn_to_maddr(mfn) + (L1_gpa & ~PAGE_MASK);
 out:
     p2m_put_gfn(p2m, gaddr_to_gfn(L1_gpa));
     return rc;
--- a/xen/arch/x86/mm/p2m-ept.c
+++ b/xen/arch/x86/mm/p2m-ept.c
@@ -565,11 +565,10 @@ int epte_get_entry_emt(struct domain *d,
     if ( gmtrr_mtype == -EADDRNOTAVAIL )
         return -1;
 
-    gmtrr_mtype = v ? mtrr_get_type(&v->arch.hvm.mtrr,
-                                    gfn_x(gfn) << PAGE_SHIFT, order)
+    gmtrr_mtype = v ? mtrr_get_type(&v->arch.hvm.mtrr, gfn_to_gaddr(gfn),
+                                    order)
                     : X86_MT_WB;
-    hmtrr_mtype = mtrr_get_type(&mtrr_state, mfn_x(mfn) << PAGE_SHIFT,
-                                order);
+    hmtrr_mtype = mtrr_get_type(&mtrr_state, mfn_to_maddr(mfn), order);
     if ( gmtrr_mtype < 0 || hmtrr_mtype < 0 )
         return -1;
 

