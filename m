Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C89168BAD51
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2024 15:14:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716424.1118535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2sk9-0001JD-Dh; Fri, 03 May 2024 13:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716424.1118535; Fri, 03 May 2024 13:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2sk9-0001G9-B4; Fri, 03 May 2024 13:14:29 +0000
Received: by outflank-mailman (input) for mailman id 716424;
 Fri, 03 May 2024 13:14:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IauD=MG=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1s2sk7-0001FM-Tt
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 13:14:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 110cc71b-094f-11ef-909c-e314d9c70b13;
 Fri, 03 May 2024 15:14:26 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-79-36-52-167.retail.telecomitalia.it [79.36.52.167])
 by support.bugseng.com (Postfix) with ESMTPSA id 9ECE44EE0738;
 Fri,  3 May 2024 15:14:25 +0200 (CEST)
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
X-Inumbo-ID: 110cc71b-094f-11ef-909c-e314d9c70b13
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH] automation/eclair: hide reports coming from adopted code in scheduled analysis
Date: Fri,  3 May 2024 15:14:11 +0200
Message-Id: <65364e87637d342b6b6ca5bd5ca256828ecb7a55.1714741931.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To improve clarity and ease of navigation do not show reports related
to adopted code in the scheduled analysis.
Configuration options are commented out because they may be useful
in the future.

Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 .../eclair_analysis/ECLAIR/analysis.ecl       | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/analysis.ecl b/automation/eclair_analysis/ECLAIR/analysis.ecl
index 66ed7f952c..67be38f03c 100644
--- a/automation/eclair_analysis/ECLAIR/analysis.ecl
+++ b/automation/eclair_analysis/ECLAIR/analysis.ecl
@@ -4,11 +4,11 @@
 
 setq(data_dir,getenv("ECLAIR_DATA_DIR"))
 setq(analysis_kind,getenv("ANALYSIS_KIND"))
-setq(scheduled_analysis,nil)
+# setq(scheduled_analysis,nil)
 
-strings_map("scheduled-analysis",500,"","^.*scheduled$",0,setq(scheduled_analysis,t))
-strings_map("scheduled-analysis",500,"","^.*$",0)
-map_strings("scheduled-analysis",analysis_kind)
+# strings_map("scheduled-analysis",500,"","^.*scheduled$",0,setq(scheduled_analysis,t))
+# strings_map("scheduled-analysis",500,"","^.*$",0)
+# map_strings("scheduled-analysis",analysis_kind)
 
 -verbose
 
@@ -25,12 +25,16 @@ map_strings("scheduled-analysis",analysis_kind)
 -doc="Initially, there are no files tagged as adopted."
 -file_tag+={adopted,"none()"}
 
-if(not(scheduled_analysis),
-    eval_file("adopted.ecl")
-)
-if(not(scheduled_analysis),
-    eval_file("out_of_scope.ecl")
-)
+# if(not(scheduled_analysis),
+#     eval_file("adopted.ecl")
+# )
+# if(not(scheduled_analysis),
+#     eval_file("out_of_scope.ecl")
+# )
+
+-eval_file=adopted.ecl
+-eval_file=out_of_scope.ecl
+
 -eval_file=deviations.ecl
 -eval_file=call_properties.ecl
 -eval_file=tagging.ecl
-- 
2.34.1


