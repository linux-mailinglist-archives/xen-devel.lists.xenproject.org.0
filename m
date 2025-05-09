Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEADAB1A87
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 18:32:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980252.1366743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQe9-0002MV-HO; Fri, 09 May 2025 16:32:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980252.1366743; Fri, 09 May 2025 16:32:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDQe9-0002KI-DY; Fri, 09 May 2025 16:32:25 +0000
Received: by outflank-mailman (input) for mailman id 980252;
 Fri, 09 May 2025 16:32:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SZc7=XZ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uDQe7-0001fR-Lm
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 16:32:23 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2eaaec2d-2cf3-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 18:32:22 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3a1fa0d8884so505530f8f.3
 for <xen-devel@lists.xenproject.org>; Fri, 09 May 2025 09:32:22 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58ecb46sm3790069f8f.30.2025.05.09.09.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 May 2025 09:32:20 -0700 (PDT)
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
X-Inumbo-ID: 2eaaec2d-2cf3-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1746808341; x=1747413141; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAXP9jNKNZBQcjh+QziOUIyrdCODDG8+CjfV4+CNhS0=;
        b=VRx04bEY45W020o8rSwE37xoi/LmCKlhvaCG2VV5UtWPcCoPyeeqAGcWKM5xI+Gjqb
         pxzNk7SGcqnltq9Nkv7sXsWEOMW5E23CfQvrgvSC7xJy73569cwaZeePfImYSMi4PZzv
         RY6ul0IEREOVsLQWh7ZWhhPVDaNrvFsEjNBIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746808341; x=1747413141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAXP9jNKNZBQcjh+QziOUIyrdCODDG8+CjfV4+CNhS0=;
        b=UNydKjzBhtoFGe5u5dtlV2F2E82hBHFTrIvUxy2U3ZPZj78XR1GV0nSOchEIKjT61v
         eHw3u9zRXJct6d79vXYj64gf2DOipyIswk8JEY05nLshn7u0v6Mnuz6PENCaLJId70Jt
         7vDvrnC1aRBT+VhTMO8kjws0tRwTqWaYzkCMdlQTleOsyeXORyRXZe5bQhn2l6Rz4ccy
         8h5+zw3TJBe9HvszJxdYRtYf7kdM9OUYAhTqT6kG5GWZS6M3Impot7uUpSRxsKROW1uG
         5CZNx5ve3CxIfmlFYz0QpTMNSQvyG2s3rz+FH731SKm5eYTHZ0u1W6g0ysKJPPefQ1Ng
         EhZg==
X-Gm-Message-State: AOJu0Yz0HkJ39V19F2AReQByXoqZGWi5ep8dIiEnqmNYlorvrQ5d1GnE
	H09bVDRB7to737UP8AeXC304f2wpkkliL0AWpYaLSFXFy0XPjCkdzMwLLK8FqJRemK/TcaSN8Ei
	U
X-Gm-Gg: ASbGncu+C7M8FkpWbmZdg66k2Bc3cvzVpyk3/K09JWVQRq67TntXp+b/g1s20+hp644
	/It94XnlTNcnKKJ/r+MXfCme4OmhR6kkJ6q2T25rjbTI6Iect6FJs19GdlypE5kVTzVZp9Ocv8U
	sWphU8Xsp2oHE/CdQsd7HHWmfdc5Q3u7FMVnJBHUokZdjgJQmlwQpoCstC8zXy7gtvOfWkCXMfk
	pJ3NWPECly7I9SJto7vgzqi84tbmvcSeM3hjMZImB9D409TJfHrUVFc9nNlwch+Ru1/cCvbEnqS
	QNcLUmmKhOPcPhjfWhmTfsKGwvOvBG2WJ7NcsRsB0aWWbw63SMXSe9d5RnCtDfADgDzyt+J+2Nf
	Wi1/HQDsyygY8eg==
X-Google-Smtp-Source: AGHT+IG1SRocew/woE3uS+KwwlFuShOVr+D6+gAoal7pb1bgIp8zpx4UNcPkC37nC/tBic4cfQ1i1Q==
X-Received: by 2002:a5d:64cd:0:b0:3a0:b550:ded4 with SMTP id ffacd0b85a97d-3a1f6437188mr3688417f8f.13.1746808341315;
        Fri, 09 May 2025 09:32:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 3/3] xen: Sort includes
Date: Fri,  9 May 2025 17:32:12 +0100
Message-Id: <20250509163212.2948359-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250509163212.2948359-1-andrew.cooper3@citrix.com>
References: <20250509163212.2948359-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... needing later adjustment.  Drop types.h when it's clearly not needed.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
index 43b009888c02..03669e9d8e8a 100644
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
index bd4538c28d82..8f891d12dbf0 100644
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
index e89942b87d1e..78cbb977dd04 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -63,12 +63,12 @@
 
 #include <xen/bug.h>
 #include <xen/compiler.h>
+#include <xen/list.h>
 #include <xen/mm-frame.h>
 #include <xen/mm-types.h>
-#include <xen/types.h>
-#include <xen/list.h>
-#include <xen/spinlock.h>
 #include <xen/perfc.h>
+#include <xen/spinlock.h>
+
 #include <public/memory.h>
 
 struct page_info;
-- 
2.39.5


