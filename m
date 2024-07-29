Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0424793F088
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jul 2024 11:00:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.766473.1177006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMEy-0001se-Nv; Mon, 29 Jul 2024 09:00:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 766473.1177006; Mon, 29 Jul 2024 09:00:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sYMEy-0001k0-B0; Mon, 29 Jul 2024 09:00:24 +0000
Received: by outflank-mailman (input) for mailman id 766473;
 Mon, 29 Jul 2024 09:00:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tqVw=O5=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1sYMEv-0000Lt-R0
 for xen-devel@lists.xenproject.org; Mon, 29 Jul 2024 09:00:21 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb17298b-4d88-11ef-bc01-fd08da9f4363;
 Mon, 29 Jul 2024 11:00:19 +0200 (CEST)
Received: from truciolo.homenet.telecomitalia.it
 (host-87-20-207-105.retail.telecomitalia.it [87.20.207.105])
 by support.bugseng.com (Postfix) with ESMTPSA id 2C4684EE0764;
 Mon, 29 Jul 2024 11:00:19 +0200 (CEST)
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
X-Inumbo-ID: fb17298b-4d88-11ef-bc01-fd08da9f4363
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v5 8/8] x86/mpparse: address a violation of MISRA C Rule 16.3
Date: Mon, 29 Jul 2024 11:00:09 +0200
Message-Id: <ea5833b887ad48598b5d39077f28e86263888629.1722239813.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722239813.git.federico.serafini@bugseng.com>
References: <cover.1722239813.git.federico.serafini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a missing break statement to address a violation of
MISRA C Rule 16.3: "An unconditional `break' statement shall terminate
every switch-clause".

No functional change.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/mpparse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/x86/mpparse.c b/xen/arch/x86/mpparse.c
index d8ccab2449..306d8ed97a 100644
--- a/xen/arch/x86/mpparse.c
+++ b/xen/arch/x86/mpparse.c
@@ -544,6 +544,7 @@ static inline void __init construct_default_ISA_mptable(int mpc_default_type)
 		case 4:
 		case 7:
 			memcpy(bus.mpc_bustype, "MCA   ", 6);
+			break;
 	}
 	MP_bus_info(&bus);
 	if (mpc_default_type > 4) {
-- 
2.34.1


