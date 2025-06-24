Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E872AE5AB4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 06:01:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022956.1398857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqC-0002tE-39; Tue, 24 Jun 2025 04:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022956.1398857; Tue, 24 Jun 2025 04:01:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqB-0002qM-W7; Tue, 24 Jun 2025 04:00:59 +0000
Received: by outflank-mailman (input) for mailman id 1022956;
 Tue, 24 Jun 2025 04:00:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTulV-000639-Om
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:56:09 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 28aa697f-50af-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 05:56:08 +0200 (CEST)
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
X-Inumbo-ID: 28aa697f-50af-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750737366; x=1750996566;
	bh=kg+n/kedKNW1A1xHbIIccq1oruQHzzJGTEwBEt6y32w=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=cbhvZjKl4wEvGLp+l1O52nOJvnAZ2JMOfL05zGSFYWO4ALt/qaMxhZSW9tNjra3ZR
	 TU+g7u+h8q/Qp9d/gq8Kva0F6DL3Ngb1+A8oP+7Q5/yTX9fSPSurvUjwGmIRCb3MMU
	 QhyLTtmOICf89QtllzI7Klxj52FIAGoH1vyuVwUPbti7HGx779cAPppShCVODo3HQR
	 iW4C2J6jHSFd52luVPAMAM7UiBRSGGs0n/KP0xtIHAGbteUWri0h22qAjNXE1SPPHa
	 TN9vpbtVbYI09asbKwMoUBxmfH9IJciAB3NrfcCtUwMFI8FRC4EsSwJuUi7X2R8m8l
	 PVNzdW50N+kUA==
Date: Tue, 24 Jun 2025 03:55:59 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 07/16] arm/vuart: rename 'virtual UART' Kconfig option
Message-ID: <20250624035443.344099-8-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9bd0188e159941caa349c4817e61032d44273f78
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Rename HWDOM_VUART to HAS_VUART_MMIO.

This emulator emulates only one register and the use of the emulator is
limited to early boot console in the guest OS.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/Kconfig              | 2 +-
 xen/arch/arm/Makefile             | 2 +-
 xen/arch/arm/include/asm/domain.h | 2 +-
 xen/arch/arm/vuart.h              | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 03888569f38c..b11cb583a763 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -177,7 +177,7 @@ config HAS_VUART_PL011
 =09  Allows a guest to use SBSA Generic UART as a console. The
 =09  SBSA Generic UART implements a subset of ARM PL011 UART.
=20
-config HWDOM_VUART
+config HAS_VUART_MMIO
 =09bool "Emulated UART for hardware domain"
 =09default y
 =09help
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 2d6787fb03bc..dd015a2a19e8 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -68,7 +68,7 @@ obj-y +=3D vtimer.o
 obj-$(CONFIG_HAS_VUART_PL011) +=3D vpl011.o
 obj-y +=3D vsmc.o
 obj-y +=3D vpsci.o
-obj-$(CONFIG_HWDOM_VUART) +=3D vuart.o
+obj-$(CONFIG_HAS_VUART_MMIO) +=3D vuart.o
=20
 extra-y +=3D xen.lds
=20
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index 2ee9976b55a8..d668c11d7e2c 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -90,7 +90,7 @@ struct arch_domain
=20
     struct vgic_dist vgic;
=20
-#ifdef CONFIG_HWDOM_VUART
+#ifdef CONFIG_HAS_VUART_MMIO
     struct vuart {
 #define VUART_BUF_SIZE 128
         char                        *buf;
diff --git a/xen/arch/arm/vuart.h b/xen/arch/arm/vuart.h
index e90d84c6eddb..726846355c3b 100644
--- a/xen/arch/arm/vuart.h
+++ b/xen/arch/arm/vuart.h
@@ -22,7 +22,7 @@
=20
 struct domain;
=20
-#ifdef CONFIG_HWDOM_VUART
+#ifdef CONFIG_HAS_VUART_MMIO
=20
 int domain_vuart_init(struct domain *d);
 void domain_vuart_free(struct domain *d);
@@ -40,7 +40,7 @@ static inline int domain_vuart_init(struct domain *d)
=20
 static inline void domain_vuart_free(struct domain *d) {};
=20
-#endif /* CONFIG_HWDOM_VUART */
+#endif /* CONFIG_HAS_VUART_MMIO */
=20
 #endif /* __ARCH_ARM_VUART_H__ */
=20
--=20
2.34.1



