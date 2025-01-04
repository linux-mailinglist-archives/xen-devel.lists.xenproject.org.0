Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7F0A01197
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864704.1275953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQk-0005fN-66; Sat, 04 Jan 2025 01:58:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864704.1275953; Sat, 04 Jan 2025 01:58:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQj-0005dW-SF; Sat, 04 Jan 2025 01:58:21 +0000
Received: by outflank-mailman (input) for mailman id 864704;
 Sat, 04 Jan 2025 01:58:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQh-0005Ax-Po
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:19 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c98c525-ca3f-11ef-a0de-8be0dac302b0;
 Sat, 04 Jan 2025 02:58:16 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 38D1BA406B3;
 Sat,  4 Jan 2025 01:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FBE0C4CEDE;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 17060E77198;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
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
X-Inumbo-ID: 5c98c525-ca3f-11ef-a0de-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955895;
	bh=ozuAIUEC9kYvZPh1viwAiXRxK6v41KulMiHqosxlddk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Xt0TQgCWoK3CpeiNu3J2IHjIb9Pe+2HhWLjz2kE+qpVzBgDSDENK+vJF8/HtkP/Rt
	 QkLRRKIqqnt1VAvifCIfCqY0jXM7jMplW2U/0ewocCTu1jpRstsB8eXydVJ1/SfzGy
	 4/01jch0vTR3bUlV9OfQ0KMDETjanQZbMXrnsK0fcgZTSXWSbNWxaHnDLKM+UIkRIH
	 mtatQRWfVxHdI6UQMyjiVbb/beOnh82IQKY53mU9gkFcMbpa8QPGBFPAKsW269CiEd
	 OgC7KA+62rrfb49gPDJlqsKHH0xTm4/FwIESevxBoxj0WuY2aPfU0eE6fju7xyuURY
	 Qs3sMALrx36Qw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:13 -0800
Subject: [PATCH v3 07/24] xen/console: introduce framework for UART
 emulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-7-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=20565;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=+qDoty7zETfSP7cDTtaMjm20Q4Ar3xPkCT1pAjGNRBA=;
 b=NjNytDgX7I98JX0c3E/AXYpE2iJB+eZjNeTD482lBrp1oS+c9OEztAjDd1s0mETykULeJ1WF/
 q4187w3hOq7DQwmy7jv/TiTBlxPe4QoiOYQwlPfPTOZNuOGwTkDDjcy
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Introduce a driver framework to abstract UART emulators in the hypervisor.

That allows for architecture-independent handling of virtual UARTs from Xen
console driver and simplifies enabling new architecture-dependent UART
emulators.

The framework is built under CONFIG_HAS_VUART, which is automatically enabled
once the user selects a specific UART emulator.

All domains w/ enabled vUART will have VIRTDEV_UART bit set in
d->arch.emulation_flags.

Current implementation supports maximum of one vUART per domain, excluding
emulators for hardware domains.

Use domain_has_vuart() in Xen console driver code to check whether the
domain can own the physical console focus.

Note, arm/vuart.c emulator is not hooked to virtdev-uart framework because the
emulator is limited to the hardware domains only and was not designed to own
the physical console input. Updated arm/vuart.c APIs to have 'hwdom_' prefix
instead of generic 'domain_' to avoid possible confusion.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/Kconfig              |  1 +
 xen/arch/arm/dom0less-build.c     |  4 +--
 xen/arch/arm/domain.c             |  2 +-
 xen/arch/arm/domctl.c             | 11 +++---
 xen/arch/arm/include/asm/vpl011.h | 21 +-----------
 xen/arch/arm/vpl011.c             | 33 ++++++++++++------
 xen/arch/arm/vuart.c              |  3 ++
 xen/arch/arm/xen.lds.S            |  1 +
 xen/arch/ppc/xen.lds.S            |  1 +
 xen/arch/riscv/xen.lds.S          |  1 +
 xen/arch/x86/hvm/hvm.c            |  1 +
 xen/arch/x86/xen.lds.S            |  1 +
 xen/common/keyhandler.c           |  3 ++
 xen/drivers/Kconfig               |  5 +++
 xen/drivers/Makefile              |  1 +
 xen/drivers/char/console.c        | 11 +++---
 xen/drivers/virtdev-uart.c        | 60 ++++++++++++++++++++++++++++++++
 xen/include/public/virtdev.h      |  1 +
 xen/include/xen/domain.h          |  3 ++
 xen/include/xen/virtdev-uart.h    | 72 +++++++++++++++++++++++++++++++++++++++
 xen/include/xen/xen.lds.h         | 10 ++++++
 21 files changed, 200 insertions(+), 46 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a26d3e11827cfe030d36400e322aa9b65502674c..8af4538bec2df3c3b15fa42b054bda658d9edad0 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -175,6 +175,7 @@ config NEW_VGIC
 config SBSA_VUART_CONSOLE
 	bool "Emulated SBSA UART console support"
 	default y
