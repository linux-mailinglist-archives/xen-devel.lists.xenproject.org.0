Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5C04BE7ED
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 19:04:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.276396.472540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMD2q-0008Es-Ll; Mon, 21 Feb 2022 18:04:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 276396.472540; Mon, 21 Feb 2022 18:04:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nMD2q-0008CC-I2; Mon, 21 Feb 2022 18:04:20 +0000
Received: by outflank-mailman (input) for mailman id 276396;
 Mon, 21 Feb 2022 18:04:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fvXl=TE=citrix.com=prvs=044a77a3b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nMD2o-0008C6-HU
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 18:04:18 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id adf9a819-9340-11ec-8eb8-a37418f5ba1a;
 Mon, 21 Feb 2022 19:04:16 +0100 (CET)
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
X-Inumbo-ID: adf9a819-9340-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645466656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YlOjXF4k7rFwUbvZj0TZsWgDLG6n+/ToUDcdMAAvYXQ=;
  b=U5rBPfvYxzTI0Sq6p+Dq7s9Q0VLT+lG9dJIDeI1rIbicLHmbyQ9C4bhh
   Y83d8A9CmO8+lFOr8FzckMv2mEmNyeQTqbLrte6TjGUvW63zGwVPw4i+R
   Yo4mqgB+tEBhEXoQ60fTL6QM6zXhMBqyfrismrJ2OEHIzsAo7Fldfu6P3
   c=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 65071859
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:2sxRRKpEiiX/fMIumeWqTI496TReBmJpZRIvgKrLsJaIsI4StFCzt
 garIBmHOqyCNDD9KttxYNzj8U1Su5XXzYRnSgtlqyFnES9EopuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8ly75RbrJA24DjWVvX4
 4qq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBBqHQpKcHdARkDB50H6ZU1+PfGEKBrpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI5DfVF/s5B7vERL3H/4Rw1zYsnMFeW/3ZY
 qL1bBIxMUyfOk0Saz/7Droure2loSnVfAdq8nXKiZpw3zPS8CtIhe2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34Riv/2+oh+TPtTjmQ49UH7q9ntZ6jVvWymENBRk+UVqgveL/mkO4Q8hYK
 UEf5mwpt6dayaCwZoCjBVvi+ifC50NCHYoLewEn1O2T4pLY/zraHE8ZciF+Yv4tpuBqXQUQ6
 EDcyrsFGgdTmLGSTHuc8JKdojWzJTUZIAc+WMMUcecWy4K9+d9u13ojWv4mSffo1YOtRVkc1
 hjX9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocdzxorqp5
 iFsdy2iAAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRk1b51UJW60M
 RKJ6Gu9AaO/21PwMMdKj3+ZUZx2ncAM6/y+PhwrUja+SscoL1LWlM2fTUWRw3rsgCARfVIXY
 v+mnTKXJS9CU8xPlWPuL89EiOND7n1ulAv7GMGgpzz6gOX2WZJgYepcWLd4Rrtit/3sTcS82
 4s3CvZmPD0FDrWlO3GPqdR7wJJjBSFTOK0aYvd/LoarSjeK0kl4YxMN6dvNo7BYopk=
IronPort-HdrOrdr: A9a23:BwQZvK/aURGiZN8vzHluk+DcI+orL9Y04lQ7vn2ZLiYlFfBw9v
 re+MjzsCWetN9/Yh0dcLy7V5VoIkm9yXcW2+cs1N6ZNWGN1VdAR7sC0aLShxHmBi3i5qp8+M
 5bAs1D4QTLfDtHZBDBkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.88,386,1635220800"; 
   d="scan'208";a="65071859"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2.1 8/7] x86/IOMMU: Use altcall, and __initconst_cf_clobber
Date: Mon, 21 Feb 2022 18:03:56 +0000
Message-ID: <20220221180356.13527-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125632.24563-1-andrew.cooper3@citrix.com>
References: <20220214125632.24563-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Most IOMMU hooks are already altcall for performance reasons.  Convert the
rest of them so we can harden all the hooks in Control Flow Integrity
configurations.  This necessitates the use of iommu_{v,}call() in debug builds
too.

Move the root iommu_ops from __read_mostly to __ro_after_init now that the
latter exists.  There is no need for a forward declaration of vtd_ops any
more, meaning that __initconst_cf_clobber can be used for VTD and AMD.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/include/asm/iommu.h            | 6 ++----
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 2 +-
 xen/drivers/passthrough/iommu.c             | 7 ++++---
 xen/drivers/passthrough/vtd/iommu.c         | 3 +--
 xen/drivers/passthrough/x86/iommu.c         | 4 ++--
 5 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 8a96ba1f097f..a87f6d416252 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -72,7 +72,6 @@ struct arch_iommu
 
 extern struct iommu_ops iommu_ops;
 
