Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B94877C26
	for <lists+xen-devel@lfdr.de>; Mon, 11 Mar 2024 10:00:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691275.1077167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbWF-0001a2-H5; Mon, 11 Mar 2024 09:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691275.1077167; Mon, 11 Mar 2024 09:00:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjbWE-0001If-4t; Mon, 11 Mar 2024 09:00:26 +0000
Received: by outflank-mailman (input) for mailman id 691275;
 Mon, 11 Mar 2024 09:00:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWeI=KR=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rjbW9-0006j9-0y
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2024 09:00:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8f7fdf3-df85-11ee-a1ee-f123f15fe8a2;
 Mon, 11 Mar 2024 10:00:19 +0100 (CET)
Received: from beta.station (net-93-144-106-196.cust.vodafonedsl.it
 [93.144.106.196])
 by support.bugseng.com (Postfix) with ESMTPSA id 831634EE0CA1;
 Mon, 11 Mar 2024 10:00:18 +0100 (CET)
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
X-Inumbo-ID: c8f7fdf3-df85-11ee-a1ee-f123f15fe8a2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	sstabellini@kernel.org,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v3 15/16] x86/mtrr: address violations of MISRA C:2012 Directive 4.10
Date: Mon, 11 Mar 2024 09:59:24 +0100
Message-Id: <33413c877af70c8aed05ed1bc7b259c59087cb96.1710145041.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710145041.git.simone.ballarin@bugseng.com>
References: <cover.1710145041.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

Add inclusion guard to address violations of
MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order to
prevent the contents of a header file being included more than once").
Mechanical change.
---
Commit introduced in v3

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/arch/x86/cpu/mtrr/mtrr.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/cpu/mtrr/mtrr.h b/xen/arch/x86/cpu/mtrr/mtrr.h
index a9741e0cb0..632bf658be 100644
--- a/xen/arch/x86/cpu/mtrr/mtrr.h
+++ b/xen/arch/x86/cpu/mtrr/mtrr.h
@@ -1,6 +1,8 @@
 /*
  * local mtrr defines.
  */
+#ifndef X86_CPU_MTRR_MTRR_H
+#define X86_CPU_MTRR_MTRR_H
 
 #define MTRR_CHANGE_MASK_FIXED     0x01
 #define MTRR_CHANGE_MASK_VARIABLE  0x02
@@ -25,3 +27,5 @@ extern u64 size_or_mask, size_and_mask;
 extern unsigned int num_var_ranges;
 
 void mtrr_state_warn(void);
+
+#endif /* X86_CPU_MTRR_MTRR_H */
-- 
2.34.1


