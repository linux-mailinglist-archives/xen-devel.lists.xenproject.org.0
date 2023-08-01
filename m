Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E47276B506
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 14:48:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574136.899325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQonf-0002Pj-IT; Tue, 01 Aug 2023 12:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574136.899325; Tue, 01 Aug 2023 12:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQonf-0002Mt-Ed; Tue, 01 Aug 2023 12:48:31 +0000
Received: by outflank-mailman (input) for mailman id 574136;
 Tue, 01 Aug 2023 12:48:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gjSu=DS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qQond-0002MS-I7
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 12:48:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6a4c424-3069-11ee-b25a-6b7b168915f2;
 Tue, 01 Aug 2023 14:48:29 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 0CFED4EE0742;
 Tue,  1 Aug 2023 14:48:27 +0200 (CEST)
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
X-Inumbo-ID: b6a4c424-3069-11ee-b25a-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 2/3] drivers/char: address MISRA C:2012 Rule 5.3
Date: Tue,  1 Aug 2023 14:47:43 +0200
Message-Id: <69fad93eeafdceae5de1f2483015f05d1798b6be.1690893696.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690893696.git.nicola.vetrini@bugseng.com>
References: <cover.1690893696.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following strategies are adopted to deal with violations
of MISRA C:2012 Rule 5.3:
"An identifier declared in an inner scope shall not hide an
identifier declared in an outer scope".

Local variable 'ctrl' shadows a variable defined in an outer scope.
Since the innermost variable is used only once after being set, it is safe
to remove it entirely.

The enum constant 'baud' is shadowed by local a local variable at line
1476, and renaming the enum constant avoid such conflicts.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Renamed the enum constant instead of the local variable 'baud'.
- Removed the inner variable entirely, as it serves no purpose.
---
 xen/drivers/char/ehci-dbgp.c | 4 +---
 xen/drivers/char/ns16550.c   | 6 +++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 4d8d765122..72be4d9cc9 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -424,9 +424,7 @@ static void dbgp_issue_command(struct ehci_dbgp *dbgp, u32 ctrl,
          * checks to see if ACPI or some other initialization also
          * reset the EHCI debug port.
          */
-        u32 ctrl = readl(&dbgp->ehci_debug->control);
-
-        if ( ctrl & DBGP_ENABLED )
+        if ( readl(&dbgp->ehci_debug->control) & DBGP_ENABLED )
         {
             cmd |= CMD_RUN;
             writel(cmd, &dbgp->ehci_regs->command);
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 212a9c49ae..b75e7f8fa0 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -1388,7 +1388,7 @@ string_param("com1", opt_com1);
 string_param("com2", opt_com2);
 
 enum serial_param_type {
-    baud,
+    baud_rate,
     clock_hz,
     data_bits,
     io_base,
@@ -1416,7 +1416,7 @@ struct serial_param_var {
  * com_console_options for serial port com1 and com2.
  */
 static const struct serial_param_var __initconst sp_vars[] = {
-    {"baud", baud},
+    {"baud", baud_rate},
     {"clock-hz", clock_hz},
     {"data-bits", data_bits},
     {"io-base", io_base},
@@ -1596,7 +1596,7 @@ static bool __init parse_namevalue_pairs(char *str, struct ns16550 *uart)
 
         switch ( get_token(token, &param_value) )
         {
-        case baud:
+        case baud_rate:
             uart->baud = simple_strtoul(param_value, NULL, 0);
             break;
 
-- 
2.34.1


