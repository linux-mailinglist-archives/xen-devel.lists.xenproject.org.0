Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F240263F4B7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:04:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.450913.708432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m2e-0000zv-8m; Thu, 01 Dec 2022 16:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 450913.708432; Thu, 01 Dec 2022 16:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0m2e-0000y3-5V; Thu, 01 Dec 2022 16:04:04 +0000
Received: by outflank-mailman (input) for mailman id 450913;
 Thu, 01 Dec 2022 16:04:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0m2c-0008HE-36
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:04:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id c4d00774-7191-11ed-91b6-6bf2151ebd3b;
 Thu, 01 Dec 2022 17:04:00 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B961DD6E;
 Thu,  1 Dec 2022 08:04:06 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AADCA3F67D;
 Thu,  1 Dec 2022 08:03:58 -0800 (PST)
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
X-Inumbo-ID: c4d00774-7191-11ed-91b6-6bf2151ebd3b
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Keqian Zhu <zhukeqian1@huawei.com>,
	Will Deacon <will@kernel.org>,
	Joerg Roedel <jroedel@suse.de>
Subject: [RFC PATCH 01/21] xen/arm: smmuv3: Maintain a SID->device structure
Date: Thu,  1 Dec 2022 16:02:25 +0000
Message-Id: <c6d0ad52d1f99314d236a36413e8391b48989d37.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jean-Philippe Brucker <jean-philippe@linaro.org>

Backport Linux commit cdf315f907d4. This is the clean backport without
any changes.

When handling faults from the event or PRI queue, we need to find the
struct device associated with a SID. Add a rb_tree to keep track of
SIDs.

Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Keqian Zhu <zhukeqian1@huawei.com>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Acked-by: Will Deacon <will@kernel.org>
Link: https://lore.kernel.org/r/20210401154718.307519-8-jean-philippe@linaro.org
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git cdf315f907d4
Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 131 +++++++++++++++++++++-----
 xen/drivers/passthrough/arm/smmu-v3.h |  13 ++-
 2 files changed, 118 insertions(+), 26 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 9c9f463009..cbef3f8b36 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -810,6 +810,27 @@ static int arm_smmu_init_l2_strtab(struct arm_smmu_device *smmu, u32 sid)
 	return 0;
 }
 
