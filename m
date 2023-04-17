Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011416E52F0
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 22:54:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522358.811750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrT-0003ED-Mo; Mon, 17 Apr 2023 20:54:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522358.811750; Mon, 17 Apr 2023 20:54:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poVrS-0002XP-0f; Mon, 17 Apr 2023 20:54:06 +0000
Received: by outflank-mailman (input) for mailman id 522358;
 Mon, 17 Apr 2023 20:53:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9RIN=AI=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1poVqu-0005NG-P4
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 20:53:32 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8ad6386-dd61-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 22:53:31 +0200 (CEST)
Received: by mail-pl1-x62c.google.com with SMTP id n17so11378174pln.8
 for <xen-devel@lists.xenproject.org>; Mon, 17 Apr 2023 13:53:31 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::c139])
 by smtp.googlemail.com with ESMTPSA id
 h7-20020a17090ac38700b0022335f1dae2sm7609707pjt.22.2023.04.17.13.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Apr 2023 13:53:29 -0700 (PDT)
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
X-Inumbo-ID: e8ad6386-dd61-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681764810; x=1684356810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8/b+eKq2obnq3wrn4AaChyOhPXbZKipyE2UTOB7XHg=;
        b=RTJID0Q/WW7iedj/afuCWToOfH/aBrY/NrWNeyN7ByP/usee9y9Bzy2eV2Pryddh5k
         SgN8rXjbYlFESamvA2kpEGUYeNDAEQAcb5DBJGBzqZ39H1PUjeRb3TeWmdsscSkj+duB
         XdhsoeufQBiAlQ1VDbbJWcUzg1wdK3pe72OAkzLWRjQ1C0S075Nqq87qXF8IdfaSlDxW
         +Bud3Bjv7jwgjZOfa7R1sSZhrnf0y6c/vZkSvJ9Qym0uRrXk7trecdbr2o902twf3Tei
         jaw/7g2aCCpoNC5Ttid57NGpw+n0jzjqhu5TM+KCbKbeUljRTtHuGZwGu624c+XnB9eN
         r1BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681764810; x=1684356810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m8/b+eKq2obnq3wrn4AaChyOhPXbZKipyE2UTOB7XHg=;
        b=LE8wa4Aq5OJBQIcsjvoXpxwcapTbQV1veOtygpoAsHAJfXKDq3cX4a7IM2VFSo8EbV
         EMXUQ8/DceidAt8hgkIs+O430j09LeX4tBP2s1tDmfLqeRHTMn/dv1WBgfvP3WRvGiq+
         W58J60YCWutNm8JXsbV1gzksrjCA8uQR/uE4ylA/xQpJtc+D5XlhY6kJ92vH6HTTZw9e
         A9IQjbkQFuqzGfSUAtKASyb4EhkosCVjgCH8Cp7IMg1XjAlYkTJBwAzIFLczOSbq/hVz
         Iya6jMeC8AlgOzDIe6JRIIs7cJetO5SrTbSeHx/n8uLYjZpsWDRd71FMd/ATZb64CS6s
         iw2A==
X-Gm-Message-State: AAQBX9fuQDv93I0ibwZ4/rSfCIMndtHALVB9+4npEPg/Q+G19FwJFTXu
	/OacaiZHoRXoJjdSURvoeOU=
X-Google-Smtp-Source: AKy350Ygryz7WWGm7uHh1637qBCeDzWZK5X9wTShPkAHp+hvTpFfVrAPSXU4dDYY+IJtVCH6njxkhg==
X-Received: by 2002:a17:90a:4144:b0:240:973d:b436 with SMTP id m4-20020a17090a414400b00240973db436mr14169767pjg.49.1681764809815;
        Mon, 17 Apr 2023 13:53:29 -0700 (PDT)
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
Subject: [PATCH 32/33] um: Convert {pmd, pte}_free_tlb() to use ptdescs
Date: Mon, 17 Apr 2023 13:50:47 -0700
Message-Id: <20230417205048.15870-33-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417205048.15870-1-vishal.moola@gmail.com>
References: <20230417205048.15870-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents. Also cleans up some spacing issues.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/um/include/asm/pgalloc.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index 8ec7cd46dd96..760b029505c1 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -25,19 +25,19 @@
  */
 extern pgd_t *pgd_alloc(struct mm_struct *);
 
-#define __pte_free_tlb(tlb,pte, address)		\
-do {							\
-	pgtable_pte_page_dtor(pte);			\
-	tlb_remove_page((tlb),(pte));			\
+#define __pte_free_tlb(tlb, pte, address)			\
+do {								\
+	ptdesc_pte_dtor(page_ptdesc(pte));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #ifdef CONFIG_3_LEVEL_PGTABLES
 
-#define __pmd_free_tlb(tlb, pmd, address)		\
-do {							\
-	pgtable_pmd_page_dtor(virt_to_page(pmd));	\
-	tlb_remove_page((tlb),virt_to_page(pmd));	\
-} while (0)						\
+#define __pmd_free_tlb(tlb, pmd, address)			\
+do {								\
+	ptdesc_pmd_dtor(virt_to_ptdesc(pmd));			\
+	tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));	\
+} while (0)
 
 #endif
 
-- 
2.39.2


