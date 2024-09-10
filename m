Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3134972DB2
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2024 11:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.795177.1204364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxEI-0005QN-5h; Tue, 10 Sep 2024 09:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 795177.1204364; Tue, 10 Sep 2024 09:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snxEI-0005Nm-2U; Tue, 10 Sep 2024 09:32:10 +0000
Received: by outflank-mailman (input) for mailman id 795177;
 Tue, 10 Sep 2024 09:32:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zCZR=QI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1snxEG-0005Ng-QS
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2024 09:32:08 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b95e6b1-6f57-11ef-99a1-01e77a169b0f;
 Tue, 10 Sep 2024 11:32:06 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8d0d0aea3cso493582566b.3
 for <xen-devel@lists.xenproject.org>; Tue, 10 Sep 2024 02:32:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25926eddsm455744166b.49.2024.09.10.02.32.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Sep 2024 02:32:05 -0700 (PDT)
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
X-Inumbo-ID: 8b95e6b1-6f57-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725960726; x=1726565526; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Yg5tkvXJkQYiod0ISKL3e8Ih0fxM/13J0AGA7n1w4w=;
        b=HwyCS9GPLtOON9TH4Lva8ft0z8tgAJQkVzDiGmR5BIjNDo/ndpvXoiCIh0ZYPmtrTt
         mxkOHI7m642CHYejr/+DjYXUfJ/uaKPXFJSMpObnuhnBhczhAEvAdPSKpHPWZ5vHpA4P
         XD9/67a/zYePF32QTAI4DgMlRVO8kHmIGaVUoa8d9v8ixbBmHEVjG9TlgP8LpMH7WM07
         v3kVd4DPSiWArZs0ooH7GaHr8anlDr98bvLChlW5ssXdMVx7s4pVkeggWUHAEZwhijwM
         TRTL05d/j8rhTWLnPodP8gwZeKAkHfuHKuHSuyf5OeLTX2M56G8IXnOnzPcrKmYpDPSx
         2m8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725960726; x=1726565526;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Yg5tkvXJkQYiod0ISKL3e8Ih0fxM/13J0AGA7n1w4w=;
        b=coxAwKPvWd4HpC1R5/YqaAqcQ3Fhv8CydCUWJj2kDny9WLlEeub16U9V4DyoSFicBd
         1jKhBXS14mPcHyFbxC5H1YRUAWvLW+vn0FPFIkiZG3kwDH+qosNXue3YihalXss4tHlA
         0d/ePcx2CPXCCNaFgDYe7859vrgafLTIcqL2uiaLdJwahJKXp75xz/xYhzrTeqA/Y2rz
         10cN4kjJs8mRzpCBHvY6Kd2PgC3bbAd4SiCU2qBlNXnk+LSn+oHpkKapF+PerHCUKLGh
         nHn83nYhiNAtOsrxSPclNoHoyR7FRlcKjUZCjRHH5yDSQT9Xt9phZcCGyPgtAHqSproU
         zBPA==
X-Forwarded-Encrypted: i=1; AJvYcCUzxPuLwNco7oc1VsHnR7VmXvPtHBHB+LwWX698eGNvFPKXzplM2YPIj5pv7qJaGfT5q6yBuGJviLE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyqBmwldqgRTnxeiAzcsyfOVl/pmsmcikCe7s7qcN3H6qThFRBE
	ZWRRI/tbFkuYjdDs4NwQDCfQGqtOHjrEwfJSR/M2h3HIeBuNmWcxuP3WvvXx/A==
X-Google-Smtp-Source: AGHT+IGGWIrzlmY3uYLgO+vuPe0A1VkY2sH4GhmnJFDdM2oRq38ut0OoLd9GSosmLV46e+0BifHh9g==
X-Received: by 2002:a17:907:6ea3:b0:a8d:2faf:d337 with SMTP id a640c23a62f3a-a8ffaa97aafmr15860766b.7.1725960726062;
        Tue, 10 Sep 2024 02:32:06 -0700 (PDT)
Message-ID: <985c0d70-55de-43ba-a1b3-811487bb05be@suse.com>
Date: Tue, 10 Sep 2024 11:32:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] x86/time: introduce command line option to select
 wallclock
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240909145455.7517-1-roger.pau@citrix.com>
 <20240909145455.7517-4-roger.pau@citrix.com>
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
In-Reply-To: <20240909145455.7517-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.09.2024 16:54, Roger Pau Monne wrote:
> Allow setting the used wallclock from the command line.  When the option is set
> to a value different than `auto` the probing is bypassed and the selected
> implementation is used (as long as it's available).
> 
> The `xen` and `efi` options require being booted as a Xen guest (with Xen guest
> supported built-in) or from UEFI firmware.

Perhaps add "respectively"?

> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1550,6 +1550,36 @@ static const char *__init wallclock_type_to_string(void)
>      return "";
>  }
>  
> +static int __init cf_check parse_wallclock(const char *arg)
> +{
> +    if ( !arg )
> +        return -EINVAL;
> +
> +    if ( !strcmp("auto", arg) )
> +        wallclock_source = WALLCLOCK_UNSET;
> +    else if ( !strcmp("xen", arg) )
> +    {
> +        if ( !xen_guest )
> +            return -EINVAL;
> +
> +        wallclock_source = WALLCLOCK_XEN;
> +    }
> +    else if ( !strcmp("cmos", arg) )
> +        wallclock_source = WALLCLOCK_CMOS;
> +    else if ( !strcmp("efi", arg) )
> +    {
> +        if ( !efi_enabled(EFI_RS) )
> +            return -EINVAL;

I'm afraid there's a problem here, and I'm sorry for not paying attention
earlier: EFI_RS is possibly affected by "efi=" (and hence may change after
this code ran). (It can also be cleared if ->SetVirtualAddressMap() fails,
but I think that's strictly ahead of command line parsing.)

Jan

