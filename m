Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8683A2399F
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2025 07:45:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879875.1290089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdkmF-0002dt-M4; Fri, 31 Jan 2025 06:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879875.1290089; Fri, 31 Jan 2025 06:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdkmF-0002bW-Hs; Fri, 31 Jan 2025 06:45:19 +0000
Received: by outflank-mailman (input) for mailman id 879875;
 Fri, 31 Jan 2025 06:45:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aogm=UX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdkmE-0002bM-7j
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2025 06:45:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ede311c2-df9e-11ef-99a4-01e77a169b0f;
 Fri, 31 Jan 2025 07:45:16 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4368a293339so18478625e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 22:45:16 -0800 (PST)
Received: from ?IPV6:2003:ca:b741:f10a:3123:f9e9:b484:6874?
 (p200300cab741f10a3123f9e9b4846874.dip0.t-ipconnect.de.
 [2003:ca:b741:f10a:3123:f9e9:b484:6874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438dcc6de7csm82055135e9.32.2025.01.30.22.45.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 22:45:15 -0800 (PST)
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
X-Inumbo-ID: ede311c2-df9e-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738305916; x=1738910716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Rdy9hpk9tsBVrjdRzdbz+KMxN2ReEZwG1nTb+ZTJCM0=;
        b=KDQqq0cYQCNxveibKuw1OZo02SoK5dHq9oPjX6Ro1GaOHQXpTUkQDLYiTY8gvNh4sc
         gmQwiQcAI0Xi5FGnwRS3Xc77xkVBTKWjbspkfiM1jraofbRT1dmFNzdr+2g5kYbEzIvY
         3ucA8zL0gcuy3krrFISkSFFXWp8HmjFQVOzcS0mR8bVpbRaDqpqr9QHyJJmsd4eRYvzX
         OwCXtXd5ibNySofoU/IYKaBLtNgjP2a7eYENpQF2a27VJ6+RKFUhN1+FrVkzBzhTwKsw
         AL/wF2/epIoUIPcsPgV43ZT7gupuV52pRWPJO6/5FmgpHcvLFvqSyBEDxyB4kCGb3l1w
         JhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738305916; x=1738910716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rdy9hpk9tsBVrjdRzdbz+KMxN2ReEZwG1nTb+ZTJCM0=;
        b=doUr4Anmm1gxLB00HBVRauJFGnrlnq62GtAGh1h2z0v9ULRU7k4Jiv68E40uQR3yQH
         4BcQcVObqecH9YVmcpUGo9c8i7S4Pa3H31ErHDiDT8sVzf+8mr1MnLE2bOaRnnISzNhh
         6aV9WfqsAMRKRWyq4tQfD3+3+DUv3DxMuieAskdg4fmSFKOh2opEVrUjhV+L1if4SYuX
         8WqKJQPeOHo1+YNj8QSbVJgdGCLtUKig14loLFi9UldafSJ6UMAy5XnsvqsFjdKHdq+U
         2XRYRQD0Hew2ZA6umOYqj3K1v8STYxug1ytc+MfSb2Mnj/ITWiGXEfqPX6XPv7Dt8HK0
         8j6g==
X-Forwarded-Encrypted: i=1; AJvYcCWsvwvB7mT1GgYvkEVpUYPlIS+qvJspGnxM1HZu/OdmPVTlDT63ospOFocUnnhSlWyQ9yHRZy0o6KM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxxBLHBdPUOlVdww0jXlf8IiHAyH8UJQMq9NbphQt8LYVLD9nAX
	SmmtO8gaKYYbjG6Pc3Qce97B58byQtcY+sL8IjN2pY14eelXUlNlTkRDW7k/TA==
X-Gm-Gg: ASbGncuvGS2JLQ/riUbqjTeE+jqPiqYKl5U807NSelPb3aO0KIrEMSZ763wXOis+0+N
	+ewHzJUVA9AWGpe+zRg/ORLRrchLe2cZcK6zAA4Af3sCx/8FgnFaZfAY8r/yiHvyWN+aIkKzdwl
	p79fwS6pbqxr7VcoKprVAAuqHDCiq2nEXjFlDualnXmb70qvumJAepQiw5EczXxP+D/BY5bXOGB
	z8UIi6QucmyXciJR4x+X6QTKk92VQ0bnC0gTQmXTM0Dvbp9KnP0eBBTnCOuERKHoasrcipmNQ69
	No1CwZBwx/zQ/JH6zvjPi1YTzVQFFlMpVpe8fwBgoZRAfnGo0cg7OwQ52l3Ds+1aWnmsosPzyGR
	9t9sh75ngXq36ihqWJ7B2tYpwLbz0B37B3e0DwfhUoul0fvJhsQ==
X-Google-Smtp-Source: AGHT+IFUZVX2yvUG6xKfolHun82jZacA7WBDYJljKJ19gYWCLFet02/4J580+lHsigSb4UjthVu3jg==
X-Received: by 2002:a05:600c:1e20:b0:438:a1f4:3e9d with SMTP id 5b1f17b1804b1-438dc3c405dmr79314435e9.9.1738305915620;
        Thu, 30 Jan 2025 22:45:15 -0800 (PST)
Message-ID: <b9411efc-27fa-447e-b9b3-061a46286233@suse.com>
Date: Fri, 31 Jan 2025 07:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN RFC PATCH v5 3/5] xen/public: Introduce PV-IOMMU hypercall
 interface
To: Jason Andryuk <jason.andryuk@amd.com>,
 Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <cover.1737470269.git.teddy.astie@vates.tech>
 <29f3e87532573bfc4196083ab0291326adae5100.1737470269.git.teddy.astie@vates.tech>
 <1ea6447c-3451-4aca-8a17-2848acd0868f@amd.com>
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
In-Reply-To: <1ea6447c-3451-4aca-8a17-2848acd0868f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.01.2025 21:17, Jason Andryuk wrote:
> On 2025-01-21 11:13, Teddy Astie wrote:
>> +/**
>> + * IOMMU_alloc_nested
>> + * Create a nested IOMMU context (needs IOMMUCAP_nested).
>> + *
>> + * This context uses a platform-specific page table from domain address space
>> + * specified in pgtable_gfn and use it for nested translations.
>> + *
>> + * Explicit flushes needs to be submited with IOMMU_flush_nested on
>> + * modification of the nested pagetable to ensure coherency between IOTLB and
>> + * nested page table.
>> + *
>> + * This context can be destroyed using IOMMU_free_context.
>> + * This context cannot be modified using map_pages, unmap_pages.
>> + */
>> +struct pv_iommu_alloc_nested {
>> +    /* OUT: allocated IOMMU context number */
>> +    uint16_t ctx_no;
>> +
>> +    /* IN: guest frame number of the nested page table */
>> +    uint64_aligned_t pgtable_gfn;
>> +
>> +    /* IN: nested mode flags */
>> +    uint64_aligned_t nested_flags;
>> +};
>> +typedef struct pv_iommu_alloc_nested pv_iommu_alloc_nested_t;
>> +DEFINE_XEN_GUEST_HANDLE(pv_iommu_alloc_nested_t);
> 
> Is this command intended to be used for GVA -> GPA translation?  Would you need some way to associate with another iommu context for GPA -> HPA translation?
> 
> Maybe more broadly, what are your goals for enabling PV-IOMMU?  The examples on your blog post cover a domain restrict device access to specific portions of the the GPA space.  Are you also interested in GVA -> GPA?  Does VFIO required GVA -> GPA?
> 
> And, sorry to bike shed, but ctx_no reads like "Context No" to me.  I think ctxid/ctx_id might be clearer.  Others probably have their own opinions :)

Or, if it absolutely is to derive from "number", ctx_nr. That said, I
agree "id" is a better term to use here.

Jan

