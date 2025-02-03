Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F154A25A78
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2025 14:12:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.880591.1290691 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tewFO-0004ER-An; Mon, 03 Feb 2025 13:12:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 880591.1290691; Mon, 03 Feb 2025 13:12:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tewFO-0004CW-8J; Mon, 03 Feb 2025 13:12:18 +0000
Received: by outflank-mailman (input) for mailman id 880591;
 Mon, 03 Feb 2025 13:12:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o2EM=U2=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1tewFN-00041c-EG
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2025 13:12:17 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ccc18a0-e230-11ef-99a4-01e77a169b0f;
 Mon, 03 Feb 2025 14:12:15 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385e3621518so2088109f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 03 Feb 2025 05:12:15 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-190-108.w90-112.abo.wanadoo.fr. [90.112.153.108])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b574fsm12737179f8f.70.2025.02.03.05.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2025 05:12:13 -0800 (PST)
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
X-Inumbo-ID: 7ccc18a0-e230-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738588334; x=1739193134; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wuXSmrl6TLJUtPYl5bMBoppQk4TX3m/R0rN8q8JrjDw=;
        b=XSZ2ApGGXu8PFvC7q/Qc4ydIxCKKg3BYEMqVFi7aQzxR7USty/CUVPpn1+TN2TdITT
         QTmKSDde3cBky/M08gliNbV4a+6UuNhoywArMtgQ2Op46EP0amr86WfCe3AU/tvzwhc8
         LwhiWqeAeyqxqPFzNqEDyBbKBrhx4ER0F5Sds9lADTMCt+C8+0mjV/F4CbRKoUiI+xHe
         RkoQLrTy/FSijGx+tTgp3sFBKk//Oxw6wrPD6yc9abDSjrdN/g21R4iqjDwv8f5q8/ti
         NVTZD/frG7/aneN2HcaYRcKInUtMshUzV52Aeb9tklQpeAlTrp6lTcIy024qC8mr2NL8
         Duwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738588334; x=1739193134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wuXSmrl6TLJUtPYl5bMBoppQk4TX3m/R0rN8q8JrjDw=;
        b=gQcpL9NVUJ5XvGtKX2d+xoFSHvbgluGTLvY+ZACGeIcTTDlLA06RqM7g49YWT6F/og
         P/yxknWp9xXcCD7vc1WPNjy1alyknr4fwc5H6/5RVNh1tOJ675f0FoApsrFqRk5h78cr
         b/eLaVxIcii/cvacOlOc4DFT8VpE9Y7K69d+1GvZwUJEiRA7VSkiTq640ANiwUphvXo4
         KHkQyLb1/2A8uKgAgpdfwSZegQNCjd/hcjPV+YFTGUdJg9Xx7TCAZDTtk/DwtV+C4pG9
         HsAMkecyZ9yKq28g/uyqSlWH4gsHQuYGTOB/mPAheR8NQunZ4oQriI2OR62Z+XpE2nwj
         RiwQ==
X-Gm-Message-State: AOJu0Yyt/C1UOzz61AdDdkWYNE2UpWA3nlbGL+i3DDNXE5hwbU646pHj
	yerQMofoZHbC0qe18TNRULqWlZFjgJpDg9bzv1rOZB1ePCcdvg1xfGc7gXmr
X-Gm-Gg: ASbGncvTIZSSSC9xK0NCZ6/2/GSAXq4Zp/R2u3UonIoOSSKEON7yIievkl8PaM96zF8
	lKwIuzVoY+uO65vabXzkZb/BSirWBoaz9GVkTVXUnJqmMHZC8QVAVb2qj0s3hPgNbkhWMpABVD0
	DKpcejnpgJIT2OYdrJVSMgrgJHv0lupZUCEVJ6ud2NZVjlPq3ICvGiX2TCIoS2oeeJs5pL+4Unn
	wFpSlcASJYOHclM580gX2fVIGrn7qPUhNSrtv2l/R0Ks52il9hFelXvb0FuB0YOLKsduRRXv5qH
	RKSbG9lb1aneu+8ffyahDrgpZsbzvP86znz9baLee2kQ3EwVINh79ScWdelUL9iUZsNmkJOcXVJ
	dzQ0LS/4E
X-Google-Smtp-Source: AGHT+IHcGr0FB9ivy/IkSr1Hg1wnuiCrKXFiiEaPttUHOI1z5iYQse/6t6MFdGhymF5gnpraouHukQ==
X-Received: by 2002:a05:6000:1fac:b0:38a:614b:8632 with SMTP id ffacd0b85a97d-38c52093f16mr21369107f8f.39.1738588334462;
        Mon, 03 Feb 2025 05:12:14 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 for 4.20? 2/3] xen/riscv: update defintion of vmap_to_mfn()
Date: Mon,  3 Feb 2025 14:12:03 +0100
Message-ID: <131ecfd1b39b4ca4fe3e5d7f7e28a130c301e0fd.1738587493.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738587493.git.oleksii.kurochko@gmail.com>
References: <cover.1738587493.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vmap_to_mfn() uses virt_to_maddr(), which is designed to work with VA from
either the direct map region or Xen's linkage region (XEN_VIRT_START).
An assertion will occur if it is used with other regions, in particular for
the VMAP region.

Since RISC-V lacks a hardware feature to request the MMU to translate a VA to
a PA (as Arm does, for example), software page table walking (pt_walk()) is
used for the VMAP region to obtain the mfn from pte_t.

Fixes: 7db8d2bd9b ("xen/riscv: add minimal stuff to mm.h to build full Xen")
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in v2:
 - Update defintion of vmap_to_mfn() as pt_walk() now returns pte_t
   instead of paddr_t.
 - Update the commit message.
---
 xen/arch/riscv/include/asm/mm.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
index 10a15a8b03..814a7035a8 100644
--- a/xen/arch/riscv/include/asm/mm.h
+++ b/xen/arch/riscv/include/asm/mm.h
@@ -23,8 +23,6 @@ extern vaddr_t directmap_virt_start;
 #define gaddr_to_gfn(ga)    _gfn(paddr_to_pfn(ga))
 #define mfn_to_maddr(mfn)   pfn_to_paddr(mfn_x(mfn))
 #define maddr_to_mfn(ma)    _mfn(paddr_to_pfn(ma))
-#define vmap_to_mfn(va)     maddr_to_mfn(virt_to_maddr((vaddr_t)(va)))
-#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
 
 static inline void *maddr_to_virt(paddr_t ma)
 {
@@ -160,6 +158,18 @@ static inline struct page_info *virt_to_page(const void *v)
 
 pte_t * pt_walk(vaddr_t va, unsigned int *pte_level);
 
+static inline mfn_t vmap_to_mfn_(vaddr_t va)
+{
+    pte_t *entry = pt_walk(va, NULL);
+
+    BUG_ON(!pte_is_mapping(*entry));
+
+    return mfn_from_pte(*entry);
+}
+
+#define vmap_to_mfn(va)     vmap_to_mfn_((vaddr_t)va)
+#define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
+
 /*
  * Common code requires get_page_type and put_page_type.
  * We don't care about typecounts so we just do the minimum to make it
-- 
2.48.1


