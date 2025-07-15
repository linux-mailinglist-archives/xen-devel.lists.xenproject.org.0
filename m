Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB5BB05BCE
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:24:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044061.1414110 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdX-0003yn-N6; Tue, 15 Jul 2025 13:23:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044061.1414110; Tue, 15 Jul 2025 13:23:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfdX-0003wl-KC; Tue, 15 Jul 2025 13:23:59 +0000
Received: by outflank-mailman (input) for mailman id 1044061;
 Tue, 15 Jul 2025 13:23:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVo=Z4=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ubfdW-0003wf-VA
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:23:58 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f536e517-617e-11f0-b894-0df219b8e170;
 Tue, 15 Jul 2025 15:23:56 +0200 (CEST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-7QYQeN4INk2pQhBGsIS_og-1; Tue, 15 Jul 2025 09:23:54 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a50049f8eeso2449814f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 06:23:53 -0700 (PDT)
Received: from localhost
 (p200300d82f2849002c244e201f219fbd.dip0.t-ipconnect.de.
 [2003:d8:2f28:4900:2c24:4e20:1f21:9fbd])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b5e8e14e82sm15213383f8f.71.2025.07.15.06.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 06:23:51 -0700 (PDT)
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
X-Inumbo-ID: f536e517-617e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752585835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=I+njjEeJUfoyHVChoDSaOpmOHc6CwMwYKPYbj7nDuS0=;
	b=M5cq5ieS9rO+feWcHJHj9JnVBYteNMjQ5AoUJMO0myQCcEgCEo2RkImDrxad3etoNo3Mkw
	56gNSP/CgfaDijdRluJP6h8AEHilziODhcfWbt4+Dr47vJqt0IrkAI9f8ESbv+JlGtHuEy
	CkjurXOnxOtlVzgBqF0Op30HqXOF7ow=
X-MC-Unique: 7QYQeN4INk2pQhBGsIS_og-1
X-Mimecast-MFC-AGG-ID: 7QYQeN4INk2pQhBGsIS_og_1752585833
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585833; x=1753190633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I+njjEeJUfoyHVChoDSaOpmOHc6CwMwYKPYbj7nDuS0=;
        b=OfIsR+h12QZQhf1TQEsxixcpqS2UT5QSNXnF5YWZ1dlh8zFAvuAB3EnEhulOGXHFsK
         eJXHUxQFH9PpCNQvo0+r3NYAM6K0RvJk0WCdXlzVbaiB9bscYkZ8jyyxxe0ZcWMuG1/I
         rZXsd2RpGjegtvdNUCx6QSi7uB7monh47DD+VtLREd511AGgdFFeyF04oRx4kz85sSMd
         Y7dQAq+5cgK5ER00iIB2kKUemqA2W9frzImtZ/FoILABMUWlxi/5G7HLT/E8k7TmzVii
         Kk2nk/bL6pRaKGZInUgMhpbFoOaxwzqvWZw/4OhiQVN6D/0jqk+mtIDHtULn76DwgAQ+
         pWcA==
X-Forwarded-Encrypted: i=1; AJvYcCVF8FepLPUQXNrol1QJ0PgxRG+ZwtwWIMOrPa/RY8O6tvV0gQAQbNCiSEx9YNVnZevjof0AjhyebTY=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyS0lfHXI9G74ayQoF1piwWfS5nVgT4FW7ETHooQfAZrn+QC5IC
	lr9qPdvvmXwwr3k6K/Ov/E69OUXsHiUSN9QpXKZRyPGKyQvwWW1d8uVCxaTiRs9giRPGpl4jFr8
	Vr9L7b0R/DwZ2G4GwBemm28UTf/a3qrp/rPrJBMWScV8nt6mDXB4ztcmB1CTqpoxwwIqo
X-Gm-Gg: ASbGnctB0uqWa706NGfvhXwHOPrdaJF+Pnu5Ul4+R1bFkjGu/YgXdCKGNIlpZVjEnvz
	sTGkfgX3aIhdEGYCvfUWsoDq2BiMtBWoWb8vZfORteHxRtQtJQqHfbLZXdOPNgdtS2TMO6I1U6W
	sSpspnGxQvwm3IbzuUAjTfss/7czRUfzB7lG1wYUlXLdJ6dmdpUJfWLUc2z7oJCMG61wH9logwf
	bITTrXyJtbarFGhaO6LIo6hdj0Q34SWujH05bVb56YGhSSdXjPp4zRytLVddCKh5cEL2w+Rd0qB
	Nlw8eIBCEY3Ov1aGHwppUFbIPW5ZDqO97jvHcfaokw+89yxgEm6gPTNgVIm4DCD4jicPWsDDPMz
	9YnOMVOHgnpZCm8lOgckbGshc
X-Received: by 2002:adf:9b97:0:b0:3a5:7944:c9b with SMTP id ffacd0b85a97d-3b5f18808c9mr9743520f8f.16.1752585832773;
        Tue, 15 Jul 2025 06:23:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEkZDRkA14IcXQD+lQPeKL7StailaRmICkp2BJ1WOb6DFxYeWLDyvLUcHDBHF9Bf7MHtKqWA==
X-Received: by 2002:adf:9b97:0:b0:3a5:7944:c9b with SMTP id ffacd0b85a97d-3b5f18808c9mr9743472f8f.16.1752585832205;
        Tue, 15 Jul 2025 06:23:52 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Hugh Dickins <hughd@google.com>,
	Oscar Salvador <osalvador@suse.de>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v1 0/9] mm: vm_normal_page*() improvements
