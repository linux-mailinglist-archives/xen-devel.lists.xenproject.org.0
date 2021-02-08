Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 993F3312CED
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 10:12:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82653.152593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l92Zt-0002Wi-PK; Mon, 08 Feb 2021 09:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82653.152593; Mon, 08 Feb 2021 09:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l92Zt-0002WJ-Lt; Mon, 08 Feb 2021 09:11:29 +0000
Received: by outflank-mailman (input) for mailman id 82653;
 Mon, 08 Feb 2021 09:11:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l92Zs-0002WE-Gw
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 09:11:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l92Zm-00046z-Fi; Mon, 08 Feb 2021 09:11:22 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l92Zm-0003Oc-7O; Mon, 08 Feb 2021 09:11:22 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Z2FuntU0FCSPGAWD+ofKK+yUmsoCyrZClvV7APxBvaU=; b=S3YFzpNjNeKQK9a3thbvJwcCVT
	/0VqloskC35+uEOgRFBZD+9JV3WrwxjsyPgNFqKOnfjWAtoIi0DKRJlxFQvbTwbupeSSukJX8x1dj
	n1sYe+iGxzjWMHsDVsqLDKXVJUELdnB3CcU8BTrhm0NTQvuJ5S5mzzk9OVF2XbxfQZ1w=;
Subject: Re: [PATCH 0/7] xen/events: bug fixes and some diagnostic aids
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>, Wei Liu <wei.liu@kernel.org>,
 Paul Durrant <paul@xen.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
References: <20210206104932.29064-1-jgross@suse.com>
 <bd63694e-ac0c-7954-ec00-edad05f8da1c@xen.org>
 <eeb62129-d9fc-2155-0e0f-aff1fbb33fbc@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <fcf3181b-3efc-55f5-687c-324937b543e6@xen.org>
Date: Mon, 8 Feb 2021 09:11:18 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <eeb62129-d9fc-2155-0e0f-aff1fbb33fbc@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 07/02/2021 12:58, Jürgen Groß wrote:
> On 06.02.21 19:46, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 06/02/2021 10:49, Juergen Gross wrote:
>>> The first three patches are fixes for XSA-332. The avoid WARN splats
>>> and a performance issue with interdomain events.
>>
>> Thanks for helping to figure out the problem. Unfortunately, I still 
>> see reliably the WARN splat with the latest Linux master 
>> (1e0d27fce010) + your first 3 patches.
>>
>> I am using Xen 4.11 (1c7d984645f9) and dom0 is forced to use the 2L 
>> events ABI.
>>
>> After some debugging, I think I have an idea what's went wrong. The 
>> problem happens when the event is initially bound from vCPU0 to a 
>> different vCPU.
>>
>>  From the comment in xen_rebind_evtchn_to_cpu(), we are masking the 
>> event to prevent it being delivered on an unexpected vCPU. However, I 
>> believe the following can happen:
>>
>> vCPU0                | vCPU1
>>                  |
>>                  | Call xen_rebind_evtchn_to_cpu()
>> receive event X            |
>>                  | mask event X
>>                  | bind to vCPU1
>> <vCPU descheduled>        | unmask event X
>>                  |
>>                  | receive event X
>>                  |
>>                  | handle_edge_irq(X)
>> handle_edge_irq(X)        |  -> handle_irq_event()
>>                  |   -> set IRQD_IN_PROGRESS
>>   -> set IRQS_PENDING        |
>>                  |   -> evtchn_interrupt()
>>                  |   -> clear IRQD_IN_PROGRESS
>>                  |  -> IRQS_PENDING is set
>>                  |  -> handle_irq_event()
>>                  |   -> evtchn_interrupt()
>>                  |     -> WARN()
>>                  |
>>
>> All the lateeoi handlers expect a ONESHOT semantic and 
>> evtchn_interrupt() is doesn't tolerate any deviation.
>>
>> I think the problem was introduced by 7f874a0447a9 ("xen/events: fix 
>> lateeoi irq acknowledgment") because the interrupt was disabled 
>> previously. Therefore we wouldn't do another iteration in 
>> handle_edge_irq().
> 
> I think you picked the wrong commit for blaming, as this is just
> the last patch of the three patches you were testing.

I actually found the right commit for blaming but I copied the 
information from the wrong shell :/. The bug was introduced by:

c44b849cee8c ("xen/events: switch user event channels to lateeoi model")

> 
>> Aside the handlers, I think it may impact the defer EOI mitigation 
>> because in theory if a 3rd vCPU is joining the party (let say vCPU A 
>> migrate the event from vCPU B to vCPU C). So info->{eoi_cpu, 
>> irq_epoch, eoi_time} could possibly get mangled?
>>
>> For a fix, we may want to consider to hold evtchn_rwlock with the 
>> write permission. Although, I am not 100% sure this is going to 
>> prevent everything.
> 
> It will make things worse, as it would violate the locking hierarchy
> (xen_rebind_evtchn_to_cpu() is called with the IRQ-desc lock held).

Ah, right.

> 
> On a first glance I think we'll need a 3rd masking state ("temporarily
> masked") in the second patch in order to avoid a race with lateeoi.
> 
> In order to avoid the race you outlined above we need an "event is being
> handled" indicator checked via test_and_set() semantics in
> handle_irq_for_port() and reset only when calling clear_evtchn().

It feels like we are trying to workaround the IRQ flow we are using 
(i.e. handle_edge_irq()).

This reminds me the thread we had before discovering XSA-332 (see [1]). 
Back then, it was suggested to switch back to handle_fasteoi_irq().

Cheers,

[1] 
https://lore.kernel.org/xen-devel/alpine.DEB.2.21.2004271552430.29217@sstabellini-ThinkPad-T480s/

-- 
Julien Grall

