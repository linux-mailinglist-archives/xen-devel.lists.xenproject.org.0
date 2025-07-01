Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A58AEF16C
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 10:40:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029430.1403170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWWXL-0000VZ-3c; Tue, 01 Jul 2025 08:40:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029430.1403170; Tue, 01 Jul 2025 08:40:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWWXK-0000UV-VS; Tue, 01 Jul 2025 08:40:18 +0000
Received: by outflank-mailman (input) for mailman id 1029430;
 Tue, 01 Jul 2025 08:40:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWWXJ-0000UP-RS
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 08:40:17 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0337dcc2-5657-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 10:40:16 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451d41e1ad1so35159985e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 01:40:16 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c7041sm103060175ad.229.2025.07.01.01.40.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 01:40:14 -0700 (PDT)
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
X-Inumbo-ID: 0337dcc2-5657-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751359216; x=1751964016; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V49egurfxGhUt+YFGObMrLrwUe+j8XFxfbtdpRj9Y/s=;
        b=EjotngmuAUWSoQPlutwszunAKmr4jdgJ2ZzHPsuOs49c+wqFfRUYYxOYS4qf1YjVu/
         G/nLNE1vQbXgx65zOHc6HsNyvAjunq0tGq5bWyj2lp/hCIhTzdO4h6bPdV0DE/v7Mcp+
         vpbCpl+D6Jkfaw449itdVPDbds2OXud1gEDoGBTt+khp7cpl7+OE7Sjqlp0NFZfCN/O4
         HnF0TYUI6dl+AtoNiQvuVAZ8epgm4UkR+PniwHAv4T4P6ArlVGO0RFZNuOS0gHWzUTBT
         EZQ2boucaoxe+HgVWOCL0M1RaBzFe8CjRD726655V5Ltyp9D+z6pFfazBlUQ7g85EuYX
         TGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359216; x=1751964016;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V49egurfxGhUt+YFGObMrLrwUe+j8XFxfbtdpRj9Y/s=;
        b=wqHay6yo1Z6p5G1jUC5UxPlFNH+bgVIf7iAy12EcY0+2uVAzzjs/mWmjV29jk8CkfK
         ev8FEDht+QdOH6jRsu6LSqzz0j6jCRLimP2xlluTn6hNlfQDOWgkxMsL1h+NUjNSwrkr
         VyxwU/V00MsItUfDpzoXyQU1N2zxOBQyXGKcxKAdXqBGaLhNBV/6b3lwp+YGJ8bD4kpf
         5v9gNt7b2eyrDSECQsg4nzwDkZaMBL8frVCHU5oddv8R02YSaIjwVb6EcB1doC3kUDpN
         nB1WdtZ+si01kqpWguVNo/P4PxKRbGnOsSiwhqNOgI9yxWu+3mPDGS+4bD2kxE/6BjxM
         DS7g==
X-Forwarded-Encrypted: i=1; AJvYcCXFMOJqqlbEuoSlxFepjGPecxQbgc5f3mHhX/KzWm/H5DTG6NihzIdgUy67n5XBBQCRrZ3V0KSFwhs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7ZFBu2hAuRRDgDGKZ4/xXeq7cbFTxdwPEt+O0gx/sK+DH5wiy
	RtbdkJkUfTISikLvA04JXizMsLKyQgWH+23U3KDRDYxeAXT/TmrsjbzdpwEWIUoOTiSGc6WkKC9
	Ioew=
X-Gm-Gg: ASbGncvOqVSVZBvwImpi7DFt9rES5+BmjH4rltgPWx0ZRjoJQtNETGu6IPYsJbsBjA/
	T4D1KHJZNuAopIcrQuAW7il1JfEpNG73xAIB31XcypkM1sAGN91C+PjySG/dGQpN5MjZ3InARNw
	9BrqfgDp/Jo3yK2/XNPY1kaUdLhF9k4WCEmZ+srP+lqanYpHnrP0l9a5EOkCd4DFveZkGA5MJHp
	sGYo7B81MkoQGTJlIiY0LVsPjbE8XEgOjndSntULa1WAlM1i4Bq0TKzEmp8HCL885RcpM9o8AbO
	yrTXmZVHnJobS3EsejU0nnkWC0HH6lsWkqQr6D5xu0d1U0hlFTnaqi49YucLQK+8LYL2mV87WzE
	qLU7YCIOXuCW+uJCJ7HY5h7pXq0GpseS8agkn8C0GLZ9+wIY=
