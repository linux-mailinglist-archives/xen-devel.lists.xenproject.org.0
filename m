Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E87E590FFF7
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 11:09:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744300.1151313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKDmH-0001cm-6h; Thu, 20 Jun 2024 09:08:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744300.1151313; Thu, 20 Jun 2024 09:08:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKDmH-0001b0-3d; Thu, 20 Jun 2024 09:08:21 +0000
Received: by outflank-mailman (input) for mailman id 744300;
 Thu, 20 Jun 2024 09:08:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DyN3=NW=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sKDmF-0001au-Ii
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 09:08:19 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1c8d708-2ee4-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 11:08:17 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-17-171-46.retail.telecomitalia.it [87.17.171.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 30ED64EE0738;
 Thu, 20 Jun 2024 11:08:15 +0200 (CEST)
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
X-Inumbo-ID: a1c8d708-2ee4-11ef-b4bb-af5377834399
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation/eclair_analysis: deviate and|or|xor for MISRA C Rule 21.2
Date: Thu, 20 Jun 2024 11:07:36 +0200
Message-Id: <b89e106649e3d0ecb41baadb49dc09c54b7563ec.1718873635.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rule 21.2 reports identifiers reserved for the C and POSIX standard
libraries: or, and and xor are reserved identifiers because they constitute
alternate spellings for the corresponding operators; however Xen doesn't
use standard library headers, so there is no risk of overlap.

This addresses violations arising from x86_emulate/x86_emulate.c, where
label statements named as or, and and xor appear.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 9fa9a7f01c..069519e380 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -498,6 +498,12 @@ still remain available."
 -config=MC3R1.R21.2,declarations+={safe, "!^__builtin_.*$"}
 -doc_end
 
+-doc_begin="or, and and xor are reserved identifiers because they constitute alternate
+spellings for the corresponding operators.
+However, Xen doesn't use standard library headers, so there is no risk of overlap."
+-config=MC3R1.R21.2,reports+={safe, "any_area(stmt(ref(kind(label)&&^(or|and|xor)$)))"}
+-doc_end
+
 -doc_begin="Xen does not use the functions provided by the Standard Library, but
 implements a set of functions that share the same names as their Standard Library equivalent.
 The implementation of these functions is available in source form, so the undefined, unspecified
-- 
2.34.1


