Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C02899604F
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 09:06:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813757.1226775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syQlY-00067a-UM; Wed, 09 Oct 2024 07:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813757.1226775; Wed, 09 Oct 2024 07:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syQlY-000667-Rc; Wed, 09 Oct 2024 07:05:48 +0000
Received: by outflank-mailman (input) for mailman id 813757;
 Wed, 09 Oct 2024 07:05:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syQlX-00065r-QG
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 07:05:47 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5a7337a-860c-11ef-99a2-01e77a169b0f;
 Wed, 09 Oct 2024 09:05:42 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c928611371so183116a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 00:05:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05f4e93sm5047949a12.96.2024.10.09.00.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 00:05:41 -0700 (PDT)
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
X-Inumbo-ID: e5a7337a-860c-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728457542; x=1729062342; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+YP64Bzsgpvnxz/FJuxw20ht91RmIctuXvRjG0GIwvc=;
        b=FNi1shCJ6I4S3hTV4+d3BAhW0wTFbvG3Aa9IefpghyBL3hwx9hoolAsmDWBryPkV3n
         u3Q6nuf/65gl0HeooZWyOyQntdWuMqL08IGz4w46hZ8ckg8mSqQlqqqF0GCT3sgU7F0f
         a46QowpqyR+XBrDZS0CjQdbs2c7DeTyTOv1L0meL4ovYOtJJcCzqAjTgtfLilqh6po3v
         Hd3BItRo8UILQqzw43Jac13YBM91KEzGl83iKQEUoZzmuQVJ87a4349IJD/bntO8Dmx6
         1iwujX3QIFngDoGTv59myiC+F4VvKfXHpe3XzeiKUvcI7r8qlW0Fixn9CfVMehTZ16P/
         q+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728457542; x=1729062342;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YP64Bzsgpvnxz/FJuxw20ht91RmIctuXvRjG0GIwvc=;
        b=eDmw00R4E6OGZU3xZ9ua9+y9jF0GHcHi2JgT1XHu468b8rz7evhee+2VeNex/C57RR
         zJqOyK1+4FejfnAoBGKBxP2p/q7GBQP4wjsq6yjuc3jdYVumadWXkmz7JYfBIKDBFWU5
         YGFsb61ScZjGtHWaMliY8l7MhfycnoJfZEcu6W4XGmHkmStMYu3QokAiD6zLUB5LwSzX
         Kevg55Wo7dsCHgB1Ol81gQWgRi4kxNX/30U0sapoZ9hKbIMh0BCOwpXBH+oZSsPPRE3W
         7vYBXmD6vr1MwNWJ0aRyY5dbIYnzzZ3hIeB/iftpTVgOPcWRCaS9Xfsk8ykb6A9m8xX5
         on9w==
X-Gm-Message-State: AOJu0YwNJMWMCwaWJ7LDaD7S7cfCZmFBRFEIIMLwb5zYoP58vFNZSc7V
	qPbWW2FiyRdIz2oSnA3zRXufpOvfOVBSRmgYRTYbW93xXNKoKM/gxtjAYye9jw==
X-Google-Smtp-Source: AGHT+IHZxJwFnZHWTviJgoSX5gDunTuaGTf8PSJ1stqDgqHdqgBz/1EPV8MrJ91I5WN25SkvtWU9Wg==
X-Received: by 2002:a05:6402:34cc:b0:5c8:958d:c902 with SMTP id 4fb4d7f45d1cf-5c91d689219mr1066677a12.30.1728457541730;
        Wed, 09 Oct 2024 00:05:41 -0700 (PDT)
Message-ID: <73174eb0-380d-4f95-a2c3-097b86fac8db@suse.com>
Date: Wed, 9 Oct 2024 09:05:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: Remove config dependency in XEN_PRIVCMD definition
To: Jiqian Chen <Jiqian.Chen@amd.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Marek Marczykowski <marmarek@invisiblethingslab.com>
References: <20241009062014.407310-1-Jiqian.Chen@amd.com>
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
In-Reply-To: <20241009062014.407310-1-Jiqian.Chen@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.10.2024 08:20, Jiqian Chen wrote:
> Commit 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
> adds a weak reverse dependency to the config XEN_PRIVCMD definition, its
> purpose is to pass the combination of compilation that CONFIG_XEN_PRIVCMD=y
> and CONFIG_XEN_PCIDEV_BACKEND=m, because in that combination, xen-pciback
> is compiled as a module but xen-privcmd is built-in, so xen-privcmd can't
> find the implementation of pcistub_get_gsi_from_sbdf.
> 
> But that dependency causes xen-privcmd can't be loaded on domU, because
> dependent xen-pciback is always not be loaded successfully on domU.
> 
> To solve above problem and cover original commit's requirement, just remove
> that dependency, because the code "IS_REACHABLE(CONFIG_XEN_PCIDEV_BACKEND)"
> of original commit is enough to meet the requirement.
> 
> Fixes: 2fae6bb7be32 ("xen/privcmd: Add new syscall to get gsi from dev")
> Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>

This lacks a Reported-by:.

> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -261,7 +261,6 @@ config XEN_SCSI_BACKEND
>  config XEN_PRIVCMD
>  	tristate "Xen hypercall passthrough driver"
>  	depends on XEN
> -	imply XEN_PCIDEV_BACKEND
>  	default m
>  	help
>  	  The hypercall passthrough driver allows privileged user programs to

The report wasn't about a build problem, but a runtime one. Removing the
dependency here doesn't change anything in the dependency of xen-privcmd
on xen-pciback, as the use of pcistub_get_gsi_from_sbdf() continues to
exist. Consider the case of XEN_PCIDEV_BACKEND=m and XEN_PRIVCMD=m, which
I guess is what Marek is using in his config. Both drivers are available
in such a configuration, yet loading of xen-privcmd then requires to
load xen-pciback first. And that latter load attempt will fail in a DomU.
The two drivers simply may not have any dependency in either direction.

Jan

