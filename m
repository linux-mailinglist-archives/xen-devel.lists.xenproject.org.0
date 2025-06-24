Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9C1AE5ABA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 06:01:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022984.1398916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqV-0005Ya-66; Tue, 24 Jun 2025 04:01:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022984.1398916; Tue, 24 Jun 2025 04:01:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqV-0005W7-1r; Tue, 24 Jun 2025 04:01:19 +0000
Received: by outflank-mailman (input) for mailman id 1022984;
 Tue, 24 Jun 2025 04:01:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTumJ-000639-FV
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:56:59 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 465b7409-50af-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 05:56:58 +0200 (CEST)
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
X-Inumbo-ID: 465b7409-50af-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ecvvigt2f5a3rbsqkhru7efk5u.protonmail; t=1750737417; x=1750996617;
	bh=BmcXMAPQmruv+WgoSlVyAgGhsw5O69P+wvMsGyq48aU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PjQXMLRiOIdDXwsAC5JMhvzlQLkF+5gHcJhwudnRGG5aoUajK2Ng3TwWnFghbBGfT
	 J84eCTNPDiL/etV6bkLSNqdoy4GsJxlUeXHjYbJ3uS5qFevV+IUUD902Do8yVvnLd9
	 GJtyOWYKtl2O57HQ4WQI4otmrChDOLWiU00QIzPwPCTH7efVh0vwPsEUgvYdzMP1WS
	 SPY0QrYpWPdxfqSKJGvUDFRXGIfvKy82MKIY+glrf5t3Qg0JdQkbxEAwuu8iyT02XK
	 kWhJyPNfDIjR7bKPZncrulrFjCrn2Ee0IVl9QCGzakZDC9LUcAHBVbPjZlM0fwZKdC
	 ho6K91g/1xHvg==
Date: Tue, 24 Jun 2025 03:56:52 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 13/16] drivers/vuart: move PL011 emulator code
Message-ID: <20250624035443.344099-14-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e703f20ca9c0a634a9318d220f2e9539bd9eca76
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Move PL011 emulator to the new location for UART emulators.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/Kconfig                               |  7 -------
 xen/arch/arm/Makefile                              |  1 -
 xen/drivers/Kconfig                                |  2 ++
 xen/drivers/Makefile                               |  1 +
 xen/drivers/vuart/Kconfig                          | 14 ++++++++++++++
 xen/drivers/vuart/Makefile                         |  1 +
 .../arm/vpl011.c =3D> drivers/vuart/vuart-pl011.c}   |  0
 7 files changed, 18 insertions(+), 8 deletions(-)
 create mode 100644 xen/drivers/vuart/Kconfig
 create mode 100644 xen/drivers/vuart/Makefile
 rename xen/{arch/arm/vpl011.c =3D> drivers/vuart/vuart-pl011.c} (100%)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index b11cb583a763..6eeae97293f2 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -170,13 +170,6 @@ config NEW_VGIC
 =09problems with the standard emulation.
 =09At the moment this implementation is not security supported.
=20
-config HAS_VUART_PL011
-=09bool "Emulated SBSA UART console support"
-=09default y
-=09help
-=09  Allows a guest to use SBSA Generic UART as a console. The
-=09  SBSA Generic UART implements a subset of ARM PL011 UART.
-
 config HAS_VUART_MMIO
 =09bool "Emulated UART for hardware domain"
 =09default y
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index dd015a2a19e8..8475043d8701 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -65,7 +65,6 @@ obj-$(CONFIG_HAS_ITS) +=3D vgic-v3-its.o
 endif
 obj-$(CONFIG_VM_EVENT) +=3D vm_event.o
 obj-y +=3D vtimer.o
-obj-$(CONFIG_HAS_VUART_PL011) +=3D vpl011.o
 obj-y +=3D vsmc.o
 obj-y +=3D vpsci.o
 obj-$(CONFIG_HAS_VUART_MMIO) +=3D vuart.o
diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index 20050e9bb8b3..5e533b260004 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -12,6 +12,8 @@ source "drivers/pci/Kconfig"
=20
 source "drivers/video/Kconfig"
=20
+source "drivers/vuart/Kconfig"
+
 config HAS_VPCI
 =09bool
=20
diff --git a/xen/drivers/Makefile b/xen/drivers/Makefile
index 2a1ae8ad130a..510820472938 100644
--- a/xen/drivers/Makefile
+++ b/xen/drivers/Makefile
@@ -2,6 +2,7 @@ obj-y +=3D char/
 obj-$(CONFIG_HAS_CPUFREQ) +=3D cpufreq/
 obj-$(CONFIG_HAS_PCI) +=3D pci/
 obj-$(CONFIG_HAS_VPCI) +=3D vpci/
+obj-$(CONFIG_HAS_VUART) +=3D vuart/
 obj-$(CONFIG_HAS_PASSTHROUGH) +=3D passthrough/
 obj-$(CONFIG_ACPI) +=3D acpi/
 obj-$(CONFIG_VIDEO) +=3D video/
diff --git a/xen/drivers/vuart/Kconfig b/xen/drivers/vuart/Kconfig
new file mode 100644
index 000000000000..d8df0f6d1b3c
--- /dev/null
+++ b/xen/drivers/vuart/Kconfig
@@ -0,0 +1,14 @@
+config HAS_VUART
+=09bool
+
+if (ARM_32 || ARM_64)
+
+config HAS_VUART_PL011
+=09bool "Emulated PL011 UART support"
+=09default y
+=09select HAS_VUART
+=09help
+=09  Allows a guest to use SBSA Generic UART as a console. The
+=09  SBSA Generic UART implements a subset of ARM PL011 UART.
+
+endif
diff --git a/xen/drivers/vuart/Makefile b/xen/drivers/vuart/Makefile
new file mode 100644
index 000000000000..3b7069f1cf95
--- /dev/null
+++ b/xen/drivers/vuart/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_HAS_VUART_PL011) +=3D vuart-pl011.o
diff --git a/xen/arch/arm/vpl011.c b/xen/drivers/vuart/vuart-pl011.c
similarity index 100%
rename from xen/arch/arm/vpl011.c
rename to xen/drivers/vuart/vuart-pl011.c
--=20
2.34.1



