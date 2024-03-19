Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3249B87FAFB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 10:41:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695278.1084906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmVxJ-00051n-AB; Tue, 19 Mar 2024 09:40:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695278.1084906; Tue, 19 Mar 2024 09:40:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmVxJ-0004zC-70; Tue, 19 Mar 2024 09:40:25 +0000
Received: by outflank-mailman (input) for mailman id 695278;
 Tue, 19 Mar 2024 09:40:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmVxG-0004z1-T8
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 09:40:22 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3ba9d78-e5d4-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 10:40:21 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a46ce2bd562so204083666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 02:40:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 qk26-20020a170906d9da00b00a45bb14b1a5sm5830400ejb.89.2024.03.19.02.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 02:40:20 -0700 (PDT)
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
X-Inumbo-ID: b3ba9d78-e5d4-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710841221; x=1711446021; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTPvaVegFJ2LuhO5jfpTtSRORxkQzXCjaDyWlMAScYY=;
        b=CIC6WdZqN29TuGy5ZolnrAu+QXjcK4uswh5VBqS9ff1pX7LwUgp2MMryJR+SlBBL9k
         E6NCUofaU1r/bGGumh+vuZWdetMHqFib9r4WU/i9Gc7YPgy4M3OXgUtCtNgyk5zp/4I8
         NwkUxQYcKI8E08W2+x/E/+/pAnr3NdxVWATxFfcIzBMRPtkyqRF6POsaryktbv+JoHPR
         /bFxLUB/n69EhQ6v9q7zbYH40vqgHUiHTBGcTpnGymLIfEpxzd4Yq8WXoQttPhhjfNwF
         Lx7C78NpWPJjFpqobXhwktolVpdZhvdFknS73DM7QeidPlAfk3zy9cIhxmlAfrgrUHPz
         JCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710841221; x=1711446021;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QTPvaVegFJ2LuhO5jfpTtSRORxkQzXCjaDyWlMAScYY=;
        b=cooGxKOm5IuzUA4NejsJ5hwtR0Hv57rc2M7KS0ASlrtC2VNoI2/p6oJ8o2SumaWwBN
         djGTIltrU77vcEm1Lclwa/55uEHwxfsGLZqmP+8w7/JWBmu0K7dAPVR7kFlN32uE2rs6
         SP840McnGt9ylXFc5mI3g/y8d/PFD0PDRd9p25t+7V+zxB+Pmh2KPxJLgiHQA9seIU8p
         8gamJ4cMIq+RxQFGyQlq8BDtcUxbdm3V/+be6T4PQyqKC72OmjzlNRmBu3gcvQWi6bwK
         EBSfKjiUNNRCSM0aAP1hkp5EvbAWEsp0P4shr4aEl01DSaJrUyWUBwmVyZI3WJocaddn
         J7Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXAtQ7CxGAM1VVFPWggURxVsqWIxdyDAhFtlgz3GgWCh7xcME2Fdh7abSAE+ACAltR5SdfOekd3JV+y8cVgi+Vv4EnCVzw1JXQvNnE5kLs=
X-Gm-Message-State: AOJu0Yzyd1g9VoKoy6C/vvSaAyTerAQK9cEJEDNvd7kNj+JMtOyjnmF8
	g0JQ5xpR1vzcc+u5kXlRnAyEBObWWvYJmoPO0LY2/s8xUNSReKRJNqGVQ3nm6Q==
X-Google-Smtp-Source: AGHT+IEWkNp6WE0KNHxxEcxbnlX3dWrP8+8ot59l0YyW17wIhN/6uYA95+BlRPJ/gMyHSV4qGySd+w==
X-Received: by 2002:a17:906:43c2:b0:a44:51c1:733c with SMTP id j2-20020a17090643c200b00a4451c1733cmr1430489ejn.39.1710841220912;
        Tue, 19 Mar 2024 02:40:20 -0700 (PDT)
Message-ID: <c982e201-881e-4c7f-ac02-0c61f124045f@suse.com>
Date: Tue, 19 Mar 2024 10:40:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/nospec: Include <xen/stdbool.h>
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240319085042.28470-1-michal.orzel@amd.com>
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
In-Reply-To: <20240319085042.28470-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2024 09:50, Michal Orzel wrote:
> After introduction of lock_evaluate_nospec() using bool type, building
> Xen on Arm with UBSAN enabled fails:
> 
> In file included from ./include/xen/spinlock.h:4,
>                  from common/ubsan/ubsan.c:13:
> ./include/xen/nospec.h:79:22: error: unknown type name ‘bool’
>    79 | static always_inline bool lock_evaluate_nospec(bool condition)
> 
> There is no issue on x86, as xen/stdbool.h is included somewhere along
> the asm/nospec.h path, which is not the case for other architectures.
> 
> Fixes: 7ef0084418e1 ("x86/spinlock: introduce support for blocking speculation into critical regions")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Jan Beulich <jbeulich@suse.com>



