Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8299D17F6
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 19:19:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839494.1255296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD6Kw-0005Y1-V8; Mon, 18 Nov 2024 18:18:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839494.1255296; Mon, 18 Nov 2024 18:18:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD6Kw-0005WR-SH; Mon, 18 Nov 2024 18:18:58 +0000
Received: by outflank-mailman (input) for mailman id 839494;
 Mon, 18 Nov 2024 18:18:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Qym=SN=linux.microsoft.com=eahariha@srs-se1.protection.inumbo.net>)
 id 1tD6Kv-0005WJ-Lj
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 18:18:57 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 91037ca5-a5d9-11ef-99a3-01e77a169b0f;
 Mon, 18 Nov 2024 19:18:53 +0100 (CET)
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net
 [73.118.245.227])
 by linux.microsoft.com (Postfix) with ESMTPSA id 7B6DB206BCF9;
 Mon, 18 Nov 2024 10:18:49 -0800 (PST)
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
X-Inumbo-ID: 91037ca5-a5d9-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzLjc3LjE1NC4xODIiLCJoZWxvIjoibGludXgubWljcm9zb2Z0LmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjkxMDM3Y2E1LWE1ZDktMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxOTUzOTMzLjgyMzcwOCwic2VuZGVyIjoiZWFoYXJpaGFAbGludXgubWljcm9zb2Z0LmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7B6DB206BCF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731953932;
	bh=fIQzgF1WsNR1uKKNTq0/EQo7zmlio+cixqR17RrtuRg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=AG9s/uyDx0OBII3cr4HUzEtCn4nG6edMY2UD6tMYQJ1OpbxvtlkXS/eCyyKzQSDkC
	 KcdCHl5p58vf39EYGhD7mqQUrW1VKQADyz79vhjulvgZLmWmAZisUXU71InKFz7Poi
	 T4lQlDCJsC2Y9ZlNmbnEUe8f/zo4dQilCRsXYjpY=
Message-ID: <96f3b51b-c28c-4ea8-b61e-a4982196215f@linux.microsoft.com>
Date: Mon, 18 Nov 2024 10:18:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 eahariha@linux.microsoft.com, Pablo Neira Ayuso <pablo@netfilter.org>,
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
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
 Joe Lawrence <joe.lawrence@redhat.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Louis Peens <louis.peens@corigine.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
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
Subject: Re: [PATCH v2 19/21] livepatch: Convert timeouts to secs_to_jiffies()
To: Petr Mladek <pmladek@suse.com>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-19-911fb7595e79@linux.microsoft.com>
 <718febc4-59ee-4701-ad62-8b7a8fa7a910@csgroup.eu>
 <Zzsfuuv3AVomkMxn@pathway.suse.cz>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <Zzsfuuv3AVomkMxn@pathway.suse.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/18/2024 3:06 AM, Petr Mladek wrote:
> On Sat 2024-11-16 11:10:52, Christophe Leroy wrote:
>>
>>
>> Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
>>> [Vous ne recevez pas souvent de courriers de eahariha@linux.microsoft.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Changes made with the following Coccinelle rules:
>>>
>>> @@ constant C; @@
>>>
>>> - msecs_to_jiffies(C * 1000)
>>> + secs_to_jiffies(C)
>>>
>>> @@ constant C; @@
>>>
>>> - msecs_to_jiffies(C * MSEC_PER_SEC)
>>> + secs_to_jiffies(C)
>>>
>>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>>> ---
>>>   samples/livepatch/livepatch-callbacks-busymod.c |  2 +-
>>>   samples/livepatch/livepatch-shadow-fix1.c       |  2 +-
>>>   samples/livepatch/livepatch-shadow-mod.c        | 10 +++++-----
>>>   3 files changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/samples/livepatch/livepatch-callbacks-busymod.c b/samples/livepatch/livepatch-callbacks-busymod.c
>>> index 378e2d40271a9717d09eff51d3d3612c679736fc..d0fd801a7c21b7d7939c29d83f9d993badcc9aba 100644
>>> --- a/samples/livepatch/livepatch-callbacks-busymod.c
>>> +++ b/samples/livepatch/livepatch-callbacks-busymod.c
>>> @@ -45,7 +45,7 @@ static int livepatch_callbacks_mod_init(void)
>>>   {
>>>          pr_info("%s\n", __func__);
>>>          schedule_delayed_work(&work,
>>> -               msecs_to_jiffies(1000 * 0));
>>> +               secs_to_jiffies(0));
>>
>> Using secs_to_jiffies() is pointless, 0 is universal, should become
>> schedule_delayed_work(&work, 0);
> 
> Yes, schedule_delayed_work(&work, 0) looks like the right solution.
> 
> Or even better, it seems that the delayed work might get replaced by
> a normal workqueue work.
> 
> Anyway, I am working on a patchset which would remove this sample
> module. There is no need to put much effort into the clean up
> of this particular module. Do whatever is easiest for you.
> 
> Best Regards,
> Petr

If we're removing the module, I'll drop it from the series. Just to
clarify, do you mean to remove all of samples/livepatch/* or some
particular file(s)?

Thanks,
Easwar

