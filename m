Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 470009F663C
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 13:53:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860368.1272390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNtYP-00046D-Gp; Wed, 18 Dec 2024 12:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860368.1272390; Wed, 18 Dec 2024 12:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNtYP-00044L-Dz; Wed, 18 Dec 2024 12:53:29 +0000
Received: by outflank-mailman (input) for mailman id 860368;
 Wed, 18 Dec 2024 12:53:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xglw=TL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tNtYO-00044F-MW
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 12:53:28 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12a83163-bd3f-11ef-99a3-01e77a169b0f;
 Wed, 18 Dec 2024 13:53:26 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa662795ca3so146515766b.1
 for <xen-devel@lists.xenproject.org>; Wed, 18 Dec 2024 04:53:26 -0800 (PST)
Received: from andrewcoop.eng.citrite.net (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab963b2611sm556257566b.174.2024.12.18.04.53.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 04:53:25 -0800 (PST)
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
X-Inumbo-ID: 12a83163-bd3f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1734526406; x=1735131206; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X2xlLDmAW5VkqoRjII2hswvrZgARiX6RUzFU9LyTIe0=;
        b=vUHsAdOswEJGoTwPoflEOGUOdk1j409g1FfMVZCfrp/qarjfFLU//VPD08NW6K9t3K
         Tr5kgPswlkdwRMlCycB3ki9PUJt2EAgE7WLchTm6uCocWW85+Vr3n7yieGG0/lh3MjRj
         VnIfsiivYToM/Q8qNpqU2srgeWKcXtWl7ZKLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734526406; x=1735131206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X2xlLDmAW5VkqoRjII2hswvrZgARiX6RUzFU9LyTIe0=;
        b=VplawRWEX7p4rjHoHms38gb7gNhu712/u1C7z5yRF4Pcf4GAG9dlFVCiuYDE2/WhPL
         Qk/LtypbeoFD1YSmIyanmjxx9LypbAz2jfCLLjO2sfxuvQZPitZMeTqZCiD6eUs0nbUI
         WmY5MPaNWPLPYyYqRjjO95HD3t60ZzgZjFLqCbqIv89bDx9u/4VpqKWA9Uxid2bmFQBW
         xq1udLQQ7F1hlGWzsj+dh8Kh5xnKa11cHPr6p1SXIo7R6Ac1mPDOBY8cMcLr8XUtVHQ0
         c4FGxtrd8mFUsvdo8xddfL2ckTOpnh2TUk3doe5/k9Ybm/sWZwlz7xwwcmfaGmBdXpu8
         60ZQ==
X-Gm-Message-State: AOJu0YwZRekYci90VCAduxH+UjTWDBVNRGu5DAIJmSZo2Yy8njQSdjKF
	F+6nJ7BhT6zh2tqeoazFp8IqiiBkf1wQ8IMrdKneSy0qRtby4YwMQjySIgikApReil9pfmusxFH
	0lDQ=
X-Gm-Gg: ASbGncuV9PS/8jjyjBWfVvfpVAEGxaGQvzZRxUlkTE1k+GVIBnSIPOFhJhtvbdOJ2Du
	RWQA37RJ69VpG4pjFyZofsHVaVBBOLHUMVhU3+DFu8ey7ZX1Ub1CFQSr9MTfiKL+WAGJFw3+6WH
	O3pAXcKIQHUqgt7NdVc8dzDxGV7y725Lfo1n4qgwLBkCwXlu/Hj1KNNNxiopl1U0+oF0hUlxb7l
	ODuo+McchU0BNUbOqftREQ457nqcv1kFuw5PRFE7pDkPyrnYeLNbNXrfcXCowmydtSWz5wBrsXM
	qH8HfcEFiuAGcW/IomD0UiXta9/Feyi5N5Mh
X-Google-Smtp-Source: AGHT+IGPD3ar8cxsXxCPl/UcUBZnHiuWl8jDPbPt97EL1xcYrBrCCQBNCcMWVOsORRMujI5huunmDQ==
X-Received: by 2002:a17:907:944a:b0:aa6:9dcf:e273 with SMTP id a640c23a62f3a-aabdc895a70mr707369466b.12.1734526405839;
        Wed, 18 Dec 2024 04:53:25 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] x86/sched: Drop unused includes from credit2.c
Date: Wed, 18 Dec 2024 12:53:24 +0000
Message-Id: <20241218125324.75973-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sort the remaining includes.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Juergen Gross <jgross@suse.com>
---
 xen/common/sched/credit2.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 4b2ef034ca84..0a83f237259f 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -10,22 +10,18 @@
  * Based on an earlier verson by Emmanuel Ackaouy.
  */
 
+#include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/lib.h>
 #include <xen/param.h>
+#include <xen/perfc.h>
 #include <xen/sched.h>
 #include <xen/sections.h>
-#include <xen/domain.h>
-#include <xen/delay.h>
-#include <xen/event.h>
-#include <xen/time.h>
-#include <xen/perfc.h>
 #include <xen/softirq.h>
-#include <asm/div64.h>
-#include <xen/errno.h>
+#include <xen/time.h>
 #include <xen/trace.h>
-#include <xen/cpu.h>
-#include <xen/keyhandler.h>
+
+#include <asm/div64.h>
 
 #include "private.h"
 

base-commit: 171cb318deaa0be786cc3af3599c72e8909e60f9
prerequisite-patch-id: c484a8a8e245130614407e7d25fdc27ab2e62cd3
-- 
2.39.5


