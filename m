Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A52890408B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jun 2024 17:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.738558.1145391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3oh-0005w6-8N; Tue, 11 Jun 2024 15:53:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 738558.1145391; Tue, 11 Jun 2024 15:53:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sH3og-0005qr-RL; Tue, 11 Jun 2024 15:53:46 +0000
Received: by outflank-mailman (input) for mailman id 738558;
 Tue, 11 Jun 2024 15:53:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sLxx=NN=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1sH3of-0005DH-BH
 for xen-devel@lists.xenproject.org; Tue, 11 Jun 2024 15:53:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c850d614-280a-11ef-90a3-e314d9c70b13;
 Tue, 11 Jun 2024 17:53:44 +0200 (CEST)
Received: from nico.bugseng.com (unknown [46.228.253.194])
 by support.bugseng.com (Postfix) with ESMTPSA id 3DA734EE075B;
 Tue, 11 Jun 2024 17:53:44 +0200 (CEST)
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
X-Inumbo-ID: c850d614-280a-11ef-90a3-e314d9c70b13
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: [XEN PATCH 6/6] automation/eclair_analysis: clean ECLAIR configuration scripts
Date: Tue, 11 Jun 2024 17:53:36 +0200
Message-Id: <e5bae94c215d85671ed21c39c5dcc3d67d02bbb0.1718117557.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718117557.git.nicola.vetrini@bugseng.com>
References: <cover.1718117557.git.nicola.vetrini@bugseng.com>
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


