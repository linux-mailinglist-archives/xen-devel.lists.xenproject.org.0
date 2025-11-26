Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 970D4C8B2A2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 18:16:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173275.1498362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJ7N-0004WN-JQ; Wed, 26 Nov 2025 17:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173275.1498362; Wed, 26 Nov 2025 17:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOJ7N-0004Pn-C5; Wed, 26 Nov 2025 17:15:49 +0000
Received: by outflank-mailman (input) for mailman id 1173275;
 Wed, 26 Nov 2025 17:15:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZBX=6C=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vOJ7L-0004LK-UN
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 17:15:47 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b886386-caeb-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 18:15:45 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-477b5e0323bso6683505e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 09:15:45 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa3592sm40370605f8f.21.2025.11.26.09.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 09:15:42 -0800 (PST)
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
X-Inumbo-ID: 8b886386-caeb-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764177345; x=1764782145; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXsYxM3NpDUeaEZxK8r/tveqmM11gYyncoITFszEZzk=;
        b=skPisG8klWyqrczqC8QKVaq3o95YBvDBjK7iVNt+k4Ptyw0FO6BaokLSggLG42rrvu
         kUUtJREOBboeshKDTY42cqMxubGHGLZujiDvExt6Q9ie2H1leUi2czbmzHRv6Bt2/6fZ
         rHif8RLhzcI3hTzYQX6cZL9yK3JzYsJQVn8Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764177345; x=1764782145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RXsYxM3NpDUeaEZxK8r/tveqmM11gYyncoITFszEZzk=;
        b=TB0y9Lost2cnOGBwlcAWTfguqZNNyacQJNJncxo/M0DP/JZMtOHDF9Bzsn94ujYw3G
         qmyqpn4WGpwn7zrHj/sWW11uqonYuz8jNHFVLn8D2QmayCpX6b7bUYoZXsvC/SM89hmE
         t+r30kieYu4jgTTeDCeXUjT0YaRbv6Cj+DU+WeYfCdLBksIo5KBVcg4EMqMp5SWJ7IPg
         o1hqDW8sElxQFf5CXOq6OSg+SKN2ltzPhGaPQmUq+3t0QB73ifcVhg0qW58AUROJb8DT
         BGP/f2zcA8oZBMJQHjiXLucU1WTfwXQozg1aNl4/hhn0TH9RUmWEal9iGrLOFh/yI+rI
         zWSQ==
X-Gm-Message-State: AOJu0YziKU1w+VcfJHKqn26Myek1HFliP4LeuI1E5ah2FOPqcFURvc9u
	CLoRxB8isPr6pCTuNFqYiWh29TJEsmdKayUGXr9Biwo6Vmn378W2E6Z13KipEFGuXjs9DzYgxHq
	Fc1yz
X-Gm-Gg: ASbGncsbXbogTNh019N/Q8wMpL+pgx9BXuNoppFlsHJG3fllp2kqjwS4xsbj8/tdWle
	ftB6mS7MuCLbbPtoju69Pt9oXPhSvfY17W6Lol4TrEHv9VuSpxgexsl9Ct/8TLmqBbyI1NsYkrZ
	gdHr3skPrQXuLX6GTx3Q5/zgXGbi2FoblYUvH05aOd4rnAxouSqwZVTFDNstK6311So9z5USvjM
	hblD526VWYdEuD51sA7SgRWrBCDCX+lVX1LYaE6L6IP7Cj8M9re/yn5BO9BKry1OtxEPY0X6uaL
	dKEXdJb87YcQxRHD+o5BYQm+uyxi9NN1hZf92MTSEt/5Ig3wy0lN+9gp47ibViGPhA3kL8Ez7rI
	+O9DqOy18nJZVc32bNX9v06ACXOVa64rJzxAnTid2otcih6B60AW7M79Gu30u0dPPyYHuJ6Ur66
	MRc5Zo59QE+dGTF+U6aAV6PU9WlrTP7v1iHqdF3iYktdRyOCHiScSHfx+NsJri3Q==
X-Google-Smtp-Source: AGHT+IGhZ4dg4Q5HyFYywxH2E1wqfJXcwiXUBDM62MEfhqT4b8CSn77GvlL3wKsKaAU5Il3JSVWiyg==
X-Received: by 2002:a5d:5850:0:b0:429:c719:e0aa with SMTP id ffacd0b85a97d-42cba63a6f8mr28596975f8f.6.1764177343427;
        Wed, 26 Nov 2025 09:15:43 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 1/3] x86/cpu: Sort headers
Date: Wed, 26 Nov 2025 17:15:37 +0000
Message-Id: <20251126171539.890253-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251126171539.890253-1-andrew.cooper3@citrix.com>
References: <20251126171539.890253-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c     | 15 ++++++++-------
 xen/arch/x86/cpu/centaur.c | 10 ++++++----
 xen/arch/x86/cpu/hygon.c   |  1 +
 3 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 9b02e1ba675c..ac49df681c2a 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1,21 +1,22 @@
+#include <xen/bitops.h>
 #include <xen/cpu.h>
 #include <xen/init.h>
-#include <xen/bitops.h>
 #include <xen/mm.h>
 #include <xen/param.h>
-#include <xen/smp.h>
-#include <xen/softirq.h>
 #include <xen/pci.h>
 #include <xen/sched.h>
+#include <xen/smp.h>
+#include <xen/softirq.h>
 #include <xen/warning.h>
+
+#include <asm/acpi.h>
+#include <asm/amd.h>
+#include <asm/apic.h>
 #include <asm/io.h>
+#include <asm/microcode.h>
 #include <asm/msr.h>
 #include <asm/processor.h>
-#include <asm/amd.h>
 #include <asm/spec_ctrl.h>
-#include <asm/acpi.h>
-#include <asm/apic.h>
-#include <asm/microcode.h>
 
 #include "cpu.h"
 
diff --git a/xen/arch/x86/cpu/centaur.c b/xen/arch/x86/cpu/centaur.c
index 750168d1e81a..d2e7c8ec9912 100644
--- a/xen/arch/x86/cpu/centaur.c
+++ b/xen/arch/x86/cpu/centaur.c
@@ -1,9 +1,11 @@
-#include <xen/lib.h>
-#include <xen/init.h>
 #include <xen/bitops.h>
-#include <asm/processor.h>
-#include <asm/msr.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+
 #include <asm/e820.h>
+#include <asm/msr.h>
+#include <asm/processor.h>
+
 #include "cpu.h"
 
 #define ACE_PRESENT	(1 << 6)
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index f7508cc8fcb9..68eee0e85f49 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -1,4 +1,5 @@
 #include <xen/init.h>
+
 #include <asm/processor.h>
 #include <asm/spec_ctrl.h>
 
-- 
2.39.5


