Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52B6D3C04F
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jan 2026 08:26:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1208410.1520571 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi67i-0007I3-Oz; Tue, 20 Jan 2026 07:25:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1208410.1520571; Tue, 20 Jan 2026 07:25:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vi67i-0007Gu-Lx; Tue, 20 Jan 2026 07:25:58 +0000
Received: by outflank-mailman (input) for mailman id 1208410;
 Tue, 20 Jan 2026 07:25:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EVnc=7Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vi67g-0007Gi-NZ
 for xen-devel@lists.xenproject.org; Tue, 20 Jan 2026 07:25:56 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f99e113-f5d1-11f0-9ccf-f158ae23cfc8;
 Tue, 20 Jan 2026 08:25:51 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-480142406b3so25707925e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 19 Jan 2026 23:25:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4358f12ee69sm2797507f8f.11.2026.01.19.23.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jan 2026 23:25:50 -0800 (PST)
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
X-Inumbo-ID: 3f99e113-f5d1-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768893951; x=1769498751; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n7DieNAjIepvpk0xvQnW1kQ+6VlXF95tzA1h3z+8h4k=;
        b=Q72J17f8CiAU2KMemFefGdKAcJhOFD+cpIIJbIlqZZdLjqvGJUyFUUkDxyFk89WmbJ
         aleNYmImnhteJ5SSz9JgtmBsSmzuTHLD/ZHDFKvUwMPXdgvKWL6CUZpawcI3vhfaTdKW
         vE4WX5adqgmRQ3iNJecwINiALR0kx1F9KnsD72KlsSEGsu+0yX80SduiiV6GZWz/FDMB
         anQviQWo4mm0sA5dZYMv8MWZ0FvZry7vXNEbOyhCprkv8sUme14Kw/1ACB+TMpaD3PXp
         SnwVar24V3eU/YA12db5eNzGgt9eD/FH1rbPcKn1WNuB0W23jMmR39yrOlnmQouDlx14
         1Z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768893951; x=1769498751;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7DieNAjIepvpk0xvQnW1kQ+6VlXF95tzA1h3z+8h4k=;
        b=Qrw+mcQHiYX1J9Smj+BVP4rKWQY9C+0KlA5o2LLo+pPynxPKWUHZaT91BUWQqUh/EI
         oOgYBm/8hOWFgM/mKz6GkgQ/p7AlamhesMyBUR4C2kMQtTA+KOM73MrM9tYqncyOJA5D
         axcXPCdna+7M5IRHAcBULaiN3ReIfO8grEV2rbL9dBL0iimKOuQDJacAuqLvqUS+1cVF
         K0u0fpqQgeViwBySXrpfgzgJb1RygxeO+fUOvBi3kTLqlT9g4WhXx5TjLBDe+G6ncnP6
         OnD9SRNIw4tfNM941LBfw/pD7FJU4acntEz5kT/zBGdvQs+uTyY1RThrodt9Z8pKxApg
         yeNA==
X-Forwarded-Encrypted: i=1; AJvYcCXTot3RIr0Vuf84PNcb6ZEZ9Dl37V10mdl5R1H7X4TihKW/7ujLhUvxt2Xe1t7/XxjT09NK8nBQbjA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywt0CG2pD1JDaUvlQbdafFiVO9S47JwzHDUm4QMAd/UEEJJGcwJ
	uzX2hD1KV/Nqn/jtLytchSsXDegM3vamQQo+OVJn2fqv++zRRUh+By5Kiel9orakiw==
X-Gm-Gg: AY/fxX41ddWmLkTaspAkRhG8Eysl4yMrinIjfJ+U/BlmKuLlNrkuPEh9pytvgHtswBD
	vk9zinFq31L/kO9wY0h/uqDDLQPMKr2cht2REPENuNA2Q/5Wd1EzdR9xKByRP4Nhf2FfWNKWD1K
	i7QtlF41N1HoCxJBdGrlXO9IS4KLbVOjdiuQpoxZPJg64nXY+HHXvLzX14ax80Jviv3tJvEv88L
	c0MP9CadHKB92pDMIXSfGAtteZ/iaDmDEkfL1bCFkAKqCSwj1LoWB7l//YbCqxt1Gzggdlh4KeW
	nEjjwWxXJgT8uMhFR3y1slBchKldFmXUga/xtCAbnT77rMrj6s32SPYm1Oaj4DMALLOw7E9iHxz
	msFUjrGVdgLmXEgG7sijty/Nn9fiBEtzKBnxKXgA7EwLIGf3jnQajUg6OmUQQt1gY9w6Nc8WCJK
	Dne60MLEh71p+/KPqPrNVCo084IUozQuzxIuR0lq34JBAkl9voRF2GsryVLEbJPymWvS7bJ/Awo
	Ck=
X-Received: by 2002:a05:600c:3555:b0:47e:e20e:bb9c with SMTP id 5b1f17b1804b1-4801e2f8e63mr181696175e9.8.1768893950748;
        Mon, 19 Jan 2026 23:25:50 -0800 (PST)
Message-ID: <97127b23-4e4c-4b06-a8bb-b1dad31bf0b0@suse.com>
Date: Tue, 20 Jan 2026 08:25:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] xen/mm: limit non-scrubbed allocations to a
 specific order
From: Jan Beulich <jbeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20260115111804.40199-1-roger.pau@citrix.com>
 <20260115111804.40199-4-roger.pau@citrix.com>
 <858d73b3-2feb-419f-bf3b-9a264e9f9af8@suse.com>
Content-Language: en-US
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
In-Reply-To: <858d73b3-2feb-419f-bf3b-9a264e9f9af8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.01.2026 17:13, Jan Beulich wrote:
> On 15.01.2026 12:18, Roger Pau Monne wrote:
>> The current logic allows for up to 1G pages to be scrubbed in place, which
>> can cause the watchdog to trigger in practice.  Reduce the limit for
>> in-place scrubbed allocations to a newly introduced define:
>> CONFIG_DIRTY_MAX_ORDER.  This currently defaults to CONFIG_DOMU_MAX_ORDER
>> on all architectures.  Also introduce a command line option to set the
>> value.
>>
>> Fixes: 74d2e11ccfd2 ("mm: Scrub pages in alloc_heap_pages() if needed")
>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>> Changes since v1:
>>  - Split from previous patch.
>>  - Introduce a command line option to set the limit.
>> ---
>>  docs/misc/xen-command-line.pandoc |  9 +++++++++
>>  xen/common/page_alloc.c           | 23 ++++++++++++++++++++++-
>>  2 files changed, 31 insertions(+), 1 deletion(-)
> 
> If you confine the change to page_alloc.c, won't this mean that patch 2's
> passing of MEMF_no_scrub will then also be bounded (in which case the need
> for patch 2 would largely disappear)?

This was rubbish, sorry. Besides my being thick-headed I can only attribute
this to the double negation in !(memflags & MEMF_no_scrub).

I have another concern, though: You effectively undermine ptdom_max_order,
which is even more of a problem as that would also affect Dom0's ability to
obtain larger contiguous I/O buffers. Perhaps DIRTY_MAX_ORDER ought to
default to PTDOM_MAX_ORDER (if HAS_PASSTHROUGH)? Yet then command line
options may also need tying together, such that people using
"memop-max-order=" to alter (increase) ptdom_max_order won't need to
additionally use "max-order-dirty="? At which point maybe the new option
shouldn't be a standalone one, but be added to "memop-max-order=" (despite
it being effected in alloc_heap_pages())?

Jan

