Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 565A47D2B2D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 09:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620994.966954 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupHR-0004O7-DW; Mon, 23 Oct 2023 07:23:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620994.966954; Mon, 23 Oct 2023 07:23:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupHR-0004CC-3g; Mon, 23 Oct 2023 07:23:17 +0000
Received: by outflank-mailman (input) for mailman id 620994;
 Mon, 23 Oct 2023 07:23:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWHG=GF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qupHP-0003Or-If
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 07:23:15 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06b8f9dc-7175-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 09:23:13 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-95-247-204-25.retail.telecomitalia.it [95.247.204.25])
 by support.bugseng.com (Postfix) with ESMTPSA id D8AB14EE0748;
 Mon, 23 Oct 2023 09:23:12 +0200 (CEST)
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
X-Inumbo-ID: 06b8f9dc-7175-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 5/8] x86/pci: address a violation of MISRA C:2012 Rule 8.2
Date: Mon, 23 Oct 2023 09:23:00 +0200
Message-Id: <19fce0e146462d713e3f7dfd816f87b35a94636b.1698045505.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698045505.git.federico.serafini@bugseng.com>
References: <cover.1698045505.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter name. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/pci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index f4a58c8acf..542e284f14 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -37,7 +37,7 @@ struct arch_pci_dev {
 int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
                              unsigned int reg, unsigned int size,
                              uint32_t *data);
-int pci_msi_conf_write_intercept(struct pci_dev *, unsigned int reg,
+int pci_msi_conf_write_intercept(struct pci_dev *pdev, unsigned int reg,
                                  unsigned int size, uint32_t *data);
 bool_t pci_mmcfg_decode(unsigned long mfn, unsigned int *seg,
                         unsigned int *bdf);
-- 
2.34.1


