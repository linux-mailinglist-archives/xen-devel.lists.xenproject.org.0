Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD1889882A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 14:46:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700841.1094581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsMT9-0002PA-IP; Thu, 04 Apr 2024 12:45:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700841.1094581; Thu, 04 Apr 2024 12:45:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsMT9-0002MN-FX; Thu, 04 Apr 2024 12:45:27 +0000
Received: by outflank-mailman (input) for mailman id 700841;
 Thu, 04 Apr 2024 12:45:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsMT8-0002MH-S9
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 12:45:26 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 33ae1e09-f281-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 14:45:22 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-343d2b20c4bso57344f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 05:45:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ay26-20020a5d6f1a000000b0034355b7e995sm9103161wrb.13.2024.04.04.05.45.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 05:45:21 -0700 (PDT)
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
X-Inumbo-ID: 33ae1e09-f281-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712234722; x=1712839522; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aNurzJA3ormj+Qlz7qI2fefQssJlGjatzUUdYi8Ux2k=;
        b=dG7Jxm0w5tHrQEUhUs836l6iK2itnkIvPaCq/30GOMOwyO4AgZ0J50+rndfk1pJeLL
         RHh0IwZ4BLP5mtwt+8lLjfKur+i10WAwootuxk2yVKtfuggIcG440XeaGzKb47ykuJxC
         2ItydJjiVEgXD9HsmNo5cq95JuyAS8FQhf99XPJ7QizanC/0+Ka+yoM5saI/Py0UQ7sl
         vuBtS6QGnlg1MQfOFgjdRXroY/gqTIxVhcDWZ+MX/w36N30WWq73dNrqpRKYNKybQbND
         FGVaHCSPPu8aagvupEJ5lh1rznEwXFOlhdCIHpWZ2nH9X1VRx5BS3DShGF6AKoqgL3fo
         4MNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712234722; x=1712839522;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aNurzJA3ormj+Qlz7qI2fefQssJlGjatzUUdYi8Ux2k=;
        b=UjSOwBoCXoSRO7D4Od1fBgKb3aYt4LOVnF7jzPSWTI2M/dcJA42tyjSAMG8c/sWIvI
         IBrGxcCtyFX0OMbbi6b3cv+cNulJbPyvZoX9XSvUFwWiMb3GsCvz0WlzTm05s0cio3Wz
         Cff/cIyXbu52Vd9iRyzopzrohPgE49/vpj8UTyhKTvBpxpGdHHywbaK2+qj5EWzaYCGp
         kKftxLiNnfNMZzKRk2d00eaHLeI/rBahPGdkiggUBiILJGmzazsbDNifkDMOzz7gttrE
         NjvPEYKgJ8alfbJyU0gev1TrLxlmyPRlTvzkcr1oPHCvEeKDPIxSSxn1mJ4D/KIBsvmU
         CiZA==
X-Forwarded-Encrypted: i=1; AJvYcCV1TqohBsOa4D6uo6CNp4Ziju6uGjDZN54AkVydLt+EV3zNFv6J/Mhf+ryikG4Anc+//pX+RxDtxUPDeFZDNQb+oAG1eqeKV1BJdvO7m4s=
X-Gm-Message-State: AOJu0YwQmziJt1CfRj+ZJzdSdE+RW3nZtsW11XKywMsb36josxn8g3g6
	kYliJkWnAf9dTkhR3dkCk4WJxtCeDI48Wp2T1QnMSmYJkfWO+lLlEpYtx0TDUQ==
X-Google-Smtp-Source: AGHT+IGk2UlNoScrFRydr9U6HOQ58d6+tNdmGrsYg/X1jVsT3pMGo1B0u6U0liZSh8MwNRc32Chc/Q==
X-Received: by 2002:a05:6000:a82:b0:343:64be:b543 with SMTP id dh2-20020a0560000a8200b0034364beb543mr2123742wrb.57.1712234722219;
        Thu, 04 Apr 2024 05:45:22 -0700 (PDT)
Message-ID: <6e99f73f-bf83-4c40-b97c-5cead300a781@suse.com>
Date: Thu, 4 Apr 2024 14:45:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tsx: Cope with RTM_ALWAYS_ABORT vs RTM mismatch
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <Zg1stUacaDBkyDOn@mail-itl>
 <20240404104122.2870129-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240404104122.2870129-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.04.2024 12:41, Andrew Cooper wrote:
