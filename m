Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E50EFA5E313
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 18:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910638.1317382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAz-0000Li-0a; Wed, 12 Mar 2025 17:47:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910638.1317382; Wed, 12 Mar 2025 17:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsQAy-0000Ej-Lk; Wed, 12 Mar 2025 17:47:28 +0000
Received: by outflank-mailman (input) for mailman id 910638;
 Wed, 12 Mar 2025 17:47:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5o35=V7=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tsQAw-0006eC-Td
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 17:47:26 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f664763-ff6a-11ef-9ab9-95dc52dad729;
 Wed, 12 Mar 2025 18:47:26 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3914bc3e01aso76003f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 12 Mar 2025 10:47:26 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a8d0b79sm27333805e9.36.2025.03.12.10.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Mar 2025 10:47:25 -0700 (PDT)
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
X-Inumbo-ID: 0f664763-ff6a-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741801645; x=1742406445; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqUw1lXDWsLoEK2uMTwV0wPaZ1fDYAVfaL5LVQPDWGk=;
        b=Udv5lQxIf/E6VNrzOGOD7LJB1xLlAp6dMGQeptykmubTUUB1M2MqaeV72foBw8kUp9
         +T1LxbwMmgtfLWwieo/oI4N7aJ+iPla9t9H0cgfAcVmApc1Z4LViXO/sxvC8LtbUEnGK
         Jw4jcHFaKOPfAabUYRgCntY5SqTR1dXCA2UnA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741801645; x=1742406445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqUw1lXDWsLoEK2uMTwV0wPaZ1fDYAVfaL5LVQPDWGk=;
        b=jt6O1EfLPLbBmr7AYcH/Q/BXC3pjgulKHH3kYSat4uK744I8t/Yv6qHVbR+wCtK4Ex
         4QOsX6qnGJiUqFrMIuxmCbWtlgCU2PvTlcZIyCWFuyH25S2fQBj0/HCz/ac1++GyFwRD
         BJ+J23CoKVBlKO6v5km7QiG3QE+XEeIeTrjw9/auhwr/X3u2CJ58RrUxxOQ4BhnhJkxg
         Q20wK8o5gZjxtojtntn1qN5NnX8TG7OULo82rY3tT6nflhC8g+QAp9KvnCadtYylV4Lx
         kHJpNuUJVto9QLMn9oexhPa0tAQ+YQfZdrjc68GAt9Qyar3BaMWhXaKaSdpNKEzTdK6U
         jWgw==
X-Gm-Message-State: AOJu0YwFFqnrmAsi5+wzZbi7axxMVcRzRVW2ipDDgz4gSZXrcpvS9vQm
	uSIEpPVg7FzIYWzj33ZM1GeVfWFqK1UUKr+WN0hxqwDbvs/LE/OGthsk4QYDwYd+MvgLdKhYeor
	x
X-Gm-Gg: ASbGnctG4PoMBtochY0cCdTHOX4A+H+tmx0tCwknZPH6QVr6tbyIKbJWE+6kZdbVNmO
	AC3GugXzBRgWJ60VPZZnIyun1dNz8oSEpdSUGBIN0yH5qArv8iUZxneeSC5a/KOzWR3TKpKwGf5
	vgn7Y2QFMGoDH7x3DVlsyVViqyBYUent5cqvusn9YKyCc4CYkmQdBZyERoMKzygtpL3DHyvY5Ym
	9oJNZSgx1EF5rDgvF9bf8zQlUoLmKeIbatKbaCmBm880CiqfqligaKsJPWVGVYF3wFoquXo8rtX
	o5Ihdbk9HLNqm30J5VF/Uc4IGAsQL3VidIxJuPFP4V/iOaTWfkTpt3AfLPmlZKt6WLnD6WvHbJ0
	DB7mouCqbccwSREIE7gHnaFc7
X-Google-Smtp-Source: AGHT+IFb4jQETQduT8FxNkpfsC/um/PLF27EYcumOcxJs7Qku0Cxj5dl8mD9orNd/ncyb7UKyFKRIQ==
X-Received: by 2002:a05:6000:4102:b0:391:42f2:5c7b with SMTP id ffacd0b85a97d-393e1e345f0mr4215659f8f.16.1741801645599;
        Wed, 12 Mar 2025 10:47:25 -0700 (PDT)
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
Subject: [PATCH 8/8] xen/mm: Exclude flushtlb.h from mm.h for x86
Date: Wed, 12 Mar 2025 17:45:13 +0000
Message-Id: <20250312174513.4075066-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
References: <20250312174513.4075066-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

alternative.c and livepatch.c pick up flushtlb.h transitively through mm.h.

Fix these, and finally resolve the TODO in microcode/amd.c

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
 xen/arch/x86/alternative.c       | 1 +
 xen/arch/x86/cpu/microcode/amd.c | 2 +-
 xen/arch/x86/livepatch.c         | 1 +
 xen/include/xen/mm.h             | 4 ----
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 46b04c9cb83d..d97eda129c32 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -10,6 +10,7 @@
 #include <asm/alternative.h>
 #include <asm/apic.h>
 #include <asm/endbr.h>
+#include <asm/flushtlb.h>
 #include <asm/nmi.h>
 #include <asm/nops.h>
 #include <asm/processor.h>
diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcode/amd.c
index ee7de5282b2a..d84dc5b0ef1f 100644
--- a/xen/arch/x86/cpu/microcode/amd.c
+++ b/xen/arch/x86/cpu/microcode/amd.c
@@ -17,9 +17,9 @@
 #include <xen/bsearch.h>
 #include <xen/err.h>
 #include <xen/init.h>
-#include <xen/mm.h> /* TODO: Fix asm/tlbflush.h breakage */
 #include <xen/sha2.h>
 
+#include <asm/flushtlb.h>
 #include <asm/msr.h>
 
 #include "private.h"
diff --git a/xen/arch/x86/livepatch.c b/xen/arch/x86/livepatch.c
index 5158e91f7e6e..5c1d16ecf5a8 100644
--- a/xen/arch/x86/livepatch.c
+++ b/xen/arch/x86/livepatch.c
@@ -16,6 +16,7 @@
 
 #include <asm/endbr.h>
 #include <asm/fixmap.h>
+#include <asm/flushtlb.h>
 #include <asm/nmi.h>
 #include <asm/setup.h>
 
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 27e420e302d8..088f77eed5e5 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -587,10 +587,6 @@ void destroy_ring_for_helper(void **_va, struct page_info *page);
 /* Return the upper bound of MFNs, including hotplug memory. */
 unsigned long get_upper_mfn_bound(void);
 
-#if defined(CONFIG_X86)
-#include <asm/flushtlb.h>
-#endif
-
 enum XENSHARE_flags {
     SHARE_rw,
     SHARE_ro,
-- 
2.39.5


