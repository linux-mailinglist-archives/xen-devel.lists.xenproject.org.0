Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C99D990876
	for <lists+xen-devel@lfdr.de>; Fri,  4 Oct 2024 18:05:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.810517.1223222 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swknP-00066W-DD; Fri, 04 Oct 2024 16:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 810517.1223222; Fri, 04 Oct 2024 16:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1swknP-00064m-8w; Fri, 04 Oct 2024 16:04:47 +0000
Received: by outflank-mailman (input) for mailman id 810517;
 Fri, 04 Oct 2024 16:04:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jgwL=RA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1swknN-0005bD-Jv
 for xen-devel@lists.xenproject.org; Fri, 04 Oct 2024 16:04:45 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f5b55db-826a-11ef-a0bb-8be0dac302b0;
 Fri, 04 Oct 2024 18:04:45 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-539885dd4bcso2991682e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Oct 2024 09:04:45 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e5c3c8fsm10040166b.3.2024.10.04.09.04.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 09:04:43 -0700 (PDT)
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
X-Inumbo-ID: 5f5b55db-826a-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728057884; x=1728662684; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNPxOIY4h0Xr4dDH/MECo/twrNAXBQx9HmZ4eZ49N1w=;
        b=K4xk+CBuhVNyin9qLX+ODBxx9nU5QvFZfgFv9lvbnOfhA6mJ0doGxqyUBHHExnxTfl
         KWdJmEYYub1iIchbwXJfj9nQZtv/gNFtb+XgpWqanPL9tQV5KQZAfFMzxFEVWl8fK6l0
         Kq68dqtY/VfYcqzrb4UveVs4tBTR/sjpa2jHnh29bQua1vkGzEufDNQOGixjI/VxYK8G
         tCL6KK7pL7tNVxHX1+5d4iypHXhlKVG/hyz27ApshYcZuJdhX5dWRP7BJrzEbM0yByib
         ZYuapatLEyBnljyD1HH4Ox0k3yVhpaNGnfZyspQFPz5cdNEKjvi55E+0+2IjUJosE1dA
         qKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728057884; x=1728662684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PNPxOIY4h0Xr4dDH/MECo/twrNAXBQx9HmZ4eZ49N1w=;
        b=FJna36Dsq6QQIFYF/Ynbzu0ClNhWtLVgV+qoeDZEAKY8pcMReq1fVY+pVw8xHWkoPh
         cThHb9NK2Sj0KBU55p1bQh/Q2exTiI+tD37U1/oa6CQ0CV8/SnhRmgHtqXNWJwln6Q3Q
         wTQUIshzDLAXGH/g8N2sy5Oee+Wryf0bDABmSXMcztyFjr+/sm0AKLM9KGwi2noBYaRC
         +Oz6Wb/fmKrkiPwT2LcG17UrvGPAyknR0JtCJgygjzGgHso8aqMZw80aQndHCm+1+K1v
         7mvFMPfuSsQVNube1vNKjPcQXS90vxmX90jqbYnscbKz0n1tjGglRSRquI4AG8GRZhqP
         hxaw==
X-Gm-Message-State: AOJu0YwdL4KRJ2zUBqalcGKTpZauLy6rDzV6+g6cLbn6rgjJT0woVCJN
	1jdxP+qHHfQhySlXMS5a8TSpgc4/T2tyXtepZd+lHQnGgJVvBII6Ke1vcw==
X-Google-Smtp-Source: AGHT+IFb8XLqbFe/0HgfThze9Wu/Na4Pi9HON1if44VGoiU2ytzxPH/cbOZxnrpsJQVugHA2vqZfDw==
X-Received: by 2002:a05:6512:b2a:b0:536:553f:3eec with SMTP id 2adb3069b0e04-539ab85bfb8mr2240608e87.5.1728057883730;
        Fri, 04 Oct 2024 09:04:43 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/3] xen/riscv: switch LINK_TO_LOAD() to virt_to_maddr()
Date: Fri,  4 Oct 2024 18:04:36 +0200
Message-ID: <5975a3a2d5d499244825e88cac3f9b6b4e9ddadb.1728057657.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <cover.1728057657.git.oleksii.kurochko@gmail.com>
References: <cover.1728057657.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use virt_to_maddr() instead of LINK_TO_LOAD as virt_to_maddr()
covers all the cases where LINK_TO_LOAD() is used.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Drop the cast of virt_to_maddr() argument in remove_identity_mapping() as
   this cast is done inside virtu_to_maddr() wrapper macros.
 - Update the commit message ( rewording to be more clear )
---
 xen/arch/riscv/mm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 7a1919e07e..b5a5535812 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -29,7 +29,6 @@ struct mmu_desc {
 unsigned long __ro_after_init phys_offset;
 
 #define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
-#define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
 
 /*
  * It is expected that Xen won't be more then 2 MB.
@@ -122,7 +121,7 @@ static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
                 unsigned long paddr = (page_addr - map_start) + pa_start;
                 unsigned int permissions = PTE_LEAF_DEFAULT;
                 unsigned long addr = is_identity_mapping
-                                     ? page_addr : LINK_TO_LOAD(page_addr);
+                                     ? page_addr : virt_to_maddr(page_addr);
                 pte_t pte_to_be_written;
 
                 index = pt_index(0, page_addr);
@@ -225,7 +224,7 @@ void __init setup_fixmap_mappings(void)
 
     BUG_ON(pte_is_valid(*pte));
 
-    tmp = paddr_to_pte(LINK_TO_LOAD((unsigned long)&xen_fixmap), PTE_TABLE);
+    tmp = paddr_to_pte(virt_to_maddr(&xen_fixmap), PTE_TABLE);
     write_pte(pte, tmp);
 
     RISCV_FENCE(rw, rw);
@@ -312,7 +311,7 @@ void __init remove_identity_mapping(void)
     pte_t *pgtbl;
     unsigned int index, xen_index;
     unsigned long ident_start =
-        LINK_TO_LOAD(turn_on_mmu) & XEN_PT_LEVEL_MAP_MASK(0);
+        virt_to_maddr(turn_on_mmu) & XEN_PT_LEVEL_MAP_MASK(0);
 
     for ( pgtbl = stage1_pgtbl_root, i = CONFIG_PAGING_LEVELS; i; i-- )
     {
-- 
2.46.2


