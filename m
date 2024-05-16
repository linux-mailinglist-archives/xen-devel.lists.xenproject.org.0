Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDFF8C749B
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:26:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.723081.1127619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YJP-0002o8-ML; Thu, 16 May 2024 10:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 723081.1127619; Thu, 16 May 2024 10:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7YJP-0002lJ-JG; Thu, 16 May 2024 10:26:11 +0000
Received: by outflank-mailman (input) for mailman id 723081;
 Thu, 16 May 2024 10:26:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LYhW=MT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7YJO-0002lD-FK
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:26:10 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b58c674a-136e-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 12:26:08 +0200 (CEST)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2e428242a38so6996551fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2024 03:26:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17892450sm969297966b.63.2024.05.16.03.26.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 May 2024 03:26:07 -0700 (PDT)
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
X-Inumbo-ID: b58c674a-136e-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715855168; x=1716459968; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jstn+m1oTnzwXt5NJbmy4qbQU0ne++k/74yPZCYCL9c=;
        b=JnP8nuuaFa/oKFXtMCdQBOxd8XV5D0GhwhFd04VRzxuEeVkte6VXKqW4JCjr7QF41G
         5ASuO4VhLOH3PPPaw6CSL3QAmb/j4ZhBygWA0urxIbD2ymIABxhLVLNwjpbJ8KSOzE7n
         aPINQHvAB4KWWQrGJXoA0+K4h+kUn05pazXtbML5g9fIAARYRt7gj1qpVlRgRUPpuiAH
         U30HCsM/325DEUqZF8hM5mkl20f+J+D5921zh0Ju0nC+3qX11Rtgs8FZYD7YQP/BxvAq
         TsK/6sf3TSzU0Ug0FSYHiNItcQFwvSf2Znb/N19U6frLq6+OxALmgnwnr63DdV9pCyT0
         22AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715855168; x=1716459968;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jstn+m1oTnzwXt5NJbmy4qbQU0ne++k/74yPZCYCL9c=;
        b=smEvZKPvC/Dgr3vgR/LpF5LrX1XavoWR4xT2PsLTRmKmX7k7s9jzTouM2pAgtdYFwM
         ThTEpGGx9kdtKEtQIJJXqTX3/HL6nbI2ipQwefNC2ajYq23Yk3W5Cu6wKWE94es3x9UT
         T8IPrLnz+iEiKeW3g2bHR4YdHDAnJWkT8EaKLNeoGFYH1Umci+oX1990RJT0gxHRnWON
         mSNn1VTlfCjeWtJHpPQ8nJiUOU2zQqUykEd2v4LSvQzeKsY7A5c7oom0d4nUn4Tp9dkK
         z7kufytChN3nOxNdg0Pii5y6t+fMrIWdyuUByrjrULik4d4x/nANFP/B2WPYH8xmV6/f
         2eDg==
X-Forwarded-Encrypted: i=1; AJvYcCU7vQutOpjhuzzvNHshtgq3mapfkLZ/6uUTAFLi8q7Zdsegu7XaYDOjZinYuKmWyhmKQ3fR2VPmVkts9Vz1yjt3m4gXymSZYjt1I8umkww=
X-Gm-Message-State: AOJu0YyWKSRUoNiXuEhKZXeBuKC0OW9tgPQMpest2joUFztcasbI0hXu
	/QyCaNw7ulKdvP8IaDVguCOQlm5GbGnAiUEojMN4of2dyrF0vBNbgCxuVgVVuQ==
X-Google-Smtp-Source: AGHT+IFoL++S7bKYiDkYjwQv/Hd00Yn+rjxzX+1IVi0OvG1j4hzkVM1vVyTJG2h/lnkSSPgLmJ3CYQ==
X-Received: by 2002:a05:651c:2114:b0:2e1:cb0f:4e1e with SMTP id 38308e7fff4ca-2e51fc34061mr170353091fa.2.1715855168059;
        Thu, 16 May 2024 03:26:08 -0700 (PDT)
Message-ID: <72e5802d-db4f-4d9b-a2ea-fc767ef2dd44@suse.com>
Date: Thu, 16 May 2024 12:26:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 03/15] x86/p2m: guard altp2m routines
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Tamas K Lengyel <tamas@tklengyel.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <d4c537b1bcac4b301b16336ea3407834fc3076b1.1715761386.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <d4c537b1bcac4b301b16336ea3407834fc3076b1.1715761386.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.05.2024 11:03, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/mm/p2m-basic.c
> +++ b/xen/arch/x86/mm/p2m-basic.c
> @@ -126,13 +126,15 @@ int p2m_init(struct domain *d)
>          return rc;
>      }
>  
> -    rc = p2m_init_altp2m(d);
> -    if ( rc )
> +    if ( hvm_altp2m_supported() )
>      {
> -        p2m_teardown_hostp2m(d);
> -        p2m_teardown_nestedp2m(d);
> +        rc = p2m_init_altp2m(d);
> +        if ( rc )
> +        {
> +            p2m_teardown_hostp2m(d);
> +            p2m_teardown_nestedp2m(d);
> +        }

With less code churn and less indentation:

    rc = hvm_altp2m_supported() ? p2m_init_altp2m(d) : 0;
    if ( rc )
    {
        p2m_teardown_hostp2m(d);
        p2m_teardown_nestedp2m(d);
    }

>      }
> -
>      return rc;
>  }

Please don't remove the blank line ahead of the main return of a function.

> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -986,7 +986,7 @@ out:
>      if ( is_epte_present(&old_entry) )
>          ept_free_entry(p2m, &old_entry, target);
>  
> -    if ( entry_written && p2m_is_hostp2m(p2m) )
> +    if ( entry_written && p2m_is_hostp2m(p2m) && hvm_altp2m_supported())

I agree with Stefano's ordering comment here, btw.

Jan

