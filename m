Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 105949B3206
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 14:45:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826582.1240891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Q3V-0007cZ-IV; Mon, 28 Oct 2024 13:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826582.1240891; Mon, 28 Oct 2024 13:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5Q3V-0007aC-Ft; Mon, 28 Oct 2024 13:45:13 +0000
Received: by outflank-mailman (input) for mailman id 826582;
 Mon, 28 Oct 2024 13:45:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xGmR=RY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t5Q3T-0007UB-TT
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 13:45:11 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d985bc61-9532-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 14:45:10 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43159c9f617so42516285e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 28 Oct 2024 06:45:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43193573cedsm114165805e9.4.2024.10.28.06.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Oct 2024 06:45:09 -0700 (PDT)
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
X-Inumbo-ID: d985bc61-9532-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730123110; x=1730727910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rOoN1FCp83K/7/KLfuIT+AbAC3zr9r6tRvG0GzQ9BIo=;
        b=dIQwxg3zKfU1BTJrleRVUBu2ahMmdKnICSbxN7EF56v6TezBhvrFdElRo1sy6tWQZV
         iiJ90Q94FZ9LMC5kz+Itzt8KrxI2jkN3OrseemmJ0iRVA8Lb8MBrnhGVlTjjrA9Iwzsi
         cgFBB8nIAYTFCKSb4O7smFr9tuvNbdtG36XUKqDmJFJXkr4MMtZJvFt4tV+clnZA3xQ0
         s2zbJeR/UDi4iHtDMkjQGb0csL6wZBI5eHNHhJ152v9dI+9tlCo7CO1nu+5X5aF/erMg
         6j4fu/0BQbjK8cty7n+bIwaaXK9d/w4RowOHURpouPBBA9vjnCSsHPtzhz0acd25AV4G
         djPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730123110; x=1730727910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rOoN1FCp83K/7/KLfuIT+AbAC3zr9r6tRvG0GzQ9BIo=;
        b=GBqXkT9JFTClMRcSdMhkJ/D98yvnfrqsxSzFA5TprIdcHMdoGgBKcDzUBE+OMT0WZS
         4l5f2Dq5VMcESYXSdtDdrwotlcYzWTE45X6cke7C1lS+FXWL2lklNft7yEmKywKad8HB
         qYdj/niWvQe0JdBtWY4rs8n+ruC1HYe8drOkPjs8u02c1cKy2DrBzDIOtlP+rmgd4NZv
         4C5ksfPz56o6fAb9YOmNfO5AeColGgnTDrDeGa6uk8D/z/sNO2RR5pF/I+Zh3Ib3K34R
         MVBgCVHIblfnupjzsuUOI4nVn/IyJxovj1OMvPBGfB9pKshVC1KAAz9bzK5mpS012sKi
         Pmdw==
X-Forwarded-Encrypted: i=1; AJvYcCUQhty12e9p9aSMPjqak2xIfbvOAqyHtzTCjCNdDxuCo0LKSc0dff47G3k4NebW9yZ0CP760hymR4w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWAJ3E7mA6gaq0zf7ruKO6GTVF6wTfxjefYVTDRsJ3Kz+RSC3+
	1xEzP0EBO19jOr8H4jdjrQ5NBE7hLnRqWlFcjy8QUPwHW0yAWJQq2QKUmraseFnZHQk1uMb7vRc
	=
X-Google-Smtp-Source: AGHT+IFejH0epO0ENIWEuiNMcQt6ba1at5pj9k5ow3Xy9dwu1MxIPP+x5Ciwk62aRShp+y4WVH3HUw==
X-Received: by 2002:a05:600c:3b9c:b0:42f:7c9e:1f96 with SMTP id 5b1f17b1804b1-4319ac6fc1cmr81825755e9.1.1730123109752;
        Mon, 28 Oct 2024 06:45:09 -0700 (PDT)
Message-ID: <6545adae-53e7-4f8d-b7fa-79cda4c3325e@suse.com>
Date: Mon, 28 Oct 2024 14:45:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] x86/ucode: Fold microcode_grab_module() into its
 single caller
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241028091856.2151603-1-andrew.cooper3@citrix.com>
 <20241028091856.2151603-6-andrew.cooper3@citrix.com>
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
In-Reply-To: <20241028091856.2151603-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.10.2024 10:18, Andrew Cooper wrote:
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -205,19 +205,6 @@ static void __init microcode_scan_module(struct boot_info *bi)
>      }
>  }
>  
> -static void __init microcode_grab_module(struct boot_info *bi)
> -{
> -    if ( ucode_mod_idx < 0 )
> -        ucode_mod_idx += bi->nr_modules;
> -    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
> -         !__test_and_clear_bit(ucode_mod_idx, bi->module_map) )
> -        goto scan;
> -    ucode_mod = *bi->mods[ucode_mod_idx].mod;
> -scan:
> -    if ( ucode_scan )
> -        microcode_scan_module(bi);
> -}
> -
>  static struct microcode_ops __ro_after_init ucode_ops;
>  
>  static DEFINE_SPINLOCK(microcode_mutex);
> @@ -831,7 +818,15 @@ static int __init early_microcode_load(struct boot_info *bi)
>      size_t size;
>      struct microcode_patch *patch;
>  
> -    microcode_grab_module(bi);
> +    if ( ucode_mod_idx < 0 )
> +        ucode_mod_idx += bi->nr_modules;
> +    if ( ucode_mod_idx <= 0 || ucode_mod_idx >= bi->nr_modules ||
> +         !__test_and_clear_bit(ucode_mod_idx, bi->module_map) )
> +        goto scan;
> +    ucode_mod = *bi->mods[ucode_mod_idx].mod;
> + scan:
> +    if ( ucode_scan )
> +        microcode_scan_module(bi);
>  
>      if ( !ucode_mod.mod_end && !ucode_blob.size )
>          return 0;

Could I talk you into doing away with the goto at the same time, by inverting
the if()'s condition? Preferably with that:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

