Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B6880866D
	for <lists+xen-devel@lfdr.de>; Thu,  7 Dec 2023 12:11:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649780.1014695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBCHu-0005wR-SP; Thu, 07 Dec 2023 11:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649780.1014695; Thu, 07 Dec 2023 11:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rBCHu-0005qG-Ow; Thu, 07 Dec 2023 11:11:26 +0000
Received: by outflank-mailman (input) for mailman id 649780;
 Thu, 07 Dec 2023 11:11:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fZpn=HS=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rBCHs-0005Ik-Sz
 for xen-devel@lists.xenproject.org; Thu, 07 Dec 2023 11:11:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b50b8da-94f1-11ee-98e7-6d05b1d4d9a1;
 Thu, 07 Dec 2023 12:11:23 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id E2E3E4EE0741;
 Thu,  7 Dec 2023 12:11:22 +0100 (CET)
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
X-Inumbo-ID: 5b50b8da-94f1-11ee-98e7-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 3/3] xen/mm: add declaration for first_valid_mfn
Date: Thu,  7 Dec 2023 12:11:18 +0100
Message-Id: <2c02524be7d02064fdf2f5003ef1c507034e4437.1701947290.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701947290.git.nicola.vetrini@bugseng.com>
References: <cover.1701947290.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Such declaration is needed to comply with MISRA C Rule 8.4, because a
compatible declaration is not visible in xen/common/page_alloc.c, where the
variable is defined. That variable can't yet be static because of the lack of
support from ARM and PPC for NUMA.

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Having this declaration essentially sidesteps the current impossibility
of having a static variable, as described in the comments in
ARM and PCC's asm/numa.h.
---
 xen/include/xen/mm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 3d9b2d05a5c8..a13a9a46ced7 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -118,6 +118,8 @@ int destroy_xen_mappings(unsigned long s, unsigned long e);
 /* Retrieve the MFN mapped by VA in Xen virtual address space. */
 mfn_t xen_map_to_mfn(unsigned long va);
 
+extern mfn_t first_valid_mfn;
+
 /*
  * Create only non-leaf page table entries for the
  * page range in Xen virtual address space.
-- 
2.34.1

