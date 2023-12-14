Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F8E8133C9
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 16:02:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654614.1021724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDnDS-0005k9-Ao; Thu, 14 Dec 2023 15:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654614.1021724; Thu, 14 Dec 2023 15:01:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDnDS-0005hl-7O; Thu, 14 Dec 2023 15:01:34 +0000
Received: by outflank-mailman (input) for mailman id 654614;
 Thu, 14 Dec 2023 15:01:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xmUX=HZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rDnDR-0005hd-3V
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 15:01:33 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa5bdfc9-9a91-11ee-98e9-6d05b1d4d9a1;
 Thu, 14 Dec 2023 16:01:31 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a1ec87a7631so731176166b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Dec 2023 07:01:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 re14-20020a170907a2ce00b00a1f751d2ba4sm8824048ejc.99.2023.12.14.07.01.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Dec 2023 07:01:30 -0800 (PST)
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
X-Inumbo-ID: aa5bdfc9-9a91-11ee-98e9-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702566091; x=1703170891; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vUuDz8H3VIsylHrOUwSIpaexVCt5dsQJH7N5vrjmoq4=;
        b=A1GidsJjtJZ4Wb5U4NK6NIl4A7lSb39gZXem4o4KLcWd2mlpBSEGcPQ7gWB1+N+hyI
         SoCTVD3e7AR8hEa+bjhKYf6ur9nPPMr9yYlniZpe5qnLsAyFbRq7JaMlm3DtOZNoyOAn
         xPFGQZU9ziMUUABgjaJyZoGDGOlHqnNScEedFClyn1dlAYWVvzp0fjMuhHTSozIMeRPr
         N37/hi56rXIYLMikye+1qBckmSHPm8C3VvCkQAX2dkHxZ+ZB8uJasyeQuWQ4qCJEIDR2
         DD4GW5ovJabATB5VD5R/Bzjx3+oU93IQxfYY7hNLzw0vy9Yt62jja98P9lodBRXBVCge
         b8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702566091; x=1703170891;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vUuDz8H3VIsylHrOUwSIpaexVCt5dsQJH7N5vrjmoq4=;
        b=HKBaH5sANPi+/+NW89HptaP0HuiqQyqrGLUhZALgWt1dME5TZOisyba8OWm0UUbv65
         Vh9Zj34DI3QTXpRQ+pyGfNPn9fBVPxCCIrqXsEkXAANmLn2sH7YwdS/+wdofpLU6KwBP
         sejq1bBzik4QgPii4LV2sTtGVVaE227KxFh3ZXc5hnYgFlAwpNjl+gxDKDmetMARtpju
         8o8/78I/MEHLYjGcZtgGgCTfHqPmh0ay4byf8oNeVETAkaz83WDyqWjli30LtaoLi3jl
         NLhC9JrOxhjrWaz3Wof+IWtnXsIb+XTQbhDXKa6Q3cOjw9co+BXm4lAQC9wjzW4f1gVR
         sXtg==
X-Gm-Message-State: AOJu0YwAEOsAYOnssk7KzeQAtZ1uxG8+hp8ku0d2t+sMG7KUgk8ia2V1
	LHFYE0yf808YHrLXie8+Z3mg
X-Google-Smtp-Source: AGHT+IHu+nIhUhPpaYk7OpvYIrYUb6Xs8epeNFc3r+rjnSdYuzUtyV1/bNKjMElvGpl/13LHH3LE7g==
X-Received: by 2002:a17:906:a3d8:b0:a19:420b:2e26 with SMTP id ca24-20020a170906a3d800b00a19420b2e26mr5588445ejb.76.1702566091108;
        Thu, 14 Dec 2023 07:01:31 -0800 (PST)
Message-ID: <ceaa9575-7844-42cd-afb3-7c3d4a6b864c@suse.com>
Date: Thu, 14 Dec 2023 16:01:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 25/39] xen/riscv: introduce asm/p2m.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <a37e4b7115897a0265907c53667a0ede3763f0ce.1700761381.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a37e4b7115897a0265907c53667a0ede3763f0ce.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> +static inline int guest_physmap_mark_populate_on_demand(struct domain *d, unsigned long gfn,
> +                                                        unsigned int order)
> +{
> +    BUG();
> +    return 1;
> +}

This one I actually don't think needs to be a stub. It can return
-EOPNOTSUPP or -EINVAL right away, and then wouldn't need touching
again afaict.

Jan

