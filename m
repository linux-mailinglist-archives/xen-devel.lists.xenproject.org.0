Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7976A806A50
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 10:06:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649004.1013217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnrK-00026r-1u; Wed, 06 Dec 2023 09:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649004.1013217; Wed, 06 Dec 2023 09:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnrJ-00023w-Us; Wed, 06 Dec 2023 09:06:21 +0000
Received: by outflank-mailman (input) for mailman id 649004;
 Wed, 06 Dec 2023 09:06:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X1yw=HR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAnrI-00022d-Ls
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 09:06:20 +0000
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [2a00:1450:4864:20::343])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b756aea7-9416-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 10:06:18 +0100 (CET)
Received: by mail-wm1-x343.google.com with SMTP id
 5b1f17b1804b1-40859dee28cso65271705e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Dec 2023 01:06:18 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g16-20020a05600c4ed000b0040b47c53610sm21255737wmq.14.2023.12.06.01.06.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 01:06:17 -0800 (PST)
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
X-Inumbo-ID: b756aea7-9416-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701853578; x=1702458378; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wvwtw6phcPiVErnUuHnmMujra8D4GYFtZrxNc53AQhg=;
        b=UmEQdP5JQ58MOp2pcnykGYRLHJKGe67SSCeVAykSY8gvF9mtynJcN/UxO/VTrgC9OY
         uT5thYVoN+/JzlGQL38LrN/cQLV7D3W4UgzSxh2+2eVH9mk0MYEz3fN5i/5mB8NcLDTq
         B2fxn5L2ijCoSvDrav8LiH0gJaEU9jUS+poOLCQvt73xX9z7si8Cxvp/mNeg254HdoWM
         qsZ/y+CrCW3yppM/SOQXI6QfKOhGTJfHvtq3MaX7x5pn6xBn6HTO8m/w8edijzzFFllv
         v1Vt+A/h67qsXN2mFXqggzLV2We2aIP+7A64GkWZytdHI++givtidux6cIk/LKzsC0j9
         oiGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701853578; x=1702458378;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wvwtw6phcPiVErnUuHnmMujra8D4GYFtZrxNc53AQhg=;
        b=IPDdmmR8YLKCmn9qQSBnRSUnnUC7jJAk+MEz38nF5sVoHXs1VorZ4BXkxB36GhgHBq
         NmBg1qX4AGp6076M5EzX0/4mAAOyCjvF3/iQIS+mtdQJE/NUsSSVTlw5ldCXRAGmnyvU
         9N2iZpS3fiVn/pQJQArDPnPkRYR6Zao12eIupuszoYT5jKb5/9IbnMQj1wvN6C/3WNeB
         fsnKS001rgJYNwkUo67oUnSoH6BONn+k1FVDUcirX9VJjpA6m8A9JiDqOvRMORdaJzmH
         vqsORxg6dT+SU7Rr44pXpGCPZxVgPSfrCPCQjNwwfRmni02YqmEdDyTP8bh101MI4BHe
         yX9A==
X-Gm-Message-State: AOJu0YxUnnIgOeX/cfkDDurmIjwmfa7xUsf3EyvQaWLGa9wb30FeIslz
	zYztdlDhUaTjQ8WD8PLQHgpt
X-Google-Smtp-Source: AGHT+IHwKxYfJ5tcxmug+SYUNqgTCaLloMURciQh6gSc0v+KZNAtCUiuoBWkYHiW0fMa5kMOWSLnrg==
X-Received: by 2002:a05:600c:b97:b0:40b:5e1b:54ae with SMTP id fl23-20020a05600c0b9700b0040b5e1b54aemr335441wmb.58.1701853577693;
        Wed, 06 Dec 2023 01:06:17 -0800 (PST)
Message-ID: <ccdbe84d-24ca-41f0-bc1f-fb9499c73880@suse.com>
Date: Wed, 6 Dec 2023 10:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra/rules.rst: add more rules
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrannd.marquis@arm.com, roger.pau@citrix.com,
 roberto.bagnara@bugseng.com, federico.serafini@bugseng.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2312051859440.110490@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2312051859440.110490@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.12.2023 04:02, Stefano Stabellini wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -462,11 +462,23 @@ maintainers if you want to suggest a change.
>  
>         while(0) and while(1) and alike are allowed.
>  
> +   * - `Rule 16.3 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_03.c>`_
> +     - Required
> +     - An unconditional break statement shall terminate every
> +       switch-clause
> +     - In addition to break, also other flow control statements such as
> +       continue, return, goto are allowed.
> +
>     * - `Rule 16.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_16_07.c>`_
>       - Required
>       - A switch-expression shall not have essentially Boolean type
>       -
>  
> +   * - `Rule 17.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_01.c>`_
> +     - Required
> +     - The features of <stdarg.h> shall not be used
> +     -

Did we really accept this without any constraint (warranting mentioning
here)?

> @@ -478,12 +490,24 @@ maintainers if you want to suggest a change.
>         have an explicit return statement with an expression
>       -
>  
> +   * - `Rule 17.5 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_05.c>`_
> +     - Advisory
> +     - The function argument corresponding to a parameter declared to
> +       have an array type shall have an appropriate number of elements
> +     -
> +
>     * - `Rule 17.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_06.c>`_
>       - Mandatory
>       - The declaration of an array parameter shall not contain the
>         static keyword between the [ ]
>       -
>  
> +   * - `Rule 17.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_07.c>`_
> +     - Required
> +     - The value returned by a function having non-void return type
> +       shall be used
> +     -

Same question here.

If the other additions were separate, I probably would have ack-ed them
right away.

Jan