X-Google-Smtp-Source: AGHT+IExdL6kZJ1fmMAGQN5N8bFMNBQFGzEowKUIELDO9FrzLWbH9mHjvkBUoypJkIkPQ3ju3W1uwQ==
X-Received: by 2002:a05:6000:26c2:b0:3a5:2d42:aa25 with SMTP id ffacd0b85a97d-3a900854668mr13649315f8f.50.1751359215396;
        Tue, 01 Jul 2025 01:40:15 -0700 (PDT)
Message-ID: <3634a86d-5ad5-4144-b73a-b098770d6de5@suse.com>
Date: Tue, 1 Jul 2025 10:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpu-policy: Simplify logic in
 guest_common_default_feature_adjustments()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250627141907.525027-1-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20250627141907.525027-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.06.2025 16:19, Andrew Cooper wrote:
> For features which are unconditionally set in the max policies, making the
> default policy to match the host can be done with a conditional clear.
> 
> This is simpler than the unconditional clear, conditional set currently
> performed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Btw, in the context of some other work I came to remember that I have some
other, never submitted approach queued. I'll reproduce the raw patch (not
yet re-based over your change, and not pruned of ERMS bits) below, and I'd
be glad if you could tell me your opinion. I.e. in particular to possibly
let me know that this is all wrong, and hence not worth submitting at all.
It certainly has a nice negative diffstat (albeit that'll reduce some once
re-based) ...

Jan

x86/cpu-policy: defer setting certain bits in max policies

Instead of adding features to the max policies just to remove them again
from the (derived) default ones, defer such additions until after the
respective default policy was derived.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Of course this comes with the requirement that features forced on here
aren't having dependencies in either direction, as sanitise_featureset()
won't be run on the result. Would be nice to have this checked at build
time, but right now I can't think of a nice way.

Same thing for the possibility of OR-ing in INIT_SIMPLE_OR in the new
function. That would apparently need to go through featuresets though,
in which case it might even be an option to run sanitise_featureset()
over the result. Which in turn may mean some more re-structuring to be
desirable here. Using INIT_SIMPLE_OR would cover the three *_CLEAR bits
dealt with explicitly here, except that we want to set them for Intel
only; I wonder if HTT and CMP_LEGACY shouldn't also be marked '|'.

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -475,7 +475,34 @@ static void __init guest_common_max_feat
         __set_bit(X86_FEATURE_ARCH_CAPS, fs);
         __set_bit(X86_FEATURE_RSBA, fs);
         __set_bit(X86_FEATURE_RRSBA, fs);
+    }
+
+    /*
+     * To mitigate Native-BHI, one option is to use a TSX Abort on capable
+     * systems.  This is safe even if RTM has been disabled for other reasons
+     * via MSR_TSX_{CTRL,FORCE_ABORT}.  However, a guest kernel doesn't get to
+     * know this type of information.
+     *
+     * Therefore the meaning of RTM_ALWAYS_ABORT has been adjusted, to instead
+     * mean "XBEGIN won't fault".  This is enough for a guest kernel to make
+     * an informed choice WRT mitigating Native-BHI.
+     *
+     * If RTM-capable, we can run a VM which has seen RTM_ALWAYS_ABORT.
+     */
+    if ( test_bit(X86_FEATURE_RTM, fs) )
+        __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
 
