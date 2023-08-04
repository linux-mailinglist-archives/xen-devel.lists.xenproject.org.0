Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 693507704A4
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 17:28:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577191.904156 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwis-0008F8-Ij; Fri, 04 Aug 2023 15:28:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577191.904156; Fri, 04 Aug 2023 15:28:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRwis-00089g-Be; Fri, 04 Aug 2023 15:28:14 +0000
Received: by outflank-mailman (input) for mailman id 577191;
 Fri, 04 Aug 2023 15:28:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BlMS=DV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qRwiq-00080a-Pm
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 15:28:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8517a4f9-32db-11ee-b26d-6b7b168915f2;
 Fri, 04 Aug 2023 17:28:11 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id C39364EE0741;
 Fri,  4 Aug 2023 17:28:09 +0200 (CEST)
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
X-Inumbo-ID: 8517a4f9-32db-11ee-b26d-6b7b168915f2
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 2/6] libelf: address MISRA C:2012 Rule 5.3
Date: Fri,  4 Aug 2023 17:27:45 +0200
Message-Id: <55624244c42297da7da954009ba0559c47fc245e.1691162261.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691162261.git.nicola.vetrini@bugseng.com>
References: <cover.1691162261.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The types u{8,16,32,64} defined in 'xen/arch/x86/include/asm/types.h'
shadow the variables in the modified function, hence violating Rule 5.3.
Therefore, the rename takes care of the shadowing.

No functional changes.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/common/libelf/libelf-tools.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/common/libelf/libelf-tools.c b/xen/common/libelf/libelf-tools.c
index a9edb6a8dc..f0d5da1abf 100644
--- a/xen/common/libelf/libelf-tools.c
+++ b/xen/common/libelf/libelf-tools.c
@@ -91,10 +91,10 @@ uint64_t elf_access_unsigned(struct elf_binary * elf, elf_ptrval base,
 {
     elf_ptrval ptrval = base + moreoffset;
     bool need_swap = elf_swap(elf);
-    const uint8_t *u8;
-    const uint16_t *u16;
-    const uint32_t *u32;
-    const uint64_t *u64;
+    const uint8_t *uint8;
+    const uint16_t *uint16;
+    const uint32_t *uint32;
+    const uint64_t *uint64;
 
     if ( !elf_access_ok(elf, ptrval, size) )
         return 0;
@@ -102,17 +102,17 @@ uint64_t elf_access_unsigned(struct elf_binary * elf, elf_ptrval base,
     switch ( size )
     {
     case 1:
-        u8 = (const void*)ptrval;
-        return *u8;
+        uint8 = (const void*)ptrval;
+        return *uint8;
     case 2:
-        u16 = (const void*)ptrval;
-        return need_swap ? bswap_16(*u16) : *u16;
+        uint16 = (const void*)ptrval;
+        return need_swap ? bswap_16(*uint16) : *uint16;
     case 4:
-        u32 = (const void*)ptrval;
-        return need_swap ? bswap_32(*u32) : *u32;
+        uint32 = (const void*)ptrval;
+        return need_swap ? bswap_32(*uint32) : *uint32;
     case 8:
-        u64 = (const void*)ptrval;
-        return need_swap ? bswap_64(*u64) : *u64;
+        uint64 = (const void*)ptrval;
+        return need_swap ? bswap_64(*uint64) : *uint64;
     default:
         return 0;
     }
-- 
2.34.1


