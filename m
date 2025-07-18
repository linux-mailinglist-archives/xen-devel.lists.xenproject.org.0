Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD11B0A13B
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jul 2025 12:55:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1048456.1418683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucijn-0007Hs-Mr; Fri, 18 Jul 2025 10:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1048456.1418683; Fri, 18 Jul 2025 10:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucijn-0007FK-Jz; Fri, 18 Jul 2025 10:54:47 +0000
Received: by outflank-mailman (input) for mailman id 1048456;
 Fri, 18 Jul 2025 10:54:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JDB3=Z7=redhat.com=david@srs-se1.protection.inumbo.net>)
 id 1ucijm-0007EW-8u
 for xen-devel@lists.xenproject.org; Fri, 18 Jul 2025 10:54:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9cdb950b-63c5-11f0-a319-13f23c93f187;
 Fri, 18 Jul 2025 12:54:44 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-BIXEjuZkOHeV9vyt9ncM6w-1; Fri, 18 Jul 2025 06:54:42 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-455eda09c57so12929205e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 18 Jul 2025 03:54:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f43:8900:f364:1333:2a67:d49e?
 (p200300d82f438900f36413332a67d49e.dip0.t-ipconnect.de.
 [2003:d8:2f43:8900:f364:1333:2a67:d49e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4562e886104sm76981725e9.25.2025.07.18.03.54.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Jul 2025 03:54:39 -0700 (PDT)
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
X-Inumbo-ID: 9cdb950b-63c5-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752836083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9x+6SNZ1rUKJhJRi0vlqrQwvBIRb+ESC1w/j4s3Egps=;
	b=UsxZeLdO9oSjDAlxPuDdH8yl32QLLuebbx9TRpKTZE0uGxmSG85wDv1ehjQpil4req4kkM
	+tXPJkCvTFSChy3pV678zS5tGD/K3IEHLPG4AwmKRd5Jp+0VmKlKqp3DIBh12KeP07Nh07
	xsjCRuTKARwoHI1Vm5alTGctdWQqXi0=
X-MC-Unique: BIXEjuZkOHeV9vyt9ncM6w-1
X-Mimecast-MFC-AGG-ID: BIXEjuZkOHeV9vyt9ncM6w_1752836081
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752836081; x=1753440881;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9x+6SNZ1rUKJhJRi0vlqrQwvBIRb+ESC1w/j4s3Egps=;
        b=HhqZGHxC+0xmmN2Ry3tUdp7JftCrC7B8yZ8wyqYtrC4bha7Bq/8XGWocdD/EzfCXle
         qB95n4/PkDLjkvMEdYPxkIqH1uBD3lr43NOs66w7u5ssw5HXqBeL599DVqG2O3pt1cZR
         wjTf2v0ZUIGeeMfpxzKnR4Zxh50VC/49haoBoo0nkPt88KEpUgrUmtJrVhPBBqoheddN
         hwQMUUUStKEGOCgZD72oThzKSR59sFIsglMqP2dNRpCexHsGbAn4GryakqC7MIyghoZ/
         JZyZPQ0wM1ZVsAU3GHcvuSWclXXiPnbe0Nkbd0d5FDAaWEvhV3PekDIbzx1Urp3FZkHM
         ZBUg==
X-Forwarded-Encrypted: i=1; AJvYcCWlXLySMTAcB1n0zO6RXbSWRz34NycmCnqySUf5PJFekXYN4jbY/BWch83tT3iZrse4irrOlpgWr+w=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYTIpyaAxcTG5Dd2gVkOY7mDyo5O+gGQ5taJ3Jm0FEMIyAs8KQ
	KxR32KYoZ9dUkbaRbA2KTlys3UEyTC9NvD/4Sq/dFMqIzjx5Ft/lOGvBUeuuA7cSqBmMrXRJXgU
	5jSuet8dJz/m7LUiSjT57oMR5IujQ5nRlmRJ+Rf0mtci2qJOcrX9dp7Mds/uyMqPHrbQd
X-Gm-Gg: ASbGncsIs85VjscAJXoV0PcVmTgmqdgh0FXl8BLD6BN4ZVLwDu4NVBXysSOh/Xc0rO6
	smc8oP9aNnrtrweOXw3ojuyC/hMwKdWZLTMYhv9SeExMk7qn54aymTbHlabZ1M/HuHZlmenAGd8
	EZ93vD0+TyAlOJwUgzvkaoDtrU4yhbs8/PlhL3zTy+K15PI1ZCxkneGjCw+f3OVEiezqlnTGGWh
	TJUPQm3k+Vty1FAySk3O62EgghVRm7O4nm548K4bLoCOeFWttt8Wp4YYOdwQozujlHIfLHCYXiV
	DCoFExYsAFZ2aCNldUkaPvyuty3h3PLRe66vcRZQ8qndQAKpEy0NIhNGI79SMNdDMvXDHkRykco
	NBxN/zP2fCV1N6W5H2EAXk0JboUjAJmWIBRgDoj2Q7quk2jL/7dZVG4RteOmE+eF/eOw=
X-Received: by 2002:a05:600c:4e4a:b0:456:1f89:2483 with SMTP id 5b1f17b1804b1-4562e391fa5mr84761175e9.26.1752836081011;
        Fri, 18 Jul 2025 03:54:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjQqxYszJ86M7j2Ywj9XErK7h/2M4wutBxbbGwenrhGaPC0WvCUT5o+u11Z+VyIFbNK+nV8Q==
X-Received: by 2002:a05:600c:4e4a:b0:456:1f89:2483 with SMTP id 5b1f17b1804b1-4562e391fa5mr84760905e9.26.1752836080442;
        Fri, 18 Jul 2025 03:54:40 -0700 (PDT)
Message-ID: <8292201e-0ca2-4a2a-b2a7-02391cbf7556@redhat.com>
Date: Fri, 18 Jul 2025 12:54:38 +0200
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
 <7701f2e8-ae17-4367-b260-925d1d3cd4df@redhat.com>
 <9184274d-2ae8-4949-a864-79693308bf56@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <9184274d-2ae8-4949-a864-79693308bf56@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h-wnRytN8_JnTw2UJ50pKnt9p85w5apNFDMQ1LhPa60_1752836081
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.07.25 12:41, Lorenzo Stoakes wrote:
> On Thu, Jul 17, 2025 at 10:31:28PM +0200, David Hildenbrand wrote:
>> On 17.07.25 20:29, Lorenzo Stoakes wrote:
>>> On Thu, Jul 17, 2025 at 01:52:08PM +0200, David Hildenbrand wrote:
>>>> The huge zero folio is refcounted (+mapcounted -- is that a word?)
>>>> differently than "normal" folios, similarly (but different) to the ordinary
>>>> shared zeropage.
>>>
>>> Yeah, I sort of wonder if we shouldn't just _not_ do any of that with zero
>>> pages?
>>
>> I wish we could get rid of the weird refcounting of the huge zero folio and
>> get rid of the shrinker. But as long as the shrinker exists, I'm afraid that
>> weird per-process refcounting must stay.
> 
> Does this change of yours cause any issue with it? I mean now nothing can grab
> this page using vm_normal_page_pmd(), so it won't be able to manipulate
> refcounts.

Please look again at vm_normal_page_pmd(): we have a manual 
huge_zero_pfn() check in there! There is no change in behavior. :)

It's not obvious from the diff below. But huge zero folio was considered 
special before this change, just not marked accordingly.

>>
>>>
>>>>
>>>> For this reason, we special-case these pages in
>>>> vm_normal_page*/vm_normal_folio*, and only allow selected callers to
>>>> still use them (e.g., GUP can still take a reference on them).
>>>>
>>>> vm_normal_page_pmd() already filters out the huge zero folio. However,
>>>> so far we are not marking it as special like we do with the ordinary
>>>> shared zeropage. Let's mark it as special, so we can further refactor
>>>> vm_normal_page_pmd() and vm_normal_page().
>>>>
>>>> While at it, update the doc regarding the shared zero folios.
>>>
>>> Hmm I wonder how this will interact with the static PMD series at [0]?
>>
>> No, it shouldn't.
> 
> I'm always nervous about these kinds of things :)
> 
> I'm assuming the reference/map counting will still work properly with the static
> page?

Let me stress again: no change in behavior besides setting the special 
flag in this patch. Return value of vm_normal_page_pmd() is not changed.

>>>
>>> Also, that series was (though I reviewed against it) moving stuff that
>>> references the huge zero folio out of there, but also generally allows
>>> access and mapping of this folio via largest_zero_folio() so not only via
>>> insert_pmd().
>>>
>>> So we're going to end up with mappings of this that are not marked special
>>> that are potentially going to have refcount/mapcount manipulation that
>>> contradict what you're doing here perhaps?
>>
>> I don't think so. It's just like having the existing static (small) shared
>> zeropage where the same rules about refcounting+mapcounting apply.
> 
> It feels like all this is a mess... am I missing something that would make it
> all make sense?

Let me clarify:

The small zeropage is never refcounted+mapcounted when mapped into page 
tables.

The huge zero folio is never refcounted+mapcounted when mapped into page 
tables EXCEPT it is refcounted in a weird different when first mapped 
into a process.

The whole reason is the shrinker. I don't like it, but there was a 
reason it was added. Maybe that reason no longer exists, but that's 
nothing that this patch series is concerned with, really. :)

-- 
Cheers,

David / dhildenb


