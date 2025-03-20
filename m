Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A468DA6AA79
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:59:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922811.1326641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIIi-0004qr-GP; Thu, 20 Mar 2025 15:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922811.1326641; Thu, 20 Mar 2025 15:59:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvIIi-0004nO-C3; Thu, 20 Mar 2025 15:59:20 +0000
Received: by outflank-mailman (input) for mailman id 922811;
 Thu, 20 Mar 2025 15:59:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vaXX=WH=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1tvIIh-0004A4-P2
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:59:19 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4781a8ba-05a4-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 16:59:18 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so6949485e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:59:18 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fceafacsm1851225e9.6.2025.03.20.08.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 08:59:16 -0700 (PDT)
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
X-Inumbo-ID: 4781a8ba-05a4-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1742486357; x=1743091157; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UEX+Ken0lbbz27KSN/mzaQf3lnapm0uhTGtmqgbZOo=;
        b=ozuZCBD1SzE339VtKTVS9m2To55qo7NLZgG7Zggb6KzkrjrWEteaJlRlUHVNW5aDsc
         8OmT3DXN31u3K6XwgIhvlb64h2lPzBcjeFEPFyOsOrn6fWict9aVaLk6m0kO48jtFpe/
         OPp/4/wMWNG3qUVbJIqLpIRz+HxeW/pS+p+8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742486357; x=1743091157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3UEX+Ken0lbbz27KSN/mzaQf3lnapm0uhTGtmqgbZOo=;
        b=ndQYm+ptqshW1ZCdSGwEGN8KTH176l5ZfYKGqtx4la3+F845C9+Ofj5Btu4gbstLl8
         2tDCoPW9uJnBjLW+CH/k3SOqf7VXddUOn4xfQ742h0DH1rAI096gHBYVE4r0HBPnNnH2
         jbpysfzuhaH1vBmb1nAYUdAowlSXHzdkyBrkHjSEueCoOZ6Hc0722SaQI8W7IKUO05sN
         H/288NSboz7lWTdwgJoPluauT1ynL0Y3w4SmsHQSb7BKE5OERJs+fHmMLk+QE5Tr1d+c
         au34YV6NWJgE/vuaGCOQmpfT1ZLqVBrtnYflxlUJTp+WelcQg87cM1/5pTloUeqHVBDf
         5BiQ==
X-Gm-Message-State: AOJu0YzBIjoMawkhwFG2fR/Pi0knr7I8Y+RPZPf61zVRuVoO7wrjUT+h
	P8PXNKRs/Sy0bw9gTMji/iLGXzWf1/8icz5KQ/1CiKcYSiUuGArCPu3+sS+IR9l3qm+bi7icmSP
	y
X-Gm-Gg: ASbGnctqDPEi3+tCRyAo8F05g+835TpWGU5A3QNYCvY7QtYuJwQ/Tpk2FdipeX5uhDB
	F90/NaFB5c1wevSS8BJnudyk+nfL6wN1MwT2X1lxXDRD6T1DIcOCyuKaPqwUlv7+e5B2kGpoPgf
	mf7TyPmSSTQ9xNeBtEZ+LBiq4TLuJGUb/exwIVbWqYTvCB3UESbbrsfrPasHspzTjFm61z3ynm3
	Amer0hgJwInAWDHe0SvieJHSvDNIL7PDUMaOSQDEVNE9baG6zuMkOHz5oKVLtHQ67SGqxnnos2h
	8VDkmYtQ9YN8hENQ9Rz4dne/X5mb+l9MuX5xgVUDJHrEDg4VR/4OS5/ygjPSC50NxOJhfgj6e8/
	5In0rBLhNAsmCGY6Vgg==
X-Google-Smtp-Source: AGHT+IELsHe5TzUWN9zncFvJtDyApbhOpFn6gW9MOhX3nDU9IbgxEVnfT1yHbRYR+6Rppaiq3BsZVg==
X-Received: by 2002:a05:600c:cc7:b0:43d:ed:ad07 with SMTP id 5b1f17b1804b1-43d4381697cmr81251655e9.29.1742486357151;
        Thu, 20 Mar 2025 08:59:17 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH 2/3] Xen: Update compiler checks
Date: Thu, 20 Mar 2025 15:59:07 +0000
Message-Id: <20250320155908.43885-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320155908.43885-1-andrew.cooper3@citrix.com>
References: <20250320155908.43885-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We didn't really have a Clang check before, so add one while adjusting the GCC
check.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/xen/compiler.h | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index b118e4ba62eb..cc955be32664 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -1,18 +1,10 @@
 #ifndef __LINUX_COMPILER_H
 #define __LINUX_COMPILER_H
 
-#if !defined(__GNUC__) || (__GNUC__ < 4)
-#error Sorry, your compiler is too old/not recognized.
-#elif CONFIG_CC_IS_GCC
-# if defined(CONFIG_ARM_32) && CONFIG_GCC_VERSION < 40900
-#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
-# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
-/*
- * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
- * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
- */
-#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
-# endif
+#if CONFIG_CC_IS_GCC && CONFIG_GCC_VERSION < 50100
+# error Sorry, your version of GCC is too old - please use 5.1 or newer
+#elif CONFIG_CC_IS_CLANG && CONFIG_CLANG_VERSION < 110000
+# error Sorry, your version of Clang is too old - please use 11 or newer
 #endif
 
 #define barrier()     __asm__ __volatile__("": : :"memory")
-- 
2.39.5


