Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD1DA58EC5
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 10:00:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906244.1313688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYzZ-0000As-I4; Mon, 10 Mar 2025 09:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906244.1313688; Mon, 10 Mar 2025 09:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trYzZ-00008j-Ek; Mon, 10 Mar 2025 09:00:09 +0000
Received: by outflank-mailman (input) for mailman id 906244;
 Mon, 10 Mar 2025 09:00:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sahL=V5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1trYzX-00008d-UH
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 09:00:07 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0ea784b0-fd8e-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 10:00:04 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so8974325e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 02:00:04 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4353003sm172352675e9.28.2025.03.10.02.00.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Mar 2025 02:00:03 -0700 (PDT)
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
X-Inumbo-ID: 0ea784b0-fd8e-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741597204; x=1742202004; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BXSNTNFeK2euoWz9Svo5AHpfvU/76RTFUZF1OpYQlBc=;
        b=G+wMOxUBSrQL2cFSk7pUeMxoStB9uV3JKFnm79v34ZNaVZqSRGCkgaetvNGjZxCG8p
         i4PWpvsCyRPf7reIFNFrqR4DBUGSucLl/qjl9QNIVqEADEIU9P9DEv0ZcQzWKRrVXpdK
         hEx/wX3dEQ9BmWlwuP4BiNT1kyCcgG8IGJ/DgdkB6l+TY8/Aa0B15lFTFGXHcoC/gfnr
         dBI97TyTnb9ZMLLQOk/NP0XztDOrM3KyR8DjnXp/SAvH6jR0IbPHIoF+xo289pvNOsqA
         BGwRfNFaF7dfCXk65okn2YlrEiFA4gi74EtlizMhtf4BIl6Rikpd2rR+zF0JzzjL0Dl/
         ZgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741597204; x=1742202004;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXSNTNFeK2euoWz9Svo5AHpfvU/76RTFUZF1OpYQlBc=;
        b=plxaiduhcpVuk7LFZyAMAHpVH3yBZryhK3Ka18d+xIjrzIlkvj9SIpnBYsYZiNmRx5
         E56+jHZJGyo6IfKoInKlQp9vkr7Yc28DlaXycxfGYFMG8MD7/L6jN1YFS42D1k/7kO+J
         JF+ZgzBB83FcImpzHa8LFbDjYCDbQumYr8+ICtpidJOhx+NGy5F4nTtKg1OtsxNrZuSX
         kgZuAsM+9Ww6pOl/7c61O8i3jmGvA1fKXqWmHudboo4QmsNiCLuIg60Do0XeZ6R24YGN
         jtMK0Mzwt6WtRSlY537TxBP0qfvqJgaQ/btF8i4p6VuERGPYqORIGB1g9qG5cX/QxVu8
         t6Dw==
X-Forwarded-Encrypted: i=1; AJvYcCV+fNTjqUgbM2eVhG18CmcOA9DYc48bRaATv7wVrChe0kllhtNYplU5cjbLrUkWCJgJVGXUqmTEdPE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkxHGZQ/N1TSzkw4y51J2EUL9fSzbjC0nis1A8BydMtAAKARdM
	4M1w938Pz6OrKsXJXSBkyY+du+mGjfiiVj348Xfts9S8e3MN7xYKnvWThb6k0w==
X-Gm-Gg: ASbGncsYJeA+UGgUA02uxK75tdFKvXJzLVWdbMDBiwzRfsWyKxTZ3Qty1wU8CMrsO8q
	ln8oWQWO5rh3H8xwtV+/Brkm/siVi/zqAlMUtRgCk42eCdOm/GRXcMxjXIFPC4hnHQVE13UXv7B
	P+Pn3BkVxd+KFOejHbGP4kkmZpDRKWynS3RLD80tgdfOgx2bYKZeTFr6644uf8kxigEf63WMR88
	97WahV0jxd0QKc7Ilgnz52YuBwDIQxvsfhM/0vXR6peW4r5FFdSjFGzvLv7UG6ScbS7ePNE8dCA
	yB8+PVMa+g3KxHl6ebOEXd6ixTc+/BKo+nhxdIS7/jq14tdN2JFEQcaALjRYdOmUQY2yAdzkpnY
	1oppUkBPFEQPfUjDldJX4pxua+diGJQ==
X-Google-Smtp-Source: AGHT+IErwouMuKw0nanjNH+fkJMvw+68iQ2YNlJYdyjyBxuFZ3EARueAMIBid5q2aW7rClyikVcT4g==
X-Received: by 2002:a05:600c:470c:b0:43c:f050:fed3 with SMTP id 5b1f17b1804b1-43cf051022dmr30860765e9.11.1741597203816;
        Mon, 10 Mar 2025 02:00:03 -0700 (PDT)
Message-ID: <edba2284-4539-471b-a992-0f7ac43eadcc@suse.com>
Date: Mon, 10 Mar 2025 10:00:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/23] xen: introduce hardware domain create flag
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-2-jason.andryuk@amd.com>
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
In-Reply-To: <20250306220343.203047-2-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.03.2025 23:03, Jason Andryuk wrote:
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -699,7 +699,7 @@ struct domain *domain_create(domid_t domid,
>      d->is_privileged = flags & CDF_privileged;
>  
>      /* Sort out our idea of is_hardware_domain(). */
> -    if ( domid == 0 || domid == hardware_domid )
> +    if ( flags & CDF_hardware || domid == hardware_domid )

Nit: If the rhs of the || needs to stay for the time being (does it?),
parentheses please around the & expression.

Jan

