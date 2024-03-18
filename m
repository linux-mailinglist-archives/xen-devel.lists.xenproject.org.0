Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC14B87EAB8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Mar 2024 15:18:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.694741.1083812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDoH-0004dO-N4; Mon, 18 Mar 2024 14:17:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 694741.1083812; Mon, 18 Mar 2024 14:17:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmDoH-0004b6-JB; Mon, 18 Mar 2024 14:17:53 +0000
Received: by outflank-mailman (input) for mailman id 694741;
 Mon, 18 Mar 2024 14:17:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=emy9=KY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmDoG-0004au-1D
 for xen-devel@lists.xenproject.org; Mon, 18 Mar 2024 14:17:52 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4c106a21-e532-11ee-a1ee-f123f15fe8a2;
 Mon, 18 Mar 2024 15:17:48 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a46d0a8399aso59278166b.1
 for <xen-devel@lists.xenproject.org>; Mon, 18 Mar 2024 07:17:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 my10-20020a1709065a4a00b00a4663d3b2bfsm4873630ejc.217.2024.03.18.07.17.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 07:17:47 -0700 (PDT)
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
X-Inumbo-ID: 4c106a21-e532-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710771468; x=1711376268; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qwFxVwwG6hCkpAos63NFwCKOuaguL+cfxYb3mvG+OQg=;
        b=gi+LHvDSeWWzRv9rFWlu9MrhXYknDq+dvKaepzEQaJAR+0b2EAZ+JdozNGvyAOO9SW
         JfK/DE/CjPUiNJ8P4Xyk9Yl3n9LWi0UT40CrWjA+acrNLqf9UHb4ovsPWGAhDXScsrEO
         UQ+RtJk5TBS6t9haJtQjRVd10rtd0ZVZcnL2Fl46RoEssu1d49mOq6kkqehzNAhOJXDz
         8t6r5+daMzoclYrKWRsW5Ip29od9eiKyp6E3Hc9JlypRTtkO93UNcEldlhT2oafq4pZ2
         WL/QtBmJdBO6MPXfq837v5bwB+7WxGEYdgnleExN2RrHPKOrg03fqawOXhvfY1i98ljh
         Gkfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710771468; x=1711376268;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qwFxVwwG6hCkpAos63NFwCKOuaguL+cfxYb3mvG+OQg=;
        b=S2j773rFN8h8xxyF24WEpfeLljZeXShQ923p16ET9oB3n3Jr1HF2RI/H1Zbtidn2d5
         TRGZYilGikZVwdrjALl2sB9m+dXC/poLLXFUPLnj/J7HjzOzdyFFP4TIHylcF/YPtxxI
         n9U6i2t/1APbzaUO35a6yOt4+lEGSbJTF32jrEImr82xnsScuYEhEuTRmCCAxSHAk6UV
         50kCZMekUAHUj78aHTf6WadljgldPqkhNAt5ZOch/zPn2MFC+OO9rZQH8047Kz5Swbhn
         CFWrmgvFX/8AA4vKkjq6GudjV+EB1QQQnkaC7sqQS1c1oCgJb5Qp9p4vNrewJyaQCsWz
         YaAA==
X-Forwarded-Encrypted: i=1; AJvYcCWqA6L6VcldYyK5zzsqLP8SygNPqohqnM0LVvRcy7isxJKxA91a3Shb3Enwwve/3HB0uyb34ErmJUabwukv5l4tmTphRk2MiCxGreb5WzU=
X-Gm-Message-State: AOJu0Yx3OKc3g5g+pnKLQPlxNS4IuvYEzb5ercElyvhYWn64dosJHN3j
	Iy7psIJZn0N8FZHMkR2XW9trIT7M26NuBhDtpdkjbQauyRfc5K1tPFjilQS2UA==
X-Google-Smtp-Source: AGHT+IFxDjTgVPgvKbPd+01/1lQ8twVqqwIiK+1gi+EMKSv0WOe9jIou3VmOPunGME5rAlx6ELt28g==
X-Received: by 2002:a17:907:7249:b0:a46:a85d:de81 with SMTP id ds9-20020a170907724900b00a46a85dde81mr5811263ejc.12.1710771467759;
        Mon, 18 Mar 2024 07:17:47 -0700 (PDT)
