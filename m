Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51993ADC7EA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 12:20:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018069.1394988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTQ8-0003xK-0Z; Tue, 17 Jun 2025 10:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018069.1394988; Tue, 17 Jun 2025 10:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRTQ7-0003vt-U1; Tue, 17 Jun 2025 10:19:59 +0000
Received: by outflank-mailman (input) for mailman id 1018069;
 Tue, 17 Jun 2025 10:19:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PKBE=ZA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRTQ7-0003vn-69
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 10:19:59 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eb4b530-4b64-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 12:19:58 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so5350683f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Jun 2025 03:19:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deb23e9sm76102845ad.187.2025.06.17.03.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jun 2025 03:19:56 -0700 (PDT)
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
X-Inumbo-ID: 9eb4b530-4b64-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750155597; x=1750760397; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=S4yCxuBD3RxG17f6d6WlqGN28gipJrYWH+YwyKTSXdg=;
        b=YrFp4B6oE92t5ZKmz22i4C7jL8HAnxpmyJGnK80UwWG7JBlWT8F1CA3vD1orkNKDMQ
         2eoksdcV+HJQaLlrqWZTFdvyTB4kGStxoGbYXZIi9CYHWG8hwiSl1zj2QKAp10Hplo9w
         5em35gB3PjxQhN7S40Gx0B5fDWoa1bAKbMTD4ylXmwD03bNQ2zHbvk4RlTcEhDaqZD1B
         SxnLUZ14X90SKXyhjDqSCvynJ0hhts5zNgXJTb42iCXIlb01+oPajiSzWzgGAMQQbriF
         xRXzstFQyVRiVM1iYO12s55BHShRCknJxQC18UCBRBcEqk6WzvqyrAr+sV4gKAnrA8wb
         +11w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750155597; x=1750760397;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4yCxuBD3RxG17f6d6WlqGN28gipJrYWH+YwyKTSXdg=;
        b=XyC1yaRjIpGVnJgRVzbqO2ICynvLnSwVLYfd0PkFjPmjbNqa/Tri0MQOUnkKWwKcUl
         RCAEWH1j31cwMJi3QDOVf8AIkggXzHGX21Hg8RVrU6BIbRQ82EtfrBdgIRouwJ2daP6g
         QuZFiUz1dB0+FVK4Sd8SJbyRtrDmLUJ4XzabrhHJaY5N83LH68+bof72Q77NwS3vOt7R
         xluuXswRqMxhqQzKktYSGY3dE4QsYAUKcygT4Lim4gHyHKdJNrB+Y5TQThJQMTfsGLvw
         p0Xe1PCfOK1UmgXSMgVrRxAMRP3CqH/7KoYiOjO+7GRWeG/k7Tyx70MBu8+dWjzlqIZ8
         5h/A==
X-Forwarded-Encrypted: i=1; AJvYcCV45ycniBR1U7KaJiD5zrnCEN68X+Zi2LoIxxiMclNbPvDHCCPdbEQ4QvlsRS5qnkOqRQzX3BsZ0gQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx+xRom217YA2rIwBfYdvvyb20yJMNRYU0HSTcmGHR35JfQ+BKs
	9fIG3ofLkN7MD4HZrBEeUn8f8QiaqVANQe1YV8aYYJYqt7CaP7gdV9bANyFBMM/VXA==
X-Gm-Gg: ASbGncuaczncP9C/pDmiiUgLbrTAFOoByy6FHHGwqsVDgBJMhNLrgTlCCb2ncwg+cDz
	04FBawaWdWBxsl1nXM8dkY2BoHZhZ2MgaEYcl0CniF1FdiiufTQmYfWNvAFZhfZWBP/GY4kgkNJ
	oSPg+V8zPfd6N7MVzC3XqJpbaRTySTInNqkKFgrfFoOl1D0MYb3owURThP2PI6ddATpEkUCh8YT
	8XOdMPX/K7io1r4IzI5oNbdV9N6A4E5h1C6cXeE0EIydPUwjbsWJUWPtggJ2TLsG2f1W6N7axSf
	YqmUB9sPexvO4nyoNqtGgTWZNTZSOsojc63f91CwNxfiYuGq8U7hhXRXBdTZ5tN3yt0COyqLQzr
	DXcwzbvzS2mpsb02Pk99rH0ZbFnhap/Hu9dLtSkarA7zjljI=
X-Google-Smtp-Source: AGHT+IFQVKF57mxSgD1K19/rbXGej4+5ZqdW/keihxrMZ0Zth8kxWqY84u/yFny1bzHojvJ1VqOE1Q==
X-Received: by 2002:a05:6000:2913:b0:3a3:71cb:f0bd with SMTP id ffacd0b85a97d-3a57237de18mr10384947f8f.23.1750155597430;
        Tue, 17 Jun 2025 03:19:57 -0700 (PDT)
Message-ID: <30bee151-2cb4-4072-a299-d3725be8fe7d@suse.com>
Date: Tue, 17 Jun 2025 12:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/18] xen/cpufreq: bypass governor-related para for
 amd-cppc-epp
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 xen-devel@lists.xenproject.org
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
 <20250527084833.338427-16-Penny.Zheng@amd.com>
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
In-Reply-To: <20250527084833.338427-16-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2025 10:48, Penny Zheng wrote:
> --- a/xen/drivers/acpi/pmstat.c
> +++ b/xen/drivers/acpi/pmstat.c
> @@ -253,7 +253,8 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
>      else
>          strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
>  
> -    if ( !hwp_active() )
> +    /* bypass hwp and amd-cppc-epp driver */

Nit (comment style): Want to start with a capital letter. See ./CODING_STYLE.

> +    if ( !hwp_active() && cpufreq_driver.setpolicy == NULL )

We generally prefer the shorter "!cpufreq_driver.setpolicy".

And then - is using the presence of that hook really a good criteria to use
here (and below)?

> @@ -346,7 +347,8 @@ static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
>      if ( !policy || !policy->governor )
>          return -EINVAL;
>  
> -    if ( hwp_active() )
> +    /* bypass hwp and amd-cppc-epp driver */
> +    if ( hwp_active() || cpufreq_driver.setpolicy == NULL )
>          return -EOPNOTSUPP;

Isn't this the wrong way round? I.e. don't you mean "!= NULL" (or the equivalent
thereof) here?

Jan

