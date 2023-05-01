Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC1C6F3840
	for <lists+xen-devel@lfdr.de>; Mon,  1 May 2023 21:39:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528144.821004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMb-0008QD-C6; Mon, 01 May 2023 19:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528144.821004; Mon, 01 May 2023 19:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptZMb-0008Jy-5r; Mon, 01 May 2023 19:39:09 +0000
Received: by outflank-mailman (input) for mailman id 528144;
 Mon, 01 May 2023 19:39:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Chj3=AW=gmail.com=vishal.moola@srs-se1.protection.inumbo.net>)
 id 1ptZCz-0006PY-Nh
 for xen-devel@lists.xenproject.org; Mon, 01 May 2023 19:29:13 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70f6f602-e856-11ed-8611-37d641c3527e;
 Mon, 01 May 2023 21:29:08 +0200 (CEST)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1ab01bf474aso6107295ad.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 May 2023 12:29:08 -0700 (PDT)
Received: from fedora.hsd1.ca.comcast.net ([2601:644:937f:7f20::9a2c])
 by smtp.googlemail.com with ESMTPSA id
 u8-20020a170902bf4800b0019c13d032d8sm18175622pls.253.2023.05.01.12.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 May 2023 12:29:06 -0700 (PDT)
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
X-Inumbo-ID: 70f6f602-e856-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682969347; x=1685561347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=;
        b=WbTJO1ayjn3HXL/iQMZCmT2+RnFSF2O5WG+VKbNfOxDU8NvbfSgz+Wjs4UVgNNQcMr
         uLj57ayYRa/f+rOhAVP0jHM/2f33b+TbcsUuT8OausfFIQuWjGI50HrH5E0KiKkIgQwa
         0uM85OALkALC3dGk5nJ/tYYANgKg4uu8cRvFIwQEiY4YzwHIJvVidPyhHtwxmNKQYA0W
         tAWz4vl42KgoRYKzs8w7tUocWedsU0Shw+kefBEmySvrYYB7bH8pThcvpYZ6Dpmw316z
         icjhKqrruYJxczjDCcNsGgrwDrViIcKW8h7/U3ESAg45ipYAB08luKD04Ylpo9b00Q6j
         cFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682969347; x=1685561347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apg836Gn0N7QExyyhUUGNgc2fd2r3iyoAghRwsUjc2o=;
        b=BsN4KJFQnQgvdpxeGHifI4nYxUqKcgCYB+C3akbEzi9E/HJGpEpk8Rjm4sIM6FFVyT
         LnUD1X1I8pBM5NQeo4YDDP3DXk8mRBjRtMTID0kYDTZZPGqbTrBHMzF9sYDWgcArrE7F
         JGT20/NZc9dBHbTnuObriv6KrDEV3Y3CKYFlI4ttVNHMeRLChV/ve5Hxl6Dt8Up/JtSN
         wHFBcHH0kwCWAOGzAGvhgfqy/X3Ba/oq7oVF8dnfFdeFO62AJ/T4Vq4P253baN3S2LI7
         5Uv4SQBKH9QFat+XIgOJgjqHRlCI8AZaoONxaiCD9FA2+XCicYgUYtgmEpT0xY137g5S
         l/GQ==
X-Gm-Message-State: AC+VfDw90YHZHVbe3X4kmLf3QWuT53JG298vChN/pZewv2sWPj8sKwhc
	HWqVV6KpQTdUMH7XhveDfcQ=
X-Google-Smtp-Source: ACHHUZ6JhHSCQpD21/kJ78iavglhPlPTqvuf+3JEce/L0R67tH5klQ2MwjR0kPXU/JMC0Y1BeGjoZA==
X-Received: by 2002:a17:902:c94b:b0:1a8:626:6d9d with SMTP id i11-20020a170902c94b00b001a806266d9dmr19271440pla.62.1682969347146;
        Mon, 01 May 2023 12:29:07 -0700 (PDT)
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
Subject: [PATCH v2 23/34] hexagon: Convert __pte_free_tlb() to use ptdescs
Date: Mon,  1 May 2023 12:28:18 -0700
Message-Id: <20230501192829.17086-24-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230501192829.17086-1-vishal.moola@gmail.com>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Part of the conversions to replace pgtable constructor/destructors with
ptdesc equivalents.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/hexagon/include/asm/pgalloc.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/hexagon/include/asm/pgalloc.h b/arch/hexagon/include/asm/pgalloc.h
index f0c47e6a7427..0f8432430e68 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -87,10 +87,10 @@ static inline void pmd_populate_kernel(struct mm_struct *mm, pmd_t *pmd,
 		max_kernel_seg = pmdindex;
 }
 
-#define __pte_free_tlb(tlb, pte, addr)		\
-do {						\
-	pgtable_pte_page_dtor((pte));		\
-	tlb_remove_page((tlb), (pte));		\
+#define __pte_free_tlb(tlb, pte, addr)				\
+do {								\
+	ptdesc_pte_dtor((page_ptdesc(pte)));			\
+	tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));	\
 } while (0)
 
 #endif
-- 
2.39.2


