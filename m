Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C07307E7BCD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 12:24:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630175.982877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Pbn-0004Is-H9; Fri, 10 Nov 2023 11:23:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630175.982877; Fri, 10 Nov 2023 11:23:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1Pbn-0004H6-DL; Fri, 10 Nov 2023 11:23:31 +0000
Received: by outflank-mailman (input) for mailman id 630175;
 Fri, 10 Nov 2023 11:23:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rc0j=GX=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1r1Pbm-0004Fi-0x
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 11:23:30 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92625068-7fbb-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 12:23:28 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.162.14.154])
 by support.bugseng.com (Postfix) with ESMTPSA id BD4E54EE073C;
 Fri, 10 Nov 2023 12:23:27 +0100 (CET)
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
X-Inumbo-ID: 92625068-7fbb-11ee-98da-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation/eclair: add a deviation for MISRA C:2012 Rule 8.6
Date: Fri, 10 Nov 2023 12:23:21 +0100
Message-Id: <4de6c01f8af987750e578b3d5733dcd4ca536a9b.1699615143.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to take into account the standard search
procedure adopted by Unix linkers.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index d8170106b4..43648232aa 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -214,6 +214,15 @@ definition is compiled-out or optimized-out by the compiler)"
 -config=MC3R1.R8.6,reports+={deliberate, "first_area(^.*has no definition$)"}
 -doc_end
 
+-doc_begin="For functions memcpy(), memmove() and memset(), if there are
+multiple definitions, those belong to different archives and the behavior of
+linking is well defined by the toolchain: only one of the definitions will be
+linked in (the first that is encountered searching the archives in the order
+they appear on the command line)."
+-config=MC3R1.R8.6,declarations+={deliberate, "name(memcpy||memmove||memset)"}
+-doc_end
+
+
 -doc_begin="The gnu_inline attribute without static is deliberately allowed."
 -config=MC3R1.R8.10,declarations+={deliberate,"property(gnu_inline)"}
 -doc_end
-- 
2.34.1


