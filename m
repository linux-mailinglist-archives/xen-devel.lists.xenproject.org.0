Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B93D8AE220
	for <lists+xen-devel@lfdr.de>; Tue, 23 Apr 2024 12:27:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.710509.1109750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzDMJ-0006Io-0u; Tue, 23 Apr 2024 10:26:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 710509.1109750; Tue, 23 Apr 2024 10:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzDMI-0006GU-UJ; Tue, 23 Apr 2024 10:26:42 +0000
Received: by outflank-mailman (input) for mailman id 710509;
 Tue, 23 Apr 2024 10:26:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ck89=L4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzDMH-0006GO-Im
 for xen-devel@lists.xenproject.org; Tue, 23 Apr 2024 10:26:41 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8a54f5f-015b-11ef-909a-e314d9c70b13;
 Tue, 23 Apr 2024 12:26:39 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-346b146199eso4199716f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 23 Apr 2024 03:26:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fc9-20020a05600c524900b0041ac5f19213sm1180024wmb.8.2024.04.23.03.26.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Apr 2024 03:26:39 -0700 (PDT)
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
X-Inumbo-ID: f8a54f5f-015b-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713867999; x=1714472799; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H9Mtxd9FVgfbZIuPwuRHqHiLaZFNBEvLKXvX4KAcLLI=;
        b=NDvVkN2Pt6c6rr+yhfkPAHmARgkx9yrB8p7KH4DCbcToZlPTM9qpxAUZG0j2ARsvYY
         zDNVYwKkM75TN5MTMXt7BlrYo1/FFwJGX/6lekyAmBl5dYvbHf3RlsRSJHYiPSOPDZ5c
         Ne+bVXuXqOyAnBm+tCumSWY7QHIGPn5+WYSULIe+ZeiicMt3qa6Nc8x12nxDuFu/E858
         awRjqUglJ4XRD5AxA2ZmkPr+Y6P0czgNjsAPro8BsJPSZjtkon8hyUwlMA4PIXekoCg0
         ByCvJue84IH2nU5oP9UAJZ/PoCSRBFDuHsSFFpzCGMBvBvZ9eWVHV01HVbnipHIaCEOK
         +TSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713867999; x=1714472799;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9Mtxd9FVgfbZIuPwuRHqHiLaZFNBEvLKXvX4KAcLLI=;
        b=axeyK27V7sn8jCxVG4NE5NeuIK62yZ3LAp4UbX665G8waXYdjfbJo+YwM/hOJdQ9Wf
         rAo+dklal/DMIjCYYVf4wJOcSjhnrwO0X4lfwhyHnY4drGDwW7x5gSgvqPSJIte968ZI
         If/sKBzud/Ko+vt/Bl2Jrrag/SfkZ4+v6xEYzsRlhNTIEwAkBmdd+1M8dqPJtmSlWPy7
         CGK9tJIbxxMcCEcG1DFLvQ8qFsxK1bXSvuPklOBJDTX2rx1Lb014FDGr9On4KCVLCIub
         f7Y1H/HlOhzLb1vOCZe4VHXTKRc3CYawrOYM6V+iWuKdF+xn+3Csd34zyJuEk9aV6eJj
         hosQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrW3WOYl08C+D4kzZPI+wWOtP9qJ5cwXIIeCmyGOcByXgohMonO3cWlOht+RMQlLNXaNDKzHutkT58tCM7INQz0jqafAFFMCz2Cy0barM=
X-Gm-Message-State: AOJu0YxmA7sOFfMBkc5BlWPK/wob0RQC7P781VC+bj1FI6zJrYEd8uJO
	0CZkWxAr1ZTg/Ci/aEMQ84IAN8v5tGB65fc2Z9bYTuLjZ3Doy/HMBm3RCwj71g==
X-Google-Smtp-Source: AGHT+IF/eirXELJPJ03sIC+malVEkO8gMqq2vpPjP5f/gK7F0jgopuRX1jsYd5BkU7oYi4QqO9pDXw==
X-Received: by 2002:a5d:4d4b:0:b0:34a:9b75:cb95 with SMTP id a11-20020a5d4d4b000000b0034a9b75cb95mr5982633wru.37.1713867999245;
        Tue, 23 Apr 2024 03:26:39 -0700 (PDT)
Message-ID: <17c022d9-245b-449f-96c5-7a29ba782880@suse.com>
Date: Tue, 23 Apr 2024 12:26:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair: add deviations for MISRA C:2012
 Rule 16.4
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <4981c3fb0992898a121881333485004f3609eaf7.1713866519.git.federico.serafini@bugseng.com>
Content-Language: en-US
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
In-Reply-To: <4981c3fb0992898a121881333485004f3609eaf7.1713866519.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 12:02, Federico Serafini wrote:
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -302,6 +302,19 @@ Deviations related to MISRA C:2012 Rules:
>         leave such files as is.
>       - Tagged as `deliberate` for ECLAIR.
>  
> +   * - R16.4
> +     - Switch statements having a controlling expression of enum type
> +       deliberately do not have a default case: gcc -Wall enables -Wswitch
> +       which warns (and breaks the build as we use -Werror) if one of the enum
> +       labels is missing from the switch.
> +     - Tagged as `deliberate` for ECLAIR.
> +
> +   * - R16.4
> +     - A switch statement with a single switch clause and no default label may
> +       be used in place of an equivalent if statement if it is considered to
> +       improve readability."

First a terminology related comment here: I'm afraid "switch clause" can be
interpreted multiple ways, when I think we want to leave no room for
interpretation here. It's not even clear to me whether

    switch ( x )
    {
    case 1: case 2: case 3: case 4:
        ...
        break;
    }

would be covered by the deviation, or whether the multiple case labels
wouldn't already be too much.

And then it is not clear to me why

    switch ( x )
    {
    case 1:
        ...
        break;
    default:
        ...
        break;
    }

shouldn't also be covered, as potentially a readability improvement /
future change simplification over

    if ( x == 1 )
    {
        ...
    }
    else
    {
        ...
    }

Jan

