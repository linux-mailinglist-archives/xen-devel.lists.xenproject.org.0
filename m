Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F99B1DB1F
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 17:58:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073258.1436155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk305-0000Z4-2u; Thu, 07 Aug 2025 15:57:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073258.1436155; Thu, 07 Aug 2025 15:57:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk305-0000XQ-06; Thu, 07 Aug 2025 15:57:53 +0000
Received: by outflank-mailman (input) for mailman id 1073258;
 Thu, 07 Aug 2025 15:57:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uk303-0000X4-KF
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 15:57:51 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 451d50b0-73a7-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 17:57:50 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-615398dc162so1876191a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 08:57:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8f2b892sm12236540a12.25.2025.08.07.08.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 08:57:49 -0700 (PDT)
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
X-Inumbo-ID: 451d50b0-73a7-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754582270; x=1755187070; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sc4K/GGTJOODWjBVp/Eg2EoY1eJv9sdXLDIapNjsyZo=;
        b=cjmkxvTl9Q//cifowDIKlncwk53Jf34vvi6BCUROmNTVBI2XITZm3EzmwbXmpELNNy
         x4KpRm+dyocYNz0b5fwqaw5ibamxuQLTautSCyTROIQgy27mZHcBHQt7msFGujsMsFbi
         lMpyFjTFQ/oREvptDbLiwQnlBV6FJuk8qvUMbWV994EguTQMC4LR5DJXzarlqqO5YRBf
         puAR+trJtzt3gy0SbIMFInL+yYpn2c2M8OeTarvMdwlrq5DIc1Kmgy/+hPbpGzF6x495
         GOeLToraM50cej6z0tIxiEFe6/uBacT5xB7r1GFyOr2jrpOYcbo7wpKoUF1gKh5Ts2we
         j1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754582270; x=1755187070;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sc4K/GGTJOODWjBVp/Eg2EoY1eJv9sdXLDIapNjsyZo=;
        b=GPRHnyUO6jMLbmx2ctuIR2xJh5fpxi2T5Smq4+qiOM2Y79hEBeeHPHVObOKYN6+kV1
         XAuxF2+oLaO0G+RwVU+zHLkrU5AfMUb/KOqCmc4tN9uHNfPKLwJaQn3EU4L+5EvHJPw0
         jBOxltTegvpom0ZdnvUkVdhkvaMgsBMlHts1Gk2jI/dM95WcmbMcfzlB2KbuWWTQa0hm
         lapBHS0EEXag7UF4IVD1w6xau8PMDSQMx5wL/hEpLpb3Rzhd/b5A5fMdGhA02tERqjSH
         j6kUn/tSq+wb05wLIwFfZ06+m5sfupYT6t5JhBKy91Xwrc9G89XG4uBO0zHSBY7oDN9C
         6rDw==
X-Forwarded-Encrypted: i=1; AJvYcCWxNyHJ1vmW/TvxVmB92nrRLQd5CbS26Y0Dvvr3vbJIMUAZxIAa7IbrbHa595arVA6PQAKVMwVhJss=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjSODK2WJbTcwVHvX5pzqaWgXe48qiYzBy3CqtnzTufQLATwlZ
	SI+ZHSWZRgUAm7jLyzz0mqsI1KcL8WUVt5qRXPWaAN9k9jhGL/oAgxq4Gk1GEI5SOQ==
X-Gm-Gg: ASbGncuB3SmxKkfJRCiqE9b7h4oDFutv+p8VJlCtOvGi0ZL6vRM7XumjTD0ebZp5hwe
	8GDzieO/fXH8JbiTrmDF8n7WA5hTCljyqJB4sTKnWyvU4rxhLVBnSCrcJC53ciDcxBA5fYrsvZK
	erEnCGrj0vhZfsZ924l/DJ6culcAT4KB3V1l9y1FnmgsFngah+SDkVgNPNM+yqbAwIFopdJgbsP
	J8v3KYbH2cedS79EIm6mQhlc4Poc6LGdZCK7N8GwrBjz2pzooEB0sYuuOo8iXPg/KWL7K93qNia
	LpID0Y0JQ9q8/idEAkgA4veGuRtm0YWp6jcyIv5/QlxhAF5lwHNKZ9554HGCEK8IBTIHN+v7cDQ
	sHyykyZC1T0aFsJ+6ptiqsTVHiZ/p2IMKuht/CxKwtP/Iu4+/f9frntqDurLii2swgkliGdzb02
	ZcXkiuA1k=
X-Google-Smtp-Source: AGHT+IFcenFdFzsv72NfyTJmIbLhoYinj/v1eQVO+SQWqIZevHxAMLCDr9vQKOp3ZJqfRKgRJwgqlA==
X-Received: by 2002:a05:6402:d0e:b0:615:c767:5ba1 with SMTP id 4fb4d7f45d1cf-617dc3607d6mr273326a12.3.1754582269880;
        Thu, 07 Aug 2025 08:57:49 -0700 (PDT)
Message-ID: <2aa2135f-e422-417f-a509-74f61c3b19de@suse.com>
Date: Thu, 7 Aug 2025 17:57:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/20] xen/riscv: add root page table allocation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1753973161.git.oleksii.kurochko@gmail.com>
 <23c79f07221dee7eb782ebb160442f3a796a41b2.1753973161.git.oleksii.kurochko@gmail.com>
 <7491c934-f847-4fe2-9d9b-a500f0888198@suse.com>
 <ccdd5caa-2c91-4125-9c6b-067c941649b1@gmail.com>
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
In-Reply-To: <ccdd5caa-2c91-4125-9c6b-067c941649b1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2025 15:35, Oleksii Kurochko wrote:
> 
> On 8/5/25 12:43 PM, Jan Beulich wrote:
>> On 31.07.2025 17:58, Oleksii Kurochko wrote:
>>> +static int p2m_alloc_root_table(struct p2m_domain *p2m)
>>> +{
>>> +    struct domain *d = p2m->domain;
>>> +    struct page_info *page;
>>> +    const unsigned int nr_root_pages = P2M_ROOT_PAGES;
>>> +
>>> +    /*
>>> +     * Return back nr_root_pages to assure the root table memory is also
>>> +     * accounted against the P2M pool of the domain.
>>> +     */
>>> +    if ( !paging_ret_pages_to_domheap(d, nr_root_pages) )
>>> +        return -ENOMEM;
>>> +
>>> +    page = p2m_allocate_root(d);
>>> +    if ( !page )
>>> +        return -ENOMEM;
>>> +
>>> +    p2m->root = page;
>>> +
>>> +    return 0;
>>> +}
>> In the success case, shouldn't you bump the paging pool's total_pages by
>> P2M_ROOT_PAGES? (As the freeing side is missing so far, it's not easy to
>> tell whether there's [going to be] a balancing problem in the long run.
>> In the short run there certainly is.)
> 
> I think that total_pages should be updated only in case when page is added
> to freelist.
> In the case of p2m root table, we just returning some pages to domheap and
> durint that decreasing an amount of total_pages as freelist has lesser pages,
> and then just allocate pages from domheap without adding them to freelist.

But how's freeing of a root table going to look like? Logically that group
of 4 pages would be put back into the pool. And from that the pool's
total_pages should reflect that right after successful allocation.

Jan

