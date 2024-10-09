Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C39F996C8B
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 15:46:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814530.1228111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syX0i-0005PC-CG; Wed, 09 Oct 2024 13:45:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814530.1228111; Wed, 09 Oct 2024 13:45:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syX0i-0005NW-7i; Wed, 09 Oct 2024 13:45:52 +0000
Received: by outflank-mailman (input) for mailman id 814530;
 Wed, 09 Oct 2024 13:45:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3wKy=RF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1syX0g-00059A-ST
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 13:45:50 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb8a0ee9-8644-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 15:45:50 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c8a2579d94so8001566a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 06:45:50 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e0598947sm5435334a12.11.2024.10.09.06.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 06:45:48 -0700 (PDT)
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
X-Inumbo-ID: cb8a0ee9-8644-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728481549; x=1729086349; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUbIlgBj8AycXaBiq5VvH9Kf8b686NBX0+bgyidJsiQ=;
        b=WHmA/dLgXuAe173oIJcYW1IJo9mN/znHW0fpDm05w3VAgnByBlbOf0fS3B8Uwd00A/
         F+m+cc2R1zjOJGbWWr5/TdWi/H+tjaP90htdg8WVk1FblUuL7YNlxlN+v4Av2SI68i3o
         YHCkENNl2ys5qRqdQ9oImN248O9j+y9TXIyxfyXsQTeIz6y4u5flFD2nhj0b4k7SIUcp
         37lPG7CLobCxD+A8U/2ImvhgZ06fwBWGfSrr3ZeEaWPryePlmnDDvQV/M+EC/CPQsRlU
         DDLAG+LuIYcqsreEZ4PMWRQ4W21Zi9rjTROXF5KNbIe+uhGKrsPK87O0M+K2H04as8zH
         htuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728481549; x=1729086349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUbIlgBj8AycXaBiq5VvH9Kf8b686NBX0+bgyidJsiQ=;
        b=CePayOe3D3hhLRZ2XRvQYW5CS674WU3RJvY7nL525ZRwHt+TxLoreodEJBL2E8hYxK
         SYD9VPmpcV3mmmxi694JWkSj4kdVpYsckm1J03b5R2KYILuTU9wvYwvHWDzHQOik3aLM
         ejIBCOvTErSiOuN+Lvge5gzyikIZNgpYIzVSYH2sDOwbrSU2CG1GgHre/ndQf6s57TxS
         SFg81hB/heWIxbRHZhsc7j04TdGDfJQdZJRJB/VRAuYpxPBDv5SU8JdlYfr5fiFQL1MG
         Ps8aw2qxQWYEdScyMykGE1xOu6o1hCX3A0c8aciiiSMxA3MCymCys8IdgjLZKzfnpngY
         B/Lg==
X-Gm-Message-State: AOJu0YwpvEk9hiwz7V8qod3mJNTshiQPBvcZEA2dhvXaeYVS6voW4wRd
	a24/AIhP4CFezUFRjwd/qWh2lf4bXh8GsDJnSZienm01LGTzyMnqfuJsyA==
X-Google-Smtp-Source: AGHT+IGpv4Y1dh2fzkZF3rlKiORYVcUQIKhHp0dDzWuxXE3eqKRkHNw+iA6zorlLDNgRrAXJIhNQrQ==
X-Received: by 2002:a05:6402:3714:b0:5c8:8d60:600f with SMTP id 4fb4d7f45d1cf-5c91d5a5526mr2133434a12.14.1728481549206;
        Wed, 09 Oct 2024 06:45:49 -0700 (PDT)
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
Subject: [PATCH v3 2/3] xen/riscv: switch LINK_TO_LOAD() to virt_to_maddr()
Date: Wed,  9 Oct 2024 15:45:40 +0200
Message-ID: <ece6b504d6d2a9b7ccedb7f683e3fb4f4d4d5fed.1728472163.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <cover.1728472163.git.oleksii.kurochko@gmail.com>
References: <cover.1728472163.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use virt_to_maddr() instead of LINK_TO_LOAD as virt_to_maddr()
covers all the cases where LINK_TO_LOAD() is used.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V2:
 - Drop the cast of virt_to_maddr() argument in remove_identity_mapping() as
   this cast is done inside virtu_to_maddr() wrapper macros.
 - Update the commit message ( rewording to be more clear )
---
 xen/arch/riscv/mm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index daa02b2c60..27026d803b 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -29,7 +29,6 @@ struct mmu_desc {
 unsigned long __ro_after_init phys_offset; /* = load_start - XEN_VIRT_START */
 
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


