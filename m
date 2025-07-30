Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3D7B160C8
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 14:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063953.1429723 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh6Kg-0006BM-0P; Wed, 30 Jul 2025 12:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063953.1429723; Wed, 30 Jul 2025 12:54:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh6Kf-00068F-TX; Wed, 30 Jul 2025 12:54:57 +0000
Received: by outflank-mailman (input) for mailman id 1063953;
 Wed, 30 Jul 2025 12:54:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=usfW=2L=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1uh6Kd-000683-Ez
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 12:54:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61d07ee5-6d44-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 14:54:53 +0200 (CEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-xF6WXcQmMVm4a9T6YGVhmA-1; Wed, 30 Jul 2025 08:54:49 -0400
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-6159136f755so675567a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 05:54:49 -0700 (PDT)
Received: from [10.32.64.156] (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6158b7504f3sm993939a12.27.2025.07.30.05.54.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 05:54:47 -0700 (PDT)
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
X-Inumbo-ID: 61d07ee5-6d44-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753880091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BNOLyc6SmRVRa78hSGFNA3yRycOhT7aevX9lnAuVkng=;
	b=JWP1xRFO+sAzEyHU86GR/whrC9Eu1fWarixOlvmboyM3ikElUgQBDTzbypNuLNmuHjQpjQ
	aSF8BGJov7taS7FFJvExn/rv9Hk8X4rsllFcOoBHNZ4etFs7skYTKCGIuP7JSkUys2lURf
	nEyTVbsdX2vQw1SIFrBfjwUWkmHJ3FQ=
X-MC-Unique: xF6WXcQmMVm4a9T6YGVhmA-1
X-Mimecast-MFC-AGG-ID: xF6WXcQmMVm4a9T6YGVhmA_1753880089
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753880088; x=1754484888;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BNOLyc6SmRVRa78hSGFNA3yRycOhT7aevX9lnAuVkng=;
        b=Pl9+3+eBxkHO0wOpZuuQnWKYjBEP5KcOuPykWqwO4W/9utyILx2meY3W3ZpyVLTn7a
         pBqE0fDR1UVuSo/Kj39Ot8nSkig4tNNW4ELkF97tKzU3t1/eWPs8dXKj97yDUcNKbwIJ
         OhrBU7gsyI96s2w1OIx2rC8H27qP05omfsOJ3K//p1sd33qLDnU+ImJ3RNXarsr8Q6M+
         aaccd36bXoCSHrlGTznkaWZrS5ZO1nXjp0D9Q/i2rt/VGa4kn/SvbUYn9ZPbmya7u0t2
         aeHIIdMKdh+wK3AF1jtvA36cUKePX8/F2YQIStDh8dVpFDReIvlwYkeVObAs4cOq3V1W
         qxSg==
X-Forwarded-Encrypted: i=1; AJvYcCXteH65MOTeppnU+XQdXlEKDwmoDMj/FuVZvxToBAvwUJbFHYLwVBzC1gQCLRuzJEDNR00or+2qd+0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy2H9rHsJgGfkOrmweqgtaKPsljH4UkTqALU0+rr19B9Su39kC1
	edOJEMm4/R53VJ16G7aqjxzrB4fmoOIt4/JWbgxC1G9JtzRTg7TEsLtRhv/JSzLHSQrGnRxFCHP
	NuNrtNv3BjwtsIJPN2e3mI4/ODl18UmzAtTrNrPz8/8Dlz9EmGcZJ7QFwsJS+O/mSviSJ
X-Gm-Gg: ASbGncvv7JDUcDl8v9g2ihE43D5ts6v3DTdYdno6ep29/Hsg9FUb0yJheVelV2ZZrhh
	TsOXELaWRgOf0L73/jXPqmHUD561eX4xEdpoyn5BvrNByr5gdUuw6avOL9o+02krpqcArVkhL0l
	nI8o0AbpN0pnxE0rJdscCgVYpsEPvDG/B0dMQYvcOBm5ePQ4Oh07GVhdBN1pdDyhTuENrnH3l3F
	8s9N+a7mNbWGnWUwA4LGxQTGz42YSyVeb/XmD5jKRkLPKkM5er+exEMTvE3xSZgPT7fbtZyij0x
	H0r0BBnpU9d4Yi0/odozvaiItpqphWZll3BTiT9A1Ja/R+Q3A+hyQYKazMFNSg==
X-Received: by 2002:a50:cd92:0:b0:615:7e88:ef95 with SMTP id 4fb4d7f45d1cf-6157e88f679mr3494305a12.11.1753880088546;
        Wed, 30 Jul 2025 05:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjKq5bY0KudoprYalsB0y2Cl4cMah/r660xfqVfVg64zh4dhPtr+6C+EPKKEUf1j0BUA07jQ==
X-Received: by 2002:a50:cd92:0:b0:615:7e88:ef95 with SMTP id 4fb4d7f45d1cf-6157e88f679mr3494267a12.11.1753880088043;
        Wed, 30 Jul 2025 05:54:48 -0700 (PDT)
Message-ID: <ee6ff4d7-8e48-487b-9685-ce5363f6b615@redhat.com>
Date: Wed, 30 Jul 2025 14:54:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/9] mm/memory: factor out common code from
 vm_normal_page_*()
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
 nvdimm@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Dan Williams <dan.j.williams@intel.com>, Matthew Wilcox
 <willy@infradead.org>, Jan Kara <jack@suse.cz>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
 Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
 Lance Yang <lance.yang@linux.dev>
References: <20250717115212.1825089-1-david@redhat.com>
 <20250717115212.1825089-8-david@redhat.com>
 <1aef6483-18e6-463b-a197-34dd32dd6fbd@lucifer.local>
 <50190a14-78fb-4a4a-82fa-d7b887aa4754@lucifer.local>
 <b7457b96-2b78-4202-8380-4c7cd70767b9@redhat.com>
 <eab1eb16-b99b-4d6b-9539-545d62ed1d5d@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <eab1eb16-b99b-4d6b-9539-545d62ed1d5d@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HxkbMqd05o_d5YNrgV0moGQnkn4UvHPXnR88VHQcstE_1753880089
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.07.25 14:43, Lorenzo Stoakes wrote:
> On Thu, Jul 17, 2025 at 10:03:44PM +0200, David Hildenbrand wrote:
>> On 17.07.25 21:55, Lorenzo Stoakes wrote:
>>> On Thu, Jul 17, 2025 at 08:51:51PM +0100, Lorenzo Stoakes wrote:
>>>>> @@ -721,37 +772,21 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
>>>>>    		print_bad_page_map(vma, addr, pmd_val(pmd), NULL);
>>>>>    		return NULL;
>>>>>    	}
>>>>> -
>>>>> -	if (unlikely(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP))) {
>>>>> -		if (vma->vm_flags & VM_MIXEDMAP) {
>>>>> -			if (!pfn_valid(pfn))
>>>>> -				return NULL;
>>>>> -			goto out;
>>>>> -		} else {
>>>>> -			unsigned long off;
>>>>> -			off = (addr - vma->vm_start) >> PAGE_SHIFT;
>>>>> -			if (pfn == vma->vm_pgoff + off)
>>>>> -				return NULL;
>>>>> -			if (!is_cow_mapping(vma->vm_flags))
>>>>> -				return NULL;
>>>>> -		}
>>>>> -	}
>>>>> -
>>>>> -	if (is_huge_zero_pfn(pfn))
>>>>> -		return NULL;
>>>>> -	if (unlikely(pfn > highest_memmap_pfn)) {
>>>>> -		print_bad_page_map(vma, addr, pmd_val(pmd), NULL);
>>>>> -		return NULL;
>>>>> -	}
>>>>> -
>>>>> -	/*
>>>>> -	 * NOTE! We still have PageReserved() pages in the page tables.
>>>>> -	 * eg. VDSO mappings can cause them to exist.
>>>>> -	 */
>>>>> -out:
>>>>> -	return pfn_to_page(pfn);
>>>>> +	return vm_normal_page_pfn(vma, addr, pfn, pmd_val(pmd));
>>>>
>>>> Hmm this seems broken, because you're now making these special on arches with
>>>> pte_special() right? But then you're invoking the not-special function?
>>>>
>>>> Also for non-pte_special() arches you're kind of implying they _maybe_ could be
>>>> special.
>>>
>>> OK sorry the diff caught me out here, you explicitly handle the pmd_special()
>>> case here, duplicatively (yuck).
>>>
>>> Maybe you fix this up in a later patch :)
>>
>> I had that, but the conditions depend on the level, meaning: unnecessary
>> checks for pte/pmd/pud level.
>>
>> I had a variant where I would pass "bool special" into vm_normal_page_pfn(),
>> but I didn't like it.
>>
>> To optimize out, I would have to provide a "level" argument, and did not
>> convince myself yet that that is a good idea at this point.
> 
> Yeah fair enough. That probably isn't worth it or might end up making things
> even more ugly.

