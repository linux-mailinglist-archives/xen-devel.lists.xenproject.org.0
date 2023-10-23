Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5E37D2F2E
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 11:57:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621181.967404 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurgB-0008Ui-2X; Mon, 23 Oct 2023 09:56:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621181.967404; Mon, 23 Oct 2023 09:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qurgA-0008Ma-MN; Mon, 23 Oct 2023 09:56:58 +0000
Received: by outflank-mailman (input) for mailman id 621181;
 Mon, 23 Oct 2023 09:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gXaf=GF=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qurg8-0007mu-JB
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 09:56:56 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7f2cfa06-718a-11ee-9b0e-b553b5be7939;
 Mon, 23 Oct 2023 11:56:55 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 3F6F44EE0747;
 Mon, 23 Oct 2023 11:56:54 +0200 (CEST)
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
X-Inumbo-ID: 7f2cfa06-718a-11ee-9b0e-b553b5be7939
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
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v4 4/8] x86/grant: switch included header to make declarations visible
Date: Mon, 23 Oct 2023 11:56:41 +0200
Message-Id: <65f0b6ff751f76590b81c7ad2ba4dbb98e8b6e0c.1698053876.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698053876.git.nicola.vetrini@bugseng.com>
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The declarations for {create,replace}_grant_p2m_mapping are
not visible when these functions are defined, therefore the right
header needs to be included to allow them to be visible.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- asm/paging.h can be replaced with mm-frame.h, because just the
  definition of mfn_t is needed.
---
 xen/arch/x86/hvm/grant_table.c             | 3 +--
 xen/arch/x86/include/asm/hvm/grant_table.h | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/hvm/grant_table.c b/xen/arch/x86/hvm/grant_table.c
index 30d51d54a949..afe449d8882c 100644
--- a/xen/arch/x86/hvm/grant_table.c
+++ b/xen/arch/x86/hvm/grant_table.c
@@ -9,8 +9,7 @@
 
 #include <xen/types.h>
 
-#include <public/grant_table.h>
-
+#include <asm/hvm/grant_table.h>
 #include <asm/p2m.h>
 
 int create_grant_p2m_mapping(uint64_t addr, mfn_t frame,
diff --git a/xen/arch/x86/include/asm/hvm/grant_table.h b/xen/arch/x86/include/asm/hvm/grant_table.h
index 33c1da1a25f3..01e23f79b8cf 100644
--- a/xen/arch/x86/include/asm/hvm/grant_table.h
+++ b/xen/arch/x86/include/asm/hvm/grant_table.h
@@ -10,6 +10,8 @@
 #ifndef __X86_HVM_GRANT_TABLE_H__
 #define __X86_HVM_GRANT_TABLE_H__
 
+#include <xen/mm-frame.h>
+
 #ifdef CONFIG_HVM
 
 int create_grant_p2m_mapping(uint64_t addr, mfn_t frame,
-- 
2.34.1