Message-ID: <7a5b3ec3-c122-479a-b714-529e150bf4c0@suse.com>
Date: Mon, 18 Mar 2024 15:17:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] svm/nestedsvm: Introduce nested capabilities bit
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20240313122454.965566-1-george.dunlap@cloud.com>
 <20240313122454.965566-4-george.dunlap@cloud.com>
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
In-Reply-To: <20240313122454.965566-4-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 13:24, George Dunlap wrote:
> In order to make implementation and testing tractable, we will require
> specific host functionality.  Add a nested_virt bit to hvm_funcs.caps,
> and return an error if a domain is created with nested virt and this
> bit isn't set.  Create VMX and SVM callbacks to be executed from
> start_nested_svm(), which is guaranteed to execute after all

Nit: nestedhvm_setup() (or, with different wording, start_nested_{svm,vmx}()).

> command-line options have been procesed.
> 
> For VMX, start with always enabling it if HAP is present; this
> shouldn't change current behvior.
> 
> For SVM, require some basic functionality, adding a document
> explaining the rationale.
> 
> NB that only SVM CPUID bits 0-7 have been considered.  Bits 10-16 may
> be considered in a follow-up patch.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
>[...]
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -673,6 +673,12 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>           */
>          config->flags |= XEN_DOMCTL_CDF_oos_off;
>  
> +    if ( nested_virt && !hvm_nested_virt_supported() )
> +    {
> +        dprintk(XENLOG_INFO, "Nested virt requested but not available\n");
> +        return -EINVAL;        
> +    }
> +
>      if ( nested_virt && !hap )
>      {
>          dprintk(XENLOG_INFO, "Nested virt not supported without HAP\n");

As mentioned in reply to v1, I think what both start_nested_{svm,vmx}() check
is redundant with this latter check. I think that check isn't necessary there
(yet unlike suggested in reply to v1 I don't think anymore that the check here
can alternatively be dropped). And even if it was to be kept for some reason,
I'm having some difficulty seeing why vendor code needs to do that check, when
nestedhvm_setup() could do it for both of them.

> --- a/xen/arch/x86/hvm/nestedhvm.c
> +++ b/xen/arch/x86/hvm/nestedhvm.c
> @@ -150,6 +150,16 @@ static int __init cf_check nestedhvm_setup(void)
>      __clear_bit(0x80, shadow_io_bitmap[0]);
>      __clear_bit(0xed, shadow_io_bitmap[1]);
>  
> +    /* 
> +     * NB this must be called after all command-line processing has been
> +     * done, so that if (for example) HAP is disabled, nested virt is
> +     * disabled as well.
> +     */
> +    if ( cpu_has_vmx )
> +        start_nested_vmx(&hvm_funcs);
> +    else if ( cpu_has_svm )
> +        start_nested_svm(&hvm_funcs);

Instead of passing the pointer, couldn't you have the functions return
bool, and then set hvm_funcs.caps.nested_virt from that? Passing that
pointer looks somewhat odd to me.

Is there a reason to use direct calls here rather than a true hook
(seeing that hvm_funcs must have been populated by the time we make it
here)? I understand we're (remotely) considering to switch away from
using hooks at some point, but right now this feels somewhat
inconsistent if not further justified.

> --- a/xen/arch/x86/hvm/vmx/vvmx.c
> +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> @@ -2816,6 +2816,14 @@ void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr)
>      __vmwrite(read_shadow_field, v->arch.hvm.nvcpu.guest_cr[cr]);
>  }
>  
> +void __init start_nested_vmx(struct hvm_function_table *hvm_function_table)
> +{
> +    /* TODO: Require hardware support before enabling nested virt */
> +    hvm_function_table->caps.nested_virt =
> +        hvm_function_table->caps.hap;
> +}
> +
> +

Nit: No double blank lines please.

Jan

