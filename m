Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D29FB96DF01
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 17:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791249.1201104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEsl-0004Ql-Tr; Thu, 05 Sep 2024 15:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791249.1201104; Thu, 05 Sep 2024 15:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smEsl-0004O3-RE; Thu, 05 Sep 2024 15:58:51 +0000
Received: by outflank-mailman (input) for mailman id 791249;
 Thu, 05 Sep 2024 15:58:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Shi=QD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1smEsk-0004Mu-9i
 for xen-devel@lists.xenproject.org; Thu, 05 Sep 2024 15:58:50 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bd9ff826-6b9f-11ef-a0b3-8be0dac302b0;
 Thu, 05 Sep 2024 17:58:49 +0200 (CEST)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2f029e9c9cfso13583551fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Sep 2024 08:58:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a62371427sm151973866b.108.2024.09.05.08.58.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 08:58:48 -0700 (PDT)
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
X-Inumbo-ID: bd9ff826-6b9f-11ef-a0b3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725551929; x=1726156729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qiWSwcc2xVmrizesU8P7JfRQoKZHIhl20EcdWAm+3sw=;
        b=XUeAH1mQBfy6f2U9AQ0DvkUVYP/86LV4sulT5AjUAv9nFiDxjDjnjx0nIjEAkrovJc
         G62a5QBSSfbMxwZcjMOdYD+o0PoFRGdbDvstLfXB2qa/0LOnineNaGzwJ59ct/Qx6XJk
         f5Ty3jfxB6ic1gQJGOtdV/futAMLZb+6/l+XOLNmAhKQY0zJkKDHVClRDadbf+hweWrm
         w9AarW2qIB+sbljaWAEjOuUHRTvpdrQWIDITEer220R/A2KXmX8HkQSMD/UttUz+oa8t
         nKTD2h9pJZ/8oZCThEreID8AJu1Z4d3IkLG5xpfq4jZ60EM6ZMsVV743F8VhhYMuffav
         4GaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725551929; x=1726156729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiWSwcc2xVmrizesU8P7JfRQoKZHIhl20EcdWAm+3sw=;
        b=c2m2BiDVnUFo9OWkayrT73T8WzA0HSgFm+6w6WJCF9YeQsEA3mXttJryyoUsHhGc7L
         AiZQRpVmYPBdCMgn6XG98n1fyOicncdWXLj+pA6O+5PbTyLEtoGJtCEIhuWCrBMmYfle
         o7iENvge6ABdiIYgDzz/c7esLESATNTeUbHMoXzySuKNAaMLYv9nKPa1Ci1uz4XU2mZ8
         NcNJZLRK7QNTJ+pRT1WqUE07sn2Qi1xpTgVUbM03TgXFG3iRjREP/njBR1gUhChTtYZG
         io5/K3bHuSvOOAYMjsJgjeLYV8Vxhr4hYZrbwjNOyyyN+SiNe5tYdOpRPoMmU9LQeqL1
         P4FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL37kL2wrvMbw2qRtNOteLrbQ/AoHWANj6+apSiF/Ewh5Df0jYloRn6tuUbZ+G1lCSy4K5XCa1TuU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZZnWD6GTb93NjTNWwFZ2WA0X09f89fkwA0eVElTFxulrnP83X
	xdTHgbPaFEX/ruEuQ5Le5g2WZij63p5A9vVutfG7ihuIIgBf9HG0muwlZy9sww==
X-Google-Smtp-Source: AGHT+IHcEeh/YEHADZ6MWRNsFYYUDsLzFHUQ4gjtHo79k2qhQUiZWWfHylwB4G5KjU3Ykd6uj26kJw==
X-Received: by 2002:a2e:4a11:0:b0:2f3:f1ee:2256 with SMTP id 38308e7fff4ca-2f6108ae2demr178523511fa.44.1725551929016;
        Thu, 05 Sep 2024 08:58:49 -0700 (PDT)
Message-ID: <af5ce242-1ec9-4ccc-a531-2252b2d8c90d@suse.com>
Date: Thu, 5 Sep 2024 17:58:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] x86/time: introduce probing logic for the
 wallclock
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240904153151.83995-1-roger.pau@citrix.com>
 <20240904153151.83995-5-roger.pau@citrix.com>
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
In-Reply-To: <20240904153151.83995-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.09.2024 17:31, Roger Pau Monne wrote:
> --- a/xen/arch/x86/time.c
> +++ b/xen/arch/x86/time.c
> @@ -1291,14 +1291,23 @@ static bool __get_cmos_time(struct rtc_time *rtc)
>      return t1 <= SECONDS(1) && t2 < MILLISECS(3);
>  }
>  
> -static bool cmos_probe(struct rtc_time *rtc_p, bool cmos_rtc_probe)
> +static bool __initdata cmos_rtc_probe;
> +boolean_param("cmos-rtc-probe", cmos_rtc_probe);
> +
> +static bool __init cmos_probe(void)

I'm sorry for not paying attention to this earlier, but "cmos" alone
is misleading here and perhaps even more so for cmos_read(). These
aren't about the CMOS (storage) but the CMOS RTC. May I suggest
cmos_rtc_{probe,read}() instead?

>  {
>      unsigned int seconds = 60;
>  
> +    if ( !(acpi_gbl_FADT.boot_flags & ACPI_FADT_NO_CMOS_RTC) )
> +        return true;
> +
> +    if ( !cmos_rtc_probe )
> +        return false;

With this I think ...

>      for ( ; ; )
>      {
> -        bool success = __get_cmos_time(rtc_p);
> -        struct rtc_time rtc = *rtc_p;
> +        struct rtc_time rtc;
> +        bool success = __get_cmos_time(&rtc);
>  
>          if ( likely(!cmos_rtc_probe) )
>              return true;

... this ends up being dead code.

Jan