+	select HAS_VUART
 	help
 	  Allows a guest to use SBSA Generic UART as a console. The
 	  SBSA Generic UART implements a subset of ARM PL011 UART.
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 49d1f14d659b28a906b498157e93ce544465d89e..78fba18b6aa80278207f920145c5aab4fecc6d18 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -785,7 +785,7 @@ static int __init construct_domU(struct domain *d,
      */
     if ( kinfo.vpl011 )
     {
-        rc = domain_vpl011_init(d, NULL);
+        rc = virtdev_uart_init(d, NULL);
         if ( rc < 0 )
             return rc;
     }
@@ -891,7 +891,7 @@ void __init create_domUs(void)
              * d->arch.vpl011.irq. So the logic to find the vIRQ has to
              * be hardcoded.
              * The logic here shall be consistent with the one in
-             * domain_vpl011_init().
+             * vpl011_init().
              */
             if ( flags & CDF_directmap )
             {
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 7ef1a95c290752d5a0167806e298aacc834ea640..dbc5bae6217b141b0f89f3e7fd2792ebd9c7a456 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -1067,7 +1067,7 @@ int domain_relinquish_resources(struct domain *d)
          * Release the resources allocated for vpl011 which were
          * allocated via a DOMCTL call XEN_DOMCTL_vuart_op.
          */
-        domain_vpl011_deinit(d);
+        virtdev_uart_exit(d);
 
 #ifdef CONFIG_IOREQ_SERVER
         ioreq_server_destroy_all(d);
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index 9d047065ba13ffe003d2565879cd073e78f76893..53c57b092d28f7a6dd7b8bf280d1d6fd0d27f54b 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -14,6 +14,7 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/types.h>
+#include <xen/virtdev-uart.h>
 #include <xsm/xsm.h>
 #include <public/domctl.h>
 
@@ -30,10 +31,7 @@ static int handle_vuart_init(struct domain *d,
                              struct xen_domctl_vuart_op *vuart_op)
 {
     int rc;
-    struct vpl011_init_info info;
-
-    info.console_domid = vuart_op->console_domid;
-    info.gfn = _gfn(vuart_op->gfn);
+    struct virtdev_uart_params info;
 
     if ( d->creation_finished )
         return -EPERM;
@@ -41,8 +39,11 @@ static int handle_vuart_init(struct domain *d,
     if ( vuart_op->type != XEN_DOMCTL_VUART_TYPE_VPL011 )
         return -EOPNOTSUPP;
 
-    rc = domain_vpl011_init(d, &info);
+    info.console_domid = vuart_op->console_domid;
+    info.gfn = _gfn(vuart_op->gfn);
+    info.evtchn = (evtchn_port_t)-1;
 
+    rc = virtdev_uart_init(d, &info);
     if ( !rc )
         vuart_op->evtchn = info.evtchn;
 
diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
index cc838682815c0d049ba33d3bf9966a64b2e527dd..89937ce60a41d739e1efa5af5da86e1ee23621c6 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -23,6 +23,7 @@
 #include <public/io/ring.h>
 #include <public/io/console.h>
 #include <xen/mm.h>
+#include <xen/virtdev-uart.h>
 
 /* helper macros */
 #define VPL011_LOCK(d,flags) spin_lock_irqsave(&(d)->arch.vpl011.lock, flags)
@@ -59,26 +60,6 @@ struct vpl011 {
     evtchn_port_t evtchn;
 };
 
-struct vpl011_init_info {
-    domid_t console_domid;
-    gfn_t gfn;
-    evtchn_port_t evtchn;
-};
-
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-int domain_vpl011_init(struct domain *d,
-                       struct vpl011_init_info *info);
-void domain_vpl011_deinit(struct domain *d);
-int vpl011_rx_char_xen(struct domain *d, char c);
-#else
-static inline int domain_vpl011_init(struct domain *d,
-                                     struct vpl011_init_info *info)
-{
-    return -ENOSYS;
-}
-
-static inline void domain_vpl011_deinit(struct domain *d) { }
-#endif
 #endif  /* _VPL011_H_ */
 
 /*
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 66047bf33cedb930a6bd7c96577913cd1ae08f05..236fd70d0847f375070dfff314bb8dd08d6ad166 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -19,6 +19,7 @@
 #include <xen/sched.h>
 #include <xen/console.h>
 #include <xen/serial.h>
+#include <xen/virtdev-uart.h>
 #include <public/domctl.h>
 #include <public/io/console.h>
 #include <asm/pl011-uart.h>
@@ -26,6 +27,8 @@
 #include <asm/vpl011.h>
 #include <asm/vreg.h>
 
+static void cf_check vpl011_exit(struct domain *d);
+
 /*
  * Since pl011 registers are 32-bit registers, all registers
  * are handled similarly allowing 8-bit, 16-bit and 32-bit
@@ -566,9 +569,9 @@ static void vpl011_data_avail(struct domain *d,
 }
 
 /*
- * vpl011_rx_char_xen adds a char to a domain's vpl011 receive buffer.
+ * vpl011_putchar adds a char to a domain's vpl011 receive buffer.
  */
-int vpl011_rx_char_xen(struct domain *d, char c)
+static int cf_check vpl011_putchar(struct domain *d, char c)
 {
     unsigned long flags;
     struct vpl011 *vpl011 = &d->arch.vpl011;
@@ -637,7 +640,8 @@ static void vpl011_notification(struct vcpu *v, unsigned int port)
     VPL011_UNLOCK(d, flags);
 }
 
-int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
+static int cf_check vpl011_init(struct domain *d,
+                                struct virtdev_uart_params *params)
 {
     int rc;
     struct vpl011 *vpl011 = &d->arch.vpl011;
@@ -689,27 +693,28 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     }
 
     /*
-     * info is NULL when the backend is in Xen.
-     * info is != NULL when the backend is in a domain.
+     * params is NULL when the backend is in Xen.
+     * params is != NULL when the backend is in a domain.
      */
-    if ( info != NULL )
+    if ( params )
     {
         vpl011->backend_in_domain = true;
 
         /* Map the guest PFN to Xen address space. */
         rc =  prepare_ring_for_helper(d,
-                                      gfn_x(info->gfn),
+                                      gfn_x(params->gfn),
                                       &vpl011->backend.dom.ring_page,
                                       &vpl011->backend.dom.ring_buf);
         if ( rc < 0 )
             goto out;
 
-        rc = alloc_unbound_xen_event_channel(d, 0, info->console_domid,
+        rc = alloc_unbound_xen_event_channel(d, 0, params->console_domid,
                                              vpl011_notification);
         if ( rc < 0 )
             goto out1;
 
-        vpl011->evtchn = info->evtchn = rc;
+        params->evtchn = rc;
+        vpl011->evtchn = rc;
     }
     else
     {
@@ -740,13 +745,13 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     return 0;
 
 out1:
-    domain_vpl011_deinit(d);
+    vpl011_exit(d);
 
 out:
     return rc;
 }
 
-void domain_vpl011_deinit(struct domain *d)
+static void cf_check vpl011_exit(struct domain *d)
 {
     struct vpl011 *vpl011 = &d->arch.vpl011;
 
@@ -783,6 +788,12 @@ void domain_vpl011_deinit(struct domain *d)
         XFREE(vpl011->backend.xen);
 }
 
+static void cf_check vpl011_dump(struct domain *d)
+{
+}
+
+VIRTDEV_UART_REGISTER(vpl011);
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/vuart.c b/xen/arch/arm/vuart.c
index 23e05dba3a5617863f6c08f085c358f2cf32a292..03366da17a604502f6e0afb45e8824c9d7cfa3dd 100644
--- a/xen/arch/arm/vuart.c
+++ b/xen/arch/arm/vuart.c
@@ -17,6 +17,9 @@
  * /!\ This device is not intended to be enumerable or exposed to the OS
  * (e.g. via Device Tree).
  *
+ * Not hooked into virtdev-uart framework because this emulator is limited
+ * to hardware domains only and cannot own physical console input.
+ *
  * Julien Grall <julien.grall@linaro.org>
  * Ian Campbell <ian.campbell@citrix.com>
  * Copyright (c) 2012 Citrix Systems.
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index bbccff1a0350ef7ce7099c4756be12a7232d8de5..dd68dadccd7c873ddc98240c66b5af5896e9f04a 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -69,6 +69,7 @@ SECTIONS
        __proc_info_end = .;
 
        VPCI_ARRAY
+       VIRTDEV_UART_SECTION
   } :text
 
 #if defined(BUILD_ID)
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 3f2a7676ec96f6d773825f2d3ecb90ab2f604e9f..419b8c472de03bd7db76a3ecc5c87080500e1870 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -56,6 +56,7 @@ SECTIONS
         *(.data.rel.ro.*)
 
         VPCI_ARRAY
+        VIRTDEV_UART_SECTION
 
         . = ALIGN(POINTER_ALIGN);
     } :text
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index dffc6ae11913fa52d556ee6639bbbd4abb5f44f9..3a2cde3b7de55395f3fba1ead0db91f35b362107 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -51,6 +51,7 @@ SECTIONS
         *(.data.rel.ro.*)
 
         VPCI_ARRAY
+        VIRTDEV_UART_SECTION
 
         . = ALIGN(POINTER_ALIGN);
     } :text
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index c4f1df248c1a7b2b3e5c45cef154e7ca80018dfc..ce21f5884b554f27991f19d9953731a9e8241e90 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -30,6 +30,7 @@
 #include <xen/vpci.h>
 #include <xen/nospec.h>
 #include <xen/vm_event.h>
+#include <xen/virtdev-uart.h>
 #include <asm/shadow.h>
 #include <asm/hap.h>
 #include <asm/current.h>
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 42217eaf2485ebc221749c1cf12794af8a153616..42e15ab2cf078d0cf5d870c7bc5c5d3e327d9f5f 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -146,6 +146,7 @@ SECTIONS
        __note_gnu_build_id_end = .;
 #endif
        VPCI_ARRAY
+       VIRTDEV_UART_SECTION
   } PHDR(text)
 
 #if defined(CONFIG_PVH_GUEST) && !defined(EFI)
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 7c331bc17bf279d4dd95ec5bbb540a70657cc1d1..1040eda5a15f24fdf9324072b8524289969bad47 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -22,6 +22,7 @@
 #include <xen/mm.h>
 #include <xen/watchdog.h>
 #include <xen/init.h>
+#include <xen/virtdev-uart.h>
 #include <asm/div64.h>
 
 static unsigned char keypress_key;
@@ -350,6 +351,8 @@ static void cf_check dump_domains(unsigned char key)
                            v->periodic_period / 1000000);
             }
         }
