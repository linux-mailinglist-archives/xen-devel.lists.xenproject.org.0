Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9A3A7133E
	for <lists+xen-devel@lfdr.de>; Wed, 26 Mar 2025 10:01:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.927330.1330078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMd8-00021E-6S; Wed, 26 Mar 2025 09:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 927330.1330078; Wed, 26 Mar 2025 09:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txMd8-0001zJ-3p; Wed, 26 Mar 2025 09:00:58 +0000
Received: by outflank-mailman (input) for mailman id 927330;
 Wed, 26 Mar 2025 09:00:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SgUP=WN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1txMd6-0001zB-Mw
 for xen-devel@lists.xenproject.org; Wed, 26 Mar 2025 09:00:56 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d39ed09a-0a20-11f0-9ea3-5ba50f476ded;
 Wed, 26 Mar 2025 10:00:55 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso421261f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Mar 2025 02:00:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3997f9957efsm16445245f8f.14.2025.03.26.02.00.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Mar 2025 02:00:54 -0700 (PDT)
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
X-Inumbo-ID: d39ed09a-0a20-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742979655; x=1743584455; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tjOGdEJFIiIZcm8NSggCb/Xn4Tbp450ix/iGMe74sSQ=;
        b=M8EKxetniRwcFxAJhrR/qryJrJHICgSTVbUfjIud9qqOG1cx58TE/9WcGvk7BacCK+
         +o0N90lf/4s6qxAene+2KHKoniuAiUbnqZjrRl2982Fle189tBCzqpfjqgZKq7kECwis
         ZQwKfmRK5Kb4h6t7M1wkQhdEkBSXGQjLeNWeWxmImU2VSIiT4Au8OnFe884h12v6dG3u
         2XCJWHoG5np+gBozIAw8zQeS7acggDbgVNRAW1ZJLwZq0FMHVaaUw0Hso1bUycVPlzwn
         wJvLjkTCrLZ66o+iOIeJy1OgCIYB6dYxsd5Mg2YE5uPXJwDeidLBn9kHZ/A+3wxG9Fj8
         VPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742979655; x=1743584455;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjOGdEJFIiIZcm8NSggCb/Xn4Tbp450ix/iGMe74sSQ=;
        b=ZanIZcmLHZtI7uv+QufHqZlk1tp61EVeaG3i83rBuWQB0sA2u32xYh2AV70lkJkpvF
         AZ/MMbIPnDRnGYYCnzoOYT534750A85LuwCqi5iUs7MCVS8IY61VmQzu/R7kheXOuwCk
         2wVOoYaEWvCvZSDvmU43ol7bNW52eEXoYO3h4/icKSvBus3Zu3yRETPQlwJyw3CJd2nw
         tpzk8oPv4t5aHaKznlY8kzjo3EipkdAUDlezivGo6VhErN9OJaDeSgmz7t0NrjzlJvvI
         ZQojGEb+o1m9kDTL2qAoJ3aEpwTW2HzXCtJ8UZVVb0RKQm8Ko7lry3OlD88rWC72wDo2
         aCmg==
X-Forwarded-Encrypted: i=1; AJvYcCVeJ3PjpE3tMC8t2ufRQdSZQYUsqd+A/b9cYHywI1i1O4lHZmcT9QfZ0GwEzYUd/JLmRRjLpoX+HiI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaT5uzhSGKLuXTNc/SSip26Jpu29H2dN4R1EK6UWC5mkissE1t
	+x1V6kPK9BpPkey078AoB2yK3AFlrLCjYztwWvNR4FtT9JB+6PqoZ1IrQoQi0A==
X-Gm-Gg: ASbGncsrCyKd7SHmccs6Scc3wJd1QaW9pTFkZ6wsGfkg5L2NW3gRrqUErf/q5Q9CICg
	8Iq/KLHzuDStm8vIjfsxM6AS0mXk2tH2oy64KPyQ8EgQWPw2lHe+saocLop8a/DDLypMK/69bH5
	pJh0ercL6ujlFJGai4AH7/ih84Pb+R6TMzKWfN6wXfbNkEAo30+Q9idGc7+Q3y2/J6tjFuB/uye
	4piTR+8L6nsx82UXcD+MDfGfwRgxareniEtGP4wZZquFykW7U/sd2PzgammimHAJylk8RFyQdSM
	XLqgIXp2xSCtGUerFAkNWyknxXF0xkzGvSSNfP7mfiHiUsdHoLTMaeBnRDbBDDR1ClE66+IYk5L
	w8NH81H0eqk6LCvHP8SkTsFQ38hqiCw==
X-Google-Smtp-Source: AGHT+IHPxOIXsNN+NKXC5fOlJpV46+HtYcXMuo7aH1VDZyNpD7+hf9cWDDZp2wnYIgrxDiUtSOLf4w==
X-Received: by 2002:a5d:6d81:0:b0:390:e9ee:f27a with SMTP id ffacd0b85a97d-39acc48c6d5mr2543945f8f.28.1742979654882;
        Wed, 26 Mar 2025 02:00:54 -0700 (PDT)
Message-ID: <ae306524-bc22-450e-88d6-8c0785003e17@suse.com>
Date: Wed, 26 Mar 2025 10:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/elf: Remove ASM_CALL_CONSTRAINT from
 elf_core_save_regs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250325180005.275552-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250325180005.275552-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.03.2025 19:00, Andrew Cooper wrote:
> I was mistaken about when ASM_CALL_CONSTRAINT is applicable.  It is not
> applicable for plain pushes/pops, so remove it from the flags logic.
> 
> Clarify the description of ASM_CALL_CONSTRAINT to be explicit about unwinding
> using framepointers.
> 
> Fixes: 0754534b8a38 ("x86/elf: Improve code generation in elf_core_save_regs()")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/include/asm/asm_defns.h  | 5 +++--
>  xen/arch/x86/include/asm/x86_64/elf.h | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
> index 92b4116a1564..689d1dcbf754 100644
> --- a/xen/arch/x86/include/asm/asm_defns.h
> +++ b/xen/arch/x86/include/asm/asm_defns.h
> @@ -28,8 +28,9 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
>  
>  /*
>   * This output constraint should be used for any inline asm which has a "call"
> - * instruction.  Otherwise the asm may be inserted before the frame pointer
> - * gets set up by the containing function.
> + * instruction, which forces the stack frame to be set up prior to the asm
> + * block.  This matters when unwinding using framepointers, where the asm's
> + * function can get skipped over.

Does "forces the stack frame to be set up" really mean the stack frame, or the
frame pointer (if one is in use)? In the latter case I can see how the asm()
being moved ahead of that point could cause problems. In the former case I
apparently still don't understand (yet) what the issue is that
ASM_CALL_CONSTRAINT ultimately is to help with.

Jan

