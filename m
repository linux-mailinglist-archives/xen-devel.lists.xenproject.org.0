Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 097C17F78FA
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 17:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640821.999537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Z4D-0001CJ-Ts; Fri, 24 Nov 2023 16:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640821.999537; Fri, 24 Nov 2023 16:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Z4D-00018q-R6; Fri, 24 Nov 2023 16:30:09 +0000
Received: by outflank-mailman (input) for mailman id 640821;
 Fri, 24 Nov 2023 16:30:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SB6C=HF=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1r6Z4C-00015K-Eg
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 16:30:08 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ba5f5af2-8ae6-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 17:30:07 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 5D1244EE0740;
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
X-Inumbo-ID: ba5f5af2-8ae6-11ee-98e2-6d05b1d4d9a1
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	maria.celeste.cesario@bugseng.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH 1/5] x86/platform_hypercall: address violations of MISRA C:2012 Rule 11.8
Date: Fri, 24 Nov 2023 17:29:15 +0100
Message-Id: <a04d1dda2fd3cceaf9cfa1eb82e4964d5343ed36.1700842832.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
References: <cover.1700842832.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Add const qualifier in cast that unnecessarily removes it
to comply with Rule 11.8.
The variable info is declared with a const qualified type.
No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/arch/x86/platform_hypercall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index c1ab552c57..4dde71db27 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -364,7 +364,7 @@ ret_t do_platform_op(
             if ( length > info->edd_device_params.length )
                 length = info->edd_device_params.length;
             if ( copy_to_compat(op->u.firmware_info.u.disk_info.edd_params,
-                                (u8 *)&info->edd_device_params,
+                                (const uint8_t *)&info->edd_device_params,
                                 length) )
                 break;
             if ( copy_to_compat(op->u.firmware_info.u.disk_info.edd_params,
-- 
2.40.0


