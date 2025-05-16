Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4FAAB9A38
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:32:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986877.1372411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsMc-0006ay-Op; Fri, 16 May 2025 10:32:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986877.1372411; Fri, 16 May 2025 10:32:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsMc-0006YA-Lh; Fri, 16 May 2025 10:32:26 +0000
Received: by outflank-mailman (input) for mailman id 986877;
 Fri, 16 May 2025 10:32:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jSjr=YA=bounce.vates.tech=bounce-md_30504962.6827125e.v1-63c856eaabcc465290ad4b5fa1439d25@srs-se1.protection.inumbo.net>)
 id 1uFsEz-0000kS-6p
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:24:33 +0000
Received: from mail187-4.suw11.mandrillapp.com
 (mail187-4.suw11.mandrillapp.com [198.2.187.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f40480ea-323f-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 12:24:31 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-4.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4ZzNVQ3Hf8zlff4H
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 10:24:30 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 63c856eaabcc465290ad4b5fa1439d25; Fri, 16 May 2025 10:24:30 +0000
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
X-Inumbo-ID: f40480ea-323f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747391070; x=1747661070;
	bh=lO1eWJXehJrWu+Ma1mFaorTOrllIBJiV30YAtkWYzO4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=ZoW1a4JDDudBZTiatl4lj4LA/6RPEvoUgWr8CxUyxau7862zRdHQXrN1A6WHnsed9
	 n6Y+EhqNMTGmrlhft7tououRA1/fh3eyhmk2fWniSGUkG49F/2xx4fZFTXOjOhAVaI
	 MsE3DxVV0QMPhK2Nmb4gbIA6xnLaGLrQV5wKXj1DNG3Q/hGF7EVLGeO5+mhbUFeaTI
	 ylcKyg+vouPA+AMxMDyfJiHA/uGc4Ts21sC1SaPpv6XeHvYRF6gwh9uqBWCNrE/hT6
	 RSQWDOTTMGDzqlCSG/Lo7zEXIhqA4j+GYLpSaQIiMQ9Y7AHGdf+hEv5OtaoEOd1KWY
	 8LP8HKE7Wd9Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747391070; x=1747651570; i=teddy.astie@vates.tech;
	bh=lO1eWJXehJrWu+Ma1mFaorTOrllIBJiV30YAtkWYzO4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GpjepVawJ1WbcosrlqMdqjwmmotYz8QZaE9vyGpm9yi7wRxoRKeiTywBfb5BPc7eo
	 tciAA2H0KON5Wssbm4rzYlNDMbxx2H7yNrQVZE/sbKpx4LHCgGEptWtWByq32N8WwD
	 SXP1N3puRGAuIuqPSNPHJ/qMOiV89DI9WwW3VEHoGcD117ubHwXbMgN+NjpagEPuEn
	 e/c3R+WbrWTSrZ76K/xmOFRxD3eqk/6JR2GmRB2Svjsiyo+tP0Zft9+L6h/F+cN2at
	 6egWnDrm86p1VFZUcDPedQEzQVSZz/xVy2bPMVrMYHkAM9ySnaezp4gkzz2M/T/0Wg
	 EgJZNLUkFTMvg==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2013/16]=20x86/coco:=20Introduce=20AMD-SEV=20support?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747391069679
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Andrei Semenov" <andrei.semenov@vates.tech>
Message-Id: <0326909f629fd5b2dee9f17d9a566a79953bdd85.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.63c856eaabcc465290ad4b5fa1439d25?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 10:24:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

From: Andrei Semenov <andrei.semenov@vates.tech>

AMD-SEV is AMD implementation for confidential computing.

This patch introduces SEV initialization and HVM enablement logic.

Signed-off-by: Andrei Semenov <andrei.semenov@vates.tech>
Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
Some possible improvement would be to slightly change the ASID allocation
logic under SEV : 

With SEV support and usable :
 - non-SEV guest : Use ASID > NumSevGuests if possible
 - SEV guest : Use ASID in SEV range

Such as we don't waste SEV-supported ASIDs.

This currently lacks DF_FLUSH support, so SEV-enabled destroyed cannot
reuse their ASIDs. This is currently workaround with "coco: Leak ASID for coco guests".
---
 xen/arch/x86/Makefile                  |   1 +
 xen/arch/x86/coco/Makefile             |   1 +
 xen/arch/x86/coco/sev.c                | 262 +++++++++++++++++++++++++
 xen/arch/x86/cpu/amd.c                 |  10 +
 xen/arch/x86/cpuid.c                   |   5 +
 xen/arch/x86/hvm/Kconfig               |  10 +
 xen/arch/x86/hvm/svm/svm.c             |   6 +
 xen/arch/x86/hvm/svm/vmcb.c            |  17 +-
 xen/arch/x86/include/asm/coco.h        |   8 +
 xen/arch/x86/include/asm/hvm/svm/sev.h |  14 ++
 xen/arch/x86/include/asm/hvm/svm/svm.h |  16 ++
 11 files changed, 344 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/x86/coco/Makefile
 create mode 100644 xen/arch/x86/coco/sev.c
 create mode 100644 xen/arch/x86/include/asm/coco.h
 create mode 100644 xen/arch/x86/include/asm/hvm/svm/sev.h

diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index bedb97cbee..220bff5e0a 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -1,5 +1,6 @@
 obj-y += acpi/
 obj-y += boot/
+obj-$(CONFIG_COCO) += coco/
 obj-y += cpu/
 obj-y += efi/
 obj-y += genapic/
diff --git a/xen/arch/x86/coco/Makefile b/xen/arch/x86/coco/Makefile
new file mode 100644
index 0000000000..59ab1c075f
--- /dev/null
+++ b/xen/arch/x86/coco/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_COCO_AMD_SEV) += sev.o
\ No newline at end of file
diff --git a/xen/arch/x86/coco/sev.c b/xen/arch/x86/coco/sev.c
new file mode 100644
index 0000000000..366ce42baa
--- /dev/null
+++ b/xen/arch/x86/coco/sev.c
@@ -0,0 +1,262 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * coco/sev.c: AMD SEV support
+ * Copyright (c) Vates SAS
+ */
+
+#include <asm/cpu-policy.h>
+#include <asm/cpufeature.h>
+#include <asm/p2m.h>
+#include <asm/hvm/asid.h>
+ 
+#include <public/hvm/coco.h>
+
+#include <xen/config.h>
+#include <xen/coco.h>
+#include <asm/psp-sev.h>
+
+static int sev_domain_initialise(struct domain *d)
+{
+    struct sev_data_launch_start sd_ls;
+    struct sev_data_activate sd_a;
+    int psp_ret;
+    long rc = 0;
+
+    sd_ls.handle = 0;          /* generate new one */
+    sd_ls.policy = 0;          /* NOKS policy */
+    sd_ls.dh_cert_address = 0; /* do not DH stuff */
+
+    rc = sev_do_cmd(SEV_CMD_LAUNCH_START, (void *)(&sd_ls), &psp_ret, true);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "asp: failed to LAUNCH_START domain(%d): psp_ret %d\n",
+                d->domain_id, psp_ret);
+        return rc;
+    }
+
+    sd_a.handle = sd_ls.handle;
+    sd_a.asid = d->arch.hvm.asid.asid;
+
+    rc = sev_do_cmd(SEV_CMD_ACTIVATE, (void *)(&sd_a), &psp_ret, true);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "asp: failed to ACTIVATE domain(%d): psp_ret %d\n",
+                d->domain_id, psp_ret);
+        return rc;
+    }
+
+    d->arch.hvm.svm.sev.asp_handle = sd_ls.handle;
+    d->arch.hvm.svm.sev.asp_policy = 0;
+
+    return 0;
+}
+
+static int sev_domain_prepare_initial_mem(struct domain *d, gfn_t gfn, size_t count)
+{
+    struct page_info *page;
+    int rc, psp_ret;
+    struct sev_data_launch_update_data sd_lud;
+
+    mfn_t mfn, mfn_base = INVALID_MFN;
+    size_t segment_size = 0;
+
+    do {
+        page = get_page_from_gfn(d, gfn_x(gfn), NULL, P2M_ALLOC);
+        if ( unlikely(!page) )
+            return rc;
+
+        mfn = page_to_mfn(page);
+        put_page(page);
+
+        if ( !mfn_valid(mfn_base) )
+            mfn_base = mfn;
+        else
+        {
+            // Check for a break.
+            if (mfn_x(mfn_base) + segment_size != mfn_x(mfn) || segment_size == 512)
+            {
+                // Make launch update data.
+                printk(XENLOG_DEBUG
+                       "asp: LAUNCH_UPDATE_DATA d%d: base=%"PRI_xen_pfn", size=%zx\n",
+                       d->domain_id, mfn_x(mfn_base), segment_size);
+                
+                sd_lud.reserved = 0;
+                sd_lud.handle = d->arch.hvm.svm.sev.asp_handle;
+                sd_lud.address = mfn_x(mfn_base) << PAGE_SHIFT;
+                sd_lud.len = segment_size * PAGE_SIZE;
+                rc = sev_do_cmd(SEV_CMD_LAUNCH_UPDATE_DATA, (void *)(&sd_lud),
+                                &psp_ret, true);
+                if (rc)
+                {
+                    printk(XENLOG_ERR
+                           "asp: failed to LAUNCH_UPDATE_DATA dom(%d): err %d\n",
+                           d->domain_id, psp_ret);
+                    return rc;
+                }
+
+                mfn_base = mfn_x(mfn);
+                segment_size = 0;
+            }
+        }  
+
+        gfn = gfn_add(gfn, 1);
+        segment_size++;
+        count--;
+    } while ( count );
+
+    // Last launch update data.
+    if ( segment_size )
+    {
+        sd_lud.reserved = 0;
+        sd_lud.handle = d->arch.hvm.svm.sev.asp_handle;
+        sd_lud.address = mfn_x(mfn_base) << PAGE_SHIFT;
+        sd_lud.len = segment_size * PAGE_SIZE;
+        rc = sev_do_cmd(SEV_CMD_LAUNCH_UPDATE_DATA, (void *)(&sd_lud),
+                        &psp_ret, true);
+
+        if ( rc )
+            printk(XENLOG_ERR "asp: failed to LAUNCH_UPDATE_DATA dom(%d): err %d\n",
+                   d->domain_id, psp_ret);
+    }
+
+    return rc;
+}
+
+static int sev_domain_creation_finished(struct domain *d)
+{
+    struct sev_data_launch_measure sd_lm;
+    struct sev_data_launch_finish sd_lf;
+    int psp_ret;
+    long rc = 0;
+
+    sd_lm.handle = d->arch.hvm.svm.sev.asp_handle;
+    sd_lm.address = virt_to_maddr(d->arch.hvm.svm.sev.measure);
+    sd_lm.len = sizeof(d->arch.hvm.svm.sev.measure);
+    sd_lm.reserved = 0;
+
+    rc = sev_do_cmd(SEV_CMD_LAUNCH_MEASURE, (void *)(&sd_lm), &psp_ret, true);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "asp: failed to LAUNCH_MEASURE for d%hu: psp_ret %hu, rc %ld\n",
+               d->domain_id, psp_ret, rc);
+        
+        if (psp_ret == SEV_RET_INVALID_LEN)
+            printk(XENLOG_ERR "asp: Expected %"PRIu32" bytes\n", sd_lm.len);
+        return rc;
+    }
+
+    sd_lf.handle = d->arch.hvm.svm.sev.asp_handle;
+
+    rc = sev_do_cmd(SEV_CMD_LAUNCH_FINISH, (void *)(&sd_lf), &psp_ret, true);
+    if ( rc )
+    {
+        printk(XENLOG_ERR "asp: failed to LAUNCH_FINISH for d%hu: psp_ret %d, rc %ld\n",
+                d->domain_id, psp_ret, rc);
+        return rc;
+    }
+
+    d->arch.hvm.svm.sev.measure_len = sd_lm.len;
+    return 0;
+}
+
+static void sev_domain_destroy(struct domain *d)
+{
+    struct sev_data_deactivate sd_da;
+    struct sev_data_decommission sd_de;
+    int psp_ret;
+    long rc = 0;
+
+    sd_da.handle = d->arch.hvm.svm.sev.asp_handle;
+
+    rc = sev_do_cmd(SEV_CMD_DEACTIVATE, (void *)(&sd_da), &psp_ret, true);
+    if (rc)
+    {
+        printk(XENLOG_ERR "asp: failed to DEACTIVATE for d%hu: psp_ret %d\n",
+               d->domain_id, psp_ret);
+        return;
+    }
+
+    sd_de.handle = d->arch.hvm.svm.sev.asp_handle;
+
+    rc = sev_do_cmd(SEV_CMD_DECOMMISSION, (void *)(&sd_de), &psp_ret, true);
+    if (rc)
+    {
+        printk(XENLOG_ERR "asp: failed to DECOMMISSION for d%hu: psp_ret %d\n",
+               d->domain_id, psp_ret);
+        return;
+    }
+
+    d->arch.hvm.svm.sev.asp_handle = 0;
+}
+
+static int sev_asid_alloc(struct domain *d, struct hvm_asid *asid)
+{
+    /* TODO: SEV-ES/SNP */
+    unsigned long asid_min = raw_cpu_policy.extd.min_no_es_asid;
+    unsigned long asid_max = raw_cpu_policy.extd.max_sev_guests;
+
+    return hvm_asid_alloc_range(asid, asid_min, asid_max);
+}
+
+static struct coco_domain_ops sev_domain_ops = {
+    .prepare_initial_mem = sev_domain_prepare_initial_mem,
+    .domain_initialise = sev_domain_initialise,
+    .domain_creation_finished = sev_domain_creation_finished,
+    .domain_destroy = sev_domain_destroy,
+    .asid_alloc = sev_asid_alloc,
+};
+
+static int sev_init(void)
+{
+    unsigned long syscfg;
+
+    if ( WARN_ON(!cpu_has_sev) )
+        return -ENOSYS;
+
+    ASSERT(raw_cpu_policy.extd.c_bit_pos > 0);
+    ASSERT(raw_cpu_policy.extd.max_sev_guests > 0);
+
+    printk(XENLOG_INFO "sev: C-bit is %"PRIu32"\n", raw_cpu_policy.extd.c_bit_pos);
+    printk(XENLOG_INFO "sev: Supports up to %"PRIu32" guests\n",
+            raw_cpu_policy.extd.max_sev_guests);
+
+    /* Enable AMD SME */	
+    rdmsrl(MSR_K8_SYSCFG, syscfg);
+
+    if ( !(syscfg & SYSCFG_MEM_ENCRYPT) )
+    {
+        syscfg |= SYSCFG_MEM_ENCRYPT;
+        wrmsrl(MSR_K8_SYSCFG, syscfg);
+
+        printk(XENLOG_INFO "sev: Enabled AMD SME\n");
+    }
+
+    return 0;
+}
+
+static int sev_get_platform_status(struct coco_platform_status *status)
+{
+    status->platform = COCO_PLATFORM_amd_sev;
+
+    // if ( cpu_has_sev_es )
+    //   status->platform_flags |= COCO_PLATFORM_FLAG_sev_es;
+
+    status->flags = COCO_STATUS_FLAG_supported;
+
+    return 0;
+}
+
+static struct coco_domain_ops *sev_get_domain_ops(struct domain *d)
+{
+    // TODO: SEV-ES and SEV-SNP support
+    return &sev_domain_ops;
+}
+
+struct coco_ops sev_coco_ops = {
+    .name = "SEV",
+    .init = sev_init,
+    .get_platform_status = sev_get_platform_status,
+    .get_domain_ops = sev_get_domain_ops,
+};
+
+
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 37d67dd15c..28b5a0420d 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -1,4 +1,5 @@
 #include <xen/cpu.h>
