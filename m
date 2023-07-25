Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DECF760878
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 06:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569390.890004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9ds-00046e-Ec; Tue, 25 Jul 2023 04:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569390.890004; Tue, 25 Jul 2023 04:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO9ds-0003vn-5X; Tue, 25 Jul 2023 04:27:24 +0000
Received: by outflank-mailman (input) for mailman id 569390;
 Tue, 25 Jul 2023 04:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dJfN=DL=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qO9YT-0002Iw-DS
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 04:21:49 +0000
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [2607:f8b0:4864:20::b2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c581a0a2-2aa2-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 06:21:48 +0200 (CEST)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d129edb8261so1958251276.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 21:21:48 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 h9-20020a25b189000000b00d0db687ef48sm1175540ybj.61.2023.07.24.21.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 21:21:47 -0700 (PDT)
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
X-Inumbo-ID: c581a0a2-2aa2-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690258908; x=1690863708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=isSLzJlVCcu3DqkromZhEI/qWyA5zzmxG1x9IbP6194I1DKOByM/hDEPdxe0FV3MLw
         d6Rw+lHZ9WlgptdvBWiFzGMaM6KUoRlGp3xu2jda8iMy45KiL59BtGKHYho8dHuVUxG+
         hJLuMObqibUKBJwga6VwRPSAoh79vGoLNGxF2cxBKo1aHJdauK67/yOhDfLuLDKzblyJ
         F0wgtxLKGut1KlZ4xgsSxueuM+T0O4hKbp6cFWk4PiHYX5rGa1VxC3c5t+U93CbfreQA
         BhDLct+PPc5ibyvQ9RmPu/T+BvIQhbpSiLzGAmfokkxsUZTkKg3EAjaoANJECHoNxZLs
         xbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690258908; x=1690863708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CuYJ7liBLmFxtlpmCAIL/qtog0vkZLk1dVk72P32nA=;
        b=QF0UD9785MqjvOX+J6gWWGtK68tazYUWxEO2tWFaD7+eFJz4BelP1G3fJKpSdB5Ry+
         QD63rnJV1J7HW5eH1imtL2IvfpZEZGoCZEp9dazlSbKmXEezZg70uGKs+/8Q7BZW2Y/J
         Tu216Cs+uw4Sish9whTytnj0lDZhhDoiR7Je/KIWFffGTho9hgIlJjBllCZcWvPllB51
         QYy3hsKvgMEvcfM43dprMQ85YR5dVpHkvTsyjSl7OuOloxHGZ+M1yxQu8GP0c3iMaB6Q
         MyJ2cETv9t/ZENKvJcAavDTT3LTtwJ3Faugg79lNeozKeCZGra9CwhS3lcuuHd4P2DFe
         1xgw==
X-Gm-Message-State: ABy/qLaJ9Q0KJhEDaxZc0sWVFetIVqLBSckSp9vh1Iq5fYNfxVd+xxkI
	GmSHBhhznVzVDdnvGdcfvZk=
X-Google-Smtp-Source: APBJJlE3eJKl34GJI9esPlRffLNepF5AyEOkc7MEH4MKJMttiyYPB1pXgCmUyzmySa6Xjpm5Cuhodw==
X-Received: by 2002:a25:b08a:0:b0:d07:1a89:2e73 with SMTP id f10-20020a25b08a000000b00d071a892e73mr1367996ybj.28.1690258907697;
        Mon, 24 Jul 2023 21:21:47 -0700 (PDT)
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
	Guo Ren <guoren@kernel.org>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH mm-unstable v7 19/31] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon, 24 Jul 2023 21:20:39 -0700
Message-Id: <20230725042051.36691-20-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230725042051.36691-1-vishal.moola@gmail.com>
References: <20230725042051.36691-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..9c84c9012e53 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	pagetable_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.40.1


