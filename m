Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15B7718D5A
	for <lists+xen-devel@lfdr.de>; Wed, 31 May 2023 23:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542089.845672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TW3-0003fm-67; Wed, 31 May 2023 21:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542089.845672; Wed, 31 May 2023 21:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4TW2-0003PK-IA; Wed, 31 May 2023 21:37:58 +0000
Received: by outflank-mailman (input) for mailman id 542089;
 Wed, 31 May 2023 21:37:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jp8B=BU=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1q4TQD-0006xu-Jb
 for xen-devel@lists.xenproject.org; Wed, 31 May 2023 21:31:57 +0000
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [2607:f8b0:4864:20::1136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f8c314f-fffa-11ed-b231-6b7b168915f2;
 Wed, 31 May 2023 23:31:54 +0200 (CEST)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-5664b14966bso877027b3.1
 for <xen-devel@lists.xenproject.org>; Wed, 31 May 2023 14:31:53 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::46])
 by smtp.googlemail.com with ESMTPSA id
 t63-20020a0dd142000000b0055aafcef659sm658905ywd.5.2023.05.31.14.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 May 2023 14:31:52 -0700 (PDT)
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
X-Inumbo-ID: 8f8c314f-fffa-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685568713; x=1688160713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=twP3X2a+WodLh3389MnIMBhN0jbH10mGEhh4PvePsM0=;
        b=PfN/YuXqEhOYfWlhCizTVYhB0yTtEnGBcp1Rf+NGxnIYb5NMfNjpOJp7si8Gqd9u2Z
         fVUf7A/NR+jmOjDUmFOcEU9lVtXwdNmW/KajF2dl5HDRHfmf/W944R+zyeedwYfvy537
         14PZNj7A3uugHcuLzifkUVqBMDywmdqymi8GehMXhWnbSeCktA8GuayP2Gw4BIeku+KV
         EWgr5cqL7Y75WorTm+eBQ331vxvi6DIr56AVXpyFUK5xmnNLyeer0KWpXh+3ggToS823
         Egfk0bra3X4pY1o6khSRW89GKMQyeeVJx3oX9CNStxK0FHLZpfrALdAzG2hgMTcdbX0M
         +9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685568713; x=1688160713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twP3X2a+WodLh3389MnIMBhN0jbH10mGEhh4PvePsM0=;
        b=fd6qlZLqHUr1HumI8fARZXz6batzeRw6xWfSyabKypyTx+G3f9EMlRo3kn7TSiQwDk
         w1MenDPYQWUr1shCpOFJ382jAKcKkWOiya0V+X4vYjZFTYTZ0MuN38xzP7BHPdxQkYFD
         +zhKCPFyihK/R94VVGwOXgDCCg5hidg0J/YBWhKKZzdk9QPZwkwjaksMvd25VKo0taoU
         l//exPEVZTFHuUxMpoVGElProfahaKXiaUfbUGENaguTDk4RXevzvYBZBpdvtMdghj7m
         MnSOY+flvVc7oHEbcLBETpsuypNL+Bb/Q4wyGKzTfGaCfcR1mqip0NJ4m6fhGxsqx8KY
         85Hw==
X-Gm-Message-State: AC+VfDxyrCtUq5AdS9Ik3Z/4SoPhNlFxozPP2jUi6HUYSb70AKiuTp1r
	abr1bwtg3jgL2MMMRPVr3Cc=
X-Google-Smtp-Source: ACHHUZ7FD6AVojP8YF17yPS22sW4VLLKSMzYdsUMVLL7wG9gS5evh1bJZ6trRixkrytBmJNTyQ8JCA==
X-Received: by 2002:a0d:d684:0:b0:566:386b:75fc with SMTP id y126-20020a0dd684000000b00566386b75fcmr7598602ywd.18.1685568712866;
        Wed, 31 May 2023 14:31:52 -0700 (PDT)
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
Subject: [PATCH v3 22/34] csky: Convert __pte_free_tlb() to use ptdescs
Date: Wed, 31 May 2023 14:30:20 -0700
Message-Id: <20230531213032.25338-23-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230531213032.25338-1-vishal.moola@gmail.com>
References: <20230531213032.25338-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

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