+
+        virtdev_uart_dump(d);
     }
 
     for_each_domain ( d )
diff --git a/xen/drivers/Kconfig b/xen/drivers/Kconfig
index 20050e9bb8b32bd16c2da76c2c3e0f68dab89394..355719c3af67683c153a4f7a35dad4944992846e 100644
--- a/xen/drivers/Kconfig
+++ b/xen/drivers/Kconfig
@@ -19,4 +19,9 @@ config HAS_VPCI_GUEST_SUPPORT
 	bool
 	select HAS_VPCI
 
+config HAS_VUART
+	bool "UART emulation framework"
+	help
+	  This selects UART emulation framework.
+
 endmenu
diff --git a/xen/drivers/Makefile b/xen/drivers/Makefile
index 2a1ae8ad130a2e62bf391528be669d07c056fece..6593e2118e8e2d65778af96c9f2c066a705b0186 100644
--- a/xen/drivers/Makefile
+++ b/xen/drivers/Makefile
@@ -5,3 +5,4 @@ obj-$(CONFIG_HAS_VPCI) += vpci/
 obj-$(CONFIG_HAS_PASSTHROUGH) += passthrough/
 obj-$(CONFIG_ACPI) += acpi/
 obj-$(CONFIG_VIDEO) += video/
+obj-$(CONFIG_HAS_VUART) += virtdev-uart.o
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2d20a9d7531e069803eaf30ce79354b998c4a52f..0927c0564a67098c70dab576ebeda3825fadfb61 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -34,13 +34,11 @@
 #include <asm/setup.h>
 #include <xen/sections.h>
 #include <xen/consoled.h>
