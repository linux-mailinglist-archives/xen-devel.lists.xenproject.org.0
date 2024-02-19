Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C60985A4E0
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 14:37:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682858.1062062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc3p7-0001dn-MJ; Mon, 19 Feb 2024 13:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682858.1062062; Mon, 19 Feb 2024 13:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc3p7-0001bD-JB; Mon, 19 Feb 2024 13:36:45 +0000
Received: by outflank-mailman (input) for mailman id 682858;
 Mon, 19 Feb 2024 13:36:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SL20=J4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rc3p6-0001b7-0V
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 13:36:44 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ea4cc532-cf2b-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 14:36:41 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4126aee00b2so1786715e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 19 Feb 2024 05:36:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l20-20020a05600c1d1400b0041256ab5becsm8564093wms.26.2024.02.19.05.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Feb 2024 05:36:41 -0800 (PST)
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
X-Inumbo-ID: ea4cc532-cf2b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708349801; x=1708954601; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jrKlw3n1B33BnCvjbfAiqSOmbtplbXt1ex1CFFaeOvM=;
        b=FLlhg+IVoeYNQt7WpJq8X0I7e5Bgz7ZupohKAofsRKHX1QCnw1RCMs4xP1Fg/5nvBf
         AakCw/Pf/DT5/wqsRtnH/1J73tVcs708CtLnXNZnWTq4CqjR+4egqG11bX7MzKTO1jqm
         EISACTLo5m6U+xfpdpkf45I+Vd5pvC5ACw5ugW9vzUTsKxdOktYznYtjCZEc2SC7+S9R
         65rtTZUBCORIIxxKn7stxGMqqsCs4OfmoLJv006boSNUUUm6z6RbOcK86rqTOVBi1Vof
         VpkmEUeU90fXBDKcKk9UFCtS9aX2pp15dFB1PfaRJULvBeRoCK7cEkTYNzDvI2Y5IRx+
         zTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708349801; x=1708954601;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrKlw3n1B33BnCvjbfAiqSOmbtplbXt1ex1CFFaeOvM=;
        b=F7hFHv1vXpqknI5iiYS8cKllpd1grtudKrher/VMvjhTlB2+Ix9m2Z/Nh490zyp5H0
         beo8MWJ8CBXv1iMzyAsEgKJiTpKyYBoyViqpWfCRyehp/N/OIZ0EZJlpNWZadEHUCa+G
         GH4Atv3c2PHCEiH2wYmZTzDXGtZV02KdhyLo6GdxbBiXdxglLzH5vjcrFYKZ1bmRCDyp
         pkF4mJPqL0ZHDl/G1+8F6M6DpXhhjQ7idK7/ocu55h1PvADTeJ+Ap30r4ZhlH5sj6sxO
         KpwoFwcoG6DE88jFynhRUQ/zaNKRWw+YipWA8euw3eaML8yf8knwk/DOJckIeFrDi4Fg
         Ltkg==
X-Forwarded-Encrypted: i=1; AJvYcCU6QzX3TkjeqAVyuqZtqPwBHGonbnmYkf0HMFcXjEpDJN7ePj3uCCvzqHlVnGj0wyB8jn5oGKyZvkK+qDY9Oq6APeXjqnHfLwuliE3mzIY=
X-Gm-Message-State: AOJu0YxnI1v4l6YYuhoXeUdiOZuJEDXUjHE14y5RIeVBL4+UpYj2T+XQ
	Fv+1OlHKncq9XBP32PS5Wc8itA0K+rg86vz/8S/oMpiapfO6US9BgJ3RqoSiKQ==
X-Google-Smtp-Source: AGHT+IEz8jMnj3jbA0NmGdJf8EHben7mw302yJEQWn+Atx9WKClUZhrR/jOPkF4EjahffmrmQuIUZw==
X-Received: by 2002:a05:600c:4713:b0:412:6101:9158 with SMTP id v19-20020a05600c471300b0041261019158mr3224184wmo.29.1708349801285;
        Mon, 19 Feb 2024 05:36:41 -0800 (PST)
Message-ID: <66962dfc-db89-40bc-8411-9b92f9458b16@suse.com>
Date: Mon, 19 Feb 2024 14:36:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] xen/hvm: Convert hap_capabilities into a bitfield
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-2-george.dunlap@cloud.com>
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
In-Reply-To: <20240206012051.3564035-2-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2024 02:20, George Dunlap wrote:
> hvm_function_table is an internal structure; rather than manually
> |-ing and &-ing bits, just make it a boolean bitfield and let the
> compiler do all the work.  This makes everything easier to read, and
> presumably allows the compiler more flexibility in producing efficient
> code.
> 
> No functional change intended.
> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> ---
> Questions:
> 
> * Should hap_superpage_2m really be set unconditionally, or should we
>   condition it on cpu_has_svm_npt?

That's HAP capabilities; there's not going to be any use of HAP when
there's no NPT (on an AMD system). IOW - all is fine as is, imo.

> * Do we really need to "!!cpu_has_svm_npt"?  If so, wouldn't it be
>   better to put the "!!"  in the #define, rather than requiring the
>   user to know that it's needed?

Considering that hap_supported is bool now, the !! can simply be
dropped. We've been doing so as code was touched anyway, not in a
concerted effort.

> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -113,8 +113,8 @@ static int cf_check parse_ept_param_runtime(const char *s)
>      int val;
>  
>      if ( !cpu_has_vmx_ept || !hvm_funcs.hap_supported ||
> -         !(hvm_funcs.hap_capabilities &
> -           (HVM_HAP_SUPERPAGE_2MB | HVM_HAP_SUPERPAGE_1GB)) )
> +         !(hvm_funcs.caps.hap_superpage_2mb ||
> +           hvm_funcs.caps.hap_superpage_1gb) )
>      {
>          printk("VMX: EPT not available, or not in use - ignoring\n");

Just to mention it: The conditional and the log message don't really
fit together. (I was first wondering what the 2mb/1gb checks had to
do here at all, but that's immediately clear when seeing that the
only sub-option here is "exec-sp".)

> @@ -104,8 +96,11 @@ struct hvm_function_table {
>      /* Hardware virtual interrupt delivery enable? */
>      bool virtual_intr_delivery_enabled;
>  
> -    /* Indicate HAP capabilities. */
> -    unsigned int hap_capabilities;
> +    struct {
> +        /* Indicate HAP capabilities. */
> +        bool hap_superpage_1gb:1,
> +            hap_superpage_2mb:1;

Nit: Would be nice imo if the two identifiers aligned vertically with
one another.

Jan

