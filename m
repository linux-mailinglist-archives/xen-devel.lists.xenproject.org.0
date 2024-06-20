Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD1F9106C0
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 15:52:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744517.1151648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKICr-00027v-WF; Thu, 20 Jun 2024 13:52:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744517.1151648; Thu, 20 Jun 2024 13:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKICr-0001vf-L3; Thu, 20 Jun 2024 13:52:05 +0000
Received: by outflank-mailman (input) for mailman id 744517;
 Thu, 20 Jun 2024 13:52:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPla=NW=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sKICo-0008AK-ST
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 13:52:02 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 444fefa2-2f0c-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 15:52:00 +0200 (CEST)
Received: from truciolo.bugseng.com (unknown [78.208.165.219])
 by support.bugseng.com (Postfix) with ESMTPSA id E5AC14EE0739;
 Thu, 20 Jun 2024 15:51:59 +0200 (CEST)
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
X-Inumbo-ID: 444fefa2-2f0c-11ef-b4bb-af5377834399
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>
Subject: [XEN PATCH 11/13] x86/pmtimer: address a violation of MISRA C Rule 16.3
Date: Thu, 20 Jun 2024 15:51:45 +0200
Message-Id: <3cdd3de1e1d91fb9fbef173f3f1a3470e7dadbca.1718890095.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718890095.git.federico.serafini@bugseng.com>
References: <10af9145252a2f5c31ea0f13cbb67cbe76a8ba3a.1718890095.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing break statement to address a violation of MISRA C Rule 16.3
("An unconditional `break' statement shall terminate every
switch-clause").

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/arch/x86/hvm/pmtimer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/hvm/pmtimer.c b/xen/arch/x86/hvm/pmtimer.c
index 97099ac305..87a7a01c9f 100644
--- a/xen/arch/x86/hvm/pmtimer.c
+++ b/xen/arch/x86/hvm/pmtimer.c
@@ -185,6 +185,7 @@ static int cf_check handle_evt_io(
                 gdprintk(XENLOG_WARNING, 
                          "Bad ACPI PM register write: %x bytes (%x) at %x\n", 
                          bytes, *val, port);
+                break;
             }
         }
         /* Fix up the SCI state to match the new register state */
-- 
2.34.1


