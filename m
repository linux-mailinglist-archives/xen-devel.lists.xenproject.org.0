Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE7CC1EB3F
	for <lists+xen-devel@lfdr.de>; Thu, 30 Oct 2025 08:12:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1153318.1483685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEMpr-00017d-PV; Thu, 30 Oct 2025 07:12:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1153318.1483685; Thu, 30 Oct 2025 07:12:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vEMpr-00016C-MW; Thu, 30 Oct 2025 07:12:39 +0000
Received: by outflank-mailman (input) for mailman id 1153318;
 Thu, 30 Oct 2025 07:12:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+HTt=5H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vEMpp-000166-VA
 for xen-devel@lists.xenproject.org; Thu, 30 Oct 2025 07:12:37 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf996ddd-b55f-11f0-980a-7dc792cee155;
 Thu, 30 Oct 2025 08:12:35 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so5391665e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 30 Oct 2025 00:12:35 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4771902fa8dsm59327475e9.8.2025.10.30.00.12.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Oct 2025 00:12:34 -0700 (PDT)
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
X-Inumbo-ID: cf996ddd-b55f-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761808355; x=1762413155; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5eA2SJ2iidFxDm+lDsX4lAk0nSU1CGD4i+rmohqBTsw=;
        b=eDVRSXfiu9+J1wremI+bIkm6TMOltZNgYNyN6Xz7GKcggF22/4E/oKEIAQHztvY+x3
         7ZBq8gRy1PrTDsMEecfzJTo85nszxBjExTF25W8vseAH6F0W7I13pIn/5G9F+TC08BP3
         zpjOgfCLVIJdb6F0/7zk7EgfDo/6FvsgF2Mz4MEjr9YPOQekW7mnlEmeoypd1qXyuXSc
         +gmxPio7x04UXjxY+1WjNOVyFzBb5Akcxd/moxUuXurX5101yEBPEu7op2ZBo/hU1BrW
         ZuwaAuUhVC3j8+xxEyvY5xLS81MroF72QxD4GaXiC9qN2MGVXbpdmJfMuiVKAF7ERSEc
         MHpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761808355; x=1762413155;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eA2SJ2iidFxDm+lDsX4lAk0nSU1CGD4i+rmohqBTsw=;
        b=N4Pow8YImca8RTRPFk9AG7RTo7tPX6DTZ46jQjis8EJbPDR9c9GDAzF0WV+htU1XpY
         P/sqllG/DQVqCTMMstwIbmUMSBqn9/gvl6WtI06AHfR5csPUYXqE0At/j+mvaiUM8qBI
         Bl7ZKmeDHXJZXvBWZTd/qE/hkPOyZ0viMPVZijPY38tk+DQRQGPqaknR5/3s+BWQYZL8
         YnJ6ALQqpkwLZ74rae1ZjaXTztLpR3r7NqrumNh0U18c1ReMlXv8uv+o4yOE6695wwg+
         Laa1+I2sLgRkd7v1vuk8fv11NKW3TaCB6bsTzbXbefLTXRwe/+CHuFwr18Mc69e0c+ys
         IoqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeJTlKqvr+vwIRUD6up8fBxkbsBPCoGOr5Gax/bIR2m4gZgH/CKnD4D/v4TURQhzF/SEbGcL7Xsfw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwHb3suVdNPL29vEGzTsT3i96t6+/arKTIfyadprEmvfDq9q87S
	j4IaZCmwqbHTrW8/tdKWQgXtKznrffKM3Ia+JihHvGo2/0JgaN0zZaRp0kGX9kphtw==
X-Gm-Gg: ASbGnctMWA2ITA2XxFK1vv5KnwuLz/SxestqYcYOXMmW+HZGBVaQxL/N78FYOPb/HJk
	4GZWt1BFvpJ591pdB8b4Teixtrg/EKB43Lej+NbB3vFZfnDZ7AZWViCiXc+h2d+iozWpbmWDhLY
	kjMevjR4aA0BSZyj9QQwRKZbuLz1CAqktxcJTmn37ANg5MgGACR0fq/gynNYDskxtHn/Af9HzoX
	8gtEdyGGFeGjrCDn/+BmWmVrLWxlZ2v6AhQ8hKZEn0dEG0bGTsuuEk/36bQk/NJ33jKFk7WN6+K
	+oTxaNu4y3Yg4Gov59CsDST72OiaQESj7tv9Cpb+UFXfzSIQQ9LKQRlwzjmjBgym2GMStJ8b/ER
	+vlGDap16JovTZmwKTFiVVTmSSOuf/59UlPIPUs6ylzJAw6wVFZYNsYn2HSOCZ8JJ2R92XrRVCt
	4h/iBdqfRzyawvu+2E2gqJtozNH8zWxmajKGSflE/hJRetcm7JYQUQTs7VDsOEQuXbzxRvvQB+4
	gFwT0b98A==
