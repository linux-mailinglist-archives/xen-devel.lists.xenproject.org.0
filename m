Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17381BF59A9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 11:48:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146918.1479259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB8xp-0001ZN-SM; Tue, 21 Oct 2025 09:47:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146918.1479259; Tue, 21 Oct 2025 09:47:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB8xp-0001WW-PU; Tue, 21 Oct 2025 09:47:33 +0000
Received: by outflank-mailman (input) for mailman id 1146918;
 Tue, 21 Oct 2025 09:47:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vB8xo-0001WP-N4
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 09:47:32 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f68525a5-ae62-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 11:47:31 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42701aa714aso3253941f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 21 Oct 2025 02:47:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a78csm19464505f8f.26.2025.10.21.02.47.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Oct 2025 02:47:30 -0700 (PDT)
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
X-Inumbo-ID: f68525a5-ae62-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761040051; x=1761644851; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fQ8gKscBDnG6jIRvXfBznZAd9m58mG4UlyOn08sZ7Zs=;
        b=Ki6FAu9Pe6+E8gxPhVjBXQCgNfadoQTInBEe7ES8GoBL0AsPdWEVXkW5xqNfSk4jj0
         d9JEAPDcSRnUd7AawKdlTuMgIFtAxw5WgMp+zwhHx4qRp3QrZMm3IBdeyoPgPdY7MNeG
         SXibhnaX9SDD1fcDxCcq0H98TKzL2A8Q+teFrK/a8VQ2cfwK47aFY9GX6sMkM3sa2bx8
         srznW11JWMEYn5F92uKVNmssaCGgq4UV+sklecB91NmbrStteF/9nMNNHqGhegZJ02g0
         svusbfd3B4TasGHfiyWBvdFFcXOq7w4MPu9+3J676XcQU5Qiq5pChVikmyw0qdLEXvjD
         4wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761040051; x=1761644851;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQ8gKscBDnG6jIRvXfBznZAd9m58mG4UlyOn08sZ7Zs=;
        b=er4FpRUKFBG3+2nMjnn3y1Xm7tfGpkjBK9GIoyaDUhbrRqYbc0bIUELgZ7t94ntRXl
         WDkGhw7/3q/l+h999PmHoSZQcmrV71bm2aamRODqNf4AYmivh+rCAy9hfeqhYu/7Fz2A
         0Z+spqcpKi9/fPNsP92Etw9SuHwlXlrqGWLIxP2NdATv56vtKPMDKCRRS2Vnw6fNGHmV
         fku+JdRqQxGjNBM04IYkQS6o73vIN1fRUCLMzhuc0Ufr2pPHN0KBFf16Tmu1S3jopVQd
         K/HAn3sosbO5egQGzW400EAlorWMZLE0eGQaZNUWGlJ02uPh5lSIajlxNc6hBJCQhRab
         Vk/g==
X-Forwarded-Encrypted: i=1; AJvYcCUUQZC8lsMT26nGOEw6CcREsNC3wByShKZFkLlBYBwxdMhme0MzejU37iFp5DFs4rselRzXuEGwi4U=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwYl2pjdHbYHPzj0UG4txpHzBMto8CQ5p7CBo6AQtyfMlxGXn9j
	4pU/KLIXioDsxX2PNovAe8BK9elVfZhsIB9b4Ul3Tqe7jYwEV7f3hDes+gjVm49Uxg==
X-Gm-Gg: ASbGnct/XJTSCFRdxDdPotpAO03VBxA9C3BisG8/g+WkBtq6Z7367rv5AYLthuLCd+9
	2edLsIdHHRadomK3KfAjab4jy7hA2kXOqwbXcVkKx3W0nB4LC5t3SXk8Slv/MaEfjUXd0hNAuZa
	GKtShZSmSTqqVrMSDGn4Y1c4BiCfrVBi4vkQWLLkyyYuDwta+TF/dVi6HzlV9ibePPMJqF+7MXL
	Ru1Ku4T6kKXcpL1op9t9fkpXaIzBK0d2IeCEg4rv6F9GTncXVjZZFbHdvDRyO2wyVlPi8wSkOfM
	qiQ4VjL7StfZl2LvPar1PqF/F0d3EQJkaHvtxQUZuDsN2+xLkoMINAKuf2RzpVe0GwJZc4JfT/Y
	1nb4vKAZ+QLsjsvxG+9IpDbfT1lwBKOzdItdKLLcXcpMJpV0NRPfihFTYLqN0QnWO6W4HE6a5Mx
	JQs0BIib7zPnfhdWaVbEzdcq8Kk5Z6n2SLJvPljB05mdWzMYwZ9dCP+JpI9lHkSOmcctmCmfQ=
X-Google-Smtp-Source: AGHT+IES0Ac/vQUnMVXQTrNGb3vQdoIKL/A0mp3asKsEsBHGfToNYkaTtjt1n1YWbGsTiay721T4hg==
X-Received: by 2002:a5d:5f52:0:b0:425:8538:d3f6 with SMTP id ffacd0b85a97d-42704d5354amr9902641f8f.19.1761040050901;
        Tue, 21 Oct 2025 02:47:30 -0700 (PDT)
