Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90485976865
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 13:57:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797368.1207292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soiRb-00075r-Lx; Thu, 12 Sep 2024 11:57:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797368.1207292; Thu, 12 Sep 2024 11:57:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soiRb-00073z-I2; Thu, 12 Sep 2024 11:57:03 +0000
Received: by outflank-mailman (input) for mailman id 797368;
 Thu, 12 Sep 2024 11:57:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dRhM=QK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1soiRa-0006yy-Ju
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 11:57:02 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1f305b81-70fe-11ef-a0b5-8be0dac302b0;
 Thu, 12 Sep 2024 13:57:02 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5365cf5de24so1077304e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 12 Sep 2024 04:57:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3ebd468fesm6532059a12.39.2024.09.12.04.57.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Sep 2024 04:57:00 -0700 (PDT)
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
X-Inumbo-ID: 1f305b81-70fe-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726142221; x=1726747021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3am9wpa4biVAqvt+VH3EFTxwnyirMNvVWj7bRTIKis8=;
        b=WRmgi9xiCNu9lMU8m9c1lMc0j4/SxQqX81fiLfc0ZCB9yOCRViTtaKj7U9/YRJSGZf
         ckOhOOva5DmJXRle9ADLZBw6T1veP+IAvzc3lK8lXDlQu4HI1EC/B3vxs1aoOqy4EJ05
         nIekyiJtzItWf7pOl6XSnVh/sw2wkmWj/Md+pSSphm5Lgxzt7x32d3YHVAiQ++l4ffWP
         zbpRgdXwjHyUjJ3qlZiOs0l2ECGJZy9IjbLwFqKgIQxp+mBJ4d9WeitJs/LVp8xVzRep
         iX8LxgC+DKDYbrheIOxY1VsIlrPfQd8N4FXWAjSSoB+MlRtfp/u66QfexJdV7HVMMbxf
         Ie5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726142221; x=1726747021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3am9wpa4biVAqvt+VH3EFTxwnyirMNvVWj7bRTIKis8=;
        b=GToqXUCNWwdfTubTk4UIpvS7R8HBaFpfL1RK/dVe6TIe0mxfdsezgEKrYip+v95gyl
         ivJPCN8b9fmO1vPdJqozY3qIYNzu9pNp304JzQBaesCYEWUpGKNAgV7DRX+SpufpI2n4
         krZjh9Ms/nVRu50yVqVueqPYt0zvsVbq7lxGMClf51aJ2QEeHEMWn8vX+CQuximKP2yd
         4zLocwCrqz8yTah6lQMndTpZ1fIDp0eHuUhwCasVNOgrJiXQO7k3zy/vFXEv4QUl+/hr
         pr4/mifX5tKh2ykGE4lrfTpm7yGQZc4jYYWR7jOiT3Vyf2GoPfnpv0Eg5ZYibXTse6LD
         QF4A==
X-Forwarded-Encrypted: i=1; AJvYcCXehfGGmM3fkCQdsK4GVpCyX2pFtpJhVns9bXLFjS6wkZXA9O/jEpx9/HLsA1ANbPwI+kZGX70jYgs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy816+21s5yDoMaIRUEJrdXpCAQ5TB52XW3MNBndnbNzCsJzCWx
	5sSyA03wcTWFclx1ISH5SoQsY126oI1SyHsGhylrr8rzqYxZGsneNm6CAYIiDA==
X-Google-Smtp-Source: AGHT+IEIRg3Z4JIaPAluqdxpURfSP8Ksbmc9itfLTB6t2NBetZ1eA2ZjKPunDpSkvr/gO9KYCgx62Q==
X-Received: by 2002:ac2:4e08:0:b0:535:674a:2c18 with SMTP id 2adb3069b0e04-53678fbfb65mr1695412e87.32.1726142221099;
        Thu, 12 Sep 2024 04:57:01 -0700 (PDT)
Message-ID: <51c8a98b-145c-4834-865c-b75b61f1d5b0@suse.com>
Date: Thu, 12 Sep 2024 13:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] x86/time: introduce command line option to select
 wallclock
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240912111514.26934-1-roger.pau@citrix.com>
 <20240912111514.26934-2-roger.pau@citrix.com>
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
In-Reply-To: <20240912111514.26934-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.09.2024 13:15, Roger Pau Monne wrote:
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1552,6 +1552,35 @@ static const char *__init wallclock_type_to_string(void)
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
> +        /*
> +         * Checking if run-time services are available must be done after
> +         * command line parsing.
> +         */
> +        wallclock_source = WALLCLOCK_EFI;
> +    else
> +        return -EINVAL;
> +
> +    return 0;
> +}
> +custom_param("wallclock", parse_wallclock);
> +
>  static void __init probe_wallclock(void)
>  {
>      ASSERT(wallclock_source == WALLCLOCK_UNSET);
> @@ -2527,7 +2556,15 @@ int __init init_xen_time(void)
>  
>      open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
>  
> -    probe_wallclock();
> +    /*
> +     * EFI run time services can be disabled from the command line, hence the
> +     * check for them cannot be done as part of the wallclock option parsing.
> +     */
> +    if ( wallclock_source == WALLCLOCK_EFI && !efi_enabled(EFI_RS) )
> +        wallclock_source = WALLCLOCK_UNSET;
> +
> +    if ( wallclock_source == WALLCLOCK_UNSET )
> +        probe_wallclock();

I don't want to stand in the way, and I can live with this form, so I'd like to
ask that EFI folks or Andrew provide the necessary A-b / R-b. I'd like to note
though that there continue to be quirks here. They may not be affecting the
overall result as long as we have only three possible wallclocks, but there
might be problems if a 4th one appeared.

With the EFI_RS check in the command line handler and assuming the default case
of no "efi=no-rs" on the command line, EFI_RS may still end up being off by the
time the command line is being parsed. With "wallclock=cmos wallclock=efi" this
would result in no probing and "cmos" chosen if there was that check in place.
With the logic as added here there will be probing in that case. Replace "cmos"
by a hypothetical non-default 4th wallclock type (i.e. probing picking "cmos"),
and I expect you can see how the result would then not necessarily be as
expected.

Jan

