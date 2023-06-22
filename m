Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EE273AA4B
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 23:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554091.865155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRPM-0006y8-0S; Thu, 22 Jun 2023 21:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554091.865155; Thu, 22 Jun 2023 20:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRPL-0006jV-D8; Thu, 22 Jun 2023 20:59:59 +0000
Received: by outflank-mailman (input) for mailman id 554091;
 Thu, 22 Jun 2023 20:59:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NTT3=CK=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1qCRON-0006Mr-8h
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:58:59 +0000
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [2607:f8b0:4864:20::734])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a6cd7d6-113f-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 22:58:57 +0200 (CEST)
Received: by mail-qk1-x734.google.com with SMTP id
 af79cd13be357-76244657caeso578996285a.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jun 2023 13:58:57 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::36])
 by smtp.googlemail.com with ESMTPSA id
 d18-20020a5b0c52000000b00bc501a1b062sm1684937ybr.42.2023.06.22.13.58.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 13:58:56 -0700 (PDT)
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
X-Inumbo-ID: 9a6cd7d6-113f-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687467536; x=1690059536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=bI7F5jd8U0pmZoDCjrDdgbVISfzJlV2CUqYAibSVdHZ1OfrWu+Og6tKjTlcLZOSWFx
         f+VE9wjvDVgQCRSbWCOuVgmL30v4mkM+TeOOIsHTqjG+MpjulK0jZg8Kight1gJqL3EJ
         uelPGFi4K83pZcziIo91nBQ/Xb1a7VXoH5rDwteSo81u0B0E0AB9v0ZYlD/3EFJOnXaR
         LHJhz4j3eKvixa2uY3tcUc56YA7rm/NnSwLp194pufjXDiSsyScPz/VvaVef5k0S3cDu
         KA06LddfVd5MnGrcrI8kMVYj85Gsgf9HVHh6xfDQTCqtTE6ZYhHSEi5n5/a6D65T/xzp
         1jRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687467536; x=1690059536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NG13BwzmmAIpXpcduEwvRHFbS3iQhU18W2JpKLteVDY=;
        b=Ynb2FD5W0eyYYKGgBcPBA6frFaZZ8TlrY14sUkjEA65C5u20M76TfNqIqhPitLedAx
         PrwDQoGDW/eVyqxi5ND+TcovwKGjy0wvOLM7z+fMue9XKgniB0/+jHRoiIafQT7sZ6/m
         fbyOtin5mNDqyr634k294Le5xH64eaCXnk4mn16cS8CVtyGmHXVjk+U0AOY7X3zKlFke
         XS+3wshutt9XzGHWOatMYcbEFP+8BGsmgMxPAcntHkXvQZTW0M7nsaGf1ePmkhubSRX/
         D7hoGjyEfBvy4tXrIXZw7/I89E8WsPJIjV5JlaErFIkoDB0HfilJeSb72JMHHzK59lxI
         U+wg==
X-Gm-Message-State: AC+VfDxG+Srx0mfEIjXK2jb4KND1g0jQPz21Kra6LVIA/++AjEEXJrnC
	DohdXBaXB346DXOhHgo7KapnLe9b1c9JHg==
X-Google-Smtp-Source: ACHHUZ6PptFNgBqCV4/Z0wvxz/N4kUJPrg8w5rC/9pu7Gesur9H1ncl000IRfhTCjlej4fSGBBngjg==
X-Received: by 2002:a05:620a:c55:b0:75e:d11d:51ab with SMTP id u21-20020a05620a0c5500b0075ed11d51abmr23662404qki.9.1687467536577;
        Thu, 22 Jun 2023 13:58:56 -0700 (PDT)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Mike Rapoport <rppt@kernel.org>
Subject: [PATCH v5 29/33] sh: Convert pte_free_tlb() to use ptdescs
Date: Thu, 22 Jun 2023 13:57:41 -0700
Message-Id: <20230622205745.79707-30-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622205745.79707-1-vishal.moola@gmail.com>
References: <20230622205745.79707-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/sh/include/asm/pgalloc.h | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index a9e98233c4d4..5d8577ab1591 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_SH_PGALLOC_H
 #define __ASM_SH_PGALLOC_H
 
+#include <linux/mm.h>
 #include <asm/page.h>
 
 #define __HAVE_ARCH_PMD_ALLOC_ONE
@@ -31,10 +32,10 @@ static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
 	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
 }
 
-#define __pte_free_tlb(tlb,pte,addr)			\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb), (pte));			\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	pagetable_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif /* __ASM_SH_PGALLOC_H */
-- 
2.40.1


