Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E063E8957B9
	for <lists+xen-devel@lfdr.de>; Tue,  2 Apr 2024 17:05:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700196.1092940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfhT-0005Zs-5C; Tue, 02 Apr 2024 15:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700196.1092940; Tue, 02 Apr 2024 15:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrfhT-0005Xw-2B; Tue, 02 Apr 2024 15:05:23 +0000
Received: by outflank-mailman (input) for mailman id 700196;
 Tue, 02 Apr 2024 15:05:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hiiI=LH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rrfhR-0005Xq-Gk
 for xen-devel@lists.xenproject.org; Tue, 02 Apr 2024 15:05:21 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c11c48b-f102-11ee-afe5-a90da7624cb6;
 Tue, 02 Apr 2024 17:05:20 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-415db53d905so6866025e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 02 Apr 2024 08:05:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l2-20020a5d4bc2000000b0033e7e9c8657sm14411487wrt.45.2024.04.02.08.05.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 08:05:19 -0700 (PDT)
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
X-Inumbo-ID: 6c11c48b-f102-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712070319; x=1712675119; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CWcuMv44nSFhDFTIGIZoD0Y9dobFaXPqokLynMS2ZKk=;
        b=b8vFhxkYU+alQn1NeHEzgOUfPzeTHYoI1kEsypqBx22ztedHlwDNP7ZXciH+rPmoAp
         MG45PIC0RLaynXH3iLQSzKLHsJi95v9kVCd+EOp5vfq8QkF0eTDvFlgLxzRWNlQeFX/s
         Kshm+upTCroFrzY+gzwm9dlpg8qwH+Ldej0lhthibTX2U3bDpTB2ucQ6nYid9tknsd6k
         Q68WrGJXf8KPClzIz3aibVMjZTM6Joh+MLZ+OGKsYQpCjw3PPCvHLnO8vQgFgKAf0GwQ
         qqP6Sihd8Alxxp1+yW4bmgouY6sMPcOJmi18ygrNi8vcte5JNHJ0UEkMZWiCeteT5zvX
         ZDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712070319; x=1712675119;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CWcuMv44nSFhDFTIGIZoD0Y9dobFaXPqokLynMS2ZKk=;
        b=LQsXOWGPiQ1zJ7pJrVXLhApM3FcMHY7A4PaSTq0w8986MU5CCWTID2Ok6sb9cjWHta
         z0vZlPx4KzDvgD7Nm5jTyPl+uAljC4k8ipgasBjmMq27fvKSIX0GYzbH9uUpSeYNsOq3
         ZKvL154oPPlyYNJZi9SjD8h9hWNWn/9tM6Eifv3SO9HJJ9LZFM50/R1NfG+LWw5v+ijr
         0d+FaLqUHw+ySXMvZtzvD4Wgg0jAYU8VpCOsCel4/JXhpiJ+o3IeXAf/fJQzTuOXQnCl
         MHwwdHcXs6856xmOg6z0O3OgV9+OGDHW6pW40L0vfsKSa3B4QqVi/uLkWYqJr0ooug2r
         0BQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHr+Czp0WvqYZxbA3eEj1TawS2o2KiGBZaIccpBOiUxFXIR4KbhGO86pARMyn/kk3GNB/V04dSs7zTqu5km8nkvF0DP44ll3EsEJSYe98=
X-Gm-Message-State: AOJu0YwAb0rL5SiCBl0yFePQ9p8ZTOtPqqhxDgsZQt0ZnH2SgyUFkm/K
	fOm86A0VyV6bDs2sDuZcLU7gPAhCGMYIiY9ieUfcGsmY/ER88RlAIBkjrjDiGA==
X-Google-Smtp-Source: AGHT+IErliSxjw161tgbVH3e/vbNONDa+nfK+DPvoYJi15hdbleWG6wKThMwIwTu/TWTFcm3Yx+Hog==
X-Received: by 2002:a05:6000:188d:b0:343:4b39:9db5 with SMTP id a13-20020a056000188d00b003434b399db5mr5932047wri.56.1712070319618;
        Tue, 02 Apr 2024 08:05:19 -0700 (PDT)
Message-ID: <c958ad3e-5371-4a4e-81b5-8c313ac83258@suse.com>
Date: Tue, 2 Apr 2024 17:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 1/7] x86/msi: address violation of MISRA C Rule
 20.7 and coding style
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com, bertrand.marquis@arm.com,
 julien@xen.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1711700095.git.nicola.vetrini@bugseng.com>
 <2f2c865f20d0296e623f1d65bed25c083f5dd497.1711700095.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <2f2c865f20d0296e623f1d65bed25c083f5dd497.1711700095.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.03.2024 10:11, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> While at it, the style of these macros has been somewhat uniformed.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in v2:
