Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07EC73A9C1
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 22:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553952.864904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRNc-0000nB-MZ; Thu, 22 Jun 2023 20:58:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553952.864904; Thu, 22 Jun 2023 20:58:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRNc-0000i7-HD; Thu, 22 Jun 2023 20:58:12 +0000
Received: by outflank-mailman (input) for mailman id 553952;
 Thu, 22 Jun 2023 20:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTT3=CK=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qCRNa-0006Mq-DY
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:58:10 +0000
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [2607:f8b0:4864:20::c2e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e1faf60-113f-11ee-b237-6b7b168915f2;
 Thu, 22 Jun 2023 22:58:09 +0200 (CEST)
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-562e413cf61so630063eaf.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 13:58:09 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
 by smtp.googlemail.com with ESMTPSA id
 d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:58:08 -0700 (PDT)
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
X-Inumbo-ID: 7e1faf60-113f-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467488; x=1690059488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sr5TgrSX24KD5rPSp2rkPhxpII4heal/IIgk1FACoIs=;
        b=UtF2QiZk6b9G+hZ8o+uaaa8jIMv9kwu5Z4W+DnKhqSxtuxZLeuCmgWiQ2UyCbKdGf3
         JlKYQP1/9HAEwi4YcMuZIpkc1UasphklUD1y4PAfxdaiUenlc82pk0MDNgE4UyvTP/Ti
         WAZ4mtTP+0UbBT6PIwdrRUvrUpbxA+faq7jSe2iTSffGzc1HNKXsxuak3eG36Kz3Hx1p
         3Bw014l7N9peXiYCyjbUvF7k31KviCnInVoJPhH8kz/FXkdJ8oxWXWbjuOh6BjmUEfNL
         NLvkARmq7C0ZzVI4l8HT21OfZWS/swkiU6k+jkbLgeAOyE/KVS/34HjWz0qthh2YGY4M
         vuhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467488; x=1690059488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sr5TgrSX24KD5rPSp2rkPhxpII4heal/IIgk1FACoIs=;
        b=d5gmfh8Z/WIDhtH91mS1t8syNeU/v1T1NHRa/hc98a3//V8SDY4sWqGU6QZLSSZM56
         OcaVCL5+00lg7iDSVI1JVbFcbQZIuJaTK+yrfN37ANHebDUJyjvH5+bOOioAUgbmhKLp
         Und+wOTQlWbf1dWUzEMWLOQ1R8LdsD53KP6WLi1g9gbJlyeL4qN/ksgAjFWU8FgKp4RD
         vJLyal3ynkGPccPolgmmPRYs3d4mfr8XOrAppCW48z6f5g901qc76qRbvDmh65DSfAKs
         WzCcAq2wFZAx6q6DBu5svoGSoYmOWozfwO49ifYj0kxKadyLaZs9xt1c+V0JeV08wHzp
         5ryw==
X-Gm-Message-State: AC+VfDzod6nTG5lkSyzSqg2btc1chicT5Yo23ztQp7gMHaJ7/NA9HDA0
	YocVrLy65NF/FMNObYr9yVk=
X-Google-Smtp-Source: ACHHUZ6Wv4q+lCV8nxexJGI3S2vfJP94k7k+pAexpWAqQNNuxMHJpmGx+Tn2Ll2+HAYtwXHgGRnsHw==
X-Received: by 2002:a05:6358:9f9f:b0:132:d8bc:b15b with SMTP id fy31-20020a0563589f9f00b00132d8bcb15bmr1343396rwb.2.1687467488545;
        Thu, 22 Jun 2023 13:58:08 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v5 06/33] mm: Convert ptlock_alloc() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:18 -0700
Message-Id: <20230622205745.79707-7-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This removes some direct accesses to struct page, working towards
splitting out struct ptdesc from struct page.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 include/linux/mm.h | 6 +++---
 mm/memory.c        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 1511faf0263c..39b0a4661e44 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2798,7 +2798,7 @@ static inline void pagetable_free(struct ptdesc *pt)
 #if USE_SPLIT_PTE_PTLOCKS
 #if ALLOC_SPLIT_PTLOCKS
 void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
+bool ptlock_alloc(struct ptdesc *ptdesc);
 extern void ptlock_free(struct page *page);
 
 static inline spinlock_t *ptlock_ptr(struct page *page)
@@ -2810,7 +2810,7 @@ static inline void ptlock_cache_init(void)
 {
 }
 
-static inline bool ptlock_alloc(struct page *page)
+static inline bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	return true;
 }
@@ -2840,7 +2840,7 @@ static inline bool ptlock_init(struct page *page)
 	 * slab code uses page->slab_cache, which share storage with page->ptl.
 	 */
 	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
+	if (!ptlock_alloc(page_ptdesc(page)))
 		return false;
 	spin_lock_init(ptlock_ptr(page));
 	return true;
diff --git a/mm/memory.c b/mm/memory.c
index 80faf3e76232..2ff14f50c7b3 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5920,14 +5920,14 @@ void __init ptlock_cache_init(void)
 			SLAB_PANIC, NULL);
 }
 
-bool ptlock_alloc(struct page *page)
+bool ptlock_alloc(struct ptdesc *ptdesc)
 {
 	spinlock_t *ptl;
 
 	ptl = kmem_cache_alloc(page_ptl_cachep, GFP_KERNEL);
 	if (!ptl)
 		return false;
-	page->ptl = ptl;
+	ptdesc->ptl = ptl;
 	return true;
 }
 
-- 
2.40.1


