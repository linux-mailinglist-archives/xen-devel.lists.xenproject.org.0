Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D24B8B090E
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 14:17:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711374.1111288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzbYr-0000Nr-2l; Wed, 24 Apr 2024 12:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711374.1111288; Wed, 24 Apr 2024 12:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzbYq-0000Ak-UJ; Wed, 24 Apr 2024 12:17:16 +0000
Received: by outflank-mailman (input) for mailman id 711374;
 Wed, 24 Apr 2024 12:12:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RcL4=L5=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1rzbTl-0007vM-Ks
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 12:12:01 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9c9d17a-0233-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 14:11:59 +0200 (CEST)
Received: from LAPTOP-EFA9O91E.localdomain
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id 0A2E74EE073D;
 Wed, 24 Apr 2024 14:11:59 +0200 (CEST)
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
X-Inumbo-ID: d9c9d17a-0233-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 1/2] pci: add suffix 'U' to PCI_CONF_ADDRESS macro.
Date: Wed, 24 Apr 2024 14:11:32 +0200
Message-Id: <10dc3a59085c801c91551625c036fcc9e5eb4729.1713956723.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1713956723.git.alessandro.zucchelli@bugseng.com>
References: <cover.1713956723.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This addresses violations of MISRA C:2012 Rule 7.2 which states as
following: A “u” or “U” suffix shall be applied to all integer constants
that are represented in an unsigned type.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 xen/arch/x86/x86_64/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/x86_64/pci.c b/xen/arch/x86/x86_64/pci.c
index aad1c3f7cf..8d33429103 100644
--- a/xen/arch/x86/x86_64/pci.c
+++ b/xen/arch/x86/x86_64/pci.c
@@ -9,7 +9,7 @@
 #include <asm/io.h>
 
 #define PCI_CONF_ADDRESS(sbdf, reg) \
-    (0x80000000 | ((sbdf).bdf << 8) | ((reg) & ~3))
+    (0x80000000U | ((sbdf).bdf << 8) | ((reg) & ~3))
 
 uint8_t pci_conf_read8(pci_sbdf_t sbdf, unsigned int reg)
 {
-- 
2.25.1


