Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E42892D43C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2024 16:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.756963.1165697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRYKW-0004kt-Lo; Wed, 10 Jul 2024 14:30:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 756963.1165697; Wed, 10 Jul 2024 14:30:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRYKW-0004j3-J1; Wed, 10 Jul 2024 14:30:00 +0000
Received: by outflank-mailman (input) for mailman id 756963;
 Wed, 10 Jul 2024 14:29:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Spoc=OK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sRYKU-0004ix-So
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2024 14:29:58 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e19a8627-3ec8-11ef-bbfb-fd08da9f4363;
 Wed, 10 Jul 2024 16:29:57 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2ee910d6a9dso62101541fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jul 2024 07:29:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-77d682b3895sm3020259a12.87.2024.07.10.07.29.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jul 2024 07:29:56 -0700 (PDT)
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
X-Inumbo-ID: e19a8627-3ec8-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720621797; x=1721226597; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FLZ44Opd93tY+rR50jhN/8yFAZMz0cdh9eVTDbACFis=;
        b=GPzeZ4UceLqUPto33N1eXyJYT9dqt7boo4Ju9AmBSR7bn0iFzwJJm45ZjKQ0t9fsOZ
         SkXq4pZyIg/0pU46zdShW2NxPOt6jQPaMLyHHs/EhRbHHAGe4e2zA0OEMuvVHAfXQohr
         ATJ8B+Nyjik1mtN850Fg5mFY6WsY433+1DL9YfS172a+mpGBDKFk/4ZB7ePT+IkGRBAh
         SegtPWVH1cynVc6RKnoyxPG1H1BahJmopOx90EcRsGNgelj444f88ClToVzGyQgNEBsP
         sT0YKEcm65D13WifD5MHuQ2x84c+LwFCJ3SaZuxmhrxuONViwMNBai+GMGu+OD90LHaG
         zbSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720621797; x=1721226597;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FLZ44Opd93tY+rR50jhN/8yFAZMz0cdh9eVTDbACFis=;
        b=tlRQLUT3cBvj7HTv144b2qZptJWSPSHpHD6TRp28fg7C3CbSJUHGZjMhw88rgZRQN5
         olvXihgABMORnOSxcHZqFXksPkSaTHloFFT1iiE8o1qbL1BUDKagi6acenKsd1ZXZsdM
         aLLTd6PgrhERgJYnrrg9ZAe2jLO/dICqK2hmI0xen+geqd5vaOewq0W+CV/W5KihW4d8
         j2csAbIQvAkagGApVCB2SOZkmiE57zcL4yf5nlIZxoke2V5/SkBww5mQXwgw5AU8cGkE
         HgcBn3zKMinS4aVIq5QL6pEcoc/3zed/E+EOnlM6BGB7BF1rEddafzRWW5bEUyZU890x
         68Kg==
X-Forwarded-Encrypted: i=1; AJvYcCX0c3lB8ShvasFJzPxFzmHJeq00LJnxzaXJ77/2I2V0YwTarOlQYfjDzCZgkQxPXEDVtqyTgpa1IXwi+wAdaP71xVCUb/6tf0YGqi7CJkQ=
X-Gm-Message-State: AOJu0Yy3xk4IdCgZL+6L5Ef9/JVEaY12gD43Fs+/x0xFnkCXET0zX59s
	Jcy7pbASEDkMSJr2kIwMF85nnGRf3oBUAgUq3pWiMDfH9urNKdo5B86ewcMq6Q==
X-Google-Smtp-Source: AGHT+IFJzPy0UbH/0maC2j33zCxVjr48Oeaa+JTfX9UELFPZlefE2MWJcKRdES9INQjIRvGZqxUENw==
X-Received: by 2002:a2e:a581:0:b0:2ee:8453:5164 with SMTP id 38308e7fff4ca-2eeb304eec9mr50185651fa.0.1720621796645;
        Wed, 10 Jul 2024 07:29:56 -0700 (PDT)
Message-ID: <0ccb79f3-3518-4766-beb5-229483b2fd67@suse.com>
Date: Wed, 10 Jul 2024 16:29:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v3 1/2] x86/cpufreq: move ACPI cpufreq driver into
 separate file
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1720596402.git.Sergiy_Kibrik@epam.com>
 <cc7d5b8e93e3c4d938d3606e7e8426d53696c8e9.1720596402.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <cc7d5b8e93e3c4d938d3606e7e8426d53696c8e9.1720596402.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.07.2024 10:28, Sergiy Kibrik wrote:
> Separate ACPI driver from generic initialization cpufreq code.
> This way acpi-cpufreq can become optional in the future and be disabled
> from non-Intel builds.
> 
> no changes to code were introduced, except:
>   acpi_cpufreq_register() helper added
>   clean up a list of included headers
>   license transformed into an SPDX line
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with perhaps two tiny further adjustments, which I'd be happy to do while
committing:

> --- /dev/null
> +++ b/xen/arch/x86/acpi/cpufreq/acpi.c
> @@ -0,0 +1,518 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + *  cpufreq.c - ACPI Processor P-States Driver ($Revision: 1.4 $)
> + *
> + *  Copyright (C) 2001, 2002 Andy Grover <andrew.grover@intel.com>
> + *  Copyright (C) 2001, 2002 Paul Diefenbaugh <paul.s.diefenbaugh@intel.com>
> + *  Copyright (C) 2002 - 2004 Dominik Brodowski <linux@brodo.de>
> + *  Copyright (C) 2006        Denis Sadykov <denis.m.sadykov@intel.com>
> + *
> + *  Feb 2008 - Liu Jinsong <jinsong.liu@intel.com>
> + *      porting acpi-cpufreq.c from Linux 2.6.23 to Xen hypervisor
> + */
> +
> +#include <xen/types.h>
> +#include <xen/errno.h>
> +#include <xen/delay.h>
> +#include <xen/param.h>

Would be nice if in the new file xen/ #include-s were sorted.

> +#include <acpi/acpi.h>
> +#include <acpi/cpufreq/cpufreq.h>
> +
> +

No double blank lines please.

Jan

