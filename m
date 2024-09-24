Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 281DC9846F9
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 15:44:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802925.1213309 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st5pr-0003nM-JK; Tue, 24 Sep 2024 13:44:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802925.1213309; Tue, 24 Sep 2024 13:44:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st5pr-0003lL-Fq; Tue, 24 Sep 2024 13:44:11 +0000
Received: by outflank-mailman (input) for mailman id 802925;
 Tue, 24 Sep 2024 13:44:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st5pq-0003kb-CI
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 13:44:10 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12c101a5-7a7b-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 15:44:08 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5c42e7adbddso7374103a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 06:44:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf497295sm757422a12.29.2024.09.24.06.44.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 06:44:07 -0700 (PDT)
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
X-Inumbo-ID: 12c101a5-7a7b-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727185448; x=1727790248; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9hJm0OhW71pvTWC7bMUiET7Thhs1TorOJuhiisc1H/M=;
        b=QL0IKVYOGfsMnLzlMvPg7z5Vd12MyR9iVsplpGUFZFKu9GbJlhfYCOCm3PckPwstgf
         zav8zGsHyKRZU7pufgUuImJdpqv+XsGSutmdpmuUWbh+KuCixIcIA7VbNQLmEmGUdCIj
         ke5BTc3t6HHGNcen3NhImkikY/IgfCHwQNV/JS/rI+kW0Dm/nRDeTC2QgTfd+NirLH32
         xtCogjJUt++7cZhB+m5X00mBse3NKMJ0bUIU/Wha7+mrSe6eap7DUhV7p43czSdojKz8
         OLHlGg3y+0nyvCfGt+O5I+2kXoqK0UG93mFrxFmrZKhD1QV0Ag6AfE8DqNkAGSgFrjhk
         /Mxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727185448; x=1727790248;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hJm0OhW71pvTWC7bMUiET7Thhs1TorOJuhiisc1H/M=;
        b=viRKTb5FWDSlyMq/d7BLp7+IXSIjgIr0OrPr/MSDt47wiFXRZsqdcDccUz3auu4mox
         O9SqAHkdo9Yu0alhto+VXUnBujDTTZUBZsPFJV7xh/ns0580Ut/YihPPxxd5aBSvrxuR
         WnWKMy3esiz0u5uB3LW12VwgT+7yFJFv3iW3Un9WMvoGUxpU73Sviq6ltvlMFspGW6vV
         FbTqUnevSugxwht1sR4hDdypIQl+j7xKqArPaSYjSYxu31hxFk6aS+aYAtObGJMpC63A
         O2ZKnoqmhDHB+ozOX4r2dvsAjAlQNVMfVaLAPihW5GCUCZowTbmqhOFf/M6IveDQfO3Q
         1C9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWfllxCmKBOiT6PHMpGRLSHVdVVEeRL21CeN2tSUnMH7hEf6/euaD5Asso3sYW2T12VzTQY5MfIVJE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoDwqQC6XlKLHYgUfHyGRRJJnT0HhmKITImg2xMKfnlcK7ERO3
	3arFjIyyDUPzHUZLhTCxHVFYdEzLQMPERD8PdQaCOHc0oEx+VgCQirrqbmtl3w==
X-Google-Smtp-Source: AGHT+IEbkSSzSwx83yFdhMBKzekGeJQGgDyI3AOIbaWvOK0tcnCxARXdA1NnhdVovfK4hdg6k8NcMQ==
X-Received: by 2002:a05:6402:158f:b0:5bf:1bd:adb3 with SMTP id 4fb4d7f45d1cf-5c464a3eb82mr13108969a12.14.1727185448046;
        Tue, 24 Sep 2024 06:44:08 -0700 (PDT)
Message-ID: <86f05490-92d7-4146-a665-a4ef8732cbe8@suse.com>
Date: Tue, 24 Sep 2024 15:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/boot: Further simplify CR4 handling in
 dom0_construct_pv()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240924112343.193506-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240924112343.193506-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.09.2024 13:23, Andrew Cooper wrote:
> --- a/xen/arch/x86/pv/dom0_build.c
> +++ b/xen/arch/x86/pv/dom0_build.c
> @@ -1057,29 +1057,31 @@ int __init dom0_construct_pv(struct domain *d,
>                               module_t *initrd,
>                               const char *cmdline)
>  {
> +    unsigned long cr4 = read_cr4();
> +    unsigned long mask = X86_CR4_SMAP | X86_CR4_LASS;
>      int rc;
>  
>      /*
> -     * Clear SMAP in CR4 to allow user-accesses in construct_dom0().  This
> -     * prevents us needing to write construct_dom0() in terms of
> +     * Clear SMAP/LASS in CR4 to allow user-accesses in construct_dom0().
> +     * This prevents us needing to write construct_dom0() in terms of
>       * copy_{to,from}_user().
>       */
> -    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> +    if ( cr4 & mask )
>      {
>          if ( IS_ENABLED(CONFIG_PV32) )
> -            cr4_pv32_mask &= ~X86_CR4_SMAP;
> +            cr4_pv32_mask &= ~mask;
>  
> -        write_cr4(read_cr4() & ~X86_CR4_SMAP);
> +        write_cr4(cr4 & ~mask);
>      }
>  
>      rc = dom0_construct(d, image, image_headroom, initrd, cmdline);
>  
> -    if ( boot_cpu_has(X86_FEATURE_XEN_SMAP) )
> +    if ( cr4 & mask )
>      {
> -        write_cr4(read_cr4() | X86_CR4_SMAP);
> +        write_cr4(cr4);
>  
>          if ( IS_ENABLED(CONFIG_PV32) )
> -            cr4_pv32_mask |= X86_CR4_SMAP;
> +            cr4_pv32_mask |= mask;

You may end up setting a bit here which wasn't previously set, and which
might then fault when cr4_pv32_restore tries to OR this into %cr4. Aiui
you must have tested this on LASS-capable hardware, for it to have worked.

Jan