+#include <asm/cpu-policy.h>
 #include <xen/init.h>
 #include <xen/bitops.h>
 #include <xen/mm.h>
@@ -19,6 +20,10 @@
 
 #include "cpu.h"
 
+#ifdef CONFIG_COCO
+#include <asm/coco.h>
+#endif
+
 /*
  * Pre-canned values for overriding the CPUID features 
  * and extended features masks.
@@ -1333,6 +1338,11 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	check_syscfg_dram_mod_en();
 
 	amd_log_freq(c);
+
+#ifdef CONFIG_COCO_AMD_SEV
+	if ( cpu_has_sev )
+		coco_register_ops(&sev_coco_ops);
+#endif
 }
 
 const struct cpu_dev __initconst_cf_clobber amd_cpu_dev = {
diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
index e2d94619c2..e1d6db4ad8 100644
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -8,6 +8,7 @@
 #include <asm/cpu-policy.h>
 #include <asm/cpuid.h>
 #include <asm/hvm/viridian.h>
+#include <asm/hvm/svm/sev.h>
 #include <asm/xstate.h>
 
 #define EMPTY_LEAF ((struct cpuid_leaf){})
@@ -250,6 +251,10 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
             return;
 
         *res = array_access_nospec(p->extd.raw, leaf & 0xffff);
+        
+        /* For a SEV guest, passthrough the host SEV leaf. */
+        if ( is_sev_domain(d) && leaf == 0x8000001fU )
+            *res = raw_cpu_policy.extd.raw[0x1f];
         break;
 
     default:
diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index 2def0f98e2..a9332ab8ce 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -25,6 +25,16 @@ config AMD_SVM
 	  If your system includes a processor with AMD-V support, say Y.
 	  If in doubt, say Y.
 
+config COCO_AMD_SEV
+	bool "AMD SEV (UNSUPPORTED)" if AMD && AMD_SVM && COCO && UNSUPPORTED
+	default y
+	select AMD_SP
+	help
+		Enables support for AMD Secure Encrypted Virtualization technology.
+		This option is needed if you want to run confidential guests on a
+		AMD platform that supports it.
+		If in doubt, say N.
+
 config INTEL_VMX
 	bool "Intel VT-x" if INTEL && EXPERT
 	default y
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index cc19d80fe1..63889bf803 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -27,6 +27,7 @@
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/asid.h>
+#include <asm/hvm/svm/sev.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/vmcb.h>
@@ -1865,6 +1866,11 @@ static int cf_check svm_msr_read_intercept(
         break;
 
     case MSR_K8_SYSCFG:
+        if ( is_sev_domain(d) )
+        {
+            *msr_content = SYSCFG_MEM_ENCRYPT;
+            break;
+        }
     case MSR_K8_TOP_MEM1:
     case MSR_K8_TOP_MEM2:
     case MSR_K8_VM_CR:
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 4e1f61dbe0..5157afe733 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -15,6 +15,7 @@
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/msr-index.h>
 #include <asm/p2m.h>
+#include <asm/hvm/svm/sev.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
 #include <asm/spec_ctrl.h>
@@ -192,15 +193,19 @@ int svm_create_vmcb(struct vcpu *v)
     svm->vmcb = nv->nv_n1vmcx;
     rc = construct_vmcb(v);
     if ( rc != 0 )
-    {
-        free_vmcb(nv->nv_n1vmcx);
-        nv->nv_n1vmcx = NULL;
-        svm->vmcb = NULL;
-        return rc;
-    }
+        goto err;
+
+    if ( is_sev_domain(v->domain) )
+        vmcb_set_np_ctrl(svm->vmcb, vmcb_get_np_ctrl(svm->vmcb) | NPCTRL_SEV_ENABLE);
 
     svm->vmcb_pa = nv->nv_n1vmcx_pa = virt_to_maddr(svm->vmcb);
     return 0;
+
+err:
+    free_vmcb(nv->nv_n1vmcx);
+    nv->nv_n1vmcx = NULL;
+    svm->vmcb = NULL;
+    return rc;
 }
 
 void svm_destroy_vmcb(struct vcpu *v)
