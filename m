Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 590888B09D5
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 14:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711399.1111313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzbtW-000584-09; Wed, 24 Apr 2024 12:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711399.1111313; Wed, 24 Apr 2024 12:38:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzbtV-000567-Ts; Wed, 24 Apr 2024 12:38:37 +0000
Received: by outflank-mailman (input) for mailman id 711399;
 Wed, 24 Apr 2024 12:38:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzbtU-000561-BB
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 12:38:36 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9051f990-0237-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 14:38:34 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-41b21ed19f6so1236245e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 05:38:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y18-20020a056000109200b00343300a4eb8sm16112016wrw.49.2024.04.24.05.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 05:38:33 -0700 (PDT)
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
X-Inumbo-ID: 9051f990-0237-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713962313; x=1714567113; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=46NTZ6aWj+eAuL4Ty5YilUgLAS+nhlxqWyGEeOt+qvw=;
        b=N9SwDSJRCX8mSSucCF39wZ6FWCXRcQ2wWuJcu3GR0AZJ7vKAT3SVIX3GmwdmZXeEwp
         fCFYmhUjd0ruQOai6JmgoRP9RC+bQ7UaB57zWPXQxO1t/y7/tEpBEweEZO3Ef1RShjbC
         KzysWl5b8SYDKPwBJ8b0TA9rBLhWMc6Q1SCIiuwKTR/6izZ+PTw3jUtbSTfQOtcJ4aLh
         nPpT76sjNeBZT/f9+H+lCYXn75rphZ4NOg8s19iLKbdaMV0aB8cmj6NA+Zzd9EHRC1/S
         BWYo+RuJjr479vgKdNCIA/G10Qhmc34J8XTxyaI2LVmMVHLO1+xPIuR/xyFKDCTI2YRe
         VeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713962313; x=1714567113;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=46NTZ6aWj+eAuL4Ty5YilUgLAS+nhlxqWyGEeOt+qvw=;
        b=NCcJAGOV3PsXWFuNqq2U9sQa5DX6rm6fcIalL0hl4FvmXl8Q1TacOEJhgc76zMCSlo
         AsLbWsfvxZpU8r+wY8evZ4R9KLYpkIdX3aWE8HVwCYi+d6ATRjXi2zBILcLORMXIAnDu
         GtB8nRkDsA4UqfkNeFmhO16ClrUUOYvjVi6cT/RTf7IuYOV7dUpj0KtazFqM9P6oSD0u
         Wysqx3kNwYNeExtoj7TAAeqFIyBHLoCu/7Y9D65LujQdZdPd11mGA0vWhQ2n/fnmKJ+s
         WYlWLNU5F2jg6YYgtfaX+1s5T2rC3A47nwPO0/D3bHE4viAp6nABoq3H1CmtoL8OKUgT
         wCKg==
X-Forwarded-Encrypted: i=1; AJvYcCUNAgognRQ4wJbv2lnFkSNTCkjz2Ds50pXdTD7tNe3P9uenHaD0lyUsUF8R1PSLmcmvUko4gbulBzVsZCI9vWqN0pQiKebgM9wm2r5vuY4=
X-Gm-Message-State: AOJu0YxPYmTriSxr50coLhTX4JDNnXJMBco38uYJATrbA8zOqQ1pbjJS
	zRBUPFses7zKPzAXVBjYswsDgJyR48WP4ypcwEse4xysc6fVRNpbu2O4MtLMAw==
X-Google-Smtp-Source: AGHT+IEaQwYop1gqdAHsTgPr1UEpS3t4CGdoSUXRQIQmuTxQYwX+3vf0KhGXdcWoC7r19HtChNjT+Q==
X-Received: by 2002:a05:600c:46cc:b0:418:ed13:302d with SMTP id q12-20020a05600c46cc00b00418ed13302dmr1885619wmo.26.1713962313520;
        Wed, 24 Apr 2024 05:38:33 -0700 (PDT)
Message-ID: <ea0d9bfa-8e1a-41ac-a2a3-ccd59096074e@suse.com>
Date: Wed, 24 Apr 2024 14:38:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviation of MISRA C:2012 Rule
 14.4
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <899a456dc9fcd9ceb55efdfb95e71d0abd997700.1713961291.git.federico.serafini@bugseng.com>
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
In-Reply-To: <899a456dc9fcd9ceb55efdfb95e71d0abd997700.1713961291.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.04.2024 14:23, Federico Serafini wrote:
> Update ECLAIR configuration to take into account the deviations
> agreed during MISRA meetings.
> 
> Amend an existing entry of Rule 14.4 in deviations.rst:
> it is not a project-wide deviation.

Who / how is it not? ->is_dying is a globally visible struct field.

> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -294,7 +294,13 @@ Deviations related to MISRA C:2012 Rules:
>       - The XEN team relies on the fact that the enum is_dying has the
>         constant with assigned value 0 act as false and the other ones as true,
>         therefore have the same behavior of a boolean.
> -     - Project-wide deviation; tagged as `deliberate` for ECLAIR.
> +     - Tagged as `deliberate` for ECLAIR.
> +
> +   * - R14.4
> +     - A controlling expression of 'if' and iteration statements having
> +       integer, character or pointer type has a semantics that is well-known to
> +       all Xen developers.
> +     - Tagged as `deliberate` for ECLAIR.

I'm inclined to suggest that this more generic deviation be inserted ahead
of the more specific ->is_dying one.

Jan