Message-ID: <dbe8a444-daf2-4929-921f-704aa5f48cde@suse.com>
Date: Tue, 21 Oct 2025 11:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86/ucode: Relax digest check when Entrysign is fixed
 in firmware
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251020131955.2928261-1-andrew.cooper3@citrix.com>
 <20251020131955.2928261-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251020131955.2928261-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.10.2025 15:19, Andrew Cooper wrote:
> @@ -597,3 +598,81 @@ static void __init __constructor test_digests_sorted(void)
>      }
>  }
>  #endif /* CONFIG_SELF_TESTS */
> +
> +/*
> + * The Entrysign vulnerability affects all Zen1 thru Zen5 CPUs.

And older ones are fine, or merely have no fixes produced?

>  Firmware
> + * fixes were produced in Nov/Dec 2025.  Zen3 thru Zen5 can continue to take
> + * OS-loadable microcode updates using a new signature scheme, as long as
> + * firmware has been updated first.
> + */

Yet what about Zen1/2?

> +void __init amd_check_entrysign(void)
> +{
> +    unsigned int curr_rev;
> +    uint8_t fixed_rev;
> +
> +    if ( boot_cpu_data.vendor != X86_VENDOR_AMD ||
> +         boot_cpu_data.family < 0x17 ||
> +         boot_cpu_data.family > 0x1a )
> +        return;
> +
> +    /*
> +     * Table taken from Linux, which is the only known source of information
> +     * about client revisions.
> +     */
> +    curr_rev = this_cpu(cpu_sig).rev;
> +    switch ( curr_rev >> 8 )
> +    {
> +    case 0x080012: fixed_rev = 0x6f; break;
> +    case 0x080082: fixed_rev = 0x0f; break;

In your reply you mentioned a "general off-by-1" when comparing with Linux,
but I'm in trouble understanding how both can be correct. Leaving aside the
1st line (for which you sent a Linux patch anyway), how can our
"(uint8_t)curr_rev >= fixed_rev" (i.e. "(uint8_t)curr_rev >= 0x0f") further
below be correct at the same time as Linux'es "return cur_rev <= 0x800820f"
(indicating to the caller whether a SHA check is needed) is also correct?
We say 0x0f is okay, while they demand a SHA check for that revision.

In any event, whatever (legitimate) off-by-1 it is that I'm failing to spot,
I think this would want explaining in the comment above.

> +    case 0x083010: fixed_rev = 0x7c; break;
> +    case 0x086001: fixed_rev = 0x0e; break;
> +    case 0x086081: fixed_rev = 0x08; break;
> +    case 0x087010: fixed_rev = 0x34; break;
> +    case 0x08a000: fixed_rev = 0x0a; break;
> +    case 0x0a0010: fixed_rev = 0x7a; break;
> +    case 0x0a0011: fixed_rev = 0xda; break;
> +    case 0x0a0012: fixed_rev = 0x43; break;
> +    case 0x0a0082: fixed_rev = 0x0e; break;
> +    case 0x0a1011: fixed_rev = 0x53; break;
> +    case 0x0a1012: fixed_rev = 0x4e; break;
> +    case 0x0a1081: fixed_rev = 0x09; break;
> +    case 0x0a2010: fixed_rev = 0x2f; break;
> +    case 0x0a2012: fixed_rev = 0x12; break;
> +    case 0x0a4041: fixed_rev = 0x09; break;
> +    case 0x0a5000: fixed_rev = 0x13; break;
> +    case 0x0a6012: fixed_rev = 0x0a; break;
> +    case 0x0a7041: fixed_rev = 0x09; break;
> +    case 0x0a7052: fixed_rev = 0x08; break;
> +    case 0x0a7080: fixed_rev = 0x09; break;
> +    case 0x0a70c0: fixed_rev = 0x09; break;
> +    case 0x0aa001: fixed_rev = 0x16; break;
> +    case 0x0aa002: fixed_rev = 0x18; break;
> +    case 0x0b0021: fixed_rev = 0x46; break;
> +    case 0x0b1010: fixed_rev = 0x46; break;
> +    case 0x0b2040: fixed_rev = 0x31; break;
> +    case 0x0b4040: fixed_rev = 0x31; break;
> +    case 0x0b6000: fixed_rev = 0x31; break;
> +    case 0x0b7000: fixed_rev = 0x31; break;

Without at least brief model related comments this looks extremely opaque.
Linux, as a minimal reference, at least has cpuid_to_ucode_rev() and the
accompanying union zen_patch_rev. Background of my remark is that I would
have expected there to be more models per Zen<N>, seeing in particular how
many different BKDGs / PPRs and RGs there are. Many RGs in particular say
they apply to a range of models, yet no similar ranges are covered here
(unless my deciphering attempts went wrong).

Jan

