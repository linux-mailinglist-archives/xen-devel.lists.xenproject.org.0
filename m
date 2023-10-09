Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFC57BD3E4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 08:55:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614145.955090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkAU-0005se-JO; Mon, 09 Oct 2023 06:55:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614145.955090; Mon, 09 Oct 2023 06:55:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkAU-0005n5-C3; Mon, 09 Oct 2023 06:55:06 +0000
Received: by outflank-mailman (input) for mailman id 614145;
 Mon, 09 Oct 2023 06:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9Np=FX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qpkAS-0005Uv-OE
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 06:55:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c61dae02-6670-11ee-98d3-6d05b1d4d9a1;
 Mon, 09 Oct 2023 08:55:04 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 849784EE0746;
 Mon,  9 Oct 2023 08:55:02 +0200 (CEST)
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
X-Inumbo-ID: c61dae02-6670-11ee-98d3-6d05b1d4d9a1
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
Subject: [XEN PATCH][for-next v2 4/7] x86/grant: switch included header to make declarations visible
Date: Mon,  9 Oct 2023 08:54:49 +0200
Message-Id: <d49c648e940a651790fa6075a3fde40009501262.1696833629.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696833629.git.nicola.vetrini@bugseng.com>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The declarations for {create,replace}_grant_p2m_mapping are
not visible when these functions are defined, therefore the right
header needs to be included to allow them to be visible.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
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
index 33c1da1a25f3..576aeb50adf4 100644
--- a/xen/arch/x86/include/asm/hvm/grant_table.h
+++ b/xen/arch/x86/include/asm/hvm/grant_table.h
@@ -10,6 +10,8 @@
 #ifndef __X86_HVM_GRANT_TABLE_H__
 #define __X86_HVM_GRANT_TABLE_H__
 
+#include <asm/paging.h>
+
 #ifdef CONFIG_HVM
 
 int create_grant_p2m_mapping(uint64_t addr, mfn_t frame,
-- 
2.34.1


