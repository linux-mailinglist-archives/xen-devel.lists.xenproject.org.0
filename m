Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF7FB1B006
	for <lists+xen-devel@lfdr.de>; Tue,  5 Aug 2025 10:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1070118.1433769 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujClB-000166-2d; Tue, 05 Aug 2025 08:11:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1070118.1433769; Tue, 05 Aug 2025 08:11:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujClA-000144-VL; Tue, 05 Aug 2025 08:11:00 +0000
Received: by outflank-mailman (input) for mailman id 1070118;
 Tue, 05 Aug 2025 08:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujCl9-00012l-7G
 for xen-devel@lists.xenproject.org; Tue, 05 Aug 2025 08:10:59 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6fb73af-71d3-11f0-b898-0df219b8e170;
 Tue, 05 Aug 2025 10:10:57 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-615d1865b2dso6353499a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Aug 2025 01:10:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f00066sm7863105a12.7.2025.08.05.01.10.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Aug 2025 01:10:56 -0700 (PDT)
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
X-Inumbo-ID: b6fb73af-71d3-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754381456; x=1754986256; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rd/xTim005buCVdoW0OuuV7xncLVOUA5t6nqxX9G0JU=;
        b=gk/t6lEviwrwJEaDrcjPIBtKF45ZthUAVOaB/Gfv67oQ2fwXnqrgG0OKV6GwtggaKQ
         Mvz7xU8q8Lg6ZGnv1OBUkp0IIIaQjqyrmZDTuvGIiCPvpAax7GT4M0DS9WV0nISVIs6f
         xIDuJLZtHeZ+9mla5nBTNE/whmkkn34AqP9c6R0S603Ip4aK6kIyJD+cVEaX+SQhsvkn
         Ep9RawbEfwClzPUoC6hZh9Tkpxga1UxxbzfV0H0dhDpJNi1V/GxKK2JEOrqglBr9Zts3
         6f4s29sSLkix0TtsfFPwdLKXXxkGJv2ZTzNQiET88Shhn9/PG9eJPX7X/Q23zJIWjSKI
         xTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754381456; x=1754986256;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rd/xTim005buCVdoW0OuuV7xncLVOUA5t6nqxX9G0JU=;
        b=dQ+clqoIn+zgZGZk7wYkuJjivm68KAaE93K0gRrAJ5//K6/01MDPltNy1bBcskZb7d
         q/sza2/LZWOlZ23zbQ0gEOPUX/anpvrImK3JROy9qjiLM702Zp8T8ZakRdES0UK1KE3S
         B4y70VEikZQEz+6SYS2x1/GEI4+DO5Ru6BK2j03IKmA1NYc8IuX/JyHflPRclqp6hRfY
         5PysZM8X6lZJ1SRv6LOYj+MYxt6woJdA3f4CX2RViQL3ymDUWTWrZBAE/bnukVhSYw99
         14ZIwpHLfTmM484V984EMUWJ6vB0at+7V/JN0eDkIDGYkrOuYNjm0X/AeTQsYs8aKiZP
         I9EA==
X-Forwarded-Encrypted: i=1; AJvYcCWwx5wKJGsp+hk9WacN2TNXw3Y0V5/iOh5eF5HWYkxqaeVPsYqKMnN+9tH7dnQQ7SRvbGqCdEGmwEM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIlVedih5zIAjdri69DsnH04w/4CQJwnuO/QbqEOaQrfuAK6kW
	CaVYERmBX784gHPC1ZAr4C0pc2tKfl2mRSAVHA4IpBht8Wzi5Yi3TqqdHJL6Let7vA==
X-Gm-Gg: ASbGncsGY95Axh8bQdl2ARmjeEyoCOVTlZdasA+p4tehI2pjHzSqE/YX8SdH5mu/YwD
	KILTVCRsaWJYzripjjA97F2v3kf+oJMFcTyFMU+GGuCzJE8jKSRY3qO+iHd/jTC2488DFal/QJD
	5MoPmv2F7zmCsZb2KlQpj/blFYk+JIF+qDnYudRAMDQXKfbzmFp5Dnd7kDcltytrlJ15rXktg2V
	XeTgD2u4Nr8Ar3j+AMOxTHDbGkG7FNXGg76Y+2qV+aXAjpmoPGUG41hjp5tGiBjsXPEYk9DZmQb
	tJ6sv28BVopzr7VMaBbNptktk+tQspyM69enUWkwnPAQPqa1k48sgQbkmF1GZRNGccWMMeH1oBi
	j1Ybod4o0mXWPW0pKVTDRNEaC1Z8QvFZQpceuqo5odgX/Ulp3L64QTBB7qHYQQ7n+MyNWXS0VQr
	8+IMkaXu8=
X-Google-Smtp-Source: AGHT+IFchRG07DF3ik6Pvfdl6O/fFY6YI19ca/ly7KKZgvE/EPyFHi/Na0SKPzqFcKKuInU8mTZurA==
X-Received: by 2002:a05:6402:1118:b0:615:905a:3d43 with SMTP id 4fb4d7f45d1cf-615e71451c1mr9421099a12.16.1754381456524;
        Tue, 05 Aug 2025 01:10:56 -0700 (PDT)
Message-ID: <889e32d2-b50f-4d61-b04b-6c73472abf23@suse.com>
Date: Tue, 5 Aug 2025 10:10:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/4] vpci/msix: Free MSIX resources when init_msix()
 fails
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20250805034906.1014212-1-Jiqian.Chen@amd.com>
 <20250805034906.1014212-5-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250805034906.1014212-5-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.08.2025 05:49, Jiqian Chen wrote:
> When MSI-X initialization fails vPCI will hide the capability, but
> remove of handlers and data won't be performed until the device is
> deassigned.  Introduce a MSI-X cleanup hook that will be called when
> initialization fails to cleanup MSI-X related hooks and free it's
> associated data.
> 
> As all supported capabilities have been switched to use the cleanup
> hooks call those from vpci_deassign_device() instead of open-code the
> capability specific cleanup in there.
> 
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
> ---
> cc: "Roger Pau Monné" <roger.pau@citrix.com>
> ---
> v9->v10 changes:
> * Call all cleanup hook in vpci_deassign_device() instead of cleanup_msix().

Isn't this rather an omission in an earlier change, and hence may want to
come separately and with a Fixes: tag?

> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -321,6 +321,27 @@ void vpci_deassign_device(struct pci_dev *pdev)
>                      &pdev->domain->vpci_dev_assigned_map);
>  #endif
>  
> +    for ( i = 0; i < NUM_VPCI_INIT; i++ )
> +    {
> +        const vpci_capability_t *capability = &__start_vpci_array[i];
> +        const unsigned int cap = capability->id;
> +        unsigned int pos = 0;
> +
> +        if ( !capability->is_ext )
> +            pos = pci_find_cap_offset(pdev->sbdf, cap);
> +        else if ( is_hardware_domain(pdev->domain) )
> +            pos = pci_find_ext_capability(pdev->sbdf, cap);

What's the point of doing this when ...

> +        if ( pos && capability->cleanup )

... ->cleanup is NULL? Don't you want to have

        if ( !capability->cleanup )
            continue;

earlier on?

Jan

