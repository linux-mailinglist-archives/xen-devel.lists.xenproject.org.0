Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B78B757DA5
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jul 2023 15:31:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565252.883248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkn6-000076-L7; Tue, 18 Jul 2023 13:31:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565252.883248; Tue, 18 Jul 2023 13:31:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qLkn6-0008W7-Gh; Tue, 18 Jul 2023 13:31:00 +0000
Received: by outflank-mailman (input) for mailman id 565252;
 Tue, 18 Jul 2023 13:30:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eua=DE=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qLkn5-0008Vz-8u
 for xen-devel@lists.xenproject.org; Tue, 18 Jul 2023 13:30:59 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53fa211a-256f-11ee-b23a-6b7b168915f2;
 Tue, 18 Jul 2023 15:30:57 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.161.123.45])
 by support.bugseng.com (Postfix) with ESMTPSA id 38EF84EE0C88;
 Tue, 18 Jul 2023 15:30:56 +0200 (CEST)
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
X-Inumbo-ID: 53fa211a-256f-11ee-b23a-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN PATCH] x86: change parameter name of hvm_monitor_msr() declaration
Date: Tue, 18 Jul 2023 15:30:47 +0200
Message-Id: <99289902f337b83f1ea034fa1eff5db5bdae6c46.1689686715.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the parameter name of hvm_monitor_msr() declaration from
'value' to 'new_value' to match the corresponding defintion.
This fixes a violation of MISRA C:2012 Rule 8.3 ("All declarations of
an object or function shall use the same names and type qualifiers").

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/include/asm/hvm/monitor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/include/asm/hvm/monitor.h b/xen/arch/x86/include/asm/hvm/monitor.h
index 5276b0af08..02021be47b 100644
--- a/xen/arch/x86/include/asm/hvm/monitor.h
+++ b/xen/arch/x86/include/asm/hvm/monitor.h
@@ -25,7 +25,7 @@ bool hvm_monitor_cr(unsigned int index, unsigned long value,
                     unsigned long old);
 #define hvm_monitor_crX(cr, new, old) \
                         hvm_monitor_cr(VM_EVENT_X86_##cr, new, old)
-bool hvm_monitor_msr(unsigned int msr, uint64_t value, uint64_t old_value);
+bool hvm_monitor_msr(unsigned int msr, uint64_t new_value, uint64_t old_value);
 void hvm_monitor_descriptor_access(uint64_t exit_info,
                                    uint64_t vmx_exit_qualification,
                                    uint8_t descriptor, bool is_write);
-- 
2.34.1


