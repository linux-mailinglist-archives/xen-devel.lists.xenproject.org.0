Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A354A4387F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Feb 2025 10:01:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.895521.1304175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmqnt-0000jF-Jk; Tue, 25 Feb 2025 09:00:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 895521.1304175; Tue, 25 Feb 2025 09:00:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tmqnt-0000gQ-H8; Tue, 25 Feb 2025 09:00:37 +0000
Received: by outflank-mailman (input) for mailman id 895521;
 Tue, 25 Feb 2025 09:00:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvcP=VQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tmqns-0000gI-HB
 for xen-devel@lists.xenproject.org; Tue, 25 Feb 2025 09:00:36 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f901e301-f356-11ef-9897-31a8f345e629;
 Tue, 25 Feb 2025 10:00:34 +0100 (CET)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-390cf7458f5so266418f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 25 Feb 2025 01:00:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd882a4esm1585651f8f.50.2025.02.25.01.00.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Feb 2025 01:00:33 -0800 (PST)
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
X-Inumbo-ID: f901e301-f356-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740474034; x=1741078834; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=95uaTPN23kNeIDKwOYg2NPNV1HEyGUaq8ye/CWv4qHk=;
        b=IzseksPvZ5GzLUf06Rlyhcri0PHl/NzrBAczHCkwqUQW29aoQwz4KmZVzQQfTI+TEM
         mNbkZI0OFjkvmTbKS9qwoF2A0MykCFEinXjlKlmvMDldDxsH682jXQAxCbJ/nQYMH43H
         M75zh1WwhEdyTOz/RSeK1g1D4ccjtzhfxwfX125/HzHRZxw/+X4jnYD3gs67K3GQ/Hx3
         ZrrcM2A5I0U1JURAmGlDIAPE4wc9gTcv32e46IKaPnYegoMh4qpcOyPmgqY5ascgfOJC
         VPoqMsZfINthuUHSYpibGNpxCnvOM1KaOTjWb+y8ly7/jHYlmf7QiRDL0hqckUhIa9x+
         ZRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474034; x=1741078834;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=95uaTPN23kNeIDKwOYg2NPNV1HEyGUaq8ye/CWv4qHk=;
        b=gQmLMHdZfdgyeVppBeywH4HGnyK5qMrWUz1Fiu1ixOjTYlPF5f74Os4KGdEuc32AYZ
         1kJKeKEHj58jyc+A9OGzxgFgnus+ZLg7I/+pGEVPurI7FLV+iUZqRzP4+hv99lfoiUuw
         +TVqyVKwK79ZIGjgxLVqr1+mGQj3mhuKjyKY/Zt7fuuPlmZzxS7/DYTx5kP5Uqs+m5Qo
         AXqS2hJFXMZPRXpPCyIY2rA6HkdYNLSOW3tscOXk8Iw6mkQYpUS0aG3xvXAy7Y0i1lQ8
         /lpOq9hjQUZ0U03/CS0NtiGYScABJsRufKwSD8A5nLUGpIFjKPAUdlM4OFni951huC7L
         xvaA==
X-Forwarded-Encrypted: i=1; AJvYcCWssLLCkaPUz5VZRKE6zb/32ICwP6P6tOX5VnqBCPc0cWfN6PicL12ti8rem8c13wsPOt8goGbhmvg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+sRF4ozgNnEgrsjsIhFzUJO9kn4WyH0NT5mhQhiVo4NuDIy9p
	VEmdkm0geWFFbOYQM87GZOggaquvzb5OPia7OFwLL3Db9SrpZ67FZ2c8TNNr/A==
X-Gm-Gg: ASbGncsTYMq6+2LBdgyPfkMqTFkqZ17dgO+6wrP8oDAkYGaw9Ps5l1YLf0iqhTWYsuG
	FkfR2NPG7zLm5VDuY9wXlArqToe/WCkhM+JmBWuAkOfAfcBZfCeVAVTbvXl8TYO/aMTfw/moeMU
	rLhZKjHlPm3zGmcAMQyNOCHXN/5bzuaMqDGAgMw+FY1mxE9B8FAOraS1hmTXrkzkr7VwgoEggda
	hOWi0Jm164g/a/g4FsTcbMZi5fJsdVhmtQpccmdoVt6NOS862l5q4NtGzjuRmJ8LSQICX0ZH8ns
	cY0rwBl43Q2RQryZ5k1BHLKIEWBWZWAygp68cxLJLX6zTxBHwkf6I1JSdzyYA3b99ptKcxSYyKW
	N0mtCfSDFgfU=
X-Google-Smtp-Source: AGHT+IFeSD/WzBwcmJ2N3muqe1cNnfsLitu/+fgHfp8m07b+e/DfV+o+4y0j+9u0/QyJWJ5XtQMh6g==
X-Received: by 2002:a05:6000:1564:b0:38e:65db:517d with SMTP id ffacd0b85a97d-390cc631b27mr1991910f8f.40.1740474033771;
        Tue, 25 Feb 2025 01:00:33 -0800 (PST)
Message-ID: <fa0cd84c-a3a7-44c8-af62-3e8da91a6d1a@suse.com>
Date: Tue, 25 Feb 2025 10:00:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] x86/IDT: Rename idt_table[] to bsp_idt[]
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250224160509.1117847-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.02.2025 17:05, Andrew Cooper wrote:
> Having variables named idt_table[] and idt_tables[] is not ideal.
> 
> Use X86_IDT_VECTORS and remove IDT_ENTRIES.  State the size of bsp_idt[] in
> idt.h so that load_system_tables() and cpu_smpboot_alloc() can use sizeof()
> rather than opencoding the calculation.
> 
> Move the variable into a new traps-init.c, to make a start at splitting
> traps.c in half.

Hmm, I'd expect a file of that name to contain only __init code/data, and
hence for it to be possible to ...

> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -65,6 +65,7 @@ obj-y += spec_ctrl.o
>  obj-y += srat.o
>  obj-y += string.o
>  obj-y += time.o
> +obj-y += traps-init.o

... use

obj-bin-y += traps-init.init.o

here.

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -831,7 +831,7 @@ void load_system_tables(void)
>  	};
>  	const struct desc_ptr idtr = {
>  		.base = (unsigned long)idt_tables[cpu],
> -		.limit = (IDT_ENTRIES * sizeof(idt_entry_t)) - 1,
> +		.limit = sizeof(bsp_idt) - 1,
>  	};

This ends up being odd: base address and size (limit) are taken from
different variables. Should we perhaps use ...

> --- a/xen/arch/x86/include/asm/idt.h
> +++ b/xen/arch/x86/include/asm/idt.h
> @@ -29,8 +29,7 @@ typedef union {
>      };
>  } idt_entry_t;
>  
> -#define IDT_ENTRIES 256
> -extern idt_entry_t idt_table[];
> +extern idt_entry_t bsp_idt[X86_IDT_VECTORS];
>  extern idt_entry_t *idt_tables[];

extern idt_entry_t (*idt_tables[])[X86_IDT_VECTORS];

and then sizeof(*idt_tables[cpu]) above? Of course we have quite a few uses
of idt_tables[], which all would then need adjusting for the additional
(abstract) level of indirection.

Jan

