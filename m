Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33AC51D48E3
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 10:54:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZW6Q-0004AT-N3; Fri, 15 May 2020 08:53:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7E4v=65=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jZW6Q-0004AO-5f
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 08:53:58 +0000
X-Inumbo-ID: 9ca9fea4-9689-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9ca9fea4-9689-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 08:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dCL3VPVGAwr9hKH073torXgmQtJkFHHbqu4henwG2fY=; b=KcUZTjoLF7zm8Gpod5XXKlcvEj
 Hy4X94VA2bh0mZfe1Rl2JaU+/oXxdRtxGPXp2wQe5XlkhEI389kAUpOrMRipAsQ7GgWz4WRZIV+OR
 Syt82vgN4L4UrcKz39XwNQqOmRJfKlLfYd5j4Lr7hWGkvDmXnWGOQWh0tHNULALkqtAc=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jZW6O-0002U7-JA; Fri, 15 May 2020 08:53:56 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jZW6O-0006Km-78; Fri, 15 May 2020 08:53:56 +0000
Subject: Re: Error during update_runstate_area with KPTI activated
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <C6B0E24F-60E6-4621-8448-C8DBAE3277A9@arm.com>
 <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
 <2E95C767-FFE1-4A48-B56D-F858A8CEE5D7@arm.com>
 <ab4f3c2a-95aa-1256-f6f4-0c3057f5600c@xen.org>
 <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
 <CAJ=z9a1H2C6sWiScYw9XXLRcezBfUxYz2semj33D5GpB5=EE_w@mail.gmail.com>
 <478C4829-CCAF-495B-860E-6BA3D86AA47D@arm.com>
 <20200515083838.GN54375@Air-de-Roger>
From: Julien Grall <julien@xen.org>
Message-ID: <d2033adc-3f98-2d14-ae6d-f8dcd8b90002@xen.org>
Date: Fri, 15 May 2020 09:53:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515083838.GN54375@Air-de-Roger>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, nd <nd@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 15/05/2020 09:38, Roger Pau Monné wrote:
> On Fri, May 15, 2020 at 07:39:16AM +0000, Bertrand Marquis wrote:
>>
>>
>> On 14 May 2020, at 20:13, Julien Grall <julien.grall.oss@gmail.com<mailto:julien.grall.oss@gmail.com>> wrote:
>>
>> On Thu, 14 May 2020 at 19:12, Andrew Cooper <andrew.cooper3@citrix.com<mailto:andrew.cooper3@citrix.com>> wrote:
>>
>> On 14/05/2020 18:38, Julien Grall wrote:
>> Hi,
>>
>> On 14/05/2020 17:18, Bertrand Marquis wrote:
>>
>>
>> On 14 May 2020, at 16:57, Julien Grall <julien@xen.org<mailto:julien@xen.org>> wrote:
>>
>>
>>
>> On 14/05/2020 15:28, Bertrand Marquis wrote:
>> Hi,
>>
>> Hi,
>>
>> When executing linux on arm64 with KPTI activated (in Dom0 or in a
>> DomU), I have a lot of walk page table errors like this:
>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
>> 0xffffff837ebe0cd0
>> After implementing a call trace, I found that the problem was
>> coming from the update_runstate_area when linux has KPTI activated.
>> I have the following call trace:
>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
>> 0xffffff837ebe0cd0
>> (XEN) backtrace.c:29: Stacktrace start at 0x8007638efbb0 depth 10
>> (XEN)    [<000000000027780c>] get_page_from_gva+0x180/0x35c
>> (XEN)    [<00000000002700c8>] guestcopy.c#copy_guest+0x1b0/0x2e4
>> (XEN)    [<0000000000270228>] raw_copy_to_guest+0x2c/0x34
>> (XEN)    [<0000000000268dd0>] domain.c#update_runstate_area+0x90/0xc8
>> (XEN)    [<000000000026909c>] domain.c#schedule_tail+0x294/0x2d8
>> (XEN)    [<0000000000269524>] context_switch+0x58/0x70
>> (XEN)    [<00000000002479c4>] core.c#sched_context_switch+0x88/0x1e4
>> (XEN)    [<000000000024845c>] core.c#schedule+0x224/0x2ec
>> (XEN)    [<0000000000224018>] softirq.c#__do_softirq+0xe4/0x128
>> (XEN)    [<00000000002240d4>] do_softirq+0x14/0x1c
>> Discussing this subject with Stefano, he pointed me to a discussion
>> started a year ago on this subject here:
>> https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03053.html
>>
>> And a patch was submitted:
>> https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg02320.html
>>
>> I rebased this patch on current master and it is solving the
>> problem I have seen.
>> It sounds to me like a good solution to introduce a
>> VCPUOP_register_runstate_phys_memory_area to not depend on the area
>> actually being mapped in the guest when a context switch is being
>> done (which is actually the problem happening when a context switch
>> is trigger while a guest is running in EL0).
>> Is there any reason why this was not merged at the end ?
>>
>> I just skimmed through the thread to remind myself the state.
>> AFAICT, this is blocked on the contributor to clarify the intended
>> interaction and provide a new version.
>>
>> What do you mean here by intended interaction ? How the new hyper
>> call should be used by the guest OS ?
>>
>>  From what I remember, Jan was seeking clarification on whether the two
>> hypercalls (existing and new) can be called together by the same OS
>> (and make sense).
>>
>> There was also the question of the handover between two pieces of
>> sotfware. For instance, what if the firmware is using the existing
>> interface but the OS the new one? Similar question about Kexecing a
>> different kernel.
>>
>> This part is mostly documentation so we can discuss about the approach
>> and review the implementation.
>>
>>
>>
>> I am still in favor of the new hypercall (and still in my todo list)
>> but I haven't yet found time to revive the series.
>>
>> Would you be willing to take over the series? I would be happy to
>> bring you up to speed and provide review.
>>
>> Sure I can take it over.
>>
>> I ported it to master version of xen and I tested it on a board.
>> I still need to do a deep review of the code myself but I have an
>> understanding of the problem and what is the idea.
>>
>> Any help to get on speed would be more then welcome :-)
>> I would recommend to go through the latest version (v3) and the
>> previous (v2). I am also suggesting v2 because I think the split was
>> easier to review/understand.
>>
>> The x86 code is probably what is going to give you the most trouble as
>> there are two ABIs to support (compat and non-compat). If you don't
>> have an x86 setup, I should be able to test it/help write it.
>>
>> Feel free to ask any questions and I will try my best to remember the
>> discussion from last year :).
>>
>> At risk of being shouted down again, a new hypercall isn't necessarily
>> necessary, and there are probably better ways of fixing it.
>>
>> The underlying ABI problem is that the area is registered by virtual
>> address.  The only correct way this should have been done is to register
>> by guest physical address, so Xen's updating of the data doesn't
>> interact with the guest pagetable settings/restrictions.  x86 suffers
>> the same kind of problems as ARM, except we silently squash the fallout.
>>
>> The logic in Xen is horrible, and I would really rather it was deleted
>> completely, rather than to be kept for compatibility.
>>
>> The runstate area is always fixed kernel memory and doesn't move.  I
>> believe it is already restricted from crossing a page boundary, and we
>> can calculate the va=>pa translation when the hypercall is made.
>>
>> Yes - this is a technically ABI change, but nothing is going to break
>> (AFAICT) and the cleanup win is large enough to make this a *very*
>> attractive option.
>>
>> I suggested this approach two years ago [1] but you were the one
>> saying that buffer could cross page-boundary on older Linux [2]:
>>
>> "I'd love to do this, but we cant.  Older Linux used to have a virtual
>> buffer spanning a page boundary.  Changing the behaviour under that will
>> cause older setups to explode."
> 
> Sorry this was long time ago, and details have faded. IIRC there was
> even a proposal (or patch set) that took that into account and allowed
> buffers to span across a page boundary by taking a reference to two
> different pages in that case.

