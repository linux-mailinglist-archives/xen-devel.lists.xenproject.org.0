Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA342726DF
	for <lists+xen-devel@lfdr.de>; Mon, 21 Sep 2020 16:22:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKMiB-0007VH-4o; Mon, 21 Sep 2020 14:22:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wcPU=C6=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kKMi9-0007Uw-Vk
 for xen-devel@lists.xenproject.org; Mon, 21 Sep 2020 14:22:34 +0000
X-Inumbo-ID: 693903f9-a89a-453b-9192-c1194caaccac
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 693903f9-a89a-453b-9192-c1194caaccac;
 Mon, 21 Sep 2020 14:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=QlxVqa6UUCoJZyVMUo2GZn9EyOhBfJCfT8urn53tTnA=; b=nz+AX/McEePkWRyppnO07IqAZ2
 RiyfSLLTlB/A1dRLIKeP8i5o2xWuJRCFUKMPVxKfW9kb5QHJpsEQ4+TtD2wHi12VWLIeVxIJ8FpJm
 NbmalGPqRXRlmVJWgyCohalSFGruX2aM+a5l1k1kZk3KjNfl9RUpK6y8Cdc770GNXziE=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKMi6-0002sV-Ex; Mon, 21 Sep 2020 14:22:30 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kKMi6-0001wC-4q; Mon, 21 Sep 2020 14:22:30 +0000
Subject: Re: Memory ordering question in the shutdown deferral code
To: Jan Beulich <jbeulich@suse.com>, Tim Deegan <tim@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Paul Durrant
 <pdurrant@amazon.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <468576ba-8d3f-98e9-e65e-1128b5220d40@xen.org>
 <a75efed4-d435-1746-85ab-a87b328c1101@xen.org>
 <2d81cd52-b5a0-325a-9d0c-1ef92d68daf1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bd3ef1cb-48a5-b229-2ae4-98c6f62f4d65@xen.org>
Date: Mon, 21 Sep 2020 15:22:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <2d81cd52-b5a0-325a-9d0c-1ef92d68daf1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 21/09/2020 14:11, Jan Beulich wrote:
> On 21.09.2020 13:40, Julien Grall wrote:
>> (+ Xen-devel)
>>
>> Sorry I forgot to CC xen-devel.
>>
>> On 21/09/2020 12:38, Julien Grall wrote:
>>> Hi all,
>>>
>>> I have started to look at the deferral code (see
>>> vcpu_start_shutdown_deferral()) because we need it for LiveUpdate and
>>> Arm will soon use it.
>>>
>>> The current implementation is using an smp_mb() to ensure ordering
>>> between a write then a read. The code looks roughly (I have slightly
>>> adapted it to make my question more obvious):
>>>
>>> domain_shutdown()
>>>       d->is_shutting_down = 1;
>>>       smp_mb();
>>>       if ( !vcpu0->defer_shutdown )
>>>       {
>>>         vcpu_pause_nosync(v);
>>>         v->paused_for_shutdown = 1;
>>>       }
>>>
>>> vcpu_start_shutdown_deferral()
>>>       vcpu0->defer_shutdown = 1;
>>>       smp_mb();
>>>       if ( unlikely(d->is_shutting_down) )
>>>         vcpu_check_shutdown(v);
>>>
>>>       return vcpu0->defer_shutdown;
>>>
>>> smp_mb() should only guarantee ordering (this may be stronger on some
>>> arch), so I think there is a race between the two functions.
>>>
>>> It would be possible to pause the vCPU in domain_shutdown() because
>>> vcpu0->defer_shutdown wasn't yet seen.
>>>
>>> Equally, vcpu_start_shutdown_deferral() may not see d->is_shutting_down
>>> and therefore Xen may continue to send the I/O. Yet the vCPU will be
>>> paused so the I/O will never complete.
> 
> Individually for each of these I agree. But isn't the goal merely
> to prevent both to enter their if()-s' bodies at the same time?
> And isn't the combined effect of the two barriers preventing just
> this?

The code should already be able to deal with that as 
vcpu_check_shutdown() will request to hold d->shutdown_lock and then 
check v->paused_for_shutdown.

So I am not sure why the barriers would matter here.

> 
>>> I am not fully familiar with the IOREQ code, but it sounds to me this is
>>> not the behavior that was intended. Can someone more familiar with the
>>> code confirm it?
> 
> As to original intentions, I'm afraid among the people still
> listed as maintainers for any part of Xen it may only be Tim to
> possibly have been involved in the original installation of
> this model, and hence who may know of the precise intentions
> and considerations back at the time.

It would be useful to know the original intentions, so I have CCed Tim.

However, I think it is more important to agree on what we want to 
achieve so we can decide whether the existing code is suitable.

Do you agree that we only want to shutdown (or pause it at an 
architecturally restartable bounday) a domain with no I/Os inflights?

> 
> As far as I'm concerned, to be honest I don't think I've ever
> managed to fully convince myself of the correctness of the
> model in the general case. But since it did look good enough
> for x86 ...

Right, the memory model on x86 is quite simple compare to Arm :). I am 
pretty sure we need some sort of ordering, but I am not convinced we 
have the correct one in place if we want to cater architecture with more 
relaxed memory model.

Cheers,

-- 
Julien Grall

