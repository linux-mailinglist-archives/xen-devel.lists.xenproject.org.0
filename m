Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBC792FE5E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jul 2024 18:23:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.758169.1167555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ36-0000Va-Ir; Fri, 12 Jul 2024 16:23:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 758169.1167555; Fri, 12 Jul 2024 16:23:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sSJ36-0000Sd-Ar; Fri, 12 Jul 2024 16:23:08 +0000
Received: by outflank-mailman (input) for mailman id 758169;
 Fri, 12 Jul 2024 16:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Ov5=OM=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sSJ34-00088h-Cn
 for xen-devel@lists.xenproject.org; Fri, 12 Jul 2024 16:23:06 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04a90504-406b-11ef-bbfb-fd08da9f4363;
 Fri, 12 Jul 2024 18:23:05 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a77c4309fc8so324178766b.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jul 2024 09:23:05 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ffa13sm358464966b.129.2024.07.12.09.23.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jul 2024 09:23:04 -0700 (PDT)
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
X-Inumbo-ID: 04a90504-406b-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720801385; x=1721406185; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bg0oBapFdQirltpvyBrsFHo+q+G6ZrURZn0a9gYnXDs=;
        b=MqnMPen49Z3G8uoByQrVlKwd4cozIjdTAIP1Ydar3lqbImjrDVxjPYlDnFmg9QsgtO
         +5RNjv56erHLXbNe8Ni1TDu+qFtc04YA+Rtn5SQWsMqNftSEUxyh2mh5100AuYibdYDw
         873JQmpADqDpuy4IDK5tFekl8Jwlt6nED8WLYAmR1INqCD1ucVAj9oLDuYt2yzWlvb8B
         Jxazbmmx/XRk4HW/BmTMmiapnunPmEwWLL3ncOMXDInp9g1bAq9d1yFYNrrTslGAVBe3
         N/a3lpj5GmtFh09Go+uDVx47/KABgGagW11L71sWhf+h1srGDmiX+ln21WQxKRdRYgta
         HUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720801385; x=1721406185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bg0oBapFdQirltpvyBrsFHo+q+G6ZrURZn0a9gYnXDs=;
        b=foBAK4Is+zfGpfBEoeOgNKas/P1/CqlIRCB7k4c9OnqnLC89mrCjot86WX6OX1zQaP
         iKsfU+fP2BHDS6WQSpmZ/+pBuusha8fVL2/ZFCNiwPh3awqLVPsxe2qxMMuzV4N9YKCQ
         +Ox9c0NmKzS+mb74G7cHAr2fbPSn5ujRqq06h1mMlwNWAVZ4szgbTJZSqvq6AI+9Ix8k
         utt5WEWaiiasDrevQcIsb0aB3udcBNw3cM2QEPnCqyvx7mdECJYUncR2yiL2qNpmOmfq
         u6UbFAZucyifnp3iYFUiWojfJzVPS3eq/VYL6iFdRnzXbxx7+WPkfk9915OuF6G9ok0a
         R8Ew==
X-Gm-Message-State: AOJu0YyuKKzVwCZ9cs7lk9/MNwPKZKQK3SUsm+q8fWUMzL7hTY4BDlx4
	RIenXMwqvoUG+M3dnmfkAPoYYY6acwUwIFsCOIK40qZz7xBXcqDtl1rCf3hM
X-Google-Smtp-Source: AGHT+IE3yEHvZhM9zyREcD1rAhp1stu3IBi5eHZWIAhH+gJluVx9/VRBhJiGToUSVSwUgAK4KZl/Ug==
X-Received: by 2002:a17:906:50c:b0:a77:c6c4:2bb7 with SMTP id a640c23a62f3a-a780b68a8c6mr829041066b.1.1720801384926;
        Fri, 12 Jul 2024 09:23:04 -0700 (PDT)
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
Subject: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
Date: Fri, 12 Jul 2024 18:22:54 +0200
Message-ID: <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720799925.git.oleksii.kurochko@gmail.com>
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduces arch_pmap_{un}map functions and select HAS_PMAP
for CONFIG_RISCV.

Additionaly it was necessary to introduce functions:
 - mfn_to_xen_entry
 - mfn_to_pte

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - newly introduced patch
---
 xen/arch/riscv/Kconfig            |  1 +
 xen/arch/riscv/include/asm/page.h |  2 ++
 xen/arch/riscv/include/asm/pmap.h | 28 ++++++++++++++++++++++++++++
 xen/arch/riscv/mm.c               | 14 ++++++++++++++
 4 files changed, 45 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/pmap.h

diff --git a/xen/arch/riscv/Kconfig b/xen/arch/riscv/Kconfig
index 259eea8d3b..0112aa8778 100644
--- a/xen/arch/riscv/Kconfig
+++ b/xen/arch/riscv/Kconfig
@@ -3,6 +3,7 @@ config RISCV
 	select FUNCTION_ALIGNMENT_16B
 	select GENERIC_BUG_FRAME
 	select HAS_DEVICE_TREE
+	select HAS_PMAP
 
 config RISCV_64
 	def_bool y
diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
index cbbf3656d1..339074d502 100644
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -51,6 +51,8 @@ typedef struct {
 #endif
 } pte_t;
 
+pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
+
 static inline pte_t paddr_to_pte(paddr_t paddr,
                                  unsigned int permissions)
 {
diff --git a/xen/arch/riscv/include/asm/pmap.h b/xen/arch/riscv/include/asm/pmap.h
new file mode 100644
index 0000000000..eb4c48515c
--- /dev/null
+++ b/xen/arch/riscv/include/asm/pmap.h
@@ -0,0 +1,28 @@
+#ifndef __ASM_PMAP_H__
+#define __ASM_PMAP_H__
+
+#include <xen/bug.h>
+#include <xen/mm.h>
+
+#include <asm/fixmap.h>
+
+static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
+{
+    pte_t *entry = &xen_fixmap[slot];
+    pte_t pte;
+
+    ASSERT(!pte_is_valid(*entry));
+
+    pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
+    pte.pte |= PTE_LEAF_DEFAULT;
+    write_pte(entry, pte);
+}
+
+static inline void arch_pmap_unmap(unsigned int slot)
+{
+    pte_t pte = {};
+
+    write_pte(&xen_fixmap[slot], pte);
+}
+
+#endif /* __ASM_PMAP_H__ */
diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index d69a174b5d..445319af08 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -370,3 +370,17 @@ int map_pages_to_xen(unsigned long virt,
     BUG_ON("unimplemented");
     return -1;
 }
+
+static inline pte_t mfn_to_pte(mfn_t mfn)
+{
+    unsigned long pte = mfn_x(mfn) << PTE_PPN_SHIFT;
+    return (pte_t){ .pte = pte};
+}
+
+inline pte_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
+{
+    /* there is no attr field in RISC-V's pte */
+    (void) attr;
+
+    return mfn_to_pte(mfn);
+}
-- 
2.45.2