I am not aware of a patch set. Juergen suggested a per-domain mapping 
but there was no details how this could be done (my e-mail was left 
unanswered [1]).

If we were using the vmap() then we would need up 1MB per domain 
(assuming 128 vCPUs). This sounds quite a bit and I think we need to 
agree whether it would be an acceptable solution (this was also left 
unanswered [1]).

> 
> Another option would be to just return -EINVAL or -EOPNOTSUPP in that
> case and just get on with it. runstate info shouldn't be mandatory for
> guests to function properly, I would say it's just extra info that's
> provided in good faith from the hypervisor in order to help the guest
> make better scheduling decisions.

Linux will panic if the VCPUOP_register_runstate_memory_area returns an 
error (see xen_setup_runstate_info()).

> 
>> So can you explain your change of heart here?
>>
>>
>> I would prefer to fix it like this, (perhaps adding a new hypercall
>> which explicitly takes a guest physical address), than to keep any of
>> this mess around forever more to cope with legacy guests.
>>
>> What does legacy guests mean? Is it PV 32-bit or does it also include some HVM?
>>
>> Reading all this and digging into the code, the meaning full implementation would definitely be to validate and translate the address when during the hypercall handling and then to just reuse this address along the way.
>> Wether or not the guest is passing a virtual address (versus an intermediate physical) and creating a new hyper call for this might be a different question that we could handle separatly.
>> Does anyone see something wrong with such an approach ?
>>
>> Answer myself:
>> There might be the corner case where the physical area is actually can be removed from the guest (ie a guest using some memory coming from a temporary mapped area).
>> Would there be a way to check that during the hypercall ?
> 
> You have to take a reference to the page in order to prevent it from
> being freed under your fit. That way if the guest decides to balloon
> out the page you would prevent it from being freed by having taken
> that reference.
> 
> Roger.
> 

Cheers,

[1] <fb92072f-2709-fa5a-0284-08a66c401049@arm.com>

-- 
Julien Grall

