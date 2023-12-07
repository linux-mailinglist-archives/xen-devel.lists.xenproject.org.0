Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0C6808C16
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 16:43:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.650013.1015207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBGXM-0007sY-3i; Thu, 07 Dec 2023 15:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 650013.1015207; Thu, 07 Dec 2023 15:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBGXM-0007q3-0s; Thu, 07 Dec 2023 15:43:40 +0000
Received: by outflank-mailman (input) for mailman id 650013;
 Thu, 07 Dec 2023 15:43:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rBGXK-0007px-1D
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 15:43:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6223c77d-9517-11ee-9b0f-b553b5be7939;
 Thu, 07 Dec 2023 16:43:36 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c236624edso11594645e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 07 Dec 2023 07:43:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d12-20020a05600c3acc00b0040b5377cf03sm2324246wms.1.2023.12.07.07.43.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Dec 2023 07:43:35 -0800 (PST)
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
X-Inumbo-ID: 6223c77d-9517-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701963815; x=1702568615; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bGIrK/ZpBNgnnjfCkInNrRNGFnN7LiTCBDDt0ltX3Qo=;
        b=DLXHQZyyJSgoSpKLRGInDdDwk6iSPtqGx93mah2NySvZHy6WIi0p5gTZEUiijcYP55
         37gQ2Hlh8mbwPTmAPcADMjWQLIGEKuDfV8BSi2gIQVDHqkg6ljpZEvMgIkNUo5magDWM
         1sJlIGpm9+EdRvJ3LsQnsoUIK4EIYWI0e7insYJT+O4UPi7IYg0RnYRA0w1ldDDGwx+r
         VkrZmwac6F8vpCFeeTWTDd0bBtQxT3lWlQiHzw/dNH/rFIeRfsSNwemPAHGt9BA7rDTE
         aBGcygDnckVrkhOZ5LIo1Z7ndixfzCkAUGChZetQr9yZxBIcfKzNn/tdpkTJ61Ux9bPw
         QfXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701963815; x=1702568615;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bGIrK/ZpBNgnnjfCkInNrRNGFnN7LiTCBDDt0ltX3Qo=;
        b=Ex+bohG3HrzJRy0GjSA5G8Ccn+X3KQtE8/axRRFqWlmZCNYy7U6Smie3inHQjJda33
         mY7r7iP/mfC9mKlKdKnHOtWAW2QVcMh0iORES3DPxMAuGofmruTtkmlu7lY/1H70v7Xu
         fHGMe83hHK711wNwb5TQmWcbTPPE7gen7xCOldYCKeYK2R4eVtpfoyv2e2eRoklW6t6d
         yhk+PWR6nWQtRayU8QekgiTVuagtaJuE3R2F1bQDgJ47d7LX8sL1lpZNyOFMJpVlkU/H
         qQSX/RL0y5gYwThmoO3WkC57bKCLvrGvF5To/5QZeKlEjbMkQnVAji+Nf7rJd+EEWbA6
         YqUg==
X-Gm-Message-State: AOJu0Yx+jVGFdwK5BVtTbxtLf+aKhJ4WMy6crcncTnKdUNNZjwC+5XKh
	rpou59hSJ9JCbFeItXIdMzex
X-Google-Smtp-Source: AGHT+IF5u5hWnAHrUWmzJJE4eySStr/XQt+y3gNvf1ZGHYDESVQNhyY6Cb9NgC5zzwr0UxXEssWtCw==
X-Received: by 2002:a05:600c:b46:b0:40c:93f:5da2 with SMTP id k6-20020a05600c0b4600b0040c093f5da2mr1632612wmr.33.1701963815382;
        Thu, 07 Dec 2023 07:43:35 -0800 (PST)
Message-ID: <4e21bb44-5410-4676-a7a8-96f1d1729c27@suse.com>
Date: Thu, 7 Dec 2023 16:43:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 16/39] xen/riscv: introduce asm/smp.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <39cc57e443d2df432f90361204c9edd802fcc320.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <39cc57e443d2df432f90361204c9edd802fcc320.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/smp.h
> @@ -0,0 +1,23 @@
> +#ifndef __ASM_RISCV_SMP_H
> +#define __ASM_RISCV_SMP_H
> +
> +#ifndef __ASSEMBLY__
> +#include <xen/cpumask.h>
> +#include <xen/percpu.h>
> +#endif

If you want this to be possible to include from assembly files (I don't
know why you would want that), ...

> +DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
> +DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);

... these two would also need to live inside the #ifdef. Otherwise the
#ifdef wants dropping.

> +#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))

Seeing this is now the 4th instance, I guess we want to move it to
xen/smp.h. I'll try to remember making a patch.

> +/*
> + * Do we, for platform reasons, need to actually keep CPUs online when we
> + * would otherwise prefer them to be off?
> + */
> +#define park_offline_cpus false
> +
> +/* TODO: need to be implemeted */
> +#define smp_processor_id() (0)
> +
> +#endif
> \ No newline at end of file

You want to take care of this.

Jan

