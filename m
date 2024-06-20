Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 679CD910743
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 16:02:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744613.1151727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIN6-0000fA-29; Thu, 20 Jun 2024 14:02:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744613.1151727; Thu, 20 Jun 2024 14:02:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKIN5-0000Zu-UI; Thu, 20 Jun 2024 14:02:39 +0000
Received: by outflank-mailman (input) for mailman id 744613;
 Thu, 20 Jun 2024 14:02:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKIN4-0007p3-9N
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 14:02:38 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf5b4856-2f0d-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 16:02:36 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.165.219])
 by support.bugseng.com (Postfix) with ESMTPSA id 9DE464EE0754;
 Thu, 20 Jun 2024 16:02:35 +0200 (CEST)
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
X-Inumbo-ID: bf5b4856-2f0d-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH 05/13] x86/traps: use fallthrough pseudo keyword
Date: Thu, 20 Jun 2024 16:02:16 +0200
Message-Id: <dc14fa77a9e38c70d12f3abd531e64afd12eef50.1718892030.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718892030.git.federico.serafini@bugseng.com>
References: <cover.1718892030.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add break or pseudo keyword fallthrough to address violations of
MISRA C Rule 16.3.

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 9906e874d5..cbcec3fafb 100644
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
+        fallthrough;
     case 'i': /* 'ignore' */
         break;
     default:  /* 'fatal' */
@@ -1768,6 +1770,7 @@ static void unknown_nmi_error(const struct cpu_user_regs *regs,
     {
     case 'd': /* 'dom0' */
         nmi_hwdom_report(_XEN_NMIREASON_unknown);
+        fallthrough;
     case 'i': /* 'ignore' */
         break;
     default:  /* 'fatal' */
-- 
2.34.1


