Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513C12DE358
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 14:35:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56509.98968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqFuZ-0007AF-TM; Fri, 18 Dec 2020 13:35:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56509.98968; Fri, 18 Dec 2020 13:35:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqFuZ-00079q-QA; Fri, 18 Dec 2020 13:35:11 +0000
Received: by outflank-mailman (input) for mailman id 56509;
 Fri, 18 Dec 2020 13:35:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kqFuX-00079l-Oh
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 13:35:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kqFuX-0008BY-HY; Fri, 18 Dec 2020 13:35:09 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kqFuX-0003W5-7P; Fri, 18 Dec 2020 13:35:09 +0000
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
	bh=xM2g/GyajSitlPfAkAWgiSwGXMkoqb0lchea5HNLvyg=; b=uSpo9ATqHSsdor1NQBFiFFtmAO
	wHxwDpPzVuOnbX3le4a830ztgAQP6o/AZq+UOlOSmBFGtgUQJF9i0yRXs9c3gMar7NKO5ez5OVMiB
	/R5dbNkQKa+gYpunNz438CavuHCfw7kueH4PRtZTujPtftncFmEiUO4+SuyqNiENyiog=;
Subject: Re: xen/evtchn: Interrupt for port 34, but apparently not enabled;
 per-user 00000000a86a4c1b on 5.10
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, aams@amazon.de
Cc: linux-kernel@vger.kernel.org,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 foersleo@amazon.de
References: <ce881240-284f-8470-10f1-5cce353ee903@xen.org>
 <b5c32c48-3e74-2045-62ec-560b19766389@suse.com>
 <da65a69e-389b-1602-1479-6799ce10c101@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1711bb04-ea95-3507-9aa3-e82791d757b4@xen.org>
