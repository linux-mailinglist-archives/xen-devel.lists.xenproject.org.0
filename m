Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F45A9739F
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 19:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.963365.1354384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7HSZ-0004id-QW; Tue, 22 Apr 2025 17:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 963365.1354384; Tue, 22 Apr 2025 17:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7HSZ-0004fF-N7; Tue, 22 Apr 2025 17:31:03 +0000
Received: by outflank-mailman (input) for mailman id 963365;
 Tue, 22 Apr 2025 17:31:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9r0M=XI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u7HSY-0004f3-7v
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 17:31:02 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f355079-1f9f-11f0-9eb0-5ba50f476ded;
 Tue, 22 Apr 2025 19:31:01 +0200 (CEST)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-39d83782ef6so97867f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Apr 2025 10:31:01 -0700 (PDT)
Received: from localhost.localdomain ([83.104.178.215])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39efa4332c1sm15688551f8f.27.2025.04.22.10.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 10:31:00 -0700 (PDT)
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
X-Inumbo-ID: 8f355079-1f9f-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1745343060; x=1745947860; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fDuByuyOOFhbgD50zGPWZG63weSszpXERV96xJ8Qdd4=;
        b=Fb+DfQWas+IrSnzBms+nY332sgc0ZgEgvVeLLoY9Yim3MlaQiZYu1rZOGk/VASajAz
         ewglseSU+C2W5IZXgpHqu/TFrrJUH6ppTAipXQk296gugAv22u4NokrSGzW8Bp/Vsul1
         Om/0FD4ZFY4u2ns1Bx/EkO+6RnUqEP4V4y7NY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745343060; x=1745947860;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDuByuyOOFhbgD50zGPWZG63weSszpXERV96xJ8Qdd4=;
        b=RNBxD2pWOhST8Wc7QqBzzJ9WVo7nL1vDZRDQZ9SZ/ge7x4RxVEA37/GtOI1o+2Fejb
         eUYmUpYOjPNAR57TRvf6aDvIe+B2PWNU3XLj5WFj/zOISTQIjJz91rO88v34qojPi+xT
         Y5pTp+9M6nRmQa0bnYWnjxz8jQaSswekfELQJLnZXP4iruKMMfxSkGJP2aqn7ktGlRjs
         /umj/MQ/jvsHa7f5z5kMmCnOgvsyr261DuI2WJkTffvqkbWehgB0bfYhAFXsc0XLBGqy
         d8oFdPiq8XIKHfY/mpU30oIyOf6PWfiex4qBN3kAPwBuUpCRkESgOeduZiUGJi8ksgPI
         3oiQ==
X-Gm-Message-State: AOJu0YyBEm2YRaloY7Ui/Q7AsaQJ+xTqnE0OrtrOl9pY41e7jpB5V0kz
	cPQbvMNOSdVIuqMzuiZe60jzCO0+Nc7Gwwh9ZMqw6sLAaMPuccoHhv9oyc82TLAgQ7tOPCj7iOx
	MLm0=
X-Gm-Gg: ASbGncty+dMFWqS9/cnnCTy9Ck0toWhdSH4H+LPg3UJUR8N5bohZ/uF3GEWeIOBR/3i
	MT0LBtcYH5BKqeRQy30YfDObtIDQfg4RS8RrqvkWXO0oEe4p2OAs78+xusLkRwiLS7eKyZofFHv
	fWHorszwLR4ieZgqvyyquVVMm/ikD/0nc39BK1UyuxzEAlTNBzRpwp+NXBMGbcQyZ+Qla+g214i
	Fitj0qOPvm2QgixVSizxrTy/F9GThyjdVZ2q6Fr775PZcFp/V6Bo8uVJEJCeoikskgCFueeWcWs
	s1x1XFjxoPJTNL2X3u7E+Wrxzm7nMPh1M2gO3sbN97QEQJv5iGoFA5oIQyfuxkK0Fyfw8yrC
X-Google-Smtp-Source: AGHT+IGxOf7g6Ttp17yfEj+tKPNCz/6Ma7toS5dZNfRorDWsv/xskKu8dffg6uQAZ3h/sJ80BT8Eeg==
X-Received: by 2002:adf:e04f:0:b0:39b:32fc:c025 with SMTP id ffacd0b85a97d-39ef89b5d9amr10316961f8f.2.1745343060664;
        Tue, 22 Apr 2025 10:31:00 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] arm/alternative: Drop unused includes of asm/alternative.h
Date: Tue, 22 Apr 2025 18:30:58 +0100
Message-Id: <20250422173058.1459730-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm64/cache.S | 2 --
 xen/arch/arm/domain.c      | 1 -
 2 files changed, 3 deletions(-)

diff --git a/xen/arch/arm/arm64/cache.S b/xen/arch/arm/arm64/cache.S
index 66ed85f73503..c0a8ca163a47 100644
--- a/xen/arch/arm/arm64/cache.S
+++ b/xen/arch/arm/arm64/cache.S
@@ -19,8 +19,6 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <asm/alternative.h>
-
 /*
  * dcache_line_size - get the minimum D-cache line size from the CTR register.
  */
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index dc4b4e84c1c3..23cf8729f1d7 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -12,7 +12,6 @@
 #include <xen/softirq.h>
 #include <xen/wait.h>
 
-#include <asm/alternative.h>
 #include <asm/arm64/sve.h>
 #include <asm/cpuerrata.h>
 #include <asm/cpufeature.h>
-- 
2.39.5


