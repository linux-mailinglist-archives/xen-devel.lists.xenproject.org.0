Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B178C81781E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 18:05:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656292.1024392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFH3P-0001g4-QQ; Mon, 18 Dec 2023 17:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656292.1024392; Mon, 18 Dec 2023 17:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFH3P-0001dV-NM; Mon, 18 Dec 2023 17:05:19 +0000
Received: by outflank-mailman (input) for mailman id 656292;
 Mon, 18 Dec 2023 17:05:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h3b+=H5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFH3N-0001dA-Iw
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 17:05:17 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9d0841a9-9dc7-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 18:05:15 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c2db2ee28so42903325e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Dec 2023 09:05:15 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 gw18-20020a05600c851200b004063c9f68f2sm41986948wmb.26.2023.12.18.09.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 09:05:14 -0800 (PST)
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
X-Inumbo-ID: 9d0841a9-9dc7-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702919115; x=1703523915; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UlehL/GdsJp5srffS0ok+Z951DkDiuInnOD9B5bIgqY=;
        b=ExBkNB6Jee4aByI8cpD1b5LQuRjiKlGOwL30fBUM0BK83P9nPy84XtcfUDRjDKZDDr
         QRZzgGrC+cifPE1XsbbtiLNaTNxXvtCqsaoH52lclWFaXwy4zXeSG+eswOJG50sk2/mI
         aZsP1sycIulpNxtXbAWrhaXVuM5Firt6N4Boqr8ThbLu/FOUPPtJc51A4Bo4/OB62OZX
         34qUdpQuYpB5of4aU4FztFJXIVFj7bDb35+pqZYQ5IPYxjruHcL1L5Ag6k5+XG8fZNyR
         M/rdGqRGAe1gJ4zZdl7DmXAwixBR4+5oru70AShIQy2Lbk0nCw9NJfllmfikDPqxOtTj
         YQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702919115; x=1703523915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UlehL/GdsJp5srffS0ok+Z951DkDiuInnOD9B5bIgqY=;
        b=fggqGoORytevtn8NKy22+geMFwXK3DttRW6zMX3SG/+oRYgG0bV9qFmaMPjhkhtmaB
         VCnzYm7Q5omYqOsNxs/5vE1E7kvV46KKvh7YXQZ2D2gshxjE98LPDzpCSV2qb1yAuV9C
         Cg234hHSsOnvG0yr5DoT72knlq8ewzo4DRBuB9AckwP8yGAsguKyhWHX42Pm9CMh3Rpo
         I+7A0uiu7JLiG269FI8wTrb39d5fyVE4igoPGoMhxG33afBwahbJ1ZfdlWVgRQ754aEo
         xnrda05DIcgqs3hivNKxndMwb/cgVeqbBvUGnnjyIbWH72xC651Y+vFCtu4b0uUJbyyN
         0xaQ==
X-Gm-Message-State: AOJu0YxoshtgZOF5eSD20UevkFRkat5OtPbzynZjbqdsWwZGMovCty8B
	AJ8k7I9K0jJ4lru/H+kX73b1
X-Google-Smtp-Source: AGHT+IEe755vqVzr7p1E5zy+jQp7OFRGeDPskqKa0kV12w5oc+rNvfxWsFLuuvFNeU4/Oj+sI9ujrQ==
X-Received: by 2002:a7b:c7d0:0:b0:40c:2c1f:8491 with SMTP id z16-20020a7bc7d0000000b0040c2c1f8491mr9666970wmk.46.1702919115022;
        Mon, 18 Dec 2023 09:05:15 -0800 (PST)
Message-ID: <80fec5de-ba29-4865-9062-490ffcf2fc60@suse.com>
Date: Mon, 18 Dec 2023 18:05:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/5] xen/acpi: Use NULL as a null pointer constant
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, xen-devel@lists.xenproject.org
References: <cover.1702553835.git.nicola.vetrini@bugseng.com>
 <bb10a86a08eb36e9f9c6bda899cdc850afada403.1702553835.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <bb10a86a08eb36e9f9c6bda899cdc850afada403.1702553835.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.12.2023 12:44, Nicola Vetrini wrote:
> --- a/xen/include/acpi/acmacros.h
> +++ b/xen/include/acpi/acmacros.h
> @@ -111,7 +111,7 @@
>  
>  #define ACPI_TO_POINTER(i)              ACPI_ADD_PTR (void,(void *) NULL,(acpi_native_uint) i)
>  #define ACPI_TO_INTEGER(p)              ACPI_PTR_DIFF (p,(void *) NULL)
> -#define ACPI_OFFSET(d,f)                (acpi_size) ACPI_PTR_DIFF (&(((d *)0)->f),(void *) NULL)
> +#define ACPI_OFFSET(d,f)                (acpi_size) ACPI_PTR_DIFF (&(((d *)NULL)->f),(void *) NULL)
>  #define ACPI_PHYSADDR_TO_PTR(i)         ACPI_TO_POINTER(i)
>  #define ACPI_PTR_TO_PHYSADDR(i)         ACPI_TO_INTEGER(i)
>  

This again is an ACPI CA header, which I'm hesitant to see being changed.

Jan

