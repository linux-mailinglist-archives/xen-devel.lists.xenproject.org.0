Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD52E2683
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 12:54:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58703.103436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksPBw-0002f7-6K; Thu, 24 Dec 2020 11:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58703.103436; Thu, 24 Dec 2020 11:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksPBw-0002eX-10; Thu, 24 Dec 2020 11:54:00 +0000
Received: by outflank-mailman (input) for mailman id 58703;
 Thu, 24 Dec 2020 11:53:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OdH5=F4=casper.srs.infradead.org=batv+cd7a9cfaa2a0215fac24+6332+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ksPBu-0002WC-9F
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 11:53:58 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a9c3c9f7-f28f-4b01-8d0b-17da43b60027;
 Thu, 24 Dec 2020 11:53:39 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksPBN-0001IL-UT; Thu, 24 Dec 2020 11:53:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1ksPBN-00Er3t-HI; Thu, 24 Dec 2020 11:53:25 +0000
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
X-Inumbo-ID: a9c3c9f7-f28f-4b01-8d0b-17da43b60027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IRb1VunvIiJxLPUFQ4utXydsXUgkW5BhNr6SXAIAjkE=; b=Z63QCpTsmbNseE3AFM3QFE8rHW
	4QIp3TdV9LwRqaoJgFRzIRJ1v2wP0BNaTdOOYVAZvxn7gnbES94Ygsdy4hhWEPpkmm12F7KSgl0+e
	F2W6ndobGrou3JlpyCQLKsawu19yJSEJTXYLEzp5CKoJOyzdqCjnkZeNiXm+2rHhh7gDGf9rLmdjW
	3SFLvjf/pfKIFmh+17m2ffIMXgZ6+cnpHnKT6TEevoUipz+MSixmf3u6HxZz16859Yba1pHa1l8ML
	4kWgCP5YlertuYHd5iDaf8vQp2UmDbaMfrTjUMBQqgrmGpUC3WOwqFQsCQESlsNhwteM5PgeCJpPt
	BAJsowfQ==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 4/5] x86/xen: Don't register Xen IPIs when they aren't going to be used
Date: Thu, 24 Dec 2020 11:53:22 +0000
Message-Id: <20201224115323.3540130-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201224115323.3540130-1-dwmw2@infradead.org>
References: <20201224115323.3540130-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

In the case where xen_have_vector_callback is false, we still register
the IPI vectors in xen_smp_intr_init() for the secondary CPUs even
though they aren't going to be used. Stop doing that.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/xen/enlighten_hvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index a1c07e0c888e..7a6ef517e81a 100644
--- a/arch/x86/xen/enlighten_hvm.c
+++ b/arch/x86/xen/enlighten_hvm.c
@@ -164,10 +164,10 @@ static int xen_cpu_up_prepare_hvm(unsigned int cpu)
 	else
 		per_cpu(xen_vcpu_id, cpu) = cpu;
 	rc = xen_vcpu_setup(cpu);
-	if (rc)
+	if (rc || !xen_have_vector_callback)
 		return rc;
 
-	if (xen_have_vector_callback && xen_feature(XENFEAT_hvm_safe_pvclock))
+	if (xen_feature(XENFEAT_hvm_safe_pvclock))
 		xen_setup_timer(cpu);
 
 	rc = xen_smp_intr_init(cpu);
-- 
2.26.2


