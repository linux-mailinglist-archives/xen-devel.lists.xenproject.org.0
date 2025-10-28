Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE7AC13C41
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 10:21:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151996.1482539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDfsR-0003v1-D2; Tue, 28 Oct 2025 09:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151996.1482539; Tue, 28 Oct 2025 09:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDfsR-0003sk-9E; Tue, 28 Oct 2025 09:20:27 +0000
Received: by outflank-mailman (input) for mailman id 1151996;
 Tue, 28 Oct 2025 09:20:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDfsQ-0003se-5M
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 09:20:26 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 559a1125-b3df-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 10:20:24 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-4298a028de6so3437372f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 02:20:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5773sm20867626f8f.27.2025.10.28.02.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 02:20:23 -0700 (PDT)
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
X-Inumbo-ID: 559a1125-b3df-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761643224; x=1762248024; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WGJ2+y3VQKfBTfRfhAWVDI4GRenq2XY1xnL/M6cLGNk=;
        b=aN1vgeu0apLDkyFUdMlXe7jreNF7/hTESqzOL3JWFRW+FF2+e3Ef/+AEGyba3sxZ9K
         0pNUaIbGvTc7XiRa2oELfC0aLVGlF7+55TIfjWTeC5f4pZRO/E01cbNVMBXyXPTdse/i
         eiUphHmr7au5EhWnzRzz5thfA7JstEgQCk3BPqeJiQHevlEOqZ7bApjmMWh6FBevFDPj
         EfZOX78CEqrbPmd1cDO+Amg6AFZUhaq4lQHyMGDHSKs9FxJ9rj8MJuVfVMTWlktWzqT7
         HU7ZeTjkaUt2GpVa8R7dEmHXhKAj4IVZTn/CKF/gAzMXgAS2H6EqnlFP1WqJWyXnQcKj
         q/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643224; x=1762248024;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGJ2+y3VQKfBTfRfhAWVDI4GRenq2XY1xnL/M6cLGNk=;
        b=cD+VeN6z8NMz9honwTKbquRi76EU/OrBbuO3GcaLeuVKM1gBABPzXW5RS2mxUW86Es
         JW3Cs8fguBERt1fPTj6NUdTvFgse8EGVFfygdyMR/kI7M1Lpw65B7e8TeYzWbfwmnwp9
         cmF6mEkQxPg804l2HvDo/PyH2l+K651DCuyxZHTwKX5sm1yQXJMV/T92ExB1nlc4QJ7h
         NgAtHgMagy2oF4NzRXtJ6FZL9Mg/cegmCDq+Ib3GTmbikxCcLrSY+tYVNcRhXnUInjkB
         b771WhetGW9ijSFK6Mw8sSH2u/BoKeVgM4WSIV1SkrztbOO7aXP6IlzCBk3AiturNNBE
         WneA==
X-Forwarded-Encrypted: i=1; AJvYcCW3GaYEPkSVRchX9K3FQFuZRFo8tOL3jct1Cv1aHUKC9WsbcrPmPhsO1IOqaw2H1VLpDvB1cvA4R2U=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz/alZiQcoXZ8Q65TQiJM+zsgIbKIIfP19dHpvjin1WnozfIbGh
	mLvXNZd7a1wvKEGdNbQkaircm85tSpAl5JqsRRXWpsgQulG6rZ3VAQ33hv9IJaaMdQ==
X-Gm-Gg: ASbGnctkmDAdcEYcGFVvbJoI2whx9NXvUJbFrPWXOLaVqmCn++Ok9nWXjqxaifuuSaw
	Va7qwGJLDmYynhhn+3T47ltpFPvaAX+y6BKwd9tn9LUnu21LKcwO7rPeOrGI8qeUAkoMfTEOvKV
	1BMkQqMOQf3vOTiDejnhHrlzvNPlRQ7cZT6h0zokiiPxq7oDH3+w0WZXLMSvsJwk5LJu0XdodeR
	JrF3ocrkw2digvPJ76s0qMuFIvAkXc1tTeH7XI6rstNa/iVRNZMHGWoD7fi7RRrpyNCVBwf2B0t
	JN2cc496jUBZaZz6JBcveLU3K6AA7MUikMaTQ3nkpL9lJFhNqfO1/n5VBb6dYcC5bnt0rO/yeJ0
	7u3awGJWgAK8VvXQkQEbiFAvFOkRLnmKlrCP6kRTWe5ZlGG4Fub7e8fufdaJAoO2FKUsrXHZnF6
	aBhiLNeUrZEL0YtwjztWoThoW13/WGh7gZzlj+FlLTPoqHpHJB/TqgCr2POFj2/NW8tzOUv34=
