Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B18977341C
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:07:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579065.906998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9KD-0006C9-CQ; Mon, 07 Aug 2023 23:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579065.906998; Mon, 07 Aug 2023 23:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9KC-0005su-SC; Mon, 07 Aug 2023 23:07:44 +0000
Received: by outflank-mailman (input) for mailman id 579065;
 Mon, 07 Aug 2023 23:07:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CnMB=DY=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qT9IY-0001NS-LO
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:06:02 +0000
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [2607:f8b0:4864:20::b29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7b3131f-3576-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:05:58 +0200 (CEST)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-d35a9d7a5bdso5116782276.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:05:57 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
 by smtp.googlemail.com with ESMTPSA id
 d190-20020a25cdc7000000b00d3596aca5bcsm2545203ybf.34.2023.08.07.16.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:05:56 -0700 (PDT)
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
X-Inumbo-ID: f7b3131f-3576-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691449557; x=1692054357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/qh+9u1BcCIl2V5thva5G2rletbRXaxfcBgzJGGgXU=;
        b=pCbA+UxrLZ96Iu/LappjpSZmLEozYOYmdO5RTxaM7BlCH20e3MEhp3Bn4lGiK7HrnF
         zI5vTymTyexPs2fEWKMf3YOixGPBtUiqT1+gX7fLWBa+Q9gs2M2cYtqmojJG+cqpxy8a
         yiuXYP2euWfRpeTnK/Ph7t69G3h70UOk68zLodvepBaU3Ub4ZFK2KFzJhB7TlCbjRGdX
         ie8hnx40ZzCuPRz3xDX8QGC9rAdvd3I0ubBMPCct9yJ64tgNkqrnZ4vxqqMZLVPIiaaP
         rYqmFrrQlxG0A3en5YH5Vcd7HyjhL8swCun/14090vxoeSz0eujRX7UW9eNuwqOQts53
         n0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691449557; x=1692054357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/qh+9u1BcCIl2V5thva5G2rletbRXaxfcBgzJGGgXU=;
        b=isQv0ST8QJIR/y1fc+4g3NwBYRutjFValFahP3cWKOvQdPCmPLZmhtIqJT3bSwmy9V
         Lyw27sSE4i/YNcRfNfyrdPZ+czb4KsukCEgRoc+Pg4gw+Ti/ocqYjvI2pfsHTWJUaB+S
         zjoLzCQ7wv9XJILTcpsm7Syp4fN6rMKaC8BkQ8VgzjEYiWy9zpUj4r8YywpAmZrx08Mr
         xtND04eFZxVgfXNpjRdrg7qRGiCSDj4nO+dXLRpdV+4qCOy+RgvnIhGY0qbckEGhvluG
         4i4eMHsL2tznW4t6ZNqhqNVUgYwkEaSBDLJ7GbbmsgBna6QUTIQH5ESpL834es9d83KM
         /Sjw==
X-Gm-Message-State: AOJu0YzhLYcSE9B+pJgLlUWUOlYiQ7Wy3kQrdgkBMctrliYRSNKOZaVZ
	9V/B3kI8824yZJv/IX6c9lg=
X-Google-Smtp-Source: AGHT+IGb7qTBQz9qcaNa56xxCbdxPZmnKDiha96eaUPQlL4XzY5YUB1UJSqCKxKHPrzOS/VVDboJfg==
X-Received: by 2002:a05:6902:4c4:b0:d0f:65db:dc0e with SMTP id v4-20020a05690204c400b00d0f65dbdc0emr10052463ybs.39.1691449556886;
        Mon, 07 Aug 2023 16:05:56 -0700 (PDT)
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
Subject: [PATCH mm-unstable v9 19/31] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  7 Aug 2023 16:05:01 -0700
Message-Id: <20230807230513.102486-20-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230807230513.102486-1-vishal.moola@gmail.com>
References: <20230807230513.102486-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
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


