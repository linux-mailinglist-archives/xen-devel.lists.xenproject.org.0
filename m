Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0D9CFB84
	for <lists+xen-devel@lfdr.de>; Sat, 16 Nov 2024 01:13:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.838487.1254482 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC6Qb-0003b3-NN; Sat, 16 Nov 2024 00:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 838487.1254482; Sat, 16 Nov 2024 00:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tC6Qb-0003Yb-Jz; Sat, 16 Nov 2024 00:12:41 +0000
Received: by outflank-mailman (input) for mailman id 838487;
 Sat, 16 Nov 2024 00:12:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E6K3=SL=linux.microsoft.com=eahariha@srs-se1.protection.inumbo.net>)
 id 1tC6Qa-0003Vo-1Y
 for xen-devel@lists.xenproject.org; Sat, 16 Nov 2024 00:12:40 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 7b33a3da-a3af-11ef-a0c7-8be0dac302b0;
 Sat, 16 Nov 2024 01:12:35 +0100 (CET)
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net
 [73.118.245.227])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1600B2064AEE;
 Fri, 15 Nov 2024 16:12:32 -0800 (PST)
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
X-Inumbo-ID: 7b33a3da-a3af-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzLjc3LjE1NC4xODIiLCJoZWxvIjoibGludXgubWljcm9zb2Z0LmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjdiMzNhM2RhLWEzYWYtMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNzE1OTU2LjExMDA1LCJzZW5kZXIiOiJlYWhhcmloYUBsaW51eC5taWNyb3NvZnQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1600B2064AEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731715954;
	bh=xpBEojaRNmZLcf0UaP4ux3dQkOORS/leVLfy1gAywiE=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=Pq2k2Nni3cFBRk9EH3pyxgnDw6ECvdbg1vXWXgUrnZTvujbQOLePABt8LVR+E9JSZ
	 k4WoN+iIfUxQpiMRt/FU+pwGNrKJBo/0Q2+4KvxqDSAbq0u3pnKwVj+6aACG5ZF/KB
	 j3wJy4AhuvO/DGvU623x7nThkWYs37o8kaDAxg9k=
Message-ID: <68331eb9-545f-48a4-9c49-1a3637b3d918@linux.microsoft.com>
Date: Fri, 15 Nov 2024 16:12:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Pablo Neira Ayuso <pablo@netfilter.org>,
 Jozsef Kadlecsik <kadlec@netfilter.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Russell King
 <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ofir Bitton <obitton@habana.ai>,
 Oded Gabbay <ogabbay@kernel.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
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
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Kalle Valo <kvalo@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, Marcel Holtmann
 <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
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
 linuxppc-dev@lists.ozlabs.org, Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH 03/22] arm: pxa: Convert timeouts to use secs_to_jiffies()
To: Stephen Rothwell <sfr@canb.auug.org.au>
References: <20241115-converge-secs-to-jiffies-v1-0-19aadc34941b@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v1-3-19aadc34941b@linux.microsoft.com>
 <20241116093815.5d37eb43@canb.auug.org.au>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20241116093815.5d37eb43@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/15/2024 2:38 PM, Stephen Rothwell wrote:
> Hi Easwar,
> 
> On Fri, 15 Nov 2024 21:22:33 +0000 Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>>
>> -#define SHARPSL_CHARGE_ON_TIME_INTERVAL        (msecs_to_jiffies(1*60*1000))  /* 1 min */
>> -#define SHARPSL_CHARGE_FINISH_TIME             (msecs_to_jiffies(10*60*1000)) /* 10 min */
>> -#define SHARPSL_BATCHK_TIME                    (msecs_to_jiffies(15*1000))    /* 15 sec */
>> +#define SHARPSL_CHARGE_ON_TIME_INTERVAL        (secs_to_jiffies(60))  /* 1 min */
>> +#define SHARPSL_CHARGE_FINISH_TIME             (secs_to_jiffies(10*60)) /* 10 min */
>> +#define SHARPSL_BATCHK_TIME                    (secs_to_jiffies(15))    /* 15 sec */
> 
> It might be nice to keep the alignment of the comments here.
> 

Will fix in v3.

