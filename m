Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19238917C71
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 11:28:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748586.1156369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwr-0005VO-Mu; Wed, 26 Jun 2024 09:28:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748586.1156369; Wed, 26 Jun 2024 09:28:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMOwr-0005Pp-Fs; Wed, 26 Jun 2024 09:28:17 +0000
Received: by outflank-mailman (input) for mailman id 748586;
 Wed, 26 Jun 2024 09:28:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P08s=N4=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sMOwq-0004l5-7n
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 09:28:16 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69e90dc5-339e-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 11:28:14 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.209.199.41])
 by support.bugseng.com (Postfix) with ESMTPSA id DB06D4EE0754;
 Wed, 26 Jun 2024 11:28:13 +0200 (CEST)
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
X-Inumbo-ID: 69e90dc5-339e-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v3 03/12] x86/domctl: address a violation of MISRA C Rule 16.3
Date: Wed, 26 Jun 2024 11:27:56 +0200
Message-Id: <cdc125a881dd8b37613e16ac81d712e729bbb4b9.1719383180.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719383180.git.federico.serafini@bugseng.com>
References: <cover.1719383180.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statement to address a violation of
MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
every switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/domctl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
index 9190e11faa..68b5b46d1a 100644
--- a/xen/arch/x86/domctl.c
+++ b/xen/arch/x86/domctl.c
@@ -517,6 +517,7 @@ long arch_do_domctl(
 
         default:
             ret = -ENOSYS;
+            break;
         }
         break;
     }
-- 
2.34.1