-#ifdef NDEBUG
 # include <asm/alternative.h>
 # define iommu_call(ops, fn, args...) ({      \
     (void)(ops);                              \
@@ -83,7 +82,6 @@ extern struct iommu_ops iommu_ops;
     (void)(ops);                              \
     alternative_vcall(iommu_ops.fn, ## args); \
 })
-#endif
 
 static inline const struct iommu_ops *iommu_get_ops(void)
 {
@@ -106,7 +104,7 @@ int iommu_setup_hpet_msi(struct msi_desc *);
 static inline int iommu_adjust_irq_affinities(void)
 {
     return iommu_ops.adjust_irq_affinities
-           ? iommu_ops.adjust_irq_affinities()
+           ? iommu_call(iommu_ops, adjust_irq_affinities)
            : 0;
 }
 
@@ -122,7 +120,7 @@ int iommu_enable_x2apic(void);
 static inline void iommu_disable_x2apic(void)
 {
     if ( x2apic_enabled && iommu_ops.disable_x2apic )
-        iommu_ops.disable_x2apic();
+        iommu_vcall(iommu_ops, disable_x2apic);
 }
 
 int iommu_identity_mapping(struct domain *d, p2m_access_t p2ma,
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index e57f555d00d1..4b59a4efe9b6 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -628,7 +628,7 @@ static void cf_check amd_dump_page_tables(struct domain *d)
                               hd->arch.amd.paging_mode, 0, 0);
 }
 
-static const struct iommu_ops __initconstrel _iommu_ops = {
+static const struct iommu_ops __initconst_cf_clobber _iommu_ops = {
     .init = amd_iommu_domain_init,
     .hwdom_init = amd_iommu_hwdom_init,
     .quarantine_init = amd_iommu_quarantine_init,
diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index e220fea72c2f..c6b2c384d1dd 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -540,7 +540,7 @@ int __init iommu_setup(void)
 int iommu_suspend()
 {
     if ( iommu_enabled )
-        return iommu_get_ops()->suspend();
+        return iommu_call(iommu_get_ops(), suspend);
 
     return 0;
 }
@@ -548,7 +548,7 @@ int iommu_suspend()
 void iommu_resume()
 {
     if ( iommu_enabled )
-        iommu_get_ops()->resume();
+        iommu_vcall(iommu_get_ops(), resume);
 }
 
 int iommu_do_domctl(
@@ -578,7 +578,8 @@ void iommu_crash_shutdown(void)
         return;
 
     if ( iommu_enabled )
-        iommu_get_ops()->crash_shutdown();
+        iommu_vcall(iommu_get_ops(), crash_shutdown);
+
     iommu_enabled = false;
 #ifndef iommu_intremap
     iommu_intremap = iommu_intremap_off;
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 56968a06a100..6a65ba1d8271 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -56,7 +56,6 @@ bool __read_mostly iommu_snoop = true;
 
 static unsigned int __read_mostly nr_iommus;
 
-static struct iommu_ops vtd_ops;
 static struct tasklet vtd_fault_tasklet;
 
 static int cf_check setup_hwdom_device(u8 devfn, struct pci_dev *);
@@ -2794,7 +2793,7 @@ static int __init cf_check intel_iommu_quarantine_init(struct domain *d)
     return rc;
 }
 
-static struct iommu_ops __initdata vtd_ops = {
+static const struct iommu_ops __initconst_cf_clobber vtd_ops = {
     .init = intel_iommu_domain_init,
     .hwdom_init = intel_iommu_hwdom_init,
     .quarantine_init = intel_iommu_quarantine_init,
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index ad5f44e13d98..17c0fe555dd0 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -27,7 +27,7 @@
 #include <asm/setup.h>
 
 const struct iommu_init_ops *__initdata iommu_init_ops;
-struct iommu_ops __read_mostly iommu_ops;
+struct iommu_ops __ro_after_init iommu_ops;
 bool __read_mostly iommu_non_coherent;
 
 enum iommu_intremap __read_mostly iommu_intremap = iommu_intremap_full;
@@ -129,7 +129,7 @@ int iommu_enable_x2apic(void)
     if ( !iommu_ops.enable_x2apic )
         return -EOPNOTSUPP;
 
-    return iommu_ops.enable_x2apic();
+    return iommu_call(iommu_ops, enable_x2apic);
 }
 
 void iommu_update_ire_from_apic(
-- 
2.11.0


