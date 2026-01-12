Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA20BD1384F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 16:13:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200527.1516415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJbB-0004lg-3U; Mon, 12 Jan 2026 15:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200527.1516415; Mon, 12 Jan 2026 15:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfJbB-0004kE-0Z; Mon, 12 Jan 2026 15:12:53 +0000
Received: by outflank-mailman (input) for mailman id 1200527;
 Mon, 12 Jan 2026 15:12:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Qluw=7R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vfJbA-0004k8-0P
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 15:12:52 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28669820-efc9-11f0-9ccf-f158ae23cfc8;
 Mon, 12 Jan 2026 16:12:49 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-42fbad1fa90so5602236f8f.0
 for <xen-devel@lists.xenproject.org>; Mon, 12 Jan 2026 07:12:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5df939sm38765247f8f.21.2026.01.12.07.12.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 07:12:48 -0800 (PST)
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
X-Inumbo-ID: 28669820-efc9-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768230769; x=1768835569; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QN91mTdjZK1Ghls/nOSb3R2+DqKlpvdGpHv0sCbsnAU=;
        b=V1JXWUCtc7lSsWToL5x5V6Msyw3Rcw44QkLz2JzXf0Ka9IGmSGLdrUu0VUqBdDBFSe
         f7vzUUnmG5RFZNdm96ee6UPSqe1RX/GdstqOVhuPD+scIQpC5QmJMKTVNKPTpiLJr/js
         a6g4ENsNwE5zc6Rk4q7DlCkYFlDRj2VeCe2NdBSB7lGlsbrHAy0GNn0DPcuK6DpTA4lh
         nWvu8uu11zJDzcd7INs/ZhzL1yG2LPpzkKvGnzUW0nAS169Lb6vFxD2PlOZdvYLB6POQ
         nRs+wTXh7BcU15wlaL8WTHSc/QuuxtPfFh8zEKMsesCVdtJG6FZioY/Eu7PV2U7Dp1y0
         SAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768230769; x=1768835569;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN91mTdjZK1Ghls/nOSb3R2+DqKlpvdGpHv0sCbsnAU=;
        b=LqpNF7vMsh8EtXdKeR35xR37USrTymSyTy4Zs3iIWj997tIhhi69Uxub85Im1qXcp9
         HuEl/gWqDte2Pl6IAimbxDqLyihI6WcxTVSoKOJx3nLethR2IGE5Rovc49aLVjvo1KIj
         GHfMZofIA/n5eN44fOK6IVvB4kniMvNwPpL1NGPsCjpnV0v9QYp7HAaNvYymuQfSvcP6
         i+1CuFVIiSnmy6DuCOui6oUTanzPkDqf8kKtyk/KJKTp8wrQSNp0pJ1d4Mo0OzqLD/Gn
         MkAvBOHOhKpW1u9gLFJoEdOW8l7uZa3yxGuSwVZNt145oj4cpxMMPUKWxFtuKIfzMBFj
         S7yg==
X-Forwarded-Encrypted: i=1; AJvYcCU/Yy9QmMbUL0j0qsCXkiwWa+9zOo8EFsZntl3p1K3RU80lDPWKV6UNLW/VRw90WwTQkbIpm4VF3wI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxGPevVpG9tmiqYC6L0mM+VK7DmD0slfXKdl+ND38AqFyrYhdK6
	Hulx+OLxK0F0bl2ZLuISVgPEL2WaLUkHm5d9WCKk5+DgwIPRSUTWZPavzuC3fHm0WA==
X-Gm-Gg: AY/fxX7zmeIzbEAU7GitWkVfRBhEmvdH1iJFwXpemwyb+yRkXwJU9xCt5c7wqm6AsE/
	cK5R1uGsxH++omJFOrH6iRZuTDBn/JBW3sq56RQ+X9LuH7atKl73mhuSQ9/7VZujtSZo7dMZCpR
	yFCOqElZVnsNZWQ3ql8aYcM5SG+GUrpBpfIrDQ1nhU7yLe2X38ITfluTdLvNYuce3X9sLH7m5fR
	8dCmPKITlw6riIG4Pk+h1jnIxKB5alDYCrsFeON4V4QelWKrZBt89ZE4eTwxGE0Z8W19syB6mcv
	pXZpad00+2DHTwf5OOnzeOaUsle32dIfQI1HtYat7r3XApDeCNyGekMucFoP5QJMGyM9WAwGSyn
	E+Ik+pgFS4gaQ02EF9zE1A0eZsI3aIGv9TgWknV4XHShJSJhZd5VdleamqkWFRQBRXe3cXTRXOi
	bJ2EFMnhhY6lum/3vOpNfdasLZ279uc66VAwuUMNOkEAHvzk/1z20tsva9Ar0qIQaWuSEMOR9pT
	2g=
