Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8A69537E7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Aug 2024 18:07:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.778193.1188230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sed0A-0002eb-6b; Thu, 15 Aug 2024 16:07:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 778193.1188230; Thu, 15 Aug 2024 16:07:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sed0A-0002br-2f; Thu, 15 Aug 2024 16:07:02 +0000
Received: by outflank-mailman (input) for mailman id 778193;
 Thu, 15 Aug 2024 16:07:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/2Vq=PO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sed09-0002bk-7y
 for xen-devel@lists.xenproject.org; Thu, 15 Aug 2024 16:07:01 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 668f18c1-5b20-11ef-8776-851b0ebba9a2;
 Thu, 15 Aug 2024 18:06:59 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5a108354819so1565111a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 15 Aug 2024 09:06:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a83838c73e6sm123125466b.11.2024.08.15.09.06.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Aug 2024 09:06:58 -0700 (PDT)
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
X-Inumbo-ID: 668f18c1-5b20-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723738018; x=1724342818; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jp7o1v79sFfIfoN/jQ1NeqSfppz7IEEWYb14Sx2Xics=;
        b=bUrdRpws/D6WrdtSJ0ghP3eHzW2fynurz8wSLHq+vJqJ2q+fVbco55agmxcsyRVC1i
         wlJY761lBCACa/47CqznLbUx64b9oTo7Lwt5EzWxB3vjgBIXFeo/+u8FOgsd4rkgXdBe
         iLroFaN4ZZMDBEx+43vIWcYeRtjRlZOJkyA3w5y30rbPFgw33/x7UiNWy1Iyh06/saPt
         RV0+/hcNPsmcYYU9yvwGHX11WMni8im+kJv4Jv1HLSiOX/xvWU+7t7F0BkyspmnnC+tG
         iFBD6vQbArTmgbgdSeZnh3v1wHRuDoVxAoCflDt7rknKqI+jqjb8jF94SJLM1WF1qNlm
         nsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723738018; x=1724342818;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jp7o1v79sFfIfoN/jQ1NeqSfppz7IEEWYb14Sx2Xics=;
        b=n0BJop2JeP5M0ADsp3EQTx1e3SugF9FXW20j85HjbasxAhlilCO+6xtnyUZaYqREqX
         cFqWyghznXNOTZiGXu1Dp5JXn9xr2Qw2yCKBigHHD9X4VqgjVER1hmiYGxfr2YPq+ldq
         +2OVPxAmMa0+k/k72LFwIutdF2MWlHolhsqCFDd3d1FCfoD1AKiWyK4wO1HmhOTRuVGm
         MckY4ws+p6QdhnqYwLkxZpRkGARZV6o+L7nMwJfWdZ+yQ4iNaKTbht6RZ+WikkG3Ae3i
         fSXEQfM63m8/qCT8egGRaN07Gub4K3CiKfJRKI49vuQePxSSpoutDRhittSl36Vc8j8N
         5Ovg==
X-Forwarded-Encrypted: i=1; AJvYcCVayjGbneASUsgNz6xrxpFWnOx0ZbyJYpKb8DmVoKCYOQM88Xr/M7hGB2Pr6NsJmjRnDwcL/b+gqCc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YySvCf8E95pWlyjXgtgRHox4exS++qylizP8QqyKUoxtQtbiZLM
	grXK+hjJ2rJDADQPeDBUqA16aY1qbvtYSRjg5XSQatWQ/5UYNXLXQuGwLJJahA==
X-Google-Smtp-Source: AGHT+IE9kbhfrLs4LxRHd7jBOEn1wOulw52u69q/iEFLzTlgKlXbCdPFsCisx/NRJwIX64veLWInLw==
X-Received: by 2002:a17:907:e87:b0:a7a:af5d:f313 with SMTP id a640c23a62f3a-a83928d438bmr4925666b.22.1723738018327;
        Thu, 15 Aug 2024 09:06:58 -0700 (PDT)
Message-ID: <896cb71c-f760-4ce9-a3bc-98c984a572cc@suse.com>
Date: Thu, 15 Aug 2024 18:06:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/cpufeatures: Add new cpuid features in SPR to
 featureset
To: Matthew Barnes <matthew.barnes@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <09353a67d79b12f2ff2a9be797866902bcd71825.1723650205.git.matthew.barnes@cloud.com>
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
In-Reply-To: <09353a67d79b12f2ff2a9be797866902bcd71825.1723650205.git.matthew.barnes@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 17:52, Matthew Barnes wrote:
> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -121,6 +121,7 @@ XEN_CPUFEATURE(SMX,           1*32+ 6) /*   Safer Mode Extensions */
>  XEN_CPUFEATURE(EIST,          1*32+ 7) /*   Enhanced SpeedStep */
>  XEN_CPUFEATURE(TM2,           1*32+ 8) /*   Thermal Monitor 2 */
>  XEN_CPUFEATURE(SSSE3,         1*32+ 9) /*A  Supplemental Streaming SIMD Extensions-3 */
> +XEN_CPUFEATURE(SDGB,          1*32+11) /*   Silicon Debugging */

There looks to be a typo here - SDBG is what the SDM says. I also think the
comment might better mention the MSR this controls (IA32_DEBUG_INTERFACE),
as "Silocon Debugging" may mean a lot of different things.

Jan

