Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5B0709310
	for <lists+xen-devel@lfdr.de>; Fri, 19 May 2023 11:30:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536851.835573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwRX-0003eZ-Bf; Fri, 19 May 2023 09:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536851.835573; Fri, 19 May 2023 09:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzwRX-0003dg-7T; Fri, 19 May 2023 09:30:35 +0000
Received: by outflank-mailman (input) for mailman id 536851;
 Fri, 19 May 2023 09:30:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Umm=BI=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pzwRV-00038Z-G5
 for xen-devel@lists.xenproject.org; Fri, 19 May 2023 09:30:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cd4ebcb5-f627-11ed-b22d-6b7b168915f2;
 Fri, 19 May 2023 11:30:32 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2864015BF;
 Fri, 19 May 2023 02:31:17 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16E1C3F73F;
 Fri, 19 May 2023 02:30:30 -0700 (PDT)
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
X-Inumbo-ID: cd4ebcb5-f627-11ed-b22d-6b7b168915f2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] xen/misra: xen-analysis.py: Fix latent bug
Date: Fri, 19 May 2023 10:30:18 +0100
Message-Id: <20230519093019.2131896-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230519093019.2131896-1-luca.fancellu@arm.com>
References: <20230519093019.2131896-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currenly there is a latent bug that is not triggered because
the function cppcheck_merge_txt_fragments is called with the
parameter strip_paths having a list of only one element.

The bug is that the split function should not be in the
loop for strip_paths, but one level before, fix it.

Fixes: 02b26c02c7c4 ("xen/scripts: add cppcheck tool to the xen-analysis.py script")
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/scripts/xen_analysis/cppcheck_report_utils.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/scripts/xen_analysis/cppcheck_report_utils.py b/xen/scripts/xen_analysis/cppcheck_report_utils.py
index c5f466aff141..fdc299c7e029 100644
--- a/xen/scripts/xen_analysis/cppcheck_report_utils.py
+++ b/xen/scripts/xen_analysis/cppcheck_report_utils.py
@@ -104,8 +104,8 @@ def cppcheck_merge_txt_fragments(fragments_list, out_txt_file, strip_paths):
                 for path in strip_paths:
                     text_report_content[i] = text_report_content[i].replace(
                                                                 path + "/", "")
-                    # Split by : separator
-                    text_report_content[i] = text_report_content[i].split(":")
+                # Split by : separator
+                text_report_content[i] = text_report_content[i].split(":")
 
             # sort alphabetically for second field (misra rule) and as second
             # criteria for the first field (file name)
-- 
2.34.1


