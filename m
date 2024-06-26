Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DC3917C79
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748589.1156393 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwu-00062O-3D; Wed, 26 Jun 2024 09:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748589.1156393; Wed, 26 Jun 2024 09:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwt-0005qp-KR; Wed, 26 Jun 2024 09:28:19 +0000
Received: by outflank-mailman (input) for mailman id 748589;
 Wed, 26 Jun 2024 09:28:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P08s=N4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sMOwr-0004l5-HO
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:28:17 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ab1bf4f-339e-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 11:28:16 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.209.199.41])
 by support.bugseng.com (Postfix) with ESMTPSA id 6178F4EE0758;
 Wed, 26 Jun 2024 11:28:15 +0200 (CEST)
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
X-Inumbo-ID: 6ab1bf4f-339e-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [XEN PATCH v3 05/12] x86/traps: address violations of MISRA C Rule 16.3
Date: Wed, 26 Jun 2024 11:27:58 +0200
Message-Id: <e7aea6bacb9c914a06a929dfe3606f7cc360588f.1719383180.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719383180.git.federico.serafini@bugseng.com>
References: <cover.1719383180.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add break or pseudo keyword fallthrough to address violations of
MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
every switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v3:
- use break instead of fallthrough.
---
 xen/arch/x86/traps.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
index 9906e874d5..d62598a4c2 100644
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


