Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 489292AFAE7
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:59:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25370.53108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy9a-0007kd-GK; Wed, 11 Nov 2020 21:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25370.53108; Wed, 11 Nov 2020 21:59:46 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy9a-0007iW-2L; Wed, 11 Nov 2020 21:59:46 +0000
Received: by outflank-mailman (input) for mailman id 25370;
 Wed, 11 Nov 2020 21:59:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy3f-00064v-Qk
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:39 +0000
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5127b06-50ef-41e0-b499-a0baf39ee347;
 Wed, 11 Nov 2020 21:52:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id p22so3574027wmg.3
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:53 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:52 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy3f-00064v-Qk
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:39 +0000
X-Inumbo-ID: e5127b06-50ef-41e0-b499-a0baf39ee347
Received: from mail-wm1-x32e.google.com (unknown [2a00:1450:4864:20::32e])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e5127b06-50ef-41e0-b499-a0baf39ee347;
	Wed, 11 Nov 2020 21:52:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id p22so3574027wmg.3
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DEXuW1ye/R98bU3FkkVyzjawl7M6F4lMcGyQWz2Hrt0=;
        b=BDCjgexRF/nkz3zayZWKWBFaJk9GsuImSgpzdNEtS12TjZz80LiOSrhUXbkNafK57w
         h5ecFabJtWNoue+CmBqaNr98EBM69CmIS1yS6hr+UHuv/vjGglyeur3hHD9UyFGHzFJQ
         6a3LQUiDXa6LOL76y18d3fwq8XG1BjquH5kBGiPQ1YO2RJnve8LLUrrhMusuS0tDOkgI
         qrcCe2Ri2jMXID6Q5ZyNZdESrQXKGR8yn28pw4TfYfIeaKAjldMeYiX5IiG7DqJePoHq
         SVPu43W2CSIxYh2KW17g5p2ATcPEOes+tAGHF4BLuzwOqI9svz4MZxTfcicYCaor4Tqi
         QB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DEXuW1ye/R98bU3FkkVyzjawl7M6F4lMcGyQWz2Hrt0=;
        b=MSpChR8uVD9xMruncQ0QQVp8gdvZoHvOGSXYffGy+4oA1DceTWugVO3PxUV56UtKxc
         UzBD5EeichEUnOKxMJY9mQ5bE8M+rA0WnR3HuZ/Cl8SFzr0zWlyGuixfjU6PICwbxWR5
         Sw9ic2/nBkvi/19fc90zswB767gQpNFHv/sT0VpHS87hDhXlZcNNGXwmpMMW6Sex6EdB
         qV5XHDt56gH1AJByighYeBRS4OjZuZ0LfOCymcGuSTNISNAy3U6eMIiQwOTGozz+gnXD
         LllWvZtLP7NqqZm5Fi+oeFukFbavEwm9xWxG08rgr1RGntR96SWdA/H9cVT09Ct5+1w4
         dsyg==
X-Gm-Message-State: AOAM533GdcgzfjTgpaA9fkwn3FyRcbB+3/zulIZFkYcmwOT1HD6b5RSU
	9tMrObWNNiYQvWq2I6C/BFXRfKnNmJM=
X-Google-Smtp-Source: ABdhPJykiIWBidlXLzHt7P7UzHcuzyRNwaZ4CUeVlycKkFPOa7EMnevqGj7uV7xjzomLA9nrmSItfw==
X-Received: by 2002:a1c:5a06:: with SMTP id o6mr6406841wmb.181.1605131572888;
        Wed, 11 Nov 2020 13:52:52 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:52 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 12/15] xen/arm64: port Linux's arm64 lse.h to Xen
Date: Wed, 11 Nov 2020 21:52:00 +0000
Message-Id: <20201111215203.80336-13-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

This just involves making system_uses_lse_atomics() call cpus_have_cap()
instead of directly looking up in cpu_hwcap_keys.

Not 100% sure whether this is a valid transformation until I do a run
test.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm64/lse.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/include/asm-arm/arm64/lse.h b/xen/include/asm-arm/arm64/lse.h
index 704be3e4e4..847727f219 100644
--- a/xen/include/asm-arm/arm64/lse.h
+++ b/xen/include/asm-arm/arm64/lse.h
@@ -1,28 +1,28 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_LSE_H
-#define __ASM_LSE_H
+/*
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+#ifndef __ASM_ARM_ARM64_LSE_H
+#define __ASM_ARM_ARM64_LSE_H
 
-#include <asm/atomic_ll_sc.h>
+#include "atomic_ll_sc.h"
 
 #ifdef CONFIG_ARM64_LSE_ATOMICS
 
 #define __LSE_PREAMBLE	".arch_extension lse\n"
 
-#include <linux/compiler_types.h>
-#include <linux/export.h>
-#include <linux/jump_label.h>
-#include <linux/stringify.h>
+#include <xen/compiler.h>
+#include <xen/stringify.h>
+#include <xen/types.h>
+
 #include <asm/alternative.h>
-#include <asm/atomic_lse.h>
-#include <asm/cpucaps.h>
 
-extern struct static_key_false cpu_hwcap_keys[ARM64_NCAPS];
-extern struct static_key_false arm64_const_caps_ready;
+#include "atomic_lse.h"
 
 static inline bool system_uses_lse_atomics(void)
 {
-	return (static_branch_likely(&arm64_const_caps_ready)) &&
-		static_branch_likely(&cpu_hwcap_keys[ARM64_HAS_LSE_ATOMICS]);
+	return cpus_have_cap(ARM64_HAS_LSE_ATOMICS);
 }
 
 #define __lse_ll_sc_body(op, ...)					\
@@ -45,4 +45,4 @@ static inline bool system_uses_lse_atomics(void) { return false; }
 #define ARM64_LSE_ATOMIC_INSN(llsc, lse)	llsc
 
 #endif	/* CONFIG_ARM64_LSE_ATOMICS */
-#endif	/* __ASM_LSE_H */
\ No newline at end of file
+#endif	/* __ASM_ARM_ARM64_LSE_H */
\ No newline at end of file
-- 
2.24.3 (Apple Git-128)


