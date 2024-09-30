Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884598A826
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2024 17:09:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807435.1218916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI0l-00034W-Nr; Mon, 30 Sep 2024 15:08:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807435.1218916; Mon, 30 Sep 2024 15:08:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svI0l-000311-Jx; Mon, 30 Sep 2024 15:08:31 +0000
Received: by outflank-mailman (input) for mailman id 807435;
 Mon, 30 Sep 2024 15:08:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PdoV=Q4=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1svI0j-00022q-Lb
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 15:08:29 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8ceb4b8-7f3d-11ef-99a2-01e77a169b0f;
 Mon, 30 Sep 2024 17:08:28 +0200 (CEST)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2fac49b17ebso12486181fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 30 Sep 2024 08:08:27 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-538a0432219sm1264423e87.132.2024.09.30.08.08.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 08:08:26 -0700 (PDT)
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
X-Inumbo-ID: d8ceb4b8-7f3d-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727708907; x=1728313707; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/37IdOCxVXI2z1guCYamgvqmlzEY2bjfj9nmrfmg4E=;
        b=MAnG1ScBxLNvzfkD+zRAKoWNNNjzQ/K5+BEbp6sa+AUqavcBDs+HMIGeEhjXZL8JSK
         TeHVC+CiSVNEDinvEoou7OOIOOtKVeDye2tnaVyAmdJSp6nFCmh8g+yg0iN2O9WasmEM
         +vUk4UZJRQJ7YhnlSI5rNkxNUKHAEUV7UCkpI56GPuaNnOJRbmpNK8P6amOT1TZPhmbO
         VW90mPdY+XB6c/EpyjTjaHUJBl8F6L//jFyha4sD7IUqueRXHjmyaSnnPoHBGXf9nYnq
         Y4WTyy4k5455RNUdiSRyREs5zRH7Hhd/EuRKyLmfZFpfjcgUUkQoPH2d1oXO2hDg7eDw
         HLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727708907; x=1728313707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/37IdOCxVXI2z1guCYamgvqmlzEY2bjfj9nmrfmg4E=;
        b=NcHYO05EI58TelKfiLHcjLCYfpV/Cs2YzxH6Ydj81UqB6w3dm9XMSaKU7nxo0Ljc0y
         8jZhneLaYhW42IkCH1KC9SLmbFqaOxm6ZYCSes3BtuwrpJXxrZJzih1YeA3qXosk6x6h
         TKiXaz5sRxhhfbO0XcjjMwwU1YlSOyApeul0K9UCSMg1zHeuNszMgSnlF0U7roWShnmM
         WjZ71lOc0EsYi2EPSN3jT90k7oKnOoMWfgE1dYgSln3lgTEpUOkVJPLMDstyEnMk+9jb
         KZy+ZEiS2ub8L8u02X3q5epvoKtGvhFj7YYQwXoAqZtjF/aSczAJxfwR1wz19D9IRNjD
         uBJA==
X-Gm-Message-State: AOJu0Yxwu5yriCzSogqP51VKJwigLVagECHk3hhn/QjocJz7CoF/hxlB
	oBR3/6XW498G/RLFUCnnkzba3kV6ohLtJgHf2alz5OhZpPa+1lpWKlBVDg==
X-Google-Smtp-Source: AGHT+IGq/yaJsQpWzmrjwiC8QsA6trMJCZDFbf4/V9BBieWtt8Z4Zgm8g0b3EEMhx+BRdc6+0/KDEA==
X-Received: by 2002:a05:6512:334f:b0:539:8847:d7e9 with SMTP id 2adb3069b0e04-5398847d900mr4524107e87.35.1727708906904;
        Mon, 30 Sep 2024 08:08:26 -0700 (PDT)
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
Subject: [PATCH v1 2/3] xen/riscv: switch LINK_TO_LOAD() to virt_to_maddr()
Date: Mon, 30 Sep 2024 17:08:21 +0200
Message-ID: <9a462c58f3af0ff5e5d312777cd1552b2a5a930c.1727708665.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <cover.1727708665.git.oleksii.kurochko@gmail.com>
References: <cover.1727708665.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Except for switching LINK_TO_LOAD() to virt_to_maddr(),
LINK_TO_LOAD() is dropped, as virt_to_maddr() covers all
the cases where LINK_TO_LOAD() is used.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/mm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 7a1919e07e..59da61716c 100644
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
+        virt_to_maddr((unsigned long)turn_on_mmu) & XEN_PT_LEVEL_MAP_MASK(0);
 
     for ( pgtbl = stage1_pgtbl_root, i = CONFIG_PAGING_LEVELS; i; i-- )
     {
-- 
2.46.1


