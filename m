Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4E0B2079C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 13:26:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077380.1438466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQfv-0006UQ-Vp; Mon, 11 Aug 2025 11:26:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077380.1438466; Mon, 11 Aug 2025 11:26:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQfv-0006S3-S0; Mon, 11 Aug 2025 11:26:47 +0000
Received: by outflank-mailman (input) for mailman id 1077380;
 Mon, 11 Aug 2025 11:26:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gc+J=2X=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ulQfu-0005jI-SB
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 11:26:46 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ff532c8-76a6-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 13:26:46 +0200 (CEST)
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-fm1wS3A2Ox2omxRUGQmMAA-1; Mon, 11 Aug 2025 07:26:43 -0400
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-459d7ae12b8so30613995e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 04:26:43 -0700 (PDT)
Received: from localhost
 (p200300d82f06a600a397de1d2f8bb66f.dip0.t-ipconnect.de.
 [2003:d8:2f06:a600:a397:de1d:2f8b:b66f])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-459e6dcdbbbsm122068765e9.7.2025.08.11.04.26.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 04:26:41 -0700 (PDT)
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
X-Inumbo-ID: 0ff532c8-76a6-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754911605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OPzS7A0H2JYY/4bVoDqq5vs7hjaSrgBmC9jJDJzHOMU=;
	b=MHIgDDercPLuz7pteul5tWFHjneuoapL5+LHdKKsGx/LVYDv8WWTlu0eatfgXf8yOiFYi9
	fubb/gj2MmuibpOIlWSpHbJqsNH/zWt97BArdZXWX8psJpsCOWalF4ZtFzOyVvTZ6TNn+2
	QXLLtrj5s8q5WQ5dfYehsejmXfWo0iQ=
X-MC-Unique: fm1wS3A2Ox2omxRUGQmMAA-1
X-Mimecast-MFC-AGG-ID: fm1wS3A2Ox2omxRUGQmMAA_1754911603
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754911602; x=1755516402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPzS7A0H2JYY/4bVoDqq5vs7hjaSrgBmC9jJDJzHOMU=;
        b=dJ6Hfjj9V/OQSwWpXcuS+gVB/uVnBq6FKsqUBfzZ1EF+IVRXLyv1h79jh6iACyRgv9
         Xyf+N6PQJsTOInfeNDF/xmewes2+faPYjo6ZkoFq49cJLRzm59Vl9xVrumVBYRoHFfXq
         5CxhlzGkvtahT7ePOHmr29mBwr/MhBLnqYe47fK3dcgaXcPjyr6wAHnIY6w/kkDR4K1L
         dEVn72LdavJprodcrECFEg8TI2Ri/NsXmEvy2Pe0VjEfZxZHWfHl2/YIljO1QkbG/Eb6
         n5V7NDhEfsya0hFU0HI6rm4NFyFUXL36eSrnH7ruSTIM1F8Vf2+y0OJDg0i+NM0IUvkW
         kwuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg+OyoxviS1i+Z7hpBhpHKjq9oo15LwNajL3LhUVujPNa/0gioRDgrJRJAj5Y+hbv1wG8MOQjUAsw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmEBArZJW/Iof972vqEKuQ9PcLGecLYvJ5q9egiJIIlLzi7yxC
	Yq8gM98490ZI6gsVSRdPhtdKkQchkK3ISxHhcpSCoJXUJSXNXZU9Lfi1km9FAVPWoOW6uFLBw4d
	ZNOsM5Q2cEFp+y628gs9iOi1mPnisZgwD9zkvizaz74trnh17AY2A1MF80fLDno0kFZWA
X-Gm-Gg: ASbGncsh+oFXBM9ZFHLZ/xogahsSiCiE0RV9w/4lwUR6qhyCmA0wXV4OPrrtHUAFWyb
	1kViSqXVuuI1CgAkVyqT5DDrYIkP4xW6UyMfJRp5V/iXqIlCq/y5CjLRsg/F7ShP5J3kgAQrtFB
	OEywJfsQpEulSiU+Ufi5frUJZKd0ttJTSs6xklhOudqzieQMtOkVDynt+v5Q/pJTZewQZAQOdr1
	HtxH21gmQzibgpbTzDuwDedTHfOPWj1LbuNoaP4ICk4colHy+oYJi9qf8P+zPCbEW2Oi+fAee+4
	A88sgHx9s3teoteZ4eEkQhalQuTs0iBX4QSWpthcTCDePLct2tjvAnQp8aEwCCHS2/GtGqSPCaW
	WPjsNE93/bGS8Xg5yGwC4+Y4J
X-Received: by 2002:a05:600c:4ec7:b0:459:e398:ed89 with SMTP id 5b1f17b1804b1-459f4ea2167mr89525585e9.1.1754911602500;
        Mon, 11 Aug 2025 04:26:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2VXT8eja0G/6oYjAzMox3Wj/YsLa0WXg9I30LI+rqq9mj5h9Avu9edvonRgK7PI+OIDYPVA==
X-Received: by 2002:a05:600c:4ec7:b0:459:e398:ed89 with SMTP id 5b1f17b1804b1-459f4ea2167mr89525255e9.1.1754911602063;
        Mon, 11 Aug 2025 04:26:42 -0700 (PDT)
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
	Lance Yang <lance.yang@linux.dev>,
	Wei Yang <richard.weiyang@gmail.com>
Subject: [PATCH v3 03/11] mm/huge_memory: support huge zero folio in vmf_insert_folio_pmd()
Date: Mon, 11 Aug 2025 13:26:23 +0200
Message-ID: <20250811112631.759341-4-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250811112631.759341-1-david@redhat.com>
References: <20250811112631.759341-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: csAcMqdVqaGW0MmvgYD-ogNLAorTHZNicgXo9HCFzD0_1754911603
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true

Just like we do for vmf_insert_page_mkwrite() -> ... ->
insert_page_into_pte_locked() with the shared zeropage, support the
huge zero folio in vmf_insert_folio_pmd().

When (un)mapping the huge zero folio in page tables, we neither
adjust the refcount nor the mapcount, just like for the shared zeropage.

For now, the huge zero folio is not marked as special yet, although
vm_normal_page_pmd() really wants to treat it as special. We'll change
that next.

Reviewed-by: Oscar Salvador <osalvador@suse.de>
Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Wei Yang <richard.weiyang@gmail.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 7933791b75f4d..ec89e0607424e 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1418,9 +1418,11 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
 	if (fop.is_folio) {
 		entry = folio_mk_pmd(fop.folio, vma->vm_page_prot);
 
-		folio_get(fop.folio);
-		folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
-		add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
+		if (!is_huge_zero_folio(fop.folio)) {
+			folio_get(fop.folio);
+			folio_add_file_rmap_pmd(fop.folio, &fop.folio->page, vma);
+			add_mm_counter(mm, mm_counter_file(fop.folio), HPAGE_PMD_NR);
+		}
 	} else {
 		entry = pmd_mkhuge(pfn_pmd(fop.pfn, prot));
 		entry = pmd_mkspecial(entry);
-- 
2.50.1


