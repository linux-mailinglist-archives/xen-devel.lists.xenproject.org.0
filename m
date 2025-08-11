Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF00B2079D
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:26:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077377.1438436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQfq-0005mG-6I; Mon, 11 Aug 2025 11:26:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077377.1438436; Mon, 11 Aug 2025 11:26:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQfq-0005jO-28; Mon, 11 Aug 2025 11:26:42 +0000
Received: by outflank-mailman (input) for mailman id 1077377;
 Mon, 11 Aug 2025 11:26:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gc+J=2X=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ulQfo-0005jI-GH
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:26:40 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b8341de-76a6-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 13:26:38 +0200 (CEST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-73juwwmYPlytD73zY6wTZg-1; Mon, 11 Aug 2025 07:26:36 -0400
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3b78329f180so2068216f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:26:36 -0700 (PDT)
Received: from localhost
 (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de.
 [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3b79c3c4beasm39217323f8f.30.2025.08.11.04.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:26:33 -0700 (PDT)
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
X-Inumbo-ID: 0b8341de-76a6-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911597;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gjYKWewbFPIH0RV/ky7WxO7hTalH23xVuPMUQKkA/fk=;
	b=b9N4yw0qMi0C8VmE0T8CzhuELAtoRudiBaBzoe2QxuU0jGyQZeVcsguuEgSKWiNTzYZlmD
	Qqbex8QzN7gqvjsJMa1MbWNJJr0hHw1MEWUxVgVlR8Fn/+nFpClSj6NhO3CuAgGkWx+0UA
	FR0tB7Bn/9Vw2hKooJuAhpDPIVgwpUo=
X-MC-Unique: 73juwwmYPlytD73zY6wTZg-1
X-Mimecast-MFC-AGG-ID: 73juwwmYPlytD73zY6wTZg_1754911595
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911595; x=1755516395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjYKWewbFPIH0RV/ky7WxO7hTalH23xVuPMUQKkA/fk=;
        b=QEQ4lDuK4lK6KA4N6vHoFcDsHCI9F2BZoZly0zPqcvChAMeDP5A72dquM7Y1BHB+b6
         Xfp5esb94famjTsg0ZdtqaLdChLnkRZFDYz2L/0hOVTwtCAYUg3e1fXeOdjEm4No2wvx
         aIXZOG1zA9dW2BE0lxR0eXr7zrQoIDeK2JuP8qKfaQ0BHfe9MK32XajRSlBXzu8ORuIJ
         yC7AmnyLY1SFFhvYHb0Jm3ctu9LCrHvqEu+/+64LBzCflL0349EwZ+sCz2CwVi7IF4X9
         FsYPYg2rX6Ov+PxzPRlXPjAR9M7Xavz5bKfG85wZSExMsN5XANEVjnbnV1kxgTC0pVYD
         FITw==
X-Forwarded-Encrypted: i=1; AJvYcCUZdIU+1tg4OZO99Qd8GBMmPEuI+/GaMuKabyedENjVkShDlMtcwbWbpiLNxnqLscZitykOHyWMVdg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyOGmEGqbN/ch+WSudT546QeI7s6Cu0k3MVjrIl8LO8/aaBJaEv
	7bfkbi5PUSOgxkR2P7I4eagd7Zdhy/zJRxb649l0O9RiQAGWB2ts0WelzxwH5q3nCBbe88IcvGV
	iGPJDxf6qLIw0Mo6r6PjhewYRlnttizriHxgwyQHF9w2j0KUeKn9ZmvjnkHFlIy6ynsT2
X-Gm-Gg: ASbGncum7bFyWWFyRLW7+9nSB5Nnodbth1FHiRo2gLAsFz9Zl0nTTgdYiuQubd6QIEa
	ShNc6rZk7zCploVbrnJ/PYY49FYwrKcOoz3CkYTAS8yvkhW1nphWt8blEJZ6MP60GBn+bwDNMth
	91L5Rq0KnbVJ47PiIEEZ5/Z2oEv9l9ZwUUghqHk29k0xXiLBQ1xlhIN7nw3vIWeByzaquiYc35Z
	0IiSpn5gtF86PI98dR8+pBdYBJljzRHg/WJfORl9RHpYv9ghiy87+g0nK3hhk/3V66ZmaLepToK
	oYmRKUbnC03fDkGIpsHAtg7W1BLIXQYwD37spcm+bYxUFKnYXZkaY3YBeIbuZ4SC9EMiEcZ27b5
	S8AynICseYU3l42OCt/XB78n8
X-Received: by 2002:a05:6000:2f85:b0:3b7:8d70:e0ad with SMTP id ffacd0b85a97d-3b900b4d8c1mr8490180f8f.32.1754911594904;
        Mon, 11 Aug 2025 04:26:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdQyxmL2k0hEit4q6ggWaLK63vDyy/XYp/bptTEvLLiDZ4Kssrq6afY7SHtzCWpxX9HX5tXQ==
X-Received: by 2002:a05:6000:2f85:b0:3b7:8d70:e0ad with SMTP id ffacd0b85a97d-3b900b4d8c1mr8490151f8f.32.1754911594303;
        Mon, 11 Aug 2025 04:26:34 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	xen-devel@lists.xenproject.org,
	linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
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
Subject: [PATCH v3 00/11] mm: vm_normal_page*() improvements
Date: Mon, 11 Aug 2025 13:26:20 +0200
Message-ID: <20250811112631.759341-1-david@redhat.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lZMQmXNCsXVopIRX4hN-CD5oazmRptcrTEc3Z9Psknw_1754911595
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Based on mm/mm-new from today.

Cleanup and unify vm_normal_page_*() handling, also marking the
huge zerofolio as special in the PMD. Add+use vm_normal_page_pud() and
cleanup that XEN vm_ops->find_special_page thingy.

There are plans of using vm_normal_page_*() more widely soon.

Briefly tested on UML (making sure vm_normal_page() still works as expected
without pte_special() support) and on x86-64 with a bunch of tests.
Cross-compiled for a variety of weird archs.

v2 -> v3:
* "mm/huge_memory: mark PMD mappings of the huge zero folio special"
 -> Extend vm_normal_page_pmd() comment + patch description
 -> Take care of copy_huge_pmd() checking for pmd_special().
* "powerpc/ptdump: rename "struct pgtable_level" to "struct ptdump_pglevel""
 -> Added
* "mm/rmap: convert "enum rmap_level" to "enum pgtable_level""
 -> Added
* "mm/memory: convert print_bad_pte() to print_bad_page_map()"
 -> Consume level so we can keep the level indication through
    pgtable_level_to_str().
 -> Improve locking comments
* "mm/memory: factor out common code from vm_normal_page_*()"
 -> Factor everything out into __vm_normal_page() and let it consume the
    special bit + pfn (and the value+level for error reporting purposes)
 -> Improve function docs
 -> Improve patch description

v1 -> v2:
* "mm/memory: convert print_bad_pte() to print_bad_page_map()"
 -> Don't use pgdp_get(), because it's broken on some arm configs
 -> Extend patch description
 -> Don't use pmd_val(pmdp_get()), because that doesn't work on some
    m68k configs
* Added RBs

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
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
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

David Hildenbrand (11):
  mm/huge_memory: move more common code into insert_pmd()
  mm/huge_memory: move more common code into insert_pud()
  mm/huge_memory: support huge zero folio in vmf_insert_folio_pmd()
  fs/dax: use vmf_insert_folio_pmd() to insert the huge zero folio
  mm/huge_memory: mark PMD mappings of the huge zero folio special
  powerpc/ptdump: rename "struct pgtable_level" to "struct
    ptdump_pglevel"
  mm/rmap: convert "enum rmap_level" to "enum pgtable_level"
  mm/memory: convert print_bad_pte() to print_bad_page_map()
  mm/memory: factor out common code from vm_normal_page_*()
  mm: introduce and use vm_normal_page_pud()
  mm: rename vm_ops->find_special_page() to vm_ops->find_normal_page()

 arch/powerpc/mm/ptdump/8xx.c      |   2 +-
 arch/powerpc/mm/ptdump/book3s64.c |   2 +-
 arch/powerpc/mm/ptdump/ptdump.h   |   4 +-
 arch/powerpc/mm/ptdump/shared.c   |   2 +-
 drivers/xen/Kconfig               |   1 +
 drivers/xen/gntdev.c              |   5 +-
 fs/dax.c                          |  47 +----
 include/linux/mm.h                |  20 +-
 include/linux/pgtable.h           |  27 +++
 include/linux/rmap.h              |  60 +++---
 mm/Kconfig                        |   2 +
 mm/huge_memory.c                  | 122 +++++------
 mm/memory.c                       | 332 +++++++++++++++++++++---------
 mm/pagewalk.c                     |  20 +-
 mm/rmap.c                         |  56 ++---
 tools/testing/vma/vma_internal.h  |  18 +-
 16 files changed, 421 insertions(+), 299 deletions(-)


base-commit: 53c448023185717d0ed56b5546dc2be405da92ff
-- 
2.50.1


