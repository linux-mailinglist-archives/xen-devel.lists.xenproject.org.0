Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D04AF11FB
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 12:34:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1030907.1404592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWunF-0007aN-TZ; Wed, 02 Jul 2025 10:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1030907.1404592; Wed, 02 Jul 2025 10:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWunF-0007XL-Pa; Wed, 02 Jul 2025 10:34:21 +0000
Received: by outflank-mailman (input) for mailman id 1030907;
 Wed, 02 Jul 2025 10:34:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWunE-0007Wz-3G
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 10:34:20 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c053964-5730-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 12:34:19 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so4018091f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 03:34:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39b928sm125765515ad.111.2025.07.02.03.34.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 03:34:17 -0700 (PDT)
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
X-Inumbo-ID: 1c053964-5730-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751452458; x=1752057258; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Mfw4NQ3kvAd+TBb0j0uTgWsLOsYVn53ltQ/2uHaGE0=;
        b=AXnAWNcIOSUJm3xJtZ64Nxr3nJ7ws+YrjFMrexvg9IHAfNzYhUavv042Yvy1OFPTrX
         5kZ/SDCw3U44WzO3suduiXMGoc17QpJAaQ2kpViDETC9KpePvF6rGucNlJgWrL9vuBS9
         xrrwOiHhnfyLNXjoKlqfBkkzOgQiAKmBgdeIdKj/Rr0DhLsrcSBK2VJzLTjonm8zUUH9
         /n7Qg2UqbDgRsb+Qwfa7NbNPAL+FopmcDRM9oPAvAgCO/KqpIGe34WoOk/BQ9Gv8z3d7
         tLMA6C4v3KTsniCALKQQ0ub4ijfwGgrdFe0xBk/QdMfFDp76/y7uQvNUYStkPA4W5n6T
         +TXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751452458; x=1752057258;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Mfw4NQ3kvAd+TBb0j0uTgWsLOsYVn53ltQ/2uHaGE0=;
        b=gLV9PkR15jTcfaN2H2eT6FNKIA/0wPGNS+ROGVKxFqrTNIDbT8ohp9WLiGUZmLjwT+
         iIsRdkeX6FMtWNxKkfSTvCZeM1rH+Grkc0Jay4SPHu8jGZMSMN0rf0zxwCPTUPk3bzPL
         y22ctMiqDdMtGsOSCUJ62/bkJwPz9YXNcvfUz3hRyZU9mJaILjUgCezl6BSuBrRjbkfy
         PWDqn0RkKdu8swf2s7d8Wng9fLoT/PQHIPjcqm9KIi1uZtKmeKDfBza3LAnU2S7OcJIl
         po1T5Cth5UHD4i4TTQfVDkxLHWrXUSNow3YJEk0+PG9rJkIzNWVYhh3fBwgHyDbkiwJo
         7f1A==
X-Forwarded-Encrypted: i=1; AJvYcCUjkzz0UgDL7Ax3nGGO8bNhyP7AWmq3kYU+9ISXsRCH1oSikcSOmFmjOeLpDPyiQAkMMiQimS6Yic8=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxt0SmGcD3a9Nix2eK6RaXApgzrGx2ZD50yH+7jYXHRm9z1EUyE
	46Si+34keS58i7/iTOyCzoOjA8V9+EItpAtWRjp6jYI6m4bCv8B9xJrpiTxuVSnsbA==
X-Gm-Gg: ASbGncul679YaRmhUVZKYbNq2iW9GA+jI0uBj+99VhZOb6L+wODD5xbhc2Kec+GM8my
	kWRcdfoxal1E8JQXh3H1+CMETaEBeoW2QsWLZ8GEqVeYIABH0YKdKWVzaEtDbggZpIDMjfbJHYQ
	VcWd1S8zQeQJpPUglYzPbQLmIVTBHpd/LnQhMoSsreOtGv4ydCrKr27Qyih/Mu1kBNHKJM79/t2
	D2b0S46GGUpWMGGLI5yAoGid0ngUfZRZ/cHOwE0/GXVkahv3e16Mx90TH6YwgKbTKD+YYOjbdx+
	ECSNdUdQV763/1NjInxGFcHxIDLpfK0SrWkvUel7N2TGA0kwROxBXPL4dNh8ibIGy+gwteUpE4O
	KeHffp50HpZp6zEiNiQD6X8hOYkWdzY4pLFASnCT7F1S6O7XrmyGIreyCZQ==
