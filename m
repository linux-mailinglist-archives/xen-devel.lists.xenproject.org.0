Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B113F7DB5DC
	for <lists+xen-devel@lfdr.de>; Mon, 30 Oct 2023 10:11:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.625005.973862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxOJJ-0001Fp-SA; Mon, 30 Oct 2023 09:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 625005.973862; Mon, 30 Oct 2023 09:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxOJJ-0001Cs-No; Mon, 30 Oct 2023 09:11:49 +0000
Received: by outflank-mailman (input) for mailman id 625005;
 Mon, 30 Oct 2023 09:11:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nz7O=GM=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qxOJI-0008Uy-BG
 for xen-devel@lists.xenproject.org; Mon, 30 Oct 2023 09:11:48 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 592558fd-7704-11ee-9b0e-b553b5be7939;
 Mon, 30 Oct 2023 10:11:45 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 89B164EE0744;
 Mon, 30 Oct 2023 10:11:44 +0100 (CET)
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
X-Inumbo-ID: 592558fd-7704-11ee-9b0e-b553b5be7939
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
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 v5 5/8] x86/vm_event: add missing include for hvm_vm_event_do_resume
Date: Mon, 30 Oct 2023 10:11:30 +0100
Message-Id: <8d5a53856c637b0fbc2742f8da94fcdddd07308f.1698655374.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698655374.git.nicola.vetrini@bugseng.com>
References: <cover.1698655374.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The missing header makes the declaration visible when the function
is defined, thereby fixing a violation of MISRA C:2012 Rule 8.4.

Fixes: 1366a0e76db6 ("x86/vm_event: add hvm/vm_event.{h,c}")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Acked-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/hvm/vm_event.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/vm_event.c b/xen/arch/x86/hvm/vm_event.c
index 3b064bcfade5..c1af230e7aed 100644
--- a/xen/arch/x86/hvm/vm_event.c
+++ b/xen/arch/x86/hvm/vm_event.c
@@ -24,6 +24,7 @@
 #include <xen/vm_event.h>
 #include <asm/hvm/emulate.h>
 #include <asm/hvm/support.h>
+#include <asm/hvm/vm_event.h>
 #include <asm/vm_event.h>
 
 static void hvm_vm_event_set_registers(const struct vcpu *v)
-- 
2.34.1


