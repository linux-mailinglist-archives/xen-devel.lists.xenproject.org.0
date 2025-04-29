Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A17BAA0B64
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972319.1360683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jwY-0003Xj-Vm; Tue, 29 Apr 2025 12:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972319.1360683; Tue, 29 Apr 2025 12:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9jwY-0003VI-Sp; Tue, 29 Apr 2025 12:20:10 +0000
Received: by outflank-mailman (input) for mailman id 972319;
 Tue, 29 Apr 2025 12:20:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9jwX-0003V9-P8
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:20:09 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4a393824-24f4-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 14:20:08 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9eb1eso6305800a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 05:20:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f703833d98sm7337842a12.73.2025.04.29.05.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 05:20:07 -0700 (PDT)
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
X-Inumbo-ID: 4a393824-24f4-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745929208; x=1746534008; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BD1pZB0ueDrOOb/kwa74vUwysl7rN4XMxeOX8a800qE=;
        b=fv+Ms9bRI/41ykYMtRLMmw9GFkEMVWMYs8BydnG+eDTmxOXo8M5kLgSTFfqQuaQObh
         MD2KF+gMvk3BxqVE9VwNofI3SjeVqmhoDuduYIlglhUor4pL7XaJP4luMZev0ZhN0e7/
         tHfQsJGwWoHWYFW2youYBdUxD37eQ3jDJCyqg20yir+axq30yrlLgQy/GSwXPzfbdmmv
         PxGtPiQCRn/wIGRNFZaumSfbJ1YOJzTxQgR7X45TOPb9sbXzHNvoBD6GIpTdL1bkn+Fm
         K/NLl2XrjUEfTYlQpwmLMZLLfRGUsCSHF02dJ8Zun75/s15RYaH4RGHlty0MHBDscf+x
         LIRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745929208; x=1746534008;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BD1pZB0ueDrOOb/kwa74vUwysl7rN4XMxeOX8a800qE=;
        b=iHWp1KM767vdI7+hkmmeI8PamIztvJl0v3Efdg9MprZayQAppFvUysMHdcBW4zYORq
         wmpa0KN+7r1jP463uLUhUeRkn8Z6dtp4G57m9IKeaQKfwcKJOB5rZ3L0nPwIlWfTHGJb
         yHBkm8OUJeQJLZyVBh5nrnLXBv22Yu/D8U1TRU9ZlNuN2+6cvlyvH+SLZTzpmaq6Xa6o
         PY2oCqci2LegpFb8ZgidUHH+PamWoERBoMsGqfmkAYHOg/upb5lg/btdI4PmcqlI0Bx4
         rZGnpNkRk/Ggsbh4ptkfl1X/DX8mPGgUSJNBEDILAvCfOYgZoVbONLT8Re1wfd3lJ4r/
         rLzA==
X-Forwarded-Encrypted: i=1; AJvYcCVFsocERFFxjKlNYCNYf5xJZ8A4dXN+Zs7hun8RtUVBpmmmd0OEKftpsldIzAj0ED+Ab+51x1hVnI8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyZSRy7BFzkoC/lmHtgj2Q1+FMlmzlwVAcRCuzNKNrJN0EVhZGD
	2d1L7de1p8gbdZHx71/w/0F0Bm7SmDkarO17znVsSjgx+jkfe9v4RNeB31ZC9g==
X-Gm-Gg: ASbGncs2TtfDRA+WIIaEUEcmHNPF3duBmKHgc7NN2F7WRex69pilrcE/rCIosI0Hsr8
	15SX1RYWhnvauSxDrFX6Uim3gEdzbQiTJCHtmO6sJ6IF04u8AzOaX0PKKj2js1lHn/VSLdxofXr
	r0CAVpl2KajiDmWLLTqezXOrLjrlqTTkENjG22CyXTBjLpriYsutm3eU7Cjpq4FvZYpJDwGrrlH
	Q+t35/vKIyJO1WUEd4fjPqc6+4cVx0BQmJFcBY9wJxse28ETuW2zCTQ0vtCsuAHohvh8YzJrSbK
	dniit1eUIYlhZjAy6bXNpUZx/NuPeyKZf6muKV7hk+pQ/bDeGdFNLdZIqAePxU8PTNyzaO3Aojo
	Z5I4MCMwFhAwIx0rAIO+tZkGFkQ==
X-Google-Smtp-Source: AGHT+IFGqVKnJ42PsxRoy2LdUbhdBUz50/HqI9MQHRskhvX4VfjZ2opLpXwvW7eVMehNcU+EbGA3Vg==
X-Received: by 2002:a05:6402:4553:b0:5f8:3a9f:fdca with SMTP id 4fb4d7f45d1cf-5f83a9ffe17mr2398694a12.9.1745929208038;
        Tue, 29 Apr 2025 05:20:08 -0700 (PDT)
Message-ID: <c40af488-b706-472b-ba89-50b856ccce37@suse.com>
Date: Tue, 29 Apr 2025 14:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/7] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1745918678.git.mykyta_poturai@epam.com>
 <ef583aaae0a311ac8fec8fe4f18e76e9d62432ca.1745918678.git.mykyta_poturai@epam.com>
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
In-Reply-To: <ef583aaae0a311ac8fec8fe4f18e76e9d62432ca.1745918678.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.04.2025 13:52, Mykyta Poturai wrote:
> @@ -75,6 +76,11 @@ static int __init acpi_pci_init(void)
>  }
>  #endif
>  
> +bool arch_pci_device_physdevop(void)
> +{
> +    return iommu_enabled;
> +}

I'm not an Arm maintainer, but if I was, I'd demand that a clarifying comment
was added here.

> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -67,4 +67,9 @@ static inline bool pci_check_bar(const struct pci_dev *pdev,
>      return is_memory_hole(start, end);
>  }
>  
> +static always_inline bool arch_pci_device_physdevop(void)

I see not particular reason to use always_inline here; you don't do so ...

> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -79,6 +79,11 @@ static inline bool is_pci_passthrough_enabled(void)
>      return false;
>  }
>  
> +static inline bool arch_pci_device_physdevop(void)

... here either.

I further notice that you didn't adjust the "reset" sub-op handling, despite
my earlier hint in that direction. Looking at the commit message, you only
mention PHYSDEVOP_pci_device_add anyway. I think all three need mentioning
there, which would then (hopefully) clarify what the deal is with
PHYSDEVOP_pci_device_reset.

Jan

