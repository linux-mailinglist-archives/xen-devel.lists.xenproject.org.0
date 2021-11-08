Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA72C447D6B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 11:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223174.385757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1dp-0000yl-Jh; Mon, 08 Nov 2021 10:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223174.385757; Mon, 08 Nov 2021 10:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk1dp-0000wV-Ge; Mon, 08 Nov 2021 10:12:41 +0000
Received: by outflank-mailman (input) for mailman id 223174;
 Mon, 08 Nov 2021 10:12:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uasK=P3=alien8.de=bp@srs-se1.protection.inumbo.net>)
 id 1mk1de-0000ta-EY
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 10:12:40 +0000
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5cc4e9a2-407c-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 11:12:23 +0100 (CET)
Received: from zn.tnic (p200300ec2f33110088892b77bd117736.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:8889:2b77:bd11:7736])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8A4191EC0503;
 Mon,  8 Nov 2021 11:12:22 +0100 (CET)
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
X-Inumbo-ID: 5cc4e9a2-407c-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
	t=1636366342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7P+1psRq8/HfQacGi22yCZu748tDOEEg0nO5q6foNi4=;
	b=cIuplv9KGmaQtphcAaDmcAC6xl2w0MeOIR4hIYs0MWfdHX/ARzmJwX7Xt95BiWbeP7Vaow
	/rT1rXqSh9J/jjp/apNMzA/3yRoAtxZawFAJ4KXO2c1kiVMYVwd5D7e8KJhBqrHyMaQLq5
	1uAygH3VwNg7vzyFj/holnwvkHSBmBA=
From: Borislav Petkov <bp@alien8.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: xen-devel@lists.xenproject.org
Subject: [PATCH v0 18/42] drivers/xen: Check notifier registration return value
Date: Mon,  8 Nov 2021 11:11:33 +0100
Message-Id: <20211108101157.15189-19-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Borislav Petkov <bp@suse.de>

Avoid homegrown notifier registration checks.

No functional changes.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/manage.c              | 3 ++-
 drivers/xen/xenbus/xenbus_probe.c | 8 +++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/xen/manage.c b/drivers/xen/manage.c
index 374d36de7f5a..f3c5cef0995f 100644
--- a/drivers/xen/manage.c
+++ b/drivers/xen/manage.c
@@ -48,7 +48,8 @@ static RAW_NOTIFIER_HEAD(xen_resume_notifier);
 
 void xen_resume_notifier_register(struct notifier_block *nb)
 {
-	raw_notifier_chain_register(&xen_resume_notifier, nb);
+	if (raw_notifier_chain_register(&xen_resume_notifier, nb))
+		pr_warn("Xen resume notifier already registered\n");
 }
 EXPORT_SYMBOL_GPL(xen_resume_notifier_register);
 
diff --git a/drivers/xen/xenbus/xenbus_probe.c b/drivers/xen/xenbus/xenbus_probe.c
index bd003ca8acbe..4e83ce95acd1 100644
--- a/drivers/xen/xenbus/xenbus_probe.c
+++ b/drivers/xen/xenbus/xenbus_probe.c
@@ -731,10 +731,12 @@ int register_xenstore_notifier(struct notifier_block *nb)
 {
 	int ret = 0;
 
-	if (xenstored_ready > 0)
+	if (xenstored_ready > 0) {
 		ret = nb->notifier_call(nb, 0, NULL);
-	else
-		blocking_notifier_chain_register(&xenstore_chain, nb);
+	} else {
+		if (blocking_notifier_chain_register(&xenstore_chain, nb))
+			pr_warn("Xenstore notifier already registered\n");
+	}
 
 	return ret;
 }
-- 
2.29.2


