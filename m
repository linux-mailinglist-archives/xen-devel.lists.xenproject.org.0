Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FFC9846C3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 15:31:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802884.1213299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st5dI-0001Rg-GN; Tue, 24 Sep 2024 13:31:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802884.1213299; Tue, 24 Sep 2024 13:31:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st5dI-0001Pq-De; Tue, 24 Sep 2024 13:31:12 +0000
Received: by outflank-mailman (input) for mailman id 802884;
 Tue, 24 Sep 2024 13:31:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st5dG-00016x-QF
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 13:31:10 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41c407f7-7a79-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 15:31:08 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a8d2b24b7a8so265529766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 06:31:08 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a93930cacffsm85483766b.139.2024.09.24.06.31.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 06:31:07 -0700 (PDT)
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
X-Inumbo-ID: 41c407f7-7a79-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727184668; x=1727789468; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pWQr5ShjLnnAkbAcg+Q0JKKBdYSaf9Vr5DvQWiH+Lk4=;
        b=C+dt8dJF8RDiBK6m/uA04aCPOoBbCAMu1nV1xCSUVcd+ziQYkJJVaqShGfgDuSE8wb
         /nwAShCXH6qrG/J1iG4dD/mfI3xSY+sLRhAUBsdZEnz8ARE3A3rStGIdbvBVFlpzrUps
         B3xZzxfWG9LSVXIGbkCN6NH9bAt4Ninj4wFHQYgOMS8dAkHLInCcnekSYfi88n5SEjwC
         WvcdYcCu3BfKCH3ia0OsVVvMuRhy65tAXCw20gCJKQoQz8vw321Fc6dATz6hJPhiDZrd
         4oy9GlixdIBVERCcaE1C7/fMI8NSuepEQK1HJT3B+EOZhMHNnsNzWTVnx9D1b0sRgom7
         EPAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727184668; x=1727789468;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWQr5ShjLnnAkbAcg+Q0JKKBdYSaf9Vr5DvQWiH+Lk4=;
        b=UxBybZHXknT3gSgeTzwN6SnZipCXWVsHuJNO2LKPe/v9ZxHkFBvkRuEi8pGiOmUpDA
         b8UpYfEgZChAIyecrjQmOVvqTsnK5Tpx+7E4zLDtMwQUWiLwfQETkc1qIjeNaFk8DyfN
         4n6AeE55mmoCB51/WOOnRL9hGCy8x9iT236Z5y3qw7ygYVAXUsHRMZWCNDIx6utRRzQH
         ANT/TvvNmxJ90jSFywIo54s50ZWp/mCqOvmgwNKkbK9TXCcOFhHsJ5X1hLbc03rAAjdj
         5ZkxbK0pMKowARU/Th6f1RTExyyIIyWdKnAiV5Pi42Vz0EiAg/lXo5OS48c9csJCDhMR
         C8DA==
X-Forwarded-Encrypted: i=1; AJvYcCXBSvJ3w/6nhtX0n5yNwRC/YfjDQ5rdzjHQpudDNnQK1JCbrENezjWZfa6W96sBJaQx4yO7ikNKwWc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSJsM3rSf9s+90hoUxAHcU5taL5YZQJnaVmwScOeAohX/VvBlt
	ev+Wr2CXIKnRtHgweU+rDiDRFrMxzF5aX7bKX3UJ2My/IHF4AaKdOUKzm0uKHw==
X-Google-Smtp-Source: AGHT+IFUlIs5lOSlw41wmHrA1Ap1bbB+KBvgViTHJnkBIabx/OtiOruFWDdgZgj8OhlgVcJRY1HBFA==
X-Received: by 2002:a17:907:31c5:b0:a91:15dc:3607 with SMTP id a640c23a62f3a-a92d55edab9mr379227366b.20.1727184667975;
        Tue, 24 Sep 2024 06:31:07 -0700 (PDT)
Message-ID: <9371e8fd-a1de-40df-8994-814dd6196953@suse.com>
Date: Tue, 24 Sep 2024 15:31:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 7/8] xen/riscv: page table handling
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1726242605.git.oleksii.kurochko@gmail.com>
 <582c4cee40222e80faf1e465c011b07eeaf2c19f.1726242605.git.oleksii.kurochko@gmail.com>
 <6100a4e0-5bf3-4555-90ae-20624171ff79@suse.com>
 <fc23fbd82c1495e75fc0bdcfa894cdb56262b11b.camel@gmail.com>
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
In-Reply-To: <fc23fbd82c1495e75fc0bdcfa894cdb56262b11b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2024 13:30, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-09-24 at 12:49 +0200, Jan Beulich wrote:
>> On 13.09.2024 17:57, Oleksii Kurochko wrote:
>>> +static int pt_next_level(bool alloc_tbl, pte_t **table, unsigned
>>> int offset)
>>> +{
>>> +    pte_t *entry;
>>> +    mfn_t mfn;
>>> +
>>> +    entry = *table + offset;
>>> +
>>> +    if ( !pte_is_valid(*entry) )
>>> +    {
>>> +        if ( !alloc_tbl )
>>> +            return XEN_TABLE_MAP_FAILED;
>>> +
>>> +        if ( create_table(entry) )
>>> +            return XEN_TABLE_MAP_FAILED;
>>
>> You're still losing the -ENOMEM here.
> Agree, I will save the return value of create_table and return it.

That won't work very well, will it? Imo you need a new XEN_TABLE_MAP_NOMEM.
(And then XEN_TABLE_MAP_FAILED may want renaming to e.g. XEN_TABLE_MAP_NONE).

Jan

