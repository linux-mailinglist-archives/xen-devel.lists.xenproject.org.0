Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CCF7F75E8
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 15:05:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640732.999374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnU-0005WF-F3; Fri, 24 Nov 2023 14:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640732.999374; Fri, 24 Nov 2023 14:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6WnU-0005PS-B5; Fri, 24 Nov 2023 14:04:44 +0000
Received: by outflank-mailman (input) for mailman id 640732;
 Fri, 24 Nov 2023 14:04:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wuqv=HF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r6WnS-0005N0-Ea
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 14:04:42 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 693b14e9-8ad2-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 15:04:41 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.237.167])
 by support.bugseng.com (Postfix) with ESMTPSA id DE3034EE0C8B;
 Fri, 24 Nov 2023 15:04:39 +0100 (CET)
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
X-Inumbo-ID: 693b14e9-8ad2-11ee-98e2-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 01/11] xen/console: address violations of MISRA C:2012 Rule 8.2
Date: Fri, 24 Nov 2023 15:03:16 +0100
Message-Id: <c79bcd4dd33cd448e5eba21defff1c928f064079.1700832962.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700832962.git.federico.serafini@bugseng.com>
References: <cover.1700832962.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter names. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/char/console.c | 4 ++--
 xen/include/xen/console.h  | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 946af5e625..0666564ec9 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -393,9 +393,9 @@ long read_console_ring(struct xen_sysctl_readconsole *op)
 static char serial_rx_ring[SERIAL_RX_SIZE];
 static unsigned int serial_rx_cons, serial_rx_prod;
 
-static void (*serial_steal_fn)(const char *, size_t nr) = early_puts;
+static void (*serial_steal_fn)(const char *str, size_t nr) = early_puts;
 
-int console_steal(int handle, void (*fn)(const char *, size_t nr))
+int console_steal(int handle, void (*fn)(const char *str, size_t nr))
 {
     if ( (handle == -1) || (handle != sercon_handle) )
         return 0;
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index ab5c30c0da..68759862e8 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -36,7 +36,7 @@ struct domain *console_input_domain(void);
  * Steal output from the console. Returns +ve identifier, else -ve error.
  * Takes the handle of the serial line to steal, and steal callback function.
  */
-int console_steal(int handle, void (*fn)(const char *, size_t nr));
+int console_steal(int handle, void (*fn)(const char *str, size_t nr));
 
 /* Give back stolen console. Takes the identifier returned by console_steal. */
 void console_giveback(int id);
-- 
2.34.1


