Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C62B11985
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 10:07:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1057474.1425377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDT5-0008OX-4P; Fri, 25 Jul 2025 08:07:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1057474.1425377; Fri, 25 Jul 2025 08:07:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufDT5-0008MR-1j; Fri, 25 Jul 2025 08:07:51 +0000
Received: by outflank-mailman (input) for mailman id 1057474;
 Fri, 25 Jul 2025 08:07:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=50hf=2G=gmail.com=richard.weiyang@srs-se1.protection.inumbo.net>)
 id 1ufDT3-0008Kx-61
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 08:07:49 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7381484a-692e-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 10:07:47 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-60c4521ae2cso3327940a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 25 Jul 2025 01:07:47 -0700 (PDT)
Received: from localhost ([185.92.221.13]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-614cd0d1f85sm1848549a12.4.2025.07.25.01.07.46
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 25 Jul 2025 01:07:46 -0700 (PDT)
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
X-Inumbo-ID: 7381484a-692e-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753430867; x=1754035667; darn=lists.xenproject.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXMaEZZATaqkCZVg69+il4b2i1RIWEG7iB7MnNkYGzI=;
        b=cMlc4Kj9vD3233wSxo7sUxmHC2HC8cqfbB+VnC/jWjJYc6g+GGVb76e7Hje7qMf4Pe
         7SXy1YQoWzIBc92EnJACRoBgW/AdbqEYGQIYETW027OyDi0HTDsWrGqglFeJASeAIunZ
         Cjo+omKmApcJqWXRIYWKLWzDtc3Af0qszZSik/uHbjJo8y8jWFI6m8IsGy50C/nDpdP3
         ebjD8phb2jfyh+Su1xQVfjN6KsikVHG0B/nQ93XhAcvH+jSQuQ7ZeHQcZpkoJMB/cxE1
         4PT/fCpqpF0s3405nwXRR6xHB5PtwUEisRTgVOvLbsZCM0t9Zhw88J0XzsjfSEuKx3yH
         LI+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753430867; x=1754035667;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXMaEZZATaqkCZVg69+il4b2i1RIWEG7iB7MnNkYGzI=;
        b=eZrRM7exGxbufYtSTNT7QhU/GHj6CbwXUeRmurnfZJzbqkKC/qdfLDl2XdQpMdHZ+R
         EB9vpmISPb8HyowzkIqNhdqxT7B72aJtJPh524lieBk/KoJMYe0BxSG7rcyGlDAqnfJZ
         xv4yX7viXg147G0LFaPZ0x1PhfSRjV6chXArahVg3CgeCcvs97Dqvy9hI5atFepPsoS4
         l2m1wuWcixYmZ04Ni3T9apXp6276AhzcIv7QcQzdZTC3Z49KEPpDEFQjGNjjt9qA9dcl
         jMQKJJ1WDKqsGx4H7yPVA6X7PrHqvX7AXCKpO0bUj5cGPAEEV2i+Z5naAGZJ+A8RWG1k
         qiyA==
X-Forwarded-Encrypted: i=1; AJvYcCU+A5bdTTX3UI2/AwnAF79YhYkGyg/hk5G2R+3ve1i9eDFC8TMwg65qEbAr9ms/K9FTc4xdpRfnhLY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzIqiuRYev0zJ9MjxAOuPeqVHGTs5eSFN1Yk6COhAdnC/A4vlXe
	DFhSbOFcWZsWMWBlsqLHsdP8wyveyAh7oKkyw3mUjkh8FWzpqVeCcc53
X-Gm-Gg: ASbGncu9o0AYGM/Ek0rjXSFX2PUXK+qguiv6n38MAYdq59o2ji0LS4GzyjHra32zeH0
	TZdJoiqQUf0zsUIHmXcfKSkCF/ZGwzumLvYDqg05E8qq+ab3Yozhn3/SmiUdQLTMslZ0QIQ3fD4
	YeFpxfz9BFdK3BelC42EOLRu16HME1QHWGNdNL9/Hc+gNgkZA1Jw/A+ayjjVIm+/VTInssIzHuD
	mo3xhNJMVYTNd6pdV5x2iCHcOX0W5kWZ0VQ/XFkDq0oxKwKJjAM22rxYnC8V6TWS91UPO9+9jTn
	Q8yeGKpgdvPhiiZcA4qeMpBuaKFPg0wtUpFK7QhnioQsHq+KFYUrBLCM/kUqoAinwC2jq7ZwDko
	mJc5k9zQordt5OFQBG3nyCw==
X-Google-Smtp-Source: AGHT+IHl6UmUdU8B6e4xhx6Ln8Ji33PC6IYqJ94cYWNmCS+nZAA1Gam8BVTsB8iILWrkEqlErnW5Hg==
X-Received: by 2002:a17:906:7949:b0:ae8:476c:3b85 with SMTP id a640c23a62f3a-af6172034a8mr105706166b.8.1753430866719;
        Fri, 25 Jul 2025 01:07:46 -0700 (PDT)
Date: Fri, 25 Jul 2025 08:07:45 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	xen-devel@lists.xenproject.org, linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>,
	Hugh Dickins <hughd@google.com>, Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v2 3/9] mm/huge_memory: support huge zero folio in
 vmf_insert_folio_pmd()
Message-ID: <20250725080745.clm4s73fqtmsnqsn@master>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20250717115212.1825089-1-david@redhat.com>
 <20250717115212.1825089-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717115212.1825089-4-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)

On Thu, Jul 17, 2025 at 01:52:06PM +0200, David Hildenbrand wrote:
>Just like we do for vmf_insert_page_mkwrite() -> ... ->
>insert_page_into_pte_locked() with the shared zeropage, support the
>huge zero folio in vmf_insert_folio_pmd().
>
>When (un)mapping the huge zero folio in page tables, we neither
>adjust the refcount nor the mapcount, just like for the shared zeropage.
>
>For now, the huge zero folio is not marked as special yet, although
>vm_normal_page_pmd() really wants to treat it as special. We'll change
>that next.
>
>Reviewed-by: Oscar Salvador <osalvador@suse.de>
>Signed-off-by: David Hildenbrand <david@redhat.com>
>---
> mm/huge_memory.c | 8 +++++---
> 1 file changed, 5 insertions(+), 3 deletions(-)
>
>diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>index 849feacaf8064..db08c37b87077 100644
>--- a/mm/huge_memory.c
>+++ b/mm/huge_memory.c
>@@ -1429,9 +1429,11 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
> 	if (fop.is_folio) {
> 		entry = folio_mk_pmd(fop.folio, vma->vm_page_prot);
> 
>-		folio_get(fop.folio);
>-		folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
>-		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
>+		if (!is_huge_zero_folio(fop.folio)) {
>+			folio_get(fop.folio);
>+			folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
>+			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
>+		}

I think this is reasonable.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

> 	} else {
> 		entry = pmd_mkhuge(pfn_pmd(fop.pfn, prot));
> 		entry = pmd_mkspecial(entry);
>-- 
>2.50.1
>

-- 
Wei Yang
Help you, Help me

