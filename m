Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0223A7D2B33
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 09:23:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620997.966979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupHT-0004xd-31; Mon, 23 Oct 2023 07:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620997.966979; Mon, 23 Oct 2023 07:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupHS-0004lA-Q3; Mon, 23 Oct 2023 07:23:18 +0000
Received: by outflank-mailman (input) for mailman id 620997;
 Mon, 23 Oct 2023 07:23:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWHG=GF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qupHQ-0003Or-Ij
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 07:23:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 079c699c-7175-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 09:23:14 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-95-247-204-25.retail.telecomitalia.it [95.247.204.25])
 by support.bugseng.com (Postfix) with ESMTPSA id 524474EE0745;
 Mon, 23 Oct 2023 09:23:14 +0200 (CEST)
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
X-Inumbo-ID: 079c699c-7175-11ee-9b0e-b553b5be7939
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 8/8] x86/sysctl: address a violation of MISRA C:2012 Rule 8.2
Date: Mon, 23 Oct 2023 09:23:03 +0200
Message-Id: <06004789b921a35632bd7126bf022e20c15052ef.1698045505.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698045505.git.federico.serafini@bugseng.com>
References: <cover.1698045505.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter name. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/sysctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index c107f40c62..1d40d82c5a 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -118,7 +118,7 @@ long arch_do_sysctl(
         unsigned int cpu = sysctl->u.cpu_hotplug.cpu;
         unsigned int op  = sysctl->u.cpu_hotplug.op;
         bool plug;
-        long (*fn)(void *);
+        long (*fn)(void *data);
         void *hcpu;
 
         switch ( op )
-- 
2.34.1


