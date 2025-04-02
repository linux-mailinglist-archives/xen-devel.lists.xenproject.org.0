Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639AFA78C54
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 12:28:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935609.1336990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzvKe-0003SY-Vr; Wed, 02 Apr 2025 10:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935609.1336990; Wed, 02 Apr 2025 10:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzvKe-0003Q1-RL; Wed, 02 Apr 2025 10:28:28 +0000
Received: by outflank-mailman (input) for mailman id 935609;
 Wed, 02 Apr 2025 10:28:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzvKd-0003L4-BR
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 10:28:27 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 365aef39-0fad-11f0-9ea8-5ba50f476ded;
 Wed, 02 Apr 2025 12:28:26 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso43103965e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 03:28:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43eb6190bc4sm16297355e9.31.2025.04.02.03.28.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 03:28:25 -0700 (PDT)
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
X-Inumbo-ID: 365aef39-0fad-11f0-9ea8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743589706; x=1744194506; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=f0PgYp5QCMpyYh4GpAEi1Gm1bVUY1EFhMzr7c7SFzvo=;
        b=Sd1FoQkenh0sxOaJeuoB8iv4LBChKB4eRp71DUpymn8bSSYjizfEEj0i0CQ+loHB5+
         IFZkTzRMV2fFbzogzfEDy61J5QKovHQViOy3lMU6r9/L10QcLRgnFq4dznvAOOV0V/qp
         oVQ4rGvxg5jMfCtLVd77uLd9LhtntisyEWiislJr8QUqxKT+IFMUJGM20vCNX/oeW4/z
         fddfGfCYY2N92y7bQBgx/Wm5mXPci7bw4G63x/FYpgsAa55S5mEQvEPgQYrARHzpFDiC
         361iw2fCDimarViVPCmBRCZ85KdqtN3TKgR88L9EuLZrClcCWTe4WhIobPT8RqYxtlYp
         H6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743589706; x=1744194506;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f0PgYp5QCMpyYh4GpAEi1Gm1bVUY1EFhMzr7c7SFzvo=;
        b=ZwIezPlbsKFBIy4PmLGZ8T3Kz5F5rL/6C+wxeURydl1UZTLlxruyc7u4ua3C5nb9d7
         p1WUcZ+NkTW93aVU76FImPys6KAKeRB8wlj9q2jHbqiQ/q7+ph0rvxhp3jNpAywebgFv
         SiUmVGL+PVKtcvROmGzOvAQumDpW7VRmLYVTO3c+JsJNtqqgfzExCl7P8sHLfOCj3mgU
         hMqkJz5QvyH73UTN9Rm+2aaXVcKMspXR/yGsHvZL8B1kgCa2+fxS9mSx/kah1CgWODeN
         pAbXpPbLd4MWfe8hbyQJEQYndSwlzxwi20cbXSDeufMULp4xSY9RtbX5ulVH1PQrkrv4
         DDBw==
X-Forwarded-Encrypted: i=1; AJvYcCWJSk/ZcWCbBd5+VC9oTO1t9LTY28EAOmoDnn4B/k5YTcV9PXF/qQWO8KfppmWfjWKpk4RHK9CjJFQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyVoqDeebNZTtNLB1CHtTXAeVjDqktdZoSqv4lLhflJJlN4yzpT
	iQ8vmKRV+QeXZmST1fPnoxwEouP6NjU6dJbQCRtusYp2q92MzX66sVF1Gavncw==
X-Gm-Gg: ASbGnctpWpVx/8Kp9CGo+EQOq0LXsxYEZsMIvN3AGklTloZHnuXoC6B/XA/n7zRa9Yj
	o/BxafPwJOWqo+rfj0gBPHY7x9VdR5CDk/9ANN3V1Ip58Vk54GNSgZ9eiFnuJhkaAVI1SUEBAhw
	/0s+RFg5sDyqD5h1Os8mzdGEg/a4tngzi766SKeBYYnMz30douuVHhI9ILiMnGM6xwgQd++nOM5
	/pbI4PTiUN6/JLClNeIivZ8r2U5QXQBFgBECNT03zxkbK9WH6BSNOWTMU3zHeWqP6BAwaf5ho58
	aXCftrebotvDRv7mBjnYE9ZJLDfnR+1rkUhS88xMZNxRCc9fKpn29GIUJDp/rLgcTM/VaDAIfCe
	E0bHZfn02GY1lTdqyTibAXAjtK4Hbtg==
X-Google-Smtp-Source: AGHT+IH5fHjI0lmyPYrvSftgUrAnjS4yNRaQFxxCfsGmKS7b1kmSsVn/uoHN9Q6i0glzckWF7TJMLQ==
X-Received: by 2002:a05:600c:4e12:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43db628c48bmr133194655e9.21.1743589706044;
        Wed, 02 Apr 2025 03:28:26 -0700 (PDT)
Message-ID: <47b6e49c-6692-46c8-88a8-5e2c2a08f805@suse.com>
Date: Wed, 2 Apr 2025 12:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/11] x86/efi: do not merge all .init sections
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-11-roger.pau@citrix.com>
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
In-Reply-To: <20250401130840.72119-11-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 15:08, Roger Pau Monne wrote:
> @@ -218,12 +214,15 @@ SECTIONS
>          */
>         *(.altinstr_replacement)
>  
> -#ifdef EFI /* EFI wants to merge all of .init.*  ELF doesn't. */
> -       . = ALIGN(SMP_CACHE_BYTES);
> -#else
>    } PHDR(text)
> -  DECL_SECTION(.init.data) {
> +#ifdef EFI
> +  /*
> +   * Align to prevent the data section from re-using the tail of an RX mapping
> +   * from the previous text section.
> +   */
> +  . = ALIGN(SECTION_ALIGN);

Does this need to be SECTION_ALIGN, growing image size by perhaps more than
1Mb (at least that's what I expect as an effect)? Wouldn't PAGE_SIZE suffice
for our purposes?

Jan

>  #endif
> +  DECL_SECTION(.init.data) {
>         *(.init.bss.stack_aligned)
>  
>         . = ALIGN(POINTER_ALIGN);


