Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37262B08C0A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 13:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046608.1416985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNA7-00021K-4w; Thu, 17 Jul 2025 11:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046608.1416985; Thu, 17 Jul 2025 11:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucNA7-0001y1-12; Thu, 17 Jul 2025 11:52:31 +0000
Received: by outflank-mailman (input) for mailman id 1046608;
 Thu, 17 Jul 2025 11:52:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tiP3=Z6=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ucNA6-0001TV-8b
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 11:52:30 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 831bfff8-6304-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 13:52:28 +0200 (CEST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-d2QeHBjPMR-28s-cTvWR9A-1; Thu, 17 Jul 2025 07:52:23 -0400
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a5281ba3a4so517464f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 04:52:23 -0700 (PDT)
Received: from localhost
 (p200300d82f1f36000dc826ee9aa9fdc7.dip0.t-ipconnect.de.
 [2003:d8:2f1f:3600:dc8:26ee:9aa9:fdc7])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45634f4c546sm20298345e9.7.2025.07.17.04.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jul 2025 04:52:21 -0700 (PDT)
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
X-Inumbo-ID: 831bfff8-6304-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752753147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAAYYXy+5qwpASBfNrlxr8guN8G2i706wjpGFlltV74=;
	b=PowJqas7tpfMmsMJaVxOmZnEmQPtsKHWnYCHCm4aEYoT9Aw2OaefEcltD1hxTxxQkn6Bov
	g0O403vR4QPDWg7P0Ucrsj3KaP0PQB4jBOQVAGTZ+umBd1UD14S7oGsQBeZiXKnQLBjNxc
	phvY48Te2VAiSA9cidoTnvC96mzq6hQ=
X-MC-Unique: d2QeHBjPMR-28s-cTvWR9A-1
X-Mimecast-MFC-AGG-ID: d2QeHBjPMR-28s-cTvWR9A_1752753143
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752753143; x=1753357943;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oAAYYXy+5qwpASBfNrlxr8guN8G2i706wjpGFlltV74=;
        b=E8PKKuhKOtVU6zgTXPv1WNnHGYONpkFc3hl3nh4W4ZyKv9gUJvge11eHO4iZ3Fb5ED
         ReMU6R6km9ZzkHYnyIoCHw6tvucy7W06ZV0ryj0Hz/vtNBfMHftzD7kthD6upTt7ZvbJ
         6jHp4uAENMr49WKk/RM2Uj02zfJFD+cf5rBclSTSnKJwNJMrCCBIvnU/bTBetUNFrOMt
         InyFa2+JPVrxAId3C9esoFyR4BgeENV1lElQ2LwWAa5FLdVK4hduHRIjCXVdrgxTPwDS
         IQVfLQsTOTls8nvWIYl9+Ej6hE94Lq7q0vtRXeBmXsJPtRp23zr2KDdwUQNxsc7oGvoP
         LDoA==
X-Forwarded-Encrypted: i=1; AJvYcCU3FOGkgh6J9GlliGBUUgMrK2thSA8TxoekLbhnCcweJIslnf0MLJEpuleWyW5EaNp3OT1vw815Rj4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoMt7grY09Wq5d1bDSF6YPf7ujlBp7YGXx29j4nUm2U1xHr0KX
	UnD3S3vU7N0Eczje28R10kfkzmHJmAOvoXrSMZRYcemP2iEu/BAHqCjxz4cIEci680HBQqwWVXS
	tBRLjKSqLRTythvmAx6lOoUeH9KUwubA45Upw6GLibKKO6Ef3fv39udAabH1lNK2GO4i1
X-Gm-Gg: ASbGncsJQ0LeVTLG83lYs6QSNBtIdZbMM/XamGrrv04vbQEUDKAHlCKkDgHqcFEK6zI
	hRDeBgnOBGWNoKD3YnhlgcesYh+T7/mZbOx9wVBUnha2RWE7Ady8puBmDDpgdrrkulIcS+6qqZA
	vCLa4dn0KmvKdnOKkBreQH0Av8QjND8KeQI27JEdrryq/5pA6kCWxLh6Dmj0nsFd5QYqZk/f61r
	Px0mx3Wx882JOSi2hbz1p42vAeovb5O1H8U6Pn+AXuR7t+6xpZkEiCsq271uKF4r1alRj36KKvZ
	TxdH6Pk1va5QCzTdSJWMMmtzlH+oSjbypMX3n30x/PMy5pWLYBOF1xcAfMQFL+/FW7R+IaTqv+z
	Df+vxCTC+oytRIsFLkuruBHA=
X-Received: by 2002:a05:6000:23c8:b0:3a6:d95c:5e8 with SMTP id ffacd0b85a97d-3b60dd7aac2mr3879076f8f.35.1752753142626;
        Thu, 17 Jul 2025 04:52:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLqq0HSziphIF4gY7jkSa/7zMDAewp7/5b6DkIKpjYL1yIcxKWQwPQ10nRUjdRU/WgBdtqyw==
X-Received: by 2002:a05:6000:23c8:b0:3a6:d95c:5e8 with SMTP id ffacd0b85a97d-3b60dd7aac2mr3879028f8f.35.1752753142142;
        Thu, 17 Jul 2025 04:52:22 -0700 (PDT)
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
Subject: [PATCH v2 3/9] mm/huge_memory: support huge zero folio in vmf_insert_folio_pmd()
Date: Thu, 17 Jul 2025 13:52:06 +0200
Message-ID: <20250717115212.1825089-4-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250717115212.1825089-1-david@redhat.com>
References: <20250717115212.1825089-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y5TXmE1qdGBfuo4UYH0z0C4uxuZTlxmI_yGfLIZFYqA_1752753143
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
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/huge_memory.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 849feacaf8064..db08c37b87077 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1429,9 +1429,11 @@ static vm_fault_t insert_pmd(struct vm_area_struct *vma, unsigned long addr,
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


