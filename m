Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8945BA5E309
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:47:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910630.1317316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAs-00078n-J7; Wed, 12 Mar 2025 17:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910630.1317316; Wed, 12 Mar 2025 17:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAs-000778-FT; Wed, 12 Mar 2025 17:47:22 +0000
Received: by outflank-mailman (input) for mailman id 910630;
 Wed, 12 Mar 2025 17:47:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o35=V7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsQAr-0006eC-3o
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:47:21 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0bdfa7d0-ff6a-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 18:47:20 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so406795e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 10:47:20 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0b79sm27333805e9.36.2025.03.12.10.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:47:19 -0700 (PDT)
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
X-Inumbo-ID: 0bdfa7d0-ff6a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741801639; x=1742406439; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sjnR5X/bvG/Rmeh84cSnx/kY2mYzKC0sb4JiHUky2ww=;
        b=UGjGwvGO3CJPXz+G38z5DEqYsPLyr3u4G1Yj76J6Rjt2JRcbhaP+SAVDUFBHhpLyuW
         J4j5c4AM7w7N2q/QbjFyb5abIY+0ffBhu3wXXF8GI/7Dim5AV6zRWKL3UwYyHJg+IdVC
         im2AIFm+Q7SGfNkR7kNxntkjhsDN6FTfYPHgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801639; x=1742406439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sjnR5X/bvG/Rmeh84cSnx/kY2mYzKC0sb4JiHUky2ww=;
        b=fb2bgusWYiuPEGlyE32upsr0wUDKZL00ND91vwEOUiuLAWFqanAR3/iCWBKn3zNnFb
         H3E004jvPPg2R4zZlVJOxbZog+zzlo/2gESCuhks+/veLC2TYb3YltOjiNT7Gnk+vi57
         VcAxifKX+PtxktHpUgcxXYvKW5VcRb/h6UdgJyha9EULMX4MiiTtGbvXOv9UZ+PPbVqL
         IQmRmtkbtrI1hhGfvJ0wDwJaGBJa52/CirXyUVlwQ9zziCWad4qX4yUE2vmoYbhcZnk5
         KekUPrCHpOTePS2n8fs4Fj+sjjQOgY8wHWLcBfQoudyRsEszcUj+k9Fg90YosWsylmvz
         nwtA==
X-Gm-Message-State: AOJu0YyzYVMnf/VjHJqCc0ck5Vh8IxZO71OILyTm9j5+O/hCrZ6nqhga
	IT61r6wxcuJzfKD1lS5haGBYheaRjJqQPMUfaeDTPud6C+bnOTwWlb5dv/iEuQylxY4/BKIryDm
	T
X-Gm-Gg: ASbGnctrIZyW5KZQWqpwAtugD9gdlj89W1MJOZm6+k1IxoDqJP9XsRAdj8kMMwDZJM5
	T0fQi+OPDF3Crndt8c/DurCLjVgWqprDVcR1VZsVmURXRTSaYBqgggxQ5YBqccLt0B0meZ/RAR2
	pVGvIqgSSTZbItLnRmxrs0SqqE7E1QxeRDtHqbR3/6YEuNMXp3M0SsFoMmHrj9+5JeaLD7wRzVj
	WJ5DAWQPAewor02kqXOZI5hUzgGwDVdZwudyry+8lQ/DXywPxcbF1zHWcWTSQI9ivRzQL5gM0Cp
	vlDAs1iCqYnll5tWioykE0O1gGWQREVUNAlBVlDhMYueuXBJ5ccjkGqejWFpfecs8wkYqZS774E
	EIPyOaAUUl/MHoYRgH18t3A+S
X-Google-Smtp-Source: AGHT+IERj70emN4JXV0Hed5t9quWPL7b6/6L7k1RqZgYBZc+Z+cuxtIHpttWzPQyPqsdoOb8vClk2w==
X-Received: by 2002:a05:600c:3b13:b0:43d:b3:f95 with SMTP id 5b1f17b1804b1-43d00b313bemr87216185e9.28.1741801639477;
        Wed, 12 Mar 2025 10:47:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 3/8] xen: Sort includes
