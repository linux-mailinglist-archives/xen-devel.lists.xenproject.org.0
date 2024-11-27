Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F90B9DA5A6
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 11:23:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844618.1260104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFBx-0005pk-Pf; Wed, 27 Nov 2024 10:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844618.1260104; Wed, 27 Nov 2024 10:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFBx-0005nU-Mv; Wed, 27 Nov 2024 10:22:41 +0000
Received: by outflank-mailman (input) for mailman id 844618;
 Wed, 27 Nov 2024 10:22:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=owYM=SW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tGFBw-0005nO-M4
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 10:22:40 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85c9d97f-aca9-11ef-99a3-01e77a169b0f;
 Wed, 27 Nov 2024 11:22:36 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-434a852bb6eso11679775e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 27 Nov 2024 02:22:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbedfccsm15823304f8f.101.2024.11.27.02.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 02:22:35 -0800 (PST)
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
X-Inumbo-ID: 85c9d97f-aca9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMzMiLCJoZWxvIjoibWFpbC13bTEteDMzMy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijg1YzlkOTdmLWFjYTktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNzAyOTU2Ljc3NTAxMywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732702956; x=1733307756; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GwU0VI/DWcd9IATRJO1XDest4Rb9ifvpjNXE7LPL7XM=;
        b=W7qwCLNNYrZr3zXMgVAhSGNFKb3FEE+9sm1KLXKOucGr0Bp7qgSNC6OV8zkreHrU6e
         JJPAvD/hyS+kOtaOJxBQY1QycQri+o4cHKlyckVTqOy7dCIB5riKdDnhio3w5/bPj9It
         6EliVot3HCtvdihuWpSSyyB2kR72Bb+J5n4LC2v9ogheUTgd8qvOC+uQIXMEjnENbrW4
         hPamnyM2XZcq/8OsIPLjbshFtvnctX7YCYnXDL0mBHIuaCpIsWC8Odr4rCuZU9i52mqb
         p+3YOogkS4t/y+puJi/niHlKwzVa44ZeXPvFPDfWN2N3ezdNByBU1fQVdIbu86EIJ0jy
         AvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732702956; x=1733307756;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwU0VI/DWcd9IATRJO1XDest4Rb9ifvpjNXE7LPL7XM=;
        b=vBFJteoNuTRmUGpUakB6FthqPkoB34x48yTHJ7EMlogSREk17CYbyPEjFV6HIjd5AO
         Oy4O+RhSTpKLVbjkmOzHs9hevq7gGDkqooFigJ5wINI3td/jDzm1V7D81Nzmmi+Ofuk0
         f5bWWZ9RPd6RJb16OjEe2pvoJf7RU+l3sN6KMtuDAewI2GeNu08t0ER6KwXQB5mWeRxy
         QTV+ube+9CdM8VhJ4Zv1P8DVteeZ+qA3KhJLGczzJjheDzMYVvSiXb9ytJslsJote67c
         mAVFOhaRCvSoo/K8mlXtYBJE3VNSxAkhB+wFw/slVPfkrxNoDJm2oKZW525NR9TkH/WW
         0a8A==
X-Forwarded-Encrypted: i=1; AJvYcCXYYxyDq8N/n4PfFGpqJp3eb83SSfmq9M+L6sCazTbXMPuQAyD7F+lUUHeZ3zfRnjUkGyfXMBWeeL0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw8D0NQO0ZVrv2GitdCahYU9E1QvtmA9Zu7q1HK+cTwzz9XaC2Z
	BMRmLJKc/NXsL9hEAlfMjf/MOPCAzVzwbuRTtO72hthsrkiZZGO0fvMMnIeMqw==
X-Gm-Gg: ASbGncuzNOrK5+XTkc05NQcR93szE6hJuP6ziNMudwZDv9vYJtorF/SQ686j4/9Bare
	eAG3cDIrNgkwFMsCkXjrCmD0SX8LM+EwnEfjQ7QcXp8Tvr14e2lbje53PvMalRzP4w+A98kRqi6
	JIwMsXhzE5QpB8wdfcfCBfDQ2zIySezmZ37puTV62ZxtdHgeNPCj/hg44ZThijR0GKWba2qPI7D
	qVWu/qbZlRWdY4kImCKvJwv4aXDoru9eO8Gem78gBXUZy/6dTk8EoAOGBOm+6JQVyM53v4fbIij
	ToklYVYXKAnHHTxeT8FinMB7r8a4QF/Itu4=
X-Google-Smtp-Source: AGHT+IHmWs6n7aPb3iYgBymdJMU22INGjQDeJUlyZ/mePCE25D4+Xy1VZLAkD1NT29UoQvHouVFnpA==
X-Received: by 2002:a05:6000:4708:b0:382:5010:c8da with SMTP id ffacd0b85a97d-385c6ee187bmr2151923f8f.59.1732702956235;
        Wed, 27 Nov 2024 02:22:36 -0800 (PST)
Message-ID: <6c2defc4-f8ae-4d5a-a9b8-721f168e6520@suse.com>
Date: Wed, 27 Nov 2024 11:22:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] x86/boot: introduce boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241115131204.32135-1-dpsmith@apertussolutions.com>
 <20241115131204.32135-5-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241115131204.32135-5-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.11.2024 14:12, Daniel P. Smith wrote:
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/bootdomain.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Copyright (c) 2024 Apertus Solutions, LLC
> + * Author: Daniel P. Smith <dpsmith@apertussolutions.com>
> + * Copyright (c) 2024 Christopher Clark <christopher.w.clark@gmail.com>
> + */
> +
> +#ifndef __XEN_X86_BOOTDOMAIN_H__
> +#define __XEN_X86_BOOTDOMAIN_H__
> +
> +struct boot_module;
> +struct domain;

You don't really need these, do you? The uses ...

> +struct boot_domain {
> +    struct boot_module *kernel;
> +    struct boot_module *ramdisk;
> +
> +    struct domain *d;
> +};

... here still introduce the struct tags into global scope, unlike for C++
and unlike ...

> --- a/xen/arch/x86/include/asm/dom0_build.h
> +++ b/xen/arch/x86/include/asm/dom0_build.h
> @@ -13,9 +13,9 @@ unsigned long dom0_compute_nr_pages(struct domain *d,
>                                      unsigned long initrd_len);
>  int dom0_setup_permissions(struct domain *d);
>  
> -struct boot_info;
> -int dom0_construct_pv(struct boot_info *bi, struct domain *d);
> -int dom0_construct_pvh(struct boot_info *bi, struct domain *d);
> +struct boot_domain;
> +int dom0_construct_pv(struct boot_domain *bd);
> +int dom0_construct_pvh(struct boot_domain *bd);

... when used in prototypes.

Jan

