Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5EE2C4301
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 16:37:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37832.70374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khwpz-00025x-RF; Wed, 25 Nov 2020 15:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37832.70374; Wed, 25 Nov 2020 15:36:07 +0000
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
	id 1khwpz-00025Y-Nx; Wed, 25 Nov 2020 15:36:07 +0000
Received: by outflank-mailman (input) for mailman id 37832;
 Wed, 25 Nov 2020 15:36:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kPj2=E7=kernel.org=sashal@srs-us1.protection.inumbo.net>)
 id 1khwpy-00025T-5c
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 15:36:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19acc88e-9036-444e-842e-2d883727306b;
 Wed, 25 Nov 2020 15:36:05 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 56F8C20872;
 Wed, 25 Nov 2020 15:36:03 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=kPj2=E7=kernel.org=sashal@srs-us1.protection.inumbo.net>)
	id 1khwpy-00025T-5c
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 15:36:06 +0000
X-Inumbo-ID: 19acc88e-9036-444e-842e-2d883727306b
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 19acc88e-9036-444e-842e-2d883727306b;
	Wed, 25 Nov 2020 15:36:05 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 56F8C20872;
	Wed, 25 Nov 2020 15:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606318564;
	bh=mG6o+nKVwn1pUXo6FFrQYjWoCcXjJrRR/UibXVtgk8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LO5cCEWweuQ6F6hT7djsWLg9U0bvdkssAhggHH11wlv+nuptNJlhYFJbW+3K0YR3M
	 bFyckja4vjp7UfledE8etDz1ScYR5GEDvFFr2xzETp/xnWTCtBMJ2B5HkX+v5m/l2T
	 K+kR8vPsp7k33wgyOM81Ysr5n5AK+mG/VwZebDEM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Brian Masney <bmasney@redhat.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: [PATCH AUTOSEL 5.9 10/33] x86/xen: don't unbind uninitialized lock_kicker_irq
Date: Wed, 25 Nov 2020 10:35:27 -0500
Message-Id: <20201125153550.810101-10-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201125153550.810101-1-sashal@kernel.org>
References: <20201125153550.810101-1-sashal@kernel.org>
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
index 799f4eba0a621..043c73dfd2c98 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -93,10 +93,20 @@ void xen_init_lock_cpu(int cpu)
 
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


