Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 546B4B05BD2
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jul 2025 15:24:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1044064.1414140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfde-0004hp-IO; Tue, 15 Jul 2025 13:24:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1044064.1414140; Tue, 15 Jul 2025 13:24:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubfde-0004g1-F5; Tue, 15 Jul 2025 13:24:06 +0000
Received: by outflank-mailman (input) for mailman id 1044064;
 Tue, 15 Jul 2025 13:24:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hnVo=Z4=redhat.com=dhildenb@srs-se1.protection.inumbo.net>)
 id 1ubfdc-0004Ab-QI
 for xen-devel@lists.xenproject.org; Tue, 15 Jul 2025 13:24:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f9a34e17-617e-11f0-a319-13f23c93f187;
 Tue, 15 Jul 2025 15:24:04 +0200 (CEST)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-496-uAMBuaixNmWpABpBWaNzJQ-1; Tue, 15 Jul 2025 09:24:01 -0400
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4561bc2f477so13651245e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 15 Jul 2025 06:24:01 -0700 (PDT)
Received: from localhost
 (p200300d82f2849002c244e201f219fbd.dip0.t-ipconnect.de.
 [2003:d8:2f28:4900:2c24:4e20:1f21:9fbd])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45617f18d99sm69437455e9.8.2025.07.15.06.23.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jul 2025 06:23:58 -0700 (PDT)
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
X-Inumbo-ID: f9a34e17-617e-11f0-a319-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752585842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p0W1gu/DbwB3HO+Ik7b3ciKtc0XnhekWlhthG95RGc8=;
	b=ES2DbM6k93F7He+Avf+w57uFeYf9327Rd04uycw+lYlG8X1QjXtz2KUliQqIw32kYIMa2J
	cg/juIaruktU7VTfLoZ2J5XYAE+ojhrdnpmpog5Uq5FazBuUjTRegU1sXZctVrdZ+15r1S
	Yn9EXoU/GLagiPOFa+acXjowP6lgX+I=
X-MC-Unique: uAMBuaixNmWpABpBWaNzJQ-1
X-Mimecast-MFC-AGG-ID: uAMBuaixNmWpABpBWaNzJQ_1752585840
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752585840; x=1753190640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0W1gu/DbwB3HO+Ik7b3ciKtc0XnhekWlhthG95RGc8=;
        b=gRoxybHWIumj003Du/GfWBDAUpAFB6XkukVp4j/jay+QWUMK2HthKJ2nbprFOXooDg
         vdq2a2Yboy0xv5vvJR8fXKzHjh9AcekqbfvPlLIGZaIo0CSTwNRXqfTBn1tslpFOTn9z
         fijCxVewVvdkxEkLi0CD0dVA9X2JA16+Uh22m7yaA7aqIQm1+wWu0dZD/JFOZN8eiB2C
         Wm34Ty038Fsg96r84CkOLwqT/dB3feuDsEC20zoN2j4kUQZGg7gKVFOpJGtzyPvpmX4I
         vOrWX4TvMyB1RBxgyxrWopDlm51v9Fd+57edBoIPDrLg1yHFJH0z1wuLRwlm9eq6uhGM
         XkQg==
X-Forwarded-Encrypted: i=1; AJvYcCUcRCT0gCCbrX97pRnqNubCRUTnm4STEFIuv44bhyp2lZkwRLUmKFQVPASt3q7TN/K68BPrrMsd4ak=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyJAAjxUDxENv6tTcc5jNN4tIu8d/R8rMIU34ZGifElzUGeDcjl
	MasOj6BdOPDU92LWPlyk2iLbPteziYOkNi0fWyAp2sCh26qJxSYR+AvwhS7BUc/Kfcuuk+5H1bY
	P+jSLBjVNF0PJM2dVOak87g9cQA9ksEzrT1QuTgxhbNNGM+RuupDxfPIgrRVgBQQqwWlu
X-Gm-Gg: ASbGncueb8Q0VMhFcUTRIJbGCwjy0VN411PJnt+3nSmpEOt1OMY4hjt3lm+OA7wGCmV
	OP712nCPe+ssD+tGdMfTe+Mdo0adHsHvL7fUI85TCmSVw10wbUAyLMcnBDEGISFWCE1Wb1isIwU
	wiG2PSEDV8c7vqIVtegAnJVUlt1j/ISNCInmUNKFb5Jv5Nk+VF6f7i3pcgRjle4MtnmGiYtuXzu
	YFlfJUUMYry7+Xg9WR7rGEPYJg1jF/LkKswPg87+j6Z1TO5tMadzpXh1lQF9e3VkRA+xs9Cu5mc
	yaSChQJNtPzRwwpyPV5h/jwhPdBulzRcDlLyB2OaBWlFEhb4M1L2Q9UtFdwgEPB/bjJ6/mvVViJ
	ZD/7mnUfDFYGNK/w/RON2pJ00
X-Received: by 2002:a05:600c:5387:b0:456:76c:84f2 with SMTP id 5b1f17b1804b1-456076c88c8mr137334455e9.30.1752585839958;
        Tue, 15 Jul 2025 06:23:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYbWegCM0S6a5gfkNemwi6OlAVodA9645Tyw+PVXIOkDyOGbitNWxrBtqQg62ekGoPNGMvNw==
X-Received: by 2002:a05:600c:5387:b0:456:76c:84f2 with SMTP id 5b1f17b1804b1-456076c88c8mr137333805e9.30.1752585839359;
        Tue, 15 Jul 2025 06:23:59 -0700 (PDT)
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
Subject: [PATCH v1 3/9] mm/huge_memory: support huge zero folio in vmf_insert_folio_pmd()
Date: Tue, 15 Jul 2025 15:23:44 +0200
Message-ID: <20250715132350.2448901-4-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250715132350.2448901-1-david@redhat.com>
References: <20250715132350.2448901-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ru3DkocGovtALxnSvDvFDZFVw7pbvF9xWb7aX6BIlwc_1752585840
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
index 1c4a42413042a..9ec7f48efde09 100644
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


