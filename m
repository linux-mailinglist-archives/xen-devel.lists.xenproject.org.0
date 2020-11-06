Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CEA2A8E90
	for <lists+xen-devel@lfdr.de>; Fri,  6 Nov 2020 06:08:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20292.46247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1katyv-0000Tf-6I; Fri, 06 Nov 2020 05:08:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20292.46247; Fri, 06 Nov 2020 05:08:13 +0000
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
	id 1katyv-0000TI-1m; Fri, 06 Nov 2020 05:08:13 +0000
Received: by outflank-mailman (input) for mailman id 20292;
 Fri, 06 Nov 2020 00:35:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rXhF=EM=redhat.com=bmasney@srs-us1.protection.inumbo.net>)
 id 1kapjG-0005Du-IE
 for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 00:35:46 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 24a5d140-b925-4246-ad47-1ba62707fb0c;
 Fri, 06 Nov 2020 00:35:45 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-oBfxYjUMOlOlj2Sr5S426Q-1; Thu, 05 Nov 2020 19:35:44 -0500
Received: by mail-qv1-f71.google.com with SMTP id q19so2085366qvs.5
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 16:35:44 -0800 (PST)
Received: from tp-x1.redhat.com (c-98-239-145-235.hsd1.wv.comcast.net.
 [98.239.145.235])
 by smtp.gmail.com with ESMTPSA id b3sm2002837qte.85.2020.11.05.16.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 16:35:42 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rXhF=EM=redhat.com=bmasney@srs-us1.protection.inumbo.net>)
	id 1kapjG-0005Du-IE
	for xen-devel@lists.xenproject.org; Fri, 06 Nov 2020 00:35:46 +0000
X-Inumbo-ID: 24a5d140-b925-4246-ad47-1ba62707fb0c
Received: from us-smtp-delivery-124.mimecast.com (unknown [216.205.24.124])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 24a5d140-b925-4246-ad47-1ba62707fb0c;
	Fri, 06 Nov 2020 00:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604622945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8cFssZ0LJiNsdeVizgTqZXbeUskMHHnTsA2koKzQk4Y=;
	b=Rpp4WvTmcBGh64Tds/KVDD8VVVW9x9VBu7eFzTva6HReuDQPLBPxaOIo4/CNlQOcQQCYJY
	tXkT7sli7AQeKDyNg7NahYvSVdpSn74HfVWvibvZi6S7JG8vs2FX3StUENabFYEGF/szQz
	v/DvUkW6Qs2FFQAUJRXZ/PZnQ9R8FlU=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-oBfxYjUMOlOlj2Sr5S426Q-1; Thu, 05 Nov 2020 19:35:44 -0500
X-MC-Unique: oBfxYjUMOlOlj2Sr5S426Q-1
Received: by mail-qv1-f71.google.com with SMTP id q19so2085366qvs.5
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 16:35:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8cFssZ0LJiNsdeVizgTqZXbeUskMHHnTsA2koKzQk4Y=;
        b=pawlFFp99l74iiahRy94bE3jGq8P33UQ669zMHLYCHQ146US5ZAXrQBmnY4CWH5124
         yUVFeUJ1GbVrS9nb1YSixeViYTXfbdFScDacyByXIGgLNKAmRvMJDz5A2MI4q5J1K8uw
         KZFvB8hLbPze969f8pN42EmFUxJNKvXSyNM8OgpGCkJyPvDJa0H+war7JKrouqRraQva
         epcfcs+4rx24I5W0X86jQX8/PbDCHDMBPhGZvu4yLVzqAkA8+uefkdYU2BFCmmmH7sBw
         OZc0t2/7UDSo2Ubpx9dTEHp/xWxgCTM5hQFO9jm+ruzdyXBo/Z1PgBGryc1kZkhdiNQI
         /WzA==
X-Gm-Message-State: AOAM530/rL3aons88OGrXcu0dYi7qr4Cx+LA2ABklvR51F0EUr6y+SdP
	wYnK4hC/KQH8sGZYDd6k3e9vdEYM8/F2QFhi6j3j8x0rsNXfn7FRwwoGFuSmAn45nI+iHT6yAw7
	4/EUazCzQ0NKmEvdP4QZD4Wq56ZE=
X-Received: by 2002:a37:617:: with SMTP id 23mr4692633qkg.256.1604622943547;
        Thu, 05 Nov 2020 16:35:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxcXHlYQXweZgP7+K8o61FNzv2e/Th67Tuvn2dyHTEh2Lw53WCzH/qHH2/nUUSBWuJ16IKdJg==
X-Received: by 2002:a37:617:: with SMTP id 23mr4692615qkg.256.1604622943297;
        Thu, 05 Nov 2020 16:35:43 -0800 (PST)
Received: from tp-x1.redhat.com (c-98-239-145-235.hsd1.wv.comcast.net. [98.239.145.235])
        by smtp.gmail.com with ESMTPSA id b3sm2002837qte.85.2020.11.05.16.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 16:35:42 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
To: boris.ostrovsky@oracle.com,
	jgross@suse.com,
	sstabellini@kernel.org
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	xen-devel@lists.xenproject.org,
	linux-kernel@vger.kernel.org,
	dustymabe@redhat.com
Subject: [PATCH] x86/xen: fix warning when running with nosmt mitigations
Date: Thu,  5 Nov 2020 19:35:29 -0500
Message-Id: <20201106003529.391649-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=bmasney@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

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
---
 arch/x86/xen/spinlock.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/xen/spinlock.c b/arch/x86/xen/spinlock.c
index 799f4eba0a62..4a052459a08e 100644
--- a/arch/x86/xen/spinlock.c
+++ b/arch/x86/xen/spinlock.c
@@ -93,9 +93,24 @@ void xen_init_lock_cpu(int cpu)
 
 void xen_uninit_lock_cpu(int cpu)
 {
+	int irq;
+
 	if (!xen_pvspin)
 		return;
 
+	/*
+	 * When booting the kernel with 'mitigations=auto,nosmt', the secondary
+	 * CPUs are not activated and only the primary thread on each CPU core
+	 * is used. In this situation, xen_hvm_smp_prepare_cpus(), and more
+	 * importantly xen_init_lock_cpu(), is not called, so the
+	 * lock_kicker_irq is not initialized for the secondary CPUs. Let's
+	 * exit early if the irq is not set to avoid a warning in the console
+	 * log.
+	 */
+	irq = per_cpu(lock_kicker_irq, cpu);
+	if (irq == -1)
+		return;
+
 	unbind_from_irqhandler(per_cpu(lock_kicker_irq, cpu), NULL);
 	per_cpu(lock_kicker_irq, cpu) = -1;
 	kfree(per_cpu(irq_name, cpu));
-- 
2.26.2


