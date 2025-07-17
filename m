Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9896CB0955E
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 22:04:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047393.1417888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUpe-0007dp-Px; Thu, 17 Jul 2025 20:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047393.1417888; Thu, 17 Jul 2025 20:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUpe-0007bY-Ml; Thu, 17 Jul 2025 20:03:54 +0000
Received: by outflank-mailman (input) for mailman id 1047393;
 Thu, 17 Jul 2025 20:03:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0s4=Z6=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ucUpd-00069o-2h
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 20:03:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 27bf4f7e-6349-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 22:03:50 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-8P8phXV0OCaxQl2od0cLbA-1; Thu, 17 Jul 2025 16:03:48 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-455f7b86aeeso6090525e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 13:03:48 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f35:2b00:b1a5:704a:6a0c:9ae?
 (p200300d82f352b00b1a5704a6a0c09ae.dip0.t-ipconnect.de.
 [2003:d8:2f35:2b00:b1a5:704a:6a0c:9ae])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45630ec9129sm49616075e9.29.2025.07.17.13.03.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 13:03:45 -0700 (PDT)
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
X-Inumbo-ID: 27bf4f7e-6349-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752782629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ClNVtTZhZp5gAwQFZwS1SAbGnOFesIfcYAsTrAvuVJw=;
	b=dcFKsM91n4VTmDbIO+9k9Y4ZZbkDObUbM3wD1XFO8n6ydE3Mr35wdoPiHSEebnAKV2h6Ct
	cwFfPKF4mC9tb1pkNzLtjO86MauaXp26YQcBhy3lnPJN64F9+J2Tmh+9Q95N/Q8hUP35z+
	FoFzlV6wSEeQ1idltVsWFbJL83eO3+U=
X-MC-Unique: 8P8phXV0OCaxQl2od0cLbA-1
X-Mimecast-MFC-AGG-ID: 8P8phXV0OCaxQl2od0cLbA_1752782627
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752782627; x=1753387427;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ClNVtTZhZp5gAwQFZwS1SAbGnOFesIfcYAsTrAvuVJw=;
        b=ut4i7pw+Pf6HRzkpL9K1PIXqLZ3mohvNWTKfOg5JKIX29eNmy2NWIH5aJ+Xudeg4wN
         XZ8HkRwWkFFNLxTMmDg0c/OaZjXsqkvKEuL60VnjmxlL4CW/c6UVBjmrs6Zxb+ey/5FI
         F1XKZAaSxXCpTAiULJ7jAQlcrLI933isFiNDCfNYTVfwHGm6MmLQg9P3Qy7d44dvC/MZ
         2iceotX2wn9sow5cKhrJFyrG0hxulukdTOF5AyV3JcRYBcI9MGt557Z2ec8rN31dnZ8J
         mab+9mNEKDbwkPq7h+WuHOFfQeslx28D9+LR6r2x/TbPZ1MPK99QEmrqmryYP5vzRdJq
         tXKw==
X-Forwarded-Encrypted: i=1; AJvYcCWL70cMrDNX5bNhK2NsBnyCh71Ct5ihLsyWIaSJudmHXlI1z5cMoUOFEkZ8QGWTE0SepubnUeLrPhM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyw4LuKj2nfIhSxN5Az+zaxFgAa5sEeGDJ0mtd+9lGcyLwttl+O
	DGjCFVSaHyZN3Nd8DZTSULMhE5QfTH9P1gMtZvl8NL3EKX2594PVxeoJ6cXw0enSzLwo2YNpPp3
	+Y+eXwyTYeVcqqGBH4TkFw+EimA1cbujSMcWMT3ZflZwk8RnJYOLCg3PlWuazm7M8on27
