Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F57A5441C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 08:59:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903030.1310950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq68Q-0006Ae-5p; Thu, 06 Mar 2025 07:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903030.1310950; Thu, 06 Mar 2025 07:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tq68Q-00068B-2G; Thu, 06 Mar 2025 07:59:14 +0000
Received: by outflank-mailman (input) for mailman id 903030;
 Thu, 06 Mar 2025 07:59:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z0IF=VZ=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tq68N-000685-Mr
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 07:59:12 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1b8d48f-fa60-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 08:59:08 +0100 (CET)
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
X-Inumbo-ID: e1b8d48f-fa60-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1741247947; x=1741507147;
	bh=JiXrOHVdDFpvEtsfG+zt4dfPzbfq+y2kvoJl/4c7rw8=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=RtjcVOtTOcobCNS3DToIfE6zarKvq/DYP3nZyx7/i5nJvjhksy9c8q7LsU9RaRSqz
	 SHEPMZNrBQcm6pZvg/N00aM1k3RYlxaAMC0V6Wx2rd87LQvc91eGZOFaZHriECuX1P
	 Phd588oTdJQNwyH7R7R3jvjUDhQrJnsv3grnjiV8OuGEjBCC7qjLBgw7Dh4+INoCGt
	 IvwEw1OFWuQmnsqHKS0oHm+kw2ytpPACrB4yn54EOo5lEwkxAi6FNmZ3mSIbd+ChpV
	 Ao6WOKB232/1WpzySDf3K1A6udxksSzjXYrWFPiDWCQyyBleboL9s61CCAjegwlGJO
	 iec9rVuTsSvww==
Date: Thu, 06 Mar 2025 07:59:01 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5] xen/consoled: clean up console handling for PV shim
Message-ID: <20250306075819.154361-1-dmkhn@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5f38d5939de8548be7cf36abb854dee73569005d
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

There are few places which check pv_shim console under CONFIG_PV_SHIM or
CONFIG_X86 in xen console driver.

Instead of inconsistent #ifdef-ing, introduce and use consoled_is_enabled()=
 in
switch_serial_input() and __serial_rx().

PV shim case is fixed in __serial_rx() - should be under 'pv_shim &&
pv_console' check.

Signature of consoled_guest_{rx,tx} has changed so the errors can be logged
on the callsites.

Also, move get_initial_domain_id() to arch-independent header since it is n=
ow
required by console driver.

Lastly, add missing SPDX-License-Identifier to xen/consoled.h

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes v4->v5:
- Dropped consoled_guest_tx() stub under !CONFIG_PV_SHIM case
- Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines=
/1702411426
---
 xen/arch/x86/include/asm/pv/shim.h |  5 +++--
 xen/arch/x86/pv/shim.c             |  8 ++------
 xen/common/domain.c                |  9 +++++++++
 xen/drivers/char/console.c         | 15 ++++++---------
 xen/drivers/char/consoled.c        | 17 +++++++++++++----
 xen/include/xen/consoled.h         | 15 +++++++++++++--
 xen/include/xen/domain.h           |  2 ++
 7 files changed, 48 insertions(+), 23 deletions(-)

diff --git a/xen/arch/x86/include/asm/pv/shim.h b/xen/arch/x86/include/asm/=
pv/shim.h
index 6153e27005..27053d4f6f 100644
--- a/xen/arch/x86/include/asm/pv/shim.h
+++ b/xen/arch/x86/include/asm/pv/shim.h
@@ -31,7 +31,7 @@ long cf_check pv_shim_cpu_up(void *data);
 long cf_check pv_shim_cpu_down(void *data);
 void pv_shim_online_memory(unsigned int nr, unsigned int order);
 void pv_shim_offline_memory(unsigned int nr, unsigned int order);
-domid_t get_initial_domain_id(void);
+domid_t pv_shim_get_initial_domain_id(void);
 uint64_t pv_shim_mem(uint64_t avail);
 void pv_shim_fixup_e820(void);
 const struct platform_bad_page *pv_shim_reserved_pages(unsigned int *size)=
;
@@ -76,8 +76,9 @@ static inline void pv_shim_offline_memory(unsigned int nr=
, unsigned int order)
 {
     ASSERT_UNREACHABLE();
 }
-static inline domid_t get_initial_domain_id(void)
+static inline domid_t pv_shim_get_initial_domain_id(void)
 {
+    ASSERT_UNREACHABLE();
     return 0;
 }
 static inline uint64_t pv_shim_mem(uint64_t avail)
diff --git a/xen/arch/x86/pv/shim.c b/xen/arch/x86/pv/shim.c
index 81e4a0516d..c506cc0bec 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -603,8 +603,7 @@ long pv_shim_event_channel_op(int cmd, XEN_GUEST_HANDLE=
_PARAM(void) arg)
=20
         if ( pv_console && send.port =3D=3D pv_console_evtchn() )
         {
-            consoled_guest_rx();
-            rc =3D 0;
+            rc =3D consoled_guest_rx();
         }
         else
             rc =3D xen_hypercall_event_channel_op(EVTCHNOP_send, &send);
@@ -1016,13 +1015,10 @@ void pv_shim_offline_memory(unsigned int nr, unsign=
ed int order)
     }
 }
