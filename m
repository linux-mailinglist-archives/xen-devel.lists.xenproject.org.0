Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C232C36A919
	for <lists+xen-devel@lfdr.de>; Sun, 25 Apr 2021 22:13:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.117301.223111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal8A-0001Rn-3Q; Sun, 25 Apr 2021 20:13:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 117301.223111; Sun, 25 Apr 2021 20:13:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lal89-0001RO-Vh; Sun, 25 Apr 2021 20:13:25 +0000
Received: by outflank-mailman (input) for mailman id 117301;
 Sun, 25 Apr 2021 20:13:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lal88-0001QK-8J
 for xen-devel@lists.xenproject.org; Sun, 25 Apr 2021 20:13:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal87-0000o0-R7; Sun, 25 Apr 2021 20:13:23 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lal87-0005m7-Gv; Sun, 25 Apr 2021 20:13:23 +0000
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
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=aeGTdR45KQ3asOXLFfCMyppOP+nTbqurYRYNJDh+L6k=; b=iMNjfTueq2jlaMv+RGtfn2lyn
	u750jZZVVvNq5BUM8wRsDBVg3PJlrmq3C5kCCB69a1gNwAiwBtlClrn73J6zujzywaGAM53jADEFx
	41AGctMqHBV7mQ5CO/IRrpuYlpXglS/SK/AyuYPoXgFAn+30fTzbt/iSmRzj/xHcBu8Aw=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Wei.Chen@arm.com,
	Henry.Wang@arm.com,
	Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH RFCv2 01/15] xen/arm: lpae: Rename LPAE_ENTRIES_MASK_GS to LPAE_ENTRY_MASK_GS
Date: Sun, 25 Apr 2021 21:13:04 +0100
Message-Id: <20210425201318.15447-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210425201318.15447-1-julien@xen.org>
References: <20210425201318.15447-1-julien@xen.org>

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
 xen/include/asm-arm/lpae.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/lpae.h b/xen/include/asm-arm/lpae.h
index e94de2e7d8e8..4fb9a40a4ca9 100644
--- a/xen/include/asm-arm/lpae.h
+++ b/xen/include/asm-arm/lpae.h
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
2.17.1


