Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7007BD3E1
	for <lists+xen-devel@lfdr.de>; Mon,  9 Oct 2023 08:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.614148.955122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkAX-0006nB-DB; Mon, 09 Oct 2023 06:55:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 614148.955122; Mon, 09 Oct 2023 06:55:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qpkAX-0006kz-7w; Mon, 09 Oct 2023 06:55:09 +0000
Received: by outflank-mailman (input) for mailman id 614148;
 Mon, 09 Oct 2023 06:55:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o9Np=FX=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qpkAV-0005gg-NH
 for xen-devel@lists.xenproject.org; Mon, 09 Oct 2023 06:55:07 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7482249-6670-11ee-9b0d-b553b5be7939;
 Mon, 09 Oct 2023 08:55:06 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 452324EE0747;
 Mon,  9 Oct 2023 08:55:04 +0200 (CEST)
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
X-Inumbo-ID: c7482249-6670-11ee-9b0d-b553b5be7939
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
Subject: [XEN PATCH][for-next v2 5/7] x86/vm_event: add missing include for hvm_vm_event_do_resume
Date: Mon,  9 Oct 2023 08:54:50 +0200
Message-Id: <4f506769acca31d3d9f36b893822581720050d61.1696833629.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696833629.git.nicola.vetrini@bugseng.com>
References: <cover.1696833629.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The missing header makes the declaration visible when the function
is defined, thereby fixing a violation of MISRA C:2012 Rule 8.4.

Fixes: 1366a0e76db6 ("x86/vm_event: add hvm/vm_event.{h,c}")
Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
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


