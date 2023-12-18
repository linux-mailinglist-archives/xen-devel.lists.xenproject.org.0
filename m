Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C737816AC9
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 11:17:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655806.1023637 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAh1-0006Gi-HJ; Mon, 18 Dec 2023 10:17:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655806.1023637; Mon, 18 Dec 2023 10:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFAh1-0006B7-8t; Mon, 18 Dec 2023 10:17:47 +0000
Received: by outflank-mailman (input) for mailman id 655806;
 Mon, 18 Dec 2023 10:17:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mejk=H5=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1rFAgz-00055V-7C
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 10:17:45 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af30754f-9d8e-11ee-98eb-6d05b1d4d9a1;
 Mon, 18 Dec 2023 11:17:44 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 84A224EE0746;
 Mon, 18 Dec 2023 11:17:43 +0100 (CET)
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
X-Inumbo-ID: af30754f-9d8e-11ee-98eb-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 5/7] x86/platform: removed break to address MISRA C:2012 Rule 2.1
Date: Mon, 18 Dec 2023 11:17:31 +0100
Message-Id: <a6b3f8d44888d7c8b1d72803111dc331fafd4b02.1702891792.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702891792.git.nicola.vetrini@bugseng.com>
References: <cover.1702891792.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The break statement is redundant, hence it can be removed.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
Changes in v2:
- Remove the outer break, instead of the inner one.
---
 xen/arch/x86/platform_hypercall.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 4dde71db275c..7a2e4b9b603e 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -725,7 +725,6 @@ ret_t do_platform_op(
             0, cpu_down_helper, (void *)(unsigned long)cpu);
         break;
     }
-    break;
 
     case XENPF_cpu_hotadd:
         ret = xsm_resource_plug_core(XSM_HOOK);
-- 
2.34.1

