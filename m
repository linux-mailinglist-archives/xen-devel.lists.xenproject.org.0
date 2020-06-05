Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD531EF9B5
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 15:57:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhCqb-0005rg-1Y; Fri, 05 Jun 2020 13:57:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=thT7=7S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jhCqZ-0005rb-4k
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 13:57:23 +0000
X-Inumbo-ID: 79d43866-a734-11ea-9ad7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 79d43866-a734-11ea-9ad7-bc764e2007e4;
 Fri, 05 Jun 2020 13:57:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1569CAC51;
 Fri,  5 Jun 2020 13:57:24 +0000 (UTC)
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
To: paul@xen.org, =?UTF-8?Q?=27Marek_Marczykowski-G=c3=b3recki=27?=
 <marmarek@invisiblethingslab.com>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <000501d63b29$496ce6e0$dc46b4a0$@xen.org>
 <fe275c12-9bea-8733-dbdc-b225bf15fea3@suse.com>
 <002001d63b3e$7c268a40$74739ec0$@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a418a2ea-f4ff-2b8e-eabf-2622099561f6@suse.com>
Date: Fri, 5 Jun 2020 15:57:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <002001d63b3e$7c268a40$74739ec0$@xen.org>
Content-Type: text/plain; charset=utf-8
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'xen-devel' <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 05.06.2020 15:37, Paul Durrant wrote:
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: 05 June 2020 14:32
>> To: paul@xen.org
>> Cc: 'Marek Marczykowski-Górecki' <marmarek@invisiblethingslab.com>; 'Andrew Cooper'
>> <andrew.cooper3@citrix.com>; 'xen-devel' <xen-devel@lists.xenproject.org>
>> Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in stubdom
>>
>> On 05.06.2020 13:05, Paul Durrant wrote:
>>> Sorry, only just catching up with this...
>>>
>>>> -----Original Message-----
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: 05 June 2020 10:09
>>>> To: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>; xen-devel <xen-devel@lists.xenproject.org>; Paul
>>>> Durrant <paul@xen.org>
>>>> Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in stubdom
>>>>
>>>> On 04.06.2020 16:25, Marek Marczykowski-Górecki wrote:
>>>>> On Thu, Jun 04, 2020 at 02:36:26PM +0200, Jan Beulich wrote:
>>>>>> On 04.06.2020 13:13, Andrew Cooper wrote:
>>>>>>> On 04/06/2020 08:08, Jan Beulich wrote:
>>>>>>>> On 04.06.2020 03:46, Marek Marczykowski-Górecki wrote:
>>>>>>>>> Then, we get the main issue:
>>>>>>>>>
>>>>>>>>>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>>>>>>>>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
>>>>>>>>>     (XEN) domain_crash called from io.c:178
>>>>>>>>>
>>>>>>>>> Note, there was no XEN_DOMCTL_destroydomain for domain 3 nor its stubdom
>>>>>>>>> yet. But XEN_DMOP_remote_shutdown for domain 3 was called already.
>>>>>>>> I'd guess an issue with the shutdown deferral logic. Did you / can
>>>>>>>> you check whether XEN_DMOP_remote_shutdown managed to pause all
>>>>>>>> CPUs (I assume it didn't, since once they're paused there shouldn't
>>>>>>>> be any I/O there anymore, and hence no I/O emulation)?
>>>>>>>
>>>>>>> The vcpu in question is talking to Qemu, so will have v->defer_shutdown
>>>>>>> intermittently set, and skip the pause in domain_shutdown()
>>>>>>>
>>>>>>> I presume this lack of pause is to allow the vcpu in question to still
>>>>>>> be scheduled to consume the IOREQ reply?  (Its fairly opaque logic with
>>>>>>> 0 clarifying details).
>>>>>>>
>>>>>>> What *should* happen is that, after consuming the reply, the vcpu should
>>>>>>> notice and pause itself, at which point it would yield to the
>>>>>>> scheduler.  This is the purpose of vcpu_{start,end}_shutdown_deferral().
>>>>>>>
>>>>>>> Evidentially, this is not happening.
>>>>>>
>>>>>> We can't tell yet, until ...
>>>>>>
>>>>>>> Marek: can you add a BUG() after the weird PIO printing?  That should
>>>>>>> confirm whether we're getting into handle_pio() via the
>>>>>>> handle_hvm_io_completion() path, or via the vmexit path (at which case,
>>>>>>> we're fully re-entering the guest).
>>>>>>
>>>>>> ... we know this. handle_pio() gets called from handle_hvm_io_completion()
>>>>>> after having called hvm_wait_for_io() -> hvm_io_assist() ->
>>>>>> vcpu_end_shutdown_deferral(), so the issue may be that we shouldn't call
>>>>>> handle_pio() (etc) at all anymore in this state. IOW perhaps
>>>>>> hvm_wait_for_io() should return "!sv->vcpu->domain->is_shutting_down"
>>>>>> instead of plain "true"?
>>>>>>
>>>>>> Adding Paul to Cc, as being the maintainer here.
>>>>>
>>>>> Got it, by sticking BUG() just before that domain_crash() in
>>>>> handle_pio(). And also vcpu 0 of both HVM domains do have
>>>>> v->defer_shutdown.
>>>>
>>>> As per the log they did get it set. I'd be curious of the flag's
>>>> value (as well as v->paused_for_shutdown's) at the point of the
>>>> problematic handle_pio() invocation (see below). It may be
>>>> worthwhile to instrument vcpu_check_shutdown() (inside its if())
>>>> - before exiting to guest context (in order to then come back
>>>> and call handle_pio()) the vCPU ought to be getting through
>>>> there. No indication of it doing so would be a sign that there's
>>>> a code path bypassing the call to vcpu_end_shutdown_deferral().
>>>>
>>>>> (XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
>>>>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>>>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>>>> (XEN) d3v0 handle_pio port 0xb004 write 0x0001
>>>>> (XEN) d3v0 handle_pio port 0xb004 write 0x2001
>>>>> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
>>>>> (XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
>>>>> (XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
>>>>> (XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
>>>>> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
>>>>> (XEN) d1v0 handle_pio port 0xb004 read 0x0000
>>>>> (XEN) d1v0 handle_pio port 0xb004 write 0x0001
>>>>> (XEN) d1v0 handle_pio port 0xb004 write 0x2001
>>>>> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
>>>>> (XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
>>>>> (XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
>>>>> (XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags 0x2 d6
>>>>> (XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags 0x2 d6
>>>>> (XEN) d3v0 handle_pio port 0xb004 read 0x0000
>>>>
>>>> Perhaps in this message could you also log
>>>> v->domain->is_shutting_down, v->defer_shutdown, and
>>>> v->paused_for_shutdown? (Would be nice if, after having made
>>>> changes to your debugging patch, you could point again at the
>>>> precise version you've used for the log provided.)
>>>>
>>>>> (XEN) d3v0 Unexpected PIO status 1, port 0xb004 read 0xffff
>>>>> (XEN) Xen BUG at io.c:178
>>>>
>>>> Btw, instead of BUG(), WARN() or dump_execution_state() would
>>>> likely also do, keeping Xen alive.
>>>>
>>>
>>> A shutdown deferral problem would result in X86EMUL_RETRY wouldn't it?
>>
>> Where would this originate?
> 
> I was referring to the 'if ( unlikely(!vcpu_start_shutdown_deferral(curr)) )' at the top of hvm_send_ioreq().

Ah yes. But this is just one way of things possibly going wrong. Plus
the function will return true when ->defer_shutdown is already or
(wrongly) still set.

>>> That would mean we wouldn't be seeing the "Unexpected PIO" message. From that message this clearly
>> X86EMUL_UNHANDLEABLE which suggests a race with ioreq server teardown, possibly due to selecting a
>> server but then not finding a vcpu match in ioreq_vcpu_list.
>>
>> I was suspecting such, but at least the tearing down of all servers
>> happens only from relinquish-resources, which gets started only
>> after ->is_shut_down got set (unless the tool stack invoked
>> XEN_DOMCTL_destroydomain without having observed XEN_DOMINF_shutdown
>> set for the domain).
>>
>> For individually unregistered servers - yes, if qemu did so, this
>> would be a problem. They need to remain registered until all vCPU-s
>> in the domain got paused.
> 
> It shouldn't be a problem should it? Destroying an individual server is only done with the domain paused, so no vcpus can be running at the time.

Consider the case of one getting destroyed after it has already
returned data, but the originating vCPU didn't consume that data
yet. Once that vCPU gets unpaused, handle_hvm_io_completion()
won't find the matching server anymore, and hence the chain
hvm_wait_for_io() -> hvm_io_assist() ->
vcpu_end_shutdown_deferral() would be skipped. handle_pio()
would then still correctly consume the result.

Marek - to verify this doesn't happen (sorry, my qemu knowledge
is rather limited, and hence I don't know whether this can
happen at all), could you also log hvm_destroy_ioreq_server()
invocations?

Jan