Date: Fri, 18 Dec 2020 13:35:07 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <da65a69e-389b-1602-1479-6799ce10c101@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 15/12/2020 10:20, Jürgen Groß wrote:
> On 15.12.20 08:27, Jürgen Groß wrote:
>> On 14.12.20 22:25, Julien Grall wrote:
>>> Hi Juergen,
>>>
>>> When testing Linux 5.10 dom0, I could reliably hit the following 
>>> warning with using event 2L ABI:
>>>
>>> [  589.591737] Interrupt for port 34, but apparently not enabled; 
>>> per-user 00000000a86a4c1b
>>> [  589.593259] WARNING: CPU: 0 PID: 1111 at 
>>> /home/ANT.AMAZON.COM/jgrall/works/oss/linux/drivers/xen/evtchn.c:170 
>>> evtchn_interrupt+0xeb/0x100
>>> [  589.595514] Modules linked in:
>>> [  589.596145] CPU: 0 PID: 1111 Comm: qemu-system-i38 Tainted: G 
>>> W         5.10.0+ #180
>>> [  589.597708] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), 
>>> BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
>>> [  589.599782] RIP: e030:evtchn_interrupt+0xeb/0x100
>>> [  589.600698] Code: 48 8d bb d8 01 00 00 ba 01 00 00 00 be 1d 00 00 
>>> 00 e8 d9 10 ca ff eb b2 8b 75 20 48 89 da 48 c7 c7 a8 31 3d 82 e8 65 
>>> 29 a0 ff <0f> 0b e9 42 ff ff ff 0f 1f 40 00 66 2e 0f 1f 84 00 00 00 
>>> 00 00 0f
>>> [  589.604087] RSP: e02b:ffffc90040003e70 EFLAGS: 00010086
>>> [  589.605102] RAX: 0000000000000000 RBX: ffff888102091800 RCX: 
>>> 0000000000000027
>>> [  589.606445] RDX: 0000000000000000 RSI: ffff88817fe19150 RDI: 
>>> ffff88817fe19158
>>> [  589.607790] RBP: ffff88810f5ab980 R08: 0000000000000001 R09: 
>>> 0000000000328980
>>> [  589.609134] R10: 0000000000000000 R11: ffffc90040003c70 R12: 
>>> ffff888107fd3c00
>>> [  589.610484] R13: ffffc90040003ed4 R14: 0000000000000000 R15: 
>>> ffff88810f5ffd80
>>> [  589.611828] FS:  00007f960c4b8ac0(0000) GS:ffff88817fe00000(0000) 
>>> knlGS:0000000000000000
>>> [  589.613348] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
>>> [  589.614525] CR2: 00007f17ee72e000 CR3: 000000010f5b6000 CR4: 
>>> 0000000000050660
>>> [  589.615874] Call Trace:
>>> [  589.616402]  <IRQ>
>>> [  589.616855]  __handle_irq_event_percpu+0x4e/0x2c0
>>> [  589.617784]  handle_irq_event_percpu+0x30/0x80
>>> [  589.618660]  handle_irq_event+0x3a/0x60
>>> [  589.619428]  handle_edge_irq+0x9b/0x1f0
>>> [  589.620209]  generic_handle_irq+0x4f/0x60
>>> [  589.621008]  evtchn_2l_handle_events+0x160/0x280
>>> [  589.621913]  __xen_evtchn_do_upcall+0x66/0xb0
>>> [  589.622767]  __xen_pv_evtchn_do_upcall+0x11/0x20
>>> [  589.623665]  asm_call_irq_on_stack+0x12/0x20
>>> [  589.624511]  </IRQ>
>>> [  589.624978]  xen_pv_evtchn_do_upcall+0x77/0xf0
>>> [  589.625848]  exc_xen_hypervisor_callback+0x8/0x10
>>>
>>> This can be reproduced when creating/destroying guest in a loop. 
>>> Although, I have struggled to reproduce it on a vanilla Xen.
>>>
>>> After several hours of debugging, I think I have found the root cause.
>>>
>>> While we only expect the unmask to happen when the event channel is 
>>> EOIed, there is an unmask happening as part of handle_edge_irq() 
>>> because the interrupt was seen as pending by another vCPU 
>>> (IRQS_PENDING is set).
>>>
>>> It turns out that the event channel is set for multiple vCPU is in 
>>> cpu_evtchn_mask. This is happening because the affinity is not 
>>> cleared when freeing an event channel.
>>>
>>> The implementation of evtchn_2l_handle_events() will look for all the 
>>> active interrupts for the current vCPU and later on clear the pending 
>>> bit (via the ack() callback). IOW, I believe, this is not an atomic 
>>> operation.
>>>
>>> Even if Xen will notify the event to a single vCPU, 
>>> evtchn_pending_sel may still be set on the other vCPU (thanks to a 
>>> different event channel). Therefore, there is a chance that two vCPUs 
>>> will try to handle the same interrupt.
>>>
>>> The IRQ handler handle_edge_irq() is able to deal with that and will 
>>> mask/unmask the interrupt. This will mess us with the lateeoi logic 
>>> (although, I managed to reproduce it once without XSA-332).
>>
>> Thanks for the analysis!
>>
>>> My initial idea to fix the problem was to switch the affinity from 
>>> CPU X to CPU0 when the event channel is freed.
>>>
>>> However, I am not sure this is enough because I haven't found 
>>> anything yet preventing a race between evtchn_2l_handle_events9) and 
>>> evtchn_2l_bind_vcpu().
>>>
>>> So maybe we want to introduce a refcounting (if there is nothing 
>>> provided by the IRQ framework) and only unmask when the counter drop 
>>> to 0.
>>>
>>> Any opinions?
>>
>> I think we don't need a refcount, but just the internal states "masked"
>> and "eoi_pending" and unmask only if both are false. "masked" will be
>> set when the event is being masked. When delivering a lateeoi irq
>> "eoi_pending" will be set and "masked "reset. "masked" will be reset
>> when a normal unmask is happening. And "eoi_pending" will be reset
>> when a lateeoi is signaled. Any reset of "masked" and "eoi_pending"
>> will check the other flag and do an unmask if both are false.
>>
>> I'll write a patch.
> 
> Julien, could you please test the attached (only build tested) patch?

Thank you writing the patches. I will aim to give a spin next week.

Cheers,

-- 
Julien Grall

