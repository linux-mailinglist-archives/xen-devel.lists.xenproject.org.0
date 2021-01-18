Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 314BF2FA767
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 18:23:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69909.125316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1YFH-0008Lt-PM; Mon, 18 Jan 2021 17:23:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69909.125316; Mon, 18 Jan 2021 17:23:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1YFH-0008LU-LT; Mon, 18 Jan 2021 17:23:15 +0000
Received: by outflank-mailman (input) for mailman id 69909;
 Mon, 18 Jan 2021 17:23:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k63/=GV=tklengyel.com=tamas@srs-us1.protection.inumbo.net>)
 id 1l1YFF-0008LO-TE
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 17:23:13 +0000
Received: from MTA-08-4.privateemail.com (unknown [198.54.122.58])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bf2b0ad-0d06-4283-b09c-e8d6e9a9dc53;
 Mon, 18 Jan 2021 17:23:12 +0000 (UTC)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 9D4F360098;
 Mon, 18 Jan 2021 12:23:11 -0500 (EST)
Received: from t9.localdomain (unknown [10.20.151.225])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id 8D8056007B;
 Mon, 18 Jan 2021 17:23:10 +0000 (UTC)
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
X-Inumbo-ID: 5bf2b0ad-0d06-4283-b09c-e8d6e9a9dc53
From: Tamas K Lengyel <tamas@tklengyel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH] x86/mem_sharing: fix uninitialized 'preempted' variable
Date: Mon, 18 Jan 2021 10:23:06 -0700
Message-Id: <b52103fa0c7450735586b8576b8070409c86ea24.1610990339.git.tamas@tklengyel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

UBSAN catches an uninitialized use of the 'preempted' variable in
fork_hap_allocation when there is no preemption.

Signed-off-by: Tamas K Lengyel <tamas@tklengyel.com>
---
 xen/arch/x86/mm/mem_sharing.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
index c8a6d11b90..adaeab4612 100644
--- a/xen/arch/x86/mm/mem_sharing.c
+++ b/xen/arch/x86/mm/mem_sharing.c
@@ -1644,7 +1644,7 @@ static int copy_vcpu_settings(struct domain *cd, const struct domain *d)
 static int fork_hap_allocation(struct domain *cd, struct domain *d)
 {
     int rc;
-    bool preempted;
+    bool preempted = false;
     unsigned long mb = hap_get_allocation(d);
 
     if ( mb == hap_get_allocation(cd) )
-- 
2.25.1