X-Google-Smtp-Source: AGHT+IHPUxvT50zWLwAW/5ksXYrLioCp5MWz18yR46bY2gvtcO/C6cj3jaNos1RA0Xeh5VuAh+glag==
X-Received: by 2002:a05:6000:290f:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3b2019b6b6amr1686904f8f.54.1751452458284;
        Wed, 02 Jul 2025 03:34:18 -0700 (PDT)
Message-ID: <44719b33-e770-4d2c-a063-77f35e413c77@suse.com>
Date: Wed, 2 Jul 2025 12:34:07 +0200
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
 <f3761f21-1a7d-4820-ba74-31fb9becf36d@suse.com>
 <5bcdd74e-a76b-4ddd-97bc-d6ed973630c8@gmail.com>
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
In-Reply-To: <5bcdd74e-a76b-4ddd-97bc-d6ed973630c8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.07.2025 12:30, Oleksii Kurochko wrote:
> 
> On 7/1/25 3:04 PM, Jan Beulich wrote:
>> On 10.06.2025 15:05, Oleksii Kurochko wrote:
>>> @@ -113,3 +117,58 @@ int p2m_init(struct domain *d)
>>>   
>>>       return 0;
>>>   }
>>> +
>>> +/*
>>> + * Set the pool of pages to the required number of pages.
>>> + * Returns 0 for success, non-zero for failure.
>>> + * Call with d->arch.paging.lock held.
>>> + */
>>> +int p2m_set_allocation(struct domain *d, unsigned long pages, bool *preempted)
>>> +{
>>> +    struct page_info *pg;
>>> +
>>> +    ASSERT(spin_is_locked(&d->arch.paging.lock));
>>> +
>>> +    for ( ; ; )
>>> +    {
>>> +        if ( d->arch.paging.p2m_total_pages < pages )
>>> +        {
>>> +            /* Need to allocate more memory from domheap */
>>> +            pg = alloc_domheap_page(d, MEMF_no_owner);
>>> +            if ( pg == NULL )
>>> +            {
>>> +                printk(XENLOG_ERR "Failed to allocate P2M pages.\n");
>>> +                return -ENOMEM;
>>> +            }
>>> +            ACCESS_ONCE(d->arch.paging.p2m_total_pages)++;
>>> +            page_list_add_tail(pg, &d->arch.paging.p2m_freelist);
>>> +        }
>>> +        else if ( d->arch.paging.p2m_total_pages > pages )
>>> +        {
>>> +            /* Need to return memory to domheap */
>>> +            pg = page_list_remove_head(&d->arch.paging.p2m_freelist);
>>> +            if( pg )
>>> +            {
>>> +                ACCESS_ONCE(d->arch.paging.p2m_total_pages)--;
>>> +                free_domheap_page(pg);
>>> +            }
>>> +            else
>>> +            {
>>> +                printk(XENLOG_ERR
>>> +                       "Failed to free P2M pages, P2M freelist is empty.\n");
>>> +                return -ENOMEM;
>>> +            }
>>> +        }
>>> +        else
>>> +            break;
>>> +
>>> +        /* Check to see if we need to yield and try again */
>>> +        if ( preempted && general_preempt_check() )
>>> +        {
>>> +            *preempted = true;
>>> +            return -ERESTART;
>>> +        }
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>> Btw, with the order-2 requirement for the root page table, you may want to
>> consider an alternative approach: Here you could allocate some order-2
>> pages (possibly up to as many as a domain might need, which right now
>> would be exactly one), put them on a separate list, and consume the root
>> table(s) from there. If you run out of pages on the order-0 list, you
>> could shatter a page from the order-2 one (as long as that's still non-
>> empty). The difficulty would be with freeing, where a previously shattered
>> order-2 page would be nice to re-combine once all of its constituents are
>> free again. The main benefit would be avoiding the back and forth in patch
>> 6.
> 
> It is an option.
> 
> But I'm still not 100% sure it's necessary to allocate the root page table
> from the freelist. We could simply allocate the root page table from the
> domheap (as is done for hardware domains) and reserve the freelist for other
> pages.
> The freelist is specific to Dom0less guest domains and is primarily used to
> limit the amount of memory available for the guest—essentially for static
> configurations where you want a clear and fixed limit on p2m allocations.

Is that true? My understanding is that this pre-populated pool is used by
all DomU-s, whether or not under dom0less.

Plus we're meaning to move towards better accounting of memory used by a
domain (besides its actual allocation). Allocating the root table from the
domain heap would move us one small step farther away from there.

Jan

