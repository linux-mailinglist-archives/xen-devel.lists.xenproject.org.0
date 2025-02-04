Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7082CA27007
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 12:14:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881242.1291369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfGrx-0005fh-3G; Tue, 04 Feb 2025 11:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881242.1291369; Tue, 04 Feb 2025 11:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfGrw-0005dA-W5; Tue, 04 Feb 2025 11:13:28 +0000
Received: by outflank-mailman (input) for mailman id 881242;
 Tue, 04 Feb 2025 11:13:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfGrv-0005cH-GN
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 11:13:27 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0df8814c-e2e9-11ef-a0e7-8be0dac302b0;
 Tue, 04 Feb 2025 12:13:26 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5da12292b67so9014165a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 03:13:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a326e6sm899153866b.157.2025.02.04.03.13.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 03:13:25 -0800 (PST)
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
X-Inumbo-ID: 0df8814c-e2e9-11ef-a0e7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738667606; x=1739272406; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PlKE7lYT5NMWicWP8lDNhwLigJPpQkyickNFKIL8Il0=;
        b=Fco1HYR3GdCKMeHtewQl0Iq37GVsTCMHG9/Fpclf5I8jBTR0SEEg2H6/SUThWBWThT
         a0MoKS5mjSOXRUK5G7d42mfvL18FKsPn0ZRZ5NMU9zdbpy2FaOclS4WQhKttCCNmnduA
         rIOBOiP8+eherFKNmfu5MBufXzjs1lhhnuW2lQA63vAZdiecJ3IX8a+/RTeblweJWX/g
         umi03xLrj/TsystYDFkLT6O427tSiQ9wiVOc3V6yYpfZOML4+rsDxOpjb8mwgokdT7Bc
         ALrHibNhntYJHbr0dTJ/NsnS4ge5ETuAuyighNfZp3HNbHnvotuiEH8WHauY3Eao0sn1
         8YzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738667606; x=1739272406;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlKE7lYT5NMWicWP8lDNhwLigJPpQkyickNFKIL8Il0=;
        b=hb4laVjDJhFjVWCznjV5vzJ8OpwoVgHm6n9rXZqtcl/NleyBcFpYK1eADbdulrioPJ
         Ow+7VsyPfq+iFdMCyaqvfzGOjn6wg17O7Utv8K/f/c2QfVtRuEQycmf5TlNm8Vcuvq7s
         2N21Yz7oo0bIjK/q7xDeaicXGYtfIqih9dCEtINQbMhDSfoQka4T0YFQw7JjwMKPRA8L
         11dksSEKmJXw+gnSMmmGM2Xk+E2e8PoCE6MYXE2EKV1gMRgryzVr+Xqh+TKFjcACXPXx
         5iEyf3TSy3ZPelhzktzNW25BA6ym4PEZtBvtVVMiTdiEq6P/RRqy+w7iTG4C7qrE1Kd3
         XXFA==
X-Forwarded-Encrypted: i=1; AJvYcCUt0YbzJDKsgTKSdxtgt2mt0OOosFu2kaj9PCCy4PlrUdgEH0vNuohl9RSYWzHBPIY3gixoFoIELms=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxZOoIv36gomfFIzav1LWmJNIXB7S88IOMciugHNFf3IZMngUjz
	jc1pEWijchxyChBRjCJP/D7K+l2YtBvln+bfpLT3enVqYcFlZvNKR2VSYvg55g0FHVkgF/1MsLc
	=
X-Gm-Gg: ASbGncvvsaLbxt853vV6ij23fdqxQUn3bLukS+06TBSoJRla8NxS/HIwNzVt2+dEPf6
	wBs/0lk2UXnLHQqFjUmSewXNGvbthKoT3eL7s2jP5EWbRUNcZAoJXLJHDY3IAP67D6tyP45zIyU
	L9O1f1mOTxVWvf1dISIE6wULlynIa+BeTj5eJxsYkd/fv/DFl6hoo4tI9/oLkO++93hezRXVWRG
	BJOhXnHAtNfReu311W4o5A1TOlsIPfeBk9kL/pjaOmrEWgn/FXCvvT4uC35FV2nvCUXSo4BKyy9
	MF3C98/Z8uLfLyTxXENhEIiepjikvEobqPOA1XMx/WTmKOSLKa9dOj9hJ+xlA3bKbWott355dP1
	2
X-Google-Smtp-Source: AGHT+IFIh3jwp+GZ/fNInRObUr3TbGJMoxJaxueSHiCdUxZcL7d1GoJz78zIw0+QAuqEw26AsIpU0g==
X-Received: by 2002:a05:6402:4309:b0:5d0:fb56:3f with SMTP id 4fb4d7f45d1cf-5dc5efbf5d8mr68647389a12.12.1738667605658;
        Tue, 04 Feb 2025 03:13:25 -0800 (PST)
Message-ID: <108bc55e-cde6-4a2e-ada2-571c4d72bfa5@suse.com>
Date: Tue, 4 Feb 2025 12:13:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/15] x86/hyperlaunch: add capabilities to boot domain
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-16-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-16-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> Introduce the ability to assign capabilities to a domain via its definition in
> device tree. The first capability enabled to select is the control domain
> capability.

Hmm, and not at the same time another one to select "hardware domain"?

> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -158,6 +158,18 @@ static int __init process_domain_node(
>              bd->max_vcpus = val;
>              printk("  max vcpus: %d\n", bd->max_vcpus);
>          }
> +        else if ( strncmp(prop_name, "capabilities", name_len) == 0 )
> +        {
> +            if ( fdt_prop_as_u32(prop, &bd->capabilities) != 0 )
> +            {
> +                printk("  failed processing domain id for domain %s\n", name);

"domain id"?

Jan

