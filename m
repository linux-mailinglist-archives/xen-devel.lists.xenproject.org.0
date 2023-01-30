Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1E0680B85
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 12:02:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486882.754287 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMRv5-00015r-A8; Mon, 30 Jan 2023 11:01:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486882.754287; Mon, 30 Jan 2023 11:01:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMRv5-0000zr-3p; Mon, 30 Jan 2023 11:01:51 +0000
Received: by outflank-mailman (input) for mailman id 486882;
 Mon, 30 Jan 2023 11:01:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VtRO=53=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pMRv4-0000xa-1D
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 11:01:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7d21635d-a08d-11ed-b8d1-410ff93cb8f0;
 Mon, 30 Jan 2023 12:01:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B02D16F3;
 Mon, 30 Jan 2023 03:02:28 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 268BC3F71E;
 Mon, 30 Jan 2023 03:01:45 -0800 (PST)
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
X-Inumbo-ID: 7d21635d-a08d-11ed-b8d1-410ff93cb8f0
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 1/2] xen/cppcheck: sort alphabetically cppcheck report entries
Date: Mon, 30 Jan 2023 11:01:31 +0000
Message-Id: <20230130110132.2774782-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230130110132.2774782-1-luca.fancellu@arm.com>
References: <20230130110132.2774782-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sort alphabetically cppcheck report entries when producing the text
report, this will help comparing different reports and will group
together findings from the same file.

The sort operation is performed with two criteria, the first one is
sorting by misra rule, the second one is sorting by file.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes in v2:
 - Sort with two criteria, first misra rule, second filename
   (Michal, Jan)
---
---
 xen/scripts/xen_analysis/cppcheck_report_utils.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/scripts/xen_analysis/cppcheck_report_utils.py b/xen/scripts/xen_analysis/cppcheck_report_utils.py
index 02440aefdfec..0b6cc72b9ac1 100644
--- a/xen/scripts/xen_analysis/cppcheck_report_utils.py
+++ b/xen/scripts/xen_analysis/cppcheck_report_utils.py
@@ -104,6 +104,13 @@ def cppcheck_merge_txt_fragments(fragments_list, out_txt_file, strip_paths):
                 for path in strip_paths:
                     text_report_content[i] = text_report_content[i].replace(
                                                                 path + "/", "")
+                    # Split by : separator
+                    text_report_content[i] = text_report_content[i].split(":")
+            # sort alphabetically for second field (misra rule) and as second
+            # criteria for the first field (file name)
+            text_report_content.sort(key = lambda x: (x[1], x[0]))
+            # merge back with : separator
+            text_report_content = [":".join(x) for x in text_report_content]
             # Write the final text report
             outfile.writelines(text_report_content)
     except OSError as e:
-- 
2.25.1


