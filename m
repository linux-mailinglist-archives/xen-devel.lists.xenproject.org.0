Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC0E91E10C
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2024 15:45:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.751651.1159674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHLP-0007kU-5M; Mon, 01 Jul 2024 13:45:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 751651.1159674; Mon, 01 Jul 2024 13:45:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sOHLP-0007is-2S; Mon, 01 Jul 2024 13:45:23 +0000
Received: by outflank-mailman (input) for mailman id 751651;
 Mon, 01 Jul 2024 13:45:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FOPt=OB=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sOHLN-0007ig-Ic
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2024 13:45:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28897f44-37b0-11ef-90a5-e314d9c70b13;
 Mon, 01 Jul 2024 15:45:20 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-79-60-221-62.business.telecomitalia.it [79.60.221.62])
 by support.bugseng.com (Postfix) with ESMTPSA id CCD434EE0738;
 Mon,  1 Jul 2024 15:45:17 +0200 (CEST)
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
X-Inumbo-ID: 28897f44-37b0-11ef-90a5-e314d9c70b13
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Subject: [PATCH 13/17] xen: add deviations for MISRA C 2012 Dir D4.10
Date: Mon,  1 Jul 2024 15:45:14 +0200
Message-Id: <f26c90dc93a3862e472afbe630dabfec30e51ffe.1719829101.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719829101.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Nicola Vetrini <nicola.vetrini@bugseng.com>

Add safe deviation for *.c files, as estabilished in past discussion.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>

---
Changes in v4:
- split the commit from the unrelated SAF deviation

Link to the discussion thread:
https://lists.xenproject.org/archives/html/xen-devel/2023-09/msg00239.html
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 5 +++++
 docs/misra/deviations.rst                        | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 1c39a9a16d..c6b1a10bcf 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -78,6 +78,11 @@ conform to the directive."
 -config=MC3R1.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
 -doc_end
 
+-doc_begin="Including multiple times a .c file is safe because every function or data item
+it defines would (in the common case) be already defined. Peer reviewed by the community."
+-config=MC3R1.D4.10,reports+={safe, "all_area(all_loc(^.*\\.c$))"}
+-doc_end
+
 #
 # Series 5.
 #
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 1ecce1469a..a5dac38bb3 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -30,6 +30,13 @@ Deviations related to MISRA C:2012 Directives:
        not to add an additional encapsulation layer.
      - Tagged as `deliberate` for ECLAIR.
 
+   * - D4.10
+     - Including multiple times a .c file is safe because every function or data item
+       it defines would in (the common case) be already defined.
+       Peer reviewed by the community.
+     - Tagged as `safe` for ECLAIR.
+
+
 Deviations related to MISRA C:2012 Rules:
 -----------------------------------------
 
-- 
2.34.1


