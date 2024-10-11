Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BBE9999F63
	for <lists+xen-devel@lfdr.de>; Fri, 11 Oct 2024 10:55:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816808.1230945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBQ3-0005M6-AS; Fri, 11 Oct 2024 08:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816808.1230945; Fri, 11 Oct 2024 08:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1szBQ3-0005Jm-7W; Fri, 11 Oct 2024 08:54:43 +0000
Received: by outflank-mailman (input) for mailman id 816808;
 Fri, 11 Oct 2024 08:54:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rzrJ=RH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1szBQ2-0005Hd-9O
 for xen-devel@lists.xenproject.org; Fri, 11 Oct 2024 08:54:42 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 73a2a020-87ae-11ef-99a2-01e77a169b0f;
 Fri, 11 Oct 2024 10:54:40 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a994277b38bso106065466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 11 Oct 2024 01:54:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c937156781sm1712575a12.56.2024.10.11.01.54.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Oct 2024 01:54:39 -0700 (PDT)
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
X-Inumbo-ID: 73a2a020-87ae-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728636880; x=1729241680; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EVqqV8bbP0vqZxsA2NHfVq60VXKBmC8xzX4oMOGwDjo=;
        b=Fy4wXjFBiSYFOD2d1lus4odLsOgh5bHYrfJr+lfQNqWmqFdJ9IcHgzfsZ/7wVMpYHV
         uLX1TMKOI+c6v4CnQDdUOLIaedoWTL3AwWdp9o9kzW5CGm/GYl5pL9l4KQINt1DPvV45
         j+K11NXloPD0QuMYE03NCff6yJI1N1Vr5GMKKAyu54RLHAMAjKFE3VFIFuybrf6Sbz1H
         ovFoJMQHagivLwmePjBu0PhlJRTNl4Aij6BLXm90Paj0RSGUw+3fKfJfJ5OhAQ784dVl
         PwU3Qe78hz4tCzX3uT9KgSPw2yO6eihBfkGT29L5EiNj8KPho9DJYj80M//goH0HpzeP
         ZhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728636880; x=1729241680;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVqqV8bbP0vqZxsA2NHfVq60VXKBmC8xzX4oMOGwDjo=;
        b=L4c668nWCwOQ8+NMLsCMkHNm3DEoRR6hT2RoOFfs/BJlwLE2mao6tuGRdVtOH9tJ/q
         9P0eCs/sX/NVQX5cA2ywx2nrEYWY6afsascwFFx4yxbjnFl+JMFrpszdSC+L5Hl2ZNvQ
         9K9+/XuygbIQF4nkJZvVTvGzavVOzbV9yCZHtm8z5vv0qpGheWohaY4EaAp9Pn5I4Yxt
         rBjSO5Q4/6svHDI1PwwWTvzGSmhBZLXaMm0iCelc9j+9eWR6x303UzduQPuog62IxaT1
         lnsEe5pBC045hdnLRvay9w1UqCSu1OQW4+yHqOwp7+BmaYH7aiHxZYz1iXyyp7xXCwiw
         pWdA==
X-Gm-Message-State: AOJu0YxmGrOwLlm7db98Whr896Wr+44aeIYbv2TrcSgnU9utDURJe2Rs
	OqOsDxJJb8OnOsMctz5OOCEDYmxhga1ZMWxaQ23RUKla11Q32fz9m5PaxhnkDA==
X-Google-Smtp-Source: AGHT+IFdCYEySFaAL2Q32bJrB2QP+f1I1PhmuHc4V7q3/BGmRtBabQTghb5XU7NgxOUjqBrA7M8lZg==
X-Received: by 2002:a05:6402:354f:b0:5c8:9f44:a0b2 with SMTP id 4fb4d7f45d1cf-5c948c8834dmr1938980a12.5.1728636880095;
        Fri, 11 Oct 2024 01:54:40 -0700 (PDT)
Message-ID: <318bd8a4-a349-4e7b-8653-6995d5f9f125@suse.com>
Date: Fri, 11 Oct 2024 10:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen: Remove dependency between pciback and privcmd
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20241011034227.1278144-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.10.2024 05:42, Jiqian Chen wrote:
> @@ -1757,11 +1756,19 @@ static int __init xen_pcibk_init(void)
>  		bus_register_notifier(&pci_bus_type, &pci_stub_nb);
>  #endif
>  
> +#ifdef CONFIG_XEN_ACPI
> +	xen_acpi_register_get_gsi_func(pcistub_get_gsi_from_sbdf);
> +#endif
> +
>  	return err;
>  }
>  
>  static void __exit xen_pcibk_cleanup(void)
>  {
> +#ifdef CONFIG_XEN_ACPI
> +	xen_acpi_register_get_gsi_func(NULL);
> +#endif

Just wondering - instead of these two #ifdef-s, ...

> --- a/include/xen/acpi.h
> +++ b/include/xen/acpi.h
> @@ -91,13 +91,9 @@ static inline int xen_acpi_get_gsi_info(struct pci_dev *dev,
>  }
>  #endif
>  
> -#ifdef CONFIG_XEN_PCI_STUB
> -int pcistub_get_gsi_from_sbdf(unsigned int sbdf);
> -#else
> -static inline int pcistub_get_gsi_from_sbdf(unsigned int sbdf)
> -{
> -	return -1;
> -}
> -#endif
> +typedef int (*get_gsi_from_sbdf_t)(u32 sbdf);
> +
> +void xen_acpi_register_get_gsi_func(get_gsi_from_sbdf_t func);
> +int xen_acpi_get_gsi_from_sbdf(u32 sbdf);

... wouldn't a static inline stub (for the !XEN_ACPI case) aid overall readability?

Jan

