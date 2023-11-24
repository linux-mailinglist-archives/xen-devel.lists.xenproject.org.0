Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CAC77F78F6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 17:30:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640822.999549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Z4F-0001Q2-9b; Fri, 24 Nov 2023 16:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640822.999549; Fri, 24 Nov 2023 16:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Z4F-0001OJ-2t; Fri, 24 Nov 2023 16:30:11 +0000
Received: by outflank-mailman (input) for mailman id 640822;
 Fri, 24 Nov 2023 16:30:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB6C=HF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r6Z4D-0000du-2z
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 16:30:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bab67beb-8ae6-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 17:30:07 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id E8B374EE0C89;
 Fri, 24 Nov 2023 17:30:06 +0100 (CET)
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
X-Inumbo-ID: bab67beb-8ae6-11ee-9b0e-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	maria.celeste.cesario@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH 2/5] x86/boot/reloc: address violations of MISRA C:2012 Rule 11.8
Date: Fri, 24 Nov 2023 17:29:16 +0100
Message-Id: <0e82b0a844e6eb50860ba5c9a2fcdb3328bc374f.1700842832.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
References: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Add missing const qualifier in casting to comply with Rule 11.8.
Argument tag is typically const qualified.
No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/arch/x86/boot/reloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/boot/reloc.c b/xen/arch/x86/boot/reloc.c
index e093b7389c..df0bc710a7 100644
--- a/xen/arch/x86/boot/reloc.c
+++ b/xen/arch/x86/boot/reloc.c
@@ -67,7 +67,7 @@ struct vesa_mode_info {
 };
 #endif /* CONFIG_VIDEO */
 
-#define get_mb2_data(tag, type, member)   (((multiboot2_tag_##type##_t *)(tag))->member)
+#define get_mb2_data(tag, type, member)   (((const multiboot2_tag_##type##_t *)(tag))->member)
 #define get_mb2_string(tag, type, member) ((u32)get_mb2_data(tag, type, member))
 
 static u32 alloc;
-- 
2.40.0


