Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBDB916508
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 12:15:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747553.1155016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM3CQ-0008QF-8E; Tue, 25 Jun 2024 10:14:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747553.1155016; Tue, 25 Jun 2024 10:14:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM3CQ-0008O2-4P; Tue, 25 Jun 2024 10:14:54 +0000
Received: by outflank-mailman (input) for mailman id 747553;
 Tue, 25 Jun 2024 10:14:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=075v=N3=bugseng.com=alessandro.zucchelli@srs-se1.protection.inumbo.net>)
 id 1sM3CO-0007Vr-Lz
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 10:14:52 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c28c9499-32db-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 12:14:52 +0200 (CEST)
Received: from delta.bugseng.com.homenet.telecomitalia.it
 (host-87-17-171-46.retail.telecomitalia.it [87.17.171.46])
 by support.bugseng.com (Postfix) with ESMTPSA id 94A5B4EE073D;
 Tue, 25 Jun 2024 12:14:49 +0200 (CEST)
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
X-Inumbo-ID: c28c9499-32db-11ef-90a3-e314d9c70b13
From: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 3/3] common/softirq: address violation of MISRA C Rule 13.6
Date: Tue, 25 Jun 2024 12:14:21 +0200
Message-Id: <ab8b527c775fbb7681a4658828d53e7e3419be10.1719308599.git.alessandro.zucchelli@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1719308599.git.alessandro.zucchelli@bugseng.com>
References: <cover.1719308599.git.alessandro.zucchelli@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the file common/softirq macro set_bit is called with argument
smp_processor_id.
Once expanded this set_bit's argument is used in sizeof operations
and thus 'smp_processor_id', being a macro that expands to a
function call with potential side effects, generates a violation.

To address this violation the value of smp_processor_id is therefore
stored in a variable called 'cpu' before passing it to macro set_bit.

No functional change.

Signed-off-by: Alessandro Zucchelli <alessandro.zucchelli@bugseng.com>
---
 xen/common/softirq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/common/softirq.c b/xen/common/softirq.c
index bee4a82009..c5f3870534 100644
--- a/xen/common/softirq.c
+++ b/xen/common/softirq.c
@@ -139,7 +139,8 @@ void cpu_raise_softirq_batch_finish(void)
 
 void raise_softirq(unsigned int nr)
 {
-    set_bit(nr, &softirq_pending(smp_processor_id()));
+    unsigned int cpu = smp_processor_id();
+    set_bit(nr, &softirq_pending(cpu));
 }
 
 /*
-- 
2.34.1


