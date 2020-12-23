Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B172E1C1B
	for <lists+xen-devel@lfdr.de>; Wed, 23 Dec 2020 13:12:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58326.102443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks2zj-0007AP-C7; Wed, 23 Dec 2020 12:11:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58326.102443; Wed, 23 Dec 2020 12:11:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ks2zj-00079l-8i; Wed, 23 Dec 2020 12:11:55 +0000
Received: by outflank-mailman (input) for mailman id 58326;
 Wed, 23 Dec 2020 12:11:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ks2zh-00078v-DI
 for xen-devel@lists.xenproject.org; Wed, 23 Dec 2020 12:11:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks2zh-0005yT-09; Wed, 23 Dec 2020 12:11:53 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ks2zg-000808-I3; Wed, 23 Dec 2020 12:11:52 +0000
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
	bh=F6fSyM14HFpSsU75WnH6iy/6U807IzlHqi196s7yAv0=; b=DTU1mjfuD/nWu/HUv19zFxr5tx
	mSoy7JW6wZwaaOC1//V2VbelPTVWkmsK2PYuPsp+DvQ9zIZOHzKUNDsbTTeWipyK8+wBwFd7uB7lL
	SVggZHmkDQkQugerLknmNtJdTc4r/gHffAfThG6x7b0omZT4bQYjyGqidIRrbdLyreaE=;
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
Message-ID: <0a577a27-2d7d-4717-a959-1d6b3adc580c@xen.org>
Date: Wed, 23 Dec 2020 12:11:50 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
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

I can boot dom0 and a guest. However, if I destroy the guest and create 
a new one, I will get hundreds of WARN() similar to the one I originally 
reported and the guest wouldn't boot.

The same issue can now be reproduced on a vanilla Xen 4.15 and Linux 
5.10 (no change expect your patch). I haven't looked at the code but it 
looks like to me the interrupt state is getting de-synchronized when 
re-used.

I also got the below splat once, so I am not entirely sure if this is 
related:

