Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 380E98BCA4F
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 11:15:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717355.1119473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uR4-0006Aa-PM; Mon, 06 May 2024 09:15:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717355.1119473; Mon, 06 May 2024 09:15:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3uR4-000694-Mf; Mon, 06 May 2024 09:15:02 +0000
Received: by outflank-mailman (input) for mailman id 717355;
 Mon, 06 May 2024 09:15:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3uR3-00068s-8w
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 09:15:01 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c9d9ecc-0b89-11ef-b4bb-af5377834399;
 Mon, 06 May 2024 11:14:59 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2e2a4c20870so21773691fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 02:14:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h11-20020a05600c314b00b00418f72d9027sm19069461wmo.18.2024.05.06.02.14.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 02:14:58 -0700 (PDT)
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
X-Inumbo-ID: 1c9d9ecc-0b89-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714986899; x=1715591699; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2tyxXSkCHlpN1H8CHNsRUNsWeZzOljFYfMS4j355/3k=;
        b=WH++tKntYCZJOQoJtC9QEjxgFgqESbeq1h52eNgCjTArY0MNe9OjDmzECCg4ngMnAv
         IbXq4kallsIx2gQ0EEE5Ym9fDA96ZHBwJmsGMERHiroFGxHLmzyfRJrSO0yyvshoCRNv
         M3IGcL+2ISYG7lwj7Z3s6YjZ/NrBrVtnOq/MKpXWHAOA5Dt0mpo+iSteA4Y6cM7NPVqS
         0RSAf9w2XES9giAy5N/bgdEFR4u1AG1mZloIysPMITPrVDMswOI6es4A8L9YucmOWACd
         aS+pepp7IfCQbXIq6nBIuofx/P5vkG5ntfXHd8nJ4ZwIacWbBpNawc8mfNKs9D34HxQT
         BK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714986899; x=1715591699;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2tyxXSkCHlpN1H8CHNsRUNsWeZzOljFYfMS4j355/3k=;
        b=jrELEMPibvaHOwjyQuI0Hg2OXQFx7ggCzkVwgXx/SkrzgKTET6z3MzLCcZ5l72JfkA
         1mTEIiElhmGuDtTB0WE85PsTCp3sUtf+INUSOQFXq7FUMgfJoi2dlyYZ8/VhM2JNLxr4
         5lTMPdTR1FKRpK5Gv0pgIDNf58ax0weos1OeZv32A/CVHuIDgRw35VLzNU7FDTOiFuc6
         W+11ahJUlQdKJtaYFhMEh8Ad0Ym/9jdJc5pAiCEFjQpt1LqCUe/X8ECCnJMH0ebkqtxK
         pWgi+ZLnsIJT440uKZcUU12D2BL8Macxzj+XP+CqPGBhEfO8kVhApXlFvXx3soXfEjfn
         RK4w==
X-Forwarded-Encrypted: i=1; AJvYcCVF4DUI9X1+ojFhWX1vJGacz04sVmVwbIjAZ6ZNmDVIaK9etWhMwsTdWieK9slI7AZiF3wxLaZDobLSodAKfBb+USIUVWBvzF6JAM+OVT8=
X-Gm-Message-State: AOJu0YyI+h+7LuamPhPdFQfF45bnpSlNttFuItGQgCInNswYSDiU/VAr
	ezXBhwAd7pOmSb9hz73nY1X9paRp92df3//TCs/9ZV6N4obKj/PkgHJDDhPiJ9n/1W6OKGfMJFc
	=
X-Google-Smtp-Source: AGHT+IGxAhOnVIZrg5m27XIDi6E9jyltSEdVBtBzncF4zbR0jjOsJLJZvbhbg546JOYuqUkYOVSTTg==
X-Received: by 2002:a05:651c:b13:b0:2df:49b:27cc with SMTP id b19-20020a05651c0b1300b002df049b27ccmr6461992ljr.22.1714986898702;
        Mon, 06 May 2024 02:14:58 -0700 (PDT)
Message-ID: <ec48e32a-30e5-45ab-8f11-7d3d6ce6122e@suse.com>
Date: Mon, 6 May 2024 11:14:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] x86: Refactor microcode_update() hypercall with
 flags
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
 <20240430124709.865183-3-fouad.hilly@cloud.com>
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
In-Reply-To: <20240430124709.865183-3-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 14:47, Fouad Hilly wrote:
> @@ -633,12 +637,12 @@ static long cf_check microcode_update_helper(void *data)
>                                    microcode_cache);
>  
>          if ( result != NEW_UCODE &&
> -             !(opt_ucode_allow_same && result == SAME_UCODE) )
> +             !((opt_ucode_allow_same || ucode_force_flag) && result == SAME_UCODE) )

Why would "force" not also allow a downgrade?

> @@ -708,11 +712,15 @@ static long cf_check microcode_update_helper(void *data)
>      return ret;
>  }
>  
> -int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
> +int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
> +                     unsigned long len, unsigned int flags)
>  {
>      int ret;
>      struct ucode_buf *buffer;
>  
> +    if ( flags > 1 )

How is one to connect this literal 1 with what is really meant here? Also
would be nice if this check fit with other similar checks we do, i.e.

    if ( flags & ~XENPF_UCODE_FLAG_FORCE_SET )

> +        return -EINVAL;
> +
>      if ( len != (uint32_t)len )
>          return -E2BIG;

As an aside: Isn't this dead code, with the respective hypercall interface
struct fields (now) both being uint32_t?

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -311,7 +311,17 @@ ret_t do_platform_op(
>  
>          guest_from_compat_handle(data, op->u.microcode.data);
>  
> -        ret = microcode_update(data, op->u.microcode.length);
> +        ret = microcode_update(data, op->u.microcode.length, 0);
> +        break;
> +    }
> +
> +    case XENPF_microcode_update2:
> +    {
> +        XEN_GUEST_HANDLE(const_void) data;
> +
> +        guest_from_compat_handle(data, op->u.microcode2.data);
> +
> +        ret = microcode_update(data, op->u.microcode2.length, op->u.microcode2.flags);

Nit (style): Overlong line.

> --- a/xen/include/public/platform.h
> +++ b/xen/include/public/platform.h
> @@ -624,6 +624,19 @@ struct xenpf_ucode_revision {
>  typedef struct xenpf_ucode_revision xenpf_ucode_revision_t;
>  DEFINE_XEN_GUEST_HANDLE(xenpf_ucode_revision_t);
>  
> +/* Hypercall to microcode_update with flags */
> +#define XENPF_microcode_update2    66
> +struct xenpf_microcode_update2 {
> +    /* IN variables. */
> +    uint32_t flags;                   /* Flags to be passed with ucode. */
> +/* Force to skip microcode version check when set */
> +#define XENPF_UCODE_FLAG_FORCE_SET     1

Nit: What is "SET" in the identifier intended to mean?

Jan

