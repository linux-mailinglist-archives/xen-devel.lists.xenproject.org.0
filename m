Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC43D9C3A4D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 09:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833364.1248494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQF6-0001Ag-Gm; Mon, 11 Nov 2024 08:57:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833364.1248494; Mon, 11 Nov 2024 08:57:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQF6-00017y-EA; Mon, 11 Nov 2024 08:57:52 +0000
Received: by outflank-mailman (input) for mailman id 833364;
 Mon, 11 Nov 2024 08:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAQF4-00017o-TN
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 08:57:50 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 059171c7-a00b-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 09:57:47 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43168d9c6c9so36364325e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 00:57:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04ceasm12143054f8f.102.2024.11.11.00.57.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 00:57:46 -0800 (PST)
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
X-Inumbo-ID: 059171c7-a00b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmEiLCJoZWxvIjoibWFpbC13bTEteDMyYS5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA1OTE3MWM3LWEwMGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzE1NDY3LjIzODEyLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731315466; x=1731920266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1m1zPo6jdM2Gh9cdyq4GyR6RtWIvQAlYUfRTefeTzbo=;
        b=I2Ard/dcVVnBsD1I3BKi/v5T+n5LzPEepxggnhNAq5UQfmV64k8mZKIpthHchCTnwc
         fR+sQsK+O95HvsYi1c+tfewsNTUYPuCiqIImAmAkg1BJGUbrVZWKQyNCBw/VTrfI5EAM
         EKobOsR/uXb6XGikPyZSqQfXvAoqlW3HU7oyAvL+UqrlnJaVrLtEhe9WyG4eNoTIvFaW
         sHwEbq7yn4XnEm87H6o5Sw8pUiV+xycRtkMwnL9d6Kxij8XCXBF39CGqjvtH8h3MpzZp
         VqNMChcVvus0M1CbikeE5DvH85sL8tv2pXz4irh2/n427uRWz9SGQs53XOUKE3tLpxpJ
         SY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731315466; x=1731920266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1m1zPo6jdM2Gh9cdyq4GyR6RtWIvQAlYUfRTefeTzbo=;
        b=jlcSJfOI/RYOSFBdoXMB5m6JvEKC1RKBOXWXwL1394D+eJG82cQefgl0PzpJXc9DAx
         Ctm824HUiVVlBCiSUJ0CznseT9aW7yYj7+5IDM+0mXbZTVdQ9JJxotJ6t/ZOlLwbJIqc
         +tvOyFHza1AhZxZp1CAw1dct+ZplaI5NbOrYoVxe9Y7+v8U7wJ5MvzvfaMJNdfn7SIwv
         FC9ApaXzLYnVmVx203EOsDmXJdFc2rB/0BMP/7+UkBJYIn3vrFLmSSaOJZA6B3xKYHCj
         IZviOdW0TmsBkA8Qs2JaMN/44qavJe4WiH7QzX/ZAc2dojM+mKXmHnpY4TUYV3K8Oywo
         SnQA==
X-Forwarded-Encrypted: i=1; AJvYcCXN9HfsiVWUH81r7TJyDr2M3YaGe4lmDCHucpPzOi1vbTkmZZ3peResAzzNR+gLWG6nF1fJR8wkFcQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOxkiWpp7Bbzw9yqkEfbLSoJ4TvmvZSPIQrCBOxuSYx9Q3T9xz
	XuOk420ZEx83PctjhUte+BHPNFtiS12L7kAXdHBkAuGQmAJIbZbvspeEkk4CNQ==
X-Google-Smtp-Source: AGHT+IG0r8mz9znMZ5imQtkbmU77mLuGGJqyDWkfSZxZoGkTSDMJOt1yQoSNbb0eNOwse1uow4Stfg==
X-Received: by 2002:a05:6000:1ac5:b0:37c:cdb6:6a9e with SMTP id ffacd0b85a97d-381f1866f1bmr9939200f8f.9.1731315466609;
        Mon, 11 Nov 2024 00:57:46 -0800 (PST)
Message-ID: <2af354d9-788b-4ea7-977c-d9aa64704a98@suse.com>
Date: Mon, 11 Nov 2024 09:57:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/mm: introduce helpers to detect super page
 alignment
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241108113144.83637-1-roger.pau@citrix.com>
 <20241108113144.83637-2-roger.pau@citrix.com>
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
In-Reply-To: <20241108113144.83637-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.11.2024 12:31, Roger Pau Monne wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5232,6 +5232,12 @@ int map_pages_to_xen(
>      }                                          \
>  } while (0)
>  
> +/* Check if a (virt, mfn) tuple is aligned for a given slot level. */
> +#define IS_LnE_ALIGNED(v, m, n) \
> +    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << (PAGETABLE_ORDER * (n - 1))) - 1)
> +#define IS_L2E_ALIGNED(v, m) IS_LnE_ALIGNED(v, m, 2)
> +#define IS_L3E_ALIGNED(v, m) IS_LnE_ALIGNED(v, m, 3)
> +
>      L3T_INIT(current_l3page);
>  
>      while ( nr_mfns != 0 )
> @@ -5249,9 +5255,7 @@ int map_pages_to_xen(
>          L3T_LOCK(current_l3page);
>          ol3e = *pl3e;
>  
> -        if ( cpu_has_page1gb &&
> -             !(((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
> -               ((1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) - 1)) &&
> +        if ( cpu_has_page1gb && IS_L3E_ALIGNED(virt, mfn) &&
>               nr_mfns >= (1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) &&
>               !(flags & (_PAGE_PAT | MAP_SMALL_PAGES)) )
>          {
> @@ -5370,8 +5374,7 @@ int map_pages_to_xen(
>          if ( !pl2e )
>              goto out;
>  
> -        if ( ((((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
> -               ((1u << PAGETABLE_ORDER) - 1)) == 0) &&
> +        if ( IS_L2E_ALIGNED(virt, mfn) &&
>               (nr_mfns >= (1u << PAGETABLE_ORDER)) &&
>               !(flags & (_PAGE_PAT|MAP_SMALL_PAGES)) )
>          {
> @@ -5541,9 +5544,7 @@ int map_pages_to_xen(

About 50 lines up from here there's another place where I think
IS_L2E_ALIGNED() wants using. That becomes noticeable with the remark
I'm about to make on patch 2, on this ...

>   check_l3:
>          if ( cpu_has_page1gb &&
>               (flags == PAGE_HYPERVISOR) &&
> -             ((nr_mfns == 0) ||
> -              !(((virt >> PAGE_SHIFT) | mfn_x(mfn)) &
> -                ((1UL << (L3_PAGETABLE_SHIFT - PAGE_SHIFT)) - 1))) )
> +             ((nr_mfns == 0) || IS_L3E_ALIGNED(virt, mfn)) )
>          {

... similar construct (checking "flags == PAGE_HYPERVISOR"). Not sure
if I should also make this kind of an adjustment while committing ...

Jan

