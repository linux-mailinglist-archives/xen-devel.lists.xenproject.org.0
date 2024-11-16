Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC699CFCDC
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 07:07:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838591.1254568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCBwn-0003H5-Bc; Sat, 16 Nov 2024 06:06:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838591.1254568; Sat, 16 Nov 2024 06:06:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tCBwn-0003ER-8M; Sat, 16 Nov 2024 06:06:17 +0000
Received: by outflank-mailman (input) for mailman id 838591;
 Sat, 16 Nov 2024 06:06:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k39F=SL=wanadoo.fr=christophe.jaillet@srs-se1.protection.inumbo.net>)
 id 1tCBwm-0003Aq-5m
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 06:06:16 +0000
Received: from smtp.smtpout.orange.fr (smtp-17.smtpout.orange.fr
 [80.12.242.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dbfa98fa-a3e0-11ef-99a3-01e77a169b0f;
 Sat, 16 Nov 2024 07:06:03 +0100 (CET)
Received: from localhost.localdomain ([90.11.132.44])
 by smtp.orange.fr with ESMTPA
 id CBwItlkEVyQmhCBwItrt0n; Sat, 16 Nov 2024 07:06:02 +0100
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
X-Inumbo-ID: dbfa98fa-a3e0-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjgwLjEyLjI0Mi4xNyIsImhlbG8iOiJzbXRwLnNtdHBvdXQub3JhbmdlLmZyIn0=
X-Custom-Transaction: eyJpZCI6ImRiZmE5OGZhLWEzZTAtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNzM3MTYzLjU2MDgwMywic2VuZGVyIjoiY2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnIiLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731737162;
	bh=1GOO379j5kHelQgT13xeDCIW+pFPJCeiM7WSIuvag78=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mL98MjzVZSShtzisX9zbjDjIb7KE72buAzIx9jorkgCEIlxacBGBiKDqnznYupede
	 vEhaEvssP8Otw+abSwd4UipThVl5qw3v6w8RixuAXgrl/p9FBRiYmldRfZZljgK0OD
	 FX0UB9px2S9OjhfpAHnQggpK1elWNH8UBNVIvO5x+AsAiYtyf4oGwInz8jFtqh7DDu
	 OMNwG4GURPpChqfcVzLVhpacwz+NEqWf9xIvmwF/gxmCGy7nRrRkaf4TeGrlu6c0Ll
	 o9NHONgP90fIf7c6ZsyFFLJ/v2i9NFywx5+jxHfxBiA3eBfpU5DKAu5obNXbrUQywu
	 rI95zY+eQlUcg==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 16 Nov 2024 07:06:02 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: eahariha@linux.microsoft.com
Cc: James.Bottomley@HansenPartnership.com,
	Julia.Lawall@inria.fr,
	agordeev@linux.ibm.com,
	airlied@gmail.com,
	akpm@linux-foundation.org,
	andrew+netdev@lunn.ch,
	anna-maria@linutronix.de,
	ath11k@lists.infradead.org,
	axboe@kernel.dk,
	bcm-kernel-feedback-list@broadcom.com,
	borntraeger@linux.ibm.com,
	catalin.marinas@arm.com,
	ceph-devel@vger.kernel.org,
	christian.gmeiner@gmail.com,
	christophe.leroy@csgroup.eu,
	cocci@inria.fr,
	coreteam@netfilter.org,
	daniel@zonque.org,
	davem@davemloft.net,
	dick.kennedy@broadcom.com,
	dri-devel@lists.freedesktop.org,
	edumazet@google.com,
	etnaviv@lists.freedesktop.org,
	florian.fainelli@broadcom.com,
	gor@linux.ibm.com,
	gregkh@linuxfoundation.org,
	haojian.zhuang@gmail.com,
	hca@linux.ibm.com,
	horms@kernel.org,
	idryomov@gmail.com,
	intel-xe@lists.freedesktop.org,
	james.smart@broadcom.com,
	jeroendb@google.com,
	jikos@kernel.org,
	jinpu.wang@cloud.ionos.com,
	jjohnson@kernel.org,
	joe.lawrence@redhat.com,
	johan.hedberg@gmail.com,
	jpoimboe@kernel.org,
	kadlec@netfilter.org,
	kuba@kernel.org,
	kvalo@kernel.org,
	l.stach@pengutronix.de,
	linux+etnaviv@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-wireless@vger.kernel.org,
	linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org,
	live-patching@vger.kernel.org,
	louis.peens@corigine.com,
	lucas.demarchi@intel.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	maddy@linux.ibm.com,
	marcel@holtmann.org,
	martin.petersen@oracle.com,
	mbenes@suse.cz,
	mpe@ellerman.id.au,
	mripard@kernel.org,
	naveen@kernel.org,
	netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	nicolas.palix@imag.fr,
	npiggin@gmail.com,
	obitton@habana.ai,
	ogabbay@kernel.org,
	oss-drivers@corigine.com,
	pabeni@redhat.com,
	pablo@netfilter.org,
	perex@perex.cz,
	pkaligineedi@google.com,
	pmladek@suse.com,
	rjui@broadcom.com,
	robert.jarzmik@free.fr,
	rodrigo.vivi@intel.com,
	roger.pau@citrix.com,
	sbranden@broadcom.com,
	shailend@google.com,
	simona@ffwll.ch,
	svens@linux.ibm.com,
	thomas.hellstrom@linux.intel.com,
	tiwai@suse.com,
	tzimmermann@suse.de,
	xen-devel@lists.xenproject.org,
	xiubli@redhat.com
Subject: Re: [PATCH v2 02/21] coccinelle: misc: Add secs_to_jiffies script
Date: Sat, 16 Nov 2024 07:05:40 +0100
Message-ID: <20241116060541.5798-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v2-2-911fb7595e79@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
> Suggested-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> ---
>   scripts/coccinelle/misc/secs_to_jiffies.cocci | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> new file mode 100644
> index 0000000000000000000000000000000000000000..af762b1c0aac8f044f21150bfaafd9efc834ee87
> --- /dev/null
> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +///
> +/// Find usages of:
> +/// - msecs_to_jiffies(value*1000)
> +/// - msecs_to_jiffies(value*MSEC_PER_SEC)
> +///
> +// Confidence: High
> +// Copyright: (C) 2024 Easwar Hariharan Microsoft
> +//
> +// Keywords: secs, seconds, jiffies
> +//
> +
> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * 1000)
> ++ secs_to_jiffies(C)
> +
> +@@ constant C; @@
> +
> +- msecs_to_jiffies(C * MSEC_PER_SEC)
> ++ secs_to_jiffies(C)
> 
Hi,

	@@ constant C =~ "000"; @@

	* msecs_to_jiffies(C)

also spots things like msecs_to_jiffies(1000)

I'm not sure that coccinelle is enable to capture part of the regex to automate the removal of the 000 when converting from ms to s.

Just my 2c,

CJ

