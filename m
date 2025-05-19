Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68468ABC830
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 22:12:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990259.1374244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6qz-0002vD-PZ; Mon, 19 May 2025 20:12:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990259.1374244; Mon, 19 May 2025 20:12:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6qz-0002rd-MK; Mon, 19 May 2025 20:12:53 +0000
Received: by outflank-mailman (input) for mailman id 990259;
 Mon, 19 May 2025 20:12:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH6qy-0001j7-8P
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 20:12:52 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4149330-34ed-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 22:12:51 +0200 (CEST)
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
X-Inumbo-ID: a4149330-34ed-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=fdjbcg6bnra53gjokga2qhgkuq.protonmail; t=1747685570; x=1747944770;
	bh=qN2U2dQLJL1JMOGF37S4KVhD6fSMTiYi58zkKDBG0FE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=mtVNnA0xWj8ZGXrtJXc/ZqmpBP58/kvlFljZRKgjbIFaK6dmawqP41Hqh5DSPnsPl
	 dqLAGtG8qnopmxqx7SLs6HCP48uDfm5XHUrfVsyBbQjIwQgn4YyOl75TrfloOYBdNG
	 6fyKcjuVkY+GDVHs0QT50m1YR/7JfBHyvl5qBpmm0Rn5Di8W/h9OFRYvhAQvByrDqP
	 6+FT1mslY+ueMAUqI7dGYgseuGjRYJZ9ujMoxeScYgLdiEaf7Gax81P68Ep2iBDDgb
	 yTlJfHTio4XVVdFmXAcRc2dTPvURfwPuCi6FfzcL7EBZiV9UbtzNDmI5G4GwNqo7fI
	 YtEdHgWnDl91w==
Date: Mon, 19 May 2025 20:12:47 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 4/5] xen/console: remove max_init_domid dependency
Message-ID: <20250519201211.1366244-5-dmukhin@ford.com>
In-Reply-To: <20250519201211.1366244-1-dmukhin@ford.com>
References: <20250519201211.1366244-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 5910fde02699c1e1b7d6683d14e5de31da8b9449
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

The physical console input rotation depends on max_init_domid symbol, which=
 is
managed differently across architectures.

Instead of trying to manage max_init_domid in the arch-common code the cons=
ole
input rotation code can be reworked by removing dependency on max_init_domi=
d
entirely.

To do that, introduce domid_find_with_input_allowed() in arch-independent
location to find the ID of the next possible console owner domain. The IDs
are rotated across non-system domain IDs and DOMID_XEN.

Also, introduce helper console_set_domid() for updating identifier of the
current console input owner (points to Xen or domain).

Use domid_find_with_input_allowed() and console_set_domid() in
console_switch_input().

Remove uses of max_init_domid in the code.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- reworked to traversing domain list directly
- Link to v2: https://lore.kernel.org/xen-devel/20250331230508.440198-7-dmu=
khin@ford.com/
---
 xen/arch/arm/include/asm/setup.h        |   2 -
 xen/arch/arm/setup.c                    |   2 -
 xen/arch/ppc/include/asm/setup.h        |   2 -
 xen/arch/riscv/include/asm/setup.h      |   2 -
 xen/arch/x86/include/asm/setup.h        |   2 -
 xen/common/device-tree/dom0less-build.c |   2 -
 xen/common/domain.c                     |  29 +++++++
 xen/drivers/char/console.c              | 102 +++++++++---------------
 xen/include/xen/domain.h                |   1 +
 9 files changed, 66 insertions(+), 78 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/se=
tup.h
index 6cf272c160..f107e8eebb 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -25,8 +25,6 @@ struct map_range_data
     struct rangeset *irq_ranges;
 };
=20
-extern domid_t max_init_domid;
-
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
=20
 size_t estimate_efi_size(unsigned int mem_nr_banks);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 10b46d0684..53e2f8b537 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -61,8 +61,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
 bool __read_mostly acpi_disabled;
 #endif
