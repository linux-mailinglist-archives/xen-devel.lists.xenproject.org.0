Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6D29CFA29
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 23:38:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838462.1254452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC4xO-0002OV-DN; Fri, 15 Nov 2024 22:38:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838462.1254452; Fri, 15 Nov 2024 22:38:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC4xO-0002Lu-AE; Fri, 15 Nov 2024 22:38:26 +0000
Received: by outflank-mailman (input) for mailman id 838462;
 Fri, 15 Nov 2024 22:38:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q8n7=SK=canb.auug.org.au=sfr@srs-se1.protection.inumbo.net>)
 id 1tC4xN-0002I7-Az
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 22:38:25 +0000
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50ad2563-a3a2-11ef-a0c7-8be0dac302b0;
 Fri, 15 Nov 2024 23:38:22 +0100 (CET)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (Client did not present a certificate)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4XqsP22nY1z4x8v;
 Sat, 16 Nov 2024 09:38:14 +1100 (AEDT)
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
X-Inumbo-ID: 50ad2563-a3a2-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE1MC4xMDcuNzQuNzYiLCJoZWxvIjoibWFpbC5vemxhYnMub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjUwYWQyNTYzLWEzYTItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNzEwMzAyLjkyOTY1NCwic2VuZGVyIjoic2ZyQGNhbmIuYXV1Zy5vcmcuYXUiLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1731710297;
	bh=2Oo8tuThL69UywoHNtNWphGeN1l/Ks7ZdfhLn6nu8Ts=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dvqBU9n8wyesGOM7wAJUVL4V50umalSR9AGyHvO50R9rHL4dRlvqV2fKiGIxclon7
	 dHEpXPpW9NVhcbFtMBHzRNkcGVSkeVB/y2szbGMNYINCZkHzmLDf1115Jxe24OTeOk
	 GNv8daj8Y6W/lBqt6k/toExNrcSvGF2/nzg0QTmOQX9jzDpl13KzERpvnsypqwk14l
	 Jr2Y6hhhHGQcduaub5tIB8ldj0pYnhXmYJw4zK368Q9lExm0iQorTgylYyIdDuEGMp
	 WagrfQz4Kwg8LTMJpR3GyN8L1t3g91kYKCDixQ+vf1WORv4sLKKi8JfCCFjRz+Eeni
	 +eMZUx+2BK6mA==
Date: Sat, 16 Nov 2024 09:38:15 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Jozsef Kadlecsik
 <kadlec@netfilter.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Julia Lawall
 <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack
 <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert
 Jarzmik <robert.jarzmik@free.fr>, Russell King <linux@armlinux.org.uk>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Ofir
 Bitton <obitton@habana.ai>, Oded Gabbay <ogabbay@kernel.org>, Lucas De
 Marchi <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jeroen de Borst
 <jeroendb@google.com>, Praveen Kaligineedi <pkaligineedi@google.com>,
 Shailend Chand <shailend@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 James Smart <james.smart@broadcom.com>, Dick Kennedy
 <dick.kennedy@broadcom.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, "Martin K. Petersen"
 <martin.petersen@oracle.com>, Roger Pau =?UTF-8?B?TW9ubsOp?=
 <roger.pau@citrix.com>, Jens Axboe <axboe@kernel.dk>, Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Jack
 Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz
 <luiz.dentz@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Xiubo
 Li <xiubli@redhat.com>, Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Louis Peens <louis.peens@corigine.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
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
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen
 <anna-maria@linutronix.de>
Subject: Re: [PATCH 03/22] arm: pxa: Convert timeouts to use
 secs_to_jiffies()
Message-ID: <20241116093815.5d37eb43@canb.auug.org.au>
In-Reply-To: <20241115-converge-secs-to-jiffies-v1-3-19aadc34941b@linux.microsoft.com>
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
	<20241115-converge-secs-to-jiffies-v1-3-19aadc34941b@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/4rVE82Kt6y+3_PbwMmwogMj";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/4rVE82Kt6y+3_PbwMmwogMj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Easwar,

On Fri, 15 Nov 2024 21:22:33 +0000 Easwar Hariharan <eahariha@linux.microso=
ft.com> wrote:
>
> -#define SHARPSL_CHARGE_ON_TIME_INTERVAL        (msecs_to_jiffies(1*60*10=
00))  /* 1 min */
> -#define SHARPSL_CHARGE_FINISH_TIME             (msecs_to_jiffies(10*60*1=
000)) /* 10 min */
> -#define SHARPSL_BATCHK_TIME                    (msecs_to_jiffies(15*1000=
))    /* 15 sec */
> +#define SHARPSL_CHARGE_ON_TIME_INTERVAL        (secs_to_jiffies(60))  /*=
 1 min */
> +#define SHARPSL_CHARGE_FINISH_TIME             (secs_to_jiffies(10*60)) =
/* 10 min */
> +#define SHARPSL_BATCHK_TIME                    (secs_to_jiffies(15))    =
/* 15 sec */

It might be nice to keep the alignment of the comments here.

--=20
Cheers,
Stephen Rothwell

--Sig_/4rVE82Kt6y+3_PbwMmwogMj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmc3zVcACgkQAVBC80lX
0GyUXgf+Ii9yOHf1vRadjfzExIFyJR4I0mG1VXDEBH24ASdL/jVIFlfW31h/JIe9
7JJFAL5Aa+C8Xw22mmq/8e0wbWCe+DqEq+SLtggkTN8kHtwf7Glda0a/aIix0pNM
s9nQXwrTFFvaCt2ocRmPUcm7K/jwiG3YxWawYBvIoSF9l/TfQXwD4LBbP2glFEL2
BkTvGG0/asLCHZK2LHwDsWsZ5XskgJmmQfbYEdygcm9C3bP40tFYUM22B6iEYNez
WKquyY7lAmwUJQsIAWZig/PKPz8e6uux6ghIdGbwFC0ezQqIOAz8ZqllWy1Dpa87
vCjZSu4lRCFBg5npBBL5wIOagKFSCw==
=vmyn
-----END PGP SIGNATURE-----

--Sig_/4rVE82Kt6y+3_PbwMmwogMj--