X-Gm-Gg: ASbGncuFZpboLUAOjrvvTyp9JjBC3vt9O2o11Cv9tUBMDs/UNnLq25z3wQbKc4tCV8r
	u9zxeD/Wurk2Qc7PrL25dUhUX3yn8Zd9nq7SNgy8MOCeR3bvssAGeDJS4NsIr3rqeVyz62U2XqD
	TW1Ure9FsLQXB/Nxu9szdQeTtdsBy4b6YUPBRIBFz9VOq6IB8aI+xP3CsDRyAUoONQE9zIfKz/7
	zgjoEEfGUNBFKxNgDgovOVPPvNfKQxZfAHc2X2ArkauVNipINfZL6wUCqKAWo0fsVgRiQrevdyI
	DKVX9Eeu7Zp+XxMFYx/sk+T9Rwdz+P41OBm0Fuh1vzAHNtaHRgKbXGm64PLtj70wwuuqPCeGBOn
	dvJ6D3rFpgkiz+CZPKuJGvmPUqlkfVMVbeJB6am8CCYIril2IsCfGew5jY2RDIKeU
X-Received: by 2002:a05:600c:3481:b0:456:f9f:657 with SMTP id 5b1f17b1804b1-4562e3c503amr79746055e9.27.1752782626937;
        Thu, 17 Jul 2025 13:03:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHITXVfZtwqa7P8f0u6oWcFw1NazxQtB99hClGfTnR+mgLoVDMe7M6pKVDkyJRWFMthviCSvw==
X-Received: by 2002:a05:600c:3481:b0:456:f9f:657 with SMTP id 5b1f17b1804b1-4562e3c503amr79745695e9.27.1752782626423;
        Thu, 17 Jul 2025 13:03:46 -0700 (PDT)
Message-ID: <b7457b96-2b78-4202-8380-4c7cd70767b9@redhat.com>
Date: Thu, 17 Jul 2025 22:03:44 +0200
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <50190a14-78fb-4a4a-82fa-d7b887aa4754@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: RHJSH6sE-qmuEAHGVeTHBLrsff6MOcgShrKmrxp0zaE_1752782627
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.07.25 21:55, Lorenzo Stoakes wrote:
> On Thu, Jul 17, 2025 at 08:51:51PM +0100, Lorenzo Stoakes wrote:
>>> @@ -721,37 +772,21 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
>>>   		print_bad_page_map(vma, addr, pmd_val(pmd), NULL);
>>>   		return NULL;
>>>   	}
>>> -
>>> -	if (unlikely(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP))) {
>>> -		if (vma->vm_flags & VM_MIXEDMAP) {
>>> -			if (!pfn_valid(pfn))
>>> -				return NULL;
>>> -			goto out;
>>> -		} else {
>>> -			unsigned long off;
>>> -			off = (addr - vma->vm_start) >> PAGE_SHIFT;
>>> -			if (pfn == vma->vm_pgoff + off)
>>> -				return NULL;
>>> -			if (!is_cow_mapping(vma->vm_flags))
>>> -				return NULL;
>>> -		}
>>> -	}
>>> -
>>> -	if (is_huge_zero_pfn(pfn))
>>> -		return NULL;
>>> -	if (unlikely(pfn > highest_memmap_pfn)) {
>>> -		print_bad_page_map(vma, addr, pmd_val(pmd), NULL);
>>> -		return NULL;
>>> -	}
>>> -
>>> -	/*
>>> -	 * NOTE! We still have PageReserved() pages in the page tables.
>>> -	 * eg. VDSO mappings can cause them to exist.
>>> -	 */
>>> -out:
>>> -	return pfn_to_page(pfn);
>>> +	return vm_normal_page_pfn(vma, addr, pfn, pmd_val(pmd));
>>
>> Hmm this seems broken, because you're now making these special on arches with
>> pte_special() right? But then you're invoking the not-special function?
>>
>> Also for non-pte_special() arches you're kind of implying they _maybe_ could be
>> special.
> 
> OK sorry the diff caught me out here, you explicitly handle the pmd_special()
> case here, duplicatively (yuck).
> 
> Maybe you fix this up in a later patch :)

I had that, but the conditions depend on the level, meaning: unnecessary 
checks for pte/pmd/pud level.

I had a variant where I would pass "bool special" into 
vm_normal_page_pfn(), but I didn't like it.

To optimize out, I would have to provide a "level" argument, and did not 
convince myself yet that that is a good idea at this point.

-- 
Cheers,

David / dhildenb


