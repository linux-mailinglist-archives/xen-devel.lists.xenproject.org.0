Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474F89122A1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 12:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745229.1152389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKbgw-00029i-3X; Fri, 21 Jun 2024 10:40:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745229.1152389; Fri, 21 Jun 2024 10:40:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKbgw-000281-0W; Fri, 21 Jun 2024 10:40:26 +0000
Received: by outflank-mailman (input) for mailman id 745229;
 Fri, 21 Jun 2024 10:40:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gfdn=NX=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sKbgv-00027v-If
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 10:40:25 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aa9780d8-2fba-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 12:40:24 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-17-171-46.retail.telecomitalia.it [87.17.171.46])
 by support.bugseng.com (Postfix) with ESMTPSA id D914B4EE0738;
 Fri, 21 Jun 2024 12:40:23 +0200 (CEST)
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
X-Inumbo-ID: aa9780d8-2fba-11ef-90a3-e314d9c70b13
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] automation/eclair_analysis: deviate and|or|xor|not for MISRA C Rule 21.2
Date: Fri, 21 Jun 2024 12:40:12 +0200
Message-Id: <7b05a537b094598b98b92d0869d16402648fb6f5.1718964932.git.alessandro.zucchelli@bugseng.com>
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
Changes from v1:
Added deviation for 'not' identifier.
Added explanation of where these identifiers are defined, specifically in the
'iso646.h' file of the Standard Library.
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 069519e380..14c7afb39e 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -501,7 +501,7 @@ still remain available."
 -doc_begin="or, and and xor are reserved identifiers because they constitute alternate
 spellings for the corresponding operators (they are defined as macros by iso646.h).
 However, Xen doesn't use standard library headers, so there is no risk of overlap."
--config=MC3R1.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor)$)))"}
+-config=MC3R1.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor|not)$)))"}
 -doc_end
 
 -doc_begin="Xen does not use the functions provided by the Standard Library, but
-- 
2.34.1


