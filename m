Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FC99CF7A2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 22:31:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838148.1254191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC3um-000527-Sw; Fri, 15 Nov 2024 21:31:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838148.1254191; Fri, 15 Nov 2024 21:31:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC3um-0004zh-Pk; Fri, 15 Nov 2024 21:31:40 +0000
Received: by outflank-mailman (input) for mailman id 838148;
 Fri, 15 Nov 2024 21:31:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5OXi=SK=linux.microsoft.com=eahariha@srs-se1.protection.inumbo.net>)
 id 1tC3qA-0007AP-M8
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 21:26:54 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 546242af-a398-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 22:26:51 +0100 (CET)
Received: from eahariha-devbox.internal.cloudapp.net (unknown [40.91.112.99])
 by linux.microsoft.com (Postfix) with ESMTPSA id 5CD1F2064AE2;
 Fri, 15 Nov 2024 13:26:45 -0800 (PST)
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
X-Inumbo-ID: 546242af-a398-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzLjc3LjE1NC4xODIiLCJoZWxvIjoibGludXgubWljcm9zb2Z0LmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjU0NjI0MmFmLWEzOTgtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNzA2MDEyLjI4MTk4MSwic2VuZGVyIjoiZWFoYXJpaGFAbGludXgubWljcm9zb2Z0LmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5CD1F2064AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731706005;
	bh=DChbJW+DaqGHGWE0sMF41tmxT4FReQ1FKA/KDyHL32Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ge1adyPGW09osua+wGGbdGdLanSrZuA2fUn6nHmkQB9BNqn7wXFeAp1cdPu9VCOCp
	 35/hCv3XcEWTsrlvlhY2AjaoCI0WZCFykTU/SVB+MenGuEggOAvCtL12icddG0ZBHS
	 CbMDQbZbPdYcJR1LvpcZibK937QvjL6m/Aizu5/Q=
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Date: Fri, 15 Nov 2024 21:26:36 +0000
Subject: [PATCH v2 19/21] livepatch: Convert timeouts to secs_to_jiffies()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241115-converge-secs-to-jiffies-v2-19-911fb7595e79@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
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
 Takashi Iwai <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Louis Peens <louis.peens@corigine.com>, 
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
 etnaviv@lists.freedesktop.org, oss-drivers@corigine.com, 
 linuxppc-dev@lists.ozlabs.org, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Easwar Hariharan <eahariha@linux.microsoft.com>
X-Mailer: b4 0.14.2

Changes made with the following Coccinelle rules:

@@ constant C; @@

- msecs_to_jiffies(C * 1000)
+ secs_to_jiffies(C)

@@ constant C; @@

- msecs_to_jiffies(C * MSEC_PER_SEC)
+ secs_to_jiffies(C)

Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
---
 samples/livepatch/livepatch-callbacks-busymod.c |  2 +-
 samples/livepatch/livepatch-shadow-fix1.c       |  2 +-
 samples/livepatch/livepatch-shadow-mod.c        | 10 +++++-----
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/samples/livepatch/livepatch-callbacks-busymod.c b/samples/livepatch/livepatch-callbacks-busymod.c
index 378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993badcc9aba 100644
--- a/samples/livepatch/livepatch-callbacks-busymod.c
+++ b/samples/livepatch/livepatch-callbacks-busymod.c
@@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
 {
 	pr_info("%s\n", __func__);
 	schedule_delayed_work(&work,
-		msecs_to_jiffies(1000 * 0));
+		secs_to_jiffies(0));
 	return 0;
 }
 
diff --git a/samples/livepatch/livepatch-shadow-fix1.c b/samples/livepatch/livepatch-shadow-fix1.c
index 6701641bf12d454a770e49abeeb0dea92560e55e..948ea1f5760fed2fa27baf478c97cf98ad5c99a8 100644
--- a/samples/livepatch/livepatch-shadow-fix1.c
+++ b/samples/livepatch/livepatch-shadow-fix1.c
@@ -73,7 +73,7 @@ static struct dummy *livepatch_fix1_dummy_alloc(void)
 		return NULL;
 
 	d->jiffies_expire = jiffies +
-		msecs_to_jiffies(1000 * EXPIRE_PERIOD);
+		secs_to_jiffies(EXPIRE_PERIOD);
 
 	/*
 	 * Patch: save the extra memory location into a SV_LEAK shadow
diff --git a/samples/livepatch/livepatch-shadow-mod.c b/samples/livepatch/livepatch-shadow-mod.c
index 7e753b0d2fa611524c9e2adbe02c8fa3e9b6015e..79296e6ccb119f521e86a121623855d841c9fc5e 100644
--- a/samples/livepatch/livepatch-shadow-mod.c
+++ b/samples/livepatch/livepatch-shadow-mod.c
@@ -102,7 +102,7 @@ static __used noinline struct dummy *dummy_alloc(void)
 		return NULL;
 
 	d->jiffies_expire = jiffies +
-		msecs_to_jiffies(1000 * EXPIRE_PERIOD);
+		secs_to_jiffies(EXPIRE_PERIOD);
 
 	/* Oops, forgot to save leak! */
 	leak = kzalloc(sizeof(*leak), GFP_KERNEL);
@@ -153,7 +153,7 @@ static void alloc_work_func(struct work_struct *work)
 	mutex_unlock(&dummy_list_mutex);
 
 	schedule_delayed_work(&alloc_dwork,
-		msecs_to_jiffies(1000 * ALLOC_PERIOD));
+		secs_to_jiffies(ALLOC_PERIOD));
 }
 
 /*
@@ -185,15 +185,15 @@ static void cleanup_work_func(struct work_struct *work)
 	mutex_unlock(&dummy_list_mutex);
 
 	schedule_delayed_work(&cleanup_dwork,
-		msecs_to_jiffies(1000 * CLEANUP_PERIOD));
+		secs_to_jiffies(CLEANUP_PERIOD));
 }
 
 static int livepatch_shadow_mod_init(void)
 {
 	schedule_delayed_work(&alloc_dwork,
-		msecs_to_jiffies(1000 * ALLOC_PERIOD));
+		secs_to_jiffies(ALLOC_PERIOD));
 	schedule_delayed_work(&cleanup_dwork,
-		msecs_to_jiffies(1000 * CLEANUP_PERIOD));
+		secs_to_jiffies(CLEANUP_PERIOD));
 
 	return 0;
 }

-- 
2.34.1


