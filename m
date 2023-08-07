Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAC2772BF0
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 19:02:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578749.906408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT3cg-0007Nt-3g; Mon, 07 Aug 2023 17:02:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578749.906408; Mon, 07 Aug 2023 17:02:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT3cg-0007LA-11; Mon, 07 Aug 2023 17:02:26 +0000
Received: by outflank-mailman (input) for mailman id 578749;
 Mon, 07 Aug 2023 17:02:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FiBK=DY=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qT3ce-0007L0-RI
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 17:02:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2d7fb694-3544-11ee-b280-6b7b168915f2;
 Mon, 07 Aug 2023 19:02:23 +0200 (CEST)
Received: from Dell.homenet.telecomitalia.it
 (host-79-35-203-138.retail.telecomitalia.it [79.35.203.138])
 by support.bugseng.com (Postfix) with ESMTPSA id 55C414EE0737;
 Mon,  7 Aug 2023 19:02:22 +0200 (CEST)
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
X-Inumbo-ID: 2d7fb694-3544-11ee-b280-6b7b168915f2
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] x86/cpu: Address a violation of MISRA C:2012 Rule 8.3
Date: Mon,  7 Aug 2023 19:02:05 +0200
Message-Id: <8536f54b708a1b3a906d14a63958c2e6dd0d034e.1691427640.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A missing change to the type in 'opt_arat' declaration introduced a new
violation of MISRA C:2012 Rule 8.3 ("All declarations of an object or
function shall use the same names and type qualifiers").
Change the type to restore the consistency between all declarations of
the object and drop a further usage of 'bool_t'.

Fixes: 202a341f ("x86: Address violations of MISRA C:2012 by replacing bool_t uses")
Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/cpu/cpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index 85a67771f7..e3d06278b3 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -7,7 +7,7 @@ struct cpu_dev {
 extern const struct cpu_dev intel_cpu_dev, amd_cpu_dev, centaur_cpu_dev,
     shanghai_cpu_dev, hygon_cpu_dev;
 
-extern bool_t opt_arat;
+extern bool opt_arat;
 extern unsigned int opt_cpuid_mask_ecx, opt_cpuid_mask_edx;
 extern unsigned int opt_cpuid_mask_xsave_eax;
 extern unsigned int opt_cpuid_mask_ext_ecx, opt_cpuid_mask_ext_edx;
-- 
2.34.1


