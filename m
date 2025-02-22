Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAEFA40C40
	for <lists+xen-devel@lfdr.de>; Sun, 23 Feb 2025 00:59:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.894793.1303489 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlzNz-0000Mn-J9; Sat, 22 Feb 2025 23:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 894793.1303489; Sat, 22 Feb 2025 23:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tlzNz-0000LK-D4; Sat, 22 Feb 2025 23:58:19 +0000
Received: by outflank-mailman (input) for mailman id 894793;
 Sat, 22 Feb 2025 23:58:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V16X=VN=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tlzNx-0000LC-AV
 for xen-devel@lists.xenproject.org; Sat, 22 Feb 2025 23:58:18 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0f5deab-f178-11ef-9aac-95dc52dad729;
 Sun, 23 Feb 2025 00:58:15 +0100 (CET)
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
X-Inumbo-ID: e0f5deab-f178-11ef-9aac-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1740268693; x=1740527893;
	bh=+kREKKG8GzR0/fSufTpSsjm7kxCDjYWiI5NiwwmejpQ=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=iyGTB+52s4n/pI6BDaWJEU08EPi9lRWvnILFzkEBHdfjD85O1N1XBpLDA/BJrqivZ
	 5DYGHw/4sqZNCWV0di6m+AoVnUqxM1FKIiICrRhTqWqdcRVcykJ7l1S7LDL3ZiIftc
	 JxS2yKyBocBgViEyIo0hrXmRmANsPuNQJlH+1WCgsad3UnpHoN0zkIZ3LKmrYUwniw
	 4L9AgCEFz1vO96nAeOCIo0qCFaPXvyUb2d9ZMZA0Tj83ZC5SRiaeRV38HDlN3jGBs4
	 mgEP4Dn/pCN2tiJRedfFQnTFtlSav/meOHSD2PnmQ2qehKKl7mhcr07oYrGeDwI/SH
	 iqzRwDQNU9bnQ==
Date: Sat, 22 Feb 2025 23:58:06 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2] xen/consoled: clean up console handling for PV shim
Message-ID: <20250222235748.103599-1-dmkhn@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 76b39d0db86fa7e1839e7436a0b8905b841dc96d
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

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- Added arch-independent get_initial_domain_id() needed to process PV shim =
in
  console driver.
- Link to CI: https://gitlab.com/xen-project/people/dmukhin/xen/-/pipelines=
/1684147617
---
 xen/arch/x86/include/asm/pv/shim.h |  5 +++--
 xen/arch/x86/pv/shim.c             |  8 ++------
 xen/common/domain.c                | 10 ++++++++++
 xen/drivers/char/console.c         | 15 ++++++--------
 xen/drivers/char/consoled.c        | 17 ++++++++++++----
 xen/include/xen/consoled.h         | 32 +++++++++++++++++++++++++-----
 xen/include/xen/domain.h           |  2 ++
 7 files changed, 63 insertions(+), 26 deletions(-)

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
index b9c034ccff..62b6a92392 100644
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -605,8 +605,7 @@ long pv_shim_event_channel_op(int cmd, XEN_GUEST_HANDLE=
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
@@ -1018,13 +1017,10 @@ void pv_shim_offline_memory(unsigned int nr, unsign=
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
index 49d4cb8221..f272dc1892 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -46,6 +46,7 @@
=20
 #ifdef CONFIG_X86
 #include <asm/guest.h>
+#include <asm/pv/shim.h>
 #endif
=20
 /* Linux config option: propageted to domain0 */
@@ -2261,6 +2262,15 @@ int continue_hypercall_on_cpu(
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
index 992b37962e..c207fd8704 100644
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
@@ -562,13 +560,12 @@ static void __serial_rx(char c)
         rc =3D vpl011_rx_char_xen(d, c);
 #endif
=20
-#ifdef CONFIG_X86
-    if ( pv_shim && pv_console )
-        consoled_guest_tx(c);
-#endif
+    if ( consoled_is_enabled() )
+        /* Deliver input to the PV shim console. */
+        rc =3D consoled_guest_tx(c);
=20
     if ( rc )
-        guest_printk(d, XENLOG_G_WARNING
+        guest_printk(d, XENLOG_WARNING
                         "failed to process console input: %d\n", rc);
=20
     console_put_domain(d);
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
index bd7ab6329e..52a1358bea 100644
--- a/xen/include/xen/consoled.h
+++ b/xen/include/xen/consoled.h
@@ -1,14 +1,36 @@
-#ifndef __XEN_CONSOLED_H__
-#define __XEN_CONSOLED_H__
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef XEN__CONSOLED_H
+#define XEN__CONSOLED_H
=20
 #include <public/io/console.h>
=20
+#ifdef CONFIG_PV_SHIM
+
 void consoled_set_ring_addr(struct xencons_interface *ring);
 struct xencons_interface *consoled_get_ring_addr(void);
-void consoled_guest_rx(void);
-void consoled_guest_tx(char c);
+int consoled_guest_rx(void);
+int consoled_guest_tx(char c);
+bool consoled_is_enabled(void);
=20
-#endif /* __XEN_CONSOLED_H__ */
+#else
+
+static inline int consoled_guest_rx(void)
+{
+    ASSERT_UNREACHABLE();
+    return -ENODEV;
+}
+
+static inline int consoled_guest_tx(char c)
+{
+    ASSERT_UNREACHABLE();
+    return -ENODEV;
+}
+
+#define consoled_is_enabled()   (false)
+
+#endif /* CONFIG_PV_SHIM */
+
+#endif /* XEN__CONSOLED_H */
 /*
  * Local variables:
  * mode: C
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



