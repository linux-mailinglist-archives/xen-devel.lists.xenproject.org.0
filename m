Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E2F1BFFAC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 17:08:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUAmg-0006VT-WC; Thu, 30 Apr 2020 15:07:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H9qc=6O=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jUAmf-0006VN-15
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 15:07:29 +0000
X-Inumbo-ID: 4e21efb2-8af4-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e21efb2-8af4-11ea-b07b-bc764e2007e4;
 Thu, 30 Apr 2020 15:07:28 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 63153AE96;
 Thu, 30 Apr 2020 15:07:26 +0000 (UTC)
Subject: Re: Cpu on/offlining crash with core scheduling
To: Sergey Dyasli <sergey.dyasli@citrix.com>
References: <1587995374653.73805@citrix.com>
 <103f3e30-a67e-77b7-9e92-572ee4b5d159@suse.com>
 <1588151726659.12791@citrix.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <55301f72-3ce0-9e17-649d-cecd34cb5739@suse.com>
Date: Thu, 30 Apr 2020 17:07:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588151726659.12791@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.20 11:15, Sergey Dyasli wrote:
> On 29/04/2020 09:09, Jürgen Groß wrote:
>> On 27.04.20 15:49, Sergey Dyasli wrote:
>>> Hi Juergen,
>>>
>>> When I'm testing vcpu pinning with something like:
>>>
>>>        # xl vcpu-pin 0 0 2
>>>        # xen-hptool cpu-offline 3
>>>
>>>        (offline / online CPUs {2,3} if the above is successful)
>>>
>>> I'm reliably seeing the following crash on the latest staging:
>>>
>>> (XEN) Watchdog timer detects that CPU1 is stuck!
>>> (XEN) ----[ Xen-4.14-unstable  x86_64  debug=y   Not tainted ]----
>>> (XEN) CPU:    1
>>> (XEN) RIP:    e008:[<ffff82d08025266d>] common/sched/core.c#sched_wait_rendezvous_in+0x16c/0x385
>>> (XEN) RFLAGS: 0000000000000002   CONTEXT: hypervisor
>>> (XEN) rax: 000000000000f001   rbx: ffff82d0805c9118   rcx: ffff83085e750301
>>> (XEN) rdx: 0000000000000001   rsi: ffff83086499b972   rdi: ffff83085e7503a6
>>> (XEN) rbp: ffff83085e7dfe28   rsp: ffff83085e7dfdd8   r8:  ffff830864985440
>>> (XEN) r9:  ffff83085e714068   r10: 0000000000000014   r11: 00000056b6a1aab2
>>> (XEN) r12: ffff83086499e490   r13: ffff82d0805f26e0   r14: ffff83085e7503a0
>>> (XEN) r15: 0000000000000001   cr0: 0000000080050033   cr4: 0000000000362660
>>> (XEN) cr3: 0000000823a8e000   cr2: 00006026000f6fc0
>>> (XEN) fsb: 0000000000000000   gsb: ffff888138dc0000   gss: 0000000000000000
>>> (XEN) ds: 002b   es: 002b   fs: 0000   gs: 0000   ss: e010   cs: e008
>>> (XEN) Xen code around <ffff82d08025266d> (common/sched/core.c#sched_wait_rendezvous_in+0x16c/0x385):
>>> (XEN)  4c 89 f7 e8 dc a5 fd ff <4b> 8b 44 fd 00 48 8b 04 18 4c 3b 70 10 0f 85 3f
>>> (XEN) Xen stack trace from rsp=ffff83085e7dfdd8:
>>> (XEN)    00000056b42128a6 ffff83086499ff30 ffff83086498a000 ffff83085e7dfe48
>>> (XEN)    0000000100000001 00000056b42128a6 ffff83086499e490 0000000000000000
>>> (XEN)    0000000000000001 0000000000000001 ffff83085e7dfe78 ffff82d080252ae8
>>> (XEN)    ffff83086498a000 0000000180230434 ffff83085e7503a0 ffff82d0805ceb00
>>> (XEN)    ffffffffffffffff ffff82d0805cea80 0000000000000000 ffff82d0805dea80
>>> (XEN)    ffff83085e7dfeb0 ffff82d08022c232 0000000000000001 ffff82d0805ceb00
>>> (XEN)    0000000000000001 0000000000000001 0000000000000001 ffff83085e7dfec0
>>> (XEN)    ffff82d08022c2cd ffff83085e7dfef0 ffff82d08031cae9 ffff83086498a000
>>> (XEN)    ffff83086498a000 0000000000000001 0000000000000001 ffff83085e7dfde8
>>> (XEN)    ffff88813021d700 ffff88813021d700 0000000000000000 0000000000000000
>>> (XEN)    0000000000000007 ffff88813021d700 0000000000000246 0000000000007ff0
>>> (XEN)    0000000000000000 000000000001ca00 0000000000000000 ffffffff810013aa
>>> (XEN)    ffffffff8203d210 deadbeefdeadf00d deadbeefdeadf00d 0000010000000000
>>> (XEN)    ffffffff810013aa 000000000000e033 0000000000000246 ffffc900400dfeb0
>>> (XEN)    000000000000e02b 0000000000000000 0000000000000000 0000000000000000
>>> (XEN)    0000000000000000 0000e01000000001 ffff83086498a000 00000037e43bd000
>>> (XEN)    0000000000362660 0000000000000000 8000000864980002 0000060100000000
>>> (XEN)    0000000000000000
>>> (XEN) Xen call trace:
>>> (XEN)    [<ffff82d08025266d>] R common/sched/core.c#sched_wait_rendezvous_in+0x16c/0x385
>>> (XEN)    [<ffff82d080252ae8>] F common/sched/core.c#sched_slave+0x262/0x31e
>>> (XEN)    [<ffff82d08022c232>] F common/softirq.c#__do_softirq+0x8a/0xbc
>>> (XEN)    [<ffff82d08022c2cd>] F do_softirq+0x13/0x15
>>> (XEN)    [<ffff82d08031cae9>] F arch/x86/domain.c#idle_loop+0x57/0xa7
>>> (XEN)
>>> (XEN) CPU0 @ e008:ffff82d08022c2b7 (process_pending_softirqs+0x53/0x56)
>>> (XEN) CPU4 @ e008:ffff82d08022bc40 (common/rcupdate.c#rcu_process_callbacks+0x22e/0x24b)
>>> (XEN) CPU2 @ e008:ffff82d08022c26f (process_pending_softirqs+0xb/0x56)
>>> (XEN) CPU7 @ e008:ffff82d08022bc40 (common/rcupdate.c#rcu_process_callbacks+0x22e/0x24b)
>>> (XEN) CPU3 @ e008:ffff82d08022bc40 (common/rcupdate.c#rcu_process_callbacks+0x22e/0x24b)
>>> (XEN) CPU5 @ e008:ffff82d08022cc34 (_spin_lock+0x4d/0x62)
>>> (XEN) CPU6 @ e008:ffff82d08022c264 (process_pending_softirqs+0/0x56)
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 1:
>>> (XEN) FATAL TRAP: vector = 2 (nmi)
>>> (XEN) [error_code=0000] , IN INTERRUPT CONTEXT
>>> (XEN) ****************************************
>>> (XEN)
>>> (XEN) Reboot in five seconds...
>>> (XEN) Executing kexec image on cpu1
>>> (XEN) Shot down all CPUs
>>>
>>>
>>> Is this something you can reproduce?
>>
>> Yes, I was able to hit this.
>>
>> Attached patch is fixing it for me. Could you give it a try?
> 
> The patch fixes the immediate issue:
> 
> 	Tested-by: Sergey Dyasli <sergey.dyasli@citrix.com>
> 	
> Thanks!
> 
> However, when running the following script:
> 
> 	while :; do xen-hptool cpu-offline 3; xen-hptool cpu-offline 2; xen-hptool cpu-online 3; xen-hptool cpu-online 2; sleep 0.1; done
> 	
> there was some weirdness with the utility on some invocations:
> 
> 	xen-hptool: symbol lookup error: /lib64/libxenctrl.so.4.14: undefined symbol: xc__hypercall_buffer_free
> 	Segmentation fault (core dumped)
> 	xen-hptool: symbol lookup error: /lib64/libxenctrl.so.4.14: undefined symbol: xc__hypercall_bounce_post
> 	xen-hptool: relocation error: /lib64/libxenctrl.so.4.14: symbol xencall_free_buffer, version VERS_1.0 not defined in file libxencall.so.1 with link time reference

Yes, I can reproduce those, too.

I made several tests and the result is really weird. Even if I do:

xen-hptool cpu-offline 3;       # removes the core from cpupool0
while true; do xen-hptool cpu-offline 2; xen-hptool cpu-online 2; done

I get the same errors after a while. This is really strange, as cpu 2
isn't taking part in any scheduling this way. So why is the running
program (on another cpu) impacted by on/offlining? And to me it looks
like the context of the program is clobbered sometimes. But how?

Patching the hypervisor to not add an onlined cpu to cpupool0 and doing
the same test with cpu scheduling didn't show the problem. The problem
was still there with core scheduling on the patched hypervisor. Even if
the online/offline paths are the same for both scheduling variants
(cpu or core) this way (as far as scheduler online/offline hooks are
concerned).

I suspected context loading or saving to have an issue, but even added
ASSERT()s didn't reveal anything (but I found some at least theoretical
problems, which I have a patch for, and a real bug in cpupool handling).

So I'll send out the patches I have until now and I'll continue trying
to catch this very strange problem. Any ideas what could be the reason
are very welcome. :-)


Juergen

