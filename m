Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C7DA8B809
	for <lists+xen-devel@lfdr.de>; Wed, 16 Apr 2025 13:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.955730.1349431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QG-0000aj-05; Wed, 16 Apr 2025 11:59:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 955730.1349431; Wed, 16 Apr 2025 11:59:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u51QF-0000Se-D4; Wed, 16 Apr 2025 11:59:19 +0000
Received: by outflank-mailman (input) for mailman id 955730;
 Wed, 16 Apr 2025 11:59:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9TmO=XC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1u51QC-0006At-9m
 for xen-devel@lists.xenproject.org; Wed, 16 Apr 2025 11:59:16 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 382e657a-1aba-11f0-9eaf-5ba50f476ded;
 Wed, 16 Apr 2025 13:59:15 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39c30d9085aso4256139f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Apr 2025 04:59:15 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4405b5a9846sm18761905e9.35.2025.04.16.04.59.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Apr 2025 04:59:14 -0700 (PDT)
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
X-Inumbo-ID: 382e657a-1aba-11f0-9eaf-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744804755; x=1745409555; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z+IilGevx5q9qVo7mZ80r/6WWtDlcFRJKDVvVraWG5E=;
        b=EABg1rfC1vfOfqqk2BlIvbcqWSBwuJjAFCf3VIA9hh2Gc1B2Zc6XSBXY739CYTL1gP
         3mnAL9LLRY/L2nqTt5nbl7TX7clMlNOy48e6wa83vHgJ1ooZkGoy8yShBOVo4DChljUj
         2TZwb6ZJsrRpeuufib6BW1jnQ1XvemMTZi8kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804755; x=1745409555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z+IilGevx5q9qVo7mZ80r/6WWtDlcFRJKDVvVraWG5E=;
        b=Hhp1ZGLzfZ8SxA63DLVjwYgOirn376hXYPrcCaIOdq8VNFCdn3+WR9ooDDMetAc1bs
         O/U0y5it5hiAtYak/zbRE1Mf2WNYZUl9xTW3wsIbEYkyWNcjIdnlu6Aj4yqyqmOchzel
         LgBPWqHK6N6KlEb+qnjXH1EcaT+67hRY0Oq/UED0jDsK7O5FDGBni3YkooLLFG3w4AEL
         oGEaea9uEvo3F0yVb9KdGK9MgHg1Achan37Sxm5UqW+AOfh9cB0aLGXSFenl3zILL6VZ
         USPqiY2hz+8cjyqdyL0MCBYrXK0J8zweVAbS+JOgzTL1LeYWp4Kbs81fYFzAuNJ5A5Tb
         qcvQ==
X-Gm-Message-State: AOJu0YzB5dqbSeX5ZZzyDJXsVKtcWeksUXS4EteZdvmj/jtTSSVz/s7i
	W9//u+NmIBQ+6cH6CbvVFXK7XGEbYd8E63bc2t5AayEJ7DyTrcQkFJxMYAyZHVQeeKP1Pn8oMjN
	pQLA=
X-Gm-Gg: ASbGncskQqSBDooORV1LFbXxwN1jZAo3s2LgZPdFiKFf/3ZvJXTNdiV5Z28wsapBTdf
	r7AIagcnuXvywDCnoMFjpvLULfLC+Ip6C5EPFgVWAzCVu1ihXPCx3PVCam1OFxV9a5zvDBHViKu
	iqFaRLkx13QQF0mw8/qVreEYArLSl8sUQtwoXEbU0rBeg4plOYKZ71HibhbWWyHNHiING75iv5I
	ESPZarJ62IWa1B/7NueFNqtUK/BIGdr2ZL1o9UI0jj1vWL6Ivtb07GlqxPNsJlkDHWM5cQOksCE
	5esrB7Sxy9gsGtqzNZ2WXrWjCmwdvkThR10laAv9Bc1QtF8EiNP3QbdmB0CRcBmkQDVxlT2u6L+
	WRrZd4YSFxccUxy5dXcUmttxX
X-Google-Smtp-Source: AGHT+IFR5FzfA941/9ZQtEr7MfsbWMjiicPxFU8WTuginSs0d1JYIhj+KpYz+bQAw6mrWWPLTtFbbA==
X-Received: by 2002:a05:6000:1866:b0:390:f394:6271 with SMTP id ffacd0b85a97d-39ee5b992bcmr1552295f8f.43.1744804755118;
        Wed, 16 Apr 2025 04:59:15 -0700 (PDT)
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
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Lin Liu <lin.liu@citrix.com>
Subject: [PATCH v6 13/15] ppc: Drop asm/byteorder.h
Date: Wed, 16 Apr 2025 12:58:58 +0100
Message-Id: <20250416115900.2491661-14-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
References: <20250416115900.2491661-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

With the common code moved fully onto xen/byteorder.h, clean up the dregs.

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
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Lin Liu <lin.liu@citrix.com>

v5:
 * New
---
 xen/arch/ppc/include/asm/byteorder.h | 6 ------
 xen/arch/ppc/include/asm/page.h      | 4 +---
 xen/arch/ppc/mm-radix.c              | 2 +-
 3 files changed, 2 insertions(+), 10 deletions(-)
 delete mode 100644 xen/arch/ppc/include/asm/byteorder.h

diff --git a/xen/arch/ppc/include/asm/byteorder.h b/xen/arch/ppc/include/asm/byteorder.h
deleted file mode 100644
index 8df6adbf0d7d..000000000000
--- a/xen/arch/ppc/include/asm/byteorder.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef _ASM_PPC_BYTEORDER_H
-#define _ASM_PPC_BYTEORDER_H
-
-#include <xen/byteorder.h>
-
-#endif /* _ASM_PPC_BYTEORDER_H */
diff --git a/xen/arch/ppc/include/asm/page.h b/xen/arch/ppc/include/asm/page.h
index 6d4cd2611c2b..c6160afcfdb8 100644
--- a/xen/arch/ppc/include/asm/page.h
+++ b/xen/arch/ppc/include/asm/page.h
@@ -3,9 +3,7 @@
 #define _ASM_PPC_PAGE_H
 
 #include <xen/bitops.h>
-#include <xen/types.h>
-
-#include <asm/byteorder.h>
+#include <xen/byteorder.h>
 
 #define PDE_VALID     PPC_BIT(0)
 #define PDE_NLB_MASK  0x1ffffffffffffe0UL
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index 24232f3907aa..9a00ae416af0 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/bitops.h>
+#include <xen/byteorder.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/mm.h>
@@ -7,7 +8,6 @@
 #include <xen/types.h>
 #include <xen/lib.h>
 
-#include <asm/byteorder.h>
 #include <asm/early_printk.h>
 #include <asm/page.h>
 #include <asm/processor.h>
-- 
2.39.5


