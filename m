Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF19CE9D1B
	for <lists+xen-devel@lfdr.de>; Tue, 30 Dec 2025 14:51:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1194178.1512633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7p-0004qn-JD; Tue, 30 Dec 2025 13:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1194178.1512633; Tue, 30 Dec 2025 13:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vaa7p-0004m1-BJ; Tue, 30 Dec 2025 13:51:01 +0000
Received: by outflank-mailman (input) for mailman id 1194178;
 Tue, 30 Dec 2025 13:50:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=owPK=7E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vaa7n-0003x2-Lr
 for xen-devel@lists.xenproject.org; Tue, 30 Dec 2025 13:50:59 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 913cc739-e586-11f0-9ccf-f158ae23cfc8;
 Tue, 30 Dec 2025 14:50:57 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-47d493a9b96so15241325e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Dec 2025 05:50:57 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193d4f09sm609436115e9.12.2025.12.30.05.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Dec 2025 05:50:56 -0800 (PST)
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
X-Inumbo-ID: 913cc739-e586-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1767102657; x=1767707457; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UY7wHDyhy76HSLMO+hhfmsr41moB2Cd+smhrFbq1w4=;
        b=ESfyf2lgf19tc2wGmLc+OROXcyM1Z0y9ILPtNWkZ9QEicMozKjhmxgvHh4UweXZpe6
         4mY/wvmtgKOW09uYfvJr9XZTXTogoavwemHV5W/+fKFPAdCV7pwNUI+ZT2odlhICACIo
         9X2aeQrzED/kZZoqSr7LZJqhUCJEIiVG2XHzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767102657; x=1767707457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1UY7wHDyhy76HSLMO+hhfmsr41moB2Cd+smhrFbq1w4=;
        b=PuZX68xEAAhips6a49bYnfyVQ6AYWE46i9ndgD6rSuGIyfVZonq8C6EpQtx6PXcH9F
         sTrdl3QPWaw/wFzLqvJys+Prj7P3pPUKSE8I/KGK22z22y7q9HOTOBw148Tg+48r4ntg
         iFq5rbAJuJrXgh3umY9wcDGbVfw0PUALkhMt3x+bLDu+UOtv4z/wX7LltMm450YulvFM
         /zpkRXHfKYr2SCPBNwh8FD0z8MdvADj2IPMW0IJSrggUP17+KGB3lkq1R+Nb1uog+wlb
         IwaxrUOCTmRY57dZWBBMJrkGwAM+0U0xe7souLYqaAQ/QKWdEeOF3thBhecsGJQHetAp
         up8A==
X-Gm-Message-State: AOJu0YzfAO6c6tWxhxLSSw+DlWSltL89GHx8BnQmfis3Q9r6SG2vLK98
	bAGEGzbIWUBd+wmWRw09ljlUjdbGRPmezEr6c9COPRMoLhiRhjjoVr/0Q3AEYLd9ltYdj3qbo1l
	IlICz
X-Gm-Gg: AY/fxX5BDU9M9rUZtOw8BrBnaGiOld6PSd6+ksjFvN5fMljIxH86UdM08xqhKYmnlAx
	/UyjXhxQ2aCWS6zuFgg4/xfNpQBRP+/c83S4ej0IAivZ4LuNCu4QLUEbMOdPpEHelMdVmYYpggd
	echXWCm+fCqnwij9htiLTSN94h6uu28W4XLljZHwOMmiTFjbd7zhsfbcnoXy1+mRDhKKUtnCbru
	rtoWWzGcT0InjqEVw7CD2srjAuDGi5Mwibsu8Lt0DVdMdzZROgZmiDlds8L1duAt5ESmLQ+GQ4C
	2dfOWCJ5xWxQISJ2lKomwkZ2EuWZ68QzMnZy38+Oeoyc4Tm6+7yGSq/tDk/i47vkWe3475h6DKi
	kK2R4NJxLsujynIVQKRi5fH0BdtSnl2y3uHVUvfhvPn/E5SrdjE4RPP8UPMAhCzUkHtitn8yFog
	2cAS+NEK0cutbmQreKIO1Zf3kYpkjYhRQVIT2kIsZZT1jS90fl67hMkTJ50cDiHQ==
X-Google-Smtp-Source: AGHT+IGy5/FRM8UYMBjx296u1jcZ+PTdZEgmV9Spx3067pocOa7sOZEZT6PNJl7+yi0f/WXrIhKJmQ==
X-Received: by 2002:a05:600c:540e:b0:47a:7fd0:9f01 with SMTP id 5b1f17b1804b1-47d195522f7mr427457905e9.16.1767102656562;
        Tue, 30 Dec 2025 05:50:56 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/5] arm/time: Sort headers
Date: Tue, 30 Dec 2025 13:50:47 +0000
Message-Id: <20251230135050.188191-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251230135050.188191-1-andrew.cooper3@citrix.com>
References: <20251230135050.188191-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in preparation for a logical change.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/arm/time.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 3710eab109d9..03dc5b51a890 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -8,26 +8,27 @@
  * Copyright (c) 2011 Citrix Systems.
  */
 
+#include <xen/acpi.h>
 #include <xen/console.h>
+#include <xen/cpu.h>
+#include <xen/delay.h>
 #include <xen/device_tree.h>
+#include <xen/event.h>
 #include <xen/init.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
 #include <xen/mm.h>
-#include <xen/softirq.h>
+#include <xen/notifier.h>
 #include <xen/sched.h>
-#include <xen/time.h>
-#include <xen/delay.h>
 #include <xen/sched.h>
-#include <xen/event.h>
-#include <xen/acpi.h>
-#include <xen/cpu.h>
-#include <xen/notifier.h>
+#include <xen/softirq.h>
+#include <xen/time.h>
+
+#include <asm/cpufeature.h>
+#include <asm/platform.h>
 #include <asm/system.h>
 #include <asm/time.h>
 #include <asm/vgic.h>
-#include <asm/cpufeature.h>
-#include <asm/platform.h>
 
 uint64_t __read_mostly boot_count;
 
-- 
2.39.5


