Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9E7F5965
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 08:37:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639369.996679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64HG-0005IQ-RE; Thu, 23 Nov 2023 07:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639369.996679; Thu, 23 Nov 2023 07:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64HG-0005DT-OG; Thu, 23 Nov 2023 07:37:34 +0000
Received: by outflank-mailman (input) for mailman id 639369;
 Thu, 23 Nov 2023 07:37:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FfzT=HE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r64HF-0004t9-Kk
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 07:37:33 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 28be3168-89d3-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 08:37:31 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 4968F4EE0C89;
 Thu, 23 Nov 2023 08:37:30 +0100 (CET)
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
X-Inumbo-ID: 28be3168-89d3-11ee-98e2-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v5 2/3] xen/pdx: amend definition of PDX_GROUP_COUNT
Date: Thu, 23 Nov 2023 08:37:17 +0100
Message-Id: <9ae508ee09f7102b10ae742749b43d4fc9f04649.1700724350.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700724350.git.nicola.vetrini@bugseng.com>
References: <cover.1700724350.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of PDX_GROUP_COUNT causes violations of
MISRA C:2012 Rule 10.1, therefore the problematic part now uses
the ISOLATE_LSB macro, which encapsulates the pattern.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v4:
- Changed macro name.
Changes in v5:
- Changed macro name.
---
 xen/include/xen/pdx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index bd535009ea8f..23f3956db8db 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -70,7 +70,7 @@
 extern unsigned long max_pdx;
 
 #define PDX_GROUP_COUNT ((1 << PDX_GROUP_SHIFT) / \
-                         (sizeof(*frame_table) & -sizeof(*frame_table)))
+                         (ISOLATE_LSB(sizeof(*frame_table))))
 extern unsigned long pdx_group_valid[];
 
 /**
-- 
2.34.1