Date: Tue, 15 Jul 2025 15:23:41 +0200
Message-ID: <20250715132350.2448901-1-david@redhat.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5CqF7gejolS1Y3VE-2BYaGJRqiQAeifZU3R__BZz7Wk_1752585833
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

This is the follow-up of [1]:
	[PATCH RFC 00/14] mm: vm_normal_page*() + CoW PFNMAP improvements

Based on mm/mm-new. I dropped the CoW PFNMAP changes for now, still
working on a better way to sort all that out cleanly.

Cleanup and unify vm_normal_page_*() handling, also marking the
huge zerofolio as special in the PMD. Add+use vm_normal_page_pud() and
cleanup that XEN vm_ops->find_special_page thingy.

There are plans of using vm_normal_page_*() more widely soon.

Briefly tested on UML (making sure vm_normal_page() still works as expected
without pte_special() support) and on x86-64 with a bunch of tests.

[1] https://lkml.kernel.org/r/20250617154345.2494405-1-david@redhat.com

RFC -> v1:
* Dropped the highest_memmap_pfn removal stuff and instead added
  "mm/memory: convert print_bad_pte() to print_bad_page_map()"
* Dropped "mm: compare pfns only if the entry is present when inserting
  pfns/pages" for now, will probably clean that up separately.
* Dropped "mm: remove "horrible special case to handle copy-on-write
  behaviour"", and "mm: drop addr parameter from vm_normal_*_pmd()" will
  require more thought
* "mm/huge_memory: support huge zero folio in vmf_insert_folio_pmd()"
 -> Extend patch description.
* "fs/dax: use vmf_insert_folio_pmd() to insert the huge zero folio"
 -> Extend patch description.
* "mm/huge_memory: mark PMD mappings of the huge zero folio special"
 -> Remove comment from vm_normal_page_pmd().
* "mm/memory: factor out common code from vm_normal_page_*()"
 -> Adjust to print_bad_page_map()/highest_memmap_pfn changes.
 -> Add proper kernel doc to all involved functions
* "mm: introduce and use vm_normal_page_pud()"
 -> Adjust to print_bad_page_map() changes.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Jan Kara <jack@suse.cz>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Jann Horn <jannh@google.com>
Cc: Pedro Falcato <pfalcato@suse.de>
Cc: Hugh Dickins <hughd@google.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lance Yang <lance.yang@linux.dev>

David Hildenbrand (9):
  mm/huge_memory: move more common code into insert_pmd()
  mm/huge_memory: move more common code into insert_pud()
  mm/huge_memory: support huge zero folio in vmf_insert_folio_pmd()
  fs/dax: use vmf_insert_folio_pmd() to insert the huge zero folio
  mm/huge_memory: mark PMD mappings of the huge zero folio special
  mm/memory: convert print_bad_pte() to print_bad_page_map()
  mm/memory: factor out common code from vm_normal_page_*()
  mm: introduce and use vm_normal_page_pud()
  mm: rename vm_ops->find_special_page() to vm_ops->find_normal_page()

 drivers/xen/Kconfig              |   1 +
 drivers/xen/gntdev.c             |   5 +-
 fs/dax.c                         |  47 +----
 include/linux/mm.h               |  20 +-
 mm/Kconfig                       |   2 +
 mm/huge_memory.c                 | 119 ++++-------
 mm/memory.c                      | 346 ++++++++++++++++++++++---------
 mm/pagewalk.c                    |  20 +-
 tools/testing/vma/vma_internal.h |  18 +-
 9 files changed, 343 insertions(+), 235 deletions(-)


base-commit: 64d19a2cdb7b62bcea83d9309d83e06d7aff4722
-- 
2.50.1


