Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E492F4C2C
	for <lists+xen-devel@lfdr.de>; Wed, 13 Jan 2021 14:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66516.118181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzgAO-0002cy-2m; Wed, 13 Jan 2021 13:26:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66516.118181; Wed, 13 Jan 2021 13:26:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzgAN-0002cV-Uv; Wed, 13 Jan 2021 13:26:27 +0000
Received: by outflank-mailman (input) for mailman id 66516;
 Wed, 13 Jan 2021 13:26:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g0Bu=GQ=merlin.srs.infradead.org=batv+bb699a031bde933ae53d+6352+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1kzgAM-0002b0-Gz
 for xen-devel@lists.xenproject.org; Wed, 13 Jan 2021 13:26:26 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a89d3bf1-6045-4d1f-ba49-921e88dc53fd;
 Wed, 13 Jan 2021 13:26:18 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzgA6-0007Xu-0q; Wed, 13 Jan 2021 13:26:10 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1kzgA4-001m3F-V4; Wed, 13 Jan 2021 13:26:08 +0000
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
X-Inumbo-ID: a89d3bf1-6045-4d1f-ba49-921e88dc53fd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=NF5qU2beGi/rF+3rF7wt8hkPc3cRKRCyW5iFlpMo7CY=; b=jpWNDAjgsdyNngY02qMfgCtwL+
	Nt2d18UNDp1y8IYApy+dIVtPBqnZqPlWoy9RmGHCNf26nuybKd/UyVEPmc5rUv1L8gTouGmpL0KrW
	Tvt3j1KFhJDok6DwfyGRwYGVOM1+bZ0OKJBv1zOUztt7cChu2df3sqWc7F8YzCngzao1ItE4+zW6d
	uG3OyqKfmiUk5L8nBfGOJkzbIiJePTtwVgL6AwaB4B2ydCwYs80F3jueNOx0Pu8hRAlwBsOymXh29
	lHTs2+4rU7JIaBLUJyeIU3+NCF+H3ryj26Jyg7Qn9P/Sri0AJn/8+SClE3Otn1u52LGO5dRMZrsms
	vL5FJlwg==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH v4 4/5] x86/xen: Don't register Xen IPIs when they aren't going to be used
Date: Wed, 13 Jan 2021 13:26:05 +0000
Message-Id: <20210113132606.422794-5-dwmw2@infradead.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210113132606.422794-1-dwmw2@infradead.org>
References: <20210113132606.422794-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by merlin.infradead.org. See http://www.infradead.org/rpr.html

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


