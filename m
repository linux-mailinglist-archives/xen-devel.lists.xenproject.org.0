Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1218B89BB32
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 11:05:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701850.1096389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtkwM-000409-Fi; Mon, 08 Apr 2024 09:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701850.1096389; Mon, 08 Apr 2024 09:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtkwM-0003yc-Ct; Mon, 08 Apr 2024 09:05:22 +0000
Received: by outflank-mailman (input) for mailman id 701850;
 Mon, 08 Apr 2024 09:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtkwL-0003yW-OG
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 09:05:21 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20695eba-f587-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 11:05:20 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-516d536f6f2so2771710e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 02:05:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v6-20020a05600c444600b0041565d750e1sm16099086wmn.2.2024.04.08.02.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 02:05:20 -0700 (PDT)
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
X-Inumbo-ID: 20695eba-f587-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712567120; x=1713171920; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NacJ8HfXj2eZMMxm2fax37uXprFoNiVcECLZPRctLBo=;
        b=OKROH9sqzACc/4Jgc9Gf7xs01V9Oq5IUuPrdI5MyZ2ViUXguVl7+jYLVFqcEMyiPN9
         VsoyMrF/mB5SxB1u9MU4DKrjb9WwKVI7bTnSt/fo08fosSWkfPNJuRYp4yYm+JYo21VK
         aKzMunpFrP6403hApU7GZNQ/eOuV8uSeP4ZxGoRjDnMS7DoP6pZCgJJ9F+ZQIXzhGXVl
         UcJDtWloRb5siPNSsOTs6XFzrblqVTbbsdPOeG9moMI+JQ8s07fJXjH6SRk/RfjqViHg
         ueZlhpgOFLH183FX45sGKJNhXGCK8iZTDTUKDH6oFqlqlIOE14ZYKG0gr8Wu2xeS4ZNn
         thew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567120; x=1713171920;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NacJ8HfXj2eZMMxm2fax37uXprFoNiVcECLZPRctLBo=;
        b=siIfU+uze21xL9TX3uVoPBSFrO7qWt/aKT3bhVG5XzwMqk8LnCxwE8FeiWaPZdCZBS
         p3RMA7jSCbnv/JToIzCawBZSoBB4AkLGpz4+xwq0WdGS/E0M6F/OIE8UKknViGZwXiSe
         5IRKS+CcD8sQEtHensiuc1EHXR1grgiCx0ua48hMwc3u4Jmda/+pMTbv8EdC36dnK9tB
         NB0wBzkrDyf5xc3GAh2RB4o74cxVF95AUGfBHksfvtH9MNe8mP3Ykksk9T+7noqpnIQN
         0QnV7csQsNU1Dc/cm7qTQ7ZlWp2NDdNH1b5RpqJRnGXfxWXef2s+ieUPD2t6deMPFSAc
         dhpg==
X-Forwarded-Encrypted: i=1; AJvYcCWe6JkuNuR6LNNiVfoAFS6okkx7ypbRjOH1ccSTGviUYGEr9BhkFmhHl4JZMJcpgYLZvB8O4FwiC/MPrXBs+vLidUcGNMyRNBS5S1yZWn4=
X-Gm-Message-State: AOJu0YzmSOP1Fkt5fLXQcsUxm5QUDYtetvuk6ENhEUw7gdaB1fAt7Fpz
	2om5Bhq2YMx7vbSBQOonA13N+xwFpL+4+OgdWsJ4Ze0oA+ePbx1qi3LzNlyEaw==
X-Google-Smtp-Source: AGHT+IHd9rrn30B6zz2NPUSdTt8XgFamk6BvdYJKQvK9FdmoNMhcxrZQN8/jiCy/5M47HDAdl+DY7w==
X-Received: by 2002:a05:6512:485c:b0:516:c763:b4f5 with SMTP id ep28-20020a056512485c00b00516c763b4f5mr5759166lfb.3.1712567120405;
        Mon, 08 Apr 2024 02:05:20 -0700 (PDT)
Message-ID: <f2b3afb3-95c6-4b7c-b890-ffaac15e724c@suse.com>
Date: Mon, 8 Apr 2024 11:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] x86: Remove x86 low level version check of microcode
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
 <20240405121128.260493-2-fouad.hilly@cloud.com>
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
In-Reply-To: <20240405121128.260493-2-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 14:11, Fouad Hilly wrote:
> Remove microcode version check at Intel and AMD Level.
> Microcode version check will be at higher and common level.

"will be" reads as if you're removing logic here, to introduce some replacement
later. If so, that's going to be a transient regression, which needs avoiding.
Indeed ...

> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -383,12 +383,8 @@ static struct microcode_patch *cf_check cpu_request_microcode(
>                  goto skip;
>              }
>  
> -            /*
> -             * If the new ucode covers current CPU, compare ucodes and store the
> -             * one with higher revision.
> -             */
> -            if ( (microcode_fits(mc->patch) != MIS_UCODE) &&
> -                 (!saved || (compare_header(mc->patch, saved) == NEW_UCODE)) )
> +            /* If the provided ucode covers current CPU, then store its revision. */
> +            if ( (microcode_fits(mc->patch) != MIS_UCODE) && !saved )
>              {
>                  saved = mc->patch;
>                  saved_size = mc->len;

... this looks like a logic change to me, with there not being anything
similar in common code afaics. Am I overlooking anything?

> --- a/xen/arch/x86/cpu/microcode/intel.c
> +++ b/xen/arch/x86/cpu/microcode/intel.c
> @@ -294,8 +294,7 @@ static int cf_check apply_microcode(const struct microcode_patch *patch)
>  
>      result = microcode_update_match(patch);
>  
> -    if ( result != NEW_UCODE &&
> -         !(opt_ucode_allow_same && result == SAME_UCODE) )
> +    if ( result != NEW_UCODE && result != SAME_UCODE )
>          return -EINVAL;

I'm afraid I can't relate this adjustment with title and description of
the patch.

Jan

