Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD96B1A44E
	for <lists+xen-devel@lfdr.de>; Mon,  4 Aug 2025 16:16:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1069486.1433339 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivzK-0007gk-Bf; Mon, 04 Aug 2025 14:16:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1069486.1433339; Mon, 04 Aug 2025 14:16:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uivzK-0007f7-8W; Mon, 04 Aug 2025 14:16:30 +0000
Received: by outflank-mailman (input) for mailman id 1069486;
 Mon, 04 Aug 2025 14:16:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=c2vN=2Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uivzJ-0007f0-5b
 for xen-devel@lists.xenproject.org; Mon, 04 Aug 2025 14:16:29 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a106b96-713d-11f0-b898-0df219b8e170;
 Mon, 04 Aug 2025 16:16:24 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ae401ebcbc4so768829166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Aug 2025 07:16:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91aad117dsm734246266b.77.2025.08.04.07.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 07:16:23 -0700 (PDT)
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
X-Inumbo-ID: 9a106b96-713d-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754316983; x=1754921783; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/BdYIQmGgfqqyJ/IMGZ3Px4FQmDEzYeTe01cSWv4pwg=;
        b=F0FbYO4+Pebkj6061bktjZVCE+u2XQeatixkuFa8iZUWzDJCHTQjhBpE2malcLq6wg
         QfMhHbHUfCSP1qRL1zjUzX4wz5DWRKCC5DJ412eR/Ria3Vk0eT273+t5YaYkQHbXLBwf
         sCzFA0pl+bwMBtw9/b/k36Psd4yjQVy86T+Bl3FeMRwgFwgJLtVaPGLxdjNfVRgs2UkI
         d2tWtDGlayLVn9f+CGChQ03C/0R/+BYU27FPaDIpG/rDveqybmGWF3u2kj/bRLPvR2Az
         BXjoG6h8fuNKPVv26PFTg8CLS44W5dd3mk9QxiIDzEosUzvETQutyBdG9L9o3+09L1Nz
         nr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754316983; x=1754921783;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BdYIQmGgfqqyJ/IMGZ3Px4FQmDEzYeTe01cSWv4pwg=;
        b=X3+dyN4eGgcHm6JobBMWXbEDLoZ7TA2BBWQzkhqsV080YYOF249XERKon05PMpdRXn
         9zLBUW+/aUotj0yRjkWD1L0rIazf0CMX7WqOa9LtgRjX80KTsM2VzdVBu52JTLZr6/iq
         l6Dz0bFeWvJab36vV1kqo1CG6Z0HgtaRqQaatNrooQxKEonFsfvGHmRS+LcesdfxZqHX
         ZK9mtpSrMazledoh4fgRcYN5EHVisR/bnrwcTdT2tMPfgh3PuRHYgxbCx/e+pi6tzPIP
         Ni0/RBY/oE4HlPf3IezQ0rhqyFRYpH5oRnnn876DfBRSqrghKotxrssut6vQ/UEwLInO
         io1g==
X-Forwarded-Encrypted: i=1; AJvYcCUTKtii0wmfrN2r23yO6gryhgCpwZIxsTQw5kVK55npRxX5axAvOen3a7JTjWFxpLPdYptKqjiynw0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIj8h9R/NZ0yuRa9NyLU45yCWjEUsu++wlXRzsOgPbuX3SZdXT
	pTohXLMrh2QQQqvAcohdZ+MvdzVVHN49UZr766KowEtOsRWYTbxJCnqOB0R7XIB7oA==
X-Gm-Gg: ASbGncuWQGZU6QXvqpPe1ijAqIYJ/nrqsne465+mBd8LUOQLYlTfGy3E3qqku5+ZNal
	FIS5MGWTFUeGzvJKCCcHCQMWP+fwMQknaiG5/9PDsVJ7IpRzAFZ7R9Fwpa+Q8xJLA170FngKFTE
	RoS9zzF3HRQJm5g+1RET7Gy6dZ30CfQscG/GgQ2Dyr//3UaXZbpxQdfgnTCTTQQdo1Pgf2QKKnR
	xdCPKx/rS7reg/xkfIkRJSAS0/RxiZ//RItyViChw18jgF+YyqHdp07drN+bjLr2AglcRE+HJ6J
	VDhuY6r/EWiB4z1xSs9O9OE2O5aw+cj+Kt7Tygi7uGZbaaeS5n+ZvSGjpnhsjVKduywhClr+Rfl
	D4kO/vqdUQ9Odhkiv+CLkOEahrsMAvcmVp3/IQondAAiJB06UHIRATPUtcbV9DSdEVjlocLHjxy
	L64k7KVZE=
X-Google-Smtp-Source: AGHT+IGWFDy3SIXXdYLrwTP+uFNFe6+MqwFruVeDwkO3f0z+BIpZkJ/iUv5d0KfrCBmLkIhJI5T+xQ==
X-Received: by 2002:a17:907:d8d:b0:af9:2e26:4636 with SMTP id a640c23a62f3a-af940173110mr923964166b.32.1754316983481;
        Mon, 04 Aug 2025 07:16:23 -0700 (PDT)
Message-ID: <48dcca92-4dd8-4d6e-a4cb-c10a7ee80f19@suse.com>
Date: Mon, 4 Aug 2025 16:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/20] xen/riscv: add new p2m types and helper macros
 for type classification
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <3d35b6f4bb79048647020ed4e7b222585ca3a9a3.1753973161.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <3d35b6f4bb79048647020ed4e7b222585ca3a9a3.1753973161.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 17:58, Oleksii Kurochko wrote:
> - Extended p2m_type_t with additional types: p2m_mmio_direct,
>   p2m_grant_map_{rw,ro}.
> - Added macros to classify memory types: P2M_RAM_TYPES, P2M_GRANT_TYPES.
> - Introduced helper predicates: p2m_is_ram(), p2m_is_any_ram().
> - Define p2m_mmio_direct to tell handle_passthrough_prop() from common
>   code how to map device memory.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Almost ready to be acked, except for ...

> --- a/xen/arch/riscv/include/asm/p2m.h
> +++ b/xen/arch/riscv/include/asm/p2m.h
> @@ -62,8 +62,30 @@ struct p2m_domain {
>  typedef enum {
>      p2m_invalid = 0,    /* Nothing mapped here */
>      p2m_ram_rw,         /* Normal read/write domain RAM */
> +    p2m_mmio_direct_io, /* Read/write mapping of genuine Device MMIO area,
> +                           PTE_PBMT_IO will be used for such mappings */
> +    p2m_ext_storage,    /* Following types'll be stored outsude PTE bits: */
> +    p2m_grant_map_rw,   /* Read/write grant mapping */
> +    p2m_grant_map_ro,   /* Read-only grant mapping */
>  } p2m_type_t;
>  
> +#define p2m_mmio_direct p2m_mmio_direct_io

... this (see reply to patch 09).

> +/* We use bitmaps and mask to handle groups of types */
> +#define p2m_to_mask(t_) BIT(t_, UL)

I notice that you moved the underscore to the back of the parameters,
compared to how Arm has it. I wonder though: What use are these
underscores in the first place, here and below? (There are macros where
conflicts could arise, but the ones here don't fall in that group,
afaict.)

Jan

