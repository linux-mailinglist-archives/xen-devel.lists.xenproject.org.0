Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C97B09586
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 22:13:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047424.1417919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUyL-0002wR-6f; Thu, 17 Jul 2025 20:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047424.1417919; Thu, 17 Jul 2025 20:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucUyL-0002uD-3M; Thu, 17 Jul 2025 20:12:53 +0000
Received: by outflank-mailman (input) for mailman id 1047424;
 Thu, 17 Jul 2025 20:12:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0s4=Z6=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ucUyJ-0002u3-Ft
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 20:12:51 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68d088eb-634a-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 22:12:49 +0200 (CEST)
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-xGGynuoIPpqeo0If1dFTiA-1; Thu, 17 Jul 2025 16:12:42 -0400
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45624f0be48so7181755e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 13:12:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f35:2b00:b1a5:704a:6a0c:9ae?
 (p200300d82f352b00b1a5704a6a0c09ae.dip0.t-ipconnect.de.
 [2003:d8:2f35:2b00:b1a5:704a:6a0c:9ae])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b600a39281sm13907105f8f.73.2025.07.17.13.12.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 13:12:39 -0700 (PDT)
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
X-Inumbo-ID: 68d088eb-634a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752783168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KwbrI84IedQLHDSyTV7Sjdel/mNA8veF7wrxE3TB6nI=;
	b=aLVQ1DhBi9iITgkFWytJRgfnHHKO3yG/QmU/NP4w4tLvmkyVETVQ5/TkHCCbPPFnZMxApk
	qQ3uSIprdAdXfnnXUaZEytO5gcVX/VXosL9Lrbb23nHRqlEXKV0ZBqIY++UBLlQnSMW6uK
	Q+rL75d6VEj0oULHxctw0hMeyrMZuik=
X-MC-Unique: xGGynuoIPpqeo0If1dFTiA-1
X-Mimecast-MFC-AGG-ID: xGGynuoIPpqeo0If1dFTiA_1752783161
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752783161; x=1753387961;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KwbrI84IedQLHDSyTV7Sjdel/mNA8veF7wrxE3TB6nI=;
        b=AF1iF7PSs2b/hmEICGe3syB6jl96gFMOFissBA9aUswpFArrGU/C70OrRNYYMP1u82
         mDXcFNitmH3iEW/Z2xWi10Q6Spx6M1EB6a6HXCp2TuBcEFfNdtApax4Wo00SJoCXX67d
         9op/a/6MIQctf8OpQikZeHCMiXq/n2/p34ktc3RFGV2DqPU4VY8qIzmC32jcrVJ22aGC
         vyHqfTycL8/j2yzaU0D77/WcK6EXoJj47QlhhHmTDqdeIJZs7L2fdsJZb62r53Bqv4SG
         eTBhjzfFw+UVRGPOaDzvceSO+15gPLSnAK6aCRjQekwDaeEzErfgDJdSYhA3G+o4Uka3
         Zr+g==
X-Forwarded-Encrypted: i=1; AJvYcCU0FU7CKIZa1gpSsRXtdguq9aj5iwZurWv7BT6XMZ5139kB+Fb8G/QbxLpLtRvphp2leisvfyF2AFM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLGIsxlqA37KK4wzykAgn/MExZi9SyyMok3nIq18OW5e1DId4Y
	wV6I9aFGc8mzQp4XJF6B1Q8N6zXr40yIMIvXayWJM8Aw1158OOLzSde5wXCIqAaj4pWTRqbNQ2m
	y4mJwS8pOqfFY9+4gaph1d/+k9j23C1vmPzTgbEZF8XBuogl75cK55LcRS3cqayGQ+cyT
X-Gm-Gg: ASbGncsqlfrtyUJ2fwUy0LpsVlmAwJ1i+6NIUAeadkWETNnIvu2F+EPQnRn9l61GsDr
	CsaVSCHYQxOgc1eBO7dI/Fgi//5VjUQmJWLgohZR+wlssT17ysa86FyOU9MZM3T7fQhgp+MexVv
	66rTpkXUYKDhGRfU1XKthWXpM2q4HGWPXDfYmZfewyEv7oDaEmOwc23AwidPVGMwXKxbKFxzELp
	7+UY9P8JDBiPgD3mLV23zJ3PACoT/N0Lyquun4NuLzYtqUBIRHpOvrJ38ArA7sra7RcWUvIWrV2
	zfYfYGZca9XZHiDEuhLjQwLjZp5GBcsz+R0oHfrPzga0kgVlZlQMABdPpFTzoVXUw2D0p+MHDGP
	1XEtB7keYZpKu4II08l1ETFhxW4hd5CGhmNUCL0qRdebA708zpaAdLSvaZDUAw3aZ
X-Received: by 2002:a05:600c:8209:b0:456:eb9:5236 with SMTP id 5b1f17b1804b1-4563253d35emr65010865e9.15.1752783160755;
        Thu, 17 Jul 2025 13:12:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHauEOdTi1gNn5e67j5pIyWoWtoQZGIdE1jxaf6Cv3U+77VZ32+s2gCNs4Xz5QMDsPlAlc41Q==
X-Received: by 2002:a05:600c:8209:b0:456:eb9:5236 with SMTP id 5b1f17b1804b1-4563253d35emr65010405e9.15.1752783160218;
        Thu, 17 Jul 2025 13:12:40 -0700 (PDT)
