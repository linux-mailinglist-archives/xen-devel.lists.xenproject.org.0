Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FA48C6834
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 16:03:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722404.1126311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FDy-0004F2-91; Wed, 15 May 2024 14:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722404.1126311; Wed, 15 May 2024 14:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FDy-0004Ct-6L; Wed, 15 May 2024 14:03:18 +0000
Received: by outflank-mailman (input) for mailman id 722404;
 Wed, 15 May 2024 14:03:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7FDw-0004BW-F8
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 14:03:16 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id df202ac6-12c3-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 16:03:14 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a59a934ad50so184729066b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 07:03:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a50365669sm625656366b.193.2024.05.15.07.03.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 07:03:13 -0700 (PDT)
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
X-Inumbo-ID: df202ac6-12c3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715781794; x=1716386594; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZpRkRANNIioplkw+kPkU6qK+ewThZFhCVvAQJd+Nbwc=;
        b=XTLQjGYK2m/D38oE1t6J17k43GEW0sPczbEFR7u16V2oXqm2TnmIv4ly1PyPjlpUdS
         1ZlnE7m2twN1ZlAVhq6FCCC0JG/GfwXCW/doXC9bZVHbsklH1dt6pzhZu8E6VFAAdtRi
         QMGuFgjI9qb7zeF625M1Bqg7VQJhfiN9qB0MlxgKVR/tIIMu5/pnCvctiBocQKaKRvEO
         Gan2NdidZU2QHpqXCQNM0/gxrUStSuBLfqLoXgKpdIqfDDtTJLDgRYzb426mVQY5VCe0
         iOCqYYucpjV+kjDYyUbLP9k9NugKfP7BooIMuPwKMWW/BlmyXpnYg33kXk2ZdsBqQXIf
         Qhqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715781794; x=1716386594;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpRkRANNIioplkw+kPkU6qK+ewThZFhCVvAQJd+Nbwc=;
        b=RV5y51InNsrlzlFsSR0AJMnTsGP5b60Z1M4rgxwcYB73/TPhKRNq/l8bqKWj+lycvd
         Np28OUOwuBeErvutFwnHmIha7Cfcfro24zMkzDvbZitkyeP/ae6Vdl4T4uHzHm89zbgi
         rALoGZza4B33PjI56iUCrAfOM1ZjD5+ZER6gDsvhRPI0VfVv2RgP88608qQWDuw4Nlqf
         W1Dl/n2dJr4TcGx8ydAf/qSuYjpnjkOUcRbMKXg7fX9aUDUVeQRjh0nrm/OujqWrpJfq
         UzakZYxqUSpGmu8504Pio9NRsXXRWc4aYb6VS53RG4hjdSKvI/XcWkHEu3XYSHWS52+L
         RLwg==
X-Forwarded-Encrypted: i=1; AJvYcCWG6TRpKsfQ7LeU9vH9RjJWd9vkG2Oj8+Ol9NPptkTQtYPUGnWqywF1zx03/Uh6Vhswt+5S0AFp8uZUqhd9pQLIyGjUq6xoVsoapetZPgs=
X-Gm-Message-State: AOJu0YyaN2e4KADk9EAChY/DzTABKSq/Wtv35cFF15mCmV7py3Zsk7CK
	MfTdRHecClEtaM5Us6gwkDJg9ML/xwDe5Jzu1b0Ka/LzwVSsDW6WBA+Z83KF+Q==
X-Google-Smtp-Source: AGHT+IEe+ZWUtjwwLA8Mi2hbyOOfcHtrqI6oHi42cwIUmPIEZQq7xxsB8kNSVytzggVNRp/vE5yPHA==
X-Received: by 2002:a17:906:75a:b0:a59:fca5:ccaa with SMTP id a640c23a62f3a-a5a2d53b020mr1008479966b.13.1715781793975;
        Wed, 15 May 2024 07:03:13 -0700 (PDT)
Message-ID: <6d10f5ea-991a-4070-9c4e-cf7c692d2759@suse.com>
Date: Wed, 15 May 2024 16:03:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 08/19] xen/x86: Add build assertion for fixmap
 entries
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-9-eliasely@amazon.com>
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
In-Reply-To: <20240513134046.82605-9-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 15:40, Elias El Yandouzi wrote:
> The early fixed addresses must all fit into the static L1 table.
> Introduce a build assertion to this end.
> 
> Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>
> 
> ----
> 
>      Changes in v2:
>          * New patch
> 
> diff --git a/xen/arch/x86/include/asm/fixmap.h b/xen/arch/x86/include/asm/fixmap.h
> index a7ac365fc6..904bee0480 100644
> --- a/xen/arch/x86/include/asm/fixmap.h
> +++ b/xen/arch/x86/include/asm/fixmap.h
> @@ -77,6 +77,11 @@ enum fixed_addresses {
>  #define FIXADDR_SIZE  (__end_of_fixed_addresses << PAGE_SHIFT)
>  #define FIXADDR_START (FIXADDR_TOP - FIXADDR_SIZE)
>  
> +static inline void fixaddr_build_assertion(void)
> +{
> +    BUILD_BUG_ON(FIX_PMAP_END > L1_PAGETABLE_ENTRIES - 1);
> +}
> +
>  extern void __set_fixmap(
>      enum fixed_addresses idx, unsigned long mfn, unsigned long flags);
>  

In addition to earlier comments that were given - this looks like it wants to
be part of another patch (the previous one? a subsequent one?), rather than
being standalone. Such an check makes sense in connection with code actually
leveraging the assumption checked.

Jan

