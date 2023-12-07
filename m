Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6EE48084F9
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 10:51:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649724.1014558 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBB2P-0004uf-0A; Thu, 07 Dec 2023 09:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649724.1014558; Thu, 07 Dec 2023 09:51:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBB2O-0004r8-T5; Thu, 07 Dec 2023 09:51:20 +0000
Received: by outflank-mailman (input) for mailman id 649724;
 Thu, 07 Dec 2023 09:51:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TliB=HS=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rBB2N-0004o2-Rs
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 09:51:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2b15ea27-94e6-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 10:51:18 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 0F9654EE073A;
 Thu,  7 Dec 2023 10:51:18 +0100 (CET)
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
X-Inumbo-ID: 2b15ea27-94e6-11ee-98e7-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] xen: address violations of MISRA C:2012 Rule 14.4
Date: Thu,  7 Dec 2023 10:48:44 +0100
Message-Id: <3012fb117b4ef6458bdb5cfd046c86bce60a6d51.1701941924.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701941924.git.maria.celeste.cesario@bugseng.com>
References: <cover.1701941924.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 14.4 whose
headline states:
"The controlling expression of an if statement and the controlling
expression of an iteration-statement shall have essentially Boolean type".

Struct domain member is_dying is an anonymous enum designed to act as boolean.
Add deviation to mark its uses in controlling expressions as deliberate.

Signed-off-by: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 docs/misra/deviations.rst                        | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index b0c79741b5..683f2bbfe8 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -321,6 +321,12 @@ statements are deliberate"
 -config=MC3R1.R14.3,statements={deliberate , "wrapped(any(),node(if_stmt))" }
 -doc_end
 
+-doc_begin="The XEN team relies on the fact that the enum is_dying has the
+constant with assigned value 0 act as false and the other ones as true,
+therefore have the same behavior of a boolean"
+-config=MC3R1.R14.4,etypes+={deliberate, "stmt(child(cond,child(expr,ref(^<?domain>?::is_dying$))))","src_type(enum)"}
+-doc_end
+
 #
 # Series 20.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 6e7c4f25b8..eda3c8100c 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -270,6 +270,12 @@ Deviations related to MISRA C:2012 Rules:
        statements are deliberate.
      - Project-wide deviation; tagged as `disapplied` for ECLAIR.
 
+   * - R14.4
+     - The XEN team relies on the fact that the enum is_dying has the
+       constant with assigned value 0 act as false and the other ones as true,
+       therefore have the same behavior of a boolean.
+     - Project-wide deviation; tagged as `deliberate` for ECLAIR.
+
    * - R20.7
      - Code violating Rule 20.7 is safe when macro parameters are used:
        (1) as function arguments;
-- 
2.40.0


