Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFA57D99FB
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 15:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624382.972922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMyl-0000nR-Pa; Fri, 27 Oct 2023 13:34:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624382.972922; Fri, 27 Oct 2023 13:34:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwMyl-0000hX-Kc; Fri, 27 Oct 2023 13:34:23 +0000
Received: by outflank-mailman (input) for mailman id 624382;
 Fri, 27 Oct 2023 13:34:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjPi=GJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qwMyk-0000bB-J7
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 13:34:22 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 893a287f-74cd-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 15:34:21 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 9B9D54EE0C87;
 Fri, 27 Oct 2023 15:34:20 +0200 (CEST)
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
X-Inumbo-ID: 893a287f-74cd-11ee-98d6-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v4 3/8] xen/pdx: amend definition of PDX_GROUP_COUNT
Date: Fri, 27 Oct 2023 15:34:10 +0200
Message-Id: <a61827489575e003885c416312945b654a4850c3.1698410970.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698410970.git.nicola.vetrini@bugseng.com>
References: <cover.1698410970.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The definition of PDX_GROUP_COUNT causes violations of
MISRA C:2012 Rule 10.1, therefore the problematic part now uses
the ISOLATE_LOW_BIT macro, which encapsulates the pattern.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v4:
-CChanged macro name.
---
 xen/include/xen/pdx.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/pdx.h b/xen/include/xen/pdx.h
index f3fbc4273aa4..6853dc1a601e 100644
--- a/xen/include/xen/pdx.h
+++ b/xen/include/xen/pdx.h
@@ -72,7 +72,7 @@
 extern unsigned long max_pdx;
 
 #define PDX_GROUP_COUNT ((1 << PDX_GROUP_SHIFT) / \
-                         (sizeof(*frame_table) & -sizeof(*frame_table)))
+                         (ISOLATE_LOW_BIT(sizeof(*frame_table))))
 extern unsigned long pdx_group_valid[];
 
 /**
-- 
2.34.1


