Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939E3BC5E21
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 17:54:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139955.1475138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6WTl-0003hS-BL; Wed, 08 Oct 2025 15:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139955.1475138; Wed, 08 Oct 2025 15:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6WTl-0003fN-7x; Wed, 08 Oct 2025 15:53:25 +0000
Received: by outflank-mailman (input) for mailman id 1139955;
 Wed, 08 Oct 2025 15:53:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6WTj-0003fE-8q
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 15:53:23 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eaa10ece-a45e-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 17:53:22 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b4736e043f9so28378566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 08:53:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b48652a9ff0sm1683399766b.5.2025.10.08.08.53.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 08:53:21 -0700 (PDT)
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
X-Inumbo-ID: eaa10ece-a45e-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759938801; x=1760543601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=WjihOiG01b3doXNVia7/ldfLICaj1ok9ctXzdnsvNeM=;
        b=f3A4Rj1W9366/EDdg/21VKkDCjopGif53qXGbrNoN4kQSUWen2JCZGpkNkei9map/G
         KQjB/BmE6VWHCwUlpbUfmc99X1Z3LZ10NVKcKxRFtX/31cs9BLQjP4hOPhX7J6wN2pUg
         GGCMoMJ7YGlyEEzZ1zhW5+DaEPDeZsQ6nCqBZArxKInNDZy9C8nIIyH4oAtLU3RXmOCi
         ok6xf/lZOgri97c1mU5G/2g++Z2+n3dktcrU7fhV68dA3t+Uf81skna3zvPS7gK3A9xd
         44i213KaGwuWpd0JNlNy7bYydYooAAB3G/y+JR666gJY+vF7xl/1MIJpO1DhSl5PFss6
         ihqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759938801; x=1760543601;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjihOiG01b3doXNVia7/ldfLICaj1ok9ctXzdnsvNeM=;
        b=daouXlD//YCxtCxoqWqk7Qfsn+VZsDtNcCztN1ghdyffqfQSAOf9CTMj3t+9LRQgb/
         FD+iP3FdbMhs1UoeyO2n8oxMn4lmZUTZC6DWdcdPxBHgTNgRrdxdVQlW9WmR+ZcKZrwU
         ncvSNlrohtcbTpV8ITg1Tx5Fe5YDF/nU37VQV+LYNWvtv/DCD+TPNXuyHgI3+04tXW5B
         tG4vUTo1AJ2GdPg8x697xWjOl3sOc+WXwq7KWj0JIMegRRaIRcxaPGB6MlOcNTeb5yMm
         U0sM6O4VGoXvw8JNkOsE9K5O/Rus5eSR/rM2LwG8n8gXa0tsmaG4ZyROLihnNVR4jNnq
         n1qg==
X-Forwarded-Encrypted: i=1; AJvYcCXnp5OnCi4D5XSMC+PuxGsHSPIuHDWgeeTBIDPLOZlnLcn3nuruX7ZJgSkMuOSIxL74Nm1zu6UXjpg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyaYNdMJ1SW6J5sYyuxbccM/TD2rSIWYNUIO9u+XDsOdsfqMIhC
	DJVD755CRSRbtJFLP4CBvNhcnSTqFPyqfpaw17nYFAT++rs9KIOCSLmWkd8FB1yRSw==
X-Gm-Gg: ASbGncvPkTU16F4eCfXwBSJM1kcy7msM6yX8SVwitQ1k05xsdFdJ04PLjH4c5bZi3my
	+LlQ7VpxVWNZjzhFOZ6GBovM1EDyf0L8SwbMuDuLTyQTfEAQjGgcvxapxj+nyjfpyQGzZW1mSuR
	hq9khxbPAzLiuwaV15Hc4Cw8+X3ILBCS5YPRRFVeSVIBLlLrG1VnOGna3iRn9T2FgIa/mFVWkyA
	kHTxw48KAz1tzTv1zjQyuXiADeYxpLw6+gG6KaW7ZsOU9lXVQhlrlRqow1OaEL0c5LDid6CvLN4
	LOL05a/hEuecBGF3DC+66hBpadwEuC2B2nmxgkqrnanpNV0eKP+KZhyino+sesRlT0QaWa4Wc1b
	tGa095JjuoLnJmA3oEd+798tg/QRUyL6CWLI7kJjoX93scGvs46eflpxupk2fH20a2agjQ3RhxT
	ojDeYeE8uIDfA1U8nJHA3mLuFtc5nyXoDdetQU3j48BA==
X-Google-Smtp-Source: AGHT+IG+vDGCwBnyrjzJExqH+z/bNb+4jjwXW6gVEhCgPLTHUyZS8dJFLEnPNkGomu2MN5KOc+7VNQ==
X-Received: by 2002:a17:907:971b:b0:afe:d590:b6af with SMTP id a640c23a62f3a-b50aaa96bb0mr492183366b.20.1759938801301;
        Wed, 08 Oct 2025 08:53:21 -0700 (PDT)
Message-ID: <bc7f343b-b5cb-4276-a7fe-a9b599046cc3@suse.com>
Date: Wed, 8 Oct 2025 17:53:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: revise "cpu_has_vmx" usage for
 !CONFIG_INTEL_VMX case
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250924101417.229108-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20250924101417.229108-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2025 12:14, Grygorii Strashko wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX dependency") the
> HVM Intel VT-x support can be disabled, but it still keeps VMX
> code partially built-in. Particularly in HVM code there are two places:
> 
> 1) hvm/dom0_build.c
>  dom0_construct_pvh()->pvh_populate_p2m()
>     ...
>     if ( cpu_has_vmx && paging_mode_hap(d) && !vmx_unrestricted_guest(v) )
>     {
>         ...
>         [unreachable for !cpu_has_vmx case]
>         rc = pvh_setup_vmx_realmode_helpers(d);
> 
> pvh_setup_vmx_realmode_helpers() allocates memory and configures
>  HVM_PARAM_VM86_TSS_SIZED
>  HVM_PARAM_IDENT_PT
> 
> 2) hvm/hvm.c
>  hvm_set_param()
>     ...
>     case HVM_PARAM_IDENT_PT:
> 
>         if ( !paging_mode_hap(d) || !cpu_has_vmx )
>         {
>             d->arch.hvm.params[index] = value;
>             break;
>         }
>         [unreachable for !cpu_has_vmx case]
>         ...
> 
> Hence HVM_PARAM_IDENT_PT/HVM_PARAM_VM86_TSS_SIZED are used only by VMX code
> above code become unreachable in !cpu_has_vmx case and can be optimazed
> when !CONFIG_INTEL_VMX.
> 
> Replace "cpu_has_vmx" with using_vmx() to account !CONFIG_INTEL_VMX and allow
> compiler DCE to optimize code.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>


