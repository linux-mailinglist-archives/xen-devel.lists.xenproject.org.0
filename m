Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B51F9F5839
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 21:54:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859880.1271961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNeZP-0003rY-94; Tue, 17 Dec 2024 20:53:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859880.1271961; Tue, 17 Dec 2024 20:53:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNeZP-0003pP-6P; Tue, 17 Dec 2024 20:53:31 +0000
Received: by outflank-mailman (input) for mailman id 859880;
 Tue, 17 Dec 2024 20:53:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6hqg=TK=linux.microsoft.com=eahariha@srs-se1.protection.inumbo.net>)
 id 1tNeZN-0003pJ-Kn
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 20:53:29 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id f634788c-bcb8-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 21:53:27 +0100 (CET)
Received: from [192.168.35.166] (c-73-118-245-227.hsd1.wa.comcast.net
 [73.118.245.227])
 by linux.microsoft.com (Postfix) with ESMTPSA id 313DC2171F96;
 Tue, 17 Dec 2024 12:53:23 -0800 (PST)
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
X-Inumbo-ID: f634788c-bcb8-11ef-a0d6-8be0dac302b0
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 313DC2171F96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1734468805;
	bh=aVc5gziW3F5u0OxTruXlabKnVm24GGvTVYzcdDQRKKI=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=PN+5X7vl8fqADT/aII8zIGfk60UMtxJ9pR+EBirm4pXAa4JZO11zP4etUexy4ZsF1
	 Hz5jBPkUY126l1G2C1Lf0cgYJmqJpx2Ac/wrr+Dl/I1W058j7FPkFRH8CsABxT6WHb
	 +lq4b3CWgOR3ojB2J6CV+93O4Hyq14ifZiz9VEy4=
Message-ID: <14ad0c08-7b3b-47b6-8cc1-8a4179238e5a@linux.microsoft.com>
Date: Tue, 17 Dec 2024 12:53:22 -0800
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
 <catalin.marinas@arm.com>, Jack Wang <jinpu.wang@cloud.ionos.com>,
 Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
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
 oss-drivers@corigine.com, linuxppc-dev@lists.ozlabs.org,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, paul@paul-moore.com
Subject: Re: [PATCH v3 00/19] Converge on using secs_to_jiffies()
To: Andrew Morton <akpm@linux-foundation.org>
References: <20241210-converge-secs-to-jiffies-v3-0-ddfefd7e9f2a@linux.microsoft.com>
 <20241210163520.95fa1c8aa83e1915004ed884@linux-foundation.org>
 <422470cd-84f0-469e-93c2-493c5091391d@linux.microsoft.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <422470cd-84f0-469e-93c2-493c5091391d@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/10/2024 5:00 PM, Easwar Hariharan wrote:
> On 12/10/2024 4:35 PM, Andrew Morton wrote:
>> On Tue, 10 Dec 2024 22:02:31 +0000 Easwar Hariharan <eahariha@linux.microsoft.com> wrote:
>>
>>> This is a series that follows up on my previous series to introduce
>>> secs_to_jiffies() and convert a few initial users.
>>
>> Thanks, I added this to mm.git.  I suppressed the usual added-to-mm
>> emails because soooo many cc's!
>>
>> I'd ask relevant maintainers to send in any acks and I'll paste them
>> into the relevant changelogs.
> 
> Thank you, Andrew!
> 
> - Easwar

Hi Andrew,

There have been a couple of comments[1][2] that came in after you queued
the series to mm. Would you rather I send individual patches addressing
these, or just send a v4 of the entire series (-netdev of course) so you
can replace it wholesale?

Thanks,
Easwar

[1]
https://lore.kernel.org/all/07784753-6874-4dda-a080-2d2812f4a10a@csgroup.eu/
[2]
https://lore.kernel.org/all/Z2G1ZPL2cAlQOYlF@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com/

