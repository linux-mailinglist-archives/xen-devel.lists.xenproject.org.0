Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98C36F3849
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:39:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528153.821052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMu-00025h-8A; Mon, 01 May 2023 19:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528153.821052; Mon, 01 May 2023 19:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMt-0001vv-Rg; Mon, 01 May 2023 19:39:27 +0000
Received: by outflank-mailman (input) for mailman id 528153;
 Mon, 01 May 2023 19:39:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCv-0006PY-NM
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:29:09 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7022b5c1-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:29:07 +0200 (CEST)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-1aaea3909d1so17752805ad.2
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:29:07 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:29:05 -0700 (PDT)
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
X-Inumbo-ID: 7022b5c1-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969346; x=1685561346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WInZHFLF0E37CPvH/fyQuQmpONrFi7mPGahLu3Z9gNY=;
        b=q4na0YpY6+HIdR7eCjpOfgl3pLZKXaYPSEQBquag8z/68f0H1ARrXFU5GHdi9YxK8/
         rB/VLGJXy6D4ZufE/2LOOEwnretxgWAB++ZlGVRxVIYCoUOlMN8apcsmkHtbQevtOOJx
         LNKiQlcElPDsuGjD80MSn3zT41r1jijBtepWy2itQQP8kPb/qbuR3Nu9du37XsuFat5b
         tY9vSCaH65FZJZYGzqq6Sev5FEiEarceFI+PkCB4zysu+TPDmYzeupQ3qWrtewRiW+Ef
         pPbEC2E+2Gu9odmO4zWHfrgw5vSTXCdgYdvlBNlEJqZMmLFOH+elBEgtadEGjmhbbSeV
         twkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969346; x=1685561346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WInZHFLF0E37CPvH/fyQuQmpONrFi7mPGahLu3Z9gNY=;
        b=VduIuFvKOXAydoDzd1DVCpZmEjA+SFree7Zz66sH7I296trGPa7gES+Z0BCrj5J8NV
         Eb2nNZ+tuUWPAMHRUVDnpY36ixZBj78IgPB+Zwf+zFU9DEBFdT0h/f+czgPzyYdKn4/i
         R6AfDW5794QW6PX5HWmB/hZx1TThXPcEErd13sPbFpv1YdB1UWkQycnaZIbfwjf7JUJs
         BO76r+9pckbcef3bZO8nJARMQWh26GG3m9WPakH/39ev+gVTtIiHim5La2pFnA43CLHf
         txthxPBCTjkd9w7mCPdZDYPhd8HUXhbbIRufCglBQXWY0z+WqiV+miRmWCeCpF0GtCw9
         uLPA==
X-Gm-Message-State: AC+VfDy9HNVgNrd1QOpZl6R6l1HN7NQ0I09FphW8NUIqdJqnn75w93uv
	fKCzS0v1TaXd2EMAtIkAzww=
X-Google-Smtp-Source: ACHHUZ4G7uSDpj0Az+Rf76NPdw6reyXbUYX/RD5L7uNUC8eMCewkmfrtYB+I6yNLHyDYyReDKoyXCw==
X-Received: by 2002:a17:902:c947:b0:1ab:8f4:af21 with SMTP id i7-20020a170902c94700b001ab08f4af21mr235908pla.42.1682969345737;
        Mon, 01 May 2023 12:29:05 -0700 (PDT)
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
Subject: [PATCH v2 22/34] csky: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  1 May 2023 12:28:17 -0700
Message-Id: <20230501192829.17086-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/csky/include/asm/pgalloc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/csky/include/asm/pgalloc.h b/arch/csky/include/asm/pgalloc.h
index 7d57e5da0914..af26f1191b43 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,8 +63,8 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 
 #define __pte_free_tlb(tlb, pte, address)		\
 do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page(tlb, pte);			\
+	ptdesc_pte_dtor(page_ptdesc(pte));		\
+	tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));	\
 } while (0)
 
 extern void pagetable_init(void);
-- 
2.39.2


