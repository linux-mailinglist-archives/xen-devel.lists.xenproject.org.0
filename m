Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C277CF49E7
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:17:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195597.1513530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnGi-0006xq-G1; Mon, 05 Jan 2026 16:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195597.1513530; Mon, 05 Jan 2026 16:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnGi-0006vX-Cm; Mon, 05 Jan 2026 16:17:20 +0000
Received: by outflank-mailman (input) for mailman id 1195597;
 Mon, 05 Jan 2026 16:17:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcnGg-0006vN-NH
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:17:18 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01021771-ea52-11f0-b15e-2bf370ae4941;
 Mon, 05 Jan 2026 17:17:17 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4775ae5684fso487815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 08:17:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6ba3af58sm64115365e9.2.2026.01.05.08.17.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 08:17:16 -0800 (PST)
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
X-Inumbo-ID: 01021771-ea52-11f0-b15e-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767629837; x=1768234637; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fib44n/6C5mBpRqag6xUcSyFFCTC3CvyredpLYirKoc=;
        b=OGDKBGU7PRIxI5ExtJ0gqn24nPrJRDzH+qJHmrcG5mvP99IRV+tHmbiOnM6AcYh48x
         KIe5wjsQGHxT2gxWO5w6ejcZalQ20p64Ot/yh/uMxhjlpd2Xo62kmqE1BslP49xOY6bS
         w6MhcU/ZQJp8oWNro7KIJWXub6ghlprfUbTzOLgmWdX/06esclXIplqFGLToTbEX5sb0
         lF0See4rrZbP4it4CLvRdcQX8GFNjbF1IjG8OVN5tGxvMX2QFQXFGQbQ+1y6eATEftII
         SfjTPRIJcfIfKGgNvqfke9EBgEpqR4UoITqzftQs14Erxn/tbRyY98NhfJqcPKEapBIM
         egOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767629837; x=1768234637;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fib44n/6C5mBpRqag6xUcSyFFCTC3CvyredpLYirKoc=;
        b=Ra8ocHgnPVTrdgt04wJIed20B8rgRej8VNrqDw/kaSpFR0HZkq90oFFGsm5P0RY+4V
         pCJKYTu2MWeuKcIYZxf53qr40QMgAySm1rZVKpujW0D9vG48rqZcIpqPZb4tpfR7EqfO
         4xc4a6aBRmdzWWOsTWy8G1OL4IDF4AIhcdBhlF1rvwSU/SPQY+nGI58vBuiJNmuGPVLZ
         Ic0Arf0KAB62sahA5hTrZwTTZ7TunIcVXi69qwDWDN52kGGyr3YkrPGbTeDof7kvW/pX
         VeAH8TitQYGDtNyfUpcx25HwkDjYfyJ/zgecSs2aqwxeubo0Iekl5AuaPzBMyAxfmdWj
         WrvA==
X-Forwarded-Encrypted: i=1; AJvYcCUV0FhWcTlAQrBKqCazzXO4/qQUX7U0UeXoopg9x8F0viUNuweFLg2tAF5pL33gJNx+9LHKbxGqC9A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YynXnUKiTn5hufOOM+1y2+W7cE8inuUCrR9iCL+29t0/8QiNXQt
	6C+zeHdCXQtufudviWVgO+pmt1DK+e18F7FBMAD6/pGm3dvlEkvIbxosRE3RZIL9Og==
X-Gm-Gg: AY/fxX5z0c7mdD/iyeK7A/0UDpSsQiAYUxharcjjkLOySif3ZPNvaIZzjFWx9TGT9kW
	noO38i9x8DB4j08HXyMf7jxwLepRza3sxGHqkoJpff681ecpZIzP3OOM1IPh1SZ3b1QlAlJbreb
	bkFsc++tZ88GeN/klZ4l2XJ9cjbPn4TgtU22JlJrI5W7Mun9oxXsuUzZ3C8Ij6Af0ocR0L+tJM+
	7j2jkJfD1lW/XNdUqdy/F2/6XA9o5bn0jFvdLDcbgw4r5Sk1dq+YfvMS/RaAw7UlgcK03nFsUVA
	RVgQMx5yDIwLYsal6EeEFPTESa2ahTU4J37AcrgGRJ7sUjq4VYuvzfWSnX3TuIUryv+a+PCucXg
	UtNtjVCY2lVdhNcL4uCspX44K4vb80aI13BYmLUE+pb+C8REymaqhmYEDxWinQlpPAdNqRVcMzL
	Ph8mdrc93o3AdPHhJIsY8BokEBezNbnckbZfB7WYz3zZR9u84kXyym+kxHbMbYV3WYv+D6DGvG/
	uY=
X-Google-Smtp-Source: AGHT+IHO06bkhLszfPEOnmL/BXSIuwkGQOUAPYA5I2poM6TmOYIc2Kd4Hg0NfyCLVJ3xEZvsefCahA==
X-Received: by 2002:a05:600c:64c4:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-47d1959afedmr633866395e9.31.1767629836857;
        Mon, 05 Jan 2026 08:17:16 -0800 (PST)
Message-ID: <3df1cf4c-f7c5-4592-90f9-1bd4065559e6@suse.com>
Date: Mon, 5 Jan 2026 17:17:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] xen: Split muldiv64() out of lib.h
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135050.188191-1-andrew.cooper3@citrix.com>
 <20251230135050.188191-5-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251230135050.188191-5-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.12.2025 14:50, Andrew Cooper wrote:
> --- a/xen/common/bitops.c
> +++ b/xen/common/bitops.c
> @@ -247,3 +247,15 @@ static void __init __constructor test_bitops(void)
>      test_multiple_bits_set();
>      test_hweight();
>  }
> +
> +#include <xen/muldiv.h>
> +
> +/* Not a bitop, but here in lieu of any any better location */
> +static void __init __constructor test_muldiv64(void)
> +{
> +    uint64_t res = muldiv64(0xffffffffffffffffULL,
> +                            HIDE(0xffffffffU),
> +                            HIDE(0xffffffffU));
> +    if ( res != 0xffffffffffffffffULL )
> +        panic("muldiv64(), expecting -1ULL, got 0x%"PRIx64"\n", res);

Nit: Better %#"PRIX64".

> --- /dev/null
> +++ b/xen/include/xen/muldiv.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef XEN_MULDIV_H
> +#define XEN_MULDIV_H
> +
> +#include <xen/stdint.h>
> +
> +uint64_t attr_const generic_muldiv64(uint64_t a, uint32_t b, uint32_t c);
> +
> +/*
> + * Calculate a * b / c using at least 96-bit internal precision.  The
> + * behaviour is undefined if the end result does not fit in a uint64_t.
> + */
> +static inline uint64_t attr_const muldiv64(uint64_t a, uint32_t b, uint32_t c)
> +{
> +    return generic_muldiv64(a, b, c);
> +}

As to the file name: Are you expecting any other forms to appear here? Else
why not make it muldiv64.h, matching the .c file's base name? I'm not going
to insist though, so even with just the earlier nit addressed:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

