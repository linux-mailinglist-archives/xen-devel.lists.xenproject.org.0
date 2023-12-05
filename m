Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4AD9805371
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 12:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647685.1011203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATvr-0002cc-SL; Tue, 05 Dec 2023 11:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647685.1011203; Tue, 05 Dec 2023 11:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rATvr-0002Zl-OT; Tue, 05 Dec 2023 11:49:43 +0000
Received: by outflank-mailman (input) for mailman id 647685;
 Tue, 05 Dec 2023 11:49:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rATvp-0002YJ-U9
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 11:49:41 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fa946df-9364-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 12:49:40 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40c09dfd82aso30386455e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 03:49:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bg36-20020a05600c3ca400b003fe1fe56202sm18724702wmb.33.2023.12.05.03.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 03:49:39 -0800 (PST)
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
X-Inumbo-ID: 5fa946df-9364-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701776980; x=1702381780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jas3LCYBNcXt0QeS+ug1YQuk2rbSkKdbnfMaiDcy0I8=;
        b=J1Z12VB/ALu3QyItHrY4TBLd/IAgTjUPIRUJgzjd2OChe4egIiiAR37+e6F4Q2Zy1+
         ypW3nH4iRlz2zV9XfO2KhzO9hB/wlE00V4Y8I27Fxg+GqXH8bGT4FMeyMgDNS+3LrOP6
         J/2cItXpTxpZ1KL9uD8gJu/Pg4Vu3fGxXJZCNekUkRaAPiwfB4cbLgcoCoZePOllB8rA
         O/c/HXNJelM9QY0JSCpEQobboafal7iut9114oq5P5wvOSOu0ChaO+duRph/kdYs7o+S
         ylpg9IEHiUDpFkTEAbFCXVDWczoxgMKPkMDVCcPdM6GNlgu+0FsSbmoCdnnJfenvZNxx
         hgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701776980; x=1702381780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jas3LCYBNcXt0QeS+ug1YQuk2rbSkKdbnfMaiDcy0I8=;
        b=Iv5Qgv2sBE60j1AFQWVgGDA3rcVhwzMC6Rq2BNEmLkD4AT4U2Jza7ozG/crUHluXlH
         bqwXqF5/UceORLrTCcCRpD9kzSLzGs+yoxvaknM2mu3utDDF7O74+ixhZO10FpwZHQCj
         yu1ot85+Wa7Q9TTkylon3i6tXBpzRTQRjiQ2Oa2xsWzhQ2nrvekMYHfy2PY6YkrnKbtZ
         nqWAPIBl//8XwF96AVn8F+4D1Sv6BpQpqL7yBEvHnjDNcB0Xjtdj49mirSVUx4fdR29+
         d4zkwoP82puGfdd+pGj16mB8M5y/eLKxaShrDWCRjw9BmrfAotwYWCyjp2uRtvgUWsX/
         ji3g==
X-Gm-Message-State: AOJu0Yww/ND/JRKTCqhWKK6PLGSRfCTVOvc/BExy/diilAoWI1kYpGwB
	oJ1wQUqm/d0UmokhUF7g/ddm
X-Google-Smtp-Source: AGHT+IEXmm2HI+MUvf5UXGZN6/uCoO1PKL/IZictJSyjuDkichV2Lx3AVwoS0VJhK9vMi5oGYCgn9A==
X-Received: by 2002:a05:600c:11c8:b0:40b:5e59:ccc1 with SMTP id b8-20020a05600c11c800b0040b5e59ccc1mr466108wmi.162.1701776980232;
        Tue, 05 Dec 2023 03:49:40 -0800 (PST)
Message-ID: <00de64fd-5669-424d-9b32-2342b5936f1a@suse.com>
Date: Tue, 5 Dec 2023 12:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] x86/livepatch: introduce a basic live patch test
 to gitlab CI
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20231128100352.35430-1-roger.pau@citrix.com>
 <20231128100352.35430-5-roger.pau@citrix.com>
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
In-Reply-To: <20231128100352.35430-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.11.2023 11:03, Roger Pau Monne wrote:
> Introduce a basic livepatch test using the interface to run self modifying
> tests.  The introduced test relies on changing a function from returning false
> to returning true.
> 
> To simplify the burden of keeping a patch that can be provided to
> livepatch-build-tools, introduce two new files: one containing the unpatched
> test functions, and another one that contains the patched forms of such
> functions.  Note that only the former is linked into the Xen image, the latter
> is built but the object file is not consumed afterwards.  Do this to assert
> that the file containing the patched functions continues to build.
> 
> Since livepatch testing will ensure that the functions are not patched previous
> the applying the livepatch, allow the livepatch related tests to fail without
> tainting the hypervisor.
> 
> Note the livepatch tests are not run as part of the self modifying checks
> executed during boot, as they would obviously fail.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - New interface & test.
> ---
>  tools/misc/xen-livepatch.c          | 29 +++++++++++++++++++++++++++++
>  xen/arch/x86/Makefile               |  2 ++
>  xen/arch/x86/include/asm/test-smc.h |  2 ++
>  xen/arch/x86/setup.c                |  2 +-
>  xen/arch/x86/test-smc-lp-alt.c      | 23 +++++++++++++++++++++++
>  xen/arch/x86/test-smc-lp.c          | 23 +++++++++++++++++++++++
>  xen/arch/x86/test-smc.c             | 11 ++++++++++-
>  xen/include/public/sysctl.h         |  6 +++++-
>  8 files changed, 95 insertions(+), 3 deletions(-)
>  create mode 100644 xen/arch/x86/test-smc-lp-alt.c
>  create mode 100644 xen/arch/x86/test-smc-lp.c

Can these (and perhaps also the one file introduced earlier in the series)
perhaps become xen/arch/x86/test/smc*.c?

> --- /dev/null
> +++ b/xen/arch/x86/test-smc-lp-alt.c
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#include <asm/test-smc.h>
> +
> +/*
> + * Interesting case because `return false` can be encoded as an xor
> + * instruction, which is shorter than `return true` which is a mov instruction,
> + * and also shorter than a jmp instruction.
> + */

I'm a little wary of this comment: "mov $1, %al" is two bytes only, just like
"xor %eax, %eax" is.

> +bool cf_check test_lp_insn_replacement(void)

What's the purpose of the cf_check here?

Jan

