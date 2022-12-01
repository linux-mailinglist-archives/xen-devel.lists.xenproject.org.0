Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E75FB63F4E9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:12:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450989.708553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mAn-00005f-JY; Thu, 01 Dec 2022 16:12:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450989.708553; Thu, 01 Dec 2022 16:12:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mAn-0008VN-GU; Thu, 01 Dec 2022 16:12:29 +0000
Received: by outflank-mailman (input) for mailman id 450989;
 Thu, 01 Dec 2022 16:12:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0mAm-00075z-A7
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:12:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f2b7bad0-7192-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:12:27 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4304DD6E;
 Thu,  1 Dec 2022 08:12:33 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8469C3F73B;
 Thu,  1 Dec 2022 08:12:25 -0800 (PST)
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
X-Inumbo-ID: f2b7bad0-7192-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [RFC PATCH 11/21] xen/arm: vsmmuv3: Attach Stage-1 configuration to SMMUv3 hardware
Date: Thu,  1 Dec 2022 16:02:35 +0000
Message-Id: <b0873a8cf229143544388a90334edd7c96bc78c4.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Attach the Stage-1 configuration to device STE to support nested
translation for the guests.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c  | 79 ++++++++++++++++++++++++++
 xen/drivers/passthrough/arm/smmu-v3.h  |  1 +
 xen/drivers/passthrough/arm/vsmmu-v3.c | 18 ++++++
 xen/include/xen/iommu.h                | 14 +++++
 4 files changed, 112 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 4f96fdb92f..c4b4a5d86d 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -2754,6 +2754,37 @@ static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev)
 	return NULL;
 }
 
+static struct iommu_domain *arm_smmu_get_domain_by_sid(struct domain *d,
+				u32 sid)
+{
+	int i;
+	unsigned long flags;
+	struct iommu_domain *io_domain;
+	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_master *master;
+	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
+
+	/*
+	 * Loop through the &xen_domain->contexts to locate a context
+	 * assigned to this SMMU
+	 */
+	list_for_each_entry(io_domain, &xen_domain->contexts, list) {
+		smmu_domain = to_smmu_domain(io_domain);
+
+		spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+		list_for_each_entry(master, &smmu_domain->devices, domain_head) {
+			for (i = 0; i < master->num_streams; i++) {
+				if (sid != master->streams[i].id)
+					continue;
+				spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+				return io_domain;
+			}
+		}
+		spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+	}
+	return NULL;
+}
+
 static struct iommu_domain *arm_smmu_get_domain(struct domain *d,
 				struct device *dev)
 {
@@ -2909,6 +2940,53 @@ static void arm_smmu_iommu_xen_domain_teardown(struct domain *d)
 	xfree(xen_domain);
 }
 
