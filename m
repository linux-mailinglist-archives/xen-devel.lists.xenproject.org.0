Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AC3B08C05
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 13:52:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046605.1416954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNA0-0001IQ-Bk; Thu, 17 Jul 2025 11:52:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046605.1416954; Thu, 17 Jul 2025 11:52:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNA0-0001Fz-8f; Thu, 17 Jul 2025 11:52:24 +0000
Received: by outflank-mailman (input) for mailman id 1046605;
 Thu, 17 Jul 2025 11:52:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiP3=Z6=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ucN9y-0001Ft-SA
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 11:52:22 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e81fd4f-6304-11f0-a319-13f23c93f187;
 Thu, 17 Jul 2025 13:52:21 +0200 (CEST)
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-577-9xSpO_ZBOPibBeo_aJYa8A-1; Thu, 17 Jul 2025 07:52:16 -0400
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-45600d19a2aso7505385e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 04:52:16 -0700 (PDT)
Received: from localhost
 (p200300d82f1f36000dc826ee9aa9fdc7.dip0.t-ipconnect.de.
 [2003:d8:2f1f:3600:dc8:26ee:9aa9:fdc7])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45634f85fd1sm20282385e9.25.2025.07.17.04.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 04:52:14 -0700 (PDT)
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
X-Inumbo-ID: 7e81fd4f-6304-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752753140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8sA1/7fJchUOMEyFR6/9XGM4JcADGMS+VMGQR+LVY98=;
	b=foLi25B2cijHjy17iFb/H1rS9Gbw8v508Vsqi1t3eLokzpaUlkPi7jHpQrBytggxED55mn
	NbAIX4qOA2ATeemCFfJqcwEssotEggvQaGZ8DY0nYOmCa0kYzH2jMyUkIkeUlJCq0Ilexh
	zNc2dFEgkKmM4Cqq/CsDRLOO04yGXds=
X-MC-Unique: 9xSpO_ZBOPibBeo_aJYa8A-1
X-Mimecast-MFC-AGG-ID: 9xSpO_ZBOPibBeo_aJYa8A_1752753136
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753135; x=1753357935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sA1/7fJchUOMEyFR6/9XGM4JcADGMS+VMGQR+LVY98=;
        b=gMHHgPAJDsbrF01lBOU0srK/adfLaSyBGXPykR4ZMexU1I3daR02N2QFJDooZKOFLb
         GrSylRTCU44MJBVguNM97vbJ7TA5q5F8aq3dYHOG9LnAejt1MfjK7sargyAKH+SHYJIY
         xeRMOODosbdvMQ8bQbNh50xulQ1Sb+7UwMYukeYnSGpYLYUSE83MIzsUfzzsDr8BtNX9
         94M0whXtYqbW8mvbj1Y/5xT1ocG1dfCxtZqD/K5lanmHjz+JbIYDlJv4tJYRicctvJVH
         fRGJ4hEqzPeo6vQZKQSM79YHZzlBfpixk3alJ3u5zLI5GBLXB08trFpdUsNuoBafJnV6
         lIFg==
X-Forwarded-Encrypted: i=1; AJvYcCUFTowy7w7OnNaUxJEanqQbY2dFxp9LeWwS0QNdojNCiRrmFbGj1JNNG8fB8N4mT9QuOblg+/synL8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwUU+FzcPs1mSllrhkxVRz0DhFc5jTBsWigGu5dR5exwuOi0jj9
	rIpNx6kgDmBaXv7tXVrtc/DGRdqWTFlU6NnwOAAw2oh5WtNvyVWb0fYaf5+7GGvJTKNB2J5Xi7+
	l9s7rOzhA5ehA04QmUqvvq7GwgjiuaaFBvHBEHLk/u/Sg03E6N96A/ZgAkJ5W2pNrr/5M
X-Gm-Gg: ASbGnctwDtuGBTpylE48ePF6B4u2fgpCMWMFY+y+iRBIS7XDk500iPxuJhNo5+bUt2n
	M48iynSrw2XtAUzuYBStOQn7jyQWuOzs5J4VhoL1xGPY4qAMLDk1qEL9iUoSlfEzIjOsN8cIZXn
	tqb73p1JqXmcmOvgsr4X2LcobFjYs1lvH6i1AR4+yi0Hj2DPujK+Kq53b7auqhN9EK/cX/z3R7n
	K33k+5nhiEJ7hPTMnNWoR+TLCq0lMl7Cy3mAqq98Y+0ElWWWJQRi2kWGM9jyEECzlR8EYBE8TYq
	JuFBfJ9XdpkxauF3ABJV5GHLDhK5RjuXgdVqfkbisypiSuv5SrNhU5CGkDc4DuEiL8TuNbsvYx1
	4afFtrpsh4jsxypTZ+r0NRns=
X-Received: by 2002:a05:600c:3b15:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-4562e36c7b1mr56529655e9.20.1752753135440;
        Thu, 17 Jul 2025 04:52:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/rOiDh/w9bPyIOHiP0sGPa++157liovsPLJqB62Hs3kS1lvQT8E6z4/Thjm3n+RdALYGJuQ==
X-Received: by 2002:a05:600c:3b15:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-4562e36c7b1mr56529205e9.20.1752753134877;
        Thu, 17 Jul 2025 04:52:14 -0700 (PDT)
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
Subject: [PATCH v2 0/9] mm: vm_normal_page*() improvements
Date: Thu, 17 Jul 2025 13:52:03 +0200
Message-ID: <20250717115212.1825089-1-david@redhat.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f2p_i0AkXkHNiagyHyxyBR_kxTx6wugkilQp7dh_n8Y_1752753136
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Based on mm/mm-new from today that contains [2].

Cleanup and unify vm_normal_page_*() handling, also marking the
huge zerofolio as special in the PMD. Add+use vm_normal_page_pud() and
cleanup that XEN vm_ops->find_special_page thingy.

There are plans of using vm_normal_page_*() more widely soon.

Briefly tested on UML (making sure vm_normal_page() still works as expected
without pte_special() support) and on x86-64 with a bunch of tests.
Cross-compiled for a variety of weird archs.

[1] https://lkml.kernel.org/r/20250617154345.2494405-1-david@redhat.com
[2] https://lkml.kernel.org/r/cover.1752499009.git.luizcap@redhat.com

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


base-commit: 760b462b3921c5dc8bfa151d2d27a944e4e96081
-- 
2.50.1


