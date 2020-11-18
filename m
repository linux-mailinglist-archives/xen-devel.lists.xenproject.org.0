Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6942B7A8B
	for <lists+xen-devel@lfdr.de>; Wed, 18 Nov 2020 10:43:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.29675.59271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJzu-0008QC-Uu; Wed, 18 Nov 2020 09:43:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 29675.59271; Wed, 18 Nov 2020 09:43:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfJzu-0008Pn-RK; Wed, 18 Nov 2020 09:43:30 +0000
Received: by outflank-mailman (input) for mailman id 29675;
 Wed, 18 Nov 2020 09:43:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfJzt-0008Pi-Bt
 for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:43:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1294673-27bf-48fb-9612-efeb91b9d5e7;
 Wed, 18 Nov 2020 09:43:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 84630AC2D;
 Wed, 18 Nov 2020 09:43:27 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=763w=EY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfJzt-0008Pi-Bt
	for xen-devel@lists.xenproject.org; Wed, 18 Nov 2020 09:43:29 +0000
X-Inumbo-ID: a1294673-27bf-48fb-9612-efeb91b9d5e7
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id a1294673-27bf-48fb-9612-efeb91b9d5e7;
	Wed, 18 Nov 2020 09:43:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605692607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=47DDZ1KzkF6mKWai+9EruK64aLMwC7IKY7PJl9Yv2WE=;
	b=kVpO5MOWU7WA8fArxmLMn5NCtfHjEJLNYaNGFJQ7uYlb88c/mjTtprB4S3l7CV4kP1eO5L
	wwsHJaDra0Mmf5dIpO9rbLsQW9JcZkX7MjAdJDzNJq35zd5pi2r62nOqr1tABAsZny2Hdq
	a4qm2b/Jhj9HbNK1hlnkNchlNgbgLJo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 84630AC2D;
	Wed, 18 Nov 2020 09:43:27 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20201117150949.GA3791@antioche.eu.org>
 <20201117155807.a7jgmftnj6njg6oz@Air-de-Roger>
 <20201117164033.GB3093@antioche.eu.org>
 <8039a29c-4058-ab6e-56ef-d1383deb7e38@suse.com>
 <20201118092819.GE1085@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6ad38151-d218-03c4-8085-9eff35bd63ff@suse.com>
Date: Wed, 18 Nov 2020 10:43:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201118092819.GE1085@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.11.2020 10:28, Manuel Bouyer wrote:
> On Wed, Nov 18, 2020 at 10:16:17AM +0100, Jan Beulich wrote:
>> On 17.11.2020 17:40, Manuel Bouyer wrote:
>>> On Tue, Nov 17, 2020 at 04:58:07PM +0100, Roger Pau Monné wrote:
>>>> [...]
>>>>
>>>> I have attached a patch below that will dump the vIO-APIC info as part
>>>> of the 'i' debug key output, can you paste the whole output of the 'i'
>>>> debug key when the system stalls?
>>>
>>> see attached file. Note that the kernel did unstall while 'i' output was
>>> being printed, so it is mixed with some NetBSD kernel output.
>>
>> Could you try to run Xen's serial port without use of any IRQ
>> (i.e. in "polling" mode), in an attempt to avoid this unstalling
>> (which is likely to render the resulting output at least in part
>> meaningless)?
> 
> It there a boot line option for that ?

Yes, com<N>= has a field for this:

### com1
### com2
> `= <baud>[/<base-baud>][,[DPS][,[<io-base>|pci|amt][,[<irq>|msi][,[<port-bdf>][,[<bridge-bdf>]]]]]]`

with

* `<irq>` is the IRQ number to use, or `0` to use the UART in poll
  mode only, or `msi` to set up a Message Signaled Interrupt.

Jan

