Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD5D918261
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 15:29:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748861.1156844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMShy-0004Mx-Gd; Wed, 26 Jun 2024 13:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748861.1156844; Wed, 26 Jun 2024 13:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMShy-0004E6-5m; Wed, 26 Jun 2024 13:29:10 +0000
Received: by outflank-mailman (input) for mailman id 748861;
 Wed, 26 Jun 2024 13:29:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tE4=N4=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sMShw-00030P-7K
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 13:29:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0fb3cafe-33c0-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 15:29:06 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.214])
 by support.bugseng.com (Postfix) with ESMTPSA id A216B4EE0759;
 Wed, 26 Jun 2024 15:29:05 +0200 (CEST)
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
X-Inumbo-ID: 0fb3cafe-33c0-11ef-b4bb-af5377834399
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
Subject: [XEN PATCH v2 for-4.20 6/7] automation/eclair_analysis: clean ECLAIR configuration scripts
Date: Wed, 26 Jun 2024 15:28:52 +0200
Message-Id: <ab4a52b5f8d7362d9911bbd97b203f5053f57003.1719407840.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719407840.git.nicola.vetrini@bugseng.com>
References: <cover.1719407840.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove from the ECLAIR integration scripts an unused option, which
was already ignored, and make the help texts consistent
with the rest of the scripts.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 automation/eclair_analysis/ECLAIR/analyze.sh | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/analyze.sh b/automation/eclair_analysis/ECLAIR/analyze.sh
index 0ea5520c93a6..e96456c3c18d 100755
--- a/automation/eclair_analysis/ECLAIR/analyze.sh
+++ b/automation/eclair_analysis/ECLAIR/analyze.sh
@@ -11,7 +11,7 @@ fatal() {
 }
 
 usage() {
-  fatal "Usage: ${script_name} <ARM64|X86_64> <Set0|Set1|Set2|Set3>"
+  fatal "Usage: ${script_name} <ARM64|X86_64> <accepted|monitored>"
 }
 
 if [[ $# -ne 2 ]]; then
@@ -40,7 +40,6 @@ ECLAIR_REPORT_LOG=${ECLAIR_OUTPUT_DIR}/REPORT.log
 if [[ "$1" = "X86_64" ]]; then
   export CROSS_COMPILE=
   export XEN_TARGET_ARCH=x86_64
-  EXTRA_ECLAIR_ENV_OPTIONS=-disable=MC3R1.R20.7
 elif [[ "$1" = "ARM64" ]]; then
   export CROSS_COMPILE=aarch64-linux-gnu-
   export XEN_TARGET_ARCH=arm64
-- 
2.34.1

