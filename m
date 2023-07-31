Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B098A7697BC
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 15:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573058.897380 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQT3l-00006N-Fe; Mon, 31 Jul 2023 13:35:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573058.897380; Mon, 31 Jul 2023 13:35:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQT3l-000058-Ce; Mon, 31 Jul 2023 13:35:41 +0000
Received: by outflank-mailman (input) for mailman id 573058;
 Mon, 31 Jul 2023 13:35:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wefb=DR=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQT3k-0008Hl-2y
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 13:35:40 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22baf4b5-2fa7-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 15:35:38 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 288E84EE0740;
 Mon, 31 Jul 2023 15:35:37 +0200 (CEST)
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
X-Inumbo-ID: 22baf4b5-2fa7-11ee-8613-37d641c3527e
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
Subject: [XEN PATCH 1/4] xen/pci: rename local variable to address MISRA C:2012 Rule 5.3
Date: Mon, 31 Jul 2023 15:34:59 +0200
Message-Id: <c9c6dd21ec6e88895ebc15ee6fe96090168afb51.1690810346.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690810346.git.nicola.vetrini@bugseng.com>
References: <cover.1690810346.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The rename s/pdev_type/pci_dev_type/ is done to avoid shadowing
the homonymous function declaration.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/drivers/passthrough/pci.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 95846e84f2..1dc519d1b6 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -650,12 +650,12 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
     struct pci_seg *pseg;
     struct pci_dev *pdev;
     unsigned int slot = PCI_SLOT(devfn), func = PCI_FUNC(devfn);
-    const char *pdev_type;
+    const char *pci_dev_type;
     int ret;
     bool pf_is_extfn = false;
 
     if ( !info )
-        pdev_type = "device";
+        pci_dev_type = "device";
     else if ( info->is_virtfn )
     {
         pcidevs_lock();
@@ -668,12 +668,12 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
         if ( !pdev )
             pci_add_device(seg, info->physfn.bus, info->physfn.devfn,
                            NULL, node);
-        pdev_type = "virtual function";
+        pci_dev_type = "virtual function";
     }
     else if ( info->is_extfn )
-        pdev_type = "extended function";
+        pci_dev_type = "extended function";
     else
-        pdev_type = "device";
+        pci_dev_type = "device";
 
     ret = xsm_resource_plug_pci(XSM_PRIV, (seg << 16) | (bus << 8) | devfn);
     if ( ret )
@@ -780,7 +780,7 @@ out:
     pcidevs_unlock();
     if ( !ret )
     {
-        printk(XENLOG_DEBUG "PCI add %s %pp\n", pdev_type,  &pdev->sbdf);
+        printk(XENLOG_DEBUG "PCI add %s %pp\n", pci_dev_type,  &pdev->sbdf);
         while ( pdev->phantom_stride )
         {
             func += pdev->phantom_stride;
-- 
2.34.1


