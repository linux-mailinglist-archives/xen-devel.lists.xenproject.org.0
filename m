Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F32844255
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 15:57:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674065.1048741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVC1E-0006gK-Pu; Wed, 31 Jan 2024 14:56:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674065.1048741; Wed, 31 Jan 2024 14:56:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVC1E-0006dJ-Mv; Wed, 31 Jan 2024 14:56:52 +0000
Received: by outflank-mailman (input) for mailman id 674065;
 Wed, 31 Jan 2024 14:56:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVC1D-0006dB-9F
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 14:56:51 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5a71743-c048-11ee-98f5-efadbce2ee36;
 Wed, 31 Jan 2024 15:56:48 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-33ae4205ad8so3018950f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 31 Jan 2024 06:56:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 v2-20020a5d6b02000000b0033ae7d768b2sm9918523wrw.117.2024.01.31.06.56.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 Jan 2024 06:56:47 -0800 (PST)
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
X-Inumbo-ID: f5a71743-c048-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706713008; x=1707317808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IyJ6ZLYSM83Rh1dcoTjIKCMTlK7oARSpY4Q5iYBd5AA=;
        b=GPvy34zteg0uWKfHWdyyC6A+ordM04CVBT+M12pK5CvUJAHJ5UPDLtnlUYFCCW+ZAk
         iNjqJm+zpfy7nW07OmPy4X8Ur3+fdqGVgQbTHDmlzDpcCjnmAlqkZIgQb6AfrSwA9qGC
         BgBykHEH2m31Xgr2VEwqRdkITBPePYLdOcJrUHhHYzJfHeES/qYHoXj2ysfyLAbT0YGw
         nD8ekjx07OPMlEIPRV+x+1yFVDS/xgeAVWX1Y+tm/DnsXh9L8wvpfUZgzJI6BI6Kfypw
         IjXYg+UpYxa1d1Vi10NmxK6Ipw8SROT/BXEh6UT2XeFHu9ld+Y6CkLzmTsBiAHtRN0ly
         mLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706713008; x=1707317808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IyJ6ZLYSM83Rh1dcoTjIKCMTlK7oARSpY4Q5iYBd5AA=;
        b=kzgvVZDdJJw8y+Q8mh+aoLaIWYBSX8eZcOF50HNSBa4ouG6pUm0C9lHdHsHPQ88HOI
         OVwW8kl3yXL6Belfuy8HBfn8C7BGPzYq/5az/Ihb+spS5lIH2xUCN3BB4218XsXVYVn4
         HIUE+rfwE89usRWn5l61tzMuqU9zdlsRAvE0//wWfvwjX0FSbxaIw2W30BppqE7hX/sm
         Ifg0yTLwJcJj3OQ2BctYV+ozp1MR0jApivQjU47S+a/Tm4qYS0yGe0oNa1AVyWTY/XAq
         B5QAle2/hjtPJpkmr0Y7ovx+pFoz/5peDyhzxmU8euUH4siwe/bLqGKWALP89RpwFu6w
         RiBA==
X-Gm-Message-State: AOJu0Yy+bPaf4l5tVpBpL5XhgmquYXUBC86WxR/bjcOtSHzKeFHTc5On
	mLnWPobOGtqm8b5OuIQ9oyeoZGqlfVKlJysccbZAVlWqCqctf4A6YQ7yMm9BJQ==
X-Google-Smtp-Source: AGHT+IHshHuNXNHu3vhGy6mtGAiAaF0zVZop0Hk7EJWE0XMAfmXFk5DTFVz8l0fTBr32VRRXILdGNg==
X-Received: by 2002:a5d:5150:0:b0:33a:e8be:51bd with SMTP id u16-20020a5d5150000000b0033ae8be51bdmr1318078wrt.51.1706713008199;
        Wed, 31 Jan 2024 06:56:48 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU+mQtfjcLs0VmznGCNzmEI7ECP0SrDFiqu5X2vhfJZGXXOJpi/cQNZ1pjF5kagJ4jmPEsQ/EZqFJnIVFtLOFP7jF9z6M5chnvBwlyvDK3bHZkEuyH0VobHEjmpy5jRVWxtil6Y8juYpUaCZi6KGSuAW08jQHFRHUqYto2KCAaHAXLUxkzSbWOKmRKw8QR+0p5kzchIMJbk7rNOD5DpCgbbuk07p8TGBKJE8g==
Message-ID: <fdbfe86f-3b7c-4e35-90dc-ac64ee94fcd1@suse.com>
Date: Wed, 31 Jan 2024 15:56:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/7] xen/arm: switch Arm to use asm-generic/device.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1706281994.git.oleksii.kurochko@gmail.com>
 <d5d2b0515516f0554a0532ff4d4fbd9c704e0a1b.1706281994.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <d5d2b0515516f0554a0532ff4d4fbd9c704e0a1b.1706281994.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.01.2024 16:42, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

I'm not an Arm maintainer, but if I was I wouldn't let you get away with
an empty description here. Specifically at least ...

> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -16,7 +16,10 @@
>  #include <xen/lib.h>
>  
>  extern const struct device_desc _sdevice[], _edevice[];
> +
> +#ifdef CONFIG_ACPI
>  extern const struct acpi_device_desc _asdevice[], _aedevice[];
> +#endif
>  
>  int __init device_init(struct dt_device_node *dev, enum device_class class,
>                         const void *data)
> @@ -45,6 +48,7 @@ int __init device_init(struct dt_device_node *dev, enum device_class class,
>      return -EBADF;
>  }
>  
> +#ifdef CONFIG_ACPI
>  int __init acpi_device_init(enum device_class class, const void *data, int class_type)
>  {
>      const struct acpi_device_desc *desc;
> @@ -61,6 +65,7 @@ int __init acpi_device_init(enum device_class class, const void *data, int class
>  
>      return -EBADF;
>  }
> +#endif

... this new #ifdef-ary would want justifying, imo.

Jan

