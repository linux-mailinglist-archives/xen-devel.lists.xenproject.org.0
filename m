Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5AA877C25
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691276.1077170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbWF-0001jz-Vg; Mon, 11 Mar 2024 09:00:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691276.1077170; Mon, 11 Mar 2024 09:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbWF-0001TI-AU; Mon, 11 Mar 2024 09:00:27 +0000
Received: by outflank-mailman (input) for mailman id 691276;
 Mon, 11 Mar 2024 09:00:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbWA-0006j9-1F
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c94b92b3-df85-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:00:19 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 0C23F4EE0C9C;
 Mon, 11 Mar 2024 10:00:19 +0100 (CET)
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
X-Inumbo-ID: c94b92b3-df85-11ee-a1ee-f123f15fe8a2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v3 16/16] xen/lz4: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 11 Mar 2024 09:59:25 +0100
Message-Id: <1d02e429534b9b1c53fd3c5b82588e3803434c92.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Add inclusion guard to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order to
prevent the contents of a header file being included more than once").
Mechanical change.
---
Commit introduced in v3

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/common/lz4/defs.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/xen/common/lz4/defs.h b/xen/common/lz4/defs.h
index 6d81113266..ecfbf07f83 100644
--- a/xen/common/lz4/defs.h
+++ b/xen/common/lz4/defs.h
@@ -8,6 +8,9 @@
  * published by the Free Software Foundation.
  */
 
+#ifndef COMMON_LZ4_DEFS_H
+#define COMMON_LZ4_DEFS_H
+
 #ifdef __XEN__
 #include <asm/byteorder.h>
 #include <xen/unaligned.h>
@@ -166,3 +169,5 @@ typedef struct _U64_S { u64 v; } U64_S;
 		LZ4_WILDCOPY(s, d, e);	\
 		d = e;	\
 	} while (0)
+
+#endif /* COMMON_LZ4_DEFS_H */
-- 
2.34.1


