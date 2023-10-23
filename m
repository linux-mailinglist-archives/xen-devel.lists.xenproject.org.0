Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E097D2B31
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 09:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620993.966946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupHQ-0004CA-PS; Mon, 23 Oct 2023 07:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620993.966946; Mon, 23 Oct 2023 07:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qupHQ-00048U-JJ; Mon, 23 Oct 2023 07:23:16 +0000
Received: by outflank-mailman (input) for mailman id 620993;
 Mon, 23 Oct 2023 07:23:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iWHG=GF=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qupHO-0003Om-Ml
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 07:23:14 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0625e0d2-7175-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 09:23:12 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-95-247-204-25.retail.telecomitalia.it [95.247.204.25])
 by support.bugseng.com (Postfix) with ESMTPSA id D21454EE0746;
 Mon, 23 Oct 2023 09:23:11 +0200 (CEST)
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
X-Inumbo-ID: 0625e0d2-7175-11ee-98d5-6d05b1d4d9a1
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH 3/8] x86/vpmu: address a violation of MISRA C:2012 Rule 8.2
Date: Mon, 23 Oct 2023 09:22:58 +0200
Message-Id: <064278aecf69859c664784ba18a7189d885112c0.1698045505.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698045505.git.federico.serafini@bugseng.com>
References: <cover.1698045505.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing parameter name. No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/vpmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/vpmu.h b/xen/arch/x86/include/asm/vpmu.h
index b165acc6c2..7858aec6ca 100644
--- a/xen/arch/x86/include/asm/vpmu.h
+++ b/xen/arch/x86/include/asm/vpmu.h
@@ -35,7 +35,7 @@ struct arch_vpmu_ops {
     void (*arch_vpmu_destroy)(struct vcpu *v);
     int (*arch_vpmu_save)(struct vcpu *v, bool_t to_guest);
     int (*arch_vpmu_load)(struct vcpu *v, bool_t from_guest);
-    void (*arch_vpmu_dump)(const struct vcpu *);
+    void (*arch_vpmu_dump)(const struct vcpu *v);
 
 #ifdef CONFIG_MEM_SHARING
     int (*allocate_context)(struct vcpu *v);
-- 
2.34.1


