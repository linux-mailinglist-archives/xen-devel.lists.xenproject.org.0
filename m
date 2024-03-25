Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE58488AA50
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 17:55:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697827.1088987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ronbV-0006pJ-13; Mon, 25 Mar 2024 16:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697827.1088987; Mon, 25 Mar 2024 16:55:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ronbU-0006nB-U8; Mon, 25 Mar 2024 16:55:20 +0000
Received: by outflank-mailman (input) for mailman id 697827;
 Mon, 25 Mar 2024 16:55:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x9L4=K7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ronbT-0006n3-Jd
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 16:55:19 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75cecf45-eac8-11ee-afe3-a90da7624cb6;
 Mon, 25 Mar 2024 17:55:18 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-51588f70d2dso5335693e87.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 09:55:18 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bo11-20020a170906d04b00b00a46d049ff63sm3189474ejb.21.2024.03.25.09.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Mar 2024 09:55:17 -0700 (PDT)
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
X-Inumbo-ID: 75cecf45-eac8-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711385718; x=1711990518; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6fBFRiMyDcDyxWVMQ7fN5I7w3R3dLwQwYPuiPeHhxtc=;
        b=Gru5fFcPoRqAcr95n1CMmGx0xgOugeCa2okBmAVYV+atj7qmRbHlYIUyqNPjsS+ZRg
         efr3/DDbvjAdaKOLti9uoHGm14BLjzG3edzt05HY099cKK2kL2uQ2ttkniN0uoXJABBz
         i803QY8OBISghvERJDfe7lj0lY6ZlP/MEEYcOWAEl26o9QDoA/KG1VwJTrWPuM9AeQku
         pCS2v6DGU6JyO5N8y3HW0f0T2umvn6CVfHLzHoSJ2l/tdoD9Y2czTlPseb9sP4UQUYPg
         ThX4Pg9o4LAYYkUg/zYFqAy4KHqzY3pacQ6MxBoT5vQPWI+5y5AysbEpNxAj4kj/2X3N
         up2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711385718; x=1711990518;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6fBFRiMyDcDyxWVMQ7fN5I7w3R3dLwQwYPuiPeHhxtc=;
        b=vA9ndwbQUwvgpUj97BvFAQToQsVC/VPG7FY4AMUWLMBY83muVHV1hqPH5vNOh2xXP/
         tIKLT+Q2oCvmuk2iPZ1JcoKadRfzXaGnx+/Vz0w/ziQcqPYrtZ3htHGj3iyIzg+4D4PS
         47reyy09jLZXOHiPRF7KVw/0fPvkp287b51avq+f0bwkeUN89k9vpweZ/ias99tzcJzS
         ceSYIoD62s4/MjzLWUGpBGq8ukocZbNKXdirq68FyW08llKVyeQoWbi0aVDJ/CmIkO4d
         u2j3KyLzd/2vlZ450uZI7I6kwCmDQOMdNoHevpN0+HVJGCO0pB223RAM+AcSHpipUzVt
         tb1w==
X-Forwarded-Encrypted: i=1; AJvYcCVWg9J6mvdzw4Mt1IzmwpSNw6654yx1aiT0dlpKCnIpY/Dn/js1jf4P5jcGQ/QXViLzahvQ3mEd8cJn8USD7LP/xvTw/a/DyxDaJNJVkRw=
X-Gm-Message-State: AOJu0Yy9TMBB1agPAe2ZGbXFYISJ8nod26kq7RDyR/rkjZDqvfODw/UF
	Cfdny1ITlLh4APN4GCEbft4Hb0TL3KLZ2cYKCISzRKQfIOWrdTGJSFzIvLf97Q==
X-Google-Smtp-Source: AGHT+IFw6DaAcwXsBtWswqCQz2XCHoxAp2EtodMnuAYkm5lCg2O99nav4OWnxoAfncBd+1TDa3+NAA==
X-Received: by 2002:a05:6512:3511:b0:515:9eaf:5c21 with SMTP id h17-20020a056512351100b005159eaf5c21mr4144862lfs.36.1711385718141;
        Mon, 25 Mar 2024 09:55:18 -0700 (PDT)
Message-ID: <321321da-ec46-46d4-98ad-bda192bbdf7e@suse.com>
Date: Mon, 25 Mar 2024 17:55:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] xen/x86: Refactor xen/lib/x86 so it can be linked in
 hvmloader
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-4-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240109153834.4192-4-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2024 16:38, Alejandro Vallejo wrote:
> A future patch will use these in hvmloader, which is freestanding, but
> lacks the Xen code. The following changes fix the compilation errors.
> 
> * string.h => Remove memset() usages and bzero through assignments

But hvmloader does have memset(). It's just that it doesn't have string.h.
Yet it doesn't have e.g. stdint.h either.

> * inttypes.h => Use stdint.h (it's what it should've been to begin with)
> * errno.h => Use xen/errno.h instead
> 
> No functional change intended.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
>  xen/lib/x86/cpuid.c   | 12 ++++++------
>  xen/lib/x86/private.h |  8 +++++---
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/lib/x86/cpuid.c b/xen/lib/x86/cpuid.c
> index eb7698dc73..4a138c3a11 100644
> --- a/xen/lib/x86/cpuid.c
> +++ b/xen/lib/x86/cpuid.c
> @@ -5,8 +5,8 @@
>  static void zero_leaves(struct cpuid_leaf *l,
>                          unsigned int first, unsigned int last)
>  {
> -    if ( first <= last )
> -        memset(&l[first], 0, sizeof(*l) * (last - first + 1));
> +    for (l = &l[first]; first <= last; first++, l++ )
> +        *l = (struct cpuid_leaf){};
>  }

Even if memset() was to be replaced here, we already have two instances
of an EMPTY_LEAF #define. Those will want moving to a single header and
hen using here, I expect. Presumably code further down could then use it,
too.

> --- a/xen/lib/x86/private.h
> +++ b/xen/lib/x86/private.h
> @@ -17,12 +17,14 @@
>  
>  #else
>  
> -#include <errno.h>
> -#include <inttypes.h>
> +#include <stdint.h>
>  #include <stdbool.h>
>  #include <stddef.h>
> -#include <string.h>
>  
> +enum {
> +#define XEN_ERRNO(ident, rc) ident = (rc),
> +#include <xen/errno.h>
> +};
>  #include <xen/asm/msr-index.h>
>  #include <xen/asm/x86-vendors.h>

As to the comment at the top - we're in a block of code conditional upon
!Xen here already. Would there be anything wrong with simply recognizing
hvmloader here, too, and then including its util.h in place of string.h?

Jan

