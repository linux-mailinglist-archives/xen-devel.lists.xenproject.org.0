Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 724A6B095BE
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 22:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1047479.1417968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucVGX-0001d1-Nb; Thu, 17 Jul 2025 20:31:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1047479.1417968; Thu, 17 Jul 2025 20:31:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucVGX-0001ae-KS; Thu, 17 Jul 2025 20:31:41 +0000
Received: by outflank-mailman (input) for mailman id 1047479;
 Thu, 17 Jul 2025 20:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0s4=Z6=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ucVGV-0001aY-K3
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 20:31:39 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 090709e1-634d-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 22:31:37 +0200 (CEST)
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-iOzK6xTfNaG0B384RADItg-1; Thu, 17 Jul 2025 16:31:32 -0400
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4e713e05bso681158f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 13:31:32 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f35:2b00:b1a5:704a:6a0c:9ae?
 (p200300d82f352b00b1a5704a6a0c09ae.dip0.t-ipconnect.de.
 [2003:d8:2f35:2b00:b1a5:704a:6a0c:9ae])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e7f4289sm60881935e9.7.2025.07.17.13.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 13:31:30 -0700 (PDT)
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
X-Inumbo-ID: 090709e1-634d-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752784296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wdJcKQDQ4sesr9sR1PHs3Eav2q9b1afpxqhEJb8a738=;
	b=OJlSUqSloT9KYgW/wGNxyAUckGGArC66inzh2kzDzeNDdXKm9Grpz816PoNJYtt/MgLsXp
	Sbww9BkoNbH2bRk28VSay9oLQbtXWA9KSxYgVxNHlsldeocf5MYM4utZvdjT6Q6O4BIqBj
	tIWtPewHkpqRgdkdA49+7v6KA/Sp7nk=
X-MC-Unique: iOzK6xTfNaG0B384RADItg-1
X-Mimecast-MFC-AGG-ID: iOzK6xTfNaG0B384RADItg_1752784292
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752784291; x=1753389091;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wdJcKQDQ4sesr9sR1PHs3Eav2q9b1afpxqhEJb8a738=;
        b=S2p/JkxSTAoRrsLV73CDGmeJ1X3Tn6P8+FC2YAnlQOb7kY8UIRkWf3xM/zFYMPEWDG
         036v6PcFAsRz93gHZKs27NdzQVfvpM2VGPPi438hmZ+w1rGTzcA3CDwp4lZ4TAwf0F9g
         7CFWrHBBgIUz411mV23Jlkk0HjFp0wjXFq9FUFzfNLakYhmrf2vVbn4xb0aNNMYuVkvJ
         nr+UP8qzSLdD6oPA2FeJlZLohM57bbvvodTuCNrDGeZJ+dWihCT7MaMdlGznNxPS3fOw
         jWHMOSMVm8ItxCM7qWJ4P3RfA3JoHBQtzv+Z6CHcI5Gh6l7gD+rQhbxdiVG2sR+adJeR
         EHyw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ8a08QtfdhjTfwiZiODTFNfRHtSNNaMEZV8epoT8h5p7+Uwv01BCYCwMFdFjMJZZjjmuWvquDsP4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzyKm+5pZGyTOQViJsJL2QlWrE971nh9ZjW/g5tBESmnBXfVfZd
	gc9DjHdwOYKsJgig3BxOxA1ujcwVZDfmyBYeGSyN6sxEc6w5QbNJsRkZLSuVSW2Nu/eZpt9bSii
	cFqV/fxWRR4xATj/leY42bhNkmOJ/J+E59oJfdfdwnKEWcecf6De5dSUO66bIV+vpAuq/
