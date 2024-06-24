Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF4E914526
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 10:43:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746293.1153292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfHy-0005SY-Ow; Mon, 24 Jun 2024 08:43:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746293.1153292; Mon, 24 Jun 2024 08:43:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLfHy-0005QS-MK; Mon, 24 Jun 2024 08:43:02 +0000
Received: by outflank-mailman (input) for mailman id 746293;
 Mon, 24 Jun 2024 08:43:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gesJ=N2=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sLfHw-0005QK-RZ
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 08:43:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1fbf723-3205-11ef-b4bb-af5377834399;
 Mon, 24 Jun 2024 10:42:58 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-17-171-46.retail.telecomitalia.it [87.17.171.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 0775C4EE0738;
 Mon, 24 Jun 2024 10:42:55 +0200 (CEST)
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
X-Inumbo-ID: c1fbf723-3205-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3] automation/eclair_analysis: deviate and|or|xor|not for MISRA C Rule 21.2
Date: Mon, 24 Jun 2024 10:42:43 +0200
Message-Id: <f21ea3734857e0cf26afff00befb179b10d02158.1719213594.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 21.2 reports identifiers reserved for the C and POSIX standard
libraries: or, and, not and xor are reserved identifiers because they
constitute alternate spellings for the corresponding operators (they are
defined as macros by iso646.h); however Xen doesn't use standard library
headers, so there is no risk of overlap.

This addresses violations arising from x86_emulate/x86_emulate.c, where
label statements named as or, and and xor appear.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes from v2:
Fixed patch contents as the changes from v1 and v2 were not squashed together.
---
Changes from v1:
Added deviation for 'not' identifier.
Added explanation of where these identifiers are defined, specifically in the
'iso646.h' file of the Standard Library.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 9fa9a7f01c..14c7afb39e 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -498,6 +498,12 @@ still remain available."
 -config=MC3R1.R21.2,declarations+={safe, "!^__builtin_.*$"}
 -doc_end
 
+-doc_begin="or, and and xor are reserved identifiers because they constitute alternate
+spellings for the corresponding operators (they are defined as macros by iso646.h).
+However, Xen doesn't use standard library headers, so there is no risk of overlap."
+-config=MC3R1.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
+-doc_end
+
 -doc_begin="Xen does not use the functions provided by the Standard Library, but
 implements a set of functions that share the same names as their Standard Library equivalent.
 The implementation of these functions is available in source form, so the undefined, unspecified
-- 
2.34.1


