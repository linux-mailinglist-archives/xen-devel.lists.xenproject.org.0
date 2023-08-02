Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D334F76D03F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 16:39:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574975.900666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzs-0007fK-Dd; Wed, 02 Aug 2023 14:38:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574975.900666; Wed, 02 Aug 2023 14:38:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCzs-0007cn-8W; Wed, 02 Aug 2023 14:38:44 +0000
Received: by outflank-mailman (input) for mailman id 574975;
 Wed, 02 Aug 2023 14:38:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIS5=DT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRCzp-0006bO-WE
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 14:38:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 465e692a-3142-11ee-b260-6b7b168915f2;
 Wed, 02 Aug 2023 16:38:41 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 978C14EE0744;
 Wed,  2 Aug 2023 16:38:40 +0200 (CEST)
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
X-Inumbo-ID: 465e692a-3142-11ee-b260-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 05/11] drivers/pci: move variable definitions to address MISRA C:2012 Rule 2.1
Date: Wed,  2 Aug 2023 16:38:11 +0200
Message-Id: <99f434f5d8b9c8eca275f23799a642ba34e79eb8.1690985045.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690985045.git.nicola.vetrini@bugseng.com>
References: <cover.1690985045.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Variable declarations between a switch statement guard and before
any case label are unreachable code, and hence violate Rule 2.1:
"A project shall not contain unreachable code".

Therefore the variable declarations are moved in the smallest enclosing
scope, near other variable definitions.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/drivers/passthrough/pci.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 33452791a8..3f5fa5beef 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -315,6 +315,7 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     struct pci_dev *pdev;
     unsigned int pos;
     int rc;
+    unsigned int cap, sec_bus, sub_bus;
 
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
         if ( pdev->bus == bus && pdev->devfn == devfn )
@@ -343,8 +344,6 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
     /* update bus2bridge */
     switch ( pdev->type = pdev_type(pseg->nr, bus, devfn) )
     {
-        unsigned int cap, sec_bus, sub_bus;
-
         case DEV_TYPE_PCIe2PCI_BRIDGE:
         case DEV_TYPE_LEGACY_PCI_BRIDGE:
             sec_bus = pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
@@ -424,11 +423,11 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
 
 static void free_pdev(struct pci_seg *pseg, struct pci_dev *pdev)
 {
+    unsigned int sec_bus, sub_bus;
+
     /* update bus2bridge */
     switch ( pdev->type )
     {
-        unsigned int sec_bus, sub_bus;
-
         case DEV_TYPE_PCIe2PCI_BRIDGE:
         case DEV_TYPE_LEGACY_PCI_BRIDGE:
             sec_bus = pci_conf_read8(pdev->sbdf, PCI_SECONDARY_BUS);
@@ -1555,11 +1554,10 @@ int iommu_do_pci_domctl(
     u8 bus, devfn;
     int ret = 0;
     uint32_t machine_sbdf;
+    unsigned int flags;
 
     switch ( domctl->cmd )
     {
-        unsigned int flags;
-
     case XEN_DOMCTL_get_device_group:
     {
         u32 max_sdevs;
-- 
2.34.1


