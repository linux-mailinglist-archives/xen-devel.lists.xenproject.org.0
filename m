Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C761F144F
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 10:15:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiCux-0001Id-1U; Mon, 08 Jun 2020 08:14:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jiCuw-0001IU-1w
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 08:14:02 +0000
X-Inumbo-ID: 01c2cd78-a960-11ea-9b55-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01c2cd78-a960-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 08:14:00 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CCB6AB0BF;
 Mon,  8 Jun 2020 08:14:02 +0000 (UTC)
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
To: =?UTF-8?Q?=27Marek_Marczykowski-G=c3=b3recki=27?=
 <marmarek@invisiblethingslab.com>, paul@xen.org
References: <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
 <20200604142542.GC98582@mail-itl>
 <3b4dbb2f-7a0a-29a8-cca7-0cb641e8338d@suse.com>
 <000501d63b29$496ce6e0$dc46b4a0$@xen.org>
 <fe275c12-9bea-8733-dbdc-b225bf15fea3@suse.com>
 <002001d63b3e$7c268a40$74739ec0$@xen.org>
 <a418a2ea-f4ff-2b8e-eabf-2622099561f6@suse.com>
 <002e01d63b4f$914b3a90$b3e1afb0$@xen.org> <20200605161804.GJ98582@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d1bc0e70-c5a1-438a-e430-76b3d561564c@suse.com>
Date: Mon, 8 Jun 2020 10:13:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200605161804.GJ98582@mail-itl>
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

On 05.06.2020 18:18, 'Marek Marczykowski-Górecki' wrote:
> On Fri, Jun 05, 2020 at 04:39:56PM +0100, Paul Durrant wrote:
>>> From: Jan Beulich <jbeulich@suse.com>
>>> Sent: 05 June 2020 14:57
>>>
>>> On 05.06.2020 15:37, Paul Durrant wrote:
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Sent: 05 June 2020 14:32
>>>>>
>>>>> On 05.06.2020 13:05, Paul Durrant wrote:
>>>>>> That would mean we wouldn't be seeing the "Unexpected PIO" message. From that message this clearly
>>>>> X86EMUL_UNHANDLEABLE which suggests a race with ioreq server teardown, possibly due to selecting a
>>>>> server but then not finding a vcpu match in ioreq_vcpu_list.
>>>>>
>>>>> I was suspecting such, but at least the tearing down of all servers
>>>>> happens only from relinquish-resources, which gets started only
>>>>> after ->is_shut_down got set (unless the tool stack invoked
>>>>> XEN_DOMCTL_destroydomain without having observed XEN_DOMINF_shutdown
>>>>> set for the domain).
>>>>>
>>>>> For individually unregistered servers - yes, if qemu did so, this
>>>>> would be a problem. They need to remain registered until all vCPU-s
>>>>> in the domain got paused.
>>>>
>>>> It shouldn't be a problem should it? Destroying an individual server is only done with the domain
>>> paused, so no vcpus can be running at the time.
>>>
>>> Consider the case of one getting destroyed after it has already
>>> returned data, but the originating vCPU didn't consume that data
>>> yet. Once that vCPU gets unpaused, handle_hvm_io_completion()
>>> won't find the matching server anymore, and hence the chain
>>> hvm_wait_for_io() -> hvm_io_assist() ->
>>> vcpu_end_shutdown_deferral() would be skipped. handle_pio()
>>> would then still correctly consume the result.
>>
>> True, and skipping hvm_io_assist() means the vcpu internal ioreq state will be left set to IOREQ_READY and *that* explains why we would then exit hvmemul_do_io() with X86EMUL_UNHANDLEABLE (from the first switch).
> 
> I can confirm X86EMUL_UNHANDLEABLE indeed comes from the first switch in
> hvmemul_do_io(). And it happens shortly after ioreq server is destroyed:
> 
> (XEN) d12v0 XEN_DMOP_remote_shutdown domain 11 reason 0
> (XEN) d12v0 domain 11 domain_shutdown vcpu_id 0 defer_shutdown 1
> (XEN) d12v0 XEN_DMOP_remote_shutdown domain 11 done
> (XEN) d12v0 hvm_destroy_ioreq_server called for 11, id 0

Can either of you tell why this is? As said before, qemu shouldn't
start tearing down ioreq servers until the domain has made it out
of all shutdown deferrals, and all its vCPU-s have been paused.
For the moment I think the proposed changes, while necessary, will
mask another issue elsewhere. The @releaseDomain xenstore watch,
being the trigger I would consider relevant here, will trigger
only once XEN_DOMINF_shutdown is reported set for a domain, which
gets derived from d->is_shut_down (i.e. not mistakenly
d->is_shutting_down).

Jan

