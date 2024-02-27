Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7CB869A89
	for <lists+xen-devel@lfdr.de>; Tue, 27 Feb 2024 16:37:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686235.1068011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rezWM-0000B1-R0; Tue, 27 Feb 2024 15:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686235.1068011; Tue, 27 Feb 2024 15:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rezWM-00007l-Nr; Tue, 27 Feb 2024 15:37:30 +0000
Received: by outflank-mailman (input) for mailman id 686235;
 Tue, 27 Feb 2024 15:37:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NOTz=KE=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rezWL-00007f-Gc
 for xen-devel@lists.xenproject.org; Tue, 27 Feb 2024 15:37:29 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c4478d5-d586-11ee-a1ee-f123f15fe8a2;
 Tue, 27 Feb 2024 16:37:27 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.dsl.teletu.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 7B29A4EE0742;
 Tue, 27 Feb 2024 16:37:26 +0100 (CET)
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
X-Inumbo-ID: 1c4478d5-d586-11ee-a1ee-f123f15fe8a2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] docs: Move function and macro properties in docs/misra
Date: Tue, 27 Feb 2024 16:36:30 +0100
Message-Id: <ee28804796625835688069997a06b719d0739b9b.1709048153.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The list of function/macro properties is not MISRA-specific documentation.
Their addition was directly motivated to address MISRA findings and they
are not used elsewhere. For this reason, this patch moves these properties
in docs/misra.

This patch also fixes a Sphinx warning caused by the missing inclusion
of the rst file in the toctree.

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Fixes: f4519ee8 ("eclair: move function and macro properties outside ECLAIR")
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 automation/eclair_analysis/propertyparser.py                    | 2 +-
 .../function-macro-properties.json}                             | 0
 .../function-macro-properties.rst}                              | 0
 docs/misra/index.rst                                            | 1 +
 4 files changed, 2 insertions(+), 1 deletion(-)
 rename docs/{function_macro_properties.json => misra/function-macro-properties.json} (100%)
 rename docs/{function_macro_properties.rst => misra/function-macro-properties.rst} (100%)

diff --git a/automation/eclair_analysis/propertyparser.py b/automation/eclair_analysis/propertyparser.py
index 0d02f505a6..5059a68fec 100644
--- a/automation/eclair_analysis/propertyparser.py
+++ b/automation/eclair_analysis/propertyparser.py
@@ -2,7 +2,7 @@ import json
 import os
 
 script_dir = os.path.dirname(__file__)
-properties_path = os.path.join(script_dir, "../../docs/function_macro_properties.json")
+properties_path = os.path.join(script_dir, "../../docs/misra/function-macro-properties.json")
 output_path   = os.path.join(script_dir, "ECLAIR/call_properties.ecl")
 
 with open(properties_path) as fp:
diff --git a/docs/function_macro_properties.json b/docs/misra/function-macro-properties.json
similarity index 100%
rename from docs/function_macro_properties.json
rename to docs/misra/function-macro-properties.json
diff --git a/docs/function_macro_properties.rst b/docs/misra/function-macro-properties.rst
similarity index 100%
rename from docs/function_macro_properties.rst
rename to docs/misra/function-macro-properties.rst
diff --git a/docs/misra/index.rst b/docs/misra/index.rst
index 5068ee5aef..bde9d9cffb 100644
--- a/docs/misra/index.rst
+++ b/docs/misra/index.rst
@@ -16,3 +16,4 @@ Xen hypervisor code and related documents.
    documenting-violations
    exclude-list
    xen-static-analysis
+   function-macro-properties
-- 
2.34.1


