Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73CBBA77141
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 01:06:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933118.1335169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOCT-00048y-Bo; Mon, 31 Mar 2025 23:05:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933118.1335169; Mon, 31 Mar 2025 23:05:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOCT-00047S-6e; Mon, 31 Mar 2025 23:05:49 +0000
Received: by outflank-mailman (input) for mailman id 933118;
 Mon, 31 Mar 2025 23:05:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MI1n=WS=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzOCR-00041G-N6
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 23:05:47 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae1519ff-0e84-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 01:05:47 +0200 (CEST)
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
X-Inumbo-ID: ae1519ff-0e84-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=qqcmz64trjcffpymyxvqi372ju.protonmail; t=1743462346; x=1743721546;
	bh=4TUVPVTtCJK3dKtje9YIdGrxMpCfMsMEMufsQMdkvLM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=c1aGoYaMkjjaSPKhN1zoD2OBXJOrZ7tr77WobI/YN7NcZt7ebUpcyEmWXZc709qje
	 ev/D23rGNyzj94Sklkh/HMC1Tr1KN+8CkxGH8T783GOHtOsw91ovPV1CqUyDxDGU4G
	 04EyfLAaPFipJx3EK+2mivsuCvw4J24o62R1PnOi+RZUNYoF1w8pLyxkPbb1fi85g3
	 SydS1kKz7gO4WvnsMNkhRsv4leNqizwQ8/C6IRR1bWroFWP1nh/UB+zAIeTjAfh3Es
	 ApbkZeVjzhIM4qfX0opPBVIK8eqLx+z1D8ZyDaDvAiVcKOlATtbxpGCRDEvwECkvR/
	 ta8EzW7yOQNOg==
Date: Mon, 31 Mar 2025 23:05:39 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 3/7] xen/domain: introduce domid_top()
Message-ID: <20250331230508.440198-4-dmukhin@ford.com>
In-Reply-To: <20250331230508.440198-1-dmukhin@ford.com>
References: <20250331230508.440198-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: e8cabdd52b024f1f8877b00cfc5c255bdba045e5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Introduce domid_top() in architecture-independent location to retrieve
the highest non-system domain ID for use in console input switch logic.

Replace max_init_domid with domid_top(), which obsoletes max_init_domid
in the code base.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- promote domid_top to a function which walks through the list of domains
  to identify the highest non-system domain ID which should be considered
  for console input rotation
- elimitate use of max_init_domid
---
 xen/arch/arm/include/asm/setup.h   |  2 --
 xen/arch/arm/setup.c               |  2 --
 xen/arch/ppc/include/asm/setup.h   |  2 --
 xen/arch/riscv/include/asm/setup.h |  2 --
 xen/arch/x86/include/asm/setup.h   |  2 --
 xen/common/domain.c                | 23 +++++++++++++++++++++++
 xen/drivers/char/console.c         |  2 +-
 xen/include/xen/domain.h           |  1 +
 8 files changed, 25 insertions(+), 11 deletions(-)

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
index bf39d41e9b..143808f592 100644
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
index b07d70a7e3..8e8e784b46 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -111,6 +111,29 @@ int domid_alloc(int hint)
     return domid;
 }
=20
+/*
+ * Retrieve the highest known non-system domain ID.
+ */
+domid_t domid_top(void)
+{
+    struct domain *d;
+    domid_t i =3D 0;
+
+    spin_lock(&domlist_update_lock);
+
+    for ( d =3D domain_list;
+          d && (d->domain_id < DOMID_FIRST_RESERVED);
+          d =3D d->next_in_list )
+    {
+        if ( i < d->domain_id )
+            i =3D d->domain_id;
+    }
+
+    spin_unlock(&domlist_update_lock);
+
+    return i;
+}
+
 /*
  * Insert a domain into the domlist/hash.  This allows the domain to be lo=
oked
  * up by domid, and therefore to be the subject of hypercalls/etc.
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index b312a1223e..54163e93fb 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -472,7 +472,7 @@ static void cf_check dump_console_ring_key(unsigned cha=
r key)
  */
 static unsigned int __read_mostly console_rx =3D 0;
=20
-#define max_console_rx (max_init_domid + 1)
+#define max_console_rx (domid_top() + 1)
=20
 static struct domain *console_get_domain_by_id(domid_t domid)
 {
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 9b7159a743..c3dda8edf2 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -35,6 +35,7 @@ void getdomaininfo(struct domain *d, struct xen_domctl_ge=
tdomaininfo *info);
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info);
=20
+domid_t domid_top(void);
 domid_t get_initial_domain_id(void);
=20
 #define DOMID_AUTO               (-1)
--=20
2.34.1



