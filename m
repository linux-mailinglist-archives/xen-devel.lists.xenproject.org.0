Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B075FAE5AA1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 05:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022909.1398776 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuke-0006Kg-J6; Tue, 24 Jun 2025 03:55:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022909.1398776; Tue, 24 Jun 2025 03:55:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuke-0006JB-GT; Tue, 24 Jun 2025 03:55:16 +0000
Received: by outflank-mailman (input) for mailman id 1022909;
 Tue, 24 Jun 2025 03:55:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTukc-0006IZ-NT
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:55:14 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 065924b8-50af-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 05:55:11 +0200 (CEST)
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
X-Inumbo-ID: 065924b8-50af-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750737309; x=1750996509;
	bh=yCudMdFYgoXw08jE2y4zALqq0ZHl0jnLUlz0092mkm0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AENORXkaGdRBMqyIDZm2j2Lx0HCUTLgil2vFuaRYeGKBW/udVYVvpUPY0HMHskM1Z
	 s5Y+IsudnMkiJJOppGB8eDrpfBrPNgCGCM910oiprpKZcEpTx7B9qfI6r4efMJaAlH
	 cJfbBJwNlwj/0fn+WsGqHwncS1vnzRFTQiny3jl5RsB/k+YqQJU/wAPbBXqyB6ho+J
	 oYugEYX1efulWDlpRM10GZSXVpMYIlNCQ9QALVBKCx0nnHjWYxYfAvV9QZu2YEXe3L
	 wm/zBqhMBbwq90XBsp0BJF7eL9Q2Xmn65TUtyGO0TAaJRpGXguP/G2QunjQVQAQRZp
	 4poMtcJYlb5ww==
Date: Tue, 24 Jun 2025 03:55:04 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 01/16] arm/vpl011: rename virtual PL011 Kconfig option
Message-ID: <20250624035443.344099-2-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e843f1976d3f637ab52c7c2c4788aa3930d7bf95
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Rename CONFIG_SBSA_VUART_CONSOLE to CONFIG_HAS_VUART_PL011.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/Kconfig                  | 2 +-
 xen/arch/arm/Makefile                 | 2 +-
 xen/arch/arm/configs/tiny64_defconfig | 2 +-
 xen/arch/arm/dom0less-build.c         | 4 ++--
 xen/arch/arm/include/asm/domain.h     | 2 +-
 xen/arch/arm/include/asm/vpl011.h     | 2 +-
 xen/drivers/char/console.c            | 4 ++--
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 3f25da3ca5fd..03888569f38c 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -170,7 +170,7 @@ config NEW_VGIC
 =09problems with the standard emulation.
 =09At the moment this implementation is not security supported.
=20
-config SBSA_VUART_CONSOLE
+config HAS_VUART_PL011
 =09bool "Emulated SBSA UART console support"
 =09default y
 =09help
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index ab0a0c2be6d8..2d6787fb03bc 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -65,7 +65,7 @@ obj-$(CONFIG_HAS_ITS) +=3D vgic-v3-its.o
 endif
 obj-$(CONFIG_VM_EVENT) +=3D vm_event.o
 obj-y +=3D vtimer.o
-obj-$(CONFIG_SBSA_VUART_CONSOLE) +=3D vpl011.o
+obj-$(CONFIG_HAS_VUART_PL011) +=3D vpl011.o
 obj-y +=3D vsmc.o
 obj-y +=3D vpsci.o
 obj-$(CONFIG_HWDOM_VUART) +=3D vuart.o
diff --git a/xen/arch/arm/configs/tiny64_defconfig b/xen/arch/arm/configs/t=
iny64_defconfig
index 469a1eb9f99d..acc227262d81 100644
--- a/xen/arch/arm/configs/tiny64_defconfig
+++ b/xen/arch/arm/configs/tiny64_defconfig
@@ -6,7 +6,7 @@ CONFIG_ARM=3Dy
 #
 # CONFIG_GICV3 is not set
 # CONFIG_VM_EVENT is not set
-# CONFIG_SBSA_VUART_CONSOLE is not set
+# CONFIG_HAS_VUART_PL011 is not set
=20
 #
 # Common Features
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 4b285cff5ee2..2a5531a2b892 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -167,7 +167,7 @@ int __init make_intc_domU_node(struct kernel_info *kinf=
o)
     }
 }
=20
-#ifdef CONFIG_SBSA_VUART_CONSOLE
+#ifdef CONFIG_HAS_VUART_PL011
 static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
 {
     void *fdt =3D kinfo->fdt;
@@ -226,7 +226,7 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
=20
     if ( kinfo->arch.vpl011 )
     {
-#ifdef CONFIG_SBSA_VUART_CONSOLE
+#ifdef CONFIG_HAS_VUART_PL011
         ret =3D make_vpl011_uart_node(kinfo);
 #endif
         if ( ret )
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index a3487ca71303..746ea687d523 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -113,7 +113,7 @@ struct arch_domain
         uint8_t privileged_call_enabled : 1;
     } monitor;
=20
-#ifdef CONFIG_SBSA_VUART_CONSOLE
+#ifdef CONFIG_HAS_VUART_PL011
     struct vpl011 vpl011;
 #endif
=20
diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/v=
pl011.h
index cc838682815c..be64883b8628 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -65,7 +65,7 @@ struct vpl011_init_info {
     evtchn_port_t evtchn;
 };
=20
-#ifdef CONFIG_SBSA_VUART_CONSOLE
+#ifdef CONFIG_HAS_VUART_PL011
 int domain_vpl011_init(struct domain *d,
                        struct vpl011_init_info *info);
 void domain_vpl011_deinit(struct domain *d);
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 5879e31786ba..0f37badc471e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -37,7 +37,7 @@
 #ifdef CONFIG_X86
 #include <asm/guest.h>
 #endif
-#ifdef CONFIG_SBSA_VUART_CONSOLE
+#ifdef CONFIG_HAS_VUART_PL011
 #include <asm/vpl011.h>
 #endif
=20
@@ -606,7 +606,7 @@ static void __serial_rx(char c)
          */
         send_global_virq(VIRQ_CONSOLE);
     }
-#ifdef CONFIG_SBSA_VUART_CONSOLE
+#ifdef CONFIG_HAS_VUART_PL011
     else
         /* Deliver input to the emulated UART. */
         rc =3D vpl011_rx_char_xen(d, c);
--=20
2.34.1



