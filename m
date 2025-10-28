Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62009C1603C
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 18:00:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152255.1482784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDn2i-00038m-Ir; Tue, 28 Oct 2025 16:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152255.1482784; Tue, 28 Oct 2025 16:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDn2i-00036L-FY; Tue, 28 Oct 2025 16:59:32 +0000
Received: by outflank-mailman (input) for mailman id 1152255;
 Tue, 28 Oct 2025 16:59:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LPue=5F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDn2g-00036F-U0
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 16:59:30 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 776d0415-b41f-11f0-9d16-b5c5bf9af7f9;
 Tue, 28 Oct 2025 17:59:29 +0100 (CET)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3ed20bdfdffso6274876f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 28 Oct 2025 09:59:29 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952db80fsm20907256f8f.31.2025.10.28.09.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 09:59:28 -0700 (PDT)
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
X-Inumbo-ID: 776d0415-b41f-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761670768; x=1762275568; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IHmJC05K6d4S/ovQulh/0EGJ5FYC/LvcPbB3TlFHtKs=;
        b=H+Dn1LR5cRWB15ZCTAhO852uZffTKPu39JSDAfnckFGAkqmYwNPLcGffXuqgAGQivc
         yBxtgFgBLu1s1zRK01clTFzSvet47yirxYS37lz2SZR7P+k9k4MKZ8z4O8L6+StpBkmQ
         ON6Hwwlm1TeDEkULGDO22mjHKMu4+mgZYeFamliAylNZIQIDrrJUXJbu2di6ImUFb2/F
         CoSlYgj0wRZviz9O2LmiVdUxXQLF9kLOnp/LJ69xx0foGEpnTWJet6Ar+f7AEq9xUQvv
         I2P7nf9xo4ZfI9fr+Tv/0QrENh+R4Wq260Q2RMv6tcua0HwrjOYG0vNKaPV1eTppeaY9
         0xgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761670768; x=1762275568;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHmJC05K6d4S/ovQulh/0EGJ5FYC/LvcPbB3TlFHtKs=;
        b=GGTI0Vuhuvs+gu5Dn67YcCQlOFyYPARFz4CmJ67VS1x0+aY0qtbVUlwAG/rSpMYf0Y
         Sfg0Npwurs+cmy57GzldFD8W/wYpRlbiihzW1mSdps2tsDZvk7kukbLw5WCMMc3WolB8
         FHlQSSlBKoRoKntB+3dwEd6HP0vYiKRSDRIaM7sVsrSCul/ph5LhDk2ntevMp7d1f4Yb
         tA+wIFuTRbm2d01o9YaxEE0Ev2TcqUMUJTG5x/43Gbmo0wJbuUORiRhOFy9fmcLZWKT0
         sqKv5HZYFqMrnelrR5mcTRm1eX/hJ5Vm9e1hg869GdDD6Op5OBaLZg0D/j4VF+NdReJ5
         Sn+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU0K8YJdAarmkPxg1Zjh8c4/yqXQT5/1KPKlCILyhUMz9/Gpm1WZ6x5CgZb0Cb0fMenuDFbE431k3c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx9vmw1aVc7Wh2ZZNU+DOfzgEYwpYELtzua+lKjHLZXIi+aPdmI
	jx184uooySAbMf1TmGdUuI25z1GmnaHTt6WE4TmPRko9SrXvwo1LhUZuPHaHvS+M9w==
