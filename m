Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E1B65FF14
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jan 2023 11:41:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.472446.732674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDkA8-0007e6-JD; Fri, 06 Jan 2023 10:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 472446.732674; Fri, 06 Jan 2023 10:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pDkA8-0007bf-GC; Fri, 06 Jan 2023 10:41:24 +0000
Received: by outflank-mailman (input) for mailman id 472446;
 Fri, 06 Jan 2023 10:41:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7O5U=5D=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1pDkA6-0007M7-UG
 for xen-devel@lists.xenproject.org; Fri, 06 Jan 2023 10:41:22 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a8b5b86e-8dae-11ed-91b6-6bf2151ebd3b;
 Fri, 06 Jan 2023 11:41:21 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFFB112FC;
 Fri,  6 Jan 2023 02:42:02 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.195.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C54FB3F23F;
 Fri,  6 Jan 2023 02:41:19 -0800 (PST)
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
X-Inumbo-ID: a8b5b86e-8dae-11ed-91b6-6bf2151ebd3b
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/2] xen/cppcheck: sort alphabetically cppcheck report entries
Date: Fri,  6 Jan 2023 10:41:07 +0000
Message-Id: <20230106104108.14740-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230106104108.14740-1-luca.fancellu@arm.com>
References: <20230106104108.14740-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Sort alphabetically cppcheck report entries when producing the text
report, this will help comparing different reports and will group
together findings from the same file.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/scripts/xen_analysis/cppcheck_report_utils.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/scripts/xen_analysis/cppcheck_report_utils.py b/xen/scripts/xen_analysis/cppcheck_report_utils.py
index 02440aefdfec..f02166ed9d19 100644
--- a/xen/scripts/xen_analysis/cppcheck_report_utils.py
+++ b/xen/scripts/xen_analysis/cppcheck_report_utils.py
@@ -104,6 +104,8 @@ def cppcheck_merge_txt_fragments(fragments_list, out_txt_file, strip_paths):
                 for path in strip_paths:
                     text_report_content[i] = text_report_content[i].replace(
                                                                 path + "/", "")
+            # sort alphabetically the entries
+            text_report_content.sort()
             # Write the final text report
             outfile.writelines(text_report_content)
     except OSError as e:
-- 
2.17.1


