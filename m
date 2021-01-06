Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16E6F2EC08F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 16:41:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62549.110860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxAw2-0005F8-JO; Wed, 06 Jan 2021 15:41:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62549.110860; Wed, 06 Jan 2021 15:41:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxAw2-0005Eh-G8; Wed, 06 Jan 2021 15:41:18 +0000
Received: by outflank-mailman (input) for mailman id 62549;
 Wed, 06 Jan 2021 15:41:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uuk6=GJ=casper.srs.infradead.org=batv+df3317c4eb17e534fc2b+6345+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kxAw0-00058z-O9
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 15:41:16 +0000
Received: from casper.infradead.org (unknown [2001:8b0:10b:1236::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 066f1fc7-aa8d-43f7-9d6d-9b8e128c5996;
 Wed, 06 Jan 2021 15:41:09 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1kxAun-002TH1-UM; Wed, 06 Jan 2021 15:40:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kxAul-002S22-VC; Wed, 06 Jan 2021 15:39:59 +0000
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
X-Inumbo-ID: 066f1fc7-aa8d-43f7-9d6d-9b8e128c5996
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NF5qU2beGi/rF+3rF7wt8hkPc3cRKRCyW5iFlpMo7CY=; b=KKgso+wyjQZM0Ao6KZwk6jh2nu
	JcllBJx0JtKCR+3joqeEAtAgWujqrvpjUEPHw7fxi/VTFSRQqUvi9KAtWVKmVewTmSw4I1VlxbXDQ
	Z7KU5M953SP5xGKyCxfQ8pL6dKeuuQqj70Fd0CaBiJOcGrvLSkFgd4vUANc1simwbqqVm4MnB71PJ
	tvn7UWIeIrW7fVWd9vZVCrseepPtYrdQQCE4RsmTuFGR3t5tjt8b/r0UTypMlqd8LMewUIfP7sVo5
	yEcpvXz71L/nXW0Il3M2Ml3bMJb6ix4C7IITr7mxxTt0ZwQgvE2MbGJk7v4+sPeRRov0BEL9Gfut2
	LWgMavOg==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 4/5] x86/xen: Don't register Xen IPIs when they aren't going to be used
Date: Wed,  6 Jan 2021 15:39:57 +0000
Message-Id: <20210106153958.584169-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106153958.584169-1-dwmw2@infradead.org>
References: <20210106153958.584169-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

In the case where xen_have_vector_callback is false, we still register
the IPI vectors in xen_smp_intr_init() for the secondary CPUs even
though they aren't going to be used. Stop doing that.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 arch/x86/xen/enlighten_hvm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/xen/enlighten_hvm.c b/arch/x86/xen/enlighten_hvm.c
index ec50b7423a4c..e68ea5f4ad1c 100644
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
2.29.2


