Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DBE9EC5E0
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2024 08:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.853986.1267306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHPo-0004CN-1O; Wed, 11 Dec 2024 07:45:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 853986.1267306; Wed, 11 Dec 2024 07:45:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLHPn-0004AW-U2; Wed, 11 Dec 2024 07:45:47 +0000
Received: by outflank-mailman (input) for mailman id 853986;
 Wed, 11 Dec 2024 07:45:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fjbV=TE=kernel.org=kvalo@srs-se1.protection.inumbo.net>)
 id 1tLHPm-0003do-Kr
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2024 07:45:46 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed66f1c5-b793-11ef-99a3-01e77a169b0f;
 Wed, 11 Dec 2024 08:45:44 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7D087A41F45;
 Wed, 11 Dec 2024 07:43:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A77C4CED2;
 Wed, 11 Dec 2024 07:45:25 +0000 (UTC)
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
X-Inumbo-ID: ed66f1c5-b793-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733903143;
	bh=KM5Of7mM53fIwBBiaYiiUQ9BfxtVrpykBzubAzmUdlE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZaN44YyjhRMRn1ZZ+GmTOS40UgIRbhL4wBsfJy8XjSPG4QXarlwE2h8LLmlSyCwwE
	 mhsyVMxQDuDVaxW28PxQeU8er7lMNhKnh1DPb1k4CbIDr8a5tkumkBV/uTN9xwnFYp
	 h1HNwJmQE+rv8LC4BNlfDvTcPd5XXQGZmdVG4PmZqn4aLOwa4oWj50GSY3CEXVAf2K
	 4s9JO62HtV4AyzHzBTTKIyxerUXbJDme/tcsfk9nrdzoiXAN6SWU/JWU3UcTsBRxgt
	 rxzg89ETMye2AN+BOVUz+OAR29EzCnQNdPIoMqWIY7xMbpGfvp3pWcUv4qGp3pyh75
	 7MY47GTKlC4gQ==
From: Kalle Valo <kvalo@kernel.org>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,  Jozsef Kadlecsik
 <kadlec@netfilter.org>,  "David S. Miller" <davem@davemloft.net>,  Eric
 Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo
 Abeni <pabeni@redhat.com>,  Simon Horman <horms@kernel.org>,  Julia Lawall
 <Julia.Lawall@inria.fr>,  Nicolas Palix <nicolas.palix@imag.fr>,  Daniel
 Mack <daniel@zonque.org>,  Haojian Zhuang <haojian.zhuang@gmail.com>,
  Robert Jarzmik <robert.jarzmik@free.fr>,  Russell King
 <linux@armlinux.org.uk>,  Heiko Carstens <hca@linux.ibm.com>,  Vasily
 Gorbik <gor@linux.ibm.com>,  Alexander Gordeev <agordeev@linux.ibm.com>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Sven Schnelle
 <svens@linux.ibm.com>,  Ofir Bitton <obitton@habana.ai>,  Oded Gabbay
 <ogabbay@kernel.org>,  Lucas De Marchi <lucas.demarchi@intel.com>,  Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,  Rodrigo
 Vivi
 <rodrigo.vivi@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
  Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
 <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Jeroen de Borst
 <jeroendb@google.com>,  Praveen Kaligineedi <pkaligineedi@google.com>,
  Shailend Chand <shailend@google.com>,  Andrew Lunn
 <andrew+netdev@lunn.ch>,  James Smart <james.smart@broadcom.com>,  Dick
 Kennedy <dick.kennedy@broadcom.com>,  "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>,  "Martin K. Petersen"
 <martin.petersen@oracle.com>,  Roger Pau =?utf-8?Q?Monn=C3=A9?=
 <roger.pau@citrix.com>,
  Jens Axboe <axboe@kernel.dk>,  Jeff Johnson <jjohnson@kernel.org>,
  Catalin Marinas <catalin.marinas@arm.com>,  Andrew Morton
 <akpm@linux-foundation.org>,  Jack Wang <jinpu.wang@cloud.ionos.com>,
  Marcel Holtmann <marcel@holtmann.org>,  Johan Hedberg
 <johan.hedberg@gmail.com>,  Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Florian Fainelli
 <florian.fainelli@broadcom.com>,  Ray Jui <rjui@broadcom.com>,  Scott
 Branden <sbranden@broadcom.com>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Xiubo Li <xiubli@redhat.com>,
  Ilya Dryomov <idryomov@gmail.com>,  Josh Poimboeuf <jpoimboe@kernel.org>,
  Jiri Kosina <jikos@kernel.org>,  Miroslav Benes <mbenes@suse.cz>,  Petr
 Mladek <pmladek@suse.com>,  Joe Lawrence <joe.lawrence@redhat.com>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Louis
 Peens <louis.peens@corigine.com>,  Michael Ellerman <mpe@ellerman.id.au>,
  Nicholas Piggin <npiggin@gmail.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Naveen N Rao <naveen@kernel.org>,
  Madhavan Srinivasan <maddy@linux.ibm.com>,
  netfilter-devel@vger.kernel.org,  coreteam@netfilter.org,
  netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,  cocci@inria.fr,
  linux-arm-kernel@lists.infradead.org,  linux-s390@vger.kernel.org,
  dri-devel@lists.freedesktop.org,  intel-xe@lists.freedesktop.org,
  linux-scsi@vger.kernel.org,  xen-devel@lists.xenproject.org,
  linux-block@vger.kernel.org,  linux-wireless@vger.kernel.org,
  ath11k@lists.infradead.org,  linux-mm@kvack.org,
  linux-bluetooth@vger.kernel.org,  linux-staging@lists.linux.dev,
  linux-rpi-kernel@lists.infradead.org,  ceph-devel@vger.kernel.org,
  live-patching@vger.kernel.org,  linux-sound@vger.kernel.org,
  oss-drivers@corigine.com,  linuxppc-dev@lists.ozlabs.org,  Anna-Maria
 Behnsen <anna-maria@linutronix.de>,  Jeff Johnson
 <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH v3 14/19] wifi: ath11k: Convert timeouts to
 secs_to_jiffies()
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
	<20241210-converge-secs-to-jiffies-v3-14-ddfefd7e9f2a@linux.microsoft.com>
	<87sequr7ho.fsf@kernel.org>
Date: Wed, 11 Dec 2024 09:45:24 +0200
In-Reply-To: <87sequr7ho.fsf@kernel.org> (Kalle Valo's message of "Wed, 11 Dec
	2024 09:42:11 +0200")
Message-ID: <87o71ir7cb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain

Kalle Valo <kvalo@kernel.org> writes:

> Easwar Hariharan <eahariha@linux.microsoft.com> writes:
>
>> Commit b35108a51cf7 ("jiffies: Define secs_to_jiffies()") introduced
>> secs_to_jiffies(). As the value here is a multiple of 1000, use
>> secs_to_jiffies() instead of msecs_to_jiffies to avoid the multiplication.
>>
>> This is converted using scripts/coccinelle/misc/secs_to_jiffies.cocci with
>> the following Coccinelle rules:
>>
>> @@ constant C; @@
>>
>> - msecs_to_jiffies(C * 1000)
>> + secs_to_jiffies(C)
>>
>> @@ constant C; @@
>>
>> - msecs_to_jiffies(C * MSEC_PER_SEC)
>> + secs_to_jiffies(C)
>>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>> ---
>>  drivers/net/wireless/ath/ath11k/debugfs.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> I assume we can take this to our ath.git tree, please let us know if
> that's not the case.

Nevermind, I now saw the discussion in the cover letter and assume that
this patch will be sent separately.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