X-Gm-Gg: ASbGnctya20vLNTM04v4EEO39DZHaKrOEU1d0NG/wNZnPrJ+HONPzhUTNPmGOlp+lya
	bO4rmxw/7tHtU5jSkP4sfOfOHatGAX23COn07QmVHyxgz6i74mL8C6wGnKNiWTfMPXYkiCjDVh1
	mJ9uWXXTIgboXQGnQ08ZOWOf1iGjWk3Nyx9i6j7/m3EhJblkkaJb5pIVI9e1wrF5jrFbZOPThdu
	zfKTGI8Ijg58KXZ/KxR6brST0f/xyVq9g3SSJ5OVazSRSB+bQumA0too2aP2BpmOcmUNrOshpih
	aL+NINYzaOoV8enLC3kYSgac5uglDkn6RrcOMYF8c+N3iCvi7zkEnWf9spg6h5bs5qxPV+C2GeB
	xODZlAF5/yDM4/wIcxe/EIswF2rb0r0L98TMxg0Yf59jpxwr8VVI0N2crq+ioz29G
X-Received: by 2002:a05:6000:490c:b0:3a4:d02e:84af with SMTP id ffacd0b85a97d-3b60e5531d6mr5324989f8f.58.1752784291431;
        Thu, 17 Jul 2025 13:31:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIXuB/mCdSLCE80mgA6xcOKmEIZL5NFnU1Qt11L0ORhR2cLptcTnShZQeEWrqbZqx0e0NMtA==
X-Received: by 2002:a05:6000:490c:b0:3a4:d02e:84af with SMTP id ffacd0b85a97d-3b60e5531d6mr5324966f8f.58.1752784290908;
        Thu, 17 Jul 2025 13:31:30 -0700 (PDT)
Message-ID: <7701f2e8-ae17-4367-b260-925d1d3cd4df@redhat.com>
Date: Thu, 17 Jul 2025 22:31:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] mm/huge_memory: mark PMD mappings of the huge zero
 folio special
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
 <20250717115212.1825089-6-david@redhat.com>
 <46c9a90c-46b8-4136-9890-b9b2b97ee1bb@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <46c9a90c-46b8-4136-9890-b9b2b97ee1bb@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CAXnZ3QvK2BnTz1E2QhxcwtGJWJRpj_5W-c3oK9ZgdA_1752784292
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.07.25 20:29, Lorenzo Stoakes wrote:
> On Thu, Jul 17, 2025 at 01:52:08PM +0200, David Hildenbrand wrote:
>> The huge zero folio is refcounted (+mapcounted -- is that a word?)
>> differently than "normal" folios, similarly (but different) to the ordinary
>> shared zeropage.
> 
> Yeah, I sort of wonder if we shouldn't just _not_ do any of that with zero
> pages?

I wish we could get rid of the weird refcounting of the huge zero folio 
and get rid of the shrinker. But as long as the shrinker exists, I'm 
afraid that weird per-process refcounting must stay.

> 
> But for some reason the huge zero page wants to exist or not exist based on
> usage for one. Which is stupid to me.

Yes, I will try at some point (once we have the static huge zero folio) 
to remove the shrinker part and make it always static. Well, at least 
for reasonable architectures.

> 
>>
>> For this reason, we special-case these pages in
>> vm_normal_page*/vm_normal_folio*, and only allow selected callers to
>> still use them (e.g., GUP can still take a reference on them).
>>
>> vm_normal_page_pmd() already filters out the huge zero folio. However,
>> so far we are not marking it as special like we do with the ordinary
>> shared zeropage. Let's mark it as special, so we can further refactor
>> vm_normal_page_pmd() and vm_normal_page().
>>
>> While at it, update the doc regarding the shared zero folios.
> 
> Hmm I wonder how this will interact with the static PMD series at [0]?

No, it shouldn't.

> 
> I wonder if more use of that might result in some weirdness with refcounting
> etc.?

I don't think so.

> 
> Also, that series was (though I reviewed against it) moving stuff that
> references the huge zero folio out of there, but also generally allows
> access and mapping of this folio via largest_zero_folio() so not only via
> insert_pmd().
> 
> So we're going to end up with mappings of this that are not marked special
> that are potentially going to have refcount/mapcount manipulation that
> contradict what you're doing here perhaps?

I don't think so. It's just like having the existing static (small) 
shared zeropage where the same rules about refcounting+mapcounting apply.

