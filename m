Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5658B3064
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 08:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712431.1113125 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0F3D-00080F-0p; Fri, 26 Apr 2024 06:27:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712431.1113125; Fri, 26 Apr 2024 06:27:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0F3C-0007xQ-Tg; Fri, 26 Apr 2024 06:27:14 +0000
Received: by outflank-mailman (input) for mailman id 712431;
 Fri, 26 Apr 2024 06:27:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lj3M=L7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s0F3B-0007xK-EC
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 06:27:13 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 037d5e31-0396-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 08:27:11 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a51addddbd4so208628466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 23:27:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 mm7-20020a170906cc4700b00a5872f75cfdsm4518652ejb.49.2024.04.25.23.27.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Apr 2024 23:27:10 -0700 (PDT)
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
X-Inumbo-ID: 037d5e31-0396-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714112830; x=1714717630; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ywi8MELPEGIX51lNr+jTDS4kvTLaXs+s8ii9pR9MfE=;
        b=KE8tEFmWUwsAKQhE7i6Bdn+UeOHb9M9lyI0h9cnHxcrQ8rEVc0wvDK+vj4Yvq+ModC
         dVTgi1rwimSfRwF8x8KbYRGPKsCaMOL7InUiT+rmpvEFYI5S16pWkmJslizrDs4RM9y8
         L1WaEIdmmTm8bNIAnoQT3OZ91+9c13KL0xDXzpNXU9XBXTwL7fGpb9S4VXImMXmD6aiB
         CkElcWudK4efo6UROlwrof0l2nuNWxlMiKMSIoLbfZM4xfmKIw1d9VojGTPj/h47E6Nu
         TNlMdyQ13luncf/Y8Je111qNT6dvshq4i4q6mtH8LEesnPQbgJgymuXIPcNdaU6cfn7F
         2BbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714112830; x=1714717630;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ywi8MELPEGIX51lNr+jTDS4kvTLaXs+s8ii9pR9MfE=;
        b=uCXug8kTITLLQ2Rj7Qs4R/gxqxJ/SrlA1inOleyYU3eR8HZf254dZXq5GJeSLn+5pS
         ycT6OTbfsvBTkQ6APJSCpLEfU3fJTsfm6kJORjBkL7igt3j9IZ54M66VIyuDzuUkihmo
         vZEqZhWvNThroTmCLEdupGyH4uwkr0PgnobwtZ4t0ZHG3rNSu7bRjLNTzKbZO1lBGiQ3
         v3YXOWNWESvDf/pHduMFuX/DOayCfoGBXJjPB2ZFmhLlSz9Llk5HlRaV690kPaZR1cig
         YVbEpIzrmkVDgPYd6E7hzIYjYlLU0Gxbx3u5v6c7kUNfgK6dt/c/WeID5PyaT2W8RujT
         fZYw==
X-Forwarded-Encrypted: i=1; AJvYcCVq7zf8dYJ8nYZI0yKZwG3NxSIchEIVMUshmtQe7LQeJw/dHY0uZ+fbzkI9wm66WwD4v1GDJgzPnMte2dqbd5JQKp49Ryfw324GxrNzmLY=
X-Gm-Message-State: AOJu0YwWyx0wQ+Y0sQuUEd5fZu2OYCsjM6uLfPVrbeu9hflp03z/Y8Gm
	hbBEdMlWbNTw6N4zgnfgVLhUaYZ1ZfRiO3kC1HR1wBQeSuvRA85nGVh/63Ei2w==
X-Google-Smtp-Source: AGHT+IHuOQBzQufM8IVK2sIi1Qd5/50wLdxZ3yTNK80GqbmSmQezxw1XN9G9ybrsdDlQmsF9TdAiMw==
X-Received: by 2002:a17:906:c04f:b0:a55:6b76:eedc with SMTP id bm15-20020a170906c04f00b00a556b76eedcmr1215903ejb.14.1714112830569;
        Thu, 25 Apr 2024 23:27:10 -0700 (PDT)
Message-ID: <d620ef7a-661a-4706-8a05-1724e28e2d4f@suse.com>
Date: Fri, 26 Apr 2024 08:27:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra: add R21.6 R21.9 R21.10 R21.14 R21.15
 R21.16
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2404251629570.3940@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2404251629570.3940@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.2024 01:31, Stefano Stabellini wrote:
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -652,12 +652,72 @@ maintainers if you want to suggest a change.
>         declared
>       - See comment for Rule 21.1
>  
> +   * - `Rule 21.6 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_06.c>`_
> +     - Required
> +     - The Standard Library input/output routines shall not be used
> +     - Xen doesn't provide, use, or link against any Standard Library.
> +       Xen implements itself a few functions with names that match the
> +       corresponding function names of the Standard Library for
> +       developers' convenience. These functions are part of the Xen code
> +       and subject to analysis.
> +
> +   * - `Rule 21.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_09.c>`_
> +     - Required
> +     - The library functions bsearch and qsort of <stdlib.h> shall not be used
> +     - Xen doesn't provide, use, or link against any Standard Library.
> +       Xen implements itself a few functions with names that match the
> +       corresponding function names of the Standard Library for
> +       developers' convenience. These functions are part of the Xen code
> +       and subject to analysis.
> +
> +   * - `Rule 21.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_10.c>`_
> +     - Required
> +     - The Standard Library time and date routines shall not be used
> +     - Xen doesn't provide, use, or link against any Standard Library.
> +       Xen implements itself a few functions with names that match the
> +       corresponding function names of the Standard Library for
> +       developers' convenience. These functions are part of the Xen code
> +       and subject to analysis.
> +
>     * - `Rule 21.13 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_13.c>`_
>       - Mandatory
>       - Any value passed to a function in <ctype.h> shall be representable as an
>         unsigned char or be the value EOF
>       -

Up to here, did you consider adding a short reference to some common blob
(footnote or alike), rather than repeating the same text verbatim several
times?

> +   * - `Rule 21.14 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_14.c>`_
> +     - Required
> +     - The Standard Library function memcmp shall not be used to compare
> +       null terminated strings
> +     - Xen doesn't provide, use, or link against any Standard Library.
> +       Xen implements itself a few functions with names that match the
> +       corresponding function names of the Standard Library for
> +       developers' convenience. These functions are part of the Xen code
> +       and subject to analysis.
> +
> +   * - `Rule 21.15 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_15.c>`_
> +     - Required
> +     - The pointer arguments to the Standard Library functions memcpy,
> +       memmove and memcmp shall be pointers to qualified or unqualified
> +       versions of compatible types
> +     - Xen doesn't provide, use, or link against any Standard Library.
> +       Xen implements itself a few functions with names that match the
> +       corresponding function names of the Standard Library for
> +       developers' convenience. These functions are part of the Xen code
> +       and subject to analysis.
> +
> +   * - `Rule 21.16 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_21_16.c>`_
> +     - Required
> +     - The pointer arguments to the Standard Library function memcmp
> +       shall point to either a pointer type, an essentially signed type,
> +       an essentially unsigned type, an essentially Boolean type or an
> +       essentially enum type
> +     - void* arguments are allowed. Xen doesn't provide, use, or link
> +       against any Standard Library.  Xen implements itself a few
> +       functions with names that match the corresponding function names
> +       of the Standard Library for developers' convenience. These
> +       functions are part of the Xen code and subject to analysis.

For all three of these I'm not convinced the remark is appropriate. These
talk about specific properties of the functions, which aren't related to
risks associated with particular (and hence potentially varying) library
implementations.

Jan

