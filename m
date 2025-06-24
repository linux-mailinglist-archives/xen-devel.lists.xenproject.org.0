Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 168C8AE5AB2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 06:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022955.1398842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuq4-0002Jn-TB; Tue, 24 Jun 2025 04:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022955.1398842; Tue, 24 Jun 2025 04:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuq4-0002FM-NZ; Tue, 24 Jun 2025 04:00:52 +0000
Received: by outflank-mailman (input) for mailman id 1022955;
 Tue, 24 Jun 2025 04:00:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTulb-0006IZ-GS
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:56:15 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c8d3310-50af-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 05:56:14 +0200 (CEST)
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
X-Inumbo-ID: 2c8d3310-50af-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750737373; x=1750996573;
	bh=EZPSUcu7la0M45CwJVaWkAOhNHBB8cLtWWRrJ9AK15Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cDkAGXIxwmH2Q6b45ukKQqCRljR8aIantC+Yo2I9dkyIfGby3MAZxLEiS9PJiq5A9
	 7TneQ+1A3wYc9m+sTTeRnDH+leZfPfqgpoNL/wdirJ682s47muibdxni48t0sc5KHS
	 Wi0RaXeKMJvriUfARBRDSN0/bkYiOVPdYvAVOjqA5Q+tlHXj6CJT+SX/g/sjozDO3N
	 qnFYsQ6kMzapzR/Xx42PKfPK+mb43s7C6DWMZX45DVd5PSH4PcQPBUFIbuj0Q+bxMf
	 AM74dmkPd1GOGYx3vRSnJBltwBDAu7epwcNR3vVet8V7vLhlvMO4S1Y8xza2SeI77f
	 pFzjvfz6Pyacg==
Date: Tue, 24 Jun 2025 03:56:09 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 08/16] arm/vuart: move simple MMIO-based vUART declarations to common header
Message-ID: <20250624035443.344099-9-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 41115d32da3b21d594ea62d30a415d088e6afb20
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Merge arch/arm/vuart.h with include/xen/vuart.h.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/domain.c   |  1 -
 xen/arch/arm/vuart.c    |  3 +--
 xen/arch/arm/vuart.h    | 54 -----------------------------------------
 xen/include/xen/vuart.h | 20 +++++++++++++++
 4 files changed, 21 insertions(+), 57 deletions(-)
 delete mode 100644 xen/arch/arm/vuart.h

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 68297e619bad..3579d10d7e1d 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -31,7 +31,6 @@
 #include <asm/vtimer.h>
=20
 #include "vpci.h"
-#include "vuart.h"
=20
 DEFINE_PER_CPU(struct vcpu *, curr_vcpu);
=20
diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index bd2f425214b7..5403ed284846 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -28,8 +28,7 @@
 #include <xen/serial.h>
 #include <asm/mmio.h>
 #include <xen/perfc.h>
-
-#include "vuart.h"
+#include <xen/vuart.h>
=20
 #define domain_has_vuart(d) ((d)->arch.vuart.info !=3D NULL)
=20
diff --git a/xen/arch/arm/vuart.h b/xen/arch/arm/vuart.h
deleted file mode 100644
index 726846355c3b..000000000000
--- a/xen/arch/arm/vuart.h
+++ /dev/null
@@ -1,54 +0,0 @@
-/*
- * xen/arch/arm/vuart.h
- *
- * Virtual UART Emulation Support
- *
- * Ian Campbell <ian.campbell@citrix.com>
- * Copyright (c) 2012 Citrix Systems.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- */
-
-#ifndef __ARCH_ARM_VUART_H__
-#define __ARCH_ARM_VUART_H__
-
-struct domain;
-
-#ifdef CONFIG_HAS_VUART_MMIO
-
-int domain_vuart_init(struct domain *d);
-void domain_vuart_free(struct domain *d);
-
-#else
-
-static inline int domain_vuart_init(struct domain *d)
-{
-    /*
-     * The vUART is unconditionally inialized for the hw domain. So we
-     * can't return an error.
-     */
-    return 0;
-}
-
-static inline void domain_vuart_free(struct domain *d) {};
-
-#endif /* CONFIG_HAS_VUART_MMIO */
-
-#endif /* __ARCH_ARM_VUART_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
index cae72ac9c6b9..928b60bbb4e2 100644
--- a/xen/include/xen/vuart.h
+++ b/xen/include/xen/vuart.h
@@ -43,6 +43,26 @@ static inline int vuart_putchar(struct domain *d, char c=
)
=20
 #endif /* CONFIG_HAS_VUART_PL011 */
=20
+#ifdef CONFIG_HAS_VUART_MMIO
+
+int domain_vuart_init(struct domain *d);
+void domain_vuart_free(struct domain *d);
+
+#else
+
+static inline int domain_vuart_init(struct domain *d)
+{
+    /*
+     * The vUART is unconditionally inialized for the hw domain. So we
+     * can't return an error.
+     */
+    return 0;
+}
+
+static inline void domain_vuart_free(struct domain *d) {};
+
+#endif /* CONFIG_HAS_VUART_MMIO */
+
 #endif /* XEN_VUART_H */
=20
 /*
--=20
2.34.1



