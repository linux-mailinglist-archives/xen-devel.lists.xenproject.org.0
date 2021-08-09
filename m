Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B11873E4E05
	for <lists+xen-devel@lfdr.de>; Mon,  9 Aug 2021 22:39:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165214.301949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDC31-0007fC-7a; Mon, 09 Aug 2021 20:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165214.301949; Mon, 09 Aug 2021 20:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDC31-0007dJ-3V; Mon, 09 Aug 2021 20:38:59 +0000
Received: by outflank-mailman (input) for mailman id 165214;
 Mon, 09 Aug 2021 20:38:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mDC2z-0007dD-3d
 for xen-devel@lists.xenproject.org; Mon, 09 Aug 2021 20:38:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDC2x-0005QF-Vn; Mon, 09 Aug 2021 20:38:55 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDC2x-0005Qq-LE; Mon, 09 Aug 2021 20:38:55 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=9WnVbSbzJtUjbheYdp4cvCPVLArA8qsgxr5UasRIav4=; b=JsOuYau7Pkk2vtq1XVG64RSvD5
	UOxr8sIkITg2ibhliR5A0gH0IAsYH7cZmUDDdhg6VtYmAQAu4TsGKTqPX6vDR06Mf+pqUu41dbzUh
	8gO6i0LMYCYOSplMzTfVjZWkKWWdKrehCRNbreuvo00/MvFhionTUF0HVt2pC0PA4j60=;
Subject: Re: NULL scheduler DoS
From: Julien Grall <julien@xen.org>
To: "Ahmed, Daniele" <ahmeddan@amazon.co.uk>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Dario Faggioli <dfaggioli@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Grall, Julien" <jgrall@amazon.co.uk>, "Doebel, Bjoern" <doebel@amazon.de>,
 "Pohlack, Martin" <mpohlack@amazon.de>
References: <ED25BE5E-D695-4763-B97A-78D6040E2341@amazon.com>
 <8193a685-3ab1-9407-75f3-e335ea4406e4@xen.org>
