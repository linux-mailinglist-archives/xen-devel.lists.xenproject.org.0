Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA72846C40
	for <lists+xen-devel@lfdr.de>; Fri,  2 Feb 2024 10:39:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674921.1050107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVq0Q-00064u-Ej; Fri, 02 Feb 2024 09:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674921.1050107; Fri, 02 Feb 2024 09:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVq0Q-000631-6G; Fri, 02 Feb 2024 09:38:42 +0000
Received: by outflank-mailman (input) for mailman id 674921;
 Fri, 02 Feb 2024 09:38:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lYVL=JL=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rVq0P-0005sE-4a
 for xen-devel@lists.xenproject.org; Fri, 02 Feb 2024 09:38:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d86c3a85-c1ae-11ee-98f5-efadbce2ee36;
 Fri, 02 Feb 2024 10:38:39 +0100 (CET)
Received: from beta.station (net-188-218-67-100.cust.vodafonedsl.it
 [188.218.67.100])
 by support.bugseng.com (Postfix) with ESMTPSA id 2BA274EE073C;
 Fri,  2 Feb 2024 10:38:38 +0100 (CET)
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
X-Inumbo-ID: d86c3a85-c1ae-11ee-98f5-efadbce2ee36
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Subject: [PATCH v3 2/4] xen/ns16550: address violations of MISRA C:2012 Rule 13.1
Date: Fri,  2 Feb 2024 10:37:45 +0100
Message-Id: <d1fb1baae24cf0b0b2826ed531abab12950f93cd.1706700228.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706700228.git.maria.celeste.cesario@bugseng.com>
References: <cover.1706700228.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 13.1: Initializer lists shall not contain persistent side effects

The assignment operation in:

.irq = rc = uart->irq,

is a persistent side effect in a struct initializer list.

This patch assigns rc separately outside the structure.

No functional change.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>

---
Changes in v3:
- add assignment of rc;
- use rc as controlling expression in the following if-statement;
- change prefix from xen to xen/ns16550.
Changes in v2:
- avoid assignment of rc;
- drop changes in vcpu_yield(void).
---
 xen/drivers/char/ns16550.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index afe3d514b9..97bf098534 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -441,10 +441,12 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
             struct msi_info msi = {
                 .sbdf = PCI_SBDF(0, uart->ps_bdf[0], uart->ps_bdf[1],
                                  uart->ps_bdf[2]),
-                .irq = rc = uart->irq,
+                .irq = uart->irq,
                 .entry_nr = 1
             };
 
+            rc = uart->irq;
+
             if ( rc > 0 )
             {
                 struct msi_desc *msi_desc = NULL;
-- 
2.40.0


