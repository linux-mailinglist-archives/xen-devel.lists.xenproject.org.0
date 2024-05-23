Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7ABE8CCCEC
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:20:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728083.1132843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA2jw-0005Za-P8; Thu, 23 May 2024 07:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728083.1132843; Thu, 23 May 2024 07:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA2jw-0005Xa-MI; Thu, 23 May 2024 07:19:52 +0000
Received: by outflank-mailman (input) for mailman id 728083;
 Thu, 23 May 2024 07:19:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sA2jv-0005XU-Gm
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:19:51 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d704cb42-18d4-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 09:19:49 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a59cc765c29so177962266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 00:19:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5df00490cfsm731905266b.159.2024.05.23.00.19.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 00:19:48 -0700 (PDT)
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
X-Inumbo-ID: d704cb42-18d4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716448788; x=1717053588; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EkA1IoKHeNHQ8JzFiCMQbdV8RlpbiTWROT1aS2MrU7c=;
        b=H78r9szOyyhsW37ezA/jONtXn8fTqwAp9YWvnr+YII91sFbq27L7CDE7KKkDn89/K8
         EfJKwTb9+YaItnj10gUgJOYv3iDXYGkOWPitkkANLQstjSOR0OkDmSLQwSuI9xaowt/N
         BlIV49awg6UVe8YDK3T+92b7fNdZ0/Rgdzd44lkdgiQ4z9zOCLOaabXrEdMjsPrXpY9i
         druuC0EEeZeJZP1GaTcHU4vCoDQoDla6lfvoF5QJEAd0csnDfrFh8SzKU1YqNa7rjpR2
         oFES5izSOiEnPYpBKG8m0kglt87MuB5BKIcf7Icy/1/76LyWSMO/O/b3KX8BkAFG8swJ
         185A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716448788; x=1717053588;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkA1IoKHeNHQ8JzFiCMQbdV8RlpbiTWROT1aS2MrU7c=;
        b=U31zWMEWEN3V8CexEkFvQBEP471TpCK+qTpIHVt9PQlbhDJNxu6bYsTLhr9aKXgj86
         D8wuz7cRqszAwy8qEwZ4D88fWfU71p4Kwwd0kHqKna7qsCAHs2RdswLCXQe55FBwke4d
         idX8suOGwTR7bmGsJe4TAf8P+AVxQSwv8wsn6L8Qgo2ex7YYpOF4L04gXxf4SyjnWDWj
         fja+cejc3Mc/hIJ4SHbjGiAg7HkFpjloejgC8hTViUUG9hN4FVVHufqYmRP1p0giYkfw
         yt/EiIVUPX17fq9yM4zXLbIFKYDvdXt7GVjeeNFARPPZcb1mOJVMLCSV5EfFPkoppFhx
         Kq8A==
X-Forwarded-Encrypted: i=1; AJvYcCWs2cenD7n6Ue+sIpt/TPtJLwdx+Wmmeh2ovIHm9hJIJnU6NFq7U2vNlveOpAcjxt7URH3K9v+Bn1TBUDMo/w8HXLJmbsreeauI8GGedVA=
X-Gm-Message-State: AOJu0YxjVru7K6wRKBIMtgubnffUdYufMpqr+kL8p5c+c+Rai7OomHCu
	TClqpJGDMmAF0oeDgcCLj87MiQqbvBLKGyzvMBfdep4ILVLeH81C8/MGM8LRNA==
X-Google-Smtp-Source: AGHT+IGOVbZnFkYKTFkg0eWf1vzGgFjD+A29pp2VSFQraBEwKEwhiXncV7I8e6Jx7JTABjzZajP7HQ==
X-Received: by 2002:a17:906:2b53:b0:a59:a977:a154 with SMTP id a640c23a62f3a-a622818fa42mr246364966b.64.1716448788664;
        Thu, 23 May 2024 00:19:48 -0700 (PDT)
Message-ID: <19073c21-d878-4d8d-95d8-90f567688ed5@suse.com>
Date: Thu, 23 May 2024 09:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: rules for mass adoption
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 michal.orzel@amd.com, bertrand.marquis@arm.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2405221822500.1052252@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405221822500.1052252@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2024 03:26, Stefano Stabellini wrote:
> @@ -725,12 +787,25 @@ maintainers if you want to suggest a change.
>       - The Standard Library function system of <stdlib.h> shall not be used
>       -
>  
> +   * - `Rule 22.1 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_01.c>`_
> +     - Required
> +     - All resources obtained dynamically by means of Standard Library
> +       functions shall be explicitly released
> +     -
> +     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_

The empty sub-bullet-point looks stray here.

> @@ -748,6 +823,31 @@ maintainers if you want to suggest a change.
>         stream has been closed
>       -
>  
> +   * - `Rule 22.7 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_07.c>`_
> +     - Required
> +     - The macro EOF shall only be compared with the unmodified return
> +       value from any Standard Library function capable of returning EOF
> +     - Xen doesn't provide, use, or link against a Standard Library [#xen-stdlib]_

Shouldn't this remark also be replicated ...

> +   * - `Rule 22.8 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_08.c>`_
> +     - Required
> +     - The value of errno shall be set to zero prior to a call to an
> +       errno-setting-function
> +     -
> +
> +   * - `Rule 22.9 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_09.c>`_
> +     - Required
> +     - The value of errno shall be tested against zero after calling an
> +       errno-setting-function
> +     -
> +
> +   * - `Rule 22.10 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_22_10.c>`_
> +     - Required
> +     - The value of errno shall only be tested when the last function to
> +       be called was an errno-setting-function
> +     -

... for all three of these, seeing that errno is something a (standard) library
would provide? Or alternatively should remarks here say that we simply have no
errno?

Jan

