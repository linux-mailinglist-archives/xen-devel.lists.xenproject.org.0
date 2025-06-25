Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A53AE8735
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jun 2025 16:55:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1025184.1400835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uURXR-0004rG-4b; Wed, 25 Jun 2025 14:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1025184.1400835; Wed, 25 Jun 2025 14:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uURXR-0004ox-1o; Wed, 25 Jun 2025 14:55:49 +0000
Received: by outflank-mailman (input) for mailman id 1025184;
 Wed, 25 Jun 2025 14:55:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=QoV+=ZI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uURXQ-0004or-0c
 for xen-devel@lists.xenproject.org; Wed, 25 Jun 2025 14:55:48 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 795d7e14-51d4-11f0-b894-0df219b8e170;
 Wed, 25 Jun 2025 16:55:46 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a52874d593so6410337f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 25 Jun 2025 07:55:46 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-315f54417f7sm2081092a91.45.2025.06.25.07.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Jun 2025 07:55:44 -0700 (PDT)
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
X-Inumbo-ID: 795d7e14-51d4-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750863345; x=1751468145; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4DEBsRDON+pSe3JqtFBV4gG9aGg5hlLrM3lQwQJNfNw=;
        b=VJfHcVIhmMAkd7DU3vUITXI0zafxP7tzeeW74pf73+oZPCjljzGwJhGNGnA86fXVMn
         Mb5yhQNDcL8QgaO+biaMioWN963ncy6+XxYuiy6PsHinBcuL7VSni2nvh5efm1NZ+LY/
         WeU+yQvdICwh/EfdXZt3lpts/OGSWBSMnger5i4Fz/wRskp3cgRdfG4kfypE9De5OTLk
         2P3Don/8LywgcugXeyj1tzr+44t2guzLkHLe14dqbcT7RycTR8BZuzhawAYQfYEMCCD4
         jhGaU+xCvTmPv25ADuOmCreU7DqDATMRgPzdeXQZUnZLY0Tc6fY/8+ygr5f51aFM9jwd
         87Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750863345; x=1751468145;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4DEBsRDON+pSe3JqtFBV4gG9aGg5hlLrM3lQwQJNfNw=;
        b=PdCWN4QSi7YAba2Gzv85D4E9wsF566vYj/YhKwZUNToG+WPRNenUooDdQIPwYj2yV2
         6LL4/brAFNZczjhMl9wXUXX7XvBjwenbC7vfLBID0S0MK4wwu4qTJ+2sRR+yDMp3oLzD
         CJZnmBjQLukyfwVB+SlrGuIo7JdTdx42K7Dx3gjFa3/45i8ckhvD90zdKO5zKs7VauN7
         PLhrW4BNELTydSUo3Ol4+P6fFNoc3r9ka0en0K3HGx59rHmCzRAweoIfBqvzO4dt03zI
         SdhB5zyCTBRbchuowHxR3Tw6yyJTGnwihg6xLVKTD7IUTmGbGnwXoTqi38NqUOyvTR19
         720w==
X-Forwarded-Encrypted: i=1; AJvYcCVNisb5yqpiJHPisFDV9DVFmRw3wqxEdPX97seXAQqRSmyUJ6ygclDNHPvK5YFYjUrRVbXaG7mWJhk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZXGhEjPt11FcWNTOVfGYCnxz5ApErrk4gEdOTrXrV/b89+7z8
	vaT3DclT+naTfH7aqs9EbTN5GfdyCl6vnGGlKVXIhdTv0W9b7XZ0M0Xc+A/5cpDChA==
