Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4108867E2
	for <lists+xen-devel@lfdr.de>; Fri, 22 Mar 2024 09:04:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696694.1087810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZsp-00084U-01; Fri, 22 Mar 2024 08:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696694.1087810; Fri, 22 Mar 2024 08:04:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rnZso-00082x-SL; Fri, 22 Mar 2024 08:04:10 +0000
Received: by outflank-mailman (input) for mailman id 696694;
 Fri, 22 Mar 2024 08:04:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bHXv=K4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rnZso-00082p-7K
 for xen-devel@lists.xenproject.org; Fri, 22 Mar 2024 08:04:10 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c05206bc-e822-11ee-a1ee-f123f15fe8a2;
 Fri, 22 Mar 2024 09:04:05 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56bdc2a2c96so833915a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Mar 2024 01:04:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 b12-20020a0564021f0c00b00568299df7f0sm753195edb.1.2024.03.22.01.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Mar 2024 01:04:07 -0700 (PDT)
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
X-Inumbo-ID: c05206bc-e822-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711094647; x=1711699447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TusoSPZpWXAYeArHXRaN19wVsXpDy9CbKEn5rcCCNdk=;
        b=VfTLPeln1yobaDGTUHo33tdjkdBnWJCzLaq1smcJZuVhHOq1fbzCLyEQdu0knC9Rqp
         l066Y9xU0OHF9UFr0CIjpt/bXlxLudNGsopcxGjjP0Nq/Y3e/+dxpuvIJX/Df/6sb7dU
         x4ySGKL7PFYzatrwTMlqKOwrTZKrruX6JlVcPYM5t52lmFcpBvL48C0OrHvVzSkENl1e
         hUVdCAg1gEH62OJhs9XUM8UbnPNbXZZntg+lN9rTkVjmbAnPkPIryG+/d38MknaRwIuV
         v9G/kvke0jAozKW1/UF9FOJi3HHzSGTdXyWjtATFV/viLkNwqAB4EO0jKUcGc4jx+57z
         KA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711094647; x=1711699447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TusoSPZpWXAYeArHXRaN19wVsXpDy9CbKEn5rcCCNdk=;
        b=Dgpab0ETdRGuvw6BSOEGRBTOF6XQutLT7kOd53sLUMwjSUQ9uTw+Oj2GswkfIQeg8e
         /JqIXiRM1+aqLCGRS19Z4NasJUMM5dMuPMoMxuASFeOqXsL4PUU7NmJgfEAb2DRWq/I6
         44B1l5EKIEKTSmYKn5HuVrDkQyI//OquyeyBu5r5BcVShTGq9yFeKU1TphrHKUs6nf2j
         JaQZg8PaR33LkakpNxVibwwpoho3Y8oYG33lXw0Uw4hQ+tLbH8f8QBshNL6SaLtXVILB
         kvIvnJZi/Bx2VWi+CpzsQ0iXRhYXf37TPNlMIq/3AV59eePT+NjWvQELKgZq9N1yZCfX
         VkgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnbNPXyMSE/ogg/z+qJ2SNIdID1xskoHvSl4iCpq4heEXhrQbxk8Pm8euEIEVSbPX0jM6G/k30A7d7QTy+2H72fYGSDkW8Zj4I5jaPhx0=
X-Gm-Message-State: AOJu0YzWbefGudU9cqhYcy1rxUr47G2kP66lf2tIIF4sHNMLslghf4og
	dVrNayMlBlD4yyz2YFw/Hy44JuBIs6q2WRB0SbnF2FX87VykjTgqKAiRmfHEN6cY8a/3NpH7dSk
	=
X-Google-Smtp-Source: AGHT+IHX6oz4s6YHw/uR1W7YAP5t8PQKjHCqhyY1tMgbgGPT/tG8wIDHk8zzEPesaTVt+9YXxT2wqQ==
X-Received: by 2002:a50:d641:0:b0:564:5150:76a2 with SMTP id c1-20020a50d641000000b00564515076a2mr1035223edj.4.1711094647449;
        Fri, 22 Mar 2024 01:04:07 -0700 (PDT)
Message-ID: <6e8007b9-e1e9-4f3e-bef9-49a905d68fbf@suse.com>
Date: Fri, 22 Mar 2024 09:04:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/9] xen/ppc: Update setup.h with required definitions
 for bootfdt
Content-Language: en-US
To: Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: tpearson@raptorengineering.com, xen-devel@lists.xenproject.org
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
 <2c14419bd9fbd5307fe4d5b079a9927e4d3ec9fc.1710443965.git.sanastasio@raptorengineering.com>
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
In-Reply-To: <2c14419bd9fbd5307fe4d5b079a9927e4d3ec9fc.1710443965.git.sanastasio@raptorengineering.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.03.2024 23:15, Shawn Anastasio wrote:
> --- a/xen/arch/ppc/include/asm/setup.h
> +++ b/xen/arch/ppc/include/asm/setup.h
> @@ -3,4 +3,116 @@
>  
>  #define max_init_domid (0)
>  
> +#include <public/version.h>
> +#include <asm/p2m.h>
> +#include <xen/device_tree.h>

Besides this not matching our aimed-at ordering (at least asm/ after xen/),
what for do you need asm/p2m.h here in the first place?

Jan

