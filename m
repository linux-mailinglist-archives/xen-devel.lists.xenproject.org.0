Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAED99D17CC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2024 19:13:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.839477.1255277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD6Fg-0004N3-2o; Mon, 18 Nov 2024 18:13:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 839477.1255277; Mon, 18 Nov 2024 18:13:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tD6Ff-0004Jv-Ux; Mon, 18 Nov 2024 18:13:31 +0000
Received: by outflank-mailman (input) for mailman id 839477;
 Mon, 18 Nov 2024 18:13:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1Qym=SN=linux.microsoft.com=eahariha@srs-se1.protection.inumbo.net>)
 id 1tD6Fe-0004Jp-JK
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2024 18:13:30 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id cf16cefe-a5d8-11ef-a0c8-8be0dac302b0;
 Mon, 18 Nov 2024 19:13:28 +0100 (CET)
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net
 [73.118.245.227])
 by linux.microsoft.com (Postfix) with ESMTPSA id 079B420B7D5F;
 Mon, 18 Nov 2024 10:13:24 -0800 (PST)
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
X-Inumbo-ID: cf16cefe-a5d8-11ef-a0c8-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzLjc3LjE1NC4xODIiLCJoZWxvIjoibGludXgubWljcm9zb2Z0LmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImNmMTZjZWZlLWE1ZDgtMTFlZi1hMGM4LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxOTUzNjA4LjQzMTczLCJzZW5kZXIiOiJlYWhhcmloYUBsaW51eC5taWNyb3NvZnQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 079B420B7D5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1731953606;
	bh=4rGKqWlJzIh5S6WJog1UbY+9wr2RIzuf6CA98XkvD9A=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=WgQq6VDmQPqDVd9HrdDJWYVeePI1o6O7aH2e5YK2i2MPTb79KOYC8kOEtCVdZyQyl
	 eQBQq4Gru6AuE3dhO0MWMctvjnMle6WwOzCHVKzijDojX1XF1tLPvCR2mFqRKiKQA2
	 T8BTz//c1DSiW16jlJvFvYtwS5WkMEtzzK+2O4cI=
Message-ID: <c2a5d9d2-ac73-46b0-9d2e-6960e2a13c1e@linux.microsoft.com>
Date: Mon, 18 Nov 2024 10:13:23 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: Pablo Neira Ayuso <pablo@netfilter.org>,
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
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 eahariha@linux.microsoft.com, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, cocci@inria.fr,
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
Subject: Re: [PATCH v2 01/21] netfilter: conntrack: Cleanup timeout
 definitions
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20241115-converge-secs-to-jiffies-v2-0-911fb7595e79@linux.microsoft.com>
 <20241115-converge-secs-to-jiffies-v2-1-911fb7595e79@linux.microsoft.com>
 <b370e8d0-2f87-4819-8f30-1181946295d9@csgroup.eu>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <b370e8d0-2f87-4819-8f30-1181946295d9@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11/16/2024 1:40 AM, Christophe Leroy wrote:
> 
> 
> Le 15/11/2024 à 22:26, Easwar Hariharan a écrit :
>> [Vous ne recevez pas souvent de courriers de
>> eahariha@linux.microsoft.com. Découvrez pourquoi ceci est important à
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> None of the higher order definitions are used anymore, so remove
>> definitions for minutes, hours, and days timeouts. Convert the seconds
>> denominated timeouts to secs_to_jiffies()
> 
> There is very similar things with tcp_timeouts[] in
> nf_conntrack_proto_tcp.c, why not convert it as well ?

This patch happens to have been hand-modified and not by Coccinelle.
I'll consider tcp_timeouts[] for v3, but that actually seems to have
minute, hour, and days denominated timeouts, and replacing the 4 SECS
timeouts may actually hinder readability in that file.

> 
>>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
>> ---
>>   net/netfilter/nf_conntrack_proto_sctp.c | 21 ++++++++-------------
>>   1 file changed, 8 insertions(+), 13 deletions(-)
>>
>> diff --git a/net/netfilter/nf_conntrack_proto_sctp.c b/net/netfilter/
>> nf_conntrack_proto_sctp.c
>> index
>> 4cc97f971264ed779434ab4597dd0162586b3736..6c95ac96fa42a39acafb5b88a7cf8898010e911c 100644
>> --- a/net/netfilter/nf_conntrack_proto_sctp.c
>> +++ b/net/netfilter/nf_conntrack_proto_sctp.c
>> @@ -39,20 +39,15 @@ static const char *const sctp_conntrack_names[] = {
>>          [SCTP_CONNTRACK_HEARTBEAT_SENT]         = "HEARTBEAT_SENT",
>>   };
>>
>> -#define SECS  * HZ
>> -#define MINS  * 60 SECS
>> -#define HOURS * 60 MINS
>> -#define DAYS  * 24 HOURS
>> -
>>   static const unsigned int sctp_timeouts[SCTP_CONNTRACK_MAX] = {
>> -       [SCTP_CONNTRACK_CLOSED]                 = 10 SECS,
>> -       [SCTP_CONNTRACK_COOKIE_WAIT]            = 3 SECS,
>> -       [SCTP_CONNTRACK_COOKIE_ECHOED]          = 3 SECS,
>> -       [SCTP_CONNTRACK_ESTABLISHED]            = 210 SECS,
>> -       [SCTP_CONNTRACK_SHUTDOWN_SENT]          = 3 SECS,
>> -       [SCTP_CONNTRACK_SHUTDOWN_RECD]          = 3 SECS,
>> -       [SCTP_CONNTRACK_SHUTDOWN_ACK_SENT]      = 3 SECS,
>> -       [SCTP_CONNTRACK_HEARTBEAT_SENT]         = 30 SECS,
>> +       [SCTP_CONNTRACK_CLOSED]                 = secs_to_jiffies(10),
>> +       [SCTP_CONNTRACK_COOKIE_WAIT]            = secs_to_jiffies(3),
>> +       [SCTP_CONNTRACK_COOKIE_ECHOED]          = secs_to_jiffies(3),
>> +       [SCTP_CONNTRACK_ESTABLISHED]            = secs_to_jiffies(210),
>> +       [SCTP_CONNTRACK_SHUTDOWN_SENT]          = secs_to_jiffies(3),
>> +       [SCTP_CONNTRACK_SHUTDOWN_RECD]          = secs_to_jiffies(3),
>> +       [SCTP_CONNTRACK_SHUTDOWN_ACK_SENT]      = secs_to_jiffies(3),
>> +       [SCTP_CONNTRACK_HEARTBEAT_SENT]         = secs_to_jiffies(3),
> 
> Was 30 before, if you think it must be changed to 3 you must explain it
> in the commit message, or maybe do another patch for that change.

This one's a typo, I'll fix it in v3.

Thanks,
Easwar

