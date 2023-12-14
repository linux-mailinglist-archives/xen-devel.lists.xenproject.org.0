Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F14BA813279
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 15:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654601.1021683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDmLt-0008He-FV; Thu, 14 Dec 2023 14:06:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654601.1021683; Thu, 14 Dec 2023 14:06:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDmLt-0008FW-Cx; Thu, 14 Dec 2023 14:06:13 +0000
Received: by outflank-mailman (input) for mailman id 654601;
 Thu, 14 Dec 2023 14:06:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDmLr-0008FQ-KE
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 14:06:11 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee46542d-9a89-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 15:06:09 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a1e2ded3d9fso985170766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 06:06:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 tk3-20020a170907c28300b00a1cd54ec021sm9421102ejc.57.2023.12.14.06.06.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 06:06:08 -0800 (PST)
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
X-Inumbo-ID: ee46542d-9a89-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702562769; x=1703167569; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d5dZFMvCG+Hj4tJQMSIUYNtGUmi6rZaCDkq+11u8WP0=;
        b=bH9AXXNfpfoJNKnljyBcf0+RDa/Q4c0IYsnAOfsKmisoPhndd3AUu0uJdYxPAntadm
         KjiakWK2nivgvlvUF9hoPbgxIa7kiPKlDoeuVSuMR/BOCYDMM4GEOmPYON4rLSGiD7ia
         Ljjk7By5lWScVHcvZVKe713yqlbQdvFuyzckxVjD3oBEG3Sebz1a1jRVBD/xgxIUEnXd
         qXKLC2G/4eNkL66zuqwDCU55r69x6ojE0NECgyWj+c9HFYi8cHQGNjMFVehRDeYwETGX
         2Ix0J8aG7GHsFKBCf29t6PmbSKQSJ4hKpifSek/T92uNryLemLviAnGD8qx7CQv0ft7Y
         EREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702562769; x=1703167569;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d5dZFMvCG+Hj4tJQMSIUYNtGUmi6rZaCDkq+11u8WP0=;
        b=odFz3qfAomQ92vAT5tey2JeuEMKKeDJiGbw78JhiW8xO0rS59dyxLuVW9v2EHRYu8R
         i8iAPqOaabEJiFwaJcT+255wxR0K4F9miaf4fZeb9lIFCJFDJjaljxDm7GuwzuDWRutB
         b1tw9gGeMAYufD0kKDMe4627FBKAQlQldN8kHiv2FwFgUGjEUypvNH1CuljUdJ/+KUWE
         uV3joQkb52q0APt/eEV8C1xk4mEQDRxLGUUmHkzxrvmx17kH6bEahT8pppQ7tkYTjkJz
         5HTqXDRv1NDlhUAGnlUoo+AY0Fzv0nflMe096MIv9/8xzLijG5yv0Nv4nHTnNfKcxA8F
         P7uA==
X-Gm-Message-State: AOJu0Yx0PnWDiFn81X+c2Bh8OMLBom5TUrkDTeLKR3Dk4Jp43fqFC56t
	87Trx1V0+gXlY+ycMi4hKnyd
X-Google-Smtp-Source: AGHT+IHrgEXafmAfHDoGzW1QO9+mgCdwqRG68Wh8hGS3+4pMhZsTTqHruZW3oWjfb8RmOCXt2cj4gA==
X-Received: by 2002:a17:906:66c5:b0:a19:a19b:78ad with SMTP id k5-20020a17090666c500b00a19a19b78admr4734753ejp.112.1702562769010;
        Thu, 14 Dec 2023 06:06:09 -0800 (PST)
Message-ID: <e08e2f49-5ed5-40ec-8db4-e2dd597c8046@suse.com>
Date: Thu, 14 Dec 2023 15:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/39] xen/riscv: introduce asm/guest_access.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <7dda759b846003fcb453f1118cefbfd2eeb804d7.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <7dda759b846003fcb453f1118cefbfd2eeb804d7.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/guest_access.h
> @@ -0,0 +1,29 @@
> +#ifndef __ASM_RISCV_GUEST_ACCESS_H__
> +#define __ASM_RISCV_GUEST_ACCESS_H__
> +
> +#include <xen/types.h>
> +
> +unsigned long raw_copy_to_guest(void *to, const void *from, unsigned len);
> +unsigned long raw_copy_from_guest(void *to, const void *from, unsigned len);

For the full build to work, you will need to implement these somewhere.
From the titles of further patches I can't guess where that would be.
Note how PPC has decided to have these be inline dummies for the time
being. It also looks as if you would also need raw_clear_guest()?

> +#define __raw_copy_to_guest raw_copy_to_guest
> +#define __raw_copy_from_guest raw_copy_from_guest
> +
> +#define guest_handle_okay(hnd, nr) (1)
> +#define guest_handle_subrange_okay(hnd, first, last) (1)

Arm has a comment next to these (actually two, I mean the latter), which
I think would be sensible to also have here.

> +struct domain;
> +unsigned long copy_to_guest_phys(struct domain *d,
> +                                 paddr_t gpa,
> +                                 void *buf,
> +                                 unsigned int len);

You don't need this just yet, do you?

Jan

