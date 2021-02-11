Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4006231858B
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 08:10:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83770.156707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA66y-0000K1-Vw; Thu, 11 Feb 2021 07:10:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83770.156707; Thu, 11 Feb 2021 07:10:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lA66y-0000Jc-SY; Thu, 11 Feb 2021 07:10:00 +0000
Received: by outflank-mailman (input) for mailman id 83770;
 Thu, 11 Feb 2021 07:09:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/E5q=HN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lA66x-0000JX-IH
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 07:09:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4cddac22-2547-4427-b772-2ec0dd7f2112;
 Thu, 11 Feb 2021 07:09:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 57B08B113;
 Thu, 11 Feb 2021 07:09:57 +0000 (UTC)
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
X-Inumbo-ID: 4cddac22-2547-4427-b772-2ec0dd7f2112
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613027397; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=C91ebXZNzoKbv/EE2K4v30/3rR8vNp/LicttouaukRw=;
	b=qNuAiZPpHtlua9QmiOIWYUpNAOS+9eEax533G/t7wi2RZdO+bmAHddRioIDtTF74jYoWxz
	eAeo/pTY9sH9o+4cM8Y8nkQbem/rEMC3ilUp1chL2lcl2e0EH6WFbPXg2OGCPs6a85woot
	WIlz07/w3uYyxb17mC2QN149iItiMC4=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] irq: simplify condition in irq_matrix_reserve()
Date: Thu, 11 Feb 2021 08:09:53 +0100
Message-Id: <20210211070953.5914-1-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The if condition in irq_matrix_reserve() can be much simpler.

While at it fix a typo in the comment.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 kernel/irq/matrix.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/kernel/irq/matrix.c b/kernel/irq/matrix.c
index 651a4ad6d711..1f02a5c801a3 100644
--- a/kernel/irq/matrix.c
+++ b/kernel/irq/matrix.c
@@ -337,15 +337,14 @@ void irq_matrix_assign(struct irq_matrix *m, unsigned int bit)
  * irq_matrix_reserve - Reserve interrupts
  * @m:		Matrix pointer
  *
- * This is merily a book keeping call. It increments the number of globally
+ * This is merely a book keeping call. It increments the number of globally
  * reserved interrupt bits w/o actually allocating them. This allows to
  * setup interrupt descriptors w/o assigning low level resources to it.
  * The actual allocation happens when the interrupt gets activated.
  */
 void irq_matrix_reserve(struct irq_matrix *m)
 {
-	if (m->global_reserved <= m->global_available &&
-	    m->global_reserved + 1 > m->global_available)
+	if (m->global_reserved == m->global_available)
 		pr_warn("Interrupt reservation exceeds available resources\n");
 
 	m->global_reserved++;
-- 
2.26.2


