Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D321D4C66DA
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:07:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280288.478181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcvo-00025C-1q; Mon, 28 Feb 2022 10:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280288.478181; Mon, 28 Feb 2022 10:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcvn-00021r-TJ; Mon, 28 Feb 2022 10:07:03 +0000
Received: by outflank-mailman (input) for mailman id 280288;
 Mon, 28 Feb 2022 10:07:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOcvm-00020A-D3
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:07:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcvm-0002MD-3z; Mon, 28 Feb 2022 10:07:02 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcvl-0004V1-SI; Mon, 28 Feb 2022 10:07:02 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=f3Jb6TzGg/yx/at/IZdJKmtMdmjk5P7HjMANFFUjdOs=; b=1Hf6EM
	NF+7ulziq1Gje4Oec+PyKnNb+WnaNr0P+i8oi/PhGKJ0OZXxBOHdVDF2mfZReFO4gtxi8rpQLtwe1
	Z5v6hbVveBOoad+ESyhgrRFQdvYKlQkV0rRvhdToemmo/B0ma8reaN9yWH4TjCfhnQ/K8FIbVKsdi
	sp9VRE0Rz6Q=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: mm: Encode existing constraints of the memory layout
Date: Mon, 28 Feb 2022 10:06:59 +0000
Message-Id: <20220228100659.58089-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The boot code expects the regions XEN_VIRT_START, FIXMAP_ADDR(0),
BOOT_FDT_VIRT_START to use the same 0th (arm64 only) and 1st slot.

Add some BUILD_BUG_ON() to confirm that. This is helpful if one wants
to re-order the memory layout.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/mm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 8a17222109c6..40423a70f0ae 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -211,6 +211,22 @@ static void __init __maybe_unused build_assertions(void)
 #ifdef CONFIG_DOMAIN_PAGE
     BUILD_BUG_ON(DOMHEAP_VIRT_START & ~FIRST_MASK);
 #endif
+    /*
+     * The boot code expects the regions XEN_VIRT_START, FIXMAP_ADDR(0),
+     * BOOT_FDT_VIRT_START to use the same 0th (arm64 only) and 1st
+     * slot.
+     */
+#define CHECK_SAME_SLOT(level, virt1, virt2) \
+    BUILD_BUG_ON(level##_table_offset(virt1) != level##_table_offset(virt2))
+
+#ifdef CONFIG_ARM_64
+    CHECK_SAME_SLOT(zeroeth, XEN_VIRT_START, FIXMAP_ADDR(0));
+    CHECK_SAME_SLOT(zeroeth, XEN_VIRT_START, BOOT_FDT_VIRT_START);
+#endif
+    CHECK_SAME_SLOT(first, XEN_VIRT_START, FIXMAP_ADDR(0));
+    CHECK_SAME_SLOT(first, XEN_VIRT_START, BOOT_FDT_VIRT_START);
+
+#undef CHECK_SAME_SLOT
 }
 
 void dump_pt_walk(paddr_t ttbr, paddr_t addr,
-- 
2.32.0


