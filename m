Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DEB2C431C
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 16:38:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37857.70435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khws5-0002f1-Fi; Wed, 25 Nov 2020 15:38:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37857.70435; Wed, 25 Nov 2020 15:38:17 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khws5-0002ea-CI; Wed, 25 Nov 2020 15:38:17 +0000
Received: by outflank-mailman (input) for mailman id 37857;
 Wed, 25 Nov 2020 15:38:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kPj2=E7=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1khws4-0002eG-8c
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 15:38:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff96824a-4190-4410-8429-a0a9a861c5ba;
 Wed, 25 Nov 2020 15:38:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 01517221F7;
 Wed, 25 Nov 2020 15:38:13 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kPj2=E7=kernel.org=sashal@srs-us1.protection.inumbo.net>)
	id 1khws4-0002eG-8c
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 15:38:16 +0000
X-Inumbo-ID: ff96824a-4190-4410-8429-a0a9a861c5ba
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ff96824a-4190-4410-8429-a0a9a861c5ba;
	Wed, 25 Nov 2020 15:38:15 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 01517221F7;
	Wed, 25 Nov 2020 15:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606318694;
	bh=N/9mYrylQeD41uQIKVHiCHGYsB0T/taFOwU3YpP8X10=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Lo4JgGow5MYRduf7OeWzK3goSVQahSBK1lbpvaZKQmbYKktiB97AEF1nsDDQC0o/1
	 AW+bMxKiQ5mpffwv0OaKFcOh0J6x3xDBjwD8lknz69ziKATiyaT+j1LqXFDkPF9SIL
	 K/UnS+2ldeDyfzXD4RH92ATIXm1WYD06xgwPCtnE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Brian Masney <bmasney@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 4.4 4/8] x86/xen: don't unbind uninitialized lock_kicker_irq
Date: Wed, 25 Nov 2020 10:38:04 -0500
Message-Id: <20201125153808.811104-4-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125153808.811104-1-sashal@kernel.org>
References: <20201125153808.811104-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Brian Masney <bmasney@redhat.com>

[ Upstream commit 65cae18882f943215d0505ddc7e70495877308e6 ]

When booting a hyperthreaded system with the kernel parameter
'mitigations=auto,nosmt', the following warning occurs:

    WARNING: CPU: 0 PID: 1 at drivers/xen/events/events_base.c:1112 unbind_from_irqhandler+0x4e/0x60
    ...
    Hardware name: Xen HVM domU, BIOS 4.2.amazon 08/24/2006
    ...
    Call Trace:
     xen_uninit_lock_cpu+0x28/0x62
     xen_hvm_cpu_die+0x21/0x30
     takedown_cpu+0x9c/0xe0
     ? trace_suspend_resume+0x60/0x60
     cpuhp_invoke_callback+0x9a/0x530
     _cpu_up+0x11a/0x130
     cpu_up+0x7e/0xc0
     bringup_nonboot_cpus+0x48/0x50
     smp_init+0x26/0x79
     kernel_init_freeable+0xea/0x229
     ? rest_init+0xaa/0xaa
     kernel_init+0xa/0x106
     ret_from_fork+0x35/0x40

The secondary CPUs are not activated with the nosmt mitigations and only
the primary thread on each CPU core is used. In this situation,
xen_hvm_smp_prepare_cpus(), and more importantly xen_init_lock_cpu(), is
not called, so the lock_kicker_irq is not initialized for the secondary
CPUs. Let's fix this by exiting early in xen_uninit_lock_cpu() if the
irq is not set to avoid the warning from above for each secondary CPU.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Link: https://lore.kernel.org/r/20201107011119.631442-1-bmasney@redhat.com
Reviewed-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/xen/spinlock.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
index 85872a08994a1..e9fc0f7df0da8 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -301,10 +301,20 @@ void xen_init_lock_cpu(int cpu)
 
 void xen_uninit_lock_cpu(int cpu)
 {
+	int irq;
+
 	if (!xen_pvspin)
 		return;
 
-	unbind_from_irqhandler(per_cpu(lock_kicker_irq, cpu), NULL);
+	/*
+	 * When booting the kernel with 'mitigations=auto,nosmt', the secondary
+	 * CPUs are not activated, and lock_kicker_irq is not initialized.
+	 */
+	irq = per_cpu(lock_kicker_irq, cpu);
+	if (irq == -1)
+		return;
+
+	unbind_from_irqhandler(irq, NULL);
 	per_cpu(lock_kicker_irq, cpu) = -1;
 	kfree(per_cpu(irq_name, cpu));
 	per_cpu(irq_name, cpu) = NULL;
-- 
2.27.0


