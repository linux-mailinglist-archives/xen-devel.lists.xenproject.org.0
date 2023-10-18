Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A047F7CDFA0
	for <lists+xen-devel@lfdr.de>; Wed, 18 Oct 2023 16:26:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618622.962534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7VE-0002ui-H9; Wed, 18 Oct 2023 14:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618622.962534; Wed, 18 Oct 2023 14:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qt7VE-0002qJ-Dm; Wed, 18 Oct 2023 14:26:28 +0000
Received: by outflank-mailman (input) for mailman id 618622;
 Wed, 18 Oct 2023 14:26:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MOie=GA=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qt7VC-0001YJ-SM
 for xen-devel@lists.xenproject.org; Wed, 18 Oct 2023 14:26:26 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 520793b4-6dc2-11ee-98d4-6d05b1d4d9a1;
 Wed, 18 Oct 2023 16:26:26 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.127.233])
 by support.bugseng.com (Postfix) with ESMTPSA id B27864EE0743;
 Wed, 18 Oct 2023 16:26:24 +0200 (CEST)
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
X-Inumbo-ID: 520793b4-6dc2-11ee-98d4-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 5/7] x86/mcaction: address a violation of MISRA C:2012 Rule 8.2
Date: Wed, 18 Oct 2023 16:25:58 +0200
Message-Id: <80b8eee23c265708dab569b513da9fbfc81febb9.1697638486.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697638486.git.federico.serafini@bugseng.com>
References: <cover.1697638486.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter name. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/cpu/mcheck/mcaction.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/mcheck/mcaction.h b/xen/arch/x86/cpu/mcheck/mcaction.h
index 5cbe558fb0..9cb2ad6c9f 100644
--- a/xen/arch/x86/cpu/mcheck/mcaction.h
+++ b/xen/arch/x86/cpu/mcheck/mcaction.h
@@ -13,7 +13,7 @@ mc_memerr_dhandler(struct mca_binfo *binfo,
 #define MC_ADDR_VIRTUAL   1
 
 typedef bool (*mce_check_addr_t)(uint64_t status, uint64_t misc, int addr_type);
-extern void mce_register_addrcheck(mce_check_addr_t);
+extern void mce_register_addrcheck(mce_check_addr_t cbfunc);
 
 extern mce_check_addr_t mc_check_addr;
 
-- 
2.34.1


