Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9164A680C5
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 00:37:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919888.1324249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUJ-0004k4-RX; Tue, 18 Mar 2025 23:36:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919888.1324249; Tue, 18 Mar 2025 23:36:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUJ-0004iR-OM; Tue, 18 Mar 2025 23:36:47 +0000
Received: by outflank-mailman (input) for mailman id 919888;
 Tue, 18 Mar 2025 23:36:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6oY5=WF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tugUI-0004Rg-7r
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 23:36:46 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da0c246c-0451-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 00:36:44 +0100 (CET)
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
X-Inumbo-ID: da0c246c-0451-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742341003; x=1742600203;
	bh=an7oco9t2MW1aPCyVdsDXyaEu4dmL76TiBG8/A0s7xA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=PhDhJTdJEEerElqeuorniNkGGyf08ZNC7jbDQr8SnfQcjhNH9lpaqpmFsXJDsbtag
	 dXj6hrtrbd2FcsGYGGv744CLVokUdWf+PnZ/nkFX/8+TOi7RY2woQxm9wuFehHl2F7
	 gGZiDR9yOPGoNH60k4ciy48CYZ45Vp9NOcZfup/cddMy10v7Ky1wiG0wOoMDbqMrte
	 1YN+KRYA0rWcj/oOUWF6nxInBCw29jeIhQeNyB5lD3149eN5SCO0jV0wkY8muHkz/k
	 xeow6G6x6MKoGCu0xKj+X7xcjPDybcBMYIYosFGnYviRi/wppWOTk06CAd7Fm1e7Vg
	 LPdpu4JyNtceQ==
Date: Tue, 18 Mar 2025 23:36:40 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 3/8] xen/domain: introduce domid_top
Message-ID: <20250318233617.849903-4-dmukhin@ford.com>
In-Reply-To: <20250318233617.849903-1-dmukhin@ford.com>
References: <20250318233617.849903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 68345f0592094b4e9be75b2581fdeb838d44de27
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Rename max_init_domid to domid_top to align with its usage in the code
(Arm), where it represents the upper boundary of the non-system domain
ID range.

Relocate the domid_top declaration to an architecture-independent
location.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/dom0less-build.c      | 4 ++--
 xen/arch/arm/include/asm/setup.h   | 2 --
 xen/arch/arm/setup.c               | 2 --
 xen/arch/ppc/include/asm/setup.h   | 2 --
 xen/arch/riscv/include/asm/setup.h | 2 --
 xen/arch/x86/include/asm/setup.h   | 2 --
 xen/common/domain.c                | 3 +++
 xen/drivers/char/console.c         | 2 +-
 xen/include/xen/domain.h           | 2 ++
 9 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 573b0d25ae..d7d7665c0a 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -981,7 +981,7 @@ void __init create_domUs(void)
         if ( !dt_device_is_compatible(node, "xen,domain") )
             continue;
=20
-        if ( (max_init_domid + 1) >=3D DOMID_FIRST_RESERVED )
+        if ( (domid_top + 1) >=3D DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
=20
         if ( dt_find_property(node, "xen,static-mem", NULL) )
@@ -1112,7 +1112,7 @@ void __init create_domUs(void)
          * very important to use the pre-increment operator to call
          * domain_create() with a domid > 0. (domid =3D=3D 0 is reserved f=
or Dom0)
          */
-        d =3D domain_create(++max_init_domid, &d_cfg, flags);
+        d =3D domain_create(++domid_top, &d_cfg, flags);
         if ( IS_ERR(d) )
             panic("Error creating domain %s (rc =3D %ld)\n",
                   dt_node_name(node), PTR_ERR(d));
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
index ffcae900d7..ab60f0d189 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -60,8 +60,6 @@ struct cpuinfo_arm __read_mostly system_cpuinfo;
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
index 5c2391a868..296348655b 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -69,6 +69,4 @@ extern bool opt_dom0_verbose;
 extern bool opt_dom0_cpuid_faulting;
 extern bool opt_dom0_msr_relaxed;
=20
-#define max_init_domid (0)
-
 #endif
diff --git a/xen/common/domain.c b/xen/common/domain.c
index b9f549c617..dac910d454 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -66,6 +66,9 @@ DEFINE_RCU_READ_LOCK(domlist_read_lock);
 static struct domain *domain_hash[DOMAIN_HASH_SIZE];
 struct domain *domain_list;
=20
+/* Highest known non-system domain ID. */
+domid_t domid_top;
+
 /*
  * Insert a domain into the domlist/hash.  This allows the domain to be lo=
oked
  * up by domid, and therefore to be the subject of hypercalls/etc.
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index d7d9800095..d04a5335ce 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -472,7 +472,7 @@ static void cf_check dump_console_ring_key(unsigned cha=
r key)
  */
 static unsigned int __read_mostly console_rx =3D 0;
=20
-#define max_console_rx (max_init_domid + 1)
+#define max_console_rx (domid_top + 1)
=20
 static struct domain *console_get_domain_by_id(domid_t domid)
 {
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 83069de501..b7425827b8 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -35,6 +35,8 @@ void getdomaininfo(struct domain *d, struct xen_domctl_ge=
tdomaininfo *info);
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info);
=20
+extern domid_t domid_top;
+
 domid_t get_initial_domain_id(void);
=20
 /* CDF_* constant. Internal flags for domain creation. */
--=20
2.34.1



