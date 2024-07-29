Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A81AF93F083
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 11:00:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766467.1176952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMEu-0000cv-RU; Mon, 29 Jul 2024 09:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766467.1176952; Mon, 29 Jul 2024 09:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMEu-0000ak-O9; Mon, 29 Jul 2024 09:00:20 +0000
Received: by outflank-mailman (input) for mailman id 766467;
 Mon, 29 Jul 2024 09:00:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqVw=O5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sYMEs-0000Lt-Qa
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 09:00:18 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa1f509f-4d88-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 11:00:18 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-87-20-207-105.retail.telecomitalia.it [87.20.207.105])
 by support.bugseng.com (Postfix) with ESMTPSA id 85A4B4EE075F;
 Mon, 29 Jul 2024 11:00:17 +0200 (CEST)
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
X-Inumbo-ID: fa1f509f-4d88-11ef-bc01-fd08da9f4363
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v5 3/8] x86/traps: address violations of MISRA C Rule 16.3
Date: Mon, 29 Jul 2024 11:00:04 +0200
Message-Id: <89cbae91ca175eaaf3e639ee4cd1accd9aedb866.1722239813.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722239813.git.federico.serafini@bugseng.com>
References: <cover.1722239813.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add break or pseudo keyword fallthrough to address violations of
MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
every switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index ee91fc56b1..7a9299ae6c 100644
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -1186,6 +1186,7 @@ void cpuid_hypervisor_leaves(const struct vcpu *v, uint32_t leaf,
 
     default:
         ASSERT_UNREACHABLE();
+        break;
     }
 }
 
@@ -1748,6 +1749,7 @@ static void io_check_error(const struct cpu_user_regs *regs)
     {
     case 'd': /* 'dom0' */
         nmi_hwdom_report(_XEN_NMIREASON_io_error);
+        break;
     case 'i': /* 'ignore' */
         break;
     default:  /* 'fatal' */
@@ -1768,6 +1770,7 @@ static void unknown_nmi_error(const struct cpu_user_regs *regs,
     {
     case 'd': /* 'dom0' */
         nmi_hwdom_report(_XEN_NMIREASON_unknown);
+        break;
     case 'i': /* 'ignore' */
         break;
     default:  /* 'fatal' */
-- 
2.34.1


