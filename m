Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 979BD8A99AF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 14:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708328.1107169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQmW-0005dE-Px; Thu, 18 Apr 2024 12:22:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708328.1107169; Thu, 18 Apr 2024 12:22:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxQmW-0005az-NQ; Thu, 18 Apr 2024 12:22:24 +0000
Received: by outflank-mailman (input) for mailman id 708328;
 Thu, 18 Apr 2024 12:22:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxQmV-0005at-JY
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 12:22:23 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e0a644f-fd7e-11ee-94a3-07e782e9044d;
 Thu, 18 Apr 2024 14:22:21 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-418a02562b3so6621195e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 05:22:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b0041897c6171dsm6312365wmq.16.2024.04.18.05.22.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 05:22:18 -0700 (PDT)
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
X-Inumbo-ID: 4e0a644f-fd7e-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713442941; x=1714047741; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vM4f4TZxDAosLLs33/YpPZlD6ZYUNgzXS2h8vCgEcNw=;
        b=dOoOeryNdhj5Z1yP4uu3Oa9VjQSsiPE9liYJ3M7kAdV4rHrqWqSw95OelzEUvIdkU0
         iKXRsXz8ju69Dt8wJzqeGxdKpypGzoiXnM/f0U1zb+DqpHw9/g8NGyitXRzioFA1x5ME
         +tcrciP4QMBSzMD4gUPymgTMaWsHK0QjUkngrWLxBUAlLR63jFgfmxHyD3kZWdduluar
         PT42PsUfNjPXqNmAYVyHKm6HIMKvCJVjrHLRX0o+fDcgZ1NRcigEIHDAyj1ZLtSvF50Z
         T6iestDBPboaZHtX8NUKMfwQb2aBxF1gwvUpa7yCGpssxf5EUPeICQYq/EsALoLxYISe
         Lhvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713442941; x=1714047741;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vM4f4TZxDAosLLs33/YpPZlD6ZYUNgzXS2h8vCgEcNw=;
        b=JBEkd/c5WXY5YFtEVN/6SdMZfT6Hy0ZAMCWeFKuzq2ai4HnFKGkXdZbKCoZ/5svbJG
         K6L4GyP5kQmGpKoolv/9jBbniihp+f6cB8LmYJg0t8LB0WYnGYDQeRVYt0i+rFIwkdEf
         NC+yRTWx7OOTd5FHTqESmCrff1f0cQKVDl6kceS++f0ReDJuMKBn/La4CV/q0xjOzVl+
         W9kZkB2BoZa7q5vKXd1psCtVByLay/UQ8g24+9FnZLAl1dbsWqy43+owJAkxA36asRiR
         /pGc5lc4SbontQ1UXlhRfVuWEtSXLUrWsV1LCR7NDecQeCrVYpnvhuiB2IRlDSStjL4j
         d38w==
X-Forwarded-Encrypted: i=1; AJvYcCVRyCfKWph9vCscNJFzBcFiuw1kqQvz4HGCg4Ljku8mEzgCF84bj+4Xo417JNKOahmxHjsrDyY6qBedIha240fZvbscGXUrxYjZ+r0FqqQ=
X-Gm-Message-State: AOJu0YzmN3kVF3ShnXcE7SNBkuikX9n5qIbX/3peHIqEk7pR7hGJBtk4
	osEeODMnPIy1zMWar7f1ijqzrgptAv0PNWhOtSn72TXbdXFzvpyySxG3g4JuqA==
X-Google-Smtp-Source: AGHT+IFtrImA0VCmQw45a7nrShdI+nOQxuOmBqjSeKYHvfmNBJCBUKSefzk/f0FVGtoWHEjQKvL9MQ==
X-Received: by 2002:a05:6000:cd1:b0:346:301d:8908 with SMTP id dq17-20020a0560000cd100b00346301d8908mr1683658wrb.49.1713442939023;
        Thu, 18 Apr 2024 05:22:19 -0700 (PDT)
Message-ID: <9b6b97c3-481f-4208-880c-ec704ba2d606@suse.com>
Date: Thu, 18 Apr 2024 14:22:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH V2] x86/MCE: move intel mcheck init code to separate
 file
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240409120645.2948405-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20240409120645.2948405-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2024 14:06, Sergiy Kibrik wrote:
> Separate Intel nonfatal MCE initialization code from generic MCE code, the same
> way it is done for AMD code. This is to be able to later make intel/amd MCE
> code optional in the build.
> 
> Convert to Xen coding style. Clean up unused includes. Remove seemingly
> outdated comment about MCE check period.
> 
> No functional change intended.
> 
> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with ...

> --- /dev/null
> +++ b/xen/arch/x86/cpu/mcheck/intel-nonfatal.c
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Non Fatal Machine Check Exception Reporting
> + * (C) Copyright 2002 Dave Jones. <davej@codemonkey.org.uk>
> + */
> +
> +#include <xen/event.h>
> +
> +#include "mce.h"
> +#include "vmce.h"
> +
> +static struct timer mce_timer;
> +
> +#define MCE_PERIOD MILLISECS(8000)
> +#define MCE_PERIOD_MIN MILLISECS(2000)
> +#define MCE_PERIOD_MAX MILLISECS(16000)
> +
> +static uint64_t period = MCE_PERIOD;
> +static int adjust = 0;
> +static int variable_period = 1;
> +
> +static void cf_check mce_checkregs(void *info)
> +{
> +    mctelem_cookie_t mctc;
> +    struct mca_summary bs;
> +    static uint64_t dumpcount = 0;
> +
> +    mctc = mcheck_mca_logout(MCA_POLLER, this_cpu( poll_bankmask),
> +                             &bs, NULL);
> +
> +    if ( bs.errcnt && mctc != NULL )
> +    {
> +        adjust++;
> +
> +        /* If Dom0 enabled the VIRQ_MCA event, then notify it.

... comment style here corrected, too (which I'll try t to remember to take
care of while committing).

Jan