X-Gm-Gg: ASbGncviltuM0n05wvULawdUeK8Ss9oXLFSt4fOKI2BA7Fgiijy/7Mi7srcpTlAGHdc
	yGFVvwxCvgvpc3v1PWGLEjdfsAk0aBjqJKB4aKiQCKpMmbwvn/3GjIfnNl8fG8z7Fo8basml9XQ
	7V/qsjEvf1DYNzdn7ImljU0ToGD0T5N84Gq+FXyf8r7rospUjAo7h8O9rLRF6NcmZki4GHfvppw
	edPAeCKTDcfSKtsYihm+6kMEuFBGXg0TvlrEN2ga9+bn7MOodk/fKWyGh79H8MpSkrFDHdekiI3
	oottc1oHdZ8KKaHUvrxF1GP8qvVFY1H1gvwfwBNGqeCi5oO2yGl+3UCyWWwukCd0iAecV52Hysb
	suPUGPHZkbuHpuAoR41TAtD7rQApvIoY0v+7VH22X5P0duj0=
X-Google-Smtp-Source: AGHT+IHJfn4yoTaF86xXFVjN1+uRRejVOD5+T6aINQOWRVUlLVO+PaE2dTBGu8hc/TqMdYKcfR7atg==
X-Received: by 2002:a05:6000:2c13:b0:3a4:e68e:d33c with SMTP id ffacd0b85a97d-3a6ed64ba0emr2863608f8f.47.1750863345277;
        Wed, 25 Jun 2025 07:55:45 -0700 (PDT)
Message-ID: <a2ab4287-1f78-48ba-8832-ef83a727383e@suse.com>
Date: Wed, 25 Jun 2025 16:55:34 +0200
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
 <3bbc8962-eaaa-4ed0-bc21-757bdc6be49d@suse.com>
 <3db6770c-005f-4123-bb85-0445b4d2d437@gmail.com>
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
In-Reply-To: <3db6770c-005f-4123-bb85-0445b4d2d437@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.06.2025 16:48, Oleksii Kurochko wrote:
> 
> On 6/18/25 5:53 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> @@ -18,10 +20,20 @@ struct arch_vcpu_io {
>>>   struct arch_vcpu {
>>>   };
>>>   
>>> +struct paging_domain {
>>> +    spinlock_t lock;
>>> +    /* Free P2M pages from the pre-allocated P2M pool */
>>> +    struct page_list_head p2m_freelist;
>>> +    /* Number of pages from the pre-allocated P2M pool */
>>> +    unsigned long p2m_total_pages;
>>> +};
>>> +
>>>   struct arch_domain {
>>>       struct hvm_domain hvm;
>>>   
>>>       struct p2m_domain p2m;
>>> +
>>> +    struct paging_domain paging;
>> With the separate structures, do you have plans to implement e.g. shadow paging?
>> Or some other paging mode beyond the basic one based on the H extension?
> 
> No, there is no such plans.
> 
>>   If the
>> structures are to remain separate, may I suggest that you keep things properly
>> separated (no matter how e.g. Arm may have it) in terms of naming? I.e. no
>> single "p2m" inside struct paging_domain.
> 
> Arm doesn't implement shadow paging too (AFAIK) and probably this approach was
> copied from x86, and then to RISC-V.
> I thought that a reason for that was just to have two separate entities: one which
> covers page tables and which covers the full available guest memory.
> And if the only idea of that was to have shadow paging then I don't how it should
> be done better. As p2m code is based on Arm's, perhaps, it makes sense to have
> this stuff separated, so easier porting will be.
> 
>>> @@ -105,6 +106,9 @@ int p2m_init(struct domain *d)
>>>       struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>>       int rc;
>>>   
>>> +    spin_lock_init(&d->arch.paging.lock);
>>> +    INIT_PAGE_LIST_HEAD(&d->arch.paging.p2m_freelist);
>> If you want p2m and paging to be separate, you will want to put these in a new
>> paging_init().
> 
> I am not really understand what is wrong to have it here, but likely it is because
> I don't really get an initial purpose of having p2m and paging separately.
> It seems like p2m and paging are connected between each other, so it is fine
> to init them together.

If you want to retain the separation, imo you want to follow what x86 has:
paging_domain_init() calling p2m_init(). And d->arch.paging.* would then
be initialized in paging_domain_init(), like x86 has it.

Jan