Message-ID: <f3082b8c-1388-c92b-6175-e6d8b9d4cab4@xen.org>
Date: Mon, 9 Aug 2021 21:38:53 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <8193a685-3ab1-9407-75f3-e335ea4406e4@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 09/08/2021 18:35, Julien Grall wrote:
> 
> 
> On 09/08/2021 17:19, Ahmed, Daniele wrote:
>> Hi all,
> 
> Hi Daniele,
> 
> Thank you for the report!
> 
>> The NULL scheduler is affected by an issue that triggers an assertion 
>> and reboots the hypervisor.
>>
>> This issue arise when:
>>
>>   * a guest is being created with a configuration specifying a file that
>>     does not exist
>>   * the hypervisor boots with the null scheduler
>>
>> 4.16 is affected and 4.15 also.
>>
>> This is the stack trace from 4.16:
>>
>> (XEN) Assertion 'npc->unit == unit' failed at null.c:377
>> (XEN) ----[ Xen-4.16-unstable x86_64 debug=y Not tainted ]----
>> (XEN) CPU: 3
>> (XEN) RIP: e008:[<ffff82d04024f577>] 
>> common/sched/null.c#unit_deassign+0x1c3/0x2ec
>> (XEN) RFLAGS: 0000000000010006 CONTEXT: hypervisor
>> (XEN) rax: ffff83005ce1c850 rbx: 0000000000000001 rcx: 0000000000000001
>> (XEN) rdx: ffff83007fde6fc0 rsi: ffff83005ce1c790 rdi: ffff83007ffb7850
>> (XEN) rbp: ffff83007ffdfda0 rsp: ffff83007ffdfd48 r8: 0000000000000000
>> (XEN) r9: 0000000000048fee r10: 0000000000000000 r11: 0000000000000000
>> (XEN) r12: ffff82d0405c9298 r13: ffff83007f7fd508 r14: ffff83005ce1c850
>> (XEN) r15: ffff82d0405e2680 cr0: 000000008005003b cr4: 00000000003526e0
>> (XEN) cr3: 000000007f6b3000 cr2: ffff888072e79dc0
>> (XEN) fsb: 0000000000000000 gsb: ffff888071ac0000 gss: 0000000000000000
>> (XEN) ds: 002b es: 002b fs: 0000 gs: 0000 ss: e010 cs: e008
>> (XEN) Xen code around <ffff82d04024f577> 
>> (common/sched/null.c#unit_deassign+0x1c3/0x2ec):
>> (XEN) 41 5e 41 5f 5d c3 0f 0b <0f> 0b 0f 0b 0f 0b 0f 0b 49 8b 04 24 0f 
>> b7 00 66
>> (XEN) Xen stack trace from rsp=ffff83007ffdfd48:
>> (XEN) ffff83007ffdfd88 ffff82d04023961c 0000000400000000 ffff83005ce1cc50
>> (XEN) 0000000000000002 ffff83007ffdfd90 ffff83005ce1c790 ffff82d0405c9298
>> (XEN) ffff83007f7fd508 ffff83005ce1c850 ffff82d0405e2680 ffff83007ffdfde0
>> (XEN) ffff82d04024f889 ffff83007ffb7850 ffff83005dd63000 ffff83005ce1c790
>> (XEN) ffff83005845ab28 ffff83005845a000 0000000000000000 ffff83007ffdfe00
>> (XEN) ffff82d040253326 ffff83005dd63000 0000000000000000 ffff83007ffdfe38
>> (XEN) ffff82d04020506b ffff83007a881080 0000000000000000 0000000000000000
>> (XEN) 0000000000000000 ffff82d0405d6f80 ffff83007ffdfe70 ffff82d04022d9e5
>> (XEN) 0000001100000003 ffff82d0405cf100 ffff82d0405cf100 ffffffffffffffff
>> (XEN) ffff82d0405cef80 ffff83007ffdfea8 ffff82d04022e14b 0000000000000003
>> (XEN) ffff82d0405cf100 0000000000007fff 0000000000000003 0000000000000003
>> (XEN) ffff83007ffdfeb8 ffff82d04022e1e6 ffff83007ffdfef0 ffff82d0403172b4
>> (XEN) ffff82d04031721d ffff83007fec1000 ffff83007ffb6000 0000000000000003
>> (XEN) ffff83007ffcc000 ffff83007ffdfe18 0000000000000000 0000000000000000
>> (XEN) 0000000000000000 0000000000000000 0000000000000003 0000000000000003
>> (XEN) 0000000000000246 0000000000000003 0000000000000000 000000001bf9dde5
>> (XEN) 0000000000000000 ffffffff810023aa 0000000000000003 deadbeefdeadf00d
>> (XEN) deadbeefdeadf00d 0000010000000000 ffffffff810023aa 000000000000e033
>> (XEN) 0000000000000246 ffffc900400a3ea8 000000000000e02b 7ffdff707fffd140
>> (XEN) 000000017fe37a6c 000000007ffe8010 0000000000000000 0000e01000000003
>> (XEN) Xen call trace:
>> (XEN) [<ffff82d04024f577>] R 
>> common/sched/null.c#unit_deassign+0x1c3/0x2ec
>> (XEN) [<ffff82d04024f889>] F 
>> common/sched/null.c#null_unit_remove+0xfc/0x136
>> (XEN) [<ffff82d040253326>] F sched_destroy_vcpu+0xca/0x199
>> (XEN) [<ffff82d04020506b>] F 
>> common/domain.c#complete_domain_destroy+0x68/0x13f
>> (XEN) [<ffff82d04022d9e5>] F 
>> common/rcupdate.c#rcu_process_callbacks+0xdb/0x24b
>> (XEN) [<ffff82d04022e14b>] F common/softirq.c#__do_softirq+0x8a/0xbc
>> (XEN) [<ffff82d04022e1e6>] F do_softirq+0x13/0x15
>> (XEN) [<ffff82d0403172b4>] F arch/x86/domain.c#idle_loop+0x97/0xee
>> (XEN)
>> (XEN)
>> (XEN) ****************************************
>> (XEN) Panic on CPU 3:
>> (XEN) Assertion 'npc->unit == unit' failed at null.c:377
>> (XEN) ****************************************
>> (XEN)
>> (XEN) Reboot in five seconds...
>>
>> This is the line of the assertion that triggers the reboot: 
>> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/common/sched/null.c;h=82d5d1baab853d24fcbb455fb3f3e8263c871277;hb=HEAD#l377 
>> <https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/common/sched/null.c;h=82d5d1baab853d24fcbb455fb3f3e8263c871277;hb=HEAD#l377> 
>>
>>
>> To reproduce the vulnerability, I took the following steps:
> 
> Just to make clear for the others in the thread, per SUPPORT.MD, the 
> NULL scheduler is not security supported. Hence why this is sent to 
> xen-devel directly.
> 
> Also, for completeness, debug build are also not security supported. On 
> production build, the ASSERT() would be turned to a NOP which could 
> result to potentially more interesting issue. Anyway, that's not a 
> problem here. :)
> 
>>
>>   * Install XEN; only 4.15+ seem to be vulnerable
>>   * Use the null scheduler (depends on your setup): edit
>>     /etc/default/grub adding at the end of the file:
>>     GRUB_CMDLINE_XEN="sched=null" and update grub
>>   * Reboot into xen
>>   * Create a file guest.cfg with the following contents
>>
>> name="guest"
>> builder="hvm"
>> memory=512
>>
>> serial = [ 'file:/tmp/log', 'pty' ]
>>
>> disk = [ '/home/user/boot.iso,,hdc,cdrom' ]
>>
>> on_reboot = "destroy"
>>
>> vcpus=1
>>
>>
>> Make sure that the file //home/user/boot.iso/ does not exist
>>
>>   * Create a guest with this configuration: xl create -c guest.cfg
>>
>> CC’ing Dario, Stefano and Julien to whom I’ve shown this.
> 
> I am not quite too sure where the problem lies yet but adding some more 
> information of the debugging we discussed together.
> 
> The ASSERT() is triggered because the pCPU was already assigned to one 
> of the dom0 vCPU. This problem is happening regardless whether there is 
> free pCPU.
> 
> I have added some debugging in sched_set_res():
> 
> diff --git a/xen/common/sched/private.h b/xen/common/sched/private.h
> index a870320146ef..2355f531dc13 100644
> --- a/xen/common/sched/private.h
> +++ b/xen/common/sched/private.h
> @@ -150,6 +150,10 @@ static inline void sched_set_res(struct sched_unit 
> *unit,
>       unsigned int cpu = cpumask_first(res->cpus);
>       struct vcpu *v;
> 
> +    printk("%s: res->master_cpu %u unit %p %pd %pv\n", __func__,
> +           res->master_cpu, unit, unit->domain, unit->vcpu_list);
> +    WARN();
> +
>       for_each_sched_unit_vcpu ( unit, v )
>       {
>           ASSERT(cpu < nr_cpu_ids);
> 
> This traced the problem to null_unit_migrate():
> 
> 
> (XEN) sched_set_res: res->master_cpu 0 unit ffff830200887f00 d1 d1v0
> (XEN) Xen WARN at private.h:155
> (XEN) ----[ Xen-4.16-unstable  x86_64  debug=y  Tainted:   C   ]----
> (XEN) CPU:    1
> (XEN) RIP:    e008:[<ffff82d04023fd9f>] core.c#sched_set_res+0x5b/0xc6
> (XEN) RFLAGS: 0000000000010286   CONTEXT: hypervisor (d0v1)
> (XEN) rax: ffff83027bf55038   rbx: 0000000000000000   rcx: 0000000000000000
> (XEN) rdx: ffff83027bf4ffff   rsi: 000000000000000a   rdi: ffff82d0404944b8
> (XEN) rbp: ffff83027bf4fc70   rsp: ffff83027bf4fc40   r8:  0000000000000004
> (XEN) r9:  0000000000000030   r10: ffff83027bf4fcf8   r11: 00000000fffffffd
> (XEN) r12: ffff830275e83000   r13: ffff830275e8d000   r14: ffff830200887f00
> (XEN) r15: ffff83027bf850a0   cr0: 0000000080050033   cr4: 00000000003526e0
> (XEN) cr3: 00000001f1e3d000   cr2: 0000563f71516088
> (XEN) fsb: 00007f6561cda780   gsb: ffff88817fe80000   gss: 0000000000000000
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> (XEN) Xen code around <ffff82d04023fd9f> (core.c#sched_set_res+0x5b/0xc6):
> (XEN)  14 18 00 e8 e7 7f 00 00 <0f> 0b 4d 8b 66 08 4d 85 e4 75 28 4d 89 
> 7e 20 48
> (XEN) Xen stack trace from rsp=ffff83027bf4fc40:
> (XEN)    ffff83027bf85118 ffff830200887f00 ffff830275e83000 
> ffff830275e8d000
> (XEN)    0000000000000000 ffff83027bf552a0 ffff83027bf4fce0 
> ffff82d040241614
> (XEN)    ffff82d040226393 0000000000000286 ffff83027bf822e8 
> 0000000175e8d000
> (XEN)    ffff830200887f00 ffff83027bf552a0 ffff830275e83000 
> ffff83027bf4fcf8
> (XEN)    ffff830275e8d000 ffff830275e8d000 0000000000000001 
> 0000000000000000
> (XEN)    ffff83027bf4fd40 ffff82d04020527d ffff82d04020527d 
> 0000000000000000
> (XEN)    0000000000000000 ffff83027bf4fd30 0000000000000000 
> 0000000000000000
> (XEN)    ffff830275e8d000 00007f65620f6010 0000000000000001 
> ffff82d040238319
> (XEN)    ffff83027bf4fe58 ffff82d040238dd9 00000000001f1eae 
> 0000000000000004
> (XEN)    ffff83027bee4001 8000000000000000 ffff83027bf4fdc0 
> ffff82d04032e6df
> (XEN)    000000044032e6df 0000000000000000 ffff82e003e3e120 
> 000000140000000f
> (XEN)    00007f6561d90001 0000559a00000001 0000000000000014 
> 0000559ad9c303e0
> (XEN)    0000000000000008 0000559ad9c303e0 0000559ad9c31170 
> 0000559ad9c303c0
> (XEN)    0000000000000000 00007ffd4ed54b60 0000559ad9c309a0 
> 00007ffd4ed54c50
> (XEN)    0000000000000000 0000559ad9c38240 0000559ad9c32570 
> 00007ffd4ed54f00
> (XEN)    0000559ad9c31170 ffff83027bf4fef8 0000000000000000 
> 0000000000000001
> (XEN)    deadbeefdeadf00d ffff83027bec0000 ffff82d040238319 
> ffff83027bf4fee8
> (XEN)    ffff82d04030d8bc 00007f65620f6010 deadbeefdeadf00d 
> deadbeefdeadf00d
> (XEN)    deadbeefdeadf00d deadbeefdeadf00d ffff82d04038821c 
> ffff82d040388228
> (XEN)    ffff82d04038821c ffff82d040388228 ffff82d04038821c 
> ffff82d040388228
> (XEN) Xen call trace:
> (XEN)    [<ffff82d04023fd9f>] R core.c#sched_set_res+0x5b/0xc6
> (XEN)    [<ffff82d040241614>] F sched_init_vcpu+0x3dc/0x5d7
> (XEN)    [<ffff82d04020527d>] F vcpu_create+0xfb/0x37a
> (XEN)    [<ffff82d040238dd9>] F do_domctl+0xac0/0x184a
> (XEN)    [<ffff82d04030d8bc>] F pv_hypercall+0x10d/0x2b8
> (XEN)    [<ffff82d04038829d>] F lstar_enter+0x12d/0x140
> (XEN)
> 
> The end of the function contains an interesting comment:
> 
>      /*
>       * Whatever all the above, we always at least override v->processor.
>       * This is especially important for shutdown or suspend/resume paths,
>       * when it is important to let our caller (cpu_disable_scheduler())
>       * know that the migration did happen, to the best of our 
> possibilities,
>       * at least. In case of suspend, any temporary inconsistency caused
>       * by this, will be fixed-up during resume.
>       */
> 
> This implies that a pCPU may temporarily be assigned to two vCPUs and we 
> expect to be fixed up afterwards. However, a domain may be destroyed 
> before this is happening.
> 
> So it looks like that unit_deassign() is not able to cope with this 
> case. From a brief look, I think we may want to check if the pCPU is in 
> the wait list. If it is, then we should bail out.

Actually, I was wrong. It looks like null_unit_remove() is already 
checking this condition. Also, the vCPU should be offline (and the unit 
as well) because they haven't come online yet:

     /*
      * If a unit is (going) offline, we want it to be neither assigned
      * to a pCPU, nor in the waitqueue.
      *
      * If it was on a cpu, we've removed it from there above. If it is
      * in the waitqueue, we remove it from there now. And then we bail.
      */
     if ( unlikely(!is_unit_online(unit)) )
     {
         spin_lock(&prv->waitq_lock);
         list_del_init(&nvc->waitq_elem);
         spin_unlock(&prv->waitq_lock);
         goto out;
     }

[...]

  out:
     sched_set_res(unit, get_sched_res(new_cpu));

The jump to out looks suspicious because the comment on top says "We 
want it to be neither assigned to a pCPU, nor in the waitqueue". So 
maybe we should replace the goto out by a return?

Cheers,

-- 
Julien Grall

