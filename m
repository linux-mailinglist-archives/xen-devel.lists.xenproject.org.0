Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61265748803
	for <lists+xen-devel@lfdr.de>; Wed,  5 Jul 2023 17:27:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559312.874260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Pc-0003LY-JZ; Wed, 05 Jul 2023 15:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559312.874260; Wed, 05 Jul 2023 15:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qH4Pc-0003Gw-7e; Wed, 05 Jul 2023 15:27:24 +0000
Received: by outflank-mailman (input) for mailman id 559312;
 Wed, 05 Jul 2023 15:27:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yX3c=CX=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qH4Pa-0001UO-GN
 for xen-devel@lists.xenproject.org; Wed, 05 Jul 2023 15:27:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f9c2b0d-1b48-11ee-b237-6b7b168915f2;
 Wed, 05 Jul 2023 17:27:22 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.163.248.64])
 by support.bugseng.com (Postfix) with ESMTPSA id E83FE4EE0C97;
 Wed,  5 Jul 2023 17:27:20 +0200 (CEST)
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
X-Inumbo-ID: 6f9c2b0d-1b48-11ee-b237-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v2 08/13] xen/pci: fix violations of MISRA C:2012 Rule 7.2
Date: Wed,  5 Jul 2023 17:26:30 +0200
Message-Id: <b921f7a9a13475da9fe4c71b5cf7173bab55b439.1688559115.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688559115.git.gianluca.luparini@bugseng.com>
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type and also to other
literals used in the same contexts or near violations, when their positive
nature is immediately clear. The latter changes are done for the sake of
uniformity.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- minor change to commit title
- change commit message
---
 xen/drivers/passthrough/pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 07d1986d33..95846e84f2 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -990,8 +990,8 @@ bool_t __init pci_device_detect(u16 seg, u8 bus, u8 dev, u8 func)
 
     vendor = pci_conf_read32(PCI_SBDF(seg, bus, dev, func), PCI_VENDOR_ID);
     /* some broken boards return 0 or ~0 if a slot is empty: */
-    if ( (vendor == 0xffffffff) || (vendor == 0x00000000) ||
-         (vendor == 0x0000ffff) || (vendor == 0xffff0000) )
+    if ( (vendor == 0xffffffffU) || (vendor == 0x00000000U) ||
+         (vendor == 0x0000ffffU) || (vendor == 0xffff0000U) )
         return 0;
     return 1;
 }
-- 
2.41.0


