Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C82497900C7
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 18:35:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594674.928073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc76W-000201-8k; Fri, 01 Sep 2023 16:34:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594674.928073; Fri, 01 Sep 2023 16:34:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc76W-0001xn-5G; Fri, 01 Sep 2023 16:34:40 +0000
Received: by outflank-mailman (input) for mailman id 594674;
 Fri, 01 Sep 2023 16:34:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TF5h=ER=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qc76T-0001xb-Ux
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 16:34:37 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 706bcf97-48e5-11ee-8783-cb3800f73035;
 Fri, 01 Sep 2023 18:34:36 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id ED42F4EE073A;
 Fri,  1 Sep 2023 18:34:35 +0200 (CEST)
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
X-Inumbo-ID: 706bcf97-48e5-11ee-8783-cb3800f73035
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
Subject: [XEN PATCH 2/2] automation: execute SAF translation before the analysis with ECLAIR
Date: Fri,  1 Sep 2023 18:34:20 +0200
Message-Id: <b766ea02253f76d9aaacf06a1ffba8bab45ca0b8.1693585223.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693585223.git.nicola.vetrini@bugseng.com>
References: <cover.1693585223.git.nicola.vetrini@bugseng.com>
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


