Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B41791D38F3
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 20:13:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZILa-0008Gz-4w; Thu, 14 May 2020 18:12:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EaOj=64=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jZILZ-0008Gu-Eo
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 18:12:41 +0000
X-Inumbo-ID: 7ed33c5e-960e-11ea-a4c6-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7ed33c5e-960e-11ea-a4c6-12813bfff9fa;
 Thu, 14 May 2020 18:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589479959;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=8kiKORUliEJku6HCbrVqvII9eSEw4dm3sqPW/9+DRIE=;
 b=PfvjLbR0cU4B8OWE6m9/YAJVvdt5xnqpDfZsci8BPTWIzZl41/2n7+Of
 IQuiAW1OVjIpndHrcKxltXYo7QrhJmV0gn802wYOWnX9PGJWwg0KAGn/o
 p6ucz8i7JY/lfqPulmt5uqkt4gAzqK6TrJBa921FNmSCZjg2NLWmF29pr o=;
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: OzDCrIAqu8njRCpyCcPoN5oI9Ycl8X1VUBhSYKt346IPk7Me5S5oUgiPXrLj1/EzuRH+KcMehL
 zTfxopVOWx8of32F+m/jBluLLNAVeOMtNVSXqsF18QVBTFw4gAoy9w0CzLSPzxJR+gynjvB55j
 we2k68LnirZOhGYmdTYEWSz3tKejTBKV9qHPhFOOS3nXEJjBCo5SpdWCXMtb368wJLVThShn5L
 16HQoBgGUX+5cK6exY297BQQEglOPjwQwqO50VESBVTNHLq1QCso2rRZ1PCzQbtj5CEgfNxfLe
 vC4=
X-SBRS: 2.7
X-MesageID: 18256411
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,392,1583211600"; d="scan'208";a="18256411"
Subject: Re: Error during update_runstate_area with KPTI activated
To: Julien Grall <julien@xen.org>, Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <C6B0E24F-60E6-4621-8448-C8DBAE3277A9@arm.com>
 <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
 <2E95C767-FFE1-4A48-B56D-F858A8CEE5D7@arm.com>
 <ab4f3c2a-95aa-1256-f6f4-0c3057f5600c@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
Date: Thu, 14 May 2020 19:12:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ab4f3c2a-95aa-1256-f6f4-0c3057f5600c@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>, Stefano
 Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 14/05/2020 18:38, Julien Grall wrote:
> Hi,
>
> On 14/05/2020 17:18, Bertrand Marquis wrote:
>>
>>
>>> On 14 May 2020, at 16:57, Julien Grall <julien@xen.org> wrote:
>>>
>>>
>>>
>>> On 14/05/2020 15:28, Bertrand Marquis wrote:
>>>> Hi,
>>>
>>> Hi,
>>>
>>>> When executing linux on arm64 with KPTI activated (in Dom0 or in a
>>>> DomU), I have a lot of walk page table errors like this:
>>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
>>>> 0xffffff837ebe0cd0
>>>> After implementing a call trace, I found that the problem was
>>>> coming from the update_runstate_area when linux has KPTI activated.
>>>> I have the following call trace:
>>>> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
>>>> 0xffffff837ebe0cd0
>>>> (XEN) backtrace.c:29: Stacktrace start at 0x8007638efbb0 depth 10
>>>> (XEN)    [<000000000027780c>] get_page_from_gva+0x180/0x35c
>>>> (XEN)    [<00000000002700c8>] guestcopy.c#copy_guest+0x1b0/0x2e4
>>>> (XEN)    [<0000000000270228>] raw_copy_to_guest+0x2c/0x34
>>>> (XEN)    [<0000000000268dd0>] domain.c#update_runstate_area+0x90/0xc8
>>>> (XEN)    [<000000000026909c>] domain.c#schedule_tail+0x294/0x2d8
>>>> (XEN)    [<0000000000269524>] context_switch+0x58/0x70
>>>> (XEN)    [<00000000002479c4>] core.c#sched_context_switch+0x88/0x1e4
>>>> (XEN)    [<000000000024845c>] core.c#schedule+0x224/0x2ec
>>>> (XEN)    [<0000000000224018>] softirq.c#__do_softirq+0xe4/0x128
>>>> (XEN)    [<00000000002240d4>] do_softirq+0x14/0x1c
>>>> Discussing this subject with Stefano, he pointed me to a discussion
>>>> started a year ago on this subject here:
>>>> https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03053.html
>>>>
>>>> And a patch was submitted:
>>>> https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg02320.html
>>>>
>>>> I rebased this patch on current master and it is solving the
>>>> problem I have seen.
>>>> It sounds to me like a good solution to introduce a
>>>> VCPUOP_register_runstate_phys_memory_area to not depend on the area
>>>> actually being mapped in the guest when a context switch is being
>>>> done (which is actually the problem happening when a context switch
>>>> is trigger while a guest is running in EL0).
>>>> Is there any reason why this was not merged at the end ?
>>>
>>> I just skimmed through the thread to remind myself the state.
>>> AFAICT, this is blocked on the contributor to clarify the intended
>>> interaction and provide a new version.
>>
>> What do you mean here by intended interaction ? How the new hyper
>> call should be used by the guest OS ?
>
> From what I remember, Jan was seeking clarification on whether the two
> hypercalls (existing and new) can be called together by the same OS
> (and make sense).
>
> There was also the question of the handover between two pieces of
> sotfware. For instance, what if the firmware is using the existing
> interface but the OS the new one? Similar question about Kexecing a
> different kernel.
>
> This part is mostly documentation so we can discuss about the approach
> and review the implementation.
>
>>
>>>
>>> I am still in favor of the new hypercall (and still in my todo list)
>>> but I haven't yet found time to revive the series.
>>>
>>> Would you be willing to take over the series? I would be happy to
>>> bring you up to speed and provide review.
>>
>> Sure I can take it over.
>>
>> I ported it to master version of xen and I tested it on a board.
>> I still need to do a deep review of the code myself but I have an
>> understanding of the problem and what is the idea.
>>
>> Any help to get on speed would be more then welcome :-)
> I would recommend to go through the latest version (v3) and the
> previous (v2). I am also suggesting v2 because I think the split was
> easier to review/understand.
>
> The x86 code is probably what is going to give you the most trouble as
> there are two ABIs to support (compat and non-compat). If you don't
> have an x86 setup, I should be able to test it/help write it.
>
> Feel free to ask any questions and I will try my best to remember the
> discussion from last year :).

At risk of being shouted down again, a new hypercall isn't necessarily
necessary, and there are probably better ways of fixing it.

The underlying ABI problem is that the area is registered by virtual
address.  The only correct way this should have been done is to register
by guest physical address, so Xen's updating of the data doesn't
interact with the guest pagetable settings/restrictions.  x86 suffers
the same kind of problems as ARM, except we silently squash the fallout.

The logic in Xen is horrible, and I would really rather it was deleted
completely, rather than to be kept for compatibility.

The runstate area is always fixed kernel memory and doesn't move.  I
believe it is already restricted from crossing a page boundary, and we
can calculate the va=>pa translation when the hypercall is made.

Yes - this is a technically ABI change, but nothing is going to break
(AFAICT) and the cleanup win is large enough to make this a *very*
attractive option.

I would prefer to fix it like this, (perhaps adding a new hypercall
which explicitly takes a guest physical address), than to keep any of
this mess around forever more to cope with legacy guests.

It is definitely an option which should be considered.

~Andrew

