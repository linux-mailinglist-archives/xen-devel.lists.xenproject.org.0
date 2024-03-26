Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2765488BEBE
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 11:07:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697982.1089267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp3gg-0001tu-OQ; Tue, 26 Mar 2024 10:05:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697982.1089267; Tue, 26 Mar 2024 10:05:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rp3gg-0001sF-Li; Tue, 26 Mar 2024 10:05:46 +0000
Received: by outflank-mailman (input) for mailman id 697982;
 Tue, 26 Mar 2024 10:05:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rp3gf-0001s9-6f
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 10:05:45 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68773b80-eb58-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 11:05:43 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-512b3b04995so2864623e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 03:05:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 c15-20020a0564021f8f00b0056bfca6f1c0sm3389282edc.15.2024.03.26.03.05.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 03:05:42 -0700 (PDT)
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
X-Inumbo-ID: 68773b80-eb58-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711447543; x=1712052343; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPEiTiOsp+UsOaJB/JITiMnayatA/5cfh+lrsTMq7oY=;
        b=RDzw0M3/ZhuY4VzUJQ6rfMuGXUhEkSsv376V2nzDX1e4RiyoG/mS9zOKYkAyz/bUyg
         qL9lfG0iRh8dOGEtiHd2PzqDfe3szwxr5b5M8DzcuJoP2NbVIp+VYJZ0h6lvDnq6Vg0I
         o/2Z8m/DuxOD4C0wfhlhULjpH40+7qXXyZwI0XQ28SrdGrzBBnP/M1L2bNe9k3RomP7U
         L+D61j6/a/RAvXN2Hk4N92018YyYUTRLcdNqrg6H8iZwctpLnerRtlC9iMG8FfD+N2/s
         T1ZpqM7O8cVMSekq56oU0y/06CClSAuoDlvvbHQQO68pqEJLlc7a6pTYdrTueZPiunNt
         4Bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711447543; x=1712052343;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPEiTiOsp+UsOaJB/JITiMnayatA/5cfh+lrsTMq7oY=;
        b=e9HS1aF2/ETi62kWs0LzkDlicNQDPTVsyk/mf15z+rqV6hoJnwZ/NN90PqtoYOJetk
         pdnUuG/e2lXrdxilv7bPLv/Uti1A1UouOp0c988OZf5cxKCdyERVc+s4+wkBpeUol0yr
         sdzQTD0mOW/nX8wqI8Ez7zh/5g1svNVGw4kfPSjyKwysQ3TPNQgb4yAGsgEe0+7uFwvq
         58w0Zgzdv5ijJ2eLkK9s5anttdjQghJMoP1qTX4Kug4Q/PXR7lZpchbFzD0IvfEZsvzH
         nwW5w4Q1g6vNk485b8jgYhyjcN6EEGjooJKcAqmZPI75nU2KzSTSTkrrvEl6/kTu4kok
         qGww==
X-Forwarded-Encrypted: i=1; AJvYcCWWNWIimcQqjYx4AFw9WfQGMJxSrJwFrdfTbcsJW+YB+K0dSPxzdnxkBNMCOtVl3eQHI1JogKiyS5fiv+qWQSlvBwxgZbKKgeB+c20jfWI=
X-Gm-Message-State: AOJu0Yyb36rSmJ23rivxjPoPBxH6SXVS9fX96l7FxDtYR/iKcAzN9ueZ
	uozOuLnNYZ6aAgtknVj5oB2SNjB5HI6Ybl3XWYqMrH7nWEXZ9J+RZpAjCKOtYQ==
X-Google-Smtp-Source: AGHT+IEr5nIWGdEjH99dww77jtGjl62HuoTFwus9njS7+Yo/TgTTR3WKktuWgNsO71FC+5IdaT0ejA==
X-Received: by 2002:a19:e046:0:b0:513:d1c7:7d37 with SMTP id g6-20020a19e046000000b00513d1c77d37mr5875950lfj.51.1711447543154;
        Tue, 26 Mar 2024 03:05:43 -0700 (PDT)
Message-ID: <f2d393e9-6b70-4998-9d85-e070d6bba556@suse.com>
Date: Tue, 26 Mar 2024 11:05:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 09/11] x86/msi: address violation of MISRA C Rule 20.7
 and coding style
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, xen-devel@lists.xenproject.org
References: <cover.1711118582.git.nicola.vetrini@bugseng.com>
 <c924aa0d5b3b6adbb24cc638f739173cbc41862c.1711118582.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <c924aa0d5b3b6adbb24cc638f739173cbc41862c.1711118582.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 17:01, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> While at it, the style of these macros has been somewhat uniformed.

Hmm, yes, but they then still leave more to be desired. I guess I can see
though why you don't want to e.g. ...

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

... drop the bogus == 1 in these two, making them similar to ...

>  #define msi_pending_bits_reg(base, is64bit) \
> -	((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))
> -#define msi_disable(control)		control &= ~PCI_MSI_FLAGS_ENABLE
> +    ((base) + PCI_MSI_MASK_BIT + ((is64bit) ? 4 : 0))

... this.

> +#define msi_disable(control) (control) &= ~PCI_MSI_FLAGS_ENABLE

Doesn't this need an outer pair of parentheses, too?

>  #define multi_msi_capable(control) \
> -	(1 << ((control & PCI_MSI_FLAGS_QMASK) >> 1))
> +    (1 << (((control) & PCI_MSI_FLAGS_QMASK) >> 1))
>  #define multi_msi_enable(control, num) \
> -	control |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);
> -#define is_64bit_address(control)	(!!(control & PCI_MSI_FLAGS_64BIT))
> -#define is_mask_bit_support(control)	(!!(control & PCI_MSI_FLAGS_MASKBIT))
> +    (control) |= (((fls(num) - 1) << 4) & PCI_MSI_FLAGS_QSIZE);

And this, together with dropping the bogus semicolon?

There also look to be cases where MASK_EXTR() / MASK_INSR() would want using,
in favor of using open-coded numbers.

> +#define is_64bit_address(control) (!!((control) & PCI_MSI_FLAGS_64BIT))
> +#define is_mask_bit_support(control) (!!((control) & PCI_MSI_FLAGS_MASKBIT))
>  #define msi_enable(control, num) multi_msi_enable(control, num); \
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
> +                                 (control) |= PCI_MSI_FLAGS_ENABLE

This again is suspiciously missing outer parentheses; really here, with
the earlier statement, it look like do { ... } while ( 0 ) or ({ ... })
are wanted.

> +#define msix_control_reg(base)       ((base) + PCI_MSIX_FLAGS)
> +#define msix_table_offset_reg(base)  ((base) + PCI_MSIX_TABLE)
> +#define msix_pba_offset_reg(base)    ((base) + PCI_MSIX_PBA)
> +#define msix_enable(control)         (control) |= PCI_MSIX_FLAGS_ENABLE
> +#define msix_disable(control)        (control) &= ~PCI_MSIX_FLAGS_ENABLE

Outer parentheses missing for these two again?

Jan

