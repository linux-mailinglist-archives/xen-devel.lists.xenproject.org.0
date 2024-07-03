Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5257925F64
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 13:58:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752975.1161224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOycy-0002nT-2Z; Wed, 03 Jul 2024 11:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752975.1161224; Wed, 03 Jul 2024 11:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOycx-0002kf-WC; Wed, 03 Jul 2024 11:58:24 +0000
Received: by outflank-mailman (input) for mailman id 752975;
 Wed, 03 Jul 2024 11:58:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sOycx-0002kV-5e
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 11:58:23 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b9ac926-3933-11ef-bbf9-fd08da9f4363;
 Wed, 03 Jul 2024 13:58:22 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ee7885aa5fso18591271fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 04:58:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c977b2b7c9sm1278106a91.15.2024.07.03.04.58.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 04:58:21 -0700 (PDT)
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
X-Inumbo-ID: 8b9ac926-3933-11ef-bbf9-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720007901; x=1720612701; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=u3fw+/JTUfjvs3NsaRJjuadFFvjc3DRk9BEIaj/5iSE=;
        b=R+Duo2ttNb3qWo23zK3lYJP6gFB98c/gXXsRZlHG6B0IfMomtnLUkIZ9dF40IurQ/I
         bqa3cg2PdUIeczFQocuFlrTjXaN8FWWKyVwyUWPLKsYpwk7jS4/XwIUa8SZNw/qSNvYw
         ++VJZuNWwI2E5vbzBulxBD9IRz88I9vBBexHUqvsBC+6dDH78ToXrOHQtgmscMbPkmIN
         8Is5m3e0UxjceOUQPYDy5wTtu7PvFZf2MqhwE/qyUUNYpnX853m9FUb8ojokP4PkBjxf
         JqC9Cwfr1fWFILyrzh6Hf2a5db7njg2rh0JbS55v3Vvc8MxrMcPN7/ORwLhZyrc71XJZ
         C6+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720007901; x=1720612701;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3fw+/JTUfjvs3NsaRJjuadFFvjc3DRk9BEIaj/5iSE=;
        b=cNkpqBxGkoKmTezo7otQqSnd7h+6vlkBYxFCyeiJ8acXgc/RfrpJrbkQPwXYOodN4C
         I6x9qhnN4hrE77jDGiJ6rk7P3nmUZV09GVaGQ+lw7207IsINn1Rz+Dias28S1cLJ2FC4
         vdKtWEHxR00XEw2giUizJAJUAOp2YSVW6Y4EndA5yM2Kryfg7Ic6KsTawlfUf9Z05kUQ
         BcgOUFO9OHVBXmIma7pQc7YjAQozh8hxz1Jhkoq13GkJTUZ9inQUvgEcHxrJ18dWKrQM
         LimX5rk9szhSqwjcLUBBGUL0TWNEqG/7C8k71OQc4Haysg1mGqev1jvKJlFNOmH2/Lr2
         kzEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsvqpDQc/U+spVDX76qhoRjkYSi5xByaYNXZ0bOTWxGc6z2Q8tYJUsf5mClvnxTTF+ctEBHYn2xJq3NCL7u0V9aH97CyHRE9oidJxzyRo=
X-Gm-Message-State: AOJu0YwScSq7aBRsK0bhiAKDAV4nwygXPxQlPseyrzPZPz7Apk+SM8r0
	3p0fCJxup6UfkMXjNOS5OjkFFOrZwCMT+gFcS8JUaN4Cj6Si9uIRNevtzCCV+Q==
X-Google-Smtp-Source: AGHT+IEYiaasGinwAJKK4F/8VMO2DUDmqZHYM0D31Z5ZDlgLg8NQsohvlz7HGX1sUc4CXKiDSqcaEg==
X-Received: by 2002:a2e:a1c5:0:b0:2ec:4eda:6b55 with SMTP id 38308e7fff4ca-2ee5e6d74c4mr68932401fa.50.1720007901589;
        Wed, 03 Jul 2024 04:58:21 -0700 (PDT)
Message-ID: <7772dc9e-b9e2-4af7-af43-fa5cbe651488@suse.com>
Date: Wed, 3 Jul 2024 13:58:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19 v2] xen/vmap: Document the vmap header
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <f8bcfe757b45ce59e1a1203c2675a4266cc15f20.1720005327.git.alejandro.vallejo@cloud.com>
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
In-Reply-To: <f8bcfe757b45ce59e1a1203c2675a4266cc15f20.1720005327.git.alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.07.2024 13:19, Alejandro Vallejo wrote:
> +/*
> + * Unmaps a range of virtually contiguous memory from one of the vmap regions
> + *
> + * The system remembers internally how wide the mapping is and unmaps it all.

Seeing this is still taken verbatim ...

> + * It also can determine the vmap region type from the `va`.
> + *
> + * @param va Virtual base address of the range to unmap
> + */
>  void vunmap(const void *va);
>  
> +/*
> + * Allocate `size` octets of possibly non-contiguous physical memory and map
> + * them contiguously in the VMAP_DEFAULT vmap region
> + *
> + * @param size Pointer to the base of an array of mfns
> + * @return Pointer to the mapped area on success; NULL otherwise.
> + */
>  void *vmalloc(size_t size);
> +
> +/* Same as vmalloc(), but for the VMAP_XEN vmap region. */
>  void *vmalloc_xen(size_t size);
>  
> +/* Same as vmalloc(), but set the contents to zero before returning */
>  void *vzalloc(size_t size);
> +
> +/*
> + * Unmap and free memory from vmalloc(), vmalloc_xen() or vzalloc()
> + *
> + * The system remembers internally how wide the mapping is and unmaps it all.
> + *
> + * @param va Virtual base address of the range to free and unmap
> + */
>  void vfree(void *va);

... here (just moved to the proper place now), I further wonder: Why just
"mapping" and "unmap". The function is also (one might even say primarily)
about freeing. IOW perhaps "how wide the allocation is and unmaps/frees it
all"?

Happy to adjust while committing, at which point:
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