+static int arm_smmu_attach_guest_config(struct domain *d, u32 sid,
+		struct iommu_guest_config *cfg)
+{
+	int ret = -EINVAL;
+	unsigned long flags;
+	struct arm_smmu_master *master;
+	struct arm_smmu_domain *smmu_domain;
+	struct arm_smmu_xen_domain *xen_domain = dom_iommu(d)->arch.priv;
+	struct iommu_domain *io_domain = arm_smmu_get_domain_by_sid(d, sid);
+
+	if (!io_domain)
+		return -ENODEV;
+
+	smmu_domain = to_smmu_domain(io_domain);
+
+	spin_lock(&xen_domain->lock);
+
+	switch (cfg->config) {
+	case ARM_SMMU_DOMAIN_ABORT:
+		smmu_domain->abort = true;
+		break;
+	case ARM_SMMU_DOMAIN_BYPASS:
+		smmu_domain->abort = false;
+		break;
+	case ARM_SMMU_DOMAIN_NESTED:
+		/* Enable Nested stage translation. */
+		smmu_domain->stage = ARM_SMMU_DOMAIN_NESTED;
+		smmu_domain->s1_cfg.s1ctxptr = cfg->s1ctxptr;
+		smmu_domain->s1_cfg.s1fmt = cfg->s1fmt;
+		smmu_domain->s1_cfg.s1cdmax = cfg->s1cdmax;
+		smmu_domain->abort = false;
+		break;
+	default:
+		goto out;
+	}
+
+	spin_lock_irqsave(&smmu_domain->devices_lock, flags);
+	list_for_each_entry(master, &smmu_domain->devices, domain_head)
+		arm_smmu_install_ste_for_dev(master);
+	spin_unlock_irqrestore(&smmu_domain->devices_lock, flags);
+
+	ret = 0;
+out:
+	spin_unlock(&xen_domain->lock);
+	return ret;
+}
+
 static const struct iommu_ops arm_smmu_iommu_ops = {
 	.page_sizes		= PAGE_SIZE_4K,
 	.init			= arm_smmu_iommu_xen_domain_init,
@@ -2921,6 +2999,7 @@ static const struct iommu_ops arm_smmu_iommu_ops = {
 	.unmap_page		= arm_iommu_unmap_page,
 	.dt_xlate		= arm_smmu_dt_xlate,
 	.add_device		= arm_smmu_add_device,
+	.attach_guest_config = arm_smmu_attach_guest_config
 };
 
 static __init int arm_smmu_dt_init(struct dt_device_node *dev,
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
index e270fe05e0..50a050408b 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -393,6 +393,7 @@ enum arm_smmu_domain_stage {
 	ARM_SMMU_DOMAIN_S2,
 	ARM_SMMU_DOMAIN_NESTED,
 	ARM_SMMU_DOMAIN_BYPASS,
+	ARM_SMMU_DOMAIN_ABORT,
 };
 
 /* Xen specific code. */
diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
index 916b97b8a2..5188181929 100644
--- a/xen/drivers/passthrough/arm/vsmmu-v3.c
+++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
@@ -223,8 +223,11 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
 {
     int ret;
     uint64_t ste[STRTAB_STE_DWORDS];
+    struct domain *d = smmu->d;
+    struct domain_iommu *hd = dom_iommu(d);
     struct arm_vsmmu_s1_trans_cfg s1_cfg = {0};
     uint32_t sid = smmu_cmd_get_sid(cmdptr[0]);
+    struct iommu_guest_config guest_cfg = {0};
 
     ret = arm_vsmmu_find_ste(smmu, sid, ste);
     if ( ret )
@@ -234,6 +237,21 @@ static int arm_vsmmu_handle_cfgi_ste(struct virt_smmu *smmu, uint64_t *cmdptr)
     if ( ret )
         return (ret == -EAGAIN ) ? 0 : ret;
 
+    guest_cfg.s1ctxptr = s1_cfg.s1ctxptr;
+    guest_cfg.s1fmt = s1_cfg.s1fmt;
+    guest_cfg.s1cdmax = s1_cfg.s1cdmax;
+
+    if ( s1_cfg.bypassed )
+        guest_cfg.config = ARM_SMMU_DOMAIN_BYPASS;
+    else if ( s1_cfg.aborted )
+        guest_cfg.config = ARM_SMMU_DOMAIN_ABORT;
+    else
+        guest_cfg.config = ARM_SMMU_DOMAIN_NESTED;
+
+    ret = hd->platform_ops->attach_guest_config(d, sid, &guest_cfg);
+    if ( ret )
+        return ret;
+
     return 0;
 }
 
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 4f22fc1bed..b2fc027e5e 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -230,6 +230,15 @@ int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
 
 #endif /* HAS_DEVICE_TREE */
 
+#ifdef CONFIG_ARM
+struct iommu_guest_config {
+    paddr_t     s1ctxptr;
+    uint8_t     config;
+    uint8_t     s1fmt;
+    uint8_t     s1cdmax;
+};
+#endif /* CONFIG_ARM */
+
 struct page_info;
 
 /*
@@ -302,6 +311,11 @@ struct iommu_ops {
      */
     int (*dt_xlate)(device_t *dev, const struct dt_phandle_args *args);
 #endif
+
+#ifdef CONFIG_ARM
+    int (*attach_guest_config)(struct domain *d, u32 sid,
+                               struct iommu_guest_config *cfg);
+#endif
 };
 
 /*
-- 
2.25.1


