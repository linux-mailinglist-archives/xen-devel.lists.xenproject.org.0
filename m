Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEC79DFBAE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 09:13:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846325.1261490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI1YC-0007Ck-Fr; Mon, 02 Dec 2024 08:13:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846325.1261490; Mon, 02 Dec 2024 08:13:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI1YC-0007B4-DH; Mon, 02 Dec 2024 08:13:00 +0000
Received: by outflank-mailman (input) for mailman id 846325;
 Mon, 02 Dec 2024 08:12:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI1YB-0007Ay-Po
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 08:12:59 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c2ebfde-b085-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 09:12:56 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-aa539d2b4b2so709550966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 00:12:56 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5997d560asm483236366b.61.2024.12.02.00.12.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 00:12:55 -0800 (PST)
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
X-Inumbo-ID: 3c2ebfde-b085-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzYiLCJoZWxvIjoibWFpbC1lajEteDYzNi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjNjMmViZmRlLWIwODUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTI3MTc2LjA0NTg4LCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733127175; x=1733731975; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FLXkon0/5OI7F409SH4juRRBgE//vYxhx5brzVnUDEw=;
        b=bwQ0G95H0WMVpM21qkecCXnGE2o7C0DkNTOB9ZkRK2g7QnQvwP6yZsdN9bSWUJ9XsS
         t29BYN1rPe/Ke/VdW2BDA/3gNkiLMOnrbwPIRUVdFBBScxXcBSNd1fFxJdojORBtmDRU
         cgu1aljJm8+q1aXeCTKIsCzuom+Glmftc9mGBrBg0V13VKKwqAS2N5MZvtScXlX0olW4
         d0KFcvvpcEx+PWsdNXCL3vaZFd6/WzgOVmz6ryWSm5sKVfjWBHSB6ai1IfB+0M/03GRg
         MsVC43OfwQXJf2AXecN0Ut5+oiwuubxV6WBsLoy9QoXDO7w5/xJzwYsCQx2NPt51ug2a
         5/Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733127175; x=1733731975;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLXkon0/5OI7F409SH4juRRBgE//vYxhx5brzVnUDEw=;
        b=SfWGiwTQH/aA6sVUwh4ThqYnMl3K+f5RoaSDIMcCLgfzuIf0zQQy0XAQcH583kqmaa
         rr7A9wg2hiU7Xe+LkQ2Uaiagc+6fNb8sVkHDhjdxgTOr099cq7OKrHIERDyZL7O9Et3J
         tNiY+MO/j7XJIn6PupOfwyfTVh1n+kT/WoUkbbIrMe4yyzPmeLO8PSWAuyId9iEC9rwi
         1rM9PP69Zgybih/vOLh6TsuXGdpRwSHltNQZjF3YoKd1VwQS3Wt7Vi0/Nm630PK1s7KH
         k/0JXqxgRKn0T95vSlmZF4qFw1PmNXWSl+fRVs1OKFTsNUxIrdYxxMcALmMaAHfur6UG
         gE0w==
X-Forwarded-Encrypted: i=1; AJvYcCXYWmGKmhJ+V59FdMT+LcmXPJW0xChMsPnoFCc7c2eeHPzJLlQXN7pTLGNCuR6issvTGeJ+OOK931A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyp4I/ELN57OCBaQQbDwRxdosyV97R7NuO9NuDMi921ffoZgXLx
	uHEZkCNzS0eDZ5fykZFViS3R0i8MN+NIreP42v1bzraF2BDhGDauPiYCrh7M0g==
X-Gm-Gg: ASbGncs1AuH6jViJ2LR0pxsU5PxQhScYjb23O4TP2nk+5tFQ17jvVdg5q1l81dI36o2
	WY+t3bP+VAzfT6Nga5yRx2TgZOKv1NtcwecdxML6VO/oHkDzXcYoaECefROiaeiP/peILdZ7GwS
	c2C1WB8ZZM3J9i1plLwhZhBssvV0CXUW7NgggSVmOUwtN80Lzg9frsP/o56vwzsB6jH82LFvLPR
	eCnnZBVV7qqakG2sGqiQavWdxF68+ppNIS+L8aO8JkiYdHnsELN6V6F9aBwrBtbhskZ5FFXdENh
	l67zwWh8/6+VkU+U72FC/BEA1ATs2PfNXBA=
X-Google-Smtp-Source: AGHT+IHtWNnfCfnKovmgUSatXq2H2lh2lW5WUlzJSgkDuVpOsRrMk4y2n+5+xIkUHTlo1Ty0a2uETQ==
X-Received: by 2002:a17:906:3d21:b0:aa5:427e:6c7a with SMTP id a640c23a62f3a-aa594670126mr1658386066b.25.1733127175403;
        Mon, 02 Dec 2024 00:12:55 -0800 (PST)
Message-ID: <2f92aeb0-bb1f-49d0-9655-8ff93fee8837@suse.com>
Date: Mon, 2 Dec 2024 09:12:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen: riscv: enable stack protector feature
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241130010954.36057-1-volodymyr_babchuk@epam.com>
 <20241130010954.36057-5-volodymyr_babchuk@epam.com>
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
In-Reply-To: <20241130010954.36057-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.11.2024 02:10, Volodymyr Babchuk wrote:
> Enable previously added CONFIG_STACK_PROTECTOR feature for RISC-V
> platform. Here we can call boot_stack_chk_guard_setup() in start_xen()
> function, because it never returns, so stack protector code will not
> be triggered because of changed canary.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> Tested-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Isn't this premature? For ...

> @@ -57,6 +58,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
>      if ( !boot_fdt_info(device_tree_flattened, dtb_addr) )
>          BUG();
>  
> +    boot_stack_chk_guard_setup();

... this function's use of get_random(), either arch_get_random() needs
to be implemented, or (as Julien also pointed out for Arm64) NOW() needs
to work. Yet get_s_time() presently expands to just BUG_ON(). Given this
it's not even clear to me how Oleksii managed to actually test this.

Jan

