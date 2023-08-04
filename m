Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B703D7704A8
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 17:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577192.904164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwis-0008Ks-Sd; Fri, 04 Aug 2023 15:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577192.904164; Fri, 04 Aug 2023 15:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwis-0008Ee-Ko; Fri, 04 Aug 2023 15:28:14 +0000
Received: by outflank-mailman (input) for mailman id 577192;
 Fri, 04 Aug 2023 15:28:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRwir-00080a-0c
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 15:28:13 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 85a05acc-32db-11ee-b26d-6b7b168915f2;
 Fri, 04 Aug 2023 17:28:11 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C05BB4EE0742;
 Fri,  4 Aug 2023 17:28:10 +0200 (CEST)
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
X-Inumbo-ID: 85a05acc-32db-11ee-b26d-6b7b168915f2
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
Subject: [XEN PATCH 3/6] xen/delay: address MISRA C:2012 Rule 5.3.
Date: Fri,  4 Aug 2023 17:27:46 +0200
Message-Id: <e67bd46f204bef64cefdbe7a0b447148f7f9c9c6.1691162261.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691162261.git.nicola.vetrini@bugseng.com>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'msec' shadows the local variable in
'ehci_dbgp_bios_handoff', but to prevent any future clashes, the one in
the macro gains a suffix.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Unless that file should remain as-is, because it's clearly taken from
linux, but this does not prevent future name clashes with msec.
---
 xen/include/xen/delay.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/delay.h b/xen/include/xen/delay.h
index 9d70ef035f..f2d9270e83 100644
--- a/xen/include/xen/delay.h
+++ b/xen/include/xen/delay.h
@@ -5,6 +5,6 @@
 
 #include <asm/delay.h>
 #define mdelay(n) (\
-	{unsigned long msec=(n); while (msec--) udelay(1000);})
+	{unsigned long msec_=(n); while (msec_--) udelay(1000);})
 
 #endif /* defined(_LINUX_DELAY_H) */
-- 
2.34.1