> - Make the style change more consistent
> ---
>  xen/arch/x86/include/asm/msi.h | 49 +++++++++++++++++-----------------
>  1 file changed, 25 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
> index 997ccb87be0c..bd110c357ce4 100644
> --- a/xen/arch/x86/include/asm/msi.h
> +++ b/xen/arch/x86/include/asm/msi.h
> @@ -147,33 +147,34 @@ int msi_free_irq(struct msi_desc *entry);
>   */
>  #define NR_HP_RESERVED_VECTORS 	20
>  
> -#define msi_control_reg(base)		(base + PCI_MSI_FLAGS)
> -#define msi_lower_address_reg(base)	(base + PCI_MSI_ADDRESS_LO)
> -#define msi_upper_address_reg(base)	(base + PCI_MSI_ADDRESS_HI)
> -#define msi_data_reg(base, is64bit)	\
> -	( (is64bit == 1) ? base+PCI_MSI_DATA_64 : base+PCI_MSI_DATA_32 )
> -#define msi_mask_bits_reg(base, is64bit) \
> -	( (is64bit == 1) ? base+PCI_MSI_MASK_BIT : base+PCI_MSI_MASK_BIT-4)
> +#define msi_control_reg(base)        ((base) + PCI_MSI_FLAGS)
> +#define msi_lower_address_reg(base)  ((base) + PCI_MSI_ADDRESS_LO)
> +#define msi_upper_address_reg(base)  ((base) + PCI_MSI_ADDRESS_HI)
> +#define msi_data_reg(base, is64bit) \
> +    (((is64bit) == 1) ? (base) + PCI_MSI_DATA_64 : (base) + PCI_MSI_DATA_32)
> +#define msi_mask_bits_reg(base, is64bit)                \
> +    (((is64bit) == 1) ? (base) + PCI_MSI_MASK_BIT       \
> +                      : (base) + PCI_MSI_MASK_BIT - 4)
>  #define msi_pending_bits_reg(base, is64bit) \
> -	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
> -#define msi_disable(control)		control &= ~PCI_MSI_FLAGS_ENABLE
> +    ((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
> +#define msi_disable(control)         ({ (control) &= ~PCI_MSI_FLAGS_ENABLE })
>  #define multi_msi_capable(control) \
> -	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
> +    (1 << (((control) & PCI_MSI_FLAGS_QMASK) >> 1))
>  #define multi_msi_enable(control, num) \
> -	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
> -#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
> -#define is_mask_bit_support(control)	(!!(control & PCI_MSI_FLAGS_MASKBIT))
> -#define msi_enable(control, num) multi_msi_enable(control, num); \
> -	control |= PCI_MSI_FLAGS_ENABLE
> -
> -#define msix_control_reg(base)		(base + PCI_MSIX_FLAGS)
> -#define msix_table_offset_reg(base)	(base + PCI_MSIX_TABLE)
> -#define msix_pba_offset_reg(base)	(base + PCI_MSIX_PBA)
> -#define msix_enable(control)	 	control |= PCI_MSIX_FLAGS_ENABLE
> -#define msix_disable(control)	 	control &= ~PCI_MSIX_FLAGS_ENABLE
> -#define msix_table_size(control) 	((control & PCI_MSIX_FLAGS_QSIZE)+1)
> -#define msix_unmask(address)	 	(address & ~PCI_MSIX_VECTOR_BITMASK)
> -#define msix_mask(address)		(address | PCI_MSIX_VECTOR_BITMASK)
> +    ({ (control) |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE) })
> +#define is_64bit_address(control)    (!!((control) & PCI_MSI_FLAGS_64BIT))
> +#define is_mask_bit_support(control) (!!((control) & PCI_MSI_FLAGS_MASKBIT))
> +#define msi_enable(control, num)     ({ multi_msi_enable(control, num); \
> +                                        (control) |= PCI_MSI_FLAGS_ENABLE })

Neither this nor ...

> +#define msix_control_reg(base)       ((base) + PCI_MSIX_FLAGS)
> +#define msix_table_offset_reg(base)  ((base) + PCI_MSIX_TABLE)
> +#define msix_pba_offset_reg(base)    ((base) + PCI_MSIX_PBA)
> +#define msix_enable(control)         ({ (control) |= PCI_MSIX_FLAGS_ENABLE })
> +#define msix_disable(control)        ({ (control) &= ~PCI_MSIX_FLAGS_ENABLE })

... these would compile afaict, if  they were used.

Once again - before fiddling with these we need to settle on which of these
we want to keep (and then also use, rather than open-coding), and which to
drop (instead of massaging).

Jan

