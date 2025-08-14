Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E80AB269EC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 16:47:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081831.1441790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZEl-0006oo-63; Thu, 14 Aug 2025 14:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081831.1441790; Thu, 14 Aug 2025 14:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZEl-0006mM-2j; Thu, 14 Aug 2025 14:47:27 +0000
Received: by outflank-mailman (input) for mailman id 1081831;
 Thu, 14 Aug 2025 14:47:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umZEj-0006mG-T1
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 14:47:25 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96e20d97-791d-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 16:47:24 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-61868d83059so3661550a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 07:47:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618461ab3dcsm5798551a12.56.2025.08.14.07.47.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 07:47:23 -0700 (PDT)
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
X-Inumbo-ID: 96e20d97-791d-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755182844; x=1755787644; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0PzSZX8cJpRvZEoRZks2M9zfbhZ+zG35XO5dF7p2NWk=;
        b=IZ+is3aUpTNfwEv0rR3CfWRTZDYGQ8JR0SeCcwTZMYWmmOCxcHAWY/Pz4KcThrlOSg
         R4+L0fnCw4xgKoA7uNdSAzhAg7D17w3JNVZRkcdpFTHAk26JAEXSh4hpJ8/9Bvhb5oqK
         +pd9GCt6kEH75SUtFbyW+JxkJfYoyg85KAX8uNPSCJRPtJhQnyJYXDRkeRet5Y8zoC0w
         6Oy4dfBELnf8veaO9fqVAPJJq4FlWOpSMjBYzRB1yobjJbdqfDYnw7Da1O045F5XUilu
         hfKACAs0rUk8f18O+FtN/4O/NqUz+DrkHWkahhEW3/kRAVShrTqAsZwZF91vRaXDzUR2
         DYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755182844; x=1755787644;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0PzSZX8cJpRvZEoRZks2M9zfbhZ+zG35XO5dF7p2NWk=;
        b=Aj4trdixTvEMJHGViTm7MPP4j4+Vj6Na7XBR+HsNwFD5TP1N4pnNIvWkWB/6GrgS2t
         1MmA1JYdnWe31dxV9ddtmeBQfruACogqP1LqXVSX8naRWrth+J7cRDkHWBFLuu+1pgbA
         6T40HWBgrkHlOfnZ1+qIKBS5/pIHeqbk+mx7WZmI+eyrGkLmSC1fq43uC61QEC/ytgY0
         /+2oKS6rDG5Htog5MzL4FUFv7eHSdsxRslouhw/23es06h973R6gUDpBcRqQkci095wY
         R0yZMOtHdbdDsEbpc9PZA3ALYGOM1FQyQ2jSOv5eJGyCM50m41Phq/tExWUA1kaPcev/
         B5rg==
X-Forwarded-Encrypted: i=1; AJvYcCV7z7issA7UI8bMZzc7XSpW6piEj3f8TBmjL1T1WstEWKOAZI3eGQF0HrF4gfMbf7kYqGBz7KT2yWw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyp0/b3IVSSecX0U0hqsL45DScyVHbG9UxbBNlXx7prqnYwMGoq
	ZeyYG5IxLiczpT3j2tbKxm3h7pF6y2szjR3ZZ9zrnN60fNfkl9ZQ63UiktsVyt+1ng==
X-Gm-Gg: ASbGncuB0X5D+C35tMH1pl+KGOdB0QDztBxyRKpAtOVfVQYEzkf1OJgXjZMigXvGuU9
	dD9fwR+jFzZQGnVAutY5c+g5YN3alFMOc4Qm12N5ieUMMO3pa/jXLy5taO5IaFRAenV3gJ+5PSV
	D/GYpGnoklKILXTEfouo5O8gX7emUm5zrJ+IynVy9GLLrGzzV3kqAs2bGkY/9FQyyzNjDW3ISQ5
	g/w9lpbEtCdwEQe412p7ZpEJ7NU5eE/mHG4ATc364mazYQhsaDl3B7huZjy6gpZOPs6YU3cR4cw
	BwWmP58QPWijaDI57Nuw2qL961GQinfyGr2JmOF23GvV6bYtx2SZQqnZ3MJdvGfSdOSUZaHQJp0
	FxnKei6noxGDV3sBgbq1s3M06HcpijMuYBpObEvp3wmqLfu/iFsCbjZz9tcISc/YmuhOQcwq0wM
	shy1C0DhLiWFNt82SH+zwNaqqL+THa
X-Google-Smtp-Source: AGHT+IEIv2Qy7vMmzbW5n9n9O93ylH3tlTgGIyvq9jsyUIn2j4PVkhALpFA1QgwIV1Z+TDeZxLjXMQ==
X-Received: by 2002:a05:6402:2188:b0:618:780f:e89d with SMTP id 4fb4d7f45d1cf-6189199fa41mr2801632a12.3.1755182843558;
        Thu, 14 Aug 2025 07:47:23 -0700 (PDT)
Message-ID: <270b2ad1-fb8a-4a0a-8733-a8f3f8f25a94@suse.com>
Date: Thu, 14 Aug 2025 16:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/22] x86/boot: Adjust CR4 handling around
 ap_early_traps_init()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-17-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-17-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> ap_early_traps_init() will shortly be setting CR4.FRED.  This requires that
> cpu_info->cr4 is already set up, and that the enablement of CET doesn't
> truncate FRED back out because of it's 32bit logic.
> 
> For __high_start(), defer re-loading XEN_MINIMAL_CR4 until after %rsp is set
> up and we can store the result in the cr4 field too.
> 
> For s3_resume(), explicitly re-load XEN_MINIMAL_CR4.  Later when loading all
> features, use the mmu_cr4_features variable which is how the rest of Xen
> performs this operation.
> 
> No functional change, yet.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/acpi/wakeup_prot.S
> +++ b/xen/arch/x86/acpi/wakeup_prot.S
> @@ -63,6 +63,14 @@ LABEL(s3_resume)
>          pushq   %rax
>          lretq
>  1:
> +
> +        GET_STACK_END(15)
> +
> +        /* Enable minimal CR4 features. */
> +        mov     $XEN_MINIMAL_CR4, %eax
> +        mov     %rax, STACK_CPUINFO_FIELD(cr4)(%r15)

Strictly speaking this and ...

> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -11,16 +11,19 @@ ENTRY(__high_start)
>          mov     %ecx,%gs
>          mov     %ecx,%ss
>  
> -        /* Enable minimal CR4 features. */
> -        mov     $XEN_MINIMAL_CR4,%rcx
> -        mov     %rcx,%cr4
> -
>          mov     stack_start(%rip),%rsp
>  
>          /* Reset EFLAGS (subsumes CLI and CLD). */
>          pushq   $0
>          popf
>  
> +        GET_STACK_END(15)
> +
> +        /* Enable minimal CR4 features. */
> +        mov     $XEN_MINIMAL_CR4, %eax
> +        mov     %rax, STACK_CPUINFO_FIELD(cr4)(%r15)

... this could be 32-bit stores, even in the longer run.

Jan

