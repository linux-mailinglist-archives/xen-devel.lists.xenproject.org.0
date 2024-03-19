Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 274098802BC
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 17:52:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695510.1085341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmcgY-0006s7-14; Tue, 19 Mar 2024 16:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695510.1085341; Tue, 19 Mar 2024 16:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmcgX-0006pU-UB; Tue, 19 Mar 2024 16:51:33 +0000
Received: by outflank-mailman (input) for mailman id 695510;
 Tue, 19 Mar 2024 16:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmcgX-0006pO-2B
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 16:51:33 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f0336e48-e610-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 17:51:32 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-568aa282ccdso5830781a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 09:51:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z10-20020a170906714a00b00a46c39e6a47sm2288156ejj.148.2024.03.19.09.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 09:51:31 -0700 (PDT)
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
X-Inumbo-ID: f0336e48-e610-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710867091; x=1711471891; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5c1m0stHH+Uv4w1Vr3ysdaNPyDTZUTJ2KrUxuOTSVCc=;
        b=VWTcEWoXOOO0e+s26BE9ZaPx2438wSKYINDGYqiSpm1ym06VU8rvlLXeE3diSL2MQG
         S8ftJ+P0kL2ALc7USfeiWR0dM8cFL+jkkpdBgCGTiRZGv6e7OUG5TEi34Yr/F0iAIyae
         l4d/OrOY6IjzIBmYsU6Lm1gR1cy4wJf4PHCdghNn1fdQLyCpRCU63vwhHox82PMQrJSU
         7li9wE8a1xT14Ni9F3e6VCIzdoAfWDEObj6es33WCjWgX/8JDZ3pQh8pKgC3HF5J4rlz
         cRoWe9XumVqIgNeeoHjPZdvI9xz0S3P2vpJo9Gb2Z8kTfxMSyquJCoO/TrGVowrnOK+d
         brIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710867091; x=1711471891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5c1m0stHH+Uv4w1Vr3ysdaNPyDTZUTJ2KrUxuOTSVCc=;
        b=YHNCCMEq3Nw/myU+1vbylDFQVgRNyhdRruQbPSAvY8MEAQjaq2DqrhHR7zUqaAYM76
         2d6OSNoXLTTRx8plbZd/dHptIqqo/79IIVjVDsEpESHsJoFrki8Z9TEdbubIlfNHG/Qt
         vlPVLLibHWPyaB+pHe1iHZhoJkb4pX/gu8R+l5iLb/2fDzB5qirQ8ISMuIyqYSmPKEDJ
         wQA6GV9toGLRspFTcOQH9ofkz2pdpj0Z2otBBEoAfyk8BC4f21+guwBOjoVjwWVij4LB
         UO1b2XqAyYfNpk5SCCR7Nj7xtZn0m/z/NTA6P6Hqw5ULTOCAVhoc4G244OxTRVFmvDuf
         Wpng==
X-Forwarded-Encrypted: i=1; AJvYcCUIc6TjvQtK+lrijMrmXYObuHGoe7kb+0PqgjYiQLLpgQgA4kFllBw3tNj7vZjrYVliEzYSiHxdKFt2/FTE72rY3VsfZTdHXBP4GLwlXDI=
X-Gm-Message-State: AOJu0YwNARVIzZsEbApvoi3mBf5tIpjlbxe4kO0wxc1M+8UXyy9Spr8X
	+jy+PL7Apgifm4Yt9PWSRPUysD2KUBYw7zlex5k7kA+e53T/RkUI9//ZoH2DRQ==
X-Google-Smtp-Source: AGHT+IF83qp78yQsypXnHscIK9CJiwAR8Zz9XRhQ9FDb4zeOZHTGNWST4Zu/yczgSxw3CkY76oVg7A==
X-Received: by 2002:a17:907:a70f:b0:a46:671a:75f1 with SMTP id vw15-20020a170907a70f00b00a46671a75f1mr11662858ejc.3.1710867091574;
        Tue, 19 Mar 2024 09:51:31 -0700 (PDT)
Message-ID: <b27f1635-7f0d-4c8b-9dcc-934a84bdd98a@suse.com>
Date: Tue, 19 Mar 2024 17:51:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86/boot: Support the watchdog on newer AMD systems
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240319144802.3894710-1-andrew.cooper3@citrix.com>
 <20240319144802.3894710-3-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240319144802.3894710-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2024 15:48, Andrew Cooper wrote:
> The MSRs used by setup_k7_watchdog() are architectural in 64bit.  The Unit
> Select (0x76, cycles not in halt state) isn't, but it hasn't changed in 23
> years, making this a trend likely to continue.
> 
> Drop the family check.  If the Unit Select does happen to change meaning in
> the future, check_nmi_watchdog() will still notice the watchdog not operating
> as expected.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> --- a/xen/arch/x86/nmi.c
> +++ b/xen/arch/x86/nmi.c
> @@ -387,15 +387,12 @@ void setup_apic_nmi_watchdog(void)
>      if ( nmi_watchdog == NMI_NONE )
>          return;
>  
> -    switch (boot_cpu_data.x86_vendor) {
> +    switch ( boot_cpu_data.x86_vendor )
> +    {
>      case X86_VENDOR_AMD:
> -        switch (boot_cpu_data.x86) {
> -        case 6:

Just to mention it - this case label has been dead code anyway for about 10
years.

Jan

