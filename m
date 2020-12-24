Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4690F2E2684
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 12:54:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58701.103412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksPBl-0002Y0-Iz; Thu, 24 Dec 2020 11:53:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58701.103412; Thu, 24 Dec 2020 11:53:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksPBl-0002Xc-FR; Thu, 24 Dec 2020 11:53:49 +0000
Received: by outflank-mailman (input) for mailman id 58701;
 Thu, 24 Dec 2020 11:53:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Kri=F4=merlin.srs.infradead.org=batv+2cb6e212460c613e05ba+6332+infradead.org+dwmw2@srs-us1.protection.inumbo.net>)
 id 1ksPBk-0002WC-8u
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 11:53:48 +0000
Received: from merlin.infradead.org (unknown [2001:8b0:10b:1231::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 839ae6fa-46d6-4ec2-9691-18c61f485f5d;
 Thu, 24 Dec 2020 11:53:38 +0000 (UTC)
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksPBO-0002b1-JE; Thu, 24 Dec 2020 11:53:26 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1ksPBN-00Er3w-Hp; Thu, 24 Dec 2020 11:53:25 +0000
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
X-Inumbo-ID: 839ae6fa-46d6-4ec2-9691-18c61f485f5d
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=529q7/1gaAJwNhvRKFVZNAtSN1/LIWxT+b3mgEbuAUg=; b=NICvtL4896QMhOF1HTfxSmrS72
	p8d8PA2yocHzLDIM3daetiJEmh4/NglWvaNG3qsGW+4SHQmC4x7CZmZ6IoaALTuRJ7QntYlY52FEc
	H/XwQaYtBOtDdYi6anterI6y7VZ3B3ASgDnJBVoIrClNAH40YAF/sGJ1FRnUmGQozDD3l51AX9i+n
	/KQtzoyhrjDO8DFESvLXDx9r1ViHK8C9XaUhLshO7d7Etxv6iG65UXfxjPpIS/gumxmpZ43ttID3p
	VWxOJ/vZIHR+NZl5OSv+teiaf8k3DXJKDX9n+ivm5NEfLLD0cr/6114tLiqhjAAmoIkWLBMAXhdRt
	YAM0hMjg==;
From: David Woodhouse <dwmw2@infradead.org>
To: x86@kernel.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Juergen Gross <jgross@suse.com>,
	Paul Durrant <pdurrant@amazon.com>,
	jgrall@amazon.com,
	karahmed@amazon.de,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH 5/5] x86/xen: Don't register PV spinlock IPI when it isn't going to be used
Date: Thu, 24 Dec 2020 11:53:23 +0000
Message-Id: <20201224115323.3540130-6-dwmw2@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201224115323.3540130-1-dwmw2@infradead.org>
References: <20201224115323.3540130-1-dwmw2@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: David Woodhouse <dwmw2@infradead.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by merlin.infradead.org. See http://www.infradead.org/rpr.html

From: David Woodhouse <dwmw@amazon.co.uk>

When xen_have_vector_callback is false, we still register the PV spinlock
kicker IPI on the secondary CPUs. Stop doing that.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/xen/spinlock.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
index 799f4eba0a62..b240ea483e63 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -68,7 +68,7 @@ void xen_init_lock_cpu(int cpu)
 	int irq;
 	char *name;
 
-	if (!xen_pvspin)
+	if (!xen_pvspin || !xen_have_vector_callback)
 		return;
 
 	WARN(per_cpu(lock_kicker_irq, cpu) >= 0, "spinlock on CPU%d exists on IRQ%d!\n",
@@ -93,7 +93,7 @@ void xen_init_lock_cpu(int cpu)
 
 void xen_uninit_lock_cpu(int cpu)
 {
-	if (!xen_pvspin)
+	if (!xen_pvspin || !xen_have_vector_callback)
 		return;
 
 	unbind_from_irqhandler(per_cpu(lock_kicker_irq, cpu), NULL);
@@ -115,7 +115,7 @@ PV_CALLEE_SAVE_REGS_THUNK(xen_vcpu_stolen);
 void __init xen_init_spinlocks(void)
 {
 	/*  Don't need to use pvqspinlock code if there is only 1 vCPU. */
-	if (num_possible_cpus() == 1 || nopvspin)
+	if (num_possible_cpus() == 1 || nopvspin || !xen_have_vector_callback)
 		xen_pvspin = false;
 
 	if (!xen_pvspin) {
-- 
2.26.2