+#include <xen/virtdev-uart.h>
 
 #ifdef CONFIG_X86
 #include <asm/guest.h>
 #endif
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-#include <asm/vpl011.h>
-#endif
 
 /* console: comma-separated list of console outputs. */
 static char __initdata opt_console[30] = OPT_CONSOLE_STR;
@@ -545,6 +543,7 @@ static void __serial_rx(char c)
         /*
          * Deliver input to the hardware domain buffer, unless it is
          * already full.
+         * NB: must be the first check: hardware domain may have emulated UART.
          */
         if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
             serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;
@@ -555,11 +554,9 @@ static void __serial_rx(char c)
          */
         send_global_virq(VIRQ_CONSOLE);
     }
-#ifdef CONFIG_SBSA_VUART_CONSOLE
-    else
+    else if ( domain_has_vuart(d) )
         /* Deliver input to the emulated UART. */
-        rc = vpl011_rx_char_xen(d, c);
-#endif
+        rc = virtdev_uart_putchar(d, c);
 
     if ( consoled_is_enabled() )
         /* Deliver input to the PV shim console. */
diff --git a/xen/drivers/virtdev-uart.c b/xen/drivers/virtdev-uart.c
new file mode 100644
index 0000000000000000000000000000000000000000..d238ef369c6b94429eaad9f33c79b63ba325b7c6
--- /dev/null
+++ b/xen/drivers/virtdev-uart.c
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/errno.h>
+#include <xen/event.h>
+#include <xen/virtdev-uart.h>
+#include <public/virtdev.h>
+
+extern const struct virtdev_uart *__start_virtdev_uart;
+
+int virtdev_uart_init(struct domain *d, struct virtdev_uart_params *params)
+{
+    int rc;
+
+    ASSERT(__start_virtdev_uart);
+
+    rc = __start_virtdev_uart->init(d, params);
+    if ( rc )
+        return rc;
+
+#if !defined(__i386__) && !defined(__x86_64__)
+    d->arch.emulation_flags |= VIRTDEV_UART;
+#endif
+
+    return 0;
+}
+
+void virtdev_uart_exit(struct domain *d)
+{
+    ASSERT(__start_virtdev_uart);
+
+    __start_virtdev_uart->exit(d);
+
+#if !defined(__i386__) && !defined(__x86_64__)
+    d->arch.emulation_flags &= ~VIRTDEV_UART;
+#endif
+}
+
+int virtdev_uart_putchar(struct domain *d, char c)
+{
+    ASSERT(__start_virtdev_uart);
+    ASSERT(d->arch.emulation_flags & VIRTDEV_UART);
+
+    return __start_virtdev_uart->putchar(d, c);
+}
+
+void virtdev_uart_dump(struct domain *d)
+{
+    ASSERT(__start_virtdev_uart);
+
+    __start_virtdev_uart->dump(d);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/public/virtdev.h b/xen/include/public/virtdev.h
index 27434377ecacfe069a91dea3768d14b0c14e08b4..36931e0d679cedadd4212f34142d7c3f00cd3389 100644
--- a/xen/include/public/virtdev.h
+++ b/xen/include/public/virtdev.h
@@ -17,6 +17,7 @@ enum {
     VIRTDEV_PIT        = 1U << 8,
     VIRTDEV_PIRQ       = 1U << 9,
     VIRTDEV_PCI        = 1U << 10,
+    VIRTDEV_UART       = 1U << 11,
 };
 
 #if defined(__i386__) || defined(__x86_64__)
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index eec093e9e167c14a536383422d280ed5ee56f698..4ae5def08eda40db58b6506b60a9393c82ba9aa7 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -54,6 +54,9 @@ void arch_get_domain_info(const struct domain *d,
 
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
+#define domain_has_vuart(d) \
+    ( IS_ENABLED(CONFIG_HAS_VUART) && \
+      (d)->arch.emulation_flags & VIRTDEV_UART )
 
 /*
  * Arch-specifics.
diff --git a/xen/include/xen/virtdev-uart.h b/xen/include/xen/virtdev-uart.h
new file mode 100644
index 0000000000000000000000000000000000000000..fbe48e513996404d793d011747b3f40c236a6a57
--- /dev/null
+++ b/xen/include/xen/virtdev-uart.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN__VIRTDEV_UART_H
+#define XEN__VIRTDEV_UART_H
+
+#include <public/xen.h>
+#include <public/event_channel.h>
+#include <xen/types.h>
+
+struct virtdev_uart_params {
+    domid_t console_domid;
+    gfn_t gfn;
+    evtchn_port_t evtchn;
+};
+
+struct virtdev_uart {
+    int (*putchar)(struct domain *d, char c);
+    int (*init)(struct domain *d, struct virtdev_uart_params *params);
+    void (*exit)(struct domain *d);
+    void (*dump)(struct domain *d);
+};
+
+#define VIRTDEV_UART_REGISTER(x) \
+    static const struct virtdev_uart *x##_entry \
+           __used_section(".data.virtdev.uart") = \
+    &(const struct virtdev_uart){ \
+        .init    = x ## _init, \
+        .exit    = x ## _exit, \
+        .dump    = x ## _dump, \
+        .putchar = x ## _putchar, \
+    }
+
+#ifdef CONFIG_HAS_VUART
+
+int virtdev_uart_putchar(struct domain *d, char c);
+int virtdev_uart_init(struct domain *d, struct virtdev_uart_params *params);
+void virtdev_uart_exit(struct domain *d);
+void virtdev_uart_dump(struct domain *d);
+
+#else
+
+static inline int virtdev_uart_putchar(struct domain *d, char c)
+{
+    ASSERT_UNREACHABLE();
+    return -ENODEV;
+}
+
+static inline int virtdev_uart_init(struct domain *d,
+                                    struct virtdev_uart_params *params)
+{
+    return 0;
+}
+
+static inline void virtdev_uart_exit(struct domain *d)
+{
+}
+
+static inline void virtdev_uart_dump(struct domain *d)
+{
+}
+
+#endif /* CONFIG_HAS_VUART */
+
+#endif /* XEN__VIRTDEV_UART_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 16a9b1ba03db4861c3a8dbfe38e73335cc90a55e..c19d82a73f4c19a02082c8a6cf920002353b1e09 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -193,4 +193,14 @@
 #define VPCI_ARRAY
 #endif
 
+#ifdef CONFIG_HAS_VUART
+#define VIRTDEV_UART_SECTION \
+       . = ALIGN(POINTER_ALIGN); \
+       __start_virtdev_uart = .; \
+       *(.data.virtdev.uart) \
+       __end_virtdev_uart = .;
+#else
+#define VIRTDEV_UART_SECTION
+#endif
+
 #endif /* __XEN_LDS_H__ */

-- 
2.34.1



