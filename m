Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9387697B9
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573059.897391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQT3m-0000Ob-Mr; Mon, 31 Jul 2023 13:35:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573059.897391; Mon, 31 Jul 2023 13:35:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQT3m-0000MA-Jh; Mon, 31 Jul 2023 13:35:42 +0000
Received: by outflank-mailman (input) for mailman id 573059;
 Mon, 31 Jul 2023 13:35:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQT3l-0008Hl-9w
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:35:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23708b65-2fa7-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 15:35:39 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 6C4024EE0741;
 Mon, 31 Jul 2023 15:35:38 +0200 (CEST)
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
X-Inumbo-ID: 23708b65-2fa7-11ee-8613-37d641c3527e
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH 2/4] amd/iommu: rename functions to address MISRA C:2012 Rule 5.3
Date: Mon, 31 Jul 2023 15:35:00 +0200
Message-Id: <838e606bfe8b83578970ce73a1ac7d71ccefcd2b.1690810346.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690810346.git.nicola.vetrini@bugseng.com>
References: <cover.1690810346.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions 'machine_bfd' and 'guest_bfd' have gained the
prefix 'get_' to avoid the mutual shadowing with the homonymous
parameters in these functions.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/drivers/passthrough/amd/iommu_guest.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu_guest.c b/xen/drivers/passthrough/amd/iommu_guest.c
index 80a331f546..47a912126a 100644
--- a/xen/drivers/passthrough/amd/iommu_guest.c
+++ b/xen/drivers/passthrough/amd/iommu_guest.c
@@ -38,12 +38,12 @@
         (reg)->hi = (val) >> 32; \
     } while (0)
 
-static unsigned int machine_bdf(struct domain *d, uint16_t guest_bdf)
+static unsigned int get_machine_bdf(struct domain *d, uint16_t guest_bdf)
 {
     return guest_bdf;
 }
 
-static uint16_t guest_bdf(struct domain *d, uint16_t machine_bdf)
+static uint16_t get_guest_bdf(struct domain *d, uint16_t machine_bdf)
 {
     return machine_bdf;
 }
@@ -195,7 +195,7 @@ void guest_iommu_add_ppr_log(struct domain *d, u32 entry[])
     log = map_domain_page(_mfn(mfn)) + (tail & ~PAGE_MASK);
 
     /* Convert physical device id back into virtual device id */
-    gdev_id = guest_bdf(d, iommu_get_devid_from_cmd(entry[0]));
+    gdev_id = get_guest_bdf(d, iommu_get_devid_from_cmd(entry[0]));
     iommu_set_devid_to_cmd(&entry[0], gdev_id);
 
     memcpy(log, entry, sizeof(ppr_entry_t));
@@ -245,7 +245,7 @@ void guest_iommu_add_event_log(struct domain *d, u32 entry[])
     log = map_domain_page(_mfn(mfn)) + (tail & ~PAGE_MASK);
 
     /* re-write physical device id into virtual device id */
-    dev_id = guest_bdf(d, iommu_get_devid_from_cmd(entry[0]));
+    dev_id = get_guest_bdf(d, iommu_get_devid_from_cmd(entry[0]));
     iommu_set_devid_to_cmd(&entry[0], dev_id);
     memcpy(log, entry, sizeof(event_entry_t));
 
@@ -268,7 +268,7 @@ static int do_complete_ppr_request(struct domain *d, cmd_entry_t *cmd)
     uint16_t dev_id;
     struct amd_iommu *iommu;
 
-    dev_id = machine_bdf(d, iommu_get_devid_from_cmd(cmd->data[0]));
+    dev_id = get_machine_bdf(d, iommu_get_devid_from_cmd(cmd->data[0]));
     iommu = find_iommu_for_device(0, dev_id);
 
     if ( !iommu )
@@ -320,7 +320,7 @@ static int do_invalidate_iotlb_pages(struct domain *d, cmd_entry_t *cmd)
     struct amd_iommu *iommu;
     uint16_t dev_id;
 
-    dev_id = machine_bdf(d, iommu_get_devid_from_cmd(cmd->data[0]));
+    dev_id = get_machine_bdf(d, iommu_get_devid_from_cmd(cmd->data[0]));
 
     iommu = find_iommu_for_device(0, dev_id);
     if ( !iommu )
@@ -396,7 +396,7 @@ static int do_invalidate_dte(struct domain *d, cmd_entry_t *cmd)
 
     g_iommu = domain_iommu(d);
     gbdf = iommu_get_devid_from_cmd(cmd->data[0]);
-    mbdf = machine_bdf(d, gbdf);
+    mbdf = get_machine_bdf(d, gbdf);
 
     /* Guest can only update DTEs for its passthru devices */
     if ( mbdf == 0 || gbdf == 0 )
-- 
2.34.1