X-Google-Smtp-Source: AGHT+IGasJjvzZelFOicmOtN9kpkKMDzBbFtAhZn7+GNJi8tv3dosO1w2czLmPDmeoFl+6ITid2S5A==
X-Received: by 2002:a05:6000:2909:b0:414:fb6c:e369 with SMTP id ffacd0b85a97d-429a81b1f37mr1927442f8f.5.1761643223924;
        Tue, 28 Oct 2025 02:20:23 -0700 (PDT)
Message-ID: <78fe46d2-f21a-46d2-bcb5-a54d7cd86e91@suse.com>
Date: Tue, 28 Oct 2025 10:20:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH for-4.22 1/2] x86/platform: Expose DTS sensors MSR
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Teddy Astie <teddy.astie@vates.tech>
References: <cover.1761585640.git.teddy.astie@vates.tech>
 <48b15617f248852560a0e0674eea65d25330c605.1761585640.git.teddy.astie@vates.tech>
 <83712d12-08ec-46a4-b215-18f7ea1c1069@citrix.com>
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
In-Reply-To: <83712d12-08ec-46a4-b215-18f7ea1c1069@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.10.2025 20:38, Andrew Cooper wrote:
> On 27/10/2025 5:26 pm, Teddy Astie wrote:
>> I'm not a fan of doing a inline cpuid check here, but I don't have a
>> better approach in mind.
> 
> I'm not sure if there's enough information in leaf 6 to justify putting
> it fully into the CPUID infrastructure.
> 
> But, if you do something like this:
> 
> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
> index f94f23e159d2..d02fe4d22151 100644
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -121,7 +121,13 @@ struct cpu_policy
>              uint64_t :64, :64; /* Leaf 0x3 - PSN. */
>              uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
>              uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
> -            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
> +
> +            /* Leaf 0x6 - Thermal and Perf. */
> +            struct {
> +                bool /* a */ dts:1;
> +                uint32_t /* b */:32, /* c */:32, /* d */:32;
> +            };
> +
>              uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
>              uint64_t :64, :64; /* Leaf 0x8 - rsvd */
>              uint64_t :64, :64; /* Leaf 0x9 - DCA */

Just to mention, below a patch I have pending as part of a series to
e.g. replace the various CPUID6_* values we presently use. As you did
indicate when we talked about this, a prereq to then use respective
bits from host_policy is an adjustment to cpu-policy.c, which is also
part of that series. If we weren't in freeze right now, I would have
posted the series already.

Jan

x86/cpu-policy: define bits of leaf 6

... as far as we presently use them in the codebase.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Or should we make both parts proper featureset elements? At least
APERFMPERF could likely be made visible to guests (in principle).

--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -128,7 +128,31 @@ struct cpu_policy
             uint64_t :64, :64; /* Leaf 0x3 - PSN. */
             uint64_t :64, :64; /* Leaf 0x4 - Structured Cache. */
             uint64_t :64, :64; /* Leaf 0x5 - MONITOR. */
-            uint64_t :64, :64; /* Leaf 0x6 - Therm/Perf. */
+
+            /* Leaf 0x6 - Therm/Perf. */
+            struct {
+                uint32_t /* a */:1,
+                    turbo:1,
+                    arat:1,
+                    :4,
+                    hwp:1,
+                    hwp_notification:1,
+                    hwp_activity_window:1,
+                    hwp_epp:1,
+                    hwp_plr:1,
+                    :1,
+                    hdc:1,
+                    :2,
+                    hwp_peci:1,
+                    :2,
+                    hw_feedback:1,
+                    :12;
+                uint32_t /* b */:32;
+                uint32_t /* c */ aperfmperf:1,
+                    :31;
+                uint32_t /* d */:32;
+            } pm;
+
             uint64_t :64, :64; /* Leaf 0x7 - Structured Features. */
             uint64_t :64, :64; /* Leaf 0x8 - rsvd */
             uint64_t :64, :64; /* Leaf 0x9 - DCA */


