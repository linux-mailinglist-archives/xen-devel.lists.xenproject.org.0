Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0041C85A496
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 14:25:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682852.1062050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc3e7-0008Bi-Kz; Mon, 19 Feb 2024 13:25:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682852.1062050; Mon, 19 Feb 2024 13:25:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc3e7-00089g-IG; Mon, 19 Feb 2024 13:25:23 +0000
Received: by outflank-mailman (input) for mailman id 682852;
 Mon, 19 Feb 2024 13:25:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NiMn=J4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1rc3e6-00089a-Mg
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 13:25:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54b036c9-cf2a-11ee-8a52-1f161083a0e0;
 Mon, 19 Feb 2024 14:25:21 +0100 (CET)
Received: from Dell.bugseng.com (unknown [37.161.73.215])
 by support.bugseng.com (Postfix) with ESMTPSA id E01804EE073A;
 Mon, 19 Feb 2024 14:25:19 +0100 (CET)
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
X-Inumbo-ID: 54b036c9-cf2a-11ee-8a52-1f161083a0e0
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] automation/eclair: add deviation for MISRA C:2012 Rule 16.3
Date: Mon, 19 Feb 2024 14:24:41 +0100
Message-Id: <b1d2b64c8117d61ea42cf4e9feae128541eb0b61.1708348799.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update ECLAIR configuration to consider safe switch clauses ending
with __{get,put}_user_bad().

Update docs/misra/deviations.rst accordingly.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
 docs/misra/deviations.rst                        | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index fd32ff8a9c..831b5d4c67 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -368,6 +368,10 @@ safe."
 -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/BUG\\(\\);/))))"}
 -doc_end
 
+-doc_begin="Switch clauses ending with constructs \"__get_user_bad()\" and \"__put_user_bad()\" are safe: they denote an unreachable program point."
+-config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(/__(put|get)_user_bad\\(\\);/))))"}
+-doc_end
+
 -doc_begin="Switch clauses not ending with the break statement are safe if an
 explicit comment indicating the fallthrough intention is present."
 -config=MC3R1.R16.3,reports+={safe, "any_area(end_loc(any_exp(text(^(?s).*/\\* [fF]all ?through.? \\*/.*$,0..1))))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 123c78e20a..58f4fac18e 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -307,6 +307,12 @@ Deviations related to MISRA C:2012 Rules:
      - Switch clauses ending with failure method \"BUG()\" are safe.
      - Tagged as `safe` for ECLAIR.
 
+   * - R16.3
+     - Switch clauses ending with constructs
+       \"__get_user_bad()\" and \"__put_user_bad()\" are safe:
+       they denote an unreachable program point.
+     - Tagged as `safe` for ECLAIR.
+
    * - R16.3
      - Existing switch clauses not ending with the break statement are safe if
        an explicit comment indicating the fallthrough intention is present.
-- 
2.34.1