+    /*
+     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
+     * FAST_STRING is not set should not affect the view of migrating-in guests.
+     */
+    __set_bit(X86_FEATURE_ERMS, fs);
+}
+
+static void __init guest_common_max_feature_enforcements(struct cpu_policy *p)
+{
+    if ( boot_cpu_data.x86_vendor == X86_VENDOR_INTEL )
+    {
         /*
          * These bits indicate that the VERW instruction may have gained
          * scrubbing side effects.  With pooling, they mean "you might migrate
@@ -483,9 +510,9 @@ static void __init guest_common_max_feat
          * unaffected hardware.  This is fine, because the VERW instruction
          * has been around since the 286.
          */
-        __set_bit(X86_FEATURE_MD_CLEAR, fs);
-        __set_bit(X86_FEATURE_FB_CLEAR, fs);
-        __set_bit(X86_FEATURE_RFDS_CLEAR, fs);
+        p->feat.md_clear = true;
+        p->arch_caps.fb_clear = true;
+        p->arch_caps.rfds_clear = true;
 
         /*
          * The Gather Data Sampling microcode mitigation (August 2023) has an
@@ -497,7 +524,7 @@ static void __init guest_common_max_feat
         if ( boot_cpu_data.x86 == 6 &&
              boot_cpu_data.x86_model == INTEL_FAM6_SKYLAKE_X &&
              raw_cpu_policy.feat.clwb )
-            __set_bit(X86_FEATURE_CLWB, fs);
+            p->feat.clwb = true;
     }
 
     /*
@@ -507,29 +534,8 @@ static void __init guest_common_max_feat
      * HTT identifies p->basic.lppp as valid
      * CMP_LEGACY identifies p->extd.nc as valid
      */
-    __set_bit(X86_FEATURE_HTT, fs);
-    __set_bit(X86_FEATURE_CMP_LEGACY, fs);
-
-    /*
-     * To mitigate Native-BHI, one option is to use a TSX Abort on capable
-     * systems.  This is safe even if RTM has been disabled for other reasons
-     * via MSR_TSX_{CTRL,FORCE_ABORT}.  However, a guest kernel doesn't get to
-     * know this type of information.
-     *
-     * Therefore the meaning of RTM_ALWAYS_ABORT has been adjusted, to instead
-     * mean "XBEGIN won't fault".  This is enough for a guest kernel to make
-     * an informed choice WRT mitigating Native-BHI.
-     *
-     * If RTM-capable, we can run a VM which has seen RTM_ALWAYS_ABORT.
-     */
-    if ( test_bit(X86_FEATURE_RTM, fs) )
-        __set_bit(X86_FEATURE_RTM_ALWAYS_ABORT, fs);
-
-    /*
-     * We expose MISC_ENABLE to guests, so our internal clearing of ERMS when
-     * FAST_STRING is not set should not affect the view of migrating-in guests.
-     */
-    __set_bit(X86_FEATURE_ERMS, fs);
+    p->basic.htt = true;
+    p->extd.cmp_legacy = true;
 }
 
 static void __init guest_common_default_feature_adjustments(uint32_t *fs)
@@ -551,52 +557,9 @@ static void __init guest_common_default_
              boot_cpu_data.x86_model == INTEL_FAM6_IVYBRIDGE &&
              cpu_has_rdrand && !is_forced_cpu_cap(X86_FEATURE_RDRAND) )
             __clear_bit(X86_FEATURE_RDRAND, fs);
-
-        /*
-         * These bits indicate that the VERW instruction may have gained
-         * scrubbing side effects.  The max policy has them set for migration
-         * reasons, so reset the default policy back to the host values in
-         * case we're unaffected.
-         */
-        __clear_bit(X86_FEATURE_MD_CLEAR, fs);
-        if ( cpu_has_md_clear )
-            __set_bit(X86_FEATURE_MD_CLEAR, fs);
-
-        __clear_bit(X86_FEATURE_FB_CLEAR, fs);
-        if ( cpu_has_fb_clear )
-            __set_bit(X86_FEATURE_FB_CLEAR, fs);
-
-        __clear_bit(X86_FEATURE_RFDS_CLEAR, fs);
-        if ( cpu_has_rfds_clear )
-            __set_bit(X86_FEATURE_RFDS_CLEAR, fs);
-
-        /*
-         * The Gather Data Sampling microcode mitigation (August 2023) has an
-         * adverse performance impact on the CLWB instruction on SKX/CLX/CPX.
-         *
-         * We hid CLWB in the host policy to stop Xen using it, but re-added
-         * it to the max policy to let VMs migrate in.  Re-hide it in the
-         * default policy to disuade VMs from using it in the common case.
-         */
-        if ( boot_cpu_data.x86 == 6 &&
-             boot_cpu_data.x86_model == INTEL_FAM6_SKYLAKE_X &&
-             raw_cpu_policy.feat.clwb )
-            __clear_bit(X86_FEATURE_CLWB, fs);
     }
 
     /*
-     * Topology information is at the toolstack's discretion so these are
-     * unconditionally set in max, but pick a default which matches the host.
-     */
-    __clear_bit(X86_FEATURE_HTT, fs);
-    if ( cpu_has_htt )
-        __set_bit(X86_FEATURE_HTT, fs);
-
-    __clear_bit(X86_FEATURE_CMP_LEGACY, fs);
-    if ( cpu_has_cmp_legacy )
-        __set_bit(X86_FEATURE_CMP_LEGACY, fs);
-
-    /*
      * On certain hardware, speculative or errata workarounds can result in
      * TSX being placed in "force-abort" mode, where it doesn't actually
      * function as expected, but is technically compatible with the ISA.
@@ -939,12 +902,14 @@ void __init init_guest_cpu_policies(void
     {
         calculate_pv_max_policy();
         calculate_pv_def_policy();
+        guest_common_max_feature_enforcements(&pv_max_cpu_policy);
     }
 
     if ( hvm_enabled )
     {
         calculate_hvm_max_policy();
         calculate_hvm_def_policy();
+        guest_common_max_feature_enforcements(&hvm_max_cpu_policy);
     }
 }
 


