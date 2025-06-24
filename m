Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4C3AE5AB3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 06:00:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022952.1398826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuq1-00020W-Di; Tue, 24 Jun 2025 04:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022952.1398826; Tue, 24 Jun 2025 04:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuq1-0001xz-Ay; Tue, 24 Jun 2025 04:00:49 +0000
Received: by outflank-mailman (input) for mailman id 1022952;
 Tue, 24 Jun 2025 04:00:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTulM-000639-HU
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:56:00 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2338276b-50af-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 05:55:59 +0200 (CEST)
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
X-Inumbo-ID: 2338276b-50af-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=vvcfptfpireknpma5nle5ez43y.protonmail; t=1750737357; x=1750996557;
	bh=Hr/ZkUe3+2HPidIdCTxwSDIZWzLYqjdMotIU52bRYqY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J9G5q+amCTOYNYSoOOYXFdP4tBeAGCM4ONZaVMGNf4RzbNrjBtEysWAfEXI8f/niw
	 sstjwf8ILPI7wTiUJF7/JsT6Z0ol7hRXGhFXEjrl6LZrK0IvPFZMXDgdHmQSwuw8qp
	 H/SWgr9Qwe9pRIOsGtXEQG7WaKIhy54LRxKlVGJC+ZrJg9v91/omJQNwYfmmobsIl5
	 rKBOesy3pi4DxHVoKYqMjBsDJKa9X6kKZv/rEa/v9IYwKJgnz4asxCXnoZOAlP59hs
	 FZKYDfdZ8qpsMdb6zb9qCp8sVslCc9okbF60n4GoOgU+Qy9yUTCb983COC133u9rQQ
	 4Tvx0fvs0BwWA==
Date: Tue, 24 Jun 2025 03:55:51 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 06/16] arm/vpl011: remove vpl011 header file
Message-ID: <20250624035443.344099-7-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 23672e309d6359726fd79b9e87ec955d61d4c858
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Make all PL011 emulator declarations private to emulator's code.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/include/asm/vpl011.h | 67 -------------------------------
 xen/arch/arm/vpl011.c             | 39 ++++++++++++++++--
 2 files changed, 35 insertions(+), 71 deletions(-)
 delete mode 100644 xen/arch/arm/include/asm/vpl011.h

diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/v=
pl011.h
deleted file mode 100644
index 8f6ea0005e72..000000000000
--- a/xen/arch/arm/include/asm/vpl011.h
+++ /dev/null
@@ -1,67 +0,0 @@
-/*
- * include/xen/vpl011.h
- *
- * Virtual PL011 UART
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License f=
or
- * more details.
- *
- * You should have received a copy of the GNU General Public License along=
 with
- * this program; If not, see <http://www.gnu.org/licenses/>.
- */
-
-#ifndef _VPL011_H_
-#define _VPL011_H_
-
-#include <public/domctl.h>
-#include <public/io/ring.h>
-#include <public/io/console.h>
-#include <xen/mm.h>
-
-#define SBSA_UART_FIFO_SIZE 32
-/* Same size as VUART_BUF_SIZE, used in vuart.c */
-#define SBSA_UART_OUT_BUF_SIZE 128
-struct vpl011_xen_backend {
-    char in[SBSA_UART_FIFO_SIZE];
-    char out[SBSA_UART_OUT_BUF_SIZE];
-    XENCONS_RING_IDX in_cons, in_prod;
-    XENCONS_RING_IDX out_prod;
-};
-
-struct vpl011 {
-    bool backend_in_domain;
-    union {
-        struct {
-            void *ring_buf;
-            struct page_info *ring_page;
-        } dom;
-        struct vpl011_xen_backend *xen;
-    } backend;
-    uint32_t    uartfr;         /* Flag register */
-    uint32_t    uartcr;         /* Control register */
-    uint32_t    uartimsc;       /* Interrupt mask register*/
-    uint32_t    uarticr;        /* Interrupt clear register */
-    uint32_t    uartris;        /* Raw interrupt status register */
-    uint32_t    shadow_uartmis; /* shadow masked interrupt register */
-    paddr_t     base_addr;
-    unsigned int virq;
-    spinlock_t  lock;
-    evtchn_port_t evtchn;
-};
-
-#endif  /* _VPL011_H_ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 3c027ccf0b4e..bebfb5e0365c 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -7,9 +7,6 @@
=20
 #define XEN_WANT_FLEX_CONSOLE_RING 1
=20
-/* We assume the PL011 default of "1/2 way" for the FIFO trigger level. */
-#define SBSA_UART_FIFO_LEVEL (SBSA_UART_FIFO_SIZE / 2)
-
 #include <xen/errno.h>
 #include <xen/event.h>
 #include <xen/device_tree.h>
@@ -25,13 +22,47 @@
 #include <xen/xvmalloc.h>
 #include <public/domctl.h>
 #include <public/io/console.h>
+#include <public/io/ring.h>
 #include <asm/domain_build.h>
 #include <asm/kernel.h>
 #include <asm/pl011-uart.h>
 #include <asm/vgic-emul.h>
-#include <asm/vpl011.h>
 #include <asm/vreg.h>
=20
+#define SBSA_UART_FIFO_SIZE         32
+/* Same size as VUART_BUF_SIZE, used in simple MMIO-based vUART */
+#define SBSA_UART_OUT_BUF_SIZE      128
+/* We assume the PL011 default of "1/2 way" for the FIFO trigger level. */
+#define SBSA_UART_FIFO_LEVEL        (SBSA_UART_FIFO_SIZE / 2)
+
+struct vpl011_xen_backend {
+    char in[SBSA_UART_FIFO_SIZE];
+    char out[SBSA_UART_OUT_BUF_SIZE];
+    XENCONS_RING_IDX in_cons, in_prod;
+    XENCONS_RING_IDX out_prod;
+};
+
+struct vpl011 {
+    bool backend_in_domain;
+    union {
+        struct {
+            void *ring_buf;
+            struct page_info *ring_page;
+        } dom;
+        struct vpl011_xen_backend *xen;
+    } backend;
+    uint32_t    uartfr;         /* Flag register */
+    uint32_t    uartcr;         /* Control register */
+    uint32_t    uartimsc;       /* Interrupt mask register*/
+    uint32_t    uarticr;        /* Interrupt clear register */
+    uint32_t    uartris;        /* Raw interrupt status register */
+    uint32_t    shadow_uartmis; /* shadow masked interrupt register */
+    paddr_t     base_addr;
+    unsigned int virq;
+    spinlock_t  lock;
+    evtchn_port_t evtchn;
+};
+
 static void __vpl011_exit(struct vpl011 *vpl011, struct domain *d)
 {
     if ( vpl011->virq )
--=20
2.34.1