=20
-domid_t __read_mostly max_init_domid;
-
 static __used void init_done(void)
 {
     int rc;
diff --git a/xen/arch/ppc/include/asm/setup.h b/xen/arch/ppc/include/asm/se=
tup.h
index e4f64879b6..956fa6985a 100644
--- a/xen/arch/ppc/include/asm/setup.h
+++ b/xen/arch/ppc/include/asm/setup.h
@@ -1,6 +1,4 @@
 #ifndef __ASM_PPC_SETUP_H__
 #define __ASM_PPC_SETUP_H__
=20
-#define max_init_domid (0)
-
 #endif /* __ASM_PPC_SETUP_H__ */
diff --git a/xen/arch/riscv/include/asm/setup.h b/xen/arch/riscv/include/as=
m/setup.h
index c9d69cdf51..d1fc64b673 100644
--- a/xen/arch/riscv/include/asm/setup.h
+++ b/xen/arch/riscv/include/asm/setup.h
@@ -5,8 +5,6 @@
=20
 #include <xen/types.h>
=20
-#define max_init_domid (0)
-
 void setup_mm(void);
=20
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/se=
tup.h
index ac34c69855..b67de8577f 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -69,6 +69,4 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
=20
-#define max_init_domid (0)
-
 #endif
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tr=
ee/dom0less-build.c
index 8e38affd0c..4c050b9ded 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -977,8 +977,6 @@ void __init create_domUs(void)
         domid =3D domid_alloc(DOMID_INVALID);
         if ( domid =3D=3D DOMID_INVALID )
             panic("Error allocating ID for domain %s\n", dt_node_name(node=
));
-        if ( max_init_domid < domid )
-            max_init_domid =3D domid;
=20
         d =3D domain_create(domid, &d_cfg, flags);
         if ( IS_ERR(d) )
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6a6cdd991b..90bd42b633 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2460,6 +2460,35 @@ void domid_free(domid_t domid)
     spin_unlock(&domid_lock);
 }
