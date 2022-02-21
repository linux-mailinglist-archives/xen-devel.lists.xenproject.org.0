Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C528F4BD912
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275987.472006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5pp-0004N5-Mz; Mon, 21 Feb 2022 10:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275987.472006; Mon, 21 Feb 2022 10:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5pp-0004HM-Jd; Mon, 21 Feb 2022 10:22:25 +0000
Received: by outflank-mailman (input) for mailman id 275987;
 Mon, 21 Feb 2022 10:22:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM5po-0004FP-7v
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:22:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pn-0002AY-Ua; Mon, 21 Feb 2022 10:22:23 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pn-00070b-MY; Mon, 21 Feb 2022 10:22:23 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ACRkY4KhzmsVNHMcOkXHEpsxlBF8BKtVgEaQlfg0BNc=; b=55WepRFLg0bmiSYJclRhlTge7D
	MgBe3sFdk4LNDN/N9g7c556hnZI3Swp9dkMRo3B6xkB/Emt9NTSaqapqaom6QGkTgsUZkTHJbFzK2
	0x82I94h1yvGUi5rZBoFHXrQhllYxh0iLFsPkuLsl+fNvtPJo7InySh5mOOiucG0vl+U=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 01/19] xen/arm: lpae: Rename LPAE_ENTRIES_MASK_GS to LPAE_ENTRY_MASK_GS
Date: Mon, 21 Feb 2022 10:22:00 +0000
Message-Id: <20220221102218.33785-2-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Commit 05031fa87357 "xen/arm: guest_walk: Only generate necessary
offsets/masks" introduced LPAE_ENTRIES_MASK_GS. In a follow-up patch,
we will use it for to define LPAE_ENTRY_MASK.

This will lead to inconsistent naming. As LPAE_ENTRY_MASK is used in
many places, it is better to rename LPAE_ENTRIES_MASK_GS and avoid
some churn.

So rename LPAE_ENTRIES_MASK_GS to LPAE_ENTRY_MASK_GS.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - New patch
---
 xen/arch/arm/include/asm/lpae.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index e94de2e7d8e8..4fb9a40a4ca9 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -180,7 +180,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
  */
 #define LPAE_SHIFT_GS(gs)         ((gs) - 3)
 #define LPAE_ENTRIES_GS(gs)       (_AC(1, U) << LPAE_SHIFT_GS(gs))
-#define LPAE_ENTRIES_MASK_GS(gs)  (LPAE_ENTRIES_GS(gs) - 1)
+#define LPAE_ENTRY_MASK_GS(gs)  (LPAE_ENTRIES_GS(gs) - 1)
 
 #define LEVEL_ORDER_GS(gs, lvl)   ((3 - (lvl)) * LPAE_SHIFT_GS(gs))
 #define LEVEL_SHIFT_GS(gs, lvl)   (LEVEL_ORDER_GS(gs, lvl) + (gs))
@@ -188,7 +188,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
 
 /* Offset in the table at level 'lvl' */
 #define LPAE_TABLE_INDEX_GS(gs, lvl, addr)   \
-    (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRIES_MASK_GS(gs))
+    (((addr) >> LEVEL_SHIFT_GS(gs, lvl)) & LPAE_ENTRY_MASK_GS(gs))
 
 /* Generate an array @var containing the offset for each level from @addr */
 #define DECLARE_OFFSETS(var, addr)          \
-- 
2.32.0