diff --git a/xen/arch/x86/include/asm/coco.h b/xen/arch/x86/include/asm/coco.h
new file mode 100644
index 0000000000..874ef56327
--- /dev/null
+++ b/xen/arch/x86/include/asm/coco.h
@@ -0,0 +1,8 @@
+#ifndef __ARCH_X86_COCO_H
+#define __ARCH_X86_COCO_H
+
+#include <xen/coco.h>
+
+extern struct coco_ops sev_coco_ops;
+
+#endif /* __ARCH_X86_CACHE_H */
\ No newline at end of file
diff --git a/xen/arch/x86/include/asm/hvm/svm/sev.h b/xen/arch/x86/include/asm/hvm/svm/sev.h
new file mode 100644
index 0000000000..b7b5ab5591
--- /dev/null
+++ b/xen/arch/x86/include/asm/hvm/svm/sev.h
@@ -0,0 +1,14 @@
+#ifndef __XEN_HVM_SEV_H__
+#define __XEN_HVM_SEV_H__
+
+#include <asm/nospec.h>
+#include <asm/cpufeature.h>
+
+#include <xen/sched.h>
+
+static always_inline bool is_sev_domain(const struct domain *d)
+{
+  return cpu_has_sev && evaluate_nospec(d->options & XEN_DOMCTL_CDF_coco);
+}
+
+#endif /* __XEN_HVM_SEV_H__ */
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 1254e5f3ee..efd54511aa 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -9,6 +9,8 @@
 #ifndef __ASM_X86_HVM_SVM_H__
 #define __ASM_X86_HVM_SVM_H__
 
+#include <xen/stdint.h>
+
 void svm_asid_init(void);
 void svm_vcpu_assign_asid(struct vcpu *v);
 void svm_vcpu_set_tlb_control(struct vcpu *v);
@@ -26,6 +28,16 @@ bool svm_load_segs(unsigned int ldt_ents, unsigned long ldt_base,
                    unsigned long fs_base, unsigned long gs_base,
                    unsigned long gs_shadow);
 
+struct sev_state {
+  uint32_t asp_handle;
+  uint32_t asp_policy;
+  uint8_t  measure[96];
+  uint32_t measure_len; /* 96 bytes */
+  uint8_t  state;
+
+  unsigned long flags;
+};
+                
 struct svm_domain {
     /* OSVW MSRs */
     union {
@@ -35,6 +47,10 @@ struct svm_domain {
             uint64_t status;
         };
     } osvw;
+
+    #ifdef CONFIG_COCO_AMD_SEV
+    struct sev_state sev;
+    #endif
 };
 
 extern u32 svm_feature_flags;
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


