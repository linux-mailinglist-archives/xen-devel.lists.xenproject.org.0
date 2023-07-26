Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C95763836
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 16:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570490.892301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOf2i-0003Ca-Tt; Wed, 26 Jul 2023 13:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570490.892301; Wed, 26 Jul 2023 13:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOf2i-0003A9-Q7; Wed, 26 Jul 2023 13:59:08 +0000
Received: by outflank-mailman (input) for mailman id 570490;
 Wed, 26 Jul 2023 13:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+seJ=DM=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qOf2h-0003A3-83
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 13:59:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9554d16d-2bbc-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 15:59:05 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.163.229.19])
 by support.bugseng.com (Postfix) with ESMTPSA id 26F2E4EE0738;
 Wed, 26 Jul 2023 15:59:04 +0200 (CEST)
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
X-Inumbo-ID: 9554d16d-2bbc-11ee-b242-6b7b168915f2
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
Subject: [XEN PATCH] xen/kernel: change parameter name in add_taint() definition
Date: Wed, 26 Jul 2023 15:58:55 +0200
Message-Id: <5692c7c51de63d67865208be2be7bf011f171540.1690378948.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter name from 'flag' to 'taint' for consistency with
the corresponding declaration.
This addresses a violation of MISRA C:2012 Rule 8.3: "All declarations
of an object or function shall use the same names and type qualifiers".

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/common/kernel.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/kernel.c b/xen/common/kernel.c
index 719b08d6c7..fb919f3d9c 100644
--- a/xen/common/kernel.c
+++ b/xen/common/kernel.c
@@ -397,9 +397,9 @@ char *print_tainted(char *str)
     return str;
 }
 
-void add_taint(unsigned int flag)
+void add_taint(unsigned int taint)
 {
-    tainted |= flag;
+    tainted |= taint;
 }
 
 extern const initcall_t __initcall_start[], __presmp_initcall_end[],
-- 
2.34.1