> @@ -9,6 +10,7 @@
>   *  -1 => Default, altered to 0/1 (if unspecified) by:
>   *                 - TAA heuristics/settings for speculative safety
>   *                 - "TSX vs PCR3" select for TSX memory ordering safety
> + *  -2 => Implicit tsx=0 (from RTM_ALWAYS_ABORT vs RTM mismatch)
>   *  -3 => Implicit tsx=1 (feed-through from spec-ctrl=0)
>   *
>   * This is arranged such that the bottom bit encodes whether TSX is actually
> @@ -114,11 +116,50 @@ void tsx_init(void)
>  
>          if ( cpu_has_tsx_force_abort )
>          {
> +            uint64_t val;
> +
>              /*
> -             * On an early TSX-enable Skylake part subject to the memory
> +             * On an early TSX-enabled Skylake part subject to the memory
>               * ordering erratum, with at least the March 2019 microcode.
>               */
>  
> +            rdmsrl(MSR_TSX_FORCE_ABORT, val);
> +
> +            /*
> +             * At the time of writing (April 2024), it was discovered that
> +             * some parts (e.g. CoffeeLake 8th Gen, 06-9e-0a, ucode 0xf6)
> +             * advertise RTM_ALWAYS_ABORT, but XBEGIN instructions #UD.  Other
> +             * similar parts (e.g. KabyLake Xeon-E3, 06-9e-09, ucode 0xf8)
> +             * operate as expected.
> +             *
> +             * In this case:
> +             *  - RTM_ALWAYS_ABORT and MSR_TSX_FORCE_ABORT are enumerated.
> +             *  - XBEGIN instructions genuinely #UD.
> +             *  - MSR_TSX_FORCE_ABORT is write-discard and fails to hold its
> +             *    value.
> +             *  - HLE and RTM are not enumerated, despite
> +             *    MSR_TSX_FORCE_ABORT.TSX_CPUID_CLEAR being clear.

Of these 4 items you use the first and last here. It took me some time to
figure that the middle two are (aiui) only informational, and that you
assume that first and last together are sufficient to uniquely identify
the problematic parts. Separating the two groups a little might be helpful.

For the write-discard property, how was that determined? Does it affect all
writable bits?

> +             * Spot this case, and treat it as if no TSX is available at all.
> +             * This will prevent Xen from thinking it's safe to offer HLE/RTM
> +             * to VMs.
> +             */
> +            if ( val == 0 && cpu_has_rtm_always_abort && !cpu_has_rtm )
> +            {
> +                printk(XENLOG_ERR
> +                       "FIRMWARE BUG: CPU %02x-%02x-%02x, ucode 0x%08x: RTM_ALWAYS_ABORT vs RTM mismatch\n",

This isn't really firmware, is it? At least I wouldn't call microcode
(assuming that's where the bad behavior is rooted) firmware.

> +                       boot_cpu_data.x86, boot_cpu_data.x86_model,
> +                       boot_cpu_data.x86_mask, this_cpu(cpu_sig).rev);
> +
> +                setup_clear_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT);

Instead of the "goto" below, wouldn't it be better to also force
has_rtm_always_abort to false along with this, thus skipping the
setup_force_cpu_cap(X86_FEATURE_RTM_ALWAYS_ABORT) further down? That would
leave things a little less awkward flow-wise, imo. The one thing not
becoming clear from the commentary above is whether cpu_has_tsx_ctrl might
be true, and hence RTM/HLE still becoming (wrongly) set, if done that way.

Jan

> +                setup_clear_cpu_cap(X86_FEATURE_TSX_FORCE_ABORT);
> +
> +                if ( opt_tsx < 0 )
> +                    opt_tsx = -2;
> +
> +                goto done_setup;
> +            }
> +
>              /*
>               * Probe for the June 2021 microcode which de-features TSX on
>               * client parts.  (Note - this is a subset of parts impacted by
> @@ -128,15 +169,8 @@ void tsx_init(void)
>               * read as zero if TSX_FORCE_ABORT.ENABLE_RTM has been set before
>               * we run.
>               */
> -            if ( !has_rtm_always_abort )
> -            {
> -                uint64_t val;
> -
> -                rdmsrl(MSR_TSX_FORCE_ABORT, val);
> -
> -                if ( val & TSX_ENABLE_RTM )
> -                    has_rtm_always_abort = true;
> -            }
> +            if ( val & TSX_ENABLE_RTM )
> +                has_rtm_always_abort = true;
>  
>              /*
>               * If no explicit tsx= option is provided, pick a default.
> @@ -191,6 +225,7 @@ void tsx_init(void)
>              setup_force_cpu_cap(X86_FEATURE_RTM);
>          }
>      }
> + done_setup:
>  
>      /*
>       * Note: MSR_TSX_CTRL is enumerated on TSX-enabled MDS_NO and later parts.
> 
> base-commit: 6117179dd99958e4ef2687617d12c9b15bdbae24


