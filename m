Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4805CB9394
	for <lists+xen-devel@lfdr.de>; Fri, 12 Dec 2025 17:06:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1185543.1507656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU5eu-0001lp-4v; Fri, 12 Dec 2025 16:06:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1185543.1507656; Fri, 12 Dec 2025 16:06:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vU5eu-0001ik-29; Fri, 12 Dec 2025 16:06:20 +0000
Received: by outflank-mailman (input) for mailman id 1185543;
 Fri, 12 Dec 2025 16:06:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SbWK=6S=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vU5et-0001ie-JK
 for xen-devel@lists.xenproject.org; Fri, 12 Dec 2025 16:06:19 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7e594cf8-d774-11f0-b15b-2bf370ae4941;
 Fri, 12 Dec 2025 17:06:18 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4779cc419b2so15599515e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Dec 2025 08:06:18 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a8f8f3894sm38530395e9.15.2025.12.12.08.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Dec 2025 08:06:17 -0800 (PST)
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
X-Inumbo-ID: 7e594cf8-d774-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1765555578; x=1766160378; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ilh1940cXuR+im2NE2+oUxOQVII3GAVTO2GQRPcJ7uA=;
        b=O1pql3mvvaVZWn27YFGgpZp1MEeo2qWBZBu/UCMf9uaNbzAQVzSx05OSkF6vO1/CLA
         9sq2GyFAYq50ZzM7arD2r0WzStGAOHVMabc64xiNwWRphyR4DJMEzyYmGAdyzB2FThvv
         mf0bMfXRgi1H7AZqWM9NNE3hOBAkZhQqPIyUc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765555578; x=1766160378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ilh1940cXuR+im2NE2+oUxOQVII3GAVTO2GQRPcJ7uA=;
        b=hOVknMx3ztwHtfkzrUKy1X6+ZFF423fj7IVMs3FbYyVBspWyxQm7vQN3yyRAdO9DrU
         +BqcDy2dXlbWysZJszwK8mNBSw73gGqCj9M4E6H+83JQ0Ag1PjGNDrKNVV+P0xXTI0AQ
         P0QmqV5bcM8OYPMw6GDh6uKvuxfXdqG1YMELW2a8F3FalMPVEzdQXBfP3FY2qFMh9A1C
         TKzs/7o+RXZomRq+WEFzMK7Wc5m6FSfId48Mq+xdqjChp69GgvFFwiFsKcO9v7z9uKZE
         TzO7x2m6A56FBF+kgsIuecbabG4hRsnkKLhOEB+ydU3qWl0aG8CmHa/hN2AtEUmQ/TSz
         6u7A==
X-Gm-Message-State: AOJu0YwZIZH/cSiprIDeAvLwJxY/0Wg6v8ZIVmVTpD14+TY/RWYJ+Jdi
	XrV1CtqNs0mv27HDYlHupUe7Aiys25lWyQ+9zeVk6rZ80bE+pXS4w8CaMqVKCfQmOWmK7MMOY8K
	gxQR3
X-Gm-Gg: AY/fxX6MXsPVg0V8IPJCx/7MST5CxVBZm2KcnAf/8ERAusUWpcIHHZw/x1wyVraiD+c
	taus/SSfLJt8U65EpwiUmuHsUQeCkRYUlKFPMnTPSlxghF7PVSVCH9Vz8agIXOoN/jz7xcuz7+w
	eoh36zgRXmMjiAyljtEvOUS/SnrETmPbUGOiiLsMLpl03Rckpj1ebSe98ihj4kLOsOxYc5QIwfN
	+JdJJ2gN3cyR0zAt2hqwLKZKURMUjdAsERIrCUDqjfx2Tlbkso90fmCaY9C3b4XyTcnn+ZT89kB
	jVEQB14AQOR5NJNluCxl51fFIw11Bw58lk4rlAqznXc2BfJwGJMiyxoNOnAeBE/FvfzLukFTDKY
	nzdaOu8NCiKNa64mfg2OarpJGABhE8epA2rWS4TA3LbEsYHGLvYmHE5u1R8MEKg4o5iQs7xJle+
	FnrYYkXBQ5/vIYpgOGmTtbwi/i8K+9YHhFQyI1KOx0dQhc87Smte5yw3KuVd6Vu5R+e9nu9cl0
X-Google-Smtp-Source: AGHT+IGE0sVGOy54GyGnv76mv0eFlPZ/uPMhlDveanIeu0bgHvAEf/xJVeqbj+zk5DK9JT0EWPrKeA==
X-Received: by 2002:a05:600c:3146:b0:479:3a88:de5f with SMTP id 5b1f17b1804b1-47a8f9174f3mr23757785e9.36.1765555577682;
        Fri, 12 Dec 2025 08:06:17 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH] x86/shadow: Move GUEST_PTE_SIZE defines into types.h
Date: Fri, 12 Dec 2025 16:06:15 +0000
Message-Id: <20251212160615.2486055-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GUEST_PTE_SIZE are only used by multi.c, but private.h gets used by code that
doesn't have GUEST_PAGING_LEVELS defined.  Eclair notes that this is a
violation of MISRA Rule 20.9.

Move it into types.h with the rest of the level-dependent logic lives.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/x86/mm/shadow/private.h | 7 -------
 xen/arch/x86/mm/shadow/types.h   | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/mm/shadow/private.h b/xen/arch/x86/mm/shadow/private.h
index 1ef908a380de..bc99e00100f7 100644
--- a/xen/arch/x86/mm/shadow/private.h
+++ b/xen/arch/x86/mm/shadow/private.h
@@ -121,13 +121,6 @@ enum {
 };
 
 
-/* Size (in bytes) of a guest PTE */
-#if GUEST_PAGING_LEVELS >= 3
-# define GUEST_PTE_SIZE 8
-#else
-# define GUEST_PTE_SIZE 4
-#endif
-
 /******************************************************************************
  * Auditing routines
  */
diff --git a/xen/arch/x86/mm/shadow/types.h b/xen/arch/x86/mm/shadow/types.h
index d700d8d64c8a..13d13c52c007 100644
--- a/xen/arch/x86/mm/shadow/types.h
+++ b/xen/arch/x86/mm/shadow/types.h
@@ -18,6 +18,13 @@
 #define SHADOW_PAGING_LEVELS 3
 #endif
 
+/* Size (in bytes) of a guest PTE */
+#if GUEST_PAGING_LEVELS >= 3
+# define GUEST_PTE_SIZE 8
+#else
+# define GUEST_PTE_SIZE 4
+#endif
+
 /*
  * Define various types for handling pagetabels, based on these options:
  * SHADOW_PAGING_LEVELS : Number of levels of shadow pagetables
-- 
2.39.5


