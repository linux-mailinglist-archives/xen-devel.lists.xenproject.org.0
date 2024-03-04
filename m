Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365E886FB49
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 09:05:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688192.1072093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3JR-0003D7-Q6; Mon, 04 Mar 2024 08:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688192.1072093; Mon, 04 Mar 2024 08:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh3JR-0003AL-NQ; Mon, 04 Mar 2024 08:04:41 +0000
Received: by outflank-mailman (input) for mailman id 688192;
 Mon, 04 Mar 2024 08:04:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh3JQ-0003AF-IT
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 08:04:40 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d9852d7d-d9fd-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 09:04:39 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-565a2c4cc1aso5782328a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 00:04:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q11-20020a056402040b00b005675882c8fdsm559012edv.39.2024.03.04.00.04.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 00:04:38 -0800 (PST)
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
X-Inumbo-ID: d9852d7d-d9fd-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709539479; x=1710144279; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yBntkL9TU/I1fhOpRSPNRqKxvzokK49+QSrv+8S5s4g=;
        b=GAqkKX6Ya8cDZAc6D9WZF+G89DWI+I3LE0OrLbbLiQZ+p1TLkKSM9PKA4wOf4pZn0w
         i9ziVJiOdq4PkOWMrm2ygu29HvHR10vz0URNANwmzQAw1M/0RlhjVu9K/4fxxY3VyYPT
         lPJAzimL3PoXQ9pRXeztyFboAjRqpeRgYCL8blyUqKQlaqRL+RTrH0GOW0AQ339zp77S
         mtowYtUIzXLD2Mj8WA1gUDlenZqxbACViGW/zfpqsqL2Ykl7XxSvIvwwBrAjKYQADfI3
         /tMDQnyIFnlLSyVTVhGIylOltTsnLG4tGwSBjgBxmY2GeBRhFgaOay5cpjQFeURu/fOd
         YPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709539479; x=1710144279;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yBntkL9TU/I1fhOpRSPNRqKxvzokK49+QSrv+8S5s4g=;
        b=a1auZzP3wwJxDgVlBAT8gnv1qndJ8+lVJ6+rNAdm4WcFYRpUnMLU0t9ObG9DEJhKif
         RSRTbQ/M/ynrE7dUF1qGIypIm6Xp7rJ7aHYam6i+MtxdnGM/qZ8RGBerbvlTvbeaQX1P
         D9W8R3VFC27KN6h58a6k7FCY3lRA2NUgqm+P4TOTI00Md+MlNXQc/7gEnrXxf8rX+wsd
         G0GpjMh2yzLSqmWfI5fcQT3HVFD3VHqY8dOTVCiA9RPDMS2liEhocVocJ++Nj2lFIOlP
         t0ekxkivKisGtLE9YS+1ypvxnWmwgOcq18QBAe5BtovQOdkKAJ1G7boAS33E6Grgu7VM
         FCrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqgbX309+4/u+4aye2r2BOOmJ/0SM0rcCCi/uzvUYNzUxyN8Vc//vP4dz0kt0z0cRJTipyyEvswzKCuS/nnHVhjHSUkg9TFE77pmxlki8=
X-Gm-Message-State: AOJu0YxwPffg9XNH0cZR66oruEIUGY5NxFJiNldW2IrsunI31D/ZfdJH
	oUFRU9+QKhgr5z0+sh8QFMKOwhQmeofWSG0IaJYNE7fiRkmCLUUUsM0/GzN3ag==
X-Google-Smtp-Source: AGHT+IFUk19Qf/Sqqly5WoHZXXG9fY7zFmxrMNLkLeh0DkxUzZ1P5GDiJj7YsiMRbYVExDdlklOkoQ==
X-Received: by 2002:a50:cdd0:0:b0:565:7b61:4c86 with SMTP id h16-20020a50cdd0000000b005657b614c86mr6301654edj.6.1709539479049;
        Mon, 04 Mar 2024 00:04:39 -0800 (PST)
Message-ID: <87326c7b-b7d8-4072-bced-d902e23134ed@suse.com>
Date: Mon, 4 Mar 2024 09:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviation for MISRA C:2012
 Rule 16.6
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <a9027b582d7866a31d7438d083499c53a3245989.1709305397.git.federico.serafini@bugseng.com>
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
In-Reply-To: <a9027b582d7866a31d7438d083499c53a3245989.1709305397.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.03.2024 16:04, Federico Serafini wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -322,6 +322,12 @@ Deviations related to MISRA C:2012 Rules:
>           - /\* Fallthrough \*/
>           - /\* Fallthrough. \*/
>  
> +   * - R16.6
> +     - A switch statement with a single switch clause and no default label is
> +       deliberate and improves readability with respect to an equivalent if
> +       statement.
> +     - Tagged as `deliberate` for ECLAIR.

Imo this is another example of wording a deviation in too wide a manner.
It shouldn't be "is", but "may". Whether what is said here applies is
entirely down to every specific instance; otherwise I'm inclined to read
this as a suggestion to replace all if() by switch(), for that always
improving readability. FTAOD things would be different if this was
explanatory text to a SAF comment - there the specific context is always
given (by where the comment actually appears).

Jan