[   86.134903] ------------[ cut here ]------------
[   86.135950] WARNING: CPU: 0 PID: 904 at linux/kernel/softirq.c:175 
__local_bh_enable_ip+0x9a/0xd0
[   86.138232] Modules linked in:
[   86.138937] CPU: 0 PID: 904 Comm: xenstored Not tainted 5.10.0+ #183
[   86.140162] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 
rel-1.14.0-0-g155821a1990b-prebuilt.qemu.org 04/01/2014
[   86.142221] RIP: e030:__local_bh_enable_ip+0x9a/0xd0
[   86.143204] Code: 00 ff ff 00 74 3e 65 ff 0d 63 fa f2 7e e8 0e 15 13 
00 e8 59 55 f4 ff 66 90 48 83 c4 08 5b c3 65 8b 05 46 0a f3 7e 85 c0 75 
99 <0f> 0b eb 95 48 89 3c 24 e8 93
[   86.146587] RSP: e02b:ffffc90040003ad0 EFLAGS: 00010246
[   86.147632] RAX: 0000000000000000 RBX: 0000000000000200 RCX: 
ffffe8ffffc05000
[   86.148986] RDX: 00000000000000f7 RSI: 0000000000000200 RDI: 
ffffffff81a4e9c3
[   86.150354] RBP: ffff8881003124b0 R08: 0000000000000001 R09: 
0000000000000000
[   86.151722] R10: 0000000000000000 R11: 0000000000000000 R12: 
ffff88810d150600
[   86.153078] R13: ffff88810d2b3f8e R14: ffff8881030b0000 R15: 
ffffc90040003c10
[   86.154422] FS:  00007f39a12f5240(0000) GS:ffff88817fe00000(0000) 
knlGS:0000000000000000
[   86.155958] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[   86.157063] CR2: 00007f0754002858 CR3: 000000010e13a000 CR4: 
0000000000050660
[   86.158409] Call Trace:
[   86.158959]  <IRQ>
[   86.159425]  ? __local_bh_disable_ip+0x4b/0x60
[   86.160329]  ipt_do_table+0x36f/0x660
[   86.161079]  ? lock_acquire+0x252/0x3a0
[   86.161846]  ? ip_local_deliver+0x70/0x200
[   86.162664]  nf_hook_slow+0x43/0xb0
[   86.163398]  ip_local_deliver+0x15b/0x200
[   86.164200]  ? ip_protocol_deliver_rcu+0x270/0x270
[   86.165146]  ip_rcv+0x13a/0x210
[   86.165794]  ? __lock_acquire+0x2e2/0x1a30
[   86.166610]  ? lock_is_held_type+0xe9/0x110
[   86.167477]  __netif_receive_skb_core+0x414/0xf60
[   86.168468]  ? find_held_lock+0x2d/0x90
[   86.169279]  ? __netif_receive_skb_list_core+0x134/0x2d0
[   86.170353]  __netif_receive_skb_list_core+0x134/0x2d0
[   86.171373]  netif_receive_skb_list_internal+0x1ef/0x3c0
[   86.172402]  ? e1000_clean_rx_irq+0x338/0x3d0
[   86.173285]  gro_normal_list.part.149+0x19/0x40
[   86.174171]  napi_complete_done+0xf3/0x1a0
[   86.175013]  e1000e_poll+0xc9/0x2b0
[   86.175738]  net_rx_action+0x176/0x4e0
[   86.176500]  __do_softirq+0xd4/0x432
[   86.177230]  irq_exit_rcu+0xbc/0xc0
[   86.177946]  asm_call_irq_on_stack+0xf/0x20
[   86.178780]  </IRQ>
[   86.179267]  xen_pv_evtchn_do_upcall+0x77/0xf0
[   86.180169]  exc_xen_hypervisor_callback+0x8/0x10
[   86.181098] RIP: e030:xen_hypercall_domctl+0xa/0x20
[   86.182055] Code: 51 41 53 b8 23 00 00 00 0f 05 41 5b 59 c3 cc cc cc 
cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc 51 41 53 b8 24 00 00 00 0f 
05 <41> 5b 59 c3 cc cc cc cc cc cc
[   86.185490] RSP: e02b:ffffc900407dbe18 EFLAGS: 00000282
[   86.186563] RAX: 0000000000000000 RBX: ffff888104f7b000 RCX: 
ffffffff8100248a
[   86.187973] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 
deadbeefdeadf00d
[   86.189381] RBP: ffffffffffffffff R08: 0000000000000000 R09: 
0000000000000000
[   86.190753] R10: 0000000000000000 R11: 0000000000000282 R12: 
0000000000305000
[   86.192113] R13: 00007ffdc8d6a5a0 R14: 0000000000000008 R15: 
0000000000000000
[   86.193473]  ? xen_hypercall_domctl+0xa/0x20
[   86.194324]  ? privcmd_ioctl+0x179/0xa80
[   86.195131]  ? common_file_perm+0x84/0x2c0
[   86.195956]  ? __x64_sys_ioctl+0x8e/0xd0
[   86.196744]  ? lockdep_hardirqs_on+0x4d/0xf0
[   86.197598]  ? do_syscall_64+0x33/0x80
[   86.198347]  ? entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   86.199402] irq event stamp: 39806070
[   86.200168] hardirqs last  enabled at (39806078): 
[<ffffffff8116c714>] console_unlock+0x4b4/0x5b0
[   86.201832] hardirqs last disabled at (39806085): 
[<ffffffff8116c670>] console_unlock+0x410/0x5b0
[   86.203508] softirqs last  enabled at (39685022): 
[<ffffffff81e0030f>] __do_softirq+0x30f/0x432
[   86.205140] softirqs last disabled at (39805575): 
[<ffffffff810e857c>] irq_exit_rcu+0xbc/0xc0
[   86.206739] ---[ end trace 178144c74d23e738 ]---

Cheers,

-- 
Julien Grall