=20
-domid_t get_initial_domain_id(void)
+domid_t pv_shim_get_initial_domain_id(void)
 {
     uint32_t eax, ebx, ecx, edx;
=20
-    if ( !pv_shim )
-        return 0;
-
     cpuid(xen_cpuid_base + 4, &eax, &ebx, &ecx, &edx);
=20
     return (eax & XEN_HVM_CPUID_DOMID_PRESENT) ? ecx : 1;
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 0c4cc77111..163663a051 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2259,6 +2259,15 @@ int continue_hypercall_on_cpu(
     return 0;
 }
=20
+domid_t get_initial_domain_id(void)
+{
+#ifdef CONFIG_X86
+    if ( pv_shim )
+        return pv_shim_get_initial_domain_id();
+#endif
+    return hardware_domid;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 2f028c5d44..ba428199d2 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -32,9 +32,9 @@
 #include <xen/pv_console.h>
 #include <asm/setup.h>
 #include <xen/sections.h>
+#include <xen/consoled.h>
=20
 #ifdef CONFIG_X86
-#include <xen/consoled.h>
 #include <asm/guest.h>
 #endif
 #ifdef CONFIG_SBSA_VUART_CONSOLE
@@ -507,11 +507,9 @@ static void switch_serial_input(void)
             break;
         }
=20
-#ifdef CONFIG_PV_SHIM
-        if ( next_rx =3D=3D 1 )
+        if ( consoled_is_enabled() && next_rx =3D=3D 1 )
             domid =3D get_initial_domain_id();
         else
-#endif
             domid =3D next_rx - 1;
         d =3D rcu_lock_domain_by_id(domid);
         if ( d )
@@ -562,16 +560,15 @@ static void __serial_rx(char c)
         rc =3D vpl011_rx_char_xen(d, c);
 #endif
=20
+    if ( consoled_is_enabled() )
+        /* Deliver input to the PV shim console. */
+        rc =3D consoled_guest_tx(c);
+
     if ( rc )
         guest_printk(d,
                      XENLOG_WARNING "failed to process console input: %d\n=
",
                      rc);
=20
-#ifdef CONFIG_X86
-    if ( pv_shim && pv_console )
-        consoled_guest_tx(c);
-#endif
-
     console_put_domain(d);
 }
=20
diff --git a/xen/drivers/char/consoled.c b/xen/drivers/char/consoled.c
index b415b632ce..8704ec251e 100644
--- a/xen/drivers/char/consoled.c
+++ b/xen/drivers/char/consoled.c
@@ -43,13 +43,13 @@ struct xencons_interface *consoled_get_ring_addr(void)
 static char buf[BUF_SZ + 1];
=20
 /* Receives characters from a domain's PV console */
-void consoled_guest_rx(void)
+int consoled_guest_rx(void)
 {
     size_t idx =3D 0;
     XENCONS_RING_IDX cons, prod;
=20
     if ( !cons_ring )
-        return;
+        return -ENODEV;
=20
     spin_lock(&rx_lock);
=20
@@ -91,15 +91,17 @@ void consoled_guest_rx(void)
=20
  out:
     spin_unlock(&rx_lock);
+
+    return 0;
 }
=20
 /* Sends a character into a domain's PV console */
-void consoled_guest_tx(char c)
+int consoled_guest_tx(char c)
 {
     XENCONS_RING_IDX cons, prod;
=20
     if ( !cons_ring )
-        return;
+        return -ENODEV;
=20
     cons =3D ACCESS_ONCE(cons_ring->in_cons);
     prod =3D cons_ring->in_prod;
@@ -125,6 +127,13 @@ void consoled_guest_tx(char c)
  notify:
     /* Always notify the guest: prevents receive path from getting stuck. =
*/
     pv_shim_inject_evtchn(pv_console_evtchn());
+
+    return 0;
+}
+
+bool consoled_is_enabled(void)
+{
+    return pv_shim && pv_console;
 }
=20
 /*
diff --git a/xen/include/xen/consoled.h b/xen/include/xen/consoled.h
index bd7ab6329e..195b9a6c23 100644
--- a/xen/include/xen/consoled.h
+++ b/xen/include/xen/consoled.h
@@ -1,12 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef __XEN_CONSOLED_H__
 #define __XEN_CONSOLED_H__
=20
 #include <public/io/console.h>
=20
+int consoled_guest_tx(char c);
+
+#ifdef CONFIG_PV_SHIM
+
 void consoled_set_ring_addr(struct xencons_interface *ring);
 struct xencons_interface *consoled_get_ring_addr(void);
-void consoled_guest_rx(void);
-void consoled_guest_tx(char c);
+int consoled_guest_rx(void);
+bool consoled_is_enabled(void);
+
+#else
+
+#define consoled_is_enabled()   (false)
+
+#endif /* CONFIG_PV_SHIM */
=20
 #endif /* __XEN_CONSOLED_H__ */
 /*
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 3de5635291..83069de501 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -35,6 +35,8 @@ void getdomaininfo(struct domain *d, struct xen_domctl_ge=
tdomaininfo *info);
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info);
=20
+domid_t get_initial_domain_id(void);
+
 /* CDF_* constant. Internal flags for domain creation. */
 /* Is this a privileged domain? */
 #define CDF_privileged           (1U << 0)
--=20
2.34.1