X-Google-Smtp-Source: AGHT+IGZfMZooilhYdBCxb32fYEb5g9U9A72kcTuUuKSB3zrX0HZ2Mur2oBVZKDZc1r7ICbUrkzTGw==
X-Received: by 2002:a05:600c:46c3:b0:477:be4:7a52 with SMTP id 5b1f17b1804b1-4771e1f3bc7mr48974625e9.39.1761808355230;
        Thu, 30 Oct 2025 00:12:35 -0700 (PDT)
Message-ID: <080c2780-2810-4ba8-8f9c-57c1fc4135f9@suse.com>
Date: Thu, 30 Oct 2025 08:12:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22 v2 1/3] x86/cpu-policy: Infrastructure for
 CPUID leaf 0x6
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1761752801.git.teddy.astie@vates.tech>
 <3ad34c3e1de444798dcfe0e673375f28f1a654ec.1761752801.git.teddy.astie@vates.tech>
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
In-Reply-To: <3ad34c3e1de444798dcfe0e673375f28f1a654ec.1761752801.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.10.2025 16:59, Teddy Astie wrote:
> From: Jan Beulich <jbeulich@suse.com>
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
> ---
> v2: introduced

This being a change of mine, I'm not happy for the title to have changed, and
for the (little bit of) description to have been dropped.

> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -121,7 +121,32 @@ struct cpu_policy
>              uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>              uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
> +
> +            /* Leaf 0x6 - Therm/Perf. */
> +            struct {
> +                uint32_t /* a */
> +                    dts:1,
> +                    turbo:1,
> +                    arat:1,
> +                    :4,
> +                    hwp:1,
> +                    hwp_notification:1,
> +                    hwp_activity_window:1,
> +                    hwp_epp:1,
> +                    hwp_plr:1,
> +                    :1,
> +                    hdc:1,
> +                    :2,
> +                    hwp_peci:1,
> +                    :2,
> +                    hw_feedback:1,
> +                    :12;
> +                uint32_t /* b */:32;
> +                uint32_t /* c */ aperfmperf:1, 
> +                    :31;
> +                uint32_t /* d */:32;
> +            } pm;
> +
>              uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
>              uint64_t :64, :64; /* Leaf 0x8 - rsvd */
>              uint64_t :64, :64; /* Leaf 0x9 - DCA */

As I had said, this (really: the use of these bits in the host policy) actually
requires an adjustment to cpu-policy.c as well, which I'm carrying as a separate,
prereq change (re-produced below). May I suggest that your work go on top of mine
(which I'll post once we have branched 4.21 off)?

Jan

x86/cpu-policy: move invocation of recalculate_misc()

The function is about guest exposure of features / leaves. There's no need
for it to be applied on the host policy. In fact doing so gets in the way
of using the host policy in certain places.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -424,7 +424,6 @@ void __init calculate_host_policy(void)
     x86_cpu_featureset_to_policy(boot_cpu_data.x86_capability, p);
     recalculate_xstate(p);
     recalculate_tile(p);
-    recalculate_misc(p);
 
     /* When vPMU is disabled, drop it from the host policy. */
     if ( vpmu_mode == XENPMU_MODE_OFF )
@@ -705,6 +704,7 @@ static void __init calculate_pv_max_poli
     unsigned int i;
 
     *p = host_cpu_policy;
+    recalculate_misc(p);
 
     guest_common_max_leaves(p);
 
@@ -809,6 +809,7 @@ static void __init calculate_hvm_max_pol
     const uint32_t *mask;
 
     *p = host_cpu_policy;
+    recalculate_misc(p);
 
     guest_common_max_leaves(p);
 


