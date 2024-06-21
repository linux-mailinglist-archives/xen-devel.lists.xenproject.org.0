Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 317AE912E6C
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 22:20:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745528.1152665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKkjS-0006nn-8P; Fri, 21 Jun 2024 20:19:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745528.1152665; Fri, 21 Jun 2024 20:19:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKkjS-0006mJ-4h; Fri, 21 Jun 2024 20:19:38 +0000
Received: by outflank-mailman (input) for mailman id 745528;
 Fri, 21 Jun 2024 20:19:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FH9a=NX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sKkjQ-0006Xk-Kl
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 20:19:36 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 940913f6-300b-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 22:19:36 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a6ef793f4b8so252384666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 21 Jun 2024 13:19:36 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf48b3a6sm116947466b.87.2024.06.21.13.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 13:19:33 -0700 (PDT)
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
X-Inumbo-ID: 940913f6-300b-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1719001175; x=1719605975; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNg2DzwYEol0Dd/MIahRG8oCTZpkXejfnW6xOn3sPPQ=;
        b=QTNoX5U6rmpJICA0jNsaTU8eA0+ISQhdY8RNztrrt+NdDZKTpQ3AsuZrss63UxYXAy
         q/XVtRUgAq57Ok6wpfL3I7ZLk98ZSCuWMxToMFk+/6KMcFO3SfPvLgVeV+oxGrliuF10
         aij2VZyjFLkbh27aylC9RW1IEiEhhcvwOepiM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719001175; x=1719605975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNg2DzwYEol0Dd/MIahRG8oCTZpkXejfnW6xOn3sPPQ=;
        b=kZLjqjeMilmo5YofW8g8aDXj51yXgJCLk5B1359fBBD3Q3urp7+u+reVQrKg928SoB
         aP5zIBVY/7OoUniL5qeF2A3Hq1ogV0042R7Nrz3QN1DUzjNzguN/3+6zGZRvRkvEPs1l
         h6UzdQ7b/6weCzHOinKW2MDGvwaSlJTR+kcNB+CsgLRJwbLX6y34NbRcvxALxoEc5gqH
         J3CK5rck203zN6x3TKPupJcA5EBog2xXwmf+L0wFTdH2lKuCrFecsT4FlJjNCVnHMq+G
         dbcUQZyf339vC9q/yP/SkT+vzXXVegCal5uUGkKChQZqRbdXH8Hc1Eq7aA/w0jSAE9s8
         efxQ==
X-Gm-Message-State: AOJu0YynFIHRzBxLEhZoMeD7s/EZMPUK0hSkLcghngVuoTNWBlG0SZ8p
	LvJhz+tzuOiNH9lg6uEMYeOQyjBqBH22MVuE+t0GpkjHUxcQwksQB80d1ZIhT5FK2U2CEO809y1
	v38E=
X-Google-Smtp-Source: AGHT+IGHl4OM1ru7y/HT5MSJYwiduCg/9TtIS6T/sCUpcaB58OFHVIFvYyPaAgoCqMBV1HBaeivDLA==
X-Received: by 2002:a17:907:910d:b0:a6f:dd94:c53d with SMTP id a640c23a62f3a-a6fdd94c91amr21152666b.75.1719001174723;
        Fri, 21 Jun 2024 13:19:34 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH 1/3] xen/riscv: Drop legacy __ro_after_init definition
Date: Fri, 21 Jun 2024 21:19:26 +0100
Message-Id: <20240621201928.319293-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621201928.319293-1-andrew.cooper3@citrix.com>
References: <20240621201928.319293-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hide the legacy __ro_after_init definition in xen/cache.h for RISC-V, to avoid
its use creeping in.  Only mm.c needs adjusting as a consequence

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

https://gitlab.com/xen-project/people/andyhhp/xen/-/pipelines/1342686294
---
 xen/arch/riscv/mm.c     | 2 +-
 xen/include/xen/cache.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/mm.c b/xen/arch/riscv/mm.c
index 053f043a3d2a..3ebaf6da01cc 100644
--- a/xen/arch/riscv/mm.c
+++ b/xen/arch/riscv/mm.c
@@ -1,11 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#include <xen/cache.h>
 #include <xen/compiler.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/macros.h>
 #include <xen/pfn.h>
+#include <xen/sections.h>
 
 #include <asm/early_printk.h>
 #include <asm/csr.h>
diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
index 55456823c543..82a3ba38e3e7 100644
--- a/xen/include/xen/cache.h
+++ b/xen/include/xen/cache.h
@@ -15,7 +15,9 @@
 #define __cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
 #endif
 
+#if defined(CONFIG_ARM) || defined(CONFIG_X86) || defined(CONFIG_PPC64)
 /* TODO: Phase out the use of this via cache.h */
 #define __ro_after_init __section(".data.ro_after_init")
+#endif
 
 #endif /* __LINUX_CACHE_H */
-- 
2.39.2