Date: Wed, 12 Mar 2025 17:45:07 +0000
Message-Id: <20250312174513.4075066-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... needing later adjustment.  Drop types.h when it's clearly not needed.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/arm/mmu/setup.c   |  2 +-
 xen/arch/x86/alternative.c | 12 ++++++------
 xen/arch/x86/livepatch.c   |  8 ++++----
 xen/common/memory.c        |  4 +++-
 xen/common/page_alloc.c    |  5 ++---
 xen/include/xen/mm.h       |  6 +++---
 6 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 30afe9778194..f6119ccacf15 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -12,8 +12,8 @@
 #include <xen/sizes.h>
 #include <xen/vmap.h>
 
-#include <asm/setup.h>
 #include <asm/fixmap.h>
+#include <asm/setup.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef mfn_to_virt
diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 1ba35cb9ede9..46b04c9cb83d 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -4,18 +4,18 @@
  */
 
 #include <xen/delay.h>
-#include <xen/types.h>
+#include <xen/init.h>
+#include <xen/livepatch.h>
+
+#include <asm/alternative.h>
 #include <asm/apic.h>
 #include <asm/endbr.h>
+#include <asm/nmi.h>
+#include <asm/nops.h>
 #include <asm/processor.h>
-#include <asm/alternative.h>
-#include <xen/init.h>
 #include <asm/setup.h>
 #include <asm/system.h>
 #include <asm/traps.h>
-#include <asm/nmi.h>
-#include <asm/nops.h>
-#include <xen/livepatch.h>
 
 #define MAX_PATCH_LEN (255-1)
 
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index bdca355dc6cc..5158e91f7e6e 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -5,14 +5,14 @@
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
+#include <xen/livepatch.h>
+#include <xen/livepatch_elf.h>
 #include <xen/mm.h>
 #include <xen/pfn.h>
-#include <xen/vmap.h>
-#include <xen/livepatch_elf.h>
-#include <xen/livepatch.h>
 #include <xen/sched.h>
-#include <xen/vm_event.h>
 #include <xen/virtual_region.h>
+#include <xen/vm_event.h>
+#include <xen/vmap.h>
 
 #include <asm/endbr.h>
 #include <asm/fixmap.h>
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 8ca4e1a8425b..61a94b23abae 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -25,12 +25,14 @@
 #include <xen/sched.h>
 #include <xen/sections.h>
 #include <xen/trace.h>
-#include <xen/types.h>
+
 #include <asm/current.h>
 #include <asm/hardirq.h>
 #include <asm/p2m.h>
 #include <asm/page.h>
+
 #include <public/memory.h>
+
 #include <xsm/xsm.h>
 
 #ifdef CONFIG_X86
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 5f9c9305ef37..bc029ea797a2 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -133,7 +133,6 @@
 #include <xen/param.h>
 #include <xen/perfc.h>
 #include <xen/pfn.h>
-#include <xen/types.h>
 #include <xen/sched.h>
 #include <xen/sections.h>
 #include <xen/softirq.h>
@@ -144,14 +143,14 @@
 #include <asm/flushtlb.h>
 #include <asm/page.h>
 
-#include <public/sysctl.h>
 #include <public/sched.h>
+#include <public/sysctl.h>
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
 #include <asm/p2m.h>
-#include <asm/setup.h> /* for highmem_start only */
 #include <asm/paging.h>
+#include <asm/setup.h>
 #else
 #define p2m_pod_offline_or_broken_hit(pg) 0
 #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg)
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 16f733281af3..45000cc3f64b 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -63,11 +63,11 @@
 
 #include <xen/bug.h>
 #include <xen/compiler.h>
-#include <xen/mm-frame.h>
-#include <xen/types.h>
 #include <xen/list.h>
-#include <xen/spinlock.h>
+#include <xen/mm-frame.h>
 #include <xen/perfc.h>
+#include <xen/spinlock.h>
+
 #include <public/memory.h>
 
 struct page_info;
-- 
2.39.5


