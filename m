Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C5229D8C
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 18:53:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyHzQ-00058H-Tf; Wed, 22 Jul 2020 16:53:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=u0rb=BB=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jyHzO-00058B-Tq
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 16:53:06 +0000
X-Inumbo-ID: cfeed6d0-cc3b-11ea-a1e5-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cfeed6d0-cc3b-11ea-a1e5-12813bfff9fa;
 Wed, 22 Jul 2020 16:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kFC2CwkBpCIOOYAIewqEA21Bqic7EPnr09gGzUQ+zKo=; b=zh5b3Eh5H7mVm64GK0S+/nExUZ
 p0SoLxv6JEug33D7AnCmJEEZOX7eefsqbVkOS8bZl8Mo+HFfZcMvmhnsJnVHhOG5dgpL6bOTHBe//
 T0rmURRS5NwqSU//5+82AKQ60uNCEDS3yRzQpfRl3QsmmH2DnZ2KhJYYHCV4pffpUR5s=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyHzM-0003r7-Pe; Wed, 22 Jul 2020 16:53:04 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jyHzM-0007vp-Cq; Wed, 22 Jul 2020 16:53:04 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH] xen/x86: irq: Avoid a TOCTOU race in pirq_spin_lock_irq_desc()
Date: Wed, 22 Jul 2020 17:53:00 +0100
Message-Id: <20200722165300.22655-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: julien@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Julien Grall <jgrall@amazon.com>

Even if we assigned pirq->arch.irq to a variable, a compile is still
allowed to read pirq->arch.irq multiple time. This means that the value
checked may be different from the value used to get the desc.

Force the compiler to only do one read access by using read_atomic().

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/x86/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index a69937c840b9..25f2eb611692 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
 
     for ( ; ; )
     {
-        int irq = pirq->arch.irq;
+        int irq = read_atomic(&pirq->arch.irq);
 
         if ( irq <= 0 )
             return NULL;
-- 
2.17.1


