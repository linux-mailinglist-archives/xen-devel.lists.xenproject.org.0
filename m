Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DDC1A347A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Apr 2020 15:00:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jMWnP-0005PT-Qz; Thu, 09 Apr 2020 13:00:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EhrS=5Z=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jMWnO-0005PO-PW
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2020 13:00:38 +0000
X-Inumbo-ID: 1bd40466-7a62-11ea-82bb-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1bd40466-7a62-11ea-82bb-12813bfff9fa;
 Thu, 09 Apr 2020 13:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yZzXbob8CmPmLLKUYerA6jZ4V2JVSnNCJdv+dslrjlk=; b=p+uHpaa4GyrOba5sZSbIRDu6t4
 HGcTSdfsuc5fJgYGT9m8z7MX5D/bVVOi9Cuukk/myQy5IfAlTb4HhaTXH42w0M8Ulvpuldwz4K9rt
 eO8G/t223s0uqRDZbmgg2Co/0JonoTQ97u5N9dGs64uv1xQIWDdMDzl6Emsgc6j6N5hY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMWnI-0005SH-VN; Thu, 09 Apr 2020 13:00:32 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jMWnI-0007Iw-Ky; Thu, 09 Apr 2020 13:00:32 +0000
Subject: Re: [PATCH v2] xen/arm: implement GICD_I[S/C]ACTIVER reads
From: Julien Grall <julien@xen.org>
To: Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20200327023451.20271-1-sstabellini@kernel.org>
 <38f56c3e-8f7d-7aee-8216-73398f4543bb@xen.org>
 <alpine.DEB.2.21.2003300932430.4572@sstabellini-ThinkPad-T480s>
 <5deb3992-3cf5-2b00-8cef-af75ed83a1fd@xen.org>
 <alpine.DEB.2.21.2003311121120.4572@sstabellini-ThinkPad-T480s>
 <2bb21703-8078-cd92-0463-bea049413f32@xen.org>
 <alpine.DEB.2.21.2004010747530.10657@sstabellini-ThinkPad-T480s>
 <d457455f-a1ad-1964-ff15-45d794f1822a@xen.org>
 <alpine.DEB.2.21.2004031234010.23034@sstabellini-ThinkPad-T480s>
 <CAJ=z9a2LdC-nSMUEjLhGp_4PAkcRkp4wJKXiAy0ftt34T8LAVg@mail.gmail.com>
 <D048CA76-8C9F-4F44-B05C-D834A6D0D37D@citrix.com>
 <9de763c9-19f2-2163-d5db-95176dbce3cc@xen.org>
 <082584BF-3837-48A7-A0C2-9582BA3379C0@citrix.com>
 <a29cb044-7e78-a47b-f842-327373e0ec9f@xen.org>
 <4FBF62BA-5844-4506-8C01-FE1A6F4A7ED2@citrix.com>
 <057f48b7-84be-0bc5-773d-d01a79181b20@xen.org>
 <alpine.DEB.2.21.2004081642070.28673@sstabellini-ThinkPad-T480s>
 <914c421a-02cf-375b-a3fa-1c5e934cdeb3@xen.org>
Message-ID: <3b002deb-5a80-3dc4-9462-649135cfbd29@xen.org>
Date: Thu, 9 Apr 2020 14:00:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <914c421a-02cf-375b-a3fa-1c5e934cdeb3@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "maz@kernel.org" <maz@kernel.org>, George Dunlap <George.Dunlap@citrix.com>,
 Wei Xu <xuwei5@hisilicon.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 09/04/2020 13:56, Julien Grall wrote:
