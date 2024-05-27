Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 544758D0035
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 14:41:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730713.1135874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZe8-0002I5-Dn; Mon, 27 May 2024 12:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730713.1135874; Mon, 27 May 2024 12:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBZe8-0002FL-9w; Mon, 27 May 2024 12:40:12 +0000
Received: by outflank-mailman (input) for mailman id 730713;
 Mon, 27 May 2024 12:40:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBZe7-0002FF-Bc
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 12:40:11 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4161ac84-1c26-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 14:40:10 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-579cd80450fso1670558a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 05:40:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c93a828sm489279866b.83.2024.05.27.05.40.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 05:40:09 -0700 (PDT)
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
X-Inumbo-ID: 4161ac84-1c26-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716813610; x=1717418410; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FxKlfdChlSYZ4PmUC9Mn34y5/B81hF6zVELLg0A85aM=;
        b=X0vw6FRzhwmIT1rShSUhmBwBOzz0AVeoD/7KI3O4OxWj2BxeWLVvMHo+p4msTWWaZ4
         eInqVgNl7SedqoYdrNAXivm9kx2QaIY+tmOG4WLGisUVYdx79//EXvLdReBzsGYn8C4f
         ta8Su5YklH+9cG7d2uoaSy32uHYM83YFgeXFzmDhV8ft+/CRNDyTVDpnAyiZDPZS8FK+
         ik25nlSv+r0h60gISowQULqVKKUrMyXuv1O/pEiBBKkxvQFAWOQqYgf7A6Ap0zyoNLp0
         8410HBoH189k2OE9f10mDEEQrSGbtSvwPuYnUz1if++bh1etqNWokyehXY0zdS7K6Jcc
         2HuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813610; x=1717418410;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FxKlfdChlSYZ4PmUC9Mn34y5/B81hF6zVELLg0A85aM=;
        b=WqcesRxxRIw0gk5I8aMmy0ecRp/FE+Zmp/cLyaEG1cSScdYQH+AC9f/aI5wDCHDL7/
         wmWDNDwZgSgWUG9cCXzICV1kr6Ar+KbEjnKySlyDqRknqYvJIyk51BMAiQ2IAflmz5Nv
         1aMPg49cQgnvBxjcxWz1pQ8A5dLI/R1pVX5+8AvO1OfPztCy1NOSa9xcxm7npw7Ek6Gr
         rAiSnDc0jCY/KMiwKpxJ4EdfhR7tqdglTQygdUav73myp60+hqi/Ldy7Z/8ArdBXsTwO
         dHDqOgxfiz+/BbvEvzp21wKjTqtjSCD6GBQYsHIkkPwymbL5lN+BkOx28L6Ere7zD+wc
         A8aA==
X-Forwarded-Encrypted: i=1; AJvYcCU/6Dbt9qag7od8DVOn0lKhaxsP+dWLU+i/wQev8p0ghn/OwOSVGeN3pz5RK1VCapsWMzU0dTIrvlJ0n1jpcKT9ffqzdyRcrUsNAas6+tA=
X-Gm-Message-State: AOJu0YyBDabja5dFYmxSEsTa88dXsTX1O4/A7UGE/Z9vAt1PggGYlT6h
	UphEpX+0aKTDjuRgDKmGzBQoq1KqWYsGTsZgaBvGNZ9mpDB8Yiu4H6gvf+nTDg==
X-Google-Smtp-Source: AGHT+IFhIqN6IW7XC1qNeMbmSeC7SRlcUtgruu2r+2H9TNLDI9NbP3F+iYHpTigGaJQRX/rLzxV6hA==
X-Received: by 2002:a17:907:7da2:b0:a62:ef39:19c2 with SMTP id a640c23a62f3a-a62ef391e87mr303033766b.4.1716813609825;
        Mon, 27 May 2024 05:40:09 -0700 (PDT)
Message-ID: <ebae5dff-009b-495f-8b07-169956199208@suse.com>
Date: Mon, 27 May 2024 14:40:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/13] x86/bitops: Improve arch_ffs() in the general
 case
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240524200338.1232391-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 22:03, Andrew Cooper wrote:
> The asm in arch_ffs() is safe but inefficient.
> 
> CMOV would be an improvement over a conditional branch, but for 64bit CPUs
> both Intel and AMD have provided enough details about the behaviour for a zero
> input.  It is safe to pre-load the destination register with -1 and drop the
> conditional logic.
> 
> However, it is common to find ffs() in a context where the optimiser knows
> that x in nonzero even if it the value isn't known precisely, and in that case
> it's safe to drop the preload of -1 too.
> 
> There are only a handful of uses of ffs() in the x86 build, and all of them
> improve as a result of this:
> 
>   add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-31 (-31)
>   Function                                     old     new   delta
>   mask_write                                   114     107      -7
>   xmem_pool_alloc                             1063    1039     -24
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one suggestion:

> --- a/xen/arch/x86/include/asm/bitops.h
> +++ b/xen/arch/x86/include/asm/bitops.h
> @@ -432,12 +432,28 @@ static inline int ffsl(unsigned long x)
>  
>  static always_inline unsigned int arch_ffs(unsigned int x)
>  {
> -    int r;
> +    unsigned int r;
> +
> +    if ( __builtin_constant_p(x > 0) && x > 0 )

__builtin_constant_p(x) surely will do. In fact even the other "> 0" could
in principle be left out here.

Jan

