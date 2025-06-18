Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FD6ADF1DB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jun 2025 17:53:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1019304.1396121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRv6e-00073a-1y; Wed, 18 Jun 2025 15:53:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1019304.1396121; Wed, 18 Jun 2025 15:53:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRv6d-00071f-VW; Wed, 18 Jun 2025 15:53:43 +0000
Received: by outflank-mailman (input) for mailman id 1019304;
 Wed, 18 Jun 2025 15:53:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FBi2=ZB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uRv6d-00071Z-6H
 for xen-devel@lists.xenproject.org; Wed, 18 Jun 2025 15:53:43 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67e2f42d-4c5c-11f0-b894-0df219b8e170;
 Wed, 18 Jun 2025 17:53:41 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a365a6804eso5357669f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 18 Jun 2025 08:53:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-748900b1e5csm11193358b3a.123.2025.06.18.08.53.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 08:53:40 -0700 (PDT)
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
X-Inumbo-ID: 67e2f42d-4c5c-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750262021; x=1750866821; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9El53qRuOF1UsqpY70foUoN+jURn+S/fkmijssTagvs=;
        b=VP7QU+BO/XUQfRrTGEqmn4dYHrfE3d6HpJwgOBau+rMMGw5XjjQhp1uySbrQ4uYPAZ
         8TzW29o3Ya0baVvkbrZVH8iq9K97vFROBv0A7NneA2txsgrKboZ9mux5UgjvcYOIHVQs
         L7l8fcidcdFn2zAWLfc5yQkOiR9mn3BS340YiaQO+J7r3fkGoy71LPd6uzALEfdC9gMr
         OW51wUuo4prQapVjdVZB3vfeMiFHtKLH7U5OI4BmFx5lgLiO0/t95RgEGSYMu6YZ3BYD
         c0mgvAg2BTA9NkWFIe2iAPtW30fueIZ0ackwi/KvlSBr0TPPCCIOzyzxQtD0TVI8c6xU
         Y+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750262021; x=1750866821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9El53qRuOF1UsqpY70foUoN+jURn+S/fkmijssTagvs=;
        b=OR+Zpoym/ISwMVwKMVvjhkcrVgizCo5tXM1p/566UoequeViBk8X02ziZ+kmj+cSdT
         n7+JElif0UZrbMeu/7RX3BM+Q5ij3UH1YmoFRxYwTnw7dUErmekkK+89ZW2koZEDPcga
         uqkmMsfJ8rc2NbEyOkkZxYCYmewQLEiQXzuuSHizbeAJQLxMQ5irNKF9kOwsoNrB4biS
         dONWIeOuu7WjB9OP5p8ToHgZs/nj1vuz7VnHKFP71hIjdueQxoqWwKOfzGij5NNZevIj
         83uOriv4K4XcbSyL8on7JleLC8HawG2GcUQspBwgIt30JIqBk/RvsEfvSJqUio+TEWfG
         L9UA==
X-Forwarded-Encrypted: i=1; AJvYcCVK42wJ0QkN7/eH7Jr86jd37++KPWUUgRXMuzbReM7U7avGl/ZPlaL/UgnuJx1ssqiXr21C+kYhLdU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzS6xSHfGc6cWHF8gSKAnX7jPKnxBLbTpLqQl40C+C9/uZTe10a
	8VMZ4iE/LiJKSbxzO1M5I/HR9z5P13sQ+/T/z3wjYwQzNAdIFevfPusFAO40b2jQSw==
X-Gm-Gg: ASbGncs4YZxSI5jxv2ulzJ9vPnrb8IPOEZOeVSUQf3aZAyLwMdaXLsSyBYWz5D1mG9L
	ZiRJ9l+RHuzoNryOr66Ox7gJ6w6gzBiRtebDhAgQR5WASoOP1Ea8w0sDwwZjk9mYWsWgbHBfl4K
	kYSHzdmz5tjrZ++yqxsmA70Cp+d5AHWWri9ZgqR7vrLbZ1JoKGmR8J5r8G7MJwG57YqfKYtqtrc
	ZSRNHsL5pbhwbnXyS58WL2gOuJWLAZPvrCN3XkE1ppbZpI3YR1kYR/Br/FoEId6c/0ebAnCF6yo
	e9/oMNHwA/V3hQmQnF5YAPC5XkgjbUrV7KA3aCg6Fm6xHg/K6Ydv2LFugl4zJaHogpklhm9vxKz
	RINuk4DqD16LYE7SvD9Sxp048Ggysbn2sM3oq9IX3+eodT6Y=
X-Google-Smtp-Source: AGHT+IFvi3CAzAG7OD+/uZVSUXiVgAyC8cOLFLOLf4djqqlW06wbRdOpOXz3Oip9dMsshSkinrDYxA==
X-Received: by 2002:a05:6000:2007:b0:3a5:25e0:1851 with SMTP id ffacd0b85a97d-3a5723660b5mr15194972f8f.7.1750262020698;
        Wed, 18 Jun 2025 08:53:40 -0700 (PDT)
Message-ID: <3bbc8962-eaaa-4ed0-bc21-757bdc6be49d@suse.com>
Date: Wed, 18 Jun 2025 17:53:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/17] xen/riscv: construct the P2M pages pool for
 guests
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1749555949.git.oleksii.kurochko@gmail.com>
 <bdde7c97df218d3ac65f9e719c5777401da80495.1749555949.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <bdde7c97df218d3ac65f9e719c5777401da80495.1749555949.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.06.2025 15:05, Oleksii Kurochko wrote:
> @@ -18,10 +20,20 @@ struct arch_vcpu_io {
>  struct arch_vcpu {
>  };
>  
> +struct paging_domain {
> +    spinlock_t lock;
> +    /* Free P2M pages from the pre-allocated P2M pool */
> +    struct page_list_head p2m_freelist;
> +    /* Number of pages from the pre-allocated P2M pool */
> +    unsigned long p2m_total_pages;
> +};
> +
>  struct arch_domain {
>      struct hvm_domain hvm;
>  
>      struct p2m_domain p2m;
> +
> +    struct paging_domain paging;

With the separate structures, do you have plans to implement e.g. shadow paging?
Or some other paging mode beyond the basic one based on the H extension? If the
structures are to remain separate, may I suggest that you keep things properly
separated (no matter how e.g. Arm may have it) in terms of naming? I.e. no
single "p2m" inside struct paging_domain.

> @@ -105,6 +106,9 @@ int p2m_init(struct domain *d)
>      struct p2m_domain *p2m = p2m_get_hostp2m(d);
>      int rc;
>  
> +    spin_lock_init(&d->arch.paging.lock);
> +    INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);

If you want p2m and paging to be separate, you will want to put these in a new
paging_init().

Jan

