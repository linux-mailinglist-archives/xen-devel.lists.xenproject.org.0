Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E13106E5374
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:59:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522409.811838 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwH-0001gk-SX; Mon, 17 Apr 2023 20:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522409.811838; Mon, 17 Apr 2023 20:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVwH-0001bd-Ny; Mon, 17 Apr 2023 20:59:05 +0000
Received: by outflank-mailman (input) for mailman id 522409;
 Mon, 17 Apr 2023 20:59:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqr-0005M2-Dc
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:29 +0000
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [2607:f8b0:4864:20::1031])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7e36d1f-dd61-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 22:53:29 +0200 (CEST)
Received: by mail-pj1-x1031.google.com with SMTP id
 z11-20020a17090abd8b00b0024721c47ceaso14042290pjr.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:28 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:28 -0700 (PDT)
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
X-Inumbo-ID: e7e36d1f-dd61-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764808; x=1684356808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSVYEUhM0zGHlDR1yqa5KIpwwPynV1rh1Z3AvIT239o=;
        b=Bs6MBnbjQkX1GScZCbLklar3CQYsHMcNQJhdEJMSRoz85XciXhpnQ0YtDU9kdG/nWk
         TxMCtPr19eviQJI5aQ6Z23KjvD0/UYdwUUF801SK8Z3tk/XuPH8n6ufK4lU6OPOoTkEa
         tcxsOYaiL60cLVhSI6wekl2Ojt4T3pVi0l4/Kpd6dmP8a2GTqJPhoPlibhYfl7AzaVkC
         8dHP626PMZuKBlHUuWDeE5Ws0Xf5nvhx1+eNXqdjJYxnU1JpJLYxfuGpVyKb6jdKhgqK
         l+AozFzFnnh8JDe5VzEpQS6lDqTnIa40opwHXXYLbmcB20BMSqSIISIYF0OD142rh4KG
         4Sbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764808; x=1684356808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSVYEUhM0zGHlDR1yqa5KIpwwPynV1rh1Z3AvIT239o=;
        b=Pgnl94wXYuNbdYqhyDixr7L17R6FHnB93BCzR4GYzBpd6sbO+nA0zmUQpu1bc8DvH8
         ScW1U7Us6WwVlyQi3xkyigmitKkWduIY8DvrPfGWMPx5l8k0Y4/KssFt9+ccSm9hG9p0
         o+ZvETrSeO61aVCOOOvKFwIwkQBzUYF0KEbNZbPQYwod4XYBVdEtQiYrXwInwHkbsT0G
         OYzmK7IZ+QyFYe8XHpKUk1dQIib1ptsEMzMEgbuT5RzXStKBVyrRbbrL2lm5WNmFEojm
         PY2rMSpPsZu7L4zsuQQMQPaSD804W8/FEeKzz1mxAPE21R//7BiK/3mDatJL0WAXFSzk
         VW+g==
X-Gm-Message-State: AAQBX9crOyHh89F60C5RA5yaHWpVwD3gwNMLgg/EOYn0VV4sghITQxVL
	TGKJuLlDRrLVoZf+RD1Z7/5mfZaoxwcvQw==
X-Google-Smtp-Source: AKy350a2GcdGbRUVrvD14pA7yb7zjU30cICJUnhJQSgTB8CRLuH7Cup5yhi/f0UjvURoMBG/RaZdVQ==
X-Received: by 2002:a17:903:1206:b0:19f:1871:3dcd with SMTP id l6-20020a170903120600b0019f18713dcdmr272381plh.5.1681764808447;
        Mon, 17 Apr 2023 13:53:28 -0700 (PDT)
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
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH 31/33] sparc: Convert pgtable_pte_page_{ctor, dtor}() to ptdesc equivalents
Date: Mon, 17 Apr 2023 13:50:46 -0700
Message-Id: <20230417205048.15870-32-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable pte constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/sparc/mm/srmmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 13f027afc875..964938aa7b88 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -355,7 +355,8 @@ pgtable_t pte_alloc_one(struct mm_struct *mm)
 		return NULL;
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
-	if (page_ref_inc_return(page) == 2 && !pgtable_pte_page_ctor(page)) {
+	if (page_ref_inc_return(page) == 2 &&
+			!ptdesc_pte_ctor(page_ptdesc(page))) {
 		page_ref_dec(page);
 		ptep = NULL;
 	}
@@ -371,7 +372,7 @@ void pte_free(struct mm_struct *mm, pgtable_t ptep)
 	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
 	spin_lock(&mm->page_table_lock);
 	if (page_ref_dec_return(page) == 1)
-		pgtable_pte_page_dtor(page);
+		ptdesc_pte_dtor(page_ptdesc(page));
 	spin_unlock(&mm->page_table_lock);
 
 	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
-- 
2.39.2


