Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47353AB350F
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 12:39:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981215.1367610 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQZK-0007Ty-Ch; Mon, 12 May 2025 10:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981215.1367610; Mon, 12 May 2025 10:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEQZK-0007Rj-9v; Mon, 12 May 2025 10:39:34 +0000
Received: by outflank-mailman (input) for mailman id 981215;
 Mon, 12 May 2025 10:39:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEQZJ-0007Rb-CQ
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 10:39:33 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63d10dcf-2f1d-11f0-9eb5-5ba50f476ded;
 Mon, 12 May 2025 12:39:32 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-ad4ce8cc3c1so14697166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 03:39:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad24677c9e1sm276342666b.88.2025.05.12.03.39.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 03:39:31 -0700 (PDT)
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
X-Inumbo-ID: 63d10dcf-2f1d-11f0-9eb5-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747046372; x=1747651172; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=exQPuTht+GSMr0VIsjWW4944+BjRY/yJqL7kMbH5fUA=;
        b=K4XAbBm36ocj6mbW7IQ2fmqLUJRQc+tbb3KZdPLfuOkB7vglAucEnJvPmxow+1ShsK
         X4nBNdebhWntHFsP7wqJLdQOGE2zg0p4wNZ/gbdx3K6zpf+phsMDHEnjpou4AhmOHYke
         6FkE2bUOQxGbueCJXFH9VyD92jvj2hfy+A5O+E39GSxDXLW9LcZ5p501ILRMQSNMNUhk
         DBOQDqLNrGQhx/83QOtmmKqxn1dlNBYdzKwqyXOWfAqtVkIa5cUaQUe9wCPqbvYsIm0n
         32BBCADzP8QZFCIoYK9fvDP0KudLS1AX7T62VKodIp7K9o72MN74WwGwJjAjuj7EirIB
         P+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747046372; x=1747651172;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exQPuTht+GSMr0VIsjWW4944+BjRY/yJqL7kMbH5fUA=;
        b=vcgEZ/uID0yKhxyuKjYlcE06i6u1nx5473PSP+7IZwBTLfJugOz4bZ3Og7xlPTHCqC
         7WHrh0u2ajfTxN1rnAP3d+CimWFQgd/Kz+snwn1M0BrYfY2918YMUR6qa8HIH0SuFiPA
         eD5E95rKnXr+u9VO5PZsvmEb+xusAvEwLu6JfPDFf4RvajmkCzr9pFIXk85iZyVOp5W/
         A2ja1KR3S+F7tS5XWG+VM2VMhPEAZwMihN81aLukWPaHhN+FXJ3o1bJ/lJW1O5G6nUqK
         VebkbPfz3/kSJ68O6vy3Us2w3n4p2SbD6HokU0HHu2o6/kMSOcA23Zow4Eadu79yTW6h
         Vviw==
X-Gm-Message-State: AOJu0Yznn8errjQDGTquyvgQPB9TYo5PJkprNrNHk7QwUz4hXpLTs6g6
	rZFUOEEln+shMzM/s0OtMbnzgFnUMkPlLNIbqPUiiGNT+d14fU/ftlTXqfymcQ==
X-Gm-Gg: ASbGncuuT7tRWgY7DL9mdyE6izfYFn6ol2N2shXx6Q4XXuo9iYvJVxxvvaqfZfwl1c5
	3pPJJMlSPKfWC4fNo/w1AItBhQXIGrCXgX2EucfelbzYv8BJMrunrvVhqbdy4DT4ObK8NQnEhgS
	u+C1nWIFXuSVw0vHLWRbWdJNLBx8VugGOoGFu8U1YCmK4rBL68kRSfxM/O7Fvs+QdKBWw6LXVq0
	zJKGgOafQBXS3AmZ+ULRpp/W+c2PB/myKLChhWKDjTSxgo0EynIzgTmFlAoc1g5WVCkA1Vd3car
	GrKk/uT7UbKfwFNi7bnJ/193I+FRA/leXZNRTjQrIXE8P8xWQAftR0LhWS5L6bKhU3uoMl9eReR
	bHpPme7sFIcKfSXX+xnEiYp9wZh2vKGiUDGqWQVr9p3wof4g=
X-Google-Smtp-Source: AGHT+IEzdbnj11R17qz2QklyYPqNgpN0+nOeDC9+0zzbNDnF4Sf6TfpFgS716le9FoIJxlKAy9RFIw==
X-Received: by 2002:a17:907:97d0:b0:ad2:595d:dd2d with SMTP id a640c23a62f3a-ad2595de071mr203214166b.44.1747046371830;
        Mon, 12 May 2025 03:39:31 -0700 (PDT)
Message-ID: <db6316fb-89bd-4891-a4ff-2a13feda112f@suse.com>
Date: Mon, 12 May 2025 12:39:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] Add lockdown mode
To: Kevin Lampis <kevin.lampis@cloud.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20250506162510.1676425-1-kevin.lampis@cloud.com>
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
In-Reply-To: <20250506162510.1676425-1-kevin.lampis@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:25, Kevin Lampis wrote:
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -216,6 +216,9 @@ static void __init _cmdline_parse(const char *cmdline)
>   */
>  void __init cmdline_parse(const char *cmdline)
>  {
> +    /* Call this early since it affects command-line parsing */
> +    lockdown_init(cmdline);

I can't spot the effect the comment mentions anywhere in this patch. Is the
description perhaps lacking some detail? It's rather odd after all to see ...

> --- /dev/null
> +++ b/xen/common/lockdown.c
> @@ -0,0 +1,52 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/efi.h>
> +#include <xen/kernel.h>
> +#include <xen/lockdown.h>
> +#include <xen/param.h>
> +#include <xen/string.h>
> +
> +static bool __ro_after_init lockdown = IS_ENABLED(CONFIG_LOCKDOWN_DEFAULT);
> +ignore_param("lockdown");
> +
> +bool is_locked_down(void)
> +{
> +    return lockdown;
> +}
> +
> +void __init lockdown_init(const char *cmdline)
> +{
> +    if ( efi_secure_boot )
> +    {
> +        printk("Enabling lockdown mode because Secure Boot is enabled\n");
> +        lockdown = true;
> +    }
> +    else
> +    {
> +        while ( *cmdline )
> +        {
> +            size_t param_len, name_len;
> +            int ret;
> +
> +            cmdline += strspn(cmdline, " \n\r\t");
> +            param_len = strcspn(cmdline, " \n\r\t");
> +            name_len = strcspn(cmdline, "= \n\r\t");

... such custom token splitting ahead of normal command line handling.

Jan

