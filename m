Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD15A5126BA
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 01:02:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315566.534214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqgF-0006Bx-5O; Wed, 27 Apr 2022 23:02:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315566.534214; Wed, 27 Apr 2022 23:02:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njqgE-0005yF-He; Wed, 27 Apr 2022 23:02:42 +0000
Received: by outflank-mailman (input) for mailman id 315566;
 Wed, 27 Apr 2022 22:51:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIOA=VF=igalia.com=gpiccoli@srs-se1.protection.inumbo.net>)
 id 1njqV0-0003gq-Lf
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 22:51:06 +0000
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8515796a-c67c-11ec-a405-831a346695d4;
 Thu, 28 Apr 2022 00:51:06 +0200 (CEST)
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqUi-00020p-0e; Thu, 28 Apr 2022 00:50:49 +0200
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
X-Inumbo-ID: 8515796a-c67c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=s8xeHJYGrg2PKjTPKivxQn37LuEP6tnBzN9Ru5ARxEw=; b=itLofTxVD3jMCMG1QHrJKsVczn
	vbwUlm+NWg0pMSOCtSjWETMXDXA/dO9ti0V72q001TMmb2gIzR2yZduw7qvMkCQ0akMjJfPi2/PQc
	iUqIhedKtPpwa0f3Qs25a8tdm2oshD1/KMZCL+mdxqH7vtpZXZFld+eSj+8owBfmLjMNmktzOqSfY
	dTb/ic9+j716feaFlMGDFCnVL8lNNI9bMH1gzqsKPsNg72iLmPQmwnJD7EfxHW7NQoAv8T+6Y8VEH
	2ohazyjoc9Z+MNXm7Lr7Bh3GLxJ6zmDCTC3SRdi9P8jirAP5MyZi4cLioUm7IG4Ag3/IwiKZ9+K4K
	3P27PVmg==;
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: akpm@linux-foundation.org,
	bhe@redhat.com,
	pmladek@suse.com,
	kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	coresight@lists.linaro.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-xtensa@linux-xtensa.org,
	netdev@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	rcu@vger.kernel.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org,
	kernel-dev@igalia.com,
	gpiccoli@igalia.com,
	kernel@gpiccoli.net,
	halves@canonical.com,
	fabiomirmar@gmail.com,
	alejandro.j.jimenez@oracle.com,
	andriy.shevchenko@linux.intel.com,
	arnd@arndb.de,
	bp@alien8.de,
	corbet@lwn.net,
	d.hatayama@jp.fujitsu.com,
	dave.hansen@linux.intel.com,
	dyoung@redhat.com,
	feng.tang@intel.com,
	gregkh@linuxfoundation.org,
	mikelley@microsoft.com,
	hidehiro.kawai.ez@hitachi.com,
	jgross@suse.com,
	john.ogness@linutronix.de,
	keescook@chromium.org,
	luto@kernel.org,
	mhiramat@kernel.org,
	mingo@redhat.com,
	paulmck@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	senozhatsky@chromium.org,
	stern@rowland.harvard.edu,
	tglx@linutronix.de,
	vgoyal@redhat.com,
	vkuznets@redhat.com,
	will@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	David Gow <davidgow@google.com>,
	Evan Green <evgreen@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Subject: [PATCH 04/30] firmware: google: Convert regular spinlock into trylock on panic path
Date: Wed, 27 Apr 2022 19:48:58 -0300
Message-Id: <20220427224924.592546-5-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the gsmi driver registers a panic notifier as well as
reboot and die notifiers. The callbacks registered are called in
atomic and very limited context - for instance, panic disables
preemption, local IRQs and all other CPUs that aren't running the
current panic function.

With that said, taking a spinlock in this scenario is a
dangerous invitation for a deadlock scenario. So, we fix
that in this commit by changing the regular spinlock with
a trylock, which is a safer approach.

Fixes: 74c5b31c6618 ("driver: Google EFI SMI")
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: David Gow <davidgow@google.com>
Cc: Evan Green <evgreen@chromium.org>
Cc: Julius Werner <jwerner@chromium.org>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 drivers/firmware/google/gsmi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/google/gsmi.c b/drivers/firmware/google/gsmi.c
index adaa492c3d2d..b01ed02e4a87 100644
--- a/drivers/firmware/google/gsmi.c
+++ b/drivers/firmware/google/gsmi.c
@@ -629,7 +629,10 @@ static int gsmi_shutdown_reason(int reason)
 	if (saved_reason & (1 << reason))
 		return 0;
 
-	spin_lock_irqsave(&gsmi_dev.lock, flags);
+	if (!spin_trylock_irqsave(&gsmi_dev.lock, flags)) {
+		rc = -EBUSY;
+		goto out;
+	}
 
 	saved_reason |= (1 << reason);
 
@@ -646,6 +649,7 @@ static int gsmi_shutdown_reason(int reason)
 
 	spin_unlock_irqrestore(&gsmi_dev.lock, flags);
 
+out:
 	if (rc < 0)
 		printk(KERN_ERR "gsmi: Log Shutdown Reason failed\n");
 	else
-- 
2.36.0


