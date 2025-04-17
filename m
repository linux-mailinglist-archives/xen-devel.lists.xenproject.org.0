Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84734A9155D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 09:35:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.956975.1350192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JlG-0006eh-JV; Thu, 17 Apr 2025 07:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 956975.1350192; Thu, 17 Apr 2025 07:34:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5JlG-0006dG-FI; Thu, 17 Apr 2025 07:34:14 +0000
Received: by outflank-mailman (input) for mailman id 956975;
 Thu, 17 Apr 2025 07:34:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5JlF-0006d8-4M
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 07:34:13 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5ad1e654-1b5e-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 09:34:11 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-39c31e4c3e5so301136f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 00:34:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd230ea65sm11673183b3a.154.2025.04.17.00.34.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 00:34:10 -0700 (PDT)
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
X-Inumbo-ID: 5ad1e654-1b5e-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744875251; x=1745480051; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=73+Md+hzRp/+FEmQKrOxwKkUop1wdjejsDLHrzPCsyo=;
        b=SKeNsIIiitkZr6yQHayQ8IAgQDyIm01G7+oK+FHlh5cbvsJNIUoWwuClzFMbNr1Vpk
         dNZtb6OrwfJ1Rk5V4RHQVNic8urpzt5KrPA5mlMLW5/ZmhGyzlUXGyj4Rz6sIsY5SOwh
         BYgaSzC/APQP7h5Pn70PE3uw7XNKEkHEMZMoXj5+m0sxRaB8EZcMv7itsG7mgAYz3AzI
         BmoMkvLVwxV8HaO5Chz3hk4rtcfs3ayWNOWgvnjE1QaXCieCyPqEzAr8zYsrTgZrKty0
         zFZ1fxrjKka8hhFDISbwkJHfsuMw/kNma6qR8D/TH73KQkHtG3YEtiGSi2Hq3utIinRS
         KxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875251; x=1745480051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73+Md+hzRp/+FEmQKrOxwKkUop1wdjejsDLHrzPCsyo=;
        b=Xhotl9zx9MKLq24DzTPsEOpSfErTQRJuQvOdsSoxy9pACQyH/KoQ8NcOeY+81FQ6RZ
         Lk+lDQLNUjr5GRcWmfIr6Y/6oHm4er7iCYcgKF4AkSVbXUkJA0ifk2MZc2RMsAFsW7/2
         QEhaY6XZ/fA/UiYWWTScjf73E7xUGc5rR15zPzWfree/hqyODl0Rj8I573A4jv8d3/QT
         yzAhEsTr7pfIqjLUZtXCeSi7rvTBENidcfCZba0tXWYzyjVdLpYXuIXgul/9yvRM40ug
         enT5s6DiMc0LkYj1CeMJwstghQHnf2G/pZTyaCSSq+3PDifkludsjcU2YKuJLYCeNf4a
         ASjg==
X-Forwarded-Encrypted: i=1; AJvYcCXJadhyzTDAfGgXKBy5PDa7Kt6pQqC04O6xwj9lj1jSa/ZXbkTKIk4rKlxICsGOv88m0BJTJ4Y2WSs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzTOhBXOunSta/0Bcp0/siuozHSCTxReQQ7GDtK0uWar7wLchvi
	jVRrmkAS8nYjVrZqAGcdiOhLXnHTHV58EOOFe5jxo1B4/lZwKiUHcDrvkCruOA==
X-Gm-Gg: ASbGncszyW8rjn/yqnaLOWuVkHFZOg3ZI1mAK7TbF7eWXKQe9m48hHXaRyBBeX66NNH
	EzrDthXpEL+XaqixqbOJOAsQlPT8Ygz0jue2kKPv8f2JwQ62iK2x+TqZ7vOetHW0uxHNsh/L+Th
	xE1aZbAsDTg2lUzf1OxH3FPF+qyr2z0fxMs8USK4IVZXpBnVp3ETN2qpiUHi4UVnS90cyxYCEu9
	ULuY2HNal5FpRmzFHcl1WdnoBIbqv41whigVkypVNqU3ZzSXB6sRF47b/sfGKcmOoTa7UjTA054
	xpCvxV9hZ/ndmKaCpha0++AkND15UYICwylg7IB2si73VbAPDkDjnGpYZ/u8+bml8K8jVBM8Hv2
	F6PtM+5Xs29B0SCHUHQNgKgDoMQ==
X-Google-Smtp-Source: AGHT+IE/H+QXFqOfCQiR7hf9qPm4uOm4ktzIMMNqxtpatpkADbV1UDHpVDnZTjMhxHu6EeacsAzF0g==
X-Received: by 2002:a05:6000:144e:b0:391:4873:7943 with SMTP id ffacd0b85a97d-39ee5b35c98mr4173959f8f.32.1744875250768;
        Thu, 17 Apr 2025 00:34:10 -0700 (PDT)
Message-ID: <bed994d7-50fe-4a82-a0ec-b986e07ca5dd@suse.com>
Date: Thu, 17 Apr 2025 09:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] vpci/msix: Add function to clean MSIX resources
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: Huang Rui <ray.huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250409064528.405573-1-Jiqian.Chen@amd.com>
 <20250409064528.405573-9-Jiqian.Chen@amd.com>
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
In-Reply-To: <20250409064528.405573-9-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2025 08:45, Jiqian Chen wrote:
> --- a/xen/arch/x86/hvm/intercept.c
> +++ b/xen/arch/x86/hvm/intercept.c
> @@ -276,6 +276,50 @@ void register_mmio_handler(struct domain *d,
>      handler->mmio.ops = ops;
>  }
>  
> +void unregister_mmio_handler(struct domain *d,
> +                             const struct hvm_mmio_ops *ops)
> +{
> +    unsigned int i, count = d->arch.hvm.io_handler_count;
> +
> +    ASSERT(d->arch.hvm.io_handler);
> +
> +    if ( !count )
> +        return;
> +
> +    for ( i = 0; i < count; i++ )
> +        if ( d->arch.hvm.io_handler[i].type == IOREQ_TYPE_COPY &&
> +             d->arch.hvm.io_handler[i].mmio.ops == ops )
> +            break;
> +
> +    if ( i == count )
> +        return;
> +
> +    for ( ; i < count - 1; i++ )
> +    {
> +        struct hvm_io_handler *curr = &d->arch.hvm.io_handler[i];
> +        struct hvm_io_handler *next = &d->arch.hvm.io_handler[i + 1];
> +
> +        curr->type = next->type;
> +        curr->ops = next->ops;
> +        if ( next->type == IOREQ_TYPE_COPY )
> +        {
> +            curr->portio.port = 0;
> +            curr->portio.size = 0;
> +            curr->portio.action = 0;
> +            curr->mmio.ops = next->mmio.ops;
> +        }
> +        else
> +        {
> +            curr->mmio.ops = 0;
> +            curr->portio.port = next->portio.port;
> +            curr->portio.size = next->portio.size;
> +            curr->portio.action = next->portio.action;
> +        }
> +    }
> +
> +    d->arch.hvm.io_handler_count--;
> +}

To add on what Roger said: This is inherently non-atomic, so the domain
would need pausing to do such removal in a race-free way. Hence why we
deliberately didn't have such a function so far, aiui. (The removal may
be safe in the specific case you use it helow, but there's nothing here
preventing it from being used elsewhere, without paying attention to
the raciness.)

Jan