Message-ID: <d62fd5c9-6ee1-466f-850b-97046b14ebff@redhat.com>
Date: Thu, 17 Jul 2025 22:12:37 +0200
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <1aef6483-18e6-463b-a197-34dd32dd6fbd@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hpEmRQfiJlMCYb6OPmS9A9lxT4yC8BV4pzELzHxhmmY_1752783161
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>
>> -/*
>> - * vm_normal_page -- This function gets the "struct page" associated with a pte.
>> +/**
>> + * vm_normal_page_pfn() - Get the "struct page" associated with a PFN in a
>> + *			  non-special page table entry.
> 
> This is a bit nebulous/confusing, I mean you'll get PTE entries with PTE special
> bit that'll have a PFN but just no struct page/folio to look at, or should not
> be touched.
> 
> So the _pfn() bit doesn't really properly describe what it does.
> 
> I wonder if it'd be better to just separate out the special handler, have
> that return a boolean indicating special of either form, and then separate
> other shared code separately from that?

Let me think about that; I played with various approaches and this was 
the best I was come up with before running in circles.

> 
>> + * @vma: The VMA mapping the @pfn.
>> + * @addr: The address where the @pfn is mapped.
>> + * @pfn: The PFN.
>> + * @entry: The page table entry value for error reporting purposes.
>>    *
>>    * "Special" mappings do not wish to be associated with a "struct page" (either
>>    * it doesn't exist, or it exists but they don't want to touch it). In this
>> @@ -603,10 +608,10 @@ static void print_bad_page_map(struct vm_area_struct *vma,
>>    * (such as GUP) can still identify these mappings and work with the
>>    * underlying "struct page".
>>    *
>> - * There are 2 broad cases. Firstly, an architecture may define a pte_special()
>> - * pte bit, in which case this function is trivial. Secondly, an architecture
>> - * may not have a spare pte bit, which requires a more complicated scheme,
>> - * described below.
>> + * There are 2 broad cases. Firstly, an architecture may define a "special"
>> + * page table entry bit (e.g., pte_special()), in which case this function is
>> + * trivial. Secondly, an architecture may not have a spare page table
>> + * entry bit, which requires a more complicated scheme, described below.
> 
> Strikes me this bit of the comment should be with vm_normal_page(). As this
> implies the 2 broad cases are handled here and this isn't the case.

Well, pragmatism. Splitting up the doc doesn't make sense. Having it at 
vm_normal_page() doesn't make sense.

I'm sure the educated reader will be able to make sense of it :P

But I'm happy to hear suggestions on how to do it differently :)

> 
>>    *
>>    * A raw VM_PFNMAP mapping (ie. one that is not COWed) is always considered a
>>    * special mapping (even if there are underlying and valid "struct pages").
>> @@ -639,15 +644,72 @@ static void print_bad_page_map(struct vm_area_struct *vma,
>>    * don't have to follow the strict linearity rule of PFNMAP mappings in
>>    * order to support COWable mappings.
>>    *
>> + * This function is not expected to be called for obviously special mappings:
>> + * when the page table entry has the "special" bit set.
> 
> Hmm this is is a bit weird though, saying "obviously" special, because you're
> handling "special" mappings here, but only for architectures that don't specify
> the PTE special bit.
> 
> So it makes it quite nebulous what constitutes 'obviously' here, really you mean
> pte_special().

Yes, I can clarify that.

> 
>> + *
>> + * Return: Returns the "struct page" if this is a "normal" mapping. Returns
>> + *	   NULL if this is a "special" mapping.
>> + */
>> +static inline struct page *vm_normal_page_pfn(struct vm_area_struct *vma,
>> +		unsigned long addr, unsigned long pfn, unsigned long long entry)
>> +{
>> +	/*
>> +	 * With CONFIG_ARCH_HAS_PTE_SPECIAL, any special page table mappings
>> +	 * (incl. shared zero folios) are marked accordingly and are handled
>> +	 * by the caller.
>> +	 */
>> +	if (!IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL)) {
>> +		if (unlikely(vma->vm_flags & (VM_PFNMAP | VM_MIXEDMAP))) {
>> +			if (vma->vm_flags & VM_MIXEDMAP) {
>> +				/* If it has a "struct page", it's "normal". */
>> +				if (!pfn_valid(pfn))
>> +					return NULL;
>> +			} else {
>> +				unsigned long off = (addr - vma->vm_start) >> PAGE_SHIFT;
>> +
>> +				/* Only CoW'ed anon folios are "normal". */
>> +				if (pfn == vma->vm_pgoff + off)
>> +					return NULL;
>> +				if (!is_cow_mapping(vma->vm_flags))
>> +					return NULL;
>> +			}
>> +		}
>> +
>> +		if (is_zero_pfn(pfn) || is_huge_zero_pfn(pfn))
> 
> This handles zero/zero huge page handling for non-pte_special() case
> only. I wonder if we even need to bother having these marked special
> generally since you can just check the PFN every time anyway.

Well, that makes (a) pte_special() a bit weird -- not set for some 
special pages and (b) requires additional runtime checks for the case we 
all really care about -- pte_special().

So I don't think we should change that.

[...]

>>
>> +/**
>> + * vm_normal_folio() - Get the "struct folio" associated with a PTE
>> + * @vma: The VMA mapping the @pte.
>> + * @addr: The address where the @pte is mapped.
>> + * @pte: The PTE.
>> + *
>> + * Get the "struct folio" associated with a PTE. See vm_normal_page_pfn()
>> + * for details.
>> + *
>> + * Return: Returns the "struct folio" if this is a "normal" mapping. Returns
>> + *	   NULL if this is a "special" mapping.
>> + */
> 
> Nice to add a comment, but again feels weird to have the whole explanation in
> vm_normal_page_pfn() but then to invoke vm_normal_page()..

You want people to do pointer chasing to find what they are looking for? :)

-- 
Cheers,

David / dhildenb