X-Google-Smtp-Source: AGHT+IF4/92KVn+U24L6KHlLu/MnYpFidyCTPpxgIV5wiztXTZC58FaUH8O48WnsF1KYuGfQU04CWg==
X-Received: by 2002:a05:6000:1865:b0:432:857d:e42c with SMTP id ffacd0b85a97d-432c37c87famr19821138f8f.34.1768230768780;
        Mon, 12 Jan 2026 07:12:48 -0800 (PST)
Message-ID: <de975e5d-4df7-4dee-9edf-400e5287cc82@suse.com>
Date: Mon, 12 Jan 2026 16:12:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/15] xen/riscv: introduce sbi_set_timer()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <84cf8fb2331614c6d0cc6e9030571f42bfc6d928.1766595589.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <84cf8fb2331614c6d0cc6e9030571f42bfc6d928.1766595589.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.12.2025 18:03, Oleksii Kurochko wrote:
> Introduce pointer to function which points to a specific sbi_set_timer()
> implementation. It is done in this way as different OpenSBI version can
> have different Extenion ID and/or funcion ID for TIME extension.
> 
> sbi_set_time() programs the clock for next event after stime_value
> time. This function also clears the pending timer interrupt bit.
> 
> Introduce extension ID and SBI function ID for TIME extension.
> 
> Implement only sbi_set_timer_v02() as there is not to much sense
> to support earlier version and, at the moment, Xen supports only v02.

Besides this somewhat contradicting the use of a function pointer: What
about the legacy extension's equivalent?

> --- a/xen/arch/riscv/include/asm/sbi.h
> +++ b/xen/arch/riscv/include/asm/sbi.h
> @@ -33,6 +33,7 @@
>  
>  #define SBI_EXT_BASE                    0x10
>  #define SBI_EXT_RFENCE                  0x52464E43
> +#define SBI_EXT_TIME                    0x54494D45
>  
>  /* SBI function IDs for BASE extension */
>  #define SBI_EXT_BASE_GET_SPEC_VERSION   0x0
> @@ -65,6 +66,9 @@
>  
>  #define SBI_SPEC_VERSION_DEFAULT 0x1
>  
> +/* SBI function IDs for TIME extension */
> +#define SBI_EXT_TIME_SET_TIMER  0x0

Move up besides the other SBI_EXT_* and use the same amount of padding?

> @@ -138,6 +142,19 @@ int sbi_remote_hfence_gvma(const cpumask_t *cpu_mask, vaddr_t start,
>  int sbi_remote_hfence_gvma_vmid(const cpumask_t *cpu_mask, vaddr_t start,
>                                  size_t size, unsigned long vmid);
>  
> +/*
> + * Programs the clock for next event after stime_value time. This function also
> + * clears the pending timer interrupt bit.
> + * If the supervisor wishes to clear the timer interrupt without scheduling the
> + * next timer event, it can either request a timer interrupt infinitely far
> + * into the future (i.e., (uint64_t)-1), or it can instead mask the timer
> + * interrupt by clearing sie.STIE CSR bit.
> + *
> + * This SBI call returns 0 upon success or an implementation specific negative
> + * error code.
> + */
> +extern int (*sbi_set_timer)(uint64_t stime_value);

Despite the pretty extensive comment, the granularity of the value to be passed
isn't mentioned.

> --- a/xen/arch/riscv/sbi.c
> +++ b/xen/arch/riscv/sbi.c
> @@ -249,6 +249,26 @@ static int (* __ro_after_init sbi_rfence)(unsigned long fid,
>                                            unsigned long arg4,
>                                            unsigned long arg5);
>  
> +static int cf_check sbi_set_timer_v02(uint64_t stime_value)
> +{
> +    struct sbiret ret;
> +
> +#ifdef CONFIG_RISCV_64
> +    ret = sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0,
> +                    0, 0, 0, 0);
> +#else
> +    ret = sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
> +                    stime_value >> 32, 0, 0, 0, 0);
> +#endif

How about

    ret = sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
#ifdef CONFIG_RISCV_64
                    0,
#else
                    stime_value >> 32,
#endif
                    0, 0, 0, 0);

? Granted some may say this looks a little m ore clumsy, but it's surely
less redundancy.

Also I'd suggest to use CONFIG_RISCV_32 with the #ifdef, as then the "else"
covers both RV64 and RV128.

> +    if ( ret.error )
> +        return sbi_err_map_xen_errno(ret.error);
> +    else
> +        return 0;
> +}

While I understand this is being debated, I continue to think that this
kind of use of if/else isn't very helpful. Function's main return
statements imo benefit from being unconditional.

Jan

