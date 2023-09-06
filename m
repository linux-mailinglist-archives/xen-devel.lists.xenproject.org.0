Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A74793AC3
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 13:09:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596484.930420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdqPZ-0005qD-NF; Wed, 06 Sep 2023 11:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596484.930420; Wed, 06 Sep 2023 11:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdqPZ-0005mp-KI; Wed, 06 Sep 2023 11:09:29 +0000
Received: by outflank-mailman (input) for mailman id 596484;
 Wed, 06 Sep 2023 11:09:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T1xS=EW=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qdqPX-0005Hp-E2
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 11:09:27 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d726772e-4ca5-11ee-9b0d-b553b5be7939;
 Wed, 06 Sep 2023 13:09:25 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 183954EE073A;
 Wed,  6 Sep 2023 13:09:25 +0200 (CEST)
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
X-Inumbo-ID: d726772e-4ca5-11ee-9b0d-b553b5be7939
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH v2 2/2] automation: execute SAF translation before the analysis with ECLAIR
Date: Wed,  6 Sep 2023 13:09:09 +0200
Message-Id: <8d4dba44bf70de642d3128cd11785ebdf1fce421.1693998375.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693998375.git.nicola.vetrini@bugseng.com>
References: <cover.1693998375.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows local MISRA deviation comments to be translated into
the format recognized by ECLAIR.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 automation/eclair_analysis/prepare.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/eclair_analysis/prepare.sh b/automation/eclair_analysis/prepare.sh
index 275a1a3f517c..0cac5eba00ae 100755
--- a/automation/eclair_analysis/prepare.sh
+++ b/automation/eclair_analysis/prepare.sh
@@ -38,5 +38,8 @@ fi
     cd xen
     cp "${CONFIG_FILE}" .config
     make clean
+    find . -type f -name "*.safparse" -print -delete
     make -f ${script_dir}/Makefile.prepare prepare
+    # Translate the /* SAF-n-safe */ comments into ECLAIR CBTs
+    scripts/xen-analysis.py --run-eclair --no-build --no-clean
 )
-- 
2.34.1