=20
+/*
+ * Find the ID of the next possible console owner domain.
+ *
+ * @return Domain ID: DOMID_XEN or non-system domain IDs within
+ * the range of [0..CONFIG_MAX_DOMID-1].
+ */
+domid_t domid_find_with_input_allowed(domid_t hint)
+{
+    struct domain *d;
+    domid_t domid =3D DOMID_XEN;
+
+    spin_lock(&domlist_update_lock);
+
+    for ( d =3D domid_to_domain(hint);
+          d && likely(get_domain(d)) && (d->domain_id < CONFIG_MAX_DOMID);
+          d =3D d->next_in_list )
+    {
+        if ( d->console.input_allowed )
+        {
+            domid =3D d->domain_id;
+            break;
+        }
+    }
+
+    spin_unlock(&domlist_update_lock);
+
+    return domid;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ccecda6523..ff20706ac9 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -462,26 +462,17 @@ static void cf_check dump_console_ring_key(unsigned c=
har key)
=20
 /*
  * CTRL-<switch_char> changes input direction, rotating among Xen, Dom0,
- * and the DomUs started from Xen at boot.
+ * and the DomUs.
  */
 #define switch_code (opt_conswitch[0]-'a'+1)
-/*
- * console_rx=3D0 =3D> input to xen
- * console_rx=3D1 =3D> input to dom0 (or the sole shim domain)
- * console_rx=3DN =3D> input to dom(N-1)
- */
-static unsigned int __read_mostly console_rx =3D 0;
=20
-#define max_console_rx (max_init_domid + 1)
+/* Console owner domain identifier. */
+static domid_t __read_mostly console_rx =3D DOMID_XEN;
=20
 static struct domain *console_get_domain(void)
 {
-    struct domain *d;
+    struct domain *d =3D rcu_lock_domain_by_id(console_rx);
=20
-    if ( console_rx =3D=3D 0 )
-            return NULL;
-
-    d =3D rcu_lock_domain_by_id(console_rx - 1);
     if ( !d )
         return NULL;
=20
@@ -499,50 +490,14 @@ static void console_put_domain(struct domain *d)
         rcu_unlock_domain(d);
 }
=20
-domid_t console_get_domid(void)
+static void console_set_domid(domid_t domid)
 {
-    if ( console_rx =3D=3D 0 )
-        return DOMID_XEN;
-    return console_rx - 1;
-}
+    if ( domid =3D=3D DOMID_XEN )
+        printk("*** Serial input to Xen");
+    else
+        printk("*** Serial input to DOM%u", domid);
=20
-static void console_switch_input(void)
-{
-    unsigned int next_rx =3D console_rx;
-
-    /*
-     * Rotate among Xen, dom0 and boot-time created domUs while skipping
-     * switching serial input to non existing domains.
-     */
-    for ( ; ; )
-    {
-        domid_t domid;
-        struct domain *d;
-
-        if ( next_rx++ >=3D max_console_rx )
-        {
-            console_rx =3D 0;
-            printk("*** Serial input to Xen");
-            break;
-        }
-
-        if ( consoled_is_enabled() && next_rx =3D=3D 1 )
-            domid =3D get_initial_domain_id();
-        else
-            domid =3D next_rx - 1;
-        d =3D rcu_lock_domain_by_id(domid);
-        if ( d )
-        {
-            rcu_unlock_domain(d);
-
-            if ( !d->console.input_allowed )
-                break;
-
-            console_rx =3D next_rx;
-            printk("*** Serial input to DOM%u", domid);
-            break;
-        }
-    }
+    console_rx =3D domid;
=20
     if ( switch_code )
         printk(" (type 'CTRL-%c' three times to switch input)",
@@ -550,12 +505,35 @@ static void console_switch_input(void)
     printk("\n");
 }
=20
+domid_t console_get_domid(void)
+{
+    return console_rx;
+}
+
+/*
+ * Switch console focus.
+ * Rotates input focus among Xen and domains with console input permission=
.
+ */
+static void console_switch_input(void)
+{
+    domid_t hint;
+
+    if ( console_rx =3D=3D DOMID_XEN )
+        hint =3D get_initial_domain_id();
+    else
+        hint =3D console_rx + 1;
+
+    hint =3D domid_find_with_input_allowed(hint);
+
+    console_set_domid(hint);
+}
+
 static void __serial_rx(char c)
 {
     struct domain *d;
     int rc =3D 0;
=20
-    if ( console_rx =3D=3D 0 )
+    if ( console_rx =3D=3D DOMID_XEN )
         return handle_keypress(c, false);
=20
     d =3D console_get_domain();
@@ -1130,14 +1108,6 @@ void __init console_endboot(void)
=20
     video_endboot();
=20
-    /*
-     * If user specifies so, we fool the switch routine to redirect input
-     * straight back to Xen. I use this convoluted method so we still prin=
t
-     * a useful 'how to switch' message.
-     */
-    if ( opt_conswitch[1] =3D=3D 'x' )
-        console_rx =3D max_console_rx;
-
     register_keyhandler('w', dump_console_ring_key,
                         "synchronously dump console ring buffer (dmesg)", =
0);
     register_irq_keyhandler('+', &do_inc_thresh,
@@ -1147,8 +1117,8 @@ void __init console_endboot(void)
     register_irq_keyhandler('G', &do_toggle_guest,
                             "toggle host/guest log level adjustment", 0);
=20
-    /* Serial input is directed to DOM0 by default. */
-    console_switch_input();
+    if ( opt_conswitch[1] !=3D 'x' )
+        (void)console_set_domid(get_initial_domain_id());
 }
=20
 int __init console_has(const char *device)
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 8aab05ae93..a88eb34f3f 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -36,6 +36,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_ge=
tdomaininfo *info);
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info);
=20
+domid_t domid_find_with_input_allowed(domid_t hint);
 domid_t get_initial_domain_id(void);
=20
 domid_t domid_alloc(domid_t domid);
--=20
2.34.1