+__maybe_unused
+static struct arm_smmu_master *
+arm_smmu_find_master(struct arm_smmu_device *smmu, u32 sid)
+{
+	struct rb_node *node;
+	struct arm_smmu_stream *stream;
+
+	node = smmu->streams.rb_node;
+	while (node) {
+		stream = rb_entry(node, struct arm_smmu_stream, node);
+		if (stream->id < sid)
+			node = node->rb_right;
+		else if (stream->id > sid)
+			node = node->rb_left;
+		else
+			return stream->master;
+	}
+
+	return NULL;
+}
+
 /* IRQ and event handlers */
 static void arm_smmu_evtq_tasklet(void *dev)
 {
@@ -1047,8 +1068,8 @@ static int arm_smmu_atc_inv_master(struct arm_smmu_master *master,
 	if (!master->ats_enabled)
 		return 0;
 
-	for (i = 0; i < master->num_sids; i++) {
-		cmd->atc.sid = master->sids[i];
+	for (i = 0; i < master->num_streams; i++) {
+		cmd->atc.sid = master->streams[i].id;
 		arm_smmu_cmdq_issue_cmd(master->smmu, cmd);
 	}
 
@@ -1276,13 +1297,13 @@ static void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master)
 	int i, j;
 	struct arm_smmu_device *smmu = master->smmu;
 
-	for (i = 0; i < master->num_sids; ++i) {
-		u32 sid = master->sids[i];
+    for (i = 0; i < master->num_streams; ++i) {
+		u32 sid = master->streams[i].id;
 		__le64 *step = arm_smmu_get_step_for_sid(smmu, sid);
 
 		/* Bridged PCI devices may end up with duplicated IDs */
 		for (j = 0; j < i; j++)
-			if (master->sids[j] == sid)
+			if (master->streams[j].id == sid)
 				break;
 		if (j < i)
 			continue;
@@ -1489,12 +1510,86 @@ static bool arm_smmu_sid_in_range(struct arm_smmu_device *smmu, u32 sid)
 
 	return sid < limit;
 }
+
+static int arm_smmu_insert_master(struct arm_smmu_device *smmu,
+				  struct arm_smmu_master *master)
+{
+	int i;
+	int ret = 0;
+	struct arm_smmu_stream *new_stream, *cur_stream;
+	struct rb_node **new_node, *parent_node = NULL;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(master->dev);
+
+	master->streams = _xzalloc_array(sizeof(*master->streams), sizeof(void *),
+					fwspec->num_ids);
+	if (!master->streams)
+		return -ENOMEM;
+	master->num_streams = fwspec->num_ids;
+
+	mutex_lock(&smmu->streams_mutex);
+	for (i = 0; i < fwspec->num_ids; i++) {
+		u32 sid = fwspec->ids[i];
+
+		new_stream = &master->streams[i];
+		new_stream->id = sid;
+		new_stream->master = master;
+
+		/*
+		 * Check the SIDs are in range of the SMMU and our stream table
+		 */
+		if (!arm_smmu_sid_in_range(smmu, sid)) {
+			ret = -ERANGE;
+			break;
+		}
+
+		/* Ensure l2 strtab is initialised */
+		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
+			ret = arm_smmu_init_l2_strtab(smmu, sid);
+			if (ret)
+				break;
+		}
+
+		/* Insert into SID tree */
+		new_node = &(smmu->streams.rb_node);
+		while (*new_node) {
+			cur_stream = rb_entry(*new_node, struct arm_smmu_stream,
+					      node);
+			parent_node = *new_node;
+			if (cur_stream->id > new_stream->id) {
+				new_node = &((*new_node)->rb_left);
+			} else if (cur_stream->id < new_stream->id) {
+				new_node = &((*new_node)->rb_right);
+			} else {
+				dev_warn(master->dev,
+					 "stream %u already in tree\n",
+					 cur_stream->id);
+				ret = -EINVAL;
+				break;
+			}
+		}
+		if (ret)
+			break;
+
+		rb_link_node(&new_stream->node, parent_node, new_node);
+		rb_insert_color(&new_stream->node, &smmu->streams);
+	}
+
+	if (ret) {
+		for (i--; i >= 0; i--)
+			rb_erase(&master->streams[i].node, &smmu->streams);
+		xfree(master->streams);
+	}
+	mutex_unlock(&smmu->streams_mutex);
+
+	return ret;
+}
+
 /* Forward declaration */
 static struct arm_smmu_device *arm_smmu_get_by_dev(struct device *dev);
 
 static int arm_smmu_add_device(u8 devfn, struct device *dev)
 {
-	int i, ret;
+	int ret;
 	struct arm_smmu_device *smmu;
 	struct arm_smmu_master *master;
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
@@ -1512,26 +1607,11 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
 
 	master->dev = dev;
 	master->smmu = smmu;
-	master->sids = fwspec->ids;
-	master->num_sids = fwspec->num_ids;
 	dev_iommu_priv_set(dev, master);
 
-	/* Check the SIDs are in range of the SMMU and our stream table */
-	for (i = 0; i < master->num_sids; i++) {
-		u32 sid = master->sids[i];
-
-		if (!arm_smmu_sid_in_range(smmu, sid)) {
-			ret = -ERANGE;
-			goto err_free_master;
-		}
-
-		/* Ensure l2 strtab is initialised */
-		if (smmu->features & ARM_SMMU_FEAT_2_LVL_STRTAB) {
-			ret = arm_smmu_init_l2_strtab(smmu, sid);
-			if (ret)
-				goto err_free_master;
-		}
-	}
+	ret = arm_smmu_insert_master(smmu, master);
+	if (ret)
+		goto err_free_master;
 
 	/*
 	 * Note that PASID must be enabled before, and disabled after ATS:
@@ -1752,6 +1832,9 @@ static int arm_smmu_init_structures(struct arm_smmu_device *smmu)
 {
 	int ret;
 
+	mutex_init(&smmu->streams_mutex);
+	smmu->streams = RB_ROOT;
+
 	ret = arm_smmu_init_queues(smmu);
 	if (ret)
 		return ret;
diff --git a/xen/drivers/passthrough/arm/smmu-v3.h b/xen/drivers/passthrough/arm/smmu-v3.h
index b381ad3738..b3bc7d64c7 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.h
+++ b/xen/drivers/passthrough/arm/smmu-v3.h
@@ -637,6 +637,15 @@ struct arm_smmu_device {
 	struct tasklet		evtq_irq_tasklet;
 	struct tasklet		priq_irq_tasklet;
 	struct tasklet		combined_irq_tasklet;
+
+	struct rb_root		streams;
+	struct mutex		streams_mutex;
+};
+
+struct arm_smmu_stream {
+	u32							id;
+	struct arm_smmu_master		*master;
+	struct rb_node				node;
 };
 
 /* SMMU private data for each master */
@@ -645,8 +654,8 @@ struct arm_smmu_master {
 	struct device			*dev;
 	struct arm_smmu_domain		*domain;
 	struct list_head		domain_head;
-	u32				*sids;
-	unsigned int			num_sids;
+	struct arm_smmu_stream		*streams;
+	unsigned int				num_streams;
 	bool				ats_enabled;
 };
 
-- 
2.25.1


