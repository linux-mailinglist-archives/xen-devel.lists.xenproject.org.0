Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4BE90A8DA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 10:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.741922.1148636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8BA-0006Df-Ij; Mon, 17 Jun 2024 08:57:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 741922.1148636; Mon, 17 Jun 2024 08:57:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ8BA-00064K-Ds; Mon, 17 Jun 2024 08:57:32 +0000
Received: by outflank-mailman (input) for mailman id 741922;
 Mon, 17 Jun 2024 08:57:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UpZp=NT=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sJ8B9-0005Fp-6F
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 08:57:31 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9fb5934f-2c87-11ef-90a3-e314d9c70b13;
 Mon, 17 Jun 2024 10:57:28 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id DE8B74EE0739;
 Mon, 17 Jun 2024 10:57:27 +0200 (CEST)
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
X-Inumbo-ID: 9fb5934f-2c87-11ef-90a3-e314d9c70b13
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
Subject: [XEN PATCH v2 6/6][RESEND] automation/eclair_analysis: clean ECLAIR configuration scripts
Date: Mon, 17 Jun 2024 10:57:18 +0200
Message-Id: <120e7e4579b931c08d28d0a96848af1df7a07f7d.1718378539.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718378539.git.nicola.vetrini@bugseng.com>
References: <cover.1718378539.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove from the ECLAIR integration scripts an unused option, which
was already ignored, and make the help texts consistent
with the rest of the scripts.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
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

