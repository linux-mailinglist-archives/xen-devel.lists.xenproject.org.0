Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA1089BB6D
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 11:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701855.1096400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtl7W-0006H7-JH; Mon, 08 Apr 2024 09:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701855.1096400; Mon, 08 Apr 2024 09:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtl7W-0006E8-Fz; Mon, 08 Apr 2024 09:16:54 +0000
Received: by outflank-mailman (input) for mailman id 701855;
 Mon, 08 Apr 2024 09:16:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WYQ4=LN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rtl7V-0006E2-Jh
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 09:16:53 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbcc7b1b-f588-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 11:16:51 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2d886dd4f18so11309431fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 02:16:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 m6-20020a05600c4f4600b004166cdae639sm3314707wmq.35.2024.04.08.02.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Apr 2024 02:16:50 -0700 (PDT)
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
X-Inumbo-ID: bbcc7b1b-f588-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712567811; x=1713172611; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PCalnsKRo39dwx6w4CpccC7VPUprd+/RzeNYu5Vx/oU=;
        b=FVoOqZRx84oChEalvFPgcRj2Y6fuF1+sp2bWsfGfYCwXK3w/PXmPX6qMyPwKfcXeX9
         cJ0UGSLsEMjAfT4rtEtjh8DUgE0ZTXipEV1yglOcvnoQUNaTlLv+S8o99VjyMfKApTsn
         OP399B9reS6gw8cpzELIm4gQku4ZuRygVcA0Y8xU7YDwDPCBKWH+5AshTI0NLUuokutV
         lnTaK9QIzWg76IdVhoFxm7JiWQ5MZhPWNx4VBChMcUjs1pt4Ly3oRKx86hw5sREJ9jWx
         mT/y4Gvx20DWiR7GgcIH7X+5pf7dHQkSG8Q3KLKOBPAM4vID48ms0TBHPyyMPa6Ud4lF
         5DIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712567811; x=1713172611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PCalnsKRo39dwx6w4CpccC7VPUprd+/RzeNYu5Vx/oU=;
        b=SQ0sGPWZ4/P3hUQuoXXTmfng+ybhWzPbQ04pDa4gat83kpY9euVpi6llW+gAdTYIwS
         +EzLSoVdSPivY+nhaX8Zx5wkthIYX1cokg19pPuPWuJ8t8OpXR3CGghAFAX+kivTuixm
         8Rxuk1qETaHpsjZVK6QkU/+6zV8LlTmHox8fmDjK6Ygm3j6jje7Swvz1V/B5vrSIj/s0
         HEjQ5tT3HnYI/GwIR3FljwVURlSqm3oAMpJR38NsCxtuQ1BJ4UxM4Dyfk2DM9JmLXus3
         XX+6/MUrVrgPT7YlMSc+bMECjVjC8Aed4csUJD2DNX4Rmi6cKoprR1dLgNZzzxjNYkxi
         Wgdw==
X-Forwarded-Encrypted: i=1; AJvYcCUe9cp0FQJIlqhcZonalgRP5BLHB1AtTUsWywz2RtOvIqtHwYbOjXL/bEfRwvyT6eg4Z7eNUiKp3pOHSvIArv8qtSDV/SKp1yQ2ljTkzSA=
X-Gm-Message-State: AOJu0YxNQ4m8IGu2Dxnb4ZD67nFMMGqrnO9MXyb8CJOmuTV7ys0Avxl+
	L5T7/HnJqOLavvLijw1974WwOHPM10PczdBewb40XYnryCue1TX8ZJyXaRXrrQ==
X-Google-Smtp-Source: AGHT+IGU5jrsxkIZzwLxEdy0fRMKeg5P5SdQWtHJDNZldH6mMBtODN5TZpf1NPv2x3H6IxQttGFHcw==
X-Received: by 2002:a05:651c:1545:b0:2d2:3fac:5fc7 with SMTP id y5-20020a05651c154500b002d23fac5fc7mr6073966ljp.45.1712567810745;
        Mon, 08 Apr 2024 02:16:50 -0700 (PDT)
Message-ID: <f789bf74-8296-4127-9612-a46d02a422ee@suse.com>
Date: Mon, 8 Apr 2024 11:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] x86: Refactor microcode_update() hypercall with flags
 field
Content-Language: en-US
To: Fouad Hilly <fouad.hilly@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
 <20240405121128.260493-3-fouad.hilly@cloud.com>
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
In-Reply-To: <20240405121128.260493-3-fouad.hilly@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05.04.2024 14:11, Fouad Hilly wrote:
> @@ -708,11 +712,13 @@ static long cf_check microcode_update_helper(void *data)
>      return ret;
>  }
>  
> -int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
> +int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len, unsigned int flags)
>  {
>      int ret;
>      struct ucode_buf *buffer;
>  
> +    ucode_force_flag = (flags == XENPF_UCODE_FLAG_FORCE_SET)? 1: 0;

No need for ?: when the lhs has type bool.

But - do we really need to resort to parameter passing via static variables
here? If it's unavoidable, its setting needs to move inside a locked region
(with that region covering everything up to all consumption of the value).

Further, to avoid the same issue again when another flag wants adding, you
want to check that all other bits in the flags field are clear.

> --- a/xen/arch/x86/include/asm/microcode.h
> +++ b/xen/arch/x86/include/asm/microcode.h
> @@ -22,7 +22,7 @@ struct cpu_signature {
>  DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
>  
>  void microcode_set_module(unsigned int idx);
> -int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len);
> +int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len, unsigned int flags);

Nit: Too long line.

> --- a/xen/include/public/platform.h
> +++ b/xen/include/public/platform.h
> @@ -99,6 +99,10 @@ struct xenpf_microcode_update {
>      /* IN variables. */
>      XEN_GUEST_HANDLE(const_void) data;/* Pointer to microcode data */
>      uint32_t length;                  /* Length of microcode data. */
> +    uint32_t flags;                   /* Flags to be passed with ucode. */
> +/* Force to skip microcode version check when set */
> +#define XENPF_UCODE_FLAG_FORCE_NOT_SET 0
> +#define XENPF_UCODE_FLAG_FORCE_SET     1
>  };

The safety of this growing of an existing stable ABI struct wants at least
briefly mentioning in the description.

> @@ -624,6 +628,10 @@ struct xenpf_ucode_revision {
>  typedef struct xenpf_ucode_revision xenpf_ucode_revision_t;
>  DEFINE_XEN_GUEST_HANDLE(xenpf_ucode_revision_t);
>  
> +/* Hypercall to microcode_update with flags */
> +#define XENPF_microcode_update2    66
> +
> +

No double blank lines please.

Jan