> 
> 
> On 09/04/2020 02:26, Stefano Stabellini wrote:
>> On Tue, 7 Apr 2020, Julien Grall wrote:
>>>>>> I don’t know what maintenance IRQs are, but if they only happen
>>>>>> intermittently, it’s possible that you’d never get more than a single
>>>>>> one in a latency-critical IRQ routine; and as such, the 
>>>>>> variatibility in
>>>>>> execution time (jitter) wouldn’t be an issue in practice.  But every
>>>>>> time you add a new unblockable IPI, you increase this jitter;
>>>>>> particularly if this unblockable IPI might be repeated an arbitrary
>>>>>> number of times.
>>>>>> (Stefano, let me know if I’ve misunderstood something.)
>>>>>> So stepping back a moment, here’s all the possible ideas that I think
>>>>>> have been discussed (or are there implicitly) so far.
>>>>>> 1. [Default] Do nothing; guests using this register continue crashing
>>>>>> 2. Make the I?ACTIVER registers RZWI.
>>>>>> 3. Make I?ACTIVER return the most recent known value; i.e. KVM’s 
>>>>>> current
>>>>>> behavior (as far as we understand it)
>>>>>> 4. Use a simple IPI with do_noop to update I?ACTIVER
>>>>>> 4a.  Use an IPI, but come up with clever tricks to avoid interrupting
>>>>>> guests handling IRQs.
>>>>>> 5. Trap to Xen on guest EOI, so that we know when the
>>>>>> 6. Some clever paravirtualized option
>>>>>
>>>>> 7. Use an IPI if we are confident the interrupts may be active.
>>>>
>>>> I don’t understand this one.  How is it different than 4 or 4a?  And in
>>>> particular, how does it evaluate on the “how much additional design 
>>>> work
>>>> would it take” criteria?
>>>
>>> Let me start with, if we want to have a vGIC to rule them all, then I am
>>> afraid you are going to have to compromise. We can discuss about 
>>> tailoring the
>>> vGIC but I think before that we need a vGIC that is faithfull with 
>>> the spec
>>> (e.g differentiating level vs edge interrupts, handling activer...). 
>>> Note that
>>> Arm spent some effort to get a new vGIC merged but this was never 
>>> made a first
>>> class citizen.
>>>
>>> However, even if you tailor the vGIC, you are not going to be able to 
>>> avoid
>>> IPI in some occasions. This would happen when using event channels, 
>>> in-guest
>>> IPI... Another example is when enabling an interrupt, although I 
>>> realize that
>>> our vGIC does not do it today meaning that a pending interrupt while 
>>> disabled
>>> will not be forwarded until the vCPU exit.
>>>
>>> Furthermore, implementing a write to I{C,S}ACTIVER (to 
>>> activate/de-activate)
>>> is going to be very difficult (to not say impossible) to do without IPI.
>>>
>>> If you are worry about a vCPU been interrupted in critical section, 
>>> then I
>>> think you should tailor your guest to avoid using those registers.
>>
>> Let's call it option 8 "tell the user that she needs to modify her
>> kernel."
>>
>>
>>> An alternative would be to use spinlock/mutex within the code to 
>>> prevent a
>>> VCPU to access the vGIC registers while another vCPU don't want to be
>>> interrupted.
>>>
>>> Regarding, 4a. The only way I could think of would be to trap the 
>>> instructions
>>> that mask/unmask interrupts. If I read correctly the Armv8 spec, it 
>>> is not
>>> possible to do it.
>>>
>>> 7. is basically 4.a the goal would be to avoid interrupts the vCPU 
>>> has much as
>>> possible but you may be wrong sometimes. Obviously we want to be 
>>> correct most
>>> of the times.
>>>
>>> I understand this may not be the ideal solution, but this is probably 
>>> the best
>>> we could come with and does not involve a lot of work because we have 
>>> already
>>> all the information in place (we know when an interrupt was injected 
>>> to a
>>> vCPU).
>>>
>>> The next best solution is to prevent in your guest to modify some 
>>> registers of
>>> the vGIC at the same time as another vCPU is in a critical section.
>>
>> Let's call this option 9.
>>
>>
>> I am just thinking out loud here :)
> 
> Thank you for thinking out loud. Sadly, as I pointed out before, there 
> are other part of the vGIC facing the same problems (e.g I{S,C}ENABLER, 
> sending SGIs, sending event channels).
> 
> So can you enlighten me why I{S,C}ENABLER is that much a concern over 
> the other?

To be clear, I am not saying I{S,C}ENABLER should not be a concern. But 
I would prefer if we focus on a generic solution if the problem is wider.

Cheers,

-- 
Julien Grall

