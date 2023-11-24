Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E99B67F7A6E
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 18:31:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640861.999621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6a0g-00035Q-LB; Fri, 24 Nov 2023 17:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640861.999621; Fri, 24 Nov 2023 17:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6a0g-0002vB-HC; Fri, 24 Nov 2023 17:30:34 +0000
Received: by outflank-mailman (input) for mailman id 640861;
 Fri, 24 Nov 2023 17:30:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB6C=HF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r6a0e-0002YK-97
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 17:30:32 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29794bea-8aef-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 18:30:29 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 9D7834EE0747;
 Fri, 24 Nov 2023 18:30:28 +0100 (CET)
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
X-Inumbo-ID: 29794bea-8aef-11ee-9b0e-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Subject: [XEN PATCH v2 3/3] xen: address violations of MISRA C:2012 Rule 13.1
Date: Fri, 24 Nov 2023 18:29:43 +0100
Message-Id: <771a6f804f4e7dda3897359b57d1d14c2878ea16.1700844359.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700844359.git.simone.ballarin@bugseng.com>
References: <cover.1700844359.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 13.1: Initializer lists shall not contain persistent side effects

The assignment operation in:

.irq = rc = uart->irq,

is a persistent side effect in a struct initializer list.

This patch avoids rc assignment and directly uses uart->irq
in the following if statement.

No functional changes.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

---
Changes in v2:
- avoid assignment of rc;
- drop changes in vcpu_yield(void).
---
 xen/drivers/char/ns16550.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index ddf2a48be6..644a3192bb 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -445,11 +445,13 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
             struct msi_info msi = {
                 .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
                                  uart->ps_bdf[2]),
-                .irq = rc = uart->irq,
+                .irq = uart->irq,
                 .entry_nr = 1
             };
 
-            if ( rc > 0 )
+            rc = 0;
+
+            if ( uart->irq > 0 )
             {
                 struct msi_desc *msi_desc = NULL;
 
-- 
2.34.1


