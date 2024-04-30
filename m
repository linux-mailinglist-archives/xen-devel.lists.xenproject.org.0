Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F1C8B7962
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 16:28:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714938.1116362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oT9-0007uv-Ek; Tue, 30 Apr 2024 14:28:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714938.1116362; Tue, 30 Apr 2024 14:28:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1oT9-0007tA-Ab; Tue, 30 Apr 2024 14:28:31 +0000
Received: by outflank-mailman (input) for mailman id 714938;
 Tue, 30 Apr 2024 14:28:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BF+G=MD=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1s1oT7-00077h-8t
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 14:28:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e94d9a5e-06fd-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 16:28:28 +0200 (CEST)
Received: from nico.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 9FE784EE0755;
 Tue, 30 Apr 2024 16:28:27 +0200 (CEST)
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
X-Inumbo-ID: e94d9a5e-06fd-11ef-909b-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org,
	nicola.vetrini@bugseng.com
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	bertrand.marquis@arm.com,
	julien@xen.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v2 3/3] xen/pci: address violations of MISRA C Rule 20.7
Date: Tue, 30 Apr 2024 16:28:16 +0200
Message-Id: <df48ce446cf6409eda04460109f3082b39c4f618.1714487169.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714487169.git.nicola.vetrini@bugseng.com>
References: <cover.1714487169.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MISRA C Rule 20.7 states: "Expressions resulting from the expansion
of macro parameters shall be enclosed in parentheses". Therefore, some
macro definitions should gain additional parentheses to ensure that all
current and future users will be safe with respect to expansions that
can possibly alter the semantics of the passed-in macro parameter.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/pci_regs.h | 6 +++---
 xen/include/xen/vpci.h     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index 9909b27425a5..0bc18efabb74 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -445,9 +445,9 @@
 #define PCI_EXP_RTSTA		32	/* Root Status */
 
 /* Extended Capabilities (PCI-X 2.0 and Express) */
-#define PCI_EXT_CAP_ID(header)		(header & 0x0000ffff)
-#define PCI_EXT_CAP_VER(header)		((header >> 16) & 0xf)
-#define PCI_EXT_CAP_NEXT(header)	((header >> 20) & 0xffc)
+#define PCI_EXT_CAP_ID(header)		((header) & 0x0000ffff)
+#define PCI_EXT_CAP_VER(header)		(((header) >> 16) & 0xf)
+#define PCI_EXT_CAP_NEXT(header)	(((header) >> 20) & 0xffc)
 
 #define PCI_EXT_CAP_ID_ERR	1
 #define PCI_EXT_CAP_ID_VC	2
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index e89c571890b2..6e4c972f35ed 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -23,7 +23,7 @@ typedef int vpci_register_init_t(struct pci_dev *dev);
 
 #define REGISTER_VPCI_INIT(x, p)                \
   static vpci_register_init_t *const x##_entry  \
-               __used_section(".data.vpci." p) = x
+               __used_section(".data.vpci." p) = (x)
 
 /* Assign vPCI to device by adding handlers. */
 int __must_check vpci_assign_device(struct pci_dev *pdev);
-- 
2.34.1


