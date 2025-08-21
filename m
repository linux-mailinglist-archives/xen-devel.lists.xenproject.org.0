Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F5B2FF09
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 17:48:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088953.1446653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Wi-0007sM-3m; Thu, 21 Aug 2025 15:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088953.1446653; Thu, 21 Aug 2025 15:48:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up7Wi-0007qE-0H; Thu, 21 Aug 2025 15:48:32 +0000
Received: by outflank-mailman (input) for mailman id 1088953;
 Thu, 21 Aug 2025 15:48:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O+vP=3B=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1up7Wg-0007q3-B8
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 15:48:30 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 47b478fe-7ea6-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 17:48:28 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-45a1b05a49cso8893775e9.1
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 08:48:28 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b4e88bbe0sm14951355e9.4.2025.08.21.08.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 08:48:27 -0700 (PDT)
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
X-Inumbo-ID: 47b478fe-7ea6-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755791307; x=1756396107; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ETf/shatqPffnXA6oAKTTU45GK4L5fVLbAuzpxIwIWU=;
        b=foCSx2SqzPSdswODgYZohANzxF+IN+7r8N8rwNHW99ofnTeV9pYx22UUp3m0iK9G6M
         QFwKGLMbstvCpRrhSzex5ffTP9qPkTnkH/E/mXth/bVUGJtAhBPIwBOmP0a53RuX1uqA
         hSa//ebh1/o436I/9W/jQZZcsVTQIwLUOxSl0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755791307; x=1756396107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETf/shatqPffnXA6oAKTTU45GK4L5fVLbAuzpxIwIWU=;
        b=U5vihi6CK9S9DcNZ1ZNRQJwWln9M94RoIMVMVxGeeH2D0vDrHTTIFUvQ5nDkVTh18P
         j1cixHKUNbsNZNFGhj4U4mq9EXgjcjVqK2/ne4Xr3RweuXUUPLq36bArmfTGDxBfDWJm
         aB0yAKrTod33i09a/WqZbyiLpXzWRBjp4GyaHhfN+U3JfXbKALMzUU90YrO1oos8sT86
         cLM6LYp4J5WQmVrg1Vk5fgsyPt39WLNbLnLL3V1XE2stsWVI3A+2R7EuqrL650RuE8j+
         FAQO455//gLwGprxupFQ/x4PHIQx6RccnvkdEFvy4xivffO+5l1vuIoyb65jRuNkggoK
         c3sQ==
X-Gm-Message-State: AOJu0YxT3OO2X8SbGsX3+qU2owIng7jEKAVYJg/HqvHiOayZbgS1aT1/
	ZKDOr6wYxLukR8DSGIamTBMyUIVTNJeP7Nn24ATN5dXVj8fpeg9KBelFV98HjzZ8TQFUXhnnFhm
	3Jdw6
X-Gm-Gg: ASbGncu//AJoPfP70g8acdcKNjMO7Z19RlEeEdMksfSaNEH/1jjs4TkRAlJWD57YAzy
	4a2Hp/wCpFL0U0atkTfvRqxFpTnqLKyv59x2o07EqaZ1yeI31IVfP5f9ZearaTz+KDRwQkt0DPr
	/TJ+TdRvyMJCY9lrX5ykudt9rOHVce955K7mNjtcINCr0QHTMIQELMJZ4QkyQiL4ciLDvG10OjD
	PSGymtHSfIMPijKpVSrgI5H8qLEmWiko3eCbqaNhoAFaoQQEdEeFrKE267F9iKoNzOu0vx/4D5v
	DztcJd0xvKynFV/kQmCmOcsDrDulC2xy8HzIHj71+YNgu6+PrwTcQGUiebtiCA8xgg3hta6Bovx
	q8NjpWhAFqdDDAgjAfY66WSR93w7gJy6/zK1B5HXGGdx6rWzYt0HV9UGarkpdOWqG/WkBARWb8a
	+Y
X-Google-Smtp-Source: AGHT+IFtUl/yPDzugLgrYN/X46AMEEwh+C1QhhiOhUs4IqnQwcEpJPYKJ+PwMnFgWRwZItb+rR9CiA==
X-Received: by 2002:a05:600c:1f0e:b0:45b:47e1:ef76 with SMTP id 5b1f17b1804b1-45b4d86c5d6mr23213815e9.37.1755791307414;
        Thu, 21 Aug 2025 08:48:27 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/2] x86/mce: Sort headers
Date: Thu, 21 Aug 2025 16:48:24 +0100
Message-Id: <20250821154825.3968600-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/mcheck/mce_intel.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 1e52b1ac25a4..d1d61bc95069 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -1,29 +1,30 @@
+#include <xen/cpu.h>
+#include <xen/delay.h>
+#include <xen/event.h>
 #include <xen/init.h>
-#include <xen/types.h>
 #include <xen/irq.h>
-#include <xen/event.h>
 #include <xen/kernel.h>
-#include <xen/delay.h>
+#include <xen/mm.h>
 #include <xen/param.h>
 #include <xen/smp.h>
-#include <xen/mm.h>
-#include <xen/cpu.h>
-#include <asm/processor.h>
-#include <public/sysctl.h>
-#include <asm/system.h>
+
+#include <asm/apic.h>
+#include <asm/mce.h>
 #include <asm/msr.h>
 #include <asm/p2m.h>
-#include <asm/mce.h>
-#include <asm/apic.h>
+#include <asm/processor.h>
+#include <asm/system.h>
 
 #include <acpi/cpufreq/cpufreq.h>
 
-#include "mce.h"
-#include "x86_mca.h"
+#include <public/sysctl.h>
+
 #include "barrier.h"
+#include "mcaction.h"
+#include "mce.h"
 #include "util.h"
 #include "vmce.h"
-#include "mcaction.h"
+#include "x86_mca.h"
 
 static DEFINE_PER_CPU_READ_MOSTLY(struct mca_banks *, mce_banks_owned);
 static bool __read_mostly ser_support;
-- 
2.39.5