> 
> [0]: https://lore.kernel.org/all/20250707142319.319642-1-kernel@pankajraghav.com/
> 
>>
>> Reviewed-by: Oscar Salvador <osalvador@suse.de>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> I looked thorugh places that use vm_normal_page_pm() (other than decl of
> function):
> 
> fs/proc/task_mmu.c - seems to handle NULL page correctly + still undertsands zero page
> mm/pagewalk.c - correctly handles NULL page + huge zero page
> mm/huge_memory.c - can_change_pmd_writable() correctly returns false.
> 
> And all seems to work wtih this change.
> 
> Overall, other than concerns above + nits below LGTM, we should treat all
> the zero folios the same in this regard, so:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks!

> 
>> ---
>>   mm/huge_memory.c |  5 ++++-
>>   mm/memory.c      | 14 +++++++++-----
>>   2 files changed, 13 insertions(+), 6 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index db08c37b87077..3f9a27812a590 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1320,6 +1320,7 @@ static void set_huge_zero_folio(pgtable_t pgtable, struct mm_struct *mm,
>>   {
>>   	pmd_t entry;
>>   	entry = folio_mk_pmd(zero_folio, vma->vm_page_prot);
>> +	entry = pmd_mkspecial(entry);
>>   	pgtable_trans_huge_deposit(mm, pmd, pgtable);
>>   	set_pmd_at(mm, haddr, pmd, entry);
>>   	mm_inc_nr_ptes(mm);
>> @@ -1429,7 +1430,9 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
>>   	if (fop.is_folio) {
>>   		entry = folio_mk_pmd(fop.folio, vma->vm_page_prot);
>>
>> -		if (!is_huge_zero_folio(fop.folio)) {
>> +		if (is_huge_zero_folio(fop.folio)) {
>> +			entry = pmd_mkspecial(entry);
>> +		} else {
>>   			folio_get(fop.folio);
>>   			folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
>>   			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 92fd18a5d8d1f..173eb6267e0ac 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -537,7 +537,13 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
>>    *
>>    * "Special" mappings do not wish to be associated with a "struct page" (either
>>    * it doesn't exist, or it exists but they don't want to touch it). In this
>> - * case, NULL is returned here. "Normal" mappings do have a struct page.
>> + * case, NULL is returned here. "Normal" mappings do have a struct page and
>> + * are ordinarily refcounted.
>> + *
>> + * Page mappings of the shared zero folios are always considered "special", as
>> + * they are not ordinarily refcounted. However, selected page table walkers
>> + * (such as GUP) can still identify these mappings and work with the
>> + * underlying "struct page".
> 
> I feel like we need more detail or something more explicit about what 'not
> ordinary' refcounting constitutes. This is a bit vague.

Hm, I am not sure this is the correct place to document that. But let me 
see if I can come up with something reasonable

(like, the refcount and mapcount of these folios is never adjusted when 
mapping them into page tables)

> 
>>    *
>>    * There are 2 broad cases. Firstly, an architecture may define a pte_special()
>>    * pte bit, in which case this function is trivial. Secondly, an architecture
>> @@ -567,9 +573,8 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
>>    *
>>    * VM_MIXEDMAP mappings can likewise contain memory with or without "struct
>>    * page" backing, however the difference is that _all_ pages with a struct
>> - * page (that is, those where pfn_valid is true) are refcounted and considered
>> - * normal pages by the VM. The only exception are zeropages, which are
>> - * *never* refcounted.
>> + * page (that is, those where pfn_valid is true, except the shared zero
>> + * folios) are refcounted and considered normal pages by the VM.
>>    *
>>    * The disadvantage is that pages are refcounted (which can be slower and
>>    * simply not an option for some PFNMAP users). The advantage is that we
>> @@ -649,7 +654,6 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
> 
> You know I"m semi-ashamed to admit I didn't even know this function
> exists. But yikes that we have a separate function like this just for PMDs.

It's a bit new-ish :)


-- 
Cheers,

David / dhildenb


