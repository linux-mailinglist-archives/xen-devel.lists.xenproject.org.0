Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7DDD01D26
	for <lists+xen-devel@lfdr.de>; Thu, 08 Jan 2026 10:27:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1197458.1514988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmI8-0004JT-Gb; Thu, 08 Jan 2026 09:26:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1197458.1514988; Thu, 08 Jan 2026 09:26:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vdmI8-0004I2-Cm; Thu, 08 Jan 2026 09:26:52 +0000
Received: by outflank-mailman (input) for mailman id 1197458;
 Thu, 08 Jan 2026 09:26:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NAJ/=7N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vdmI7-0004Hw-Dv
 for xen-devel@lists.xenproject.org; Thu, 08 Jan 2026 09:26:51 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 289fe4f8-ec74-11f0-9ccf-f158ae23cfc8;
 Thu, 08 Jan 2026 10:26:49 +0100 (CET)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4308d81fdf6so1484441f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 08 Jan 2026 01:26:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5ee243sm15073026f8f.31.2026.01.08.01.26.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jan 2026 01:26:48 -0800 (PST)
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
X-Inumbo-ID: 289fe4f8-ec74-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767864408; x=1768469208; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P4mLTwPjaI3XoEOIJqOL2BPzieIXonwB7fI7oLVG0PQ=;
        b=WBwuVkv7+Z1QynkrcW9amzzASenUObagICH/Gr6Preqg6cMv/Ho+eHzarMviMU5zvE
         xQyF7AlwlAdGnBelpGui0mYtxRXURTZKFOY3G2hyIJU0qmvSP4b5hvZkK+W++KUHqy1P
         eh5MHiViqsyYg6n3BPzztUZpZYUaggVSqChGTCm6jnZN5IByFaKTBe+zypPBZV7FK5Ga
         2VUF0g/7z+QSsBmEC+zD4aGfBzNHkEwhAY94Ro1/S1FRqYx0r4vn+rMZAOcT9OhI/8j0
         5R9XxY56Z3Ye2UgXY5WHHv3zUO2TA0KrdO2rNPKs6r6q7XcmlRT3r8eRgtpJL/AFnAPp
         ymTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864408; x=1768469208;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P4mLTwPjaI3XoEOIJqOL2BPzieIXonwB7fI7oLVG0PQ=;
        b=NgCLnYOezFJ0E9wPIIZygPLbO3XhBbNEGQ29RNrpK9vMYvkUvhUKv7wvbSG5yCjWCk
         9wRqot4okzdaoxouBXouezK57YOR8hqgNMgh0RE1IJNcIJYjsB78uyH12n7rvRk5W93O
         Z4OapIShZWmVVzESkcWPP8i+HJ5NVTskVf79IwE7qIQXxahxV4JvocCDnWi2izwdx9LI
         8I946tJxvh32SPIxMK+lW8RZxysWBYA4wjEo1dos6cnAqwfg1EDodYqYXWbKMTfCZ0k5
         KPp0u+zpAusl7Y4NLHsxlf6FzkdI8bpZiwYtY98TuOMb7UpWcYXew/XZZXOnaMQ94RoD
         YZQw==
X-Forwarded-Encrypted: i=1; AJvYcCUNI71CMon8QD58jRrTm+xalDfSHnC7/i+L0by5mKMMrob0FHHkGy5zBLYjBI4UMcWJjDmghMWffS8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy543YLOz/3z0hAsjkbDvk69Ir2Ldtfmb4FlzG951DDcXILzJG9
	SVyXV7XwZKIEysnsdF8pi8/Zq2jTx/Fj81/oBPHOZC9IIJpMKkF7F7j5PXht6hDeTA==
X-Gm-Gg: AY/fxX6NkWXJ/+znfagfhq7wOiMyKkqXcvAVNWHRLqQ8lAOSEdNVFzHpkxm4YFoiPBp
	CAC+FptJfFx7tGzAPCtzgE0hUD+v3/GFUhuXMoAOKuagztV51tdzzybav2aoo+DnbUWs6h/kdIs
	8mdcFOqFcIe6QFTggFMcDT+ayS7Xwnya7ex6fVoKMcb+YRYk5QQd00WLYpvtMUyIdGhMIt4EMms
	BWFFUTSdeviXxjjIDB6u2ggktYZjj3S2hDoqDP4W8jLHLjxXpfE4uOeTIvQQEGWWoMGsI5ugEgC
	pcCL0aqGGUtq6Vy7hctZxQVBAi0rwQFPcGX3dyPP9CJuAqm3LEw4anK3+aEjUINXEJ2W5MhO/dJ
	3T8Nf1jzbaci9EWHncqJ40SB48dRcaM/TAFYqqbQ5Smw2SOdWfZJc+GI0ejRxIRrkRH/iSlQhXR
	1SCr5ukq7/UmWEBOd2sm8u1U6hFH0THPb5K2pZ9AJPfD7FSGoz0IYd4Uq/uJN+WMViGEVLI1WB1
	ZY=
X-Google-Smtp-Source: AGHT+IGO3cFPPjYO0Ia2S7IQeLgWQ3I0x0/1+ldcswyragmRFM7VYampwewqbEGz9zckn2kBwmPKsA==
X-Received: by 2002:a05:6000:2f87:b0:432:857d:e425 with SMTP id ffacd0b85a97d-432c374fcfbmr6128021f8f.30.1767864408562;
        Thu, 08 Jan 2026 01:26:48 -0800 (PST)
Message-ID: <ce0282f4-2b8c-42cf-a53e-d74202b2ecc9@suse.com>
Date: Thu, 8 Jan 2026 10:26:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/hvm: be more strict with XENMAPSPACE_gmfn source
 types
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20260107203259.59369-1-roger.pau@citrix.com>
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
In-Reply-To: <20260107203259.59369-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.01.2026 21:32, Roger Pau Monne wrote:
> XENMAPSPACE_gmfn{_range} allows moving gfn around the guest p2m: the mfn
> behind the source gfn is zapped from the origin and mapped at the
> requested destination gfn.  The destination p2m entries are always created
> with type p2m_ram_rw.
> 
> With the current checking done in xenmem_add_to_physmap_one() it's possible
> to use XENMAPSPACE_gmfn{_range} to change the type of a p2m entry.  The
> source gfn is only checked to be not shared, and that the underlying page
> is owned by the domain.
> 
> Make the source checks more strict, by checking that the source gfn is of
> type read/write RAM or logdirty.  That prevents the operation from
> inadvertently changing the type as part of the move.
> 
> Fixes: 3e50af3d8776 ('New XENMAPSPACE_gmfn parameter for XENMEM_add_to_physmap.')
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> Changes since v1:
>  - Also handle logdirty types.
>  - Return -ENOMEM on failure to unshare.
> ---
>  xen/arch/x86/mm/p2m.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)

Since this is now ready to go in, the question of backporting arises. You
explicitly wanted the change here to only go in on top of what is now
98fccdf0ac7c ("x86/mm: update log-dirty bitmap when manipulating P2M"). I
wouldn't have considered that for backporting, but I guess for these two
it can only be both, neither, or said earlier commit shrunk to the minimum
required for the change here. Thoughts on which route to take?

Jan

