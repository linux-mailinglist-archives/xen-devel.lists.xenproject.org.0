Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA3D9C3A0E
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 09:51:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833354.1248485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQ84-0000Ok-Mx; Mon, 11 Nov 2024 08:50:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833354.1248485; Mon, 11 Nov 2024 08:50:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAQ84-0000M9-K2; Mon, 11 Nov 2024 08:50:36 +0000
Received: by outflank-mailman (input) for mailman id 833354;
 Mon, 11 Nov 2024 08:50:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/YTX=SG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tAQ83-0000M3-EI
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 08:50:35 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 02149315-a00a-11ef-a0c6-8be0dac302b0;
 Mon, 11 Nov 2024 09:50:31 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4316e9f4a40so36333635e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 11 Nov 2024 00:50:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381eda04211sm12325739f8f.94.2024.11.11.00.50.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Nov 2024 00:50:31 -0800 (PST)
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
X-Inumbo-ID: 02149315-a00a-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzMiLCJoZWxvIjoibWFpbC13bTEteDMzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjAyMTQ5MzE1LWEwMGEtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxMzE1MDMxLjkyNDkwNCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1731315031; x=1731919831; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eyV46D3P+CGdce+m7n5Vyx/hfHv6bNIaMxlW57CtFNI=;
        b=b0vm94x3KOQJ3zccZtugnW6taZJtTwJ+oyebG6FcolbX4ikq4IGK6DNAqpSpFQ1vqP
         tHB9cR6goTZL8J2v7wYYyqzRC7HFUeVzmDtKomjLlU3KLXMg61nTVNM8sm8CJGMLD9Lk
         EUpc6zfyxjIWYRPIo0cUroti7KwwVaMElq6PGtODKdys8a5ejStfQBkMskwRxqLh+E+J
         P3MeweuIUuLgo+F1bhQiqTZwSmJ49CEGtaD12wvl68kgctk4sec34ye6McFKswyObrXK
         VjfNk0hfRsdFDZ6AZVVmwpq8eNI1f+kGDJ2PADyBTJ3sUfzCzw245IdqmRy1JsIzZiD5
         E8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731315031; x=1731919831;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eyV46D3P+CGdce+m7n5Vyx/hfHv6bNIaMxlW57CtFNI=;
        b=jG1iTHCVB9jbUBTi4jcV/NRbpkUWnsPI7F5nZxUSx1tLA9QbwOir9msxts6V5euZ/y
         FBmfneAZ7SIjIFmfBp/3VFNhNq4CbmeqHjW0z/fpdkIjIUdb61YxtPuwaYp/UriLH0Gk
         PFAZlUlAxNlCrti2tYYr67H83Fann3Wap9jllxGJcFOvz+GrSWXG+i0T5Ia7ipQwNTOs
         vMra63YDPlB8fDyh3KOnMgaV7R3n4sC1wMQjTcuRLRYKB3Uj/cYuB3dwVueeE6UHSp5Z
         NqOVWlceoFAryy4H6kUusdhoPHZc/aYF7spCTTVX1/GYxywRDBujJmT3ptUmYLSKQuJS
         Sk5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxow5iP9NdBCb7K2Xuia2x4QhIfGzg1/IeRp3WVswwAzkTwnKtVOFETAE67KfxniBdy3YH5s3QS4c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywel61ilXSCeAd/GVcIldYPMKcCKUPfc6Fn5bNoI47B4NpksbtF
	vByrlkHl5jSYsgUvqgpvJMMxBdBDH6b1tHqJqH50L3cD6qSPiVTUBEu8L+fzxA==
X-Google-Smtp-Source: AGHT+IH3guZaMjqDo4Lo03vQ/NiWWXCj/d3dxuk4QCiRO9vG8O0dQ5fizjja47H0ph2QnI5PAA3WRA==
X-Received: by 2002:a5d:64cb:0:b0:37d:50f8:a7f4 with SMTP id ffacd0b85a97d-381f188c98bmr11381214f8f.52.1731315031320;
        Mon, 11 Nov 2024 00:50:31 -0800 (PST)
Message-ID: <533ef71e-c3ee-4698-acb0-2def2618785b@suse.com>
Date: Mon, 11 Nov 2024 09:50:32 +0100
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
Content-Transfer-Encoding: 8bit

On 08.11.2024 12:31, Roger Pau Monne wrote:
> Split the code that detects whether the physical and linear address of a
> mapping request are suitable to be used in an L3 or L2 slot.
> 
> No functional change intended.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one further tweak:

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -5232,6 +5232,12 @@ int map_pages_to_xen(
>      }                                          \
>  } while (0)
>  
> +/* Check if a (virt, mfn) tuple is aligned for a given slot level. */
> +#define IS_LnE_ALIGNED(v, m, n) \
> +    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << (PAGETABLE_ORDER * (n - 1))) - 1)

n wants parenthesizing here, for Misra's sake. I'll take the liberty to do so
while committing.

Jan

