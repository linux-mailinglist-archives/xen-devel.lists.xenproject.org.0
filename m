Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD182B31C
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 17:37:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666438.1037076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNy36-0005ZS-SM; Thu, 11 Jan 2024 16:36:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666438.1037076; Thu, 11 Jan 2024 16:36:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNy36-0005XM-P4; Thu, 11 Jan 2024 16:36:56 +0000
Received: by outflank-mailman (input) for mailman id 666438;
 Thu, 11 Jan 2024 16:36:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNy35-0005XG-Pp
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 16:36:55 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0b4cc20-b09f-11ee-9b0f-b553b5be7939;
 Thu, 11 Jan 2024 17:36:53 +0100 (CET)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-50e80d40a41so7066971e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jan 2024 08:36:53 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n15-20020a05600c3b8f00b0040d5a5c523csm6478250wms.1.2024.01.11.08.36.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jan 2024 08:36:53 -0800 (PST)
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
X-Inumbo-ID: a0b4cc20-b09f-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704991013; x=1705595813; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HG3n+sBfBE8pFUz17wFpgfLbu+v7rIvJAg9POazE9N4=;
        b=Q7Ja5KOvhP6l5DbE+y9xt49IvfWscJB7foCyA0EGSeS5sgY+a8+b/ks1Aftchxx9lf
         SujrxPcQIepRvsU9Fl6D+J7ui7ZVY5q1u3rquuPeQRHKX74OFRBZDHsxElzqMHIY/Ynz
         7IWBK+Ma8qZZHGYK6Qx9Z42fowT32XzAGTYqvw4+3CmV/PT2S5qjelt+WPkdsWdimZ2T
         N5i8f2XT53DFf6cw+4cCH3Lp8ACEMcYiSZ7QuaqiUXQ6OiYgVY58CxHLCNxREOisTBB8
         3eYiEuIfvwwPO1jTP9aYyM0CZFiTErF3u1D1TmvmJnMunH8rmT+5F4BKtZiH108agjeW
         RokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704991013; x=1705595813;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HG3n+sBfBE8pFUz17wFpgfLbu+v7rIvJAg9POazE9N4=;
        b=RoQa+qU7a09Q+ku+cuof7U7FcXMFK87xhUzDQhlO1OeCxSrYmTX7gLigPRLCC6Tm7C
         hfAME4IbNQ2oFp/g5L6Gjk/uFdkhUEE6SsdYCp8GZncMLWHBGRGWfGO9iz8IHkQbyvBF
         RQ8mO7d8jpxgGAMsVryC8COzdUabDGG5D5SMQT8nKdiKSxfs9dZxxNBnNTM12u1CoDgN
         WEQW8rlO0Iu7WfhcKgdtB6hW1rLIdXdApTEgKCMBZLLjUAFqb8V32WqeWlCjisHMVXG5
         e3le2gaQDAsj8KyQs7/sFWf7Rr+hfe1ZA8jlTASuZHG6Xo4/oFU6luXTuxrgZByec1ZE
         rs6g==
X-Gm-Message-State: AOJu0Yz7EupofBs8j6Vxyp0JTn9CMJX6cTXlohGCVR/fPa/aRCcGwb66
	fOriJyIzWKRWuf+wB94SI7DCu6L6ic+3
X-Google-Smtp-Source: AGHT+IHb2waL7oU2Hyzp3xkH4OWgrB1Brmh5V2maRpWWuXK04Mbpocsbs6aVPn4REvYzI26bechTkw==
X-Received: by 2002:ac2:455a:0:b0:50e:7702:a189 with SMTP id j26-20020ac2455a000000b0050e7702a189mr738997lfm.22.1704991013369;
        Thu, 11 Jan 2024 08:36:53 -0800 (PST)
Message-ID: <0cf933b6-d8d6-42d0-8a10-f3f7f9daf32d@suse.com>
Date: Thu, 11 Jan 2024 17:36:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/34] xen/riscv: introduce smp.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
 <7fd0c7bdc14ac2544a568e66387df21eee892523.1703255175.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7fd0c7bdc14ac2544a568e66387df21eee892523.1703255175.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.12.2023 16:12, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V3:
>  - drop cpu_is_offline() as it was moved to xen/smp.h.

Hmm.

>  - add SPDX.
>  - drop unnessary #ifdef.
>  - fix "No new line"
>  - update the commit message

And another hmm.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/smp.h
> @@ -0,0 +1,28 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_RISCV_SMP_H
> +#define __ASM_RISCV_SMP_H
> +
> +#include <xen/cpumask.h>
> +#include <xen/percpu.h>
> +
> +DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
> +DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
> +
> +#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))

This clearly wasn't dropped (yet).

Jan