So, I decided to add the level arguments, but not use them to optimize the checks,
only to forward it to the new print_bad_pte().

So the new helper will be

/**
   * __vm_normal_page() - Get the "struct page" associated with a page table entry.
   * @vma: The VMA mapping the page table entry.
   * @addr: The address where the page table entry is mapped.
   * @pfn: The PFN stored in the page table entry.
   * @special: Whether the page table entry is marked "special".
   * @level: The page table level for error reporting purposes only.
   * @entry: The page table entry value for error reporting purposes only.
...
   */
static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
                unsigned long addr, unsigned long pfn, bool special,
                unsigned long long entry, enum pgtable_level level)
...


And vm_nomal_page() will for example be

/**
  * vm_normal_page() - Get the "struct page" associated with a PTE
  * @vma: The VMA mapping the @pte.
  * @addr: The address where the @pte is mapped.
  * @pte: The PTE.
  *
  * Get the "struct page" associated with a PTE. See __vm_normal_page()
  * for details on "normal" and "special" mappings.
  *
  * Return: Returns the "struct page" if this is a "normal" mapping. Returns
  *        NULL if this is a "special" mapping.
  */
struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
                             pte_t pte)
{
        return __vm_normal_page(vma, addr, pte_pfn(pte), pte_special(pte),
                                pte_val(pte), PGTABLE_LEVEL_PTE);
}



-- 
Cheers,

David / dhildenb


