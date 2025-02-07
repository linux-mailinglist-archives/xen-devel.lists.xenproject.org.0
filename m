Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65802A2C396
	for <lists+xen-devel@lfdr.de>; Fri,  7 Feb 2025 14:31:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.883708.1293634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgORP-00044O-2M; Fri, 07 Feb 2025 13:30:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 883708.1293634; Fri, 07 Feb 2025 13:30:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tgORO-00042O-V4; Fri, 07 Feb 2025 13:30:42 +0000
Received: by outflank-mailman (input) for mailman id 883708;
 Fri, 07 Feb 2025 13:30:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tgORN-00042I-JM
 for xen-devel@lists.xenproject.org; Fri, 07 Feb 2025 13:30:41 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b90e6f06-e557-11ef-a073-877d107080fb;
 Fri, 07 Feb 2025 14:30:40 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4363dc916ceso19200365e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 07 Feb 2025 05:30:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dbde0fd0dsm4479241f8f.75.2025.02.07.05.30.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 05:30:39 -0800 (PST)
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
X-Inumbo-ID: b90e6f06-e557-11ef-a073-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738935040; x=1739539840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BGdEgRa+4+LPWKK+VX1djXT670zsmpi/N4ilZJzqC+Q=;
        b=FqEC43zsmLIL1Kk0riLi23Ihg4QaqPcwcTvduEfO7plGxnB4by88I79afMT0eU2Zwy
         UI69U3GetwiXX8RyFkWrNFG/MN/oNX+eXcA2yoSSoYrQudhsYU1euIyH7RBpw1lGmj66
         f6968JceAo5jjZuN/yUdjduRVfRtv+LBIY57Q6bRrn1mWcVzNPmb8ZAkXPkJkh+y+Wg2
         +dhxTR5D/ww8loduigwjsJaWNvoN08/Zu4Jh5gd2GliVJE+PDPcw1GpMkBeRkcB1ulIX
         hP7pNxlZJKg8CmjsU/cyanVmpG1acLy+xTVfyWByydyojEU5INvH16r2OFgtl5dUyn+F
         LB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738935040; x=1739539840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGdEgRa+4+LPWKK+VX1djXT670zsmpi/N4ilZJzqC+Q=;
        b=idhansnsjypcLhYx88SHU3yHsHvhEWoIL8Pbv8YkGL6BTsn/kaE1zYWvdhxOHRMZnu
         ULM34qZ7O+81mlS71K7TO8VQ+5dm9AOoWjwzG61bNYPREX2N1/roLSWmUHuBJ5FonT1L
         iD1UTT0IPgxegJzhneLQ/BD40TeY+MTp4OBO06iILwHQoXoiLQyMB6uSOpAN5l8gzR/W
         BDW0a7H3o3Ts3GUDGmeduUb64mQLXcHRcxs3uvV5kP1MdlfJxNTCwlL2ADYVKgHIV5wn
         E5XQjwanbXta7BN3VQssLLGRB5PdcMvJb/Ib2bnjBlKoB+8RZGLfqYfTdVqjv4kITGMz
         jrlA==
X-Forwarded-Encrypted: i=1; AJvYcCUMOjBJaCYuFL3zqj4G07/64FMJEotb0ILawT5SgqIV6uCcRmrDpm1z34ejt+i+0FxxZw1OYYIm+6M=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/76bXnDfSZ6yUbiV1KKyDC6obOWQ4ZQDty3rqHY5+xf4Ah3xH
	6Eca7UbQoyI/N5G3YI/K8NdFi/f1qN0jbD8gfVAuqNTUvyM471vc5arFloAavg==
X-Gm-Gg: ASbGncsNuUFYjd0TaSjcJs7HjwqRRkdiWpPwKf3tp2y87SIyzqWIcnCcCSdglo6teKj
	G+u959UTrbZAiKeBq7pMnAgxB8pBLH4w3lPDX3XFhlnPh4NkWd5eyGX+yAIA32tErIWvaqp05xu
	98B3BSGBwZKlMM558m0KFdtl3ru+FPTCIOEvUWCK/r9/g9Leg3QElhWgE73Zij4noXaD1pH7HU9
	EM3hPS8nj/UXcSkCre6+1vQ9rQLWbj4s3NopqsHaFRAEYquu2cQT0YW61VjH+nDa2dSDd9AF+Ft
	r5R/5AX+p1g9FLAi+1Yfe8tZ55lgZ7ZvuFySNziNpSF1uLbF/wwabur7mt5NTKoT3KC1EvT8bZl
	b
X-Google-Smtp-Source: AGHT+IEBbR7Uiazs+EWAu75fDUqwkO7AD5cVzOQZIdmaT86J55A7lKJssXM8QwZdKgyO6kGUQBH2Sg==
X-Received: by 2002:a05:6000:2c2:b0:38b:d807:f3be with SMTP id ffacd0b85a97d-38dc99096efmr1913634f8f.3.1738935039575;
        Fri, 07 Feb 2025 05:30:39 -0800 (PST)
Message-ID: <26deedab-b48c-4000-9937-b6b168fd590b@suse.com>
Date: Fri, 7 Feb 2025 14:30:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.20? v3 2/3] xen/riscv: update defintion of
 vmap_to_mfn()
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1738933678.git.oleksii.kurochko@gmail.com>
 <bbea545c2ca25f5e827e4d3b4cb2466478791480.1738933678.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <bbea545c2ca25f5e827e4d3b4cb2466478791480.1738933678.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2025 14:13, Oleksii Kurochko wrote:
> vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA from
> either the direct map region or Xen's linkage region (XEN_VIRT_START).
> An assertion will occur if it is used with other regions, in particular for
> the VMAP region.
> 
> Since RISC-V lacks a hardware feature to request the MMU to translate a VA to
> a PA (as Arm does, for example), software page table walking (pt_walk()) is
> used for the VMAP region to obtain the mfn from pte_t.
> 
> To avoid introduce a circular dependency between asm/mm.h and asm/page.h by
> including each other, the macro _vmap_to_mfn() is introduced in asm/page.h,
> as it uses struct pte_t and pte_is_mapping() from asm/page.h. _vmap_to_mfn()
> macro is then reused in the definition of vmap_to_mfn() macro in asm/mm.h.
> 
> Fixes: 7db8d2bd9b ("xen/riscv: add minimal stuff to mm.h to build full Xen")
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v3:
> - Move vmap_to_mfn_ to asm/page.h to deal with circular dependency.
> - Convert vmap_to_mfn_() to macros.

Why both?

> --- a/xen/arch/riscv/include/asm/page.h
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -210,6 +210,13 @@ static inline pte_t pte_from_mfn(mfn_t mfn, unsigned int flags)
>  
>  pte_t pt_walk(vaddr_t va, unsigned int *pte_level);
>  
> +#define _vmap_to_mfn(va)                \
> +({                                      \
> +    pte_t entry = pt_walk((va), NULL);  \

If this is to remain a macro, va doesn't need parenthesizing (as the argument
passed is just the identifier, not an expression.

Be careful with the naming of macro local variables. Consider a use size (for
whatever reason) having

    unsigned long entry;
    ...
    mfn = vmap_to_mfn(entry);

This is where appending an underscore comes into play.

Jan

