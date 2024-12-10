Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE82F9EBD66
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 23:12:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853306.1266844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL8ST-0004vV-Gu; Tue, 10 Dec 2024 22:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853306.1266844; Tue, 10 Dec 2024 22:11:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tL8ST-0004sM-AP; Tue, 10 Dec 2024 22:11:57 +0000
Received: by outflank-mailman (input) for mailman id 853306;
 Tue, 10 Dec 2024 22:11:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9guP=TD=linux.microsoft.com=eahariha@srs-se1.protection.inumbo.net>)
 id 1tL8Ji-0001xA-Nj
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 22:02:54 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7e705e6e-b742-11ef-a0d5-8be0dac302b0;
 Tue, 10 Dec 2024 23:02:49 +0100 (CET)
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
 by linux.microsoft.com (Postfix) with ESMTPSA id C173C20ACD6E;
 Tue, 10 Dec 2024 14:02:39 -0800 (PST)
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
X-Inumbo-ID: 7e705e6e-b742-11ef-a0d5-8be0dac302b0
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C173C20ACD6E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733868159;
	bh=RbQWNnMSFMFriUk4NuHYTwiGcsEx+EnrYdZ9JaogvX4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=e/J9gwCA4uBKGknzsmiO3oet8slWv1kdiClhfZ9LTUvDcAr8km71ONqn/wjRdmpri
	 4EyHjbbYG4CKX/8T2eN5ATCPWVrLNipH5jKYYefAMdH+qlSBTJn1LIV6HX/UxzfdGn
	 9DHlxQpHUKnw1xm9c/b/XukYCVTGP1/9SF9qgehM=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Date: Tue, 10 Dec 2024 22:02:49 +0000
Subject: [PATCH v3 18/19] livepatch: Convert timeouts to secs_to_jiffies()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-converge-secs-to-jiffies-v3-18-ddfefd7e9f2a@linux.microsoft.com>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
In-Reply-To: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>, 
 Jozsef Kadlecsik <kadlec@netfilter.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>, 
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>, 
 Oded Gabbay <ogabbay@kernel.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jeroen de Borst <jeroendb@google.com>, 
 Praveen Kaligineedi <pkaligineedi@google.com>, 
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 James Smart <james.smart@broadcom.com>, 
 Dick Kennedy <dick.kennedy@broadcom.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Jack Wang <jinpu.wang@cloud.ionos.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Xiubo Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, 
 Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
 Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Louis Peens <louis.peens@corigine.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@inria.fr, 
 linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-scsi@vger.kernel.org, xen-devel@lists.xenproject.org, 
 linux-block@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-mm@kvack.org, 
 linux-bluetooth@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org, 
 live-patching@vger.kernel.org, linux-sound@vger.kernel.org, 
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Easwar Hariharan <eahariha@linux.microsoft.com>
X-Mailer: b4 0.14.2

Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
secs_to_jiffies(). As the value here is a multiple of 1000, use
secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.

This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
the following Coccinelle rules:

@@ constant C; @@

- msecs_to_jiffies(C * 1000)
+ secs_to_jiffies(C)

@@ constant C; @@

- msecs_to_jiffies(C * MSEC_PER_SEC)
+ secs_to_jiffies(C)

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 samples/livepatch/livepatch-callbacks-busymod.c |  3 +--
 samples/livepatch/livepatch-shadow-fix1.c       |  3 +--
 samples/livepatch/livepatch-shadow-mod.c        | 15 +++++----------
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/samples/livepatch/livepatch-callbacks-busymod.c b/samples/livepatch/livepatch-callbacks-busymod.c
index 378e2d40271a9717d09eff51d3d3612c679736fc..69105596e72e6826aa2815cb2599eea56a0055ba 100644
--- a/samples/livepatch/livepatch-callbacks-busymod.c
+++ b/samples/livepatch/livepatch-callbacks-busymod.c
@@ -44,8 +44,7 @@ static void busymod_work_func(struct work_struct *work)
 static int livepatch_callbacks_mod_init(void)
 {
 	pr_info("%s\n", __func__);
-	schedule_delayed_work(&work,
-		msecs_to_jiffies(1000 * 0));
+	schedule_delayed_work(&work, 0);
 	return 0;
 }
 
diff --git a/samples/livepatch/livepatch-shadow-fix1.c b/samples/livepatch/livepatch-shadow-fix1.c
index 6701641bf12d454a770e49abeeb0dea92560e55e..f3f153895d6ce751fc91ae1224d91b220cba3e37 100644
--- a/samples/livepatch/livepatch-shadow-fix1.c
+++ b/samples/livepatch/livepatch-shadow-fix1.c
@@ -72,8 +72,7 @@ static struct dummy *livepatch_fix1_dummy_alloc(void)
 	if (!d)
 		return NULL;
 
-	d->jiffies_expire = jiffies +
-		msecs_to_jiffies(1000 * EXPIRE_PERIOD);
+	d->jiffies_expire = jiffies + secs_to_jiffies(EXPIRE_PERIOD);
 
 	/*
 	 * Patch: save the extra memory location into a SV_LEAK shadow
diff --git a/samples/livepatch/livepatch-shadow-mod.c b/samples/livepatch/livepatch-shadow-mod.c
index 7e753b0d2fa611524c9e2adbe02c8fa3e9b6015e..5d83ad5a8118dbbac897dfcbb92e6d5f399d1dc3 100644
--- a/samples/livepatch/livepatch-shadow-mod.c
+++ b/samples/livepatch/livepatch-shadow-mod.c
@@ -101,8 +101,7 @@ static __used noinline struct dummy *dummy_alloc(void)
 	if (!d)
 		return NULL;
 
-	d->jiffies_expire = jiffies +
-		msecs_to_jiffies(1000 * EXPIRE_PERIOD);
+	d->jiffies_expire = jiffies + secs_to_jiffies(EXPIRE_PERIOD);
 
 	/* Oops, forgot to save leak! */
 	leak = kzalloc(sizeof(*leak), GFP_KERNEL);
@@ -152,8 +151,7 @@ static void alloc_work_func(struct work_struct *work)
 	list_add(&d->list, &dummy_list);
 	mutex_unlock(&dummy_list_mutex);
 
-	schedule_delayed_work(&alloc_dwork,
-		msecs_to_jiffies(1000 * ALLOC_PERIOD));
+	schedule_delayed_work(&alloc_dwork, secs_to_jiffies(ALLOC_PERIOD));
 }
 
 /*
@@ -184,16 +182,13 @@ static void cleanup_work_func(struct work_struct *work)
 	}
 	mutex_unlock(&dummy_list_mutex);
 
-	schedule_delayed_work(&cleanup_dwork,
-		msecs_to_jiffies(1000 * CLEANUP_PERIOD));
+	schedule_delayed_work(&cleanup_dwork, secs_to_jiffies(CLEANUP_PERIOD));
 }
 
 static int livepatch_shadow_mod_init(void)
 {
-	schedule_delayed_work(&alloc_dwork,
-		msecs_to_jiffies(1000 * ALLOC_PERIOD));
-	schedule_delayed_work(&cleanup_dwork,
-		msecs_to_jiffies(1000 * CLEANUP_PERIOD));
+	schedule_delayed_work(&alloc_dwork, secs_to_jiffies(ALLOC_PERIOD));
+	schedule_delayed_work(&cleanup_dwork, secs_to_jiffies(CLEANUP_PERIOD));
 
 	return 0;
 }

-- 
2.43.0


