Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30368AC74D3
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 02:09:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.999635.1380291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKQpz-0002GZ-Aj; Thu, 29 May 2025 00:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 999635.1380291; Thu, 29 May 2025 00:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKQpz-0002E0-6q; Thu, 29 May 2025 00:09:35 +0000
Received: by outflank-mailman (input) for mailman id 999635;
 Thu, 29 May 2025 00:09:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VQJb=YN=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uKQpx-0001jK-No
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 00:09:33 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 320ad958-3c21-11f0-b894-0df219b8e170;
 Thu, 29 May 2025 02:09:32 +0200 (CEST)
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
X-Inumbo-ID: 320ad958-3c21-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1748477371; x=1748736571;
	bh=0skLNgJFjNJh5aiOVY4PUtt+98l4mBcX8VEDioGrAkY=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=kW0Y1HwSg4EyuYdrjhcKmBHgshW3wy/8GGay0okocuyMibHC9TFAT/knQlLP3pRpD
	 SlUux3jcm4I6C7Fz2QEKQdmsdncMmjA/VdB/XeQLngixhc/quEQ49fRVaMK9wAw1Wa
	 va9tKl8FpdddygOoW/2uYEZuagVYWtiiPKKB3ca56Vue15xn9AUmyZrvyrWTAajFdW
	 5ofIqtNv9C5++wM1C1IuWH+sUuTx6WX8q6ivJ01/16FOFFMibt6EdPOave3i2vLqWv
	 w9EoiD0fFZ/lUjZQm5gVxuigcQLjOPDNAgVynvYP4SJHcIDSXd+S7IP97Vh7+KPVlO
	 wGHbU9QcV77gQ==
Date: Thu, 29 May 2025 00:09:25 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com, Denis Mukhin <dmkhn@proton.me>
Subject: [PATCH v4 3/4] xen/console: remove max_init_domid dependency
Message-ID: <20250529000848.2675903-4-dmukhin@ford.com>
In-Reply-To: <20250529000848.2675903-1-dmukhin@ford.com>
References: <20250529000848.2675903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 1405eefedef24d684aff73550bf670c2c67bffbe
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmkhn@proton.me>

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
Changes since v3:
- switched to RCU lock in domid_find_with_input_allowed()
---
 xen/arch/arm/include/asm/setup.h        |  2 -
 xen/arch/arm/setup.c                    |  2 -
 xen/arch/ppc/include/asm/setup.h        |  2 -
 xen/arch/riscv/include/asm/setup.h      |  2 -
 xen/arch/x86/include/asm/setup.h        |  2 -
 xen/common/device-tree/dom0less-build.c |  2 -
 xen/common/domain.c                     | 29 ++++++++
 xen/drivers/char/console.c              | 90 +++++++++----------------
 xen/include/xen/domain.h                |  1 +
 9 files changed, 61 insertions(+), 71 deletions(-)

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
index 9a6015f4ce..703f20faed 100644
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
index 9bc66d80c4..704e0907e9 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2463,6 +2463,35 @@ void domid_free(domid_t domid)
     spin_unlock(&domid_lock);
 }
=20
+/*
+ * Find the ID of the next possible console owner domain.
+ *
+ * @return Domain ID: DOMID_XEN or non-system domain IDs within
+ * the range of [0..DOMID_FIRST_RESERVED-1].
+ */
+domid_t domid_find_with_input_allowed(domid_t hint)
+{
+    const struct domain *d;
+    domid_t domid =3D DOMID_XEN;
+
+    rcu_read_lock(&domlist_read_lock);
+
+    for ( d =3D rcu_dereference(domain_list);
+          d && d->domain_id < DOMID_FIRST_RESERVED;
+          d =3D rcu_dereference(d->next_in_list) )
+    {
+        if ( d->console.input_allowed )
+        {
+            domid =3D d->domain_id;
+            break;
+        }
+    }
+
+    rcu_read_unlock(&domlist_read_lock);
+
+    return domid;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 8a0bcff78f..37289d5558 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -498,26 +498,17 @@ static void cf_check conring_dump_keyhandler(unsigned=
 char key)
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
 struct domain *console_get_domain(void)
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
@@ -535,43 +526,14 @@ void console_put_domain(struct domain *d)
         rcu_unlock_domain(d);
 }
=20
-static void console_switch_input(void)
+static void console_set_domid(domid_t domid)
 {
-    unsigned int next_rx =3D console_rx;
+    if ( domid =3D=3D DOMID_XEN )
+        printk("*** Serial input to Xen");
+    else
+        printk("*** Serial input to DOM%u", domid);
=20
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
@@ -579,12 +541,30 @@ static void console_switch_input(void)
     printk("\n");
 }
=20
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
@@ -1169,14 +1149,6 @@ void __init console_endboot(void)
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
     register_keyhandler('w', conring_dump_keyhandler,
                         "synchronously dump console ring buffer (dmesg)", =
0);
     register_irq_keyhandler('+', &do_inc_thresh,
@@ -1186,8 +1158,8 @@ void __init console_endboot(void)
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



