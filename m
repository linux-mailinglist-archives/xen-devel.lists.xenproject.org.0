Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15636AE5AB1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 06:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022953.1398837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuq4-0002FN-LE; Tue, 24 Jun 2025 04:00:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022953.1398837; Tue, 24 Jun 2025 04:00:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuq4-0002Di-HH; Tue, 24 Jun 2025 04:00:52 +0000
Received: by outflank-mailman (input) for mailman id 1022953;
 Tue, 24 Jun 2025 04:00:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTumS-000639-86
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:57:08 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b73ea28-50af-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 05:57:06 +0200 (CEST)
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
X-Inumbo-ID: 4b73ea28-50af-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750737425; x=1750996625;
	bh=EZ+uMveraa+cDZkwCgDIWFYhH2jzngRaVV7LukeCweg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XYoKRTdUwDz/DU7S9mYIwzelOwKSVrRTMDn1HZvw6DdtwhN77jLq6ATpPRZoN/qg3
	 YmaDRlyNpPIshkXaoGy4WRAn/4qwpjEAAa0aSxqkarl1JfknvJVAcirucw+7wTxtte
	 b+s0q4KQQmHBPSv9xOmruko/r0oi+A7NVBwxaQKKgo2Ky7DOqi5aKlpkNBxTyjrQDo
	 we0wtEUi/OatP7tFJ58T7DSt5p3WkHVYp7zuhcWu8xdmDYgUoaHr4G3sZK/1DPhqJK
	 L3xL/Mbz8KhFT0arBWGp2tnY1nlsVZsz9gaNOmOJ5V0S3ni8eB8xQ+oTO4ytRTAUM1
	 M0yoalpTT9k2w==
Date: Tue, 24 Jun 2025 03:57:00 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 14/16] drivers/vuart: move simple MMIO-based UART emulator
Message-ID: <20250624035443.344099-15-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: f583a78ed85278e4f659d4fbdd3a908ebf03d47f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Move simple MMIO-based UART emulator under drivers/vuart and rename it to
vuart-mmio.c to keep "vuart" for the vUART framework.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/Kconfig                                 | 8 --------
 xen/arch/arm/Makefile                                | 1 -
 xen/drivers/vuart/Kconfig                            | 9 +++++++++
 xen/drivers/vuart/Makefile                           | 1 +
 xen/{arch/arm/vuart.c =3D> drivers/vuart/vuart-mmio.c} | 0
 5 files changed, 10 insertions(+), 9 deletions(-)
 rename xen/{arch/arm/vuart.c =3D> drivers/vuart/vuart-mmio.c} (100%)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 6eeae97293f2..7b915abc6f18 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -170,14 +170,6 @@ config NEW_VGIC
 =09problems with the standard emulation.
 =09At the moment this implementation is not security supported.
=20
-config HAS_VUART_MMIO
-=09bool "Emulated UART for hardware domain"
-=09default y
-=09help
-=09  Allows a hardware domain to use a minimalistic UART (single transmit
-=09  and status register) which takes information from dtuart. Note that t=
his
-=09  UART is not intended to be exposed (e.g. via device-tree) to a domain=
.
-
 config ARM_SSBD
 =09bool "Speculative Store Bypass Disable" if EXPERT
 =09depends on HAS_ALTERNATIVE
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 8475043d8701..24bc9c88f7ac 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -67,7 +67,6 @@ obj-$(CONFIG_VM_EVENT) +=3D vm_event.o
 obj-y +=3D vtimer.o
 obj-y +=3D vsmc.o
 obj-y +=3D vpsci.o
-obj-$(CONFIG_HAS_VUART_MMIO) +=3D vuart.o
=20
 extra-y +=3D xen.lds
=20
diff --git a/xen/drivers/vuart/Kconfig b/xen/drivers/vuart/Kconfig
index d8df0f6d1b3c..6002817152df 100644
--- a/xen/drivers/vuart/Kconfig
+++ b/xen/drivers/vuart/Kconfig
@@ -3,6 +3,15 @@ config HAS_VUART
=20
 if (ARM_32 || ARM_64)
=20
+config HAS_VUART_MMIO
+=09bool "Simple MMIO-based emulated UART support"
+=09default y
+=09select HAS_VUART
+=09help
+=09  Enables minimalistic UART (single transmit and status register) which
+=09  takes information from dtuart. Note that this UART is not intended to
+=09  be exposed (e.g. via device-tree) to a domain.
+
 config HAS_VUART_PL011
 =09bool "Emulated PL011 UART support"
 =09default y
diff --git a/xen/drivers/vuart/Makefile b/xen/drivers/vuart/Makefile
index 3b7069f1cf95..1c775ffb7f1d 100644
--- a/xen/drivers/vuart/Makefile
+++ b/xen/drivers/vuart/Makefile
@@ -1 +1,2 @@
+obj-$(CONFIG_HAS_VUART_MMIO) +=3D vuart-mmio.o
 obj-$(CONFIG_HAS_VUART_PL011) +=3D vuart-pl011.o
diff --git a/xen/arch/arm/vuart.c b/xen/drivers/vuart/vuart-mmio.c
similarity index 100%
rename from xen/arch/arm/vuart.c
rename to xen/drivers/vuart/vuart-mmio.c
--=20
2.34.1