X-Gm-Gg: ASbGncsZ2oBxTrUukLhYaQCkWCOqei4B0ctrbt0I0vcLkhkhsndLi6lj6GlBc2+shK4
	r+31r00d4MU8+MsEKjm+X1a0wQWJhh9R+u5yh9acbObyqcmpUfTdY3sZafMANzFNkez3o9uykco
	I+b4aptlC3W9KqcDolrAnWtwd3ASwsylaTSlMEYbd0t2hr0wS2yD1boxntCV6e2HuUDubacgj8V
	rd7m2ef+8wZYjnQL3GBGTOh9evcLF+R0j0dw4d9AsQmZN5Wah9WnhEJKE9FdOXR8iG8oVkjVuiD
	Wa3v1BbQlBD9fx7L0/gmNT/O0fvA47IDWpfyF3uhv1bB7AtuVyFp1TQL6nXZ4VJRDjEXDZYELLa
	/oAdwmh8vf59TKCllMX4r/TvC9GTUeEt1KqcO26ZT4sJbopJIawC/PaYSIG0Yhsv9NPTMSr9CGn
	4qA5XvZVJo2LykBN7GSLa87vCYQVnkHQbL/gCmWDTRiUEwhZFfgP9isWyA1Yf8
X-Google-Smtp-Source: AGHT+IFCuMd5vDNxYykCCAdJXbh2xiAUSe5J0sN+dpYjEKEoY/hEFKOyfWPXGfqOPUDeJ7qdco+EBQ==
X-Received: by 2002:a5d:5d12:0:b0:3e9:ad34:2b2e with SMTP id ffacd0b85a97d-429a7e7a764mr3490322f8f.46.1761670768420;
        Tue, 28 Oct 2025 09:59:28 -0700 (PDT)
Message-ID: <b68e74c6-2678-4670-996c-e7a05d61bc04@suse.com>
Date: Tue, 28 Oct 2025 17:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] x86/hvm: move hvm_shadow_handle_cd() under
 CONFIG_INTEL_VMX ifdef
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251023151903.560947-1-grygorii_strashko@epam.com>
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
In-Reply-To: <20251023151903.560947-1-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.10.2025 17:19, Grygorii Strashko wrote:
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -2168,30 +2168,6 @@ int hvm_set_efer(uint64_t value)
>      return X86EMUL_OKAY;
>  }
>  
> -/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
> -static bool domain_exit_uc_mode(struct vcpu *v)
> -{
> -    struct domain *d = v->domain;
> -    struct vcpu *vs;
> -
> -    for_each_vcpu ( d, vs )
> -    {
> -        if ( (vs == v) || !vs->is_initialised )
> -            continue;
> -        if ( (vs->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) ||
> -             mtrr_pat_not_equal(vs, v) )
> -            return 0;
> -    }
> -
> -    return 1;
> -}
> -
> -static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
> -{
> -    v->domain->arch.hvm.is_in_uc_mode = is_in_uc_mode;
> -    shadow_blow_tables_per_domain(v->domain);
> -}
> -
>  int hvm_mov_to_cr(unsigned int cr, unsigned int gpr)
>  {
>      struct vcpu *curr = current;
> @@ -2273,6 +2249,31 @@ int hvm_mov_from_cr(unsigned int cr, unsigned int gpr)
>      return X86EMUL_UNHANDLEABLE;
>  }
>  
> +#ifdef CONFIG_INTEL_VMX
> +/* Exit UC mode only if all VCPUs agree on MTRR/PAT and are not in no_fill. */
> +static bool domain_exit_uc_mode(struct vcpu *v)
> +{
> +    struct domain *d = v->domain;
> +    struct vcpu *vs;
> +
> +    for_each_vcpu ( d, vs )
> +    {
> +        if ( (vs == v) || !vs->is_initialised )
> +            continue;
> +        if ( (vs->arch.hvm.cache_mode == NO_FILL_CACHE_MODE) ||
> +             mtrr_pat_not_equal(vs, v) )
> +            return 0;
> +    }
> +
> +    return 1;
> +}
> +
> +static void hvm_set_uc_mode(struct vcpu *v, bool is_in_uc_mode)
> +{
> +    v->domain->arch.hvm.is_in_uc_mode = is_in_uc_mode;
> +    shadow_blow_tables_per_domain(v->domain);
> +}
> +
>  void hvm_shadow_handle_cd(struct vcpu *v, unsigned long value)

In addition to what others have said, as we're talking of unreachable code
here: This function also is unreachable when SHADOW_PAGING=n. If already
you make adjustments, I think you want to cover this other aspect at the
same time.

Jan

