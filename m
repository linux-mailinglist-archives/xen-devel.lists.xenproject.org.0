Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F178CA78C21
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 12:24:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935596.1336970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzvGJ-0002dp-70; Wed, 02 Apr 2025 10:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935596.1336970; Wed, 02 Apr 2025 10:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzvGJ-0002bm-4P; Wed, 02 Apr 2025 10:23:59 +0000
Received: by outflank-mailman (input) for mailman id 935596;
 Wed, 02 Apr 2025 10:23:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T645=WU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tzvGI-0002bg-4X
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 10:23:58 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95a91886-0fac-11f0-9ea8-5ba50f476ded;
 Wed, 02 Apr 2025 12:23:56 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so3732945e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 02 Apr 2025 03:23:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c0b6627bfsm16298236f8f.25.2025.04.02.03.23.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Apr 2025 03:23:56 -0700 (PDT)
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
X-Inumbo-ID: 95a91886-0fac-11f0-9ea8-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743589436; x=1744194236; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hrSHIf+8pKjzaW7mVuOrWE8Arv3Oj6JpYoasXLZL0gM=;
        b=Tm28b99FJkOFGHS+o7pacgDErB3Ykg7NPTapU5Cu62k5P7w7V/OcZ5OFQbRk182bPf
         L1OzG+LWcckx6LTePeyAb9h7WQs5YC+zbWkQlANBEBUNq//DkP7L3UqwJ+MvtHjDvZ1L
         3schW8apm2dRkUzJqL6Da+/lAkCLOQcEfyaYTxauNd+qGBhz4iztaZf7poTCVnnaxWRL
         U7cEX2+e997JFLpinMEBynB0smwGns+2YBsX6Q3DdmKihFZBbAmz6h6aaU4ks38x/2SF
         kxbBzu2MjyFBux9fjI6io900iT1rLUJjyfuxR6fUBGYgmkxn6B0NX9OB4w/nUJIS5mrj
         SJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743589436; x=1744194236;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hrSHIf+8pKjzaW7mVuOrWE8Arv3Oj6JpYoasXLZL0gM=;
        b=Uzxjc9K9Jh+G07KragPtRr8i/1bfdq+DCti6cp1eNlmzZXSZeq95ad4f3EuXTlEPnw
         aQJ94+3TgPUXonG54mItrTIdyyvfqv9yc+QogZYmMYoabDBdT6Cm/ri3+TOXO4FAk0Do
         2dM9eH8nEjAtVX5vgcQkZ3fRgNdiRagbfW77+8riTCBHsoQLuomz58G35BYYqcNDLZzU
         YXikeQV+pO1YFba9dmABiFagBwrLAtM56MkkDwhxy/Jk2yOu/fJtOzpGDGk8c0e9N722
         vvM5vyWEv+kMK+bsBcM3gy+YXEUrhiAmFVa0MV6KbPjk834cZJMisV7jOoH/nGojXYVX
         bLaw==
X-Forwarded-Encrypted: i=1; AJvYcCUnZ8os3z/PrUV8CypyApTzvRkOQmRot3Pj+TTYe2pKqsx/zNausRkXInsoD4SIxCvv7j+96Rn9xCk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaGK4riKNuR5hhWRSnPtxawDovDOabOOf6++a28zCwDF5XGCwq
	fZj7f3MoGEFlKv0t5WsOUT0tP8Cn4vyu1eyKLYw8YX4RVVhzvCcdnj3sKk0SQA==
X-Gm-Gg: ASbGncs3p1SRyP5S7+Fp9FbvGT0KmE+Le1vYoJb8d/o3LgghGg3Dgi89H+N7LCJxBJw
	TSQKZLm+ZeNLdeDWXMohL9GYZuB5EPvQ8MRIoWkiisPY62u3tZdngTBmwHyP4EAD0pGrHly9lol
	AHtLBi7mpVRkrfjSVRDgoQFZNpdHgKl2Ws4pt21U8jPcMtAmpE9lTdZ/mIJsgnbm7DXAlpFHZDh
	j6wrM5ajG6ZRcr7YbQXeH9e6f37AL+DYil+QW/8AnUOXwbL0SkFPIRUT1rKTDcT2+VhAiqJTG64
	dHthKEu6fEhMhdRz6B25vw/kY89Tpl8oaDYlD6kjB4pEQJ7OE+teumq+oauabGY9XflDcu31LHs
	ojXIMcRbHdmQn14zOpOxEO7EdYBn9pRBIWifgvb5N
X-Google-Smtp-Source: AGHT+IGQ2vkFfceZst/vSUmSlYwDI+Vw9YVJanG+BAbywpsRDHKFK3XfeVW2sjMpkdYbz3qHE1WjvQ==
X-Received: by 2002:a5d:6d89:0:b0:390:f0ff:2c10 with SMTP id ffacd0b85a97d-39c2a3877a3mr1194827f8f.19.1743589436351;
        Wed, 02 Apr 2025 03:23:56 -0700 (PDT)
Message-ID: <2c8a45f8-bf6d-4a13-a6d2-dab20f7ad3d6@suse.com>
Date: Wed, 2 Apr 2025 12:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/11] x86/efi: avoid a relocation in
 efi_arch_post_exit_boot()
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250401130840.72119-1-roger.pau@citrix.com>
 <20250401130840.72119-10-roger.pau@citrix.com>
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
In-Reply-To: <20250401130840.72119-10-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.04.2025 15:08, Roger Pau Monne wrote:
> Instead of using the absolute __start_xen address, calculate it as an
> offset from the current instruction pointer.  The relocation would be
> problematic if the loader has acknowledged the Xen image section
> attributes, and mapped .init.text with just read and execute permissions.

Fine in principle, but ...

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -266,7 +266,9 @@ static void __init noreturn efi_arch_post_exit_boot(void)
>  
>                     /* Jump to higher mappings. */
>                     "mov    stack_start(%%rip), %%rsp\n\t"
> -                   "movabs $__start_xen, %[rip]\n\t"
> +                   "lea    __start_xen(%%rip), %[rip]\n\t"
> +                   "add    %[offset], %[rip]\n\t"
> +
>                     "push   %[cs]\n\t"
>                     "push   %[rip]\n\t"
>                     "lretq"
> @@ -274,7 +276,8 @@ static void __init noreturn efi_arch_post_exit_boot(void)
>                       [cr4] "+&r" (cr4)
>                     : [cr3] "r" (idle_pg_table),
>                       [cs] "i" (__HYPERVISOR_CS),
> -                     [ds] "r" (__HYPERVISOR_DS)
> +                     [ds] "r" (__HYPERVISOR_DS),
> +                     [offset] "r" (__XEN_VIRT_START - xen_phys_start)
>                     : "memory" );
>      unreachable();
>  }

... imo ought to come with a brief comment, to keep people from trying to
undo ("simplify") that again.

[offset]'s constraint could in principle be "rme", I think, as [rip] is
"&r" already. Just that the compiler (at least gcc) won't synthesize a
memory operand, and the value can't be expressed by an immediate. IOW -
probably all fine with just "r". Of course if/when we add further operands
here, we need to pay attention to the number of registers needed.

Jan

