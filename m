Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC4A2C6F78
	for <lists+xen-devel@lfdr.de>; Sat, 28 Nov 2020 12:37:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39961.73017 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiyX2-0001ln-FK; Sat, 28 Nov 2020 11:36:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39961.73017; Sat, 28 Nov 2020 11:36:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiyX2-0001lO-CF; Sat, 28 Nov 2020 11:36:48 +0000
Received: by outflank-mailman (input) for mailman id 39961;
 Sat, 28 Nov 2020 11:36:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kiyX0-0001lJ-MH
 for xen-devel@lists.xenproject.org; Sat, 28 Nov 2020 11:36:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiyX0-0005C8-5M; Sat, 28 Nov 2020 11:36:46 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kiyWz-0005KL-Oo; Sat, 28 Nov 2020 11:36:46 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=x08oKDPsYhZfnq1rzPGbIzqD44Wkh09Na1i2ws0EUmg=; b=5WPhm6Iso5l4CpXiddbRQbhUo+
	mB1bP5gIWc3UXq01x505VjQmh5pOu9/BZBW9iWUg5rbIvwAp+itBCVyJfLa0pxcVL4Rb66wdwGZT4
	w5Wy6fP7lanWU56H55zNQ43u5nTHsbtTkwzJ5b3eKqZ6mgdzLA1VpndGhbgyudoVTBdY=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2] xen/irq: Propagate the error from init_one_desc_irq() in init_*_irq_data()
Date: Sat, 28 Nov 2020 11:36:42 +0000
Message-Id: <20201128113642.8265-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

init_one_desc_irq() can return an error if it is unable to allocate
memory. While this is unlikely to happen during boot (called from
init_{,local_}irq_data()), it is better to harden the code by
propagting the return value.

Spotted by coverity.

CID: 106529

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Roger Paul Monné <roger.pau@citrix.com>

---
    Changes in v2:
        - Add Roger's reviewed-by for x86
        - Handle
---
 xen/arch/arm/irq.c | 12 ++++++++++--
 xen/arch/x86/irq.c |  7 ++++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/irq.c b/xen/arch/arm/irq.c
index 3877657a5277..b71b099e6fa2 100644
--- a/xen/arch/arm/irq.c
+++ b/xen/arch/arm/irq.c
@@ -88,7 +88,11 @@ static int __init init_irq_data(void)
     for ( irq = NR_LOCAL_IRQS; irq < NR_IRQS; irq++ )
     {
         struct irq_desc *desc = irq_to_desc(irq);
-        init_one_irq_desc(desc);
+        int rc = init_one_irq_desc(desc);
+
+        if ( rc )
+            return rc;
+
         desc->irq = irq;
         desc->action  = NULL;
     }
@@ -105,7 +109,11 @@ static int init_local_irq_data(void)
     for ( irq = 0; irq < NR_LOCAL_IRQS; irq++ )
     {
         struct irq_desc *desc = irq_to_desc(irq);
-        init_one_irq_desc(desc);
+        int rc = init_one_irq_desc(desc);
+
+        if ( rc )
+            return rc;
+
         desc->irq = irq;
         desc->action  = NULL;
 
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 45966947919e..3ebd684415ac 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -428,9 +428,14 @@ int __init init_irq_data(void)
 
     for ( irq = 0; irq < nr_irqs_gsi; irq++ )
     {
+        int rc;
+
         desc = irq_to_desc(irq);
         desc->irq = irq;
-        init_one_irq_desc(desc);
+
+        rc = init_one_irq_desc(desc);
+        if ( rc )
+            return rc;
     }
     for ( ; irq < nr_irqs; irq++ )
         irq_to_desc(irq)->irq = irq;
-- 
2.17.1


