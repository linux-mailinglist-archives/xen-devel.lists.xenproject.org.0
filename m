Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D64A1D511
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 12:01:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877706.1287848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMs9-00012H-Iq; Mon, 27 Jan 2025 11:01:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877706.1287848; Mon, 27 Jan 2025 11:01:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMs9-00010j-FR; Mon, 27 Jan 2025 11:01:41 +0000
Received: by outflank-mailman (input) for mailman id 877706;
 Mon, 27 Jan 2025 11:01:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcMs7-00010X-V1
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 11:01:39 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 151b4b52-dc9e-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 12:01:39 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso152253566b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 03:01:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab675e631cesm575869566b.52.2025.01.27.03.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 03:01:37 -0800 (PST)
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
X-Inumbo-ID: 151b4b52-dc9e-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737975698; x=1738580498; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0KXnLSIVpK5QQcBSoQQgz9SzN2vucma4NP2Dl3284TY=;
        b=YnUenL+YV03Je6bZuuphzVQSgkJ3Bnt/YvxdcCVFEa876ikrcvvlcVoDJ401PsmPIE
         haYVSEoislm3OndZqxMqUCKulbusQvpZhWgu28bOjx7drMPHpBfU/yqKdzmqLljU4WMy
         P4dwOIvhbimCMLtYjo97rHAFcBdC1Uw5/canNJngC5fDfa0x1rwzMz8bR99NuGtYmZl8
         Z8cLRYoHpk/pG4uJDpNnYbLUSbaFNWirS/MfG9FvMPIPMWvtng+zMRAccxNxvwzpDIFK
         mIDWEX33/YQGd4SF6wkbeIf+lHN+gEgptA/DWNj5zaY9+Aucem23EiGpIWASeu6uds+L
         5WgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737975698; x=1738580498;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0KXnLSIVpK5QQcBSoQQgz9SzN2vucma4NP2Dl3284TY=;
        b=ee74PEwFoqC6wuTx5SE64a4I6oUqB5Lj3xQmMi5nJTk4C25T8zI2lgxJx7QDgaVYzb
         jGcBtZi+v7+5xxeA0HVVgnLjQynChck02JEUpJ21VdJD8edHaLu1vqDY35ZAJ8X8qCMf
         KXTL2wG827byGvivzm+jcIkvD52BK8I9fGgqTFdRSxUilyplLG4wvdM4qpmotCVguYsd
         09ynaEqhCzP3lv0utACEnCKzGkqBD85OyNWvYroow6NedYaPnEtfjdCtwqTiZqlxw04O
         UMYuH7ONInLFpfkIKDv+IBgIX5pii1q7EcXd6NcfNgWZsU5hEL4p4nSVxeGiBS+UhLiF
         s8dg==
X-Forwarded-Encrypted: i=1; AJvYcCVnJkzHm9Ml3rnelR8uZgMf3vU0VXsnzNwFjcZOPnm3OREq2opJS0l8RaZMQuesjBYQMhXnQIJRETI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwGPY0NcCSs0rGHBeIn12N39v9s55KXdfqCoeooC5+qVyy2GH3W
	m35lAuUaNma+lXiyzyYQFpIHodeAJZ+Y+KjQ52plQgtS6TFtScKm1zNgpT31isF/CVwPx1/Wzr8
	=
X-Gm-Gg: ASbGncuIpduIXt/T7uPL8Ht1ReffxexD0+zjt4N2DzC4rq8t41NWC0zT8+Dl3SCwT3i
	6N21aqVDZsgZExVEPAUxXOiUvhFMKAquw1sBDEx+0ivv3eakY0KTcE4yUAU7n0f0A/vBHPKPdLg
	+QBwXFkNPeLctOpw9kjfdFWQste6DBxCl6ja+8a7zSEfnH+L9JmgD44CQBIQe/ett0j2RpBgv1b
	OvlDbuxRH/K79kJ+ojULWRK+y0UYsnqj9l3rfUgLWdr+xsf14kBh1g60BIqSANod6Rlse2/5pyi
	QNHNTKkclnVdcPA0oo0ufTVAnQKiNwBF38O0HeWtmCCNYwgsEZFhXHBzIOVGK/hzYw==
X-Google-Smtp-Source: AGHT+IGgTKeKiYtC4uiOIAUqAUNpGkzuUzQ0vsKUwh6Rgm1vjn9aq8J50PF6F8K5OFQPAGs2fzI66A==
X-Received: by 2002:a17:907:6d09:b0:aa6:8935:ae71 with SMTP id a640c23a62f3a-ab38b0b7f21mr3753786466b.12.1737975697800;
        Mon, 27 Jan 2025 03:01:37 -0800 (PST)
Message-ID: <5c0f2096-32ec-4d08-83be-6153f4a637e3@suse.com>
Date: Mon, 27 Jan 2025 12:01:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] x86/fpu: Pass explicit xsave areas to
 fpu_(f)xsave()
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250110132823.24348-1-alejandro.vallejo@cloud.com>
 <20250110132823.24348-11-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20250110132823.24348-11-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.01.2025 14:28, Alejandro Vallejo wrote:
> No functional change.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2->v3:
>   * const-ified v in fpu_fxsave() (missing in v2)

Sadly this has rendered ...

> --- a/xen/arch/x86/i387.c
> +++ b/xen/arch/x86/i387.c
> @@ -129,7 +129,7 @@ static inline uint64_t vcpu_xsave_mask(const struct vcpu *v)
>  }
>  
>  /* Save x87 extended state */
> -static inline void fpu_xsave(struct vcpu *v)
> +static inline void fpu_xsave(const struct vcpu *v, struct xsave_struct *xsave_area)

... this line too long now. With it suitably wrapped (possibly doable while
committing, if no other reason for a v4 appears)
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

