Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 118283D0DEB
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jul 2021 13:41:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159295.293021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6AaO-0006ok-8F; Wed, 21 Jul 2021 11:40:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159295.293021; Wed, 21 Jul 2021 11:40:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6AaO-0006mt-58; Wed, 21 Jul 2021 11:40:24 +0000
Received: by outflank-mailman (input) for mailman id 159295;
 Wed, 21 Jul 2021 11:40:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=psIF=MN=canonical.com=colin.king@srs-us1.protection.inumbo.net>)
 id 1m6AaM-0006mn-UV
 for xen-devel@lists.xenproject.org; Wed, 21 Jul 2021 11:40:23 +0000
Received: from smtp-relay-canonical-1.canonical.com (unknown [185.125.188.121])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5aa31fe6-98bc-49fe-9a99-2cc309645dcf;
 Wed, 21 Jul 2021 11:40:21 +0000 (UTC)
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id E15553F231; 
 Wed, 21 Jul 2021 11:40:10 +0000 (UTC)
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
X-Inumbo-ID: 5aa31fe6-98bc-49fe-9a99-2cc309645dcf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1626867620;
	bh=EI6lWYDMKnKmAeOVCPHsH4FVwm1n7Ms3nflLoux8RE4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
	b=Z9FGv0WSXpYmC2VTCH5El7pEp8Epr8RtEE+EReQlznQ91+QGw7ai0wUNzAlLY1psu
	 uZzXyVkVVgFucpQ5ogILqQjdKZYos++nm8exzVvqPmS/aoUYYAtxpThK5Y4tNJWqk/
	 L9F2k2kgN5PO33Xp4qHdNdddd6JdiYWT1wwvWm39P9MFZefK541n8Y/3SxzMV5Oael
	 UaOQZkZDZhQhU5v1a/iFfYLxF4jhLCgwrPbQ1CK1tN7yPZOszTJn1XSLcq2ua04VS+
	 MrvSpzS2+k1g0YKCTL0+/lhMkOT9ojfXaIybvs88b38F6caTTlglt3ndBsqKGu33p+
	 ksh9axhikNL/A==
From: Colin King <colin.king@canonical.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] xen/events: remove redundant initialization of variable irq
Date: Wed, 21 Jul 2021 12:40:10 +0100
Message-Id: <20210721114010.108648-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Colin Ian King <colin.king@canonical.com>

The variable irq is being initialized with a value that is never
read, it is being updated later on. The assignment is redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/xen/events/events_base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index d7e361fb0548..154daddbdcb4 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1009,7 +1009,7 @@ static void __unbind_from_irq(unsigned int irq)
 int xen_bind_pirq_gsi_to_irq(unsigned gsi,
 			     unsigned pirq, int shareable, char *name)
 {
-	int irq = -1;
+	int irq;
 	struct physdev_irq irq_op;
 	int ret;
 
-- 
2.31.1


